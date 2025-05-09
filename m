Return-Path: <linux-arm-msm+bounces-57509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CBDAB201F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 May 2025 00:56:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 427624C79B2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 22:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A22422638BF;
	Fri,  9 May 2025 22:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SGTKlO/f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B9B262FFE
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 May 2025 22:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746831377; cv=none; b=tWu/AqfR4IVTQCEuFQBJ9DfzFhUIrzeNUygfG3Xp9vpwIlCVgAEmN1lfJ6M/h7hZLkncVyNOd6JhXPr6mBjlUsgli0+5q4qI6BZs7zCEQIIEQlB20lYGADMFDsRlvC12Mes294VeaL5r8rKUgJJtvgevrTQRFET6InIEljf5JGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746831377; c=relaxed/simple;
	bh=M8ykDxNF0SaPPEMj71mFhnCi5xlu6Dp46bmYjYU3kNo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YnZfL7TrUhBTBVizDThiV/rYxocpArhS5nz141aFEZX6g0bQxTLNJSgM1Rk0yWtMMOvy9c/2X8b7egr4KVRgyEBzAw9WKmKiaRXtTjl+hiH/nXRyvHlFK3XENdMUa+myMeSmMdaWNMK8eT2RZT6DS5DPiaYfAZw9aEDqTdZ7QqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SGTKlO/f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549C6jrw002323
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 May 2025 22:56:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Qp1+5iTdYJmiqFoTnH+iBbZITewEjue+EqmZ+z2Viw=; b=SGTKlO/f3dTEr42C
	84dFkiZ0juK20gdHJPLkLMSir0t9j+staPftSLVJWZiVVpcyB7i72E+9ShH/SxMl
	UzUnlWWRl7ZBcRwF+eOnCTg4YD7uIWE2+tLdw273IzvxWd+gPxxfXOjQBjmsKGJY
	Va9vi6j6nuy3IrUFSyH8bpd/gJ/9PITaU2TSRqlDiUUj5SR3dkkJaJISsul12MoH
	fqXhm9j3dPY12Ajrw+j+f8aHgXWJ7uJfZQ5YsalO4zupJLKxHZiC2+Zg4WaaTo75
	hkdJIVpGspolJkIpe9TPP5Z6YtJsdQbeKVtgvTnjz9NKgMmrfC5dQoPKfW/EPs5f
	5yPn2Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp5dyfu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 22:56:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4768b27fef3so6009431cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 15:56:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746831373; x=1747436173;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Qp1+5iTdYJmiqFoTnH+iBbZITewEjue+EqmZ+z2Viw=;
        b=loeg0a9NWjkCVPYg0qNROzhd5TAGcGC7HiR3fPNzToTn6rJeMne5QjzU/bIp1ItDR1
         KIBxspfTm7YeWw2ksYRPieID0ugdRgmTVmS1pMDMXmAY0BOG4pyqQ54sYRJUGYeiCvGH
         fiBiXZ98d6ChSToALkTGJQ0Ve3QLiSEujZNH2PicJjYL3HJbMWs/BU9IfTiPzf3RLppI
         p8BvAl6a+3d96uxfvF+Gbinni21oRhLu9y3hjqR+ZgNRrRN0hVAsKC8UGngPJgY/ANze
         6b6zRjHfWFB3XpS/76PfeUwxX8qoA60K85A35ork+vGxU9gyd8+bmCwUPW3bKOe9sz7g
         76+g==
X-Forwarded-Encrypted: i=1; AJvYcCVmYscodZNc9AkHdQCcQPQ0Z23dmfhfGAGXwJK24lcM0SV9nHIBMtZ6zVnEDPTiCsdSCue7pUFz9MZnrNYc@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0fpbVLda+fT6wFPgAuCurlV6Z5ENn8KFhSvkCPQZCsDQYq/fp
	gVvIM+n5FqBRmzHEI18Wf/KSCThdUvXn67Jby+IoVU4QOejW3nBJUByig8/j7Y3VLgX97YVX72y
	NziJ8JfIyMgKefrtbBPMzFY0l7hPs5kGcnwFGFnFzK8SdhldrxL54CRn02U6lNidU
X-Gm-Gg: ASbGnctZVgL4g8hqF2LRtvRJI8EGKfu5gZnaDT7ggUe7EzCcTzsx08LF4RUixeCIZb7
	6hMAEnMDFLqXuuK0+DjyPWopV6xe0hELywx3a+wLAfQ7BHoETbXhm+g+0oCo+Xt2rZpSpegXHVg
	FVuECdji6F/YxMxYt3bno9A2SQuf25clgDhFaBRuWgngvBIPpTWunf4ARDx4opdTwcioDE1HHCk
	Qt/hgj/g+/Ww/jsI2eu+l/BFouQxo184fSqAeNI5l6UYHfSe4+kB/XCt2cSIXY7ggZ96PDtdXnM
	YZ0wDoSn6QtOHWHjevROcmUkgj9cyCmQUicE9Jht7Ee9R0vkUR4JzfywjrHsXgBGNw4=
