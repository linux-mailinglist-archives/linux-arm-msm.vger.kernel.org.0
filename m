Return-Path: <linux-arm-msm+bounces-87167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3348DCEDA3C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 04:58:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C288A300D42B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 03:58:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E74529B78D;
	Fri,  2 Jan 2026 03:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lpwZxZ/H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NhuS8lCO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABBD2BEFE1
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Jan 2026 03:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767326298; cv=none; b=Yc15hEGE+Tm4v+fwtNSVfIXseo+IcWpNOgO2akPio9V4ScQ3mcRLv/hjh81DbPigTOuSbG3ttL5zfN9U4wxZluBOTURCb8raCUchm4SMG9WxDORERIK3IPom4DbstZzVhB+q1Et7RDMduDMp5OCArQEHVRGNikYVLySVtH9PSKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767326298; c=relaxed/simple;
	bh=0XboRHdbJio38xQ00Nh4uz8xZEYDbhYDXoKco21NrRk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qrx5b69DSbO6WMetgpjsWRuP/4MkEnS7U/FJluRzTfe0dagO0kHf3JsFuG939LqvKiADh0Bx89sBttqBsUeBdsEBsreA5r2keaqQnkwxRwo3Lok3y9BXZenDJR2xYWHQ7XrE5h5lH0teCkkN0/fCwpm7saPyQ0KYhfP2AigX5gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lpwZxZ/H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NhuS8lCO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6021KIKP4028938
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Jan 2026 03:58:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LqFr4SIUCsSLLE8JJkieeMm2Lfd9F8TSc35GL6jZiU4=; b=lpwZxZ/HhzIFYQQA
	4dEFKDORDs+8vHytX2JJ1uuhr8tnfFAfw8rGhdqShKrocmqRvUN05MCfbwuv53bf
	Id1sMrkdXdDJ/k1MRkVcHBMIzB7/7byA3bCEFyMSpq9la2okqe4k7ua7hPTjNZit
	g22ulFN+Lm/kN1gxCLWry9CuIGKlnDqU9a/0QBhkmpHNNLDXL+LPr/6qUmQ3acXP
	G9KMYbqHGRs0gaNuR5snxkC5SSsZt5OPrBvffRJQM87zFe1Q4YNiB+ilW4uWafqA
	RCN3x8lwwXPY0ueVmGsC8WUWJgNOGtdDRr4BCjxVUDIOq38xw3FhymDWqrw1edjh
	Ir7/Ng==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd8532ejr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 03:58:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0d59f0198so150400055ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jan 2026 19:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767326295; x=1767931095; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LqFr4SIUCsSLLE8JJkieeMm2Lfd9F8TSc35GL6jZiU4=;
        b=NhuS8lCOgjs74cLZoR8NfO3P6LEh3R4qtRFs7aFAB27sXdSmQIK4ijyRrekZMKJJi5
         AWttygvTkobG/iE+0GYPv5On+7Bmg+9aIu2rQ4Bkr9T3Bycw0cCrDfmSDa64K8uvNcZh
         VN2ASrVakAGOI6IxqBsuGpl3sdIDiK6TgE48NDTGD/b0vyKipCZ3r/zshFPZMVS1kgDo
         6qbmeubKlI152x0tRSF7MgZEXFHoaX2MaHnP1FDyVBWVC4ePYgO0Z7DQJGdnZyIAvO3C
         y9cvWRuFpluiNwFHUeHQsRRarUv+dcgqKfJU3DG4pV8qiRfuzMdNxY+lVYHTumg9WmfU
         XNMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767326295; x=1767931095;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LqFr4SIUCsSLLE8JJkieeMm2Lfd9F8TSc35GL6jZiU4=;
        b=qkeTx+JzSkZPGErd59fZAYhtJ4dGI6OtXcQ/9xXasfpEvA/Dj0ly72GMzArwQHKX2x
         fsjYxNXqUCccnrxA6GuLogHF2X3lozERqqoEq9Dgzigp7NmXG3IJYe3/sF1Whd9kLE/J
         4dStbToeZt6izZQBgja43OjzKIDA6FBsviNLZKEozdwScJUBz2qYttB5oQx2sV+/ZMdQ
         t5B7nGVmdtGOjPbtL2CqhBYPXDEqNTLn25WuwzY1juV2b2dAeQMtfHaGwLq8fxyi9xMX
         KcrbunvsqMwza8CD4ML4j5rEBRhveyD82M3qMQgjLn+yF4XWKF8oaz2Vu3dOA8b5kVbe
         2z6A==
X-Gm-Message-State: AOJu0Ywx+mlw8cjdz9TQZfTlO5m+9V93+n/Ra6ppz4dZywfa1NX4vtPh
	MeoDbQlGY/vCDv7Fc4sN9SwPaPOcOVwGDK6X2kPEULCs2xIaQdx/O3uyg7/C13N+ItQQeB+uy+f
	rat5Ntizimy6tSaEFWUza8TvU65hz332chnZzwAOVnvRVkwkLUi8+bHTY+tvl84Yn0+g7
