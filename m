Return-Path: <linux-arm-msm+bounces-102227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEDHMm5a1Wmu4wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 21:26:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7243B383D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 21:26:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2657B30193B3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 19:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46CA3359FAA;
	Tue,  7 Apr 2026 19:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KjaywABU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NXCDmUyJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC87522083
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 19:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775589995; cv=none; b=GaY/P1xeeo2JmPIktBegzlGeBp0PlloReK73nwFB9mBN6h4TW7aRSzn1estEQfFQo4/SD4/ZjO+hdZtX5HmmU55VGkz+ycprrJ0X9QaNmaPog6kGLyMI2kLZQW+ta7U8RGgoPjaWyBzjtDubw2KGnWf1csoyt10ZXcFu+ataycA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775589995; c=relaxed/simple;
	bh=jU3vGC239+Ohe83blVbPiVY8ipTNtnvpzIusobl4TBs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kF2si17yFEakuv87mdlcRO8DAFA4/OF2bbKB87r/2IExssGMejfNzRf6qJH81J2RSbvEFDsKD9vf23DkqUwMU8powMnq3MemWaOvseRoFDJ0z73vHeBxUVgYT4d3kz972PQll/nZz3DcoaLED6z7iFqaWDeWdrjV+gO+2GdLWAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KjaywABU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NXCDmUyJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637J8BY01005862
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 19:26:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YRe1tFw6XshCfPqTzjTwur7/G8T/aZXCtfVRsh0nIPM=; b=KjaywABU+41cTPa7
	X5HNq5QmgiW0tMqZpEXO2cUYhZtmgXtxdDUzizKUwWv5LTW5IWH0S+07V61cY1a7
	yC6uGZXAXsUQ6XH+5isKbN9BYYeVpklweLxIgTpnVo+le0TRDYO9HmEQ3ccsnRf0
	o6OT79kObbX+AwLWNF1hj6WV0uxrLTwvaLzb71PbNWEVIQqApBHmFd3Nhl3Xl5St
	fxTJ1FklMA70Vg7IOq4+aaSk2uoSuXPSc97dvsZz8lkAfZE6b3G4YFCEylRqgK5k
	PWeKftUe4fXTCjvIETK8qrBGJ2dijGPTvW2ONLbOy2QChK47K5cxWlkOAceXikoQ
	0ON0Wg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd7tp825p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 19:26:31 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b23af7d7e8so151156245ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 12:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775589991; x=1776194791; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YRe1tFw6XshCfPqTzjTwur7/G8T/aZXCtfVRsh0nIPM=;
        b=NXCDmUyJEvsO289Sq78wT/fJJXtxQuft8rOzMDk6H/KxC4rUIvEfAOh/AI4g4AQKdi
         nyo4lX+ueoOyOjJWdQTWwB+SM7mhIXKaWM09S3bAR/YP1Mju8xEfKvj6mbX1jchb6Il8
         zcPM4cZXP2XehU2PUB/GnT0WCKayqBbYq1Dpn9wqWK3PViBVvHDdsUVQLn2++1SOMnRD
         hiiSHkiOZVPixEIii2PfVpkxUNFwgyPa8PxTuKtPqAFp4l6nULsuqPwwvc0ZRI+WTN3i
         Pr7/ORyggIOYGcI34vbY5o0h0kBDs964zB0xRxZb56MbgyQD60Be7L/8RHrfgb/mVebj
         afqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775589991; x=1776194791;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YRe1tFw6XshCfPqTzjTwur7/G8T/aZXCtfVRsh0nIPM=;
        b=g7WRm20vM6VEDHajcnLBxxDDYTdkW+7LupG/yD14PiY+Fug3trJ4ir5AnB7tsbSRRQ
         lyN6hMeR27EIRhmLUQUFzn8/rDGrT5dZtuNaS0nxzfH8z5gMYYQlHx/c5sLuwk783Bsm
         HR0AoyrZ/mi/13YTQHHc7rt6GSE26vGhl7nW/engkCCgoLMIZnZcA7JQSK3eGWfXE1I1
         cLITN5lMCbtRfg7H4bUYcB004LxRVWIQJZ4ToJckO3nf7cWaQ5OCCmZuEPtOkNe1Zo7G
         l8Pk6AOW+fGICLT6vWPearYz6izgx6Yqp9seR5n6wo10LhnH95F4AJ4JjgH7Q4qpCxj1
         rCyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdyd4WXb05ljoebvMwryiaUGwTZhRdP3mB8CrymSVw0uBy+/bMpelOAoDCUuPeaFHgVJALQTUN/3GKm6Zt@vger.kernel.org
