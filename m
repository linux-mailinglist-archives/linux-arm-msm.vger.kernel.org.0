Return-Path: <linux-arm-msm+bounces-77036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C973BD3E19
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 17:07:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1793C40489B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 14:49:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CF01309EEA;
	Mon, 13 Oct 2025 14:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KOdC+aq/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95047309DB4
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 14:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760366795; cv=none; b=kX48sYdjE15EcUbPd3cdT2Kta0P2XSky6Foja2fWKVSGbGg6xJlBtNw55N3dO77kqoTc4ktkUkU2LWSKgPziYKYYtQamabP2AMG5kmx9LD3ZimRVk/uV50QpYlnROQCCEkicetTW+kfjT0zCRawJL616hH5MOl5gOl1tR+Un/f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760366795; c=relaxed/simple;
	bh=Baafv0dkbATo2Vjt7gb2iGQKBDq/hh7OJ4ohJRpLxVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tVWVsye26u2BmJGWIgy8bJOKChVq/xuX/XusyA2FpEUDL9S2YMDvy9SWEIqCsWh1IuZW1J13q2zE1e5fQknXdyeEoVCcFwRROlUnXDaCxi32tgmrb+UAoYF/NJTjP6/jM5S84c4HXLv4rVTpu2mCKQVSZn8fgSDKFLMZKa/TtU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KOdC+aq/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DAtfCj028880
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 14:46:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Baafv0dkbATo2Vjt7gb2iGQKBDq/hh7OJ4ohJRpLxVE=; b=KOdC+aq/Nmh8Alt3
	hMaeHSfF3b7DKH/A85WEszhDu7c6cVFkQdzL73AuC/zJbAj4lDXiAL5c9wvC6Qjy
	rOIvMIpC2IDLaNhHAM/HiCWPn2KCbrz7iIu6oY/Y9LrqpCguvuM69/tV0Lu8jTtr
	9Nfc6DMG2yN9Vj/OraxUAmVSDVnUZ63tKDhXzKsN7f8a/8KVFOUk99LKsSl3NH8L
	V6WEHlKFnb4t53weTrwxIjhjxsmgPYIh88r2TN+Q9AtOgegmGok0Wb3iI4peboTo
	AQvQx8Nsqe+8WSbrZ26cUNaXjk/z9fh03w7cOOHhCz+x4+/I7kcjXPo/NU6pOCC8
	BCP6xw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qff0myd0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 14:46:32 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b60968d52a1so13954780a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 07:46:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760366792; x=1760971592;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Baafv0dkbATo2Vjt7gb2iGQKBDq/hh7OJ4ohJRpLxVE=;
        b=Vt+fiSM9sJoBtixTc8hrD0wwin0Yigk66qmmVBUkDeKyF9zjC6GG5EqdWt0Er/saPS
         7Vdj/3AqcvXinCri1sZn6EnOZNu09p1WjEyedk/3L5Jaa57X4j91dKiYtABHFidkKyBK
         V+UxXSINafu17SojUfYB3F7z8mFdPpUgizOHTzcqGn07IDDc2D5o8j4DUGIss1XU1ZC/
         yF/l7W3R852I1KDBN+QTQyZdx3G0PZqaaanGc+k9Kulrs7o/hhpcxtKB9KSgx+t3GpSm
         M3IQcft1n3x3GBrh/BizNSTT+5R1vM0IEUWiRwY7psPn0IDJ/IBiGcUyn5jyQrlX9Im1
         vjtQ==
X-Gm-Message-State: AOJu0YzPRIV1uWwmRazpM2oSumGXF1L+pG84GqLg+33auKlXBBAt2c/L
	baxTFRzJwvndiwizkTtYfPwYRwxcKz+wHnbcoFz1OXN2rPWxQhIAP2+KK12y2D8XSTWMvpNO01k
	GLQDna3+9fyZHsBhK57UGOpRqqixbWIrabmRwxy3yogqTaA7vWecyzhiBuLbmcc3cqoCC