X-Received: by 2002:a05:622a:14e:b0:477:5f29:dbc9 with SMTP id d75a77b69052e-4945280128emr26695201cf.13.1746831373247;
        Fri, 09 May 2025 15:56:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXVP/tivEEn1s6heCPquBwNxnD3dc35bG8Iyd1lz/IHTbO9GahzmvLPBbvd+/AL7RzsvleGA==
X-Received: by 2002:a05:622a:14e:b0:477:5f29:dbc9 with SMTP id d75a77b69052e-4945280128emr26695071cf.13.1746831372832;
        Fri, 09 May 2025 15:56:12 -0700 (PDT)
Received: from [192.168.65.158] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2192cc449sm215873266b.20.2025.05.09.15.56.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 15:56:12 -0700 (PDT)
Message-ID: <5eb8fb45-eec9-4078-85ee-0cfd563e67eb@oss.qualcomm.com>
Date: Sat, 10 May 2025 00:56:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/6] arm64: dts: qcom: Add support for QCS9075 RB8
To: Wasim Nazir <quic_wasimn@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@quicinc.com, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20241229152332.3068172-1-quic_wasimn@quicinc.com>
 <20241229152332.3068172-5-quic_wasimn@quicinc.com>
 <vr3q2c47ht5iebf7nvy3qywoxlquwma3p2tffswrefpmxqy24h@wrfecu6mcqcn>
 <aBoAjaI6nDvSyM/v@hu-wasimn-hyd.qualcomm.com>
 <a100a875-4951-40e7-a516-59040649f218@oss.qualcomm.com>
 <aBoLIFCAjWM2QqpX@hu-wasimn-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aBoLIFCAjWM2QqpX@hu-wasimn-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XL0wSRhE c=1 sm=1 tr=0 ts=681e880d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=i6E4GqrmrfKDrJ3Qr9QA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: vJPyUrOBRkMjIvM26GOpKNLH2UZkBzlm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDIzMSBTYWx0ZWRfX4CJQHlNDKd/M
 yB38va/KJ7zzGMOJUqjrelahCW4x8bIeFlhafJQFONnlb1JX/hU9z77zRLDhbVHC2TkJSBeada+
 96+3jket4gb3HVHMGFaOJVpi54qyWKjUlHMhuDXxGkmTtnU0JkLLb6jjVvi08U7VDV2p7fpxh6/
 GBQGqwzONfdJhNeELzbCeuQGoDNSEHnv7E1ocEpVbghRhmUiCRoJX21JOl0oLsKy6E3PQWmjpme
 S1tyQAD135oVaR5zIfGzAH8UsIOBPyDm2ajtxLQPt51vjeBKp6pIRpkTd2NTZJwaphCEMjoQssZ
 pMbSjQzzP3iVB+yl2wERFn9YSgO5TkjCtqtO/abB3B7/pdOrXHyuXrvf663+sVCUG76H+YxK+Aa
 JPdBa6i81NNC0yYwsa5ORs24EGsaIvHBV7FSGfOt7h/d2TF9tMRdRAuOhi+OYjIrticMRMXq
X-Proofpoint-ORIG-GUID: vJPyUrOBRkMjIvM26GOpKNLH2UZkBzlm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_09,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 mlxlogscore=782 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090231

On 5/6/25 3:14 PM, Wasim Nazir wrote:
> On Tue, May 06, 2025 at 03:30:43PM +0300, Dmitry Baryshkov wrote:
>> On 06/05/2025 15:29, Wasim Nazir wrote:
>>> On Tue, May 06, 2025 at 03:08:17PM +0300, Dmitry Baryshkov wrote:
>>>> On Sun, Dec 29, 2024 at 08:53:30PM +0530, Wasim Nazir wrote:
>>>>> Add initial device tree support for the RB8 board
>>>>> based on Qualcomm's QCS9075 SoC.
>>>>>
>>>>> Basic changes are supported for boot to shell.
>>>>>
>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>> Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
>>>>> ---
>>>>>   arch/arm64/boot/dts/qcom/Makefile        |   1 +
>>>>>   arch/arm64/boot/dts/qcom/qcs9075-rb8.dts | 281 +++++++++++++++++++++++
>>>>>   2 files changed, 282 insertions(+)
>>>>>   create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-rb8.dts
>>>>>
>>>>
>>>> For the next submission please include at least the UFS support. The
>>>> board is pretty useless without the actual storage support.
>>>
>>> We will be adding UFS change once the basic boot-to-shell changes are in
>>> place.
>>> I have already pushed the next submission (v6) here [1].
>>>
>>> [1] https://lore.kernel.org/all/20250429054906.113317-1-quic_wasimn@quicinc.com/
>>
>> Sorry, I missed it because of the rename.
>>
>> If v6 gets resent for whatever reason, please include UFS into v7.
> 
> v6 is just split from v5 to separate out evk & ride changes.
> Currently it only supports boot to shell so UFS change is not added.
> UFS change will be added in incremental patch after boot to shell is
> approved.

Please take this as a general heuristic for the future - if a justified
change takes less time to perform than typing 3 emails to argue against
making it, it's not worth typing the emails

Konrad