X-Gm-Message-State: AOJu0YxD8x/Rx/7fdF0k13ko/135MjhWFw33YpgMcQzW//5JanTq+FfX
	BwaOa9zBLphNuCihVY41GDzpd7uoCwBDjZq7Go45D4U5yc0THKBQLvYERWdFWXE17LvPMv0Pqg9
	NpTvklnSXFm1aDWEQ5ZVgtP3JS2nUp25UCbIzXJjrDUGbjZBhIzfGbWIogt2Zz4R+vWNd
X-Gm-Gg: AeBDiesgcZxNRO3mkXl5P433QKOG1Aw1VRhGY+04R7BEnChVgt2euubww5/Mqw8Mg/x
	M0ZVydcVEXMtBAdGBS1HwWdFor4WJGy9u+aCTnybeSFsb0XqU4AQqajJkzJxsPfyO3hnthUC9pB
	xbJ3VcroBJi1IA2eYMM0p8UlBp4KO4snLlrGH9Cp5s+DFivNlckW+ngOor53kFXnZoDbqYLx8fD
	SEBBqVeqeniIkrmyVDvomj5PM2FGBExmdVJt83ODIxai3xvjcXBx3ilsuPo4912b2LHnaqRBp0y
	WRuqymx0vU4X8UgGOEbjddHzAPVhHXhHHiGR27Xs6QQKXIN33BVicZc4nRP91yw+bT5DwJjTp0W
	Ql9kYzyfaPFCRZEsvcVoTWdJB+66bDCuxxnRTs3/8BR34dA==
X-Received: by 2002:a17:903:2c05:b0:2b2:5840:809c with SMTP id d9443c01a7336-2b281828136mr193199735ad.1.1775589991097;
        Tue, 07 Apr 2026 12:26:31 -0700 (PDT)
X-Received: by 2002:a17:903:2c05:b0:2b2:5840:809c with SMTP id d9443c01a7336-2b281828136mr193199525ad.1.1775589990639;
        Tue, 07 Apr 2026 12:26:30 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.229.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27478b658sm194467505ad.31.2026.04.07.12.26.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 12:26:30 -0700 (PDT)
Message-ID: <6ca53b3e-bad7-44ea-8bbf-d35514262b7c@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 00:56:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 0/6] Add support for Adreno 810 GPU
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
References: <20260402-adreno-810-v2-0-ce337ca87a9e@pm.me>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260402-adreno-810-v2-0-ce337ca87a9e@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6rdER7ye9TGk1BaAtGPNUwn9YL3JTunI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDE3NiBTYWx0ZWRfX2fN5ICnQj/it
 0EJHbIiVqbdFNdD5UC5vwCINOuMYzKZBb8o94GhUqsrRKPadDfdzDRycGwIOkVdykTmTHWiG8GL
 SehRMBpTGNF/O7UuiI8+wGKESK+BDqxNUd6eXFAbEQBhn2zCPyCC/BLa4dYHa9nvxwyeLJehX/8
 o6Mz6m1hx/i9Mx/mX8TNWqa/4lqNbCagfNek/ECQgMudEcOZCvWwvG+w3QR5GfxgPdt8zG3tuwF
 0xbnAGbVCLl6osLvJDC6EK6pbi4AvsiPBtL/n5s1fnJoEs1BsYd1XBLlHl2fvZv14CszF1M7VKL
 HyVaKvZaARwFlgqOqru86DjtuEQb60FC+okbdv5Mbj2E3Hy501GDEGu6SvczVloVyax4j759j3a
 51Ww43fSYCq4YgHqHfXG0sJT0IoWCFhe7u1dolUuZt65IhwyE/1MfBw8UWXkS6M23HxH4oOsmjQ
 wU//eXWrauTk7nHWusw==
