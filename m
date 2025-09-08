Return-Path: <linux-arm-msm+bounces-72478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 11465B484E6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 09:17:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9326E16D516
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 07:17:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 073D61AC44D;
	Mon,  8 Sep 2025 07:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CGswnwMY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3ED13B2A4
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 07:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757315847; cv=none; b=SFcLVN3jWEaqMRGy8LLw8ZfrV3pSbUYWlhdi/Z7d7f2MLunPz+3FYmJvHX+YznXvp//ZKLsA3kHGf2WJD0yGWG3DsjccTsol1IFGV0b0+2DhTm/tHECfCFM24M9rR2YK64sD0tJaRB8+qTJ1n1SaRNaK/azI0SW7ycAB2CdoK/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757315847; c=relaxed/simple;
	bh=n+aaWyQRYIu1MksN7mzgmu/sMhs7wreA4Hz4TnVNjRk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aY3yJ+7BlDO1+Ddr1fNGhfB4cmEnPEpSaE/gqBeyJdXZrM220AydrWzN2c52Gj5Qa+Z+k+n8ox+5RF/whW5WX7oZxoXHiylt68XAqLABa/hWrh2B1pFbDlxyJV8dysb7/fx4xkCYvm3jWRiLm87NeMTpPp0P5Of3bQENJPGDQRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CGswnwMY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587JjFLj026682
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 07:17:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GvkSbj34UnoKQWHt/fvkvc/27oZE/6107qizJVFFrps=; b=CGswnwMYlYbkOmkz
	qSixhdi9F0RQA8Bkp08rMOqS12FzgoXt849zIok/XJ/wnMrDJ7BOHZ2pwNXHmRrm
	GHBL0B7u+wtmsgQlPT18RxJg6vyn9ZsMVoAqLAOFCXpZPyVWo7k3fv5Y0Hbryga/
	YeIjp8kIzM/astALJQfbMoBN+vvnE+A34rjDCuWC1Ve4YKK+ACvL9kzqQwR6ujs6
	VMfEHL8iDK6/JwPVvBrk1DNakvJ0tG8gxGp9HCPMXLyl4dl5kwDyoCZSUMyOJ789
	9l7nVCFYaHA8yH6lggruU3f02SXsugJZiFeKhwxo9CW0VmJx/t07JIV8nUog+CWl
	MRLang==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bws3p57-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 07:17:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b613a54072so537931cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 00:17:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757315844; x=1757920644;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GvkSbj34UnoKQWHt/fvkvc/27oZE/6107qizJVFFrps=;
        b=NqD7xvFQU5YtXD8TfR3Rc68GWpPXzFstRzLk8d1uaoLM7dskowiLtLhC48FYy8ijKz
         dHY6cV/g/z87X4nAUdvApmxdxb7vmaHvcmWUd9ybIIqRXnViRHcrMy2fTGT//5m+puIs
         vXRcS5GHfk1yR2sbAPXfbWSfnHKSmw8Y6YxzRL7TIj/9fyLhx/1DX05FW2Nl4urSzgQ6
         KyqwjTCuCavrBdoAOAh9LqtLeFLf8EquQKh70mlfHbQVvBM1OI1pdN8/RcVM8wu1Uym9
         /EC3hFP72ASO04s7MR/cQU0QnpsPB7JGPyERKn/s8tiOYIPnCQIF0Wo8Y08bxL1WapE9
         MQEw==
X-Gm-Message-State: AOJu0Yzc8h7GMXe9ZyxqZiBn+lBn2xL/d7BEvcoL5NfPvTXND7JYecIQ
	yYQrs93LeK9oTdw/NTSKPgtrOMDSBQ2ZnZfa1lt2z00ngHQAsMWeE9UaQJLSF6D+D0WxoCihD9J
	iLNs7wTjcwvqAXyya5a00wenoDTAq6mvHLhFHVL5xnrL50/lJN0Ch1CPdHnmfCGUG34Im
X-Gm-Gg: ASbGnctJV2Khm8IYYSNRHvWqmJOfwuWQ5hM98I9vXPhqg10KBeFkUR+ogS3E1X9RGvd
	UQzO947AfmMNwkxaaSgaxlKuTliS0nNKPATfHl3PlrP2KD471ZGLwu/bri6K/rHBy4wA2eySOqY
	nDXnuTufXmOXKXpY2hY9XZ6CBJT1RtPXChawibxUiAeop6b54tCp2xjQieeSoURaLIPj8+O8uES
	Dx9HLGxQZC5cwS8GuVmnA105X7JMVGeqJwLBR4F6ZboC5QJ6u0jm4oj+7/PhJ0wluqyL15nbDVB
	6BMtzE83AMHpn4pAcMQ20VuTJkOCwiXbT0Ee3YHpYzUzZzdEJNHkh9QXWxBWWeyJH1HCXHaiEQl
	tNhZRbwmcXZcj5wwBhIqVYQ==
