Return-Path: <linux-arm-msm+bounces-19992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC428C8549
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 May 2024 13:09:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72024282F01
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 May 2024 11:09:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DEDB3D57D;
	Fri, 17 May 2024 11:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UeGDtSxF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC113D3BB;
	Fri, 17 May 2024 11:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715944184; cv=none; b=PLdmuc8+vjinFuXy+qbR1xgrXALwSID31l5DKoqp2/OEM2DG/WAyZ7UyZ2iArqxWPxxL1qSPXvg6HY3XWY4AEsy7CDuMFdNFtQuwaMKsrcmZXnnDEfQ7jn34ue7H4D4V5CtGIByVxzhlQOtkndId8JfllNPNxCblg6L1VYGxwJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715944184; c=relaxed/simple;
	bh=eQsSSkyQqaAlOfXHMd7JuuXRGlCI2iIQbiFoNl5dTLg=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=h1JfjuYaz5KnXx9tfk3AqUETv5RMTax/INrxby3jxklcoBt3Mo5qMbtb5WnrZbWzqMJ94l7OlIv8a2mNPEQieEi0aq4Y50GscbTkbAXO1iN2OLdaOddVwmfWXVCYwilO7WzBD20QeDiNuauobO0WV2Ad2Qc2rHsbe4fY0ivmewg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UeGDtSxF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44HA2WdH014892;
	Fri, 17 May 2024 11:09:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	subject:to:cc:references:from:message-id:date:mime-version
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=Bph/qlNQ/PYBP8C80X56Bd0SlXNXZWoQ/O9Sy/b+pcU=; b=Ue
	GDtSxF74zTER+9UMCT+8MvCiyFH5RQipX8YGeFDMvRtfRm/ObAEg3+5e6KLf5hZ5
	kNczVCVC8B05UwKNE0v4mjWadSBR2h3PM12miD7Fvfh6qhvEvbHYxHJ0f4hsa30w
	nG3B6SDDi5OW5Afa/lWpkx4FFFosR47Ht3BJo48H69INzEm1f7SHayeb07E5j/Z9
	2eMuEYUIlBVmScbkzmFeRQ3AL9skqGzE7Z1cSHTIecHCloAQWW4PppnroZzGKIp7
	cQjyd99HhLmMmGr8N4DjJBejMLyx63MikYWw2VrgaGvWcXaeaqyFAw/quJQceKIE
	OzjbloOLs8zW8dS0u0ug==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y5e9cu1d0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 May 2024 11:09:39 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44HB9ckw022789
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 May 2024 11:09:38 GMT
Received: from [10.216.42.234] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 17 May
 2024 04:09:34 -0700
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sdx75-idp: add SDHCI for SD Card
To: Krzysztof Kozlowski <krzk@kernel.org>, <ulf.hansson@linaro.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <bhupesh.sharma@linaro.org>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
References: <20240515120958.32032-1-quic_nainmeht@quicinc.com>
 <20240515120958.32032-4-quic_nainmeht@quicinc.com>
 <a5833628-65f3-493d-9de5-33ba87a18875@kernel.org>
 <2ed5326a-b2ea-220a-2a9b-0478df0c6f12@quicinc.com>
 <743c2a10-0ce6-4b84-8127-f3d762976366@kernel.org>
From: Naina Mehta <quic_nainmeht@quicinc.com>
Message-ID: <7a8e4e2d-8ab6-53cc-f98e-285ed22eca1e@quicinc.com>
Date: Fri, 17 May 2024 16:39:31 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <743c2a10-0ce6-4b84-8127-f3d762976366@kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ilv4kMFtBlcF-t8wiHI_sidD9IJI99IW
X-Proofpoint-ORIG-GUID: ilv4kMFtBlcF-t8wiHI_sidD9IJI99IW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-17_03,2024-05-17_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 mlxscore=0 clxscore=1015 mlxlogscore=941
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405170089



On 5/17/2024 2:22 PM, Krzysztof Kozlowski wrote:
> On 16/05/2024 07:21, Naina Mehta wrote:
>>
>>
>> On 5/15/2024 7:53 PM, Krzysztof Kozlowski wrote:
>>> On 15/05/2024 14:09, Naina Mehta wrote:
>>>> Enable SDHCI on sdx75-idp to support SD card.
>>>> Also add the required regulators.
>>>>
>>>> Signed-off-by: Naina Mehta <quic_nainmeht@quicinc.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/sdx75-idp.dts | 45 ++++++++++++++++++++++++++
>>>>    1 file changed, 45 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/sdx75-idp.dts b/arch/arm64/boot/dts/qcom/sdx75-idp.dts
>>>> index f76e72fb2072..6f94278cf837 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sdx75-idp.dts
>>>> +++ b/arch/arm64/boot/dts/qcom/sdx75-idp.dts
>>>> @@ -41,6 +41,29 @@
>>>>
>>>>    		vin-supply = <&vph_ext>;
>>>>    	};
>>>> +
>>>> +	vreg_sd_vccb: sd-vccb {
>>>
>>> Please use name for all fixed regulators which matches current format
>>> recommendation: 'regulator-[0-9]+v[0-9]+'
>>
>> Did you mean that vreg_sd_vdd should be updated according to the
>> suggested format because vreg_sd_vccb is not a fixed regulator?
>>
> 
> Yeah, it should be about sd-vdd, but then this one should be named as
> well with a similar prefix to have it consistent.

Sure, I will update in next revision.

Thanks,
Naina

