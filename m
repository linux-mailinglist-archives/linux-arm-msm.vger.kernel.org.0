Return-Path: <linux-arm-msm+bounces-42621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFEF9F620D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 10:45:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C5DA1886920
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 09:44:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 287E7193079;
	Wed, 18 Dec 2024 09:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bRXCD00x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1531791F4;
	Wed, 18 Dec 2024 09:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734515058; cv=none; b=cF9FgEkQ4OqErL+fmOJtArhQuKJl8kTLqXQK1IOJBWGpMEYUB130SOfk54+zclv5l2bSzGcHec0HdxG3gdHuF2Zc/B/tqz1NIbKL3svai1u5LkWtAZvqGbLbhQcyxN1t586Rb9EdcDYTiyJ/hxllRXJehiy/G9KTcGFsM29kl1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734515058; c=relaxed/simple;
	bh=A0Zj9+0LGObPkEo7xOVd01Y1b2SolCeVf5mJz/rMvU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jaguBpNnAYXZ+N23gi20YoY8Gld6PE92DOrKCBWbbPWaM/ciOJgdTQNum0oak45IQwZ6g6xsjoqSQfSznTMGkIGxrDTWgdkGRvtyfKKSPwmHuYYxj+Rkj/Oqz7PVCU80vAl4jk3EYJQX+D0A1n2HYe+00vdqHYOp5gMKGh3aCf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bRXCD00x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BI8W6fQ015624;
	Wed, 18 Dec 2024 09:44:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eTfbfQ7i0+fCOjXR2GpGf7ZFv7MCLISP7zu5S/m4hrk=; b=bRXCD00xrjX3nb8y
	ubRpKGu3QbYRuKJGE4wiN1ZsKoPbWZm0if/LATRe4U1m1++Pe0uzzPVhqAuUFbEt
	wfK3ORdru8yFPlnSHe93Fvr8IemuECXVgGM6hIYrPpHEr9IeOLeAajYZUkoc4r6r
	OuFWPTe7Jet8Y3/o8OvHgkJ25cpxzPuEjTi4tv9ZMxDNqTeBTp7bpG6rDR7pGH4P
	v/25D1OA+Fcjig2XLHI3ucOTDPUlQXUVYXiR3JpgmDqaPd1y+4I0Pws66eFmYsO+
	tvRhdgeau+YG8UvOczp+FsP+nesCwsMF+VJGBcD0C56Dy33ssbYJ5vxchx1uVhu/
	G/j0uA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43kty6r5ys-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 09:44:07 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BI9i7V7018468
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 09:44:07 GMT
Received: from [10.239.132.150] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 18 Dec
 2024 01:44:04 -0800
Message-ID: <4b17cb4a-d4da-4328-8370-c2e4f17b4fd0@quicinc.com>
Date: Wed, 18 Dec 2024 17:44:02 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Remove unused and undocumented
 properties
To: Rob Herring <robh@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241115193435.3618831-1-robh@kernel.org>
 <68c079b0-defe-4cb0-9f6f-ce9e3645e2ba@oss.qualcomm.com>
 <d3d9dd62-e0cb-4c12-91d1-17ae52688654@quicinc.com>
 <2b866563-1328-484a-bfee-f41190ce856c@oss.qualcomm.com>
 <CAL_JsqKZb6X+XVr+yWbzbi6FhgJkcd9k1ai=y6U4eujz4Tfqng@mail.gmail.com>
From: "Aiqun Yu (Maria)" <quic_aiquny@quicinc.com>
Content-Language: en-US
In-Reply-To: <CAL_JsqKZb6X+XVr+yWbzbi6FhgJkcd9k1ai=y6U4eujz4Tfqng@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: fv0p72ktwOBQhqBtwL8A6IrSlIBuTMoH
X-Proofpoint-GUID: fv0p72ktwOBQhqBtwL8A6IrSlIBuTMoH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412180078

On 12/16/2024 10:00 PM, Rob Herring wrote:
> On Mon, Dec 16, 2024 at 6:42 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 16.12.2024 4:42 AM, Aiqun Yu (Maria) wrote:
>>> On 11/16/2024 3:36 AM, Konrad Dybcio wrote:
>>>> On 15.11.2024 8:34 PM, Rob Herring (Arm) wrote:
>>>>> Remove properties which are both unused in the kernel and undocumented.
>>>>> Most likely they are leftovers from downstream.
>>>>>
>>>>> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>>>>> ---
>>>>
>>>> Funny, the sideinteraction compatible is undocumented and the touchscreen
>>>> driver is not upstream
>>>
>>> Does the compatible also need to be fixed to "focaltech,ft8719"? Refer
>>> to the info from [1].
>>
>> +Alexander, Caleb - would you like to look into this on axolotl?
>>
>>> Confirmed, the compatible "focaltech,fts8719" is not even in any merged
>>> bindings or drivers. Instead, "focaltech,ft8719" is in the current
>>> driver and bindings.
>>>
>>> By the way, I am curious about how Rob finds the unused properties.
>>> Could you share some steps?
>>
>> make ARCH=arm64 LLVM=1 -j24 CHECK_DTBS=1 dtbs
>>
>> returns all kinds of errors, including "undocumented property"
> 
> This case however was a dtschema change I have not yet committed.
> Plenty of other things to fix still with the above command though. :(

Thanks, Rob and Konrad, for the clarification. That answers my question
about the intention behind the current change.

-- 
Thx and BRs,
Aiqun(Maria) Yu