X-Gm-Gg: AY/fxX5EUZDCiu+1ELySwB54TiRWgWWgqB34aXByijRd9GHIJGV9K6Z5amORtUA1+aF
	cpNR72QaqOf/FGKCS0LRSL6Hwrj7t9ZK6iHPzTg7Lt7kiiawVxsHvO9CV7KJcQaeR9OTMofdD7w
	IlgaEaWHACKtQbnYxPJ16wFLQECYQE9HO0SjDxP3D1KNz6UANtdftWSir9pr6VvBbwA6mg1ZCAp
	Csm6Pgh+/AgQ5JyrihR5qv69Aw51u5lpdd0WP4iyOnZg2BmgyPRSeOKmqkIQWOLtf24w5CQ2asQ
	YVv0QUs7EZrcNJ2wO8qQQEGDaf9LvO2ve/0vXLSfMLN1Dj9P/CqFU4FbC3sAxrLe/h1Py5GjdXP
	jZoyowX9jKOyJdShWeo0n+PjoUKB1xVoGqI8a8ZA=
X-Received: by 2002:a17:903:bd0:b0:2a1:3e15:380e with SMTP id d9443c01a7336-2a2f273261fmr249165305ad.34.1767326295079;
        Thu, 01 Jan 2026 19:58:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH4NxLVRgW+I2SZq0MJGPGEFM7KAxNVqWKlVzvbiPDVs8g/IbtWn5aUQkRfdKgEJmj6JC6lqw==
X-Received: by 2002:a17:903:bd0:b0:2a1:3e15:380e with SMTP id d9443c01a7336-2a2f273261fmr249165155ad.34.1767326294573;
        Thu, 01 Jan 2026 19:58:14 -0800 (PST)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70dcc7c8sm39340592a91.15.2026.01.01.19.58.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jan 2026 19:58:14 -0800 (PST)
Message-ID: <892970d0-2373-4b6f-a415-05017ffdf219@oss.qualcomm.com>
Date: Fri, 2 Jan 2026 09:28:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: purwa: Drop the Hamoa workaround
 for PDC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20251231-purwa_pdc-v1-0-2b4979dd88ad@oss.qualcomm.com>
 <20251231-purwa_pdc-v1-2-2b4979dd88ad@oss.qualcomm.com>
 <7eacdba8-1dec-45ac-b48d-55cc67a98ae7@oss.qualcomm.com>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <7eacdba8-1dec-45ac-b48d-55cc67a98ae7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: S2eQI-YK-0auhUD07IILAtX8LdvEwCe9
X-Authority-Analysis: v=2.4 cv=fL80HJae c=1 sm=1 tr=0 ts=69574257 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=3v1PhqgXsD_hH84qwFsA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: S2eQI-YK-0auhUD07IILAtX8LdvEwCe9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDAzNCBTYWx0ZWRfXz+deGoHGc/Tf
 yH5tozYYojxR+oyBiiSNDg2FdmIw4JmdcXgWi6HyU7Xyk5uX6GbXATgGxtgPHPIngSqfEJZWwCA
 jMGXs+akfZvJOxqBvul3cAhC+IDiuwIszUqWzZ1HnY7R+REsFlwF5TuhetvAhNFwZenvzF/DNg2
 r4iLJEh5YMg+zzFaMCyK9sk5x13P86uIk8NNd3me5fG2GdztpvK6nKliknO5PnbBtknncET+FYy
 YdCrj15U3Gc3B7IjSh+7RUhWWaOAlXSBtX+Slpj4MPYKCntlRTHFj25oV7w1IanLnaH1D8g812o
 4Rf9U3LJIRU1RC076uoOc0oEWueJtWlHTyBO12IAXYVEMAP1xe2tCrLJtk58SsBumk2ykgls6dX
 ylJ5pGZV0l1qPgd819bvQTSxvkMbQnt7fuHbKvMDLYeUmGBmcIXsW6UG/NdzW6Js1172hE63Hg8
 dvN23HC5C5DjOfRfsyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-01_07,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601020034



On 12/31/2025 5:24 PM, Konrad Dybcio wrote:
> On 12/31/25 11:18 AM, Maulik Shah wrote:
>> Purwa shares the Hamoa (X1E80100) PDC device, but the hardware register
>> bug addressed in commit e9a48ea4d90b ("irqchip/qcom-pdc: Workaround
>> hardware register bug on X1E80100") is already fixed in Purwa silicon.
>>
>> Hamoa compatible forces the software workaround. Use the Purwa specific
>> compatible string for the PDC node to remove the workaround from Purwa.
>>
>> Fixes: f08edb529916 ("arm64: dts: qcom: Add X1P42100 SoC and CRD")
>> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/purwa.dtsi | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/purwa.dtsi b/arch/arm64/boot/dts/qcom/purwa.dtsi
>> index 2cecd2dd0de8c39f0702d6983bead2bc2adccf9b..e3e2dfedf0b3cad90b767d6b28fb0c60078d192b 100644
>> --- a/arch/arm64/boot/dts/qcom/purwa.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/purwa.dtsi
>> @@ -152,6 +152,10 @@ &pcie6a_phy {
>>  	compatible = "qcom,x1p42100-qmp-gen4x4-pcie-phy";
>>  };
>>  
>> +&pdc {
>> +	compatible = "qcom,x1p42100-pdc", "qcom,pdc";
> 
> I think it would make sense to add a comment above the compatible line,
> saying that the PDC is largely the same as the bigger brother's, sans
> the bug
> 

Sure, Will comment in v2 above the compatible line.

Thanks,
Maulik

