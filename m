Return-Path: <linux-arm-msm+bounces-117594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rRUaHYg1TmqpIQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 13:33:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C660E7259C5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 13:33:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=fj2hmh1F;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PncA+wwP;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117594-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117594-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4BDA63088919
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 11:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27154426D39;
	Wed,  8 Jul 2026 11:27:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C38423A6B
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 11:27:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783510061; cv=none; b=SaGyV/MKVCZxkr2C1l5dycHhZPhFU2bT4pAvlnzNz+EV8zSbCUhQSffw6ajYjy8RF+D80RyFUatacDTzbqcLA2vr2MNBhyI2ba97Xu1dwXsrnxP5hUYzYPZM1bU1B29Z8hCos+cbhb8oRoSKmnCk+9KCRxQHE6S6QliXUtct+dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783510061; c=relaxed/simple;
	bh=BzMsn1QlG0yY8ysaqlyvr8D0YozX9wNRuLlUJ49ZPtQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NJFRYoFAU0WgIgx9UQ21nHVhfEo5xufXL0mmmrm/KIEk5zN0U1rwu5pXDaXr8d959y9ZPwptQNbVrUhvPFdiEie2LIdjBFJVwMvh2V6Wz0a77wv7TmkBzc5jz14APeiPeyK01VN0UxinELZdyvUDj5Pc/L+t6zgPOwudl8gkws0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fj2hmh1F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PncA+wwP; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6688AAMi2222737
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 11:27:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PCURb30G70qdUrMDaaA4as5d9b3CQFXvj20zxSJZ2A4=; b=fj2hmh1FkqydE+32
	UkiMI9+iy5UigDCkd7I1xOdoHBPGdyaC2vtJqcdOWTBzX15j0+NJaXXru0my0IoT
	J/8Oo9oHRe1hDB+VdCzw3Z1k95zI6Y0kZQTZH6dQx25mXRrYur9cAVJPSvNNrtle
	Zzhsn/UrVdAoAT/8jPOWbi8nv22FXkl5PWoU6XRoecIK69MMM637Rj1Orh1JMYSy
	nYriOM3ZmVs7ZWQV5P0uv4S3K3mq3Oc7cS5W1oPJbztF9DGrOJeUmfmw4ktl8HIm
	3oTQHwsiGhNP0MNicHNVbso9Y7BTIdrDOdA2RkLo1G8TSuTevaPCtSVWJetkE9Dc
	7anPBA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9csst718-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 11:27:38 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ca0481106cso9048465ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 04:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783510057; x=1784114857; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PCURb30G70qdUrMDaaA4as5d9b3CQFXvj20zxSJZ2A4=;
        b=PncA+wwPkYrz2QGnfWEHfs+gSURJ0vmQZaPk+XOw1t4ubarTnwQTi6vn3lxh0VCqnl
         vrZ723FGWEFXN/WmkyLg50RvSexi05S33izOBiaF+r18FT5AEefM6PNFagp3gvAYdkKx
         HyMZABupP9c8qJBrsRXAU5Lv3xJxlVei9tem9fRpDM7q7trTwE3yPtjUv+eTVDGUTKk7
         s5LiSD/cDguQ9G8XNcnFzZtAycS/fd0qwNt36j6042CkBfE9p9I1El9WxX2SF+WzzWmT
         j3A63B6wcVyaO2oeaV1ZY9fcDCSi73t7QCtbjFHuxcqhHvAVlFQxrxqQ14CeUx6nzc96
         k8oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783510057; x=1784114857;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PCURb30G70qdUrMDaaA4as5d9b3CQFXvj20zxSJZ2A4=;
        b=GX1ba5TWm8t2o2AVJ7PqhXa36Uok6Zat/BRwtrM/BMciNlVeRPgR3E6gDRkKUuohqM
         gZyYaaAfC7Xr6cCQCEpXwOT5q8LFzR4CA3jiH971ih5eSIvn74BU1lMFyfkTadZhRJgV
         C7rDgUxse3GoErSMoQ3Ciku7zELHayB546tSqY105BsIJILNJojXK0PamDq/dq77rMZQ
         YWmQRGsbo3ggjFpVNRBkjwDd4cLUSnVT9Wvc/1Iu3vVc6IVOl09lTHPEl3BLQXHq+7Uq
         r1o9z3Wad+J2FfD+5j9jJSMUn7pqaSGvVlDFLHAicBmY5I+icCw6ReERIy8Z6rjKfNyP
         MKaw==
X-Gm-Message-State: AOJu0YxWwF5TvmbPhpJM4/pdjTmK448NF9lmLccGBldZXFtMp9w7ynNp
	pRwn3EHgwJXqCjO0cVce7NtHOzZbwhYIeo67QmxLNds8KJGPTxfcA9po8S21rqGIfixdBYJ+4LQ
	TTdqNI514dsxYquskfaRDpR1u82Cb/ka6Ck4a1MoceD9Vtld+WKiRyG+sRJdmAdFud1aH
X-Gm-Gg: AfdE7cl0vrhvpim1SqkOtq1JBDBxtrxAboz93bdgQKVSOzO6bFMPIef20QBnnABiih7
	6TF3MGzvq9cJ17s7zFGY1Bu+Ms4yxrY9xv9Gvl4SlnxxuUsC4YcL/TaAaY4rxsPlL5Dzi8R5Zgg
	Mo7R7qO3ZQH6okai8aX24mVr2SoE5dOg9qA+hxjhEHd6OTft4PWlYX+Be/I5YT/1X/kmPgAcnx9
	W5w1eXYtCRsTQoI/YKgRD40QgYNmwtfEyhYDigEUBE2c3MeOGizNiGJ9VG11amO/6Z4hva1IOSh
	GNQE/sw2S/aVKq052Zu43+ehoh3F8iFhWhJBN3+qw5tc80k0NXsxOmrKFtdJ/47gBNo0KH3R05R
	FNIEWgncd5ljbduSaDP0EljESB2KL3CBkE/rdEA==
