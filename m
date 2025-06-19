Return-Path: <linux-arm-msm+bounces-61798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B671BAE028B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jun 2025 12:20:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DE3A5A21D2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jun 2025 10:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 170E12222C5;
	Thu, 19 Jun 2025 10:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HfGQfc7m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4947C221725;
	Thu, 19 Jun 2025 10:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750328427; cv=none; b=oskUDEaImYQWiotWEU9nmSITPT7nCVj5eW4Z82qtM+hHX88BGTzGMvLoHdyZIQ0hfCq13tzl7PAk+jvFfL8vAO5xY/9dPXXVTq0KWdaP3rF/9S4ibDWnugbCIa1H5ch+2sVERwf5lqh/krTjSTRljQpaQYOiDJwjiOGLMVm6lQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750328427; c=relaxed/simple;
	bh=0DgFTAL6mz9/5mlr4eRewZuvWWgktHbE0dCpfKYuO5Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=cSCpnGDemti175qkTtzJ6qCImj0cbiWSwb0fGk4u+XVsqv+UZgJux4kxmMGlQ1UzJbQQb6ll3MXF0rwWXvzAQrPtTWI4Sa4J+n5eVLqYXCbkzJJvPaHq3+jAZEPjb9zj4bnhhAm0NKy6NLqtXS366ioQdZoL4OhWGbcz0yIvcXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HfGQfc7m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55J5wNNY002625;
	Thu, 19 Jun 2025 10:20:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FIwbK4fsuTi2Ekg9nbMkJqw3FQ1RBeyBosd/m9t3QZI=; b=HfGQfc7m3b++WjVf
	hHM5n6UFF51uDG5oD7ScfITiITd3h2hVtuOqOfehHJINXh/o3GmzeqgpQ4lh9aXW
	v4697Dixc0TD74BtYoYsPUwJWrsA1Xz7afkFjcAK1DR464VdHebX+SKhhsLXfLUz
	16M6AW2J3y10zWp1ugfiehCXWyjj/w0loqZdwiYm0KpeVm0CxJO0hwlH+ijYils4
	rI9Nwpnk2j8wpnBKKrTZ/Gmi7njrAv+MjyeTlYma8QRIxaxGejbWPP0t/VDCc17W
	Wd1U0ypCmXb2Y+BnuQbR0FYtNI6Zz6biYl6/vsZLvkE1BRqyMkfWNNEcBDHnGDCI
	wliEjQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hd7p88-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Jun 2025 10:20:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55JAKImX007362
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Jun 2025 10:20:18 GMT
Received: from [10.218.22.7] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 19 Jun
 2025 03:20:11 -0700
Message-ID: <5ed72663-da54-46a4-8f44-1ceda4a7d0d9@quicinc.com>
Date: Thu, 19 Jun 2025 15:50:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom,sm8450-videocc: Add minItems
 property
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Satya Priya
 Kakitapalli" <quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        kernel test robot <lkp@intel.com>
References: <20250618-sm8450-videocc-camcc-bindings-single-pd-fix-v1-0-02e83aeba280@quicinc.com>
 <20250618-sm8450-videocc-camcc-bindings-single-pd-fix-v1-1-02e83aeba280@quicinc.com>
 <4657c6d8-8454-478a-aac3-114c6194b72e@linaro.org>
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <4657c6d8-8454-478a-aac3-114c6194b72e@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDA4NyBTYWx0ZWRfX/trn2uyXOjTc
 4IeRI9Cdlx3pU/HuRaOht29drWcPFBCK3gbknQh8urk0Ew7+NgFscoWuUZgq23RxvoLmVyEF4rU
 Ijlfq49ZrttjTaRu5vCEMweP5D2tpT2mMxXrrG5Qy6Sqs75rkkwjy6gXWcBeePwb02CNtPGoVF3
 SsJXdxJR/tmWVs5mHrq9Xv2kFp0Vo3r8ZvcGFrBXkor4JMPxWSW75vv9jcKncxnkpJvuWmaAzax
 zkMW6pHohJey/V4ZUXRhi8XD6BlHnksoLfcT3hlfiFkoNeJGiL5x50e2GN/j4k63Ca03G5WJ1Bm
 0q51pPjJIIXY+/XLUrVq0AvTrgHkBQqKCFzQARbkrjaaEYlJ3EZhO/iGqHJZ0k9d5C4ETKyWFMZ
 QpJ7zNTTklqw49wvQzdHy9ZNc7YxW8lhE2AZkdCogktAh8dtYbiJUusHNTy28rRj5qpjiVEv
X-Authority-Analysis: v=2.4 cv=PtaTbxM3 c=1 sm=1 tr=0 ts=6853e462 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=cLWHS4kKuHwVDwOVLkgA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: GAUMW2cVFg-9ItYRwUoI_TkgEoHvKSCw
X-Proofpoint-GUID: GAUMW2cVFg-9ItYRwUoI_TkgEoHvKSCw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_03,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506190087



On 6/18/2025 11:56 AM, Krzysztof Kozlowski wrote:
> On 17/06/2025 21:07, Jagadeesh Kona wrote:
>> Add minItems as 1 for power-domains and required-opps properties
>> to allow this binding to be compatible with both single and multiple
>> power domains.
> 
> This is your hardware, so you know how it works thus I expect here
> arguments why this is correct from the hardware point of view. Without
> this, it is impossible to judge whether this is a correct change.
> 
> If I overlook this now, it will be used in discussions by other qcom
> engineers, so unfortunately you see, you need to prepare perfect commits
> now...
>

These clk controllers mainly require MMCX power domain to be enabled to access
the clock registers. But to configure the cam & video PLLs in probe, an additional
MXC power domain also needs to be enabled.

Since the initial DTS changes only added MMCX power domain, this change is required
to be backward compatible with older DTS and avoid ABI breakage as discussed in below
thread.

https://lore.kernel.org/all/cc737a89-77e0-43bc-8766-2c8e9cce1863@quicinc.com/#t

Thanks,
Jagadeesh
 
> Best regards,
> Krzysztof