X-Proofpoint-ORIG-GUID: 6rdER7ye9TGk1BaAtGPNUwn9YL3JTunI
X-Authority-Analysis: v=2.4 cv=DNS/JSNb c=1 sm=1 tr=0 ts=69d55a67 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=oIjhDLspr5RTlLLUpj0f1A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=6HAHnblGeAPFfXcocwYA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_04,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070176
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[fairphone.com,vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch];
	TAGGED_FROM(0.00)[bounces-102227-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8E7243B383D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/3/2026 4:38 AM, Alexander Koskovich wrote:
> Adreno 810 is present in the Milos SoC and is the first GPU to be released in
> the A8x family.
> 
> Note that the OPP table is limited to 1050MHz to start with as the only Milos
> device I have is limited to that speed in GPU_CC_FREQ_LIMIT_VAL.
> 
> This series is marked as RFC because it depends on a couple other in review
> series, batch 2 for A8x [1] and the GXCLKCTL block for Milos [2].
> 
> There is also currently an issue on Milos with gx_clkctl_gx_gdsc being stuck on
> during runtime PM [3]. The proper fix is to only toggle the GX GDSC during GMU
> recovery, as the firmware manages it in all other cases. This is the same issue
> seen on SM8750 and is being worked on by Qualcomm. Right now I am just working
> around this locally by not collapsing the GX GDSC during runtime suspend.

This fix is posted here:
https://lore.kernel.org/lkml/20260407-gfx-clk-fixes-v1-0-4bb5583a5054@oss.qualcomm.com/

Please mark you series as dependent on this.

-Akhil

> 
> [1]: https://lore.kernel.org/linux-arm-msm/20260327-a8xx-gpu-batch2-v2-0-2b53c38d2101@oss.qualcomm.com
> [2]: https://lore.kernel.org/linux-arm-msm/20260306-milos-gxclkctl-v1-0-00b09ee159a7@fairphone.com
> [3]: https://lore.kernel.org/linux-arm-msm/5409e13e-280c-47b6-a29f-351cb609bc6f@oss.qualcomm.com
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
> Changes in v2:
> - Mark as RFC due to dependency on in-review changes
> - Explain in DTS commit why qcom,kaanapali-gxclkctl.h and not qcom,milos-gxclkctl.h
> - cx_mmio -> cx_misc_mmio
> - Sync a810_nonctxt_regs with GRAPHICS.LA.14.0.r5-03100-lanai.0
> - Link to v1: https://lore.kernel.org/r/20260331-adreno-810-v1-0-725801dbb12b@pm.me
> 
> ---
> Alexander Koskovich (6):
>       dt-bindings: display/msm/gmu: Document Adreno 810 GMU
>       drm/msm/adreno: rename llc_mmio to cx_misc_mmio
>       drm/msm/adreno: set cx_misc_mmio regardless of if platform has LLCC
>       drm/msm/a8xx: use pipe protect slot 15 for last-span-unbound feature
>       drm/msm/adreno: add Adreno 810 GPU support
>       arm64: dts: qcom: milos: Add Adreno 810 GPU and GMU nodes
> 
>  .../devicetree/bindings/display/msm/gmu.yaml       |  32 +++
>  arch/arm64/boot/dts/qcom/milos.dtsi                | 148 +++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c          | 271 +++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |   8 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  44 ++--
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |  14 +-
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c              |  11 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   5 +
>  8 files changed, 493 insertions(+), 40 deletions(-)
> ---
> base-commit: 128d2eccd20bd74fd104b412d949d869aa48f108
> change-id: 20260330-adreno-810-5a47525522cd
> 
> Best regards,