X-Gm-Gg: ASbGnct3mADp5tB88x/aKH/4+6KBhpwV0mFimwWTjeNBifKzumDsw+zmOJYISt+K9au
	riy2+l4nCHrhJSGB/00DUNaF+sq2qsUqoJnlIe0wbLFmhSPbCsRV5qEdm9ayRkzOQUwI4vUlXZ4
	Vl1vzBaqsN0GA0RE5pxryWoxkZn/a6RdaoMMRV8Lj4hAKpWmue1ekq5xRpXwMhSARlcXDFWXdM4
	i4/6PNn97qrbbaqjrq/YedbFDEUTzFgZAqaoUPWuYH7Tk0rEVa8/RJt7zbJCuVa7p7dVqe2lTb3
	0w7DV6rOTjH2p81JCj8EA7D1jwINsz3pi7/sey2p80R8Jup48HgcS4MtoWiS6PIwZFftfOBi2Q=
	=
X-Received: by 2002:a05:6a20:7490:b0:2e9:d6ce:e125 with SMTP id adf61e73a8af0-32da80ee0aemr28439804637.5.1760366791949;
        Mon, 13 Oct 2025 07:46:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsp2b2NHE9jGWw3Rw9mQwSkk8mHNUW9ttGhh+qp/1gDWG2urxuMKeyyd0PiKH8o9pWOalrXQ==
X-Received: by 2002:a05:6a20:7490:b0:2e9:d6ce:e125 with SMTP id adf61e73a8af0-32da80ee0aemr28439756637.5.1760366791441;
        Mon, 13 Oct 2025 07:46:31 -0700 (PDT)
Received: from [10.219.49.211] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0964c1sm11703138b3a.54.2025.10.13.07.46.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 07:46:30 -0700 (PDT)
Message-ID: <1d2aba24-f73d-4b60-ab8f-1c9d9bc775ff@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 20:16:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] ASoC: dt-bindings: qcom: Add Kaanapali LPASS macro
 codecs
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Rao Mandadapu <quic_srivasam@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, jingyi.wang@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20251009143644.3296208-1-prasad.kumpatla@oss.qualcomm.com>
 <20251009143644.3296208-6-prasad.kumpatla@oss.qualcomm.com>
 <28de0f76-24eb-4033-a1fb-20415cfb8d82@kernel.org>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <28de0f76-24eb-4033-a1fb-20415cfb8d82@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX0fHdBPrPMzJP
 ZKCEVYhC2iOV3NVL0uzOkX/bICz5t5fhgaP9gjyCGRKtu/kyxwQW2A3i555q/5B8FJvO+Xb/Xvn
 JeJ8FdeMOLF2ST4inrldR7VTvgCuAOk176T5fzbvZkVDMR7utmmtjN8u+KvsRX39rFGHgYGbBa/
 8YtaWK9e7e5N14lATa2gxwbsB657jlb5d2zn9adcGzmN6BcsnM4PpDivdXERpPXb+J7E6NQNXjw
 EiXzCGxAyMz8iXEfDIr2uX2Sr9WxKJGNBq0RtjD/Xxc4GPc9HvqlIhOdKa3bxOTW/dj9vP5P6Fx
 FxN68kcdaqryfeAAzBeh2dIt9KVGpQ/vrslMbW7dyI3RVerdXB0GxK4N+fPH3lOGOWMPPq7nlNb
 zWOfNqOJippooliNcYxs7fik7uP+HQ==
X-Proofpoint-GUID: w1gbHpcdsqBOC6ZmZVWSsPSA6jhikxXQ
X-Authority-Analysis: v=2.4 cv=PriergM3 c=1 sm=1 tr=0 ts=68ed10c8 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=-bz6CWZUwYRBO4YHzmIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: w1gbHpcdsqBOC6ZmZVWSsPSA6jhikxXQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018


On 10/10/2025 5:54 AM, Krzysztof Kozlowski wrote:
> On 09/10/2025 23:36, Prasad Kumpatla wrote:
>> Add bindings for Qualcomm Kaanapali (LPASS) RX, TX, VA and WSA
>> macro codecs, which is likely compatible with earlier SM8550.
>>
>> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>
> Now it is incorrect SoB chain.
>
> Please start using b4 - v1 was sent with b4, so I do not understand why
> now changing this.
Sure,  let me send new patch with b4.

Thanks,
Prasad
>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> Best regards,
> Krzysztof