X-Received: by 2002:a05:622a:24f:b0:4b5:f066:13d0 with SMTP id d75a77b69052e-4b5f83da97fmr52185511cf.6.1757315844102;
        Mon, 08 Sep 2025 00:17:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcOPchr9S1m9Rz4KxpIgTUicCH7autfYrV7AOUqW7HOqK6Yy6+QlEA3QyM4wlHT62r+3EMIg==
X-Received: by 2002:a05:622a:24f:b0:4b5:f066:13d0 with SMTP id d75a77b69052e-4b5f83da97fmr52185381cf.6.1757315843423;
        Mon, 08 Sep 2025 00:17:23 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62343271613sm5088615a12.23.2025.09.08.00.17.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 00:17:22 -0700 (PDT)
Message-ID: <9923f086-9deb-4d3f-813c-7d9b94c7dfdb@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 09:17:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/3] arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s:
 add HDMI nodes
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250821-topic-x1e80100-hdmi-v1-0-f14ad9430e88@linaro.org>
 <20250821-topic-x1e80100-hdmi-v1-3-f14ad9430e88@linaro.org>
 <a38df652-54c0-4216-9aa5-c8d32599c8f7@oldschoolsolutions.biz>
 <c66fe361-74c9-4471-b371-353ca582bb3b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c66fe361-74c9-4471-b371-353ca582bb3b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: FjxLbAZOJ3n-F6rRD069UYW_PmW9ZMAA
X-Proofpoint-GUID: FjxLbAZOJ3n-F6rRD069UYW_PmW9ZMAA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX967ze6TzHggc
 acv8pV7LYnLfeFCvcKMZ1g+SaEtnZ18w4FAKc55eCo/7YHfWx/hJMzKRIPk5iKnvA9W8xlMNtT2
 ox7+s0kpN0B4sJqvBGOSGqjcb2g1CCvhr9cn+Y5t+EdAhJ1DEO+6TUDc0IeszBIbxbrDcFNvQrX
 OjttdU6CjlU+hn1PJEYGMzR9lPachAt+WbEQQsXV/G2W9jZBlqIWibbeqcdMVs1bTtFQlN961fz
 BO6k2Lvv5Iz5AbSqc9EQzH5bZlKcnyE1OEA3sRWjVrgDEUyyfnpEGiFUjorqKsBLsGAe0ZrsUbT
 tgwdC22c1POcBBUVPmsV4Gx6szxKElcSSQs59dA92dLRW/lUxKx0u26no5txjIDQXEp5e/8empz
 5BZ8ZGhT
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68be8306 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=4LzuJVVA2EB8z9vYX0EA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_02,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018

On 9/8/25 9:16 AM, Konrad Dybcio wrote:
> On 9/6/25 10:41 AM, Jens Glathe wrote:
>> On 21.08.25 15:53, Neil Armstrong wrote:
>>> The Thinkpad T14s embeds a transparent 4lanes DP->HDMI transceiver
>>> connected to the third QMP Combo PHY 4 lanes.
>>>
>> [...]
>>>   .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 44 ++++++++++++++++++++++
>>>   1 file changed, 44 insertions(+)
>> [...]
>>> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
>>> index 4cf61c2a34e31233b1adc93332bcabef22de3f86..5b62b8c3123633360f249e3ecdc8ea23f44e8e09 100644
>>> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
>> [...]
>>> +&mdss_dp2 {
>>> +    status = "okay";
>>> +};
>>> +
>>> +&mdss_dp2_out {
>>> +    data-lanes = <0 1 2 3>;
>>> +};
>>> +
>>
>> Hi Neil,
>>
>> shouldn't mdss_dp2_out also have the link-frequencies property?
>>
>> +    link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
>>
>> Or is it something the bridge already negotiates?
> 
> No, it seems like our driver falls back to HBR2 (54xx) ever since the
> driver has been made aware of this property:
> 
> commit 381518a1677c49742a85f51e8f0e89f4b9b7d297
> Author: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Date:   Tue Dec 27 09:45:02 2022 -0800
> 
>     drm/msm/dp: Add capability to parser and retrieve max DP link supported rate from link-frequencies property of dp_out endpoint
> 
> Dmitry, is there any reason not to allow HBR3 by default? Is our dp
> controller/driver not smart enough not to advertise rates it can't
> support, during negotiation?

I suppose if I want an answer from Dmitry, it would be fair to add
him to the recipient list.. fixing that

Konrad