X-Received: by 2002:a17:903:1987:b0:2c9:aae1:a61c with SMTP id d9443c01a7336-2ccea3d97b9mr20854725ad.20.1783510057267;
        Wed, 08 Jul 2026 04:27:37 -0700 (PDT)
X-Received: by 2002:a17:903:1987:b0:2c9:aae1:a61c with SMTP id d9443c01a7336-2ccea3d97b9mr20854425ad.20.1783510056847;
        Wed, 08 Jul 2026 04:27:36 -0700 (PDT)
Received: from [10.218.37.104] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3da55sm26512345ad.71.2026.07.08.04.27.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 04:27:36 -0700 (PDT)
Message-ID: <059f8b92-6df0-4439-b3ff-1a270b5ee1b7@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 16:57:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: eliza-cqs-evk: Enable sound card
 support with WSA8845 and DMIC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
References: <20260703083421.2736184-1-ravi.hothi@oss.qualcomm.com>
 <20260703083421.2736184-3-ravi.hothi@oss.qualcomm.com>
 <bbd86b28-b6e7-4483-93a1-bac96c2dba43@oss.qualcomm.com>
Content-Language: en-US
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
In-Reply-To: <bbd86b28-b6e7-4483-93a1-bac96c2dba43@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EtziaycA c=1 sm=1 tr=0 ts=6a4e342a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=c7AZHyT8zQvrOgSsV18A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDExMCBTYWx0ZWRfX9HPGGpmVVevc
 IpBqasuLpoZM5plgSDkBHaIHl2CUJ6UcJ81Oa5f7wx9YVvtdDbVBnnW3rVFx+85iXs7V+K6B7V/
 zUDBFGSm/xeIQK3dgG3ZQhAtSmlUFOrehOf+eLQTL8UD3eke0oNdXQSlVHXu8Mh7VxkzvaS3i+R
 hLIibIRHHnF0kXwhNHnXG2eRflCCRGHUqnGQtFHgbZcuVX3qQGZFLZPGjKJ3flL0r7h1n1NlYA/
 fYwhdIMv5WxpZYhsUlZ8vYdy12eUgL/eZPIOR9bwTAapDxZnG18l+zQOCnq7yuDvnQ4jxkOZ2sJ
 cVQ+r3Z9Fu6VmN0nOw8GkBbkbvHazAgDgl60xAcG1F2agsKLjxWJcKwaJmeXLqQrBACFhu1/VqF
 S8TyQKP92eHRfUjBpnjd34NNZC6PlvnT6+6kWZdUpwVPfpj/aofQPuuB59OmZMrWhl6bUyue8YF
 QSujuV2oFtqOkvEklUw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDExMCBTYWx0ZWRfX5OzPrRPorzLe
 YknC7l/w+ED68/dw+F8r9K3FatKpzpPQaa483d5VSUJA8fG6d6YsIx08kA7GRVY+7Dn8IH5K5v0
 Y4yhEOMsqqxE2Lrs04Ykf55fT7+PMtg=
X-Proofpoint-GUID: gLi8mo9rIUBUD0ImrOkEv-kCzQ3BGJXs
X-Proofpoint-ORIG-GUID: gLi8mo9rIUBUD0ImrOkEv-kCzQ3BGJXs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080110
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117594-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:ajay.nandam@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ravi.hothi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ravi.hothi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C660E7259C5



On 7/7/2026 2:11 PM, Konrad Dybcio wrote:
> On 7/1/26 7:43 PM, Ravi Hothi wrote:
>> Enable the sound card on the Eliza CQS EVK platform, including the
>> WSA8845 external speaker path and DMIC microphone capture via VA macro.
>>
>> Enable the required LPASS WSA macro, VA macro and SoundWire controller
>> along with the necessary pinctrl configurations for DMIC and WSA
>> SoundWire interfaces.
>>
>> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +&lpass_vamacro {
>> +	status = "okay";
> 
> 'status' should be the last property (let's also keep an \n before
> it) - file-wide

ACK, Will update in next version.

Thanks,
Ravi Hothi

> 
> [...]
> 
>> +&pm7550_gpios {
>> +	dmic-eldo-en-hog {
>> +		gpio-hog;
>> +		gpios = <7 GPIO_ACTIVE_HIGH>;
>> +		output-high;
>> +		line-name = "dmic-eldo-en";
>> +	};
> 
> Why add a hog if you defined the regulator already?
> 
> Konrad
> 

The gpio-hog is the mechanism that actually drives PM7550 GPIO8 high at 
boot to enable the ELDO hardware. This GPIO enable is required to enable 
the ELDO regulator which is powering the MIC BIAS supply.
The regulator-fixed driver with empty fixed_voltage_ops has no 
.enable()/.disable() callbacks — it cannot toggle the GPIO. The 
dmic_eldo regulator node is needed to correctly describe the supply 
chain to the VA macro driver (vdd-micb-supply) and for power tracking, 
but it cannot control the GPIO itself. Both are needed for different 
purposes.

Thanks,
Ravi Hothi


