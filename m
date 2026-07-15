Return-Path: <linux-arm-msm+bounces-119287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RUZTMdSVV2r/XQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 16:14:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A597F75F3BD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 16:14:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SsJwP2Zp;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XruEIX07;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119287-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119287-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ED5FB306CAE5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 14:12:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B294C37CD5A;
	Wed, 15 Jul 2026 14:10:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBC232B123
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 14:10:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784124654; cv=none; b=SBSWbdBZOMf+2VEERKJYXvzCpFYeZCS0oMvgG5EbWo9426rPjsoUFDTbd32d/KlZ8/6EKO1vM1plBcoN4RheriMHXJit2fXQ6TZ3JfXV8fPpNSbHO85vdnUAG8lMQHdVGxtx5uXge3fIzFKouAVMb4AM7pIYfjDtJOWH7B7/rpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784124654; c=relaxed/simple;
	bh=baQ90teJi7Apuw1DT4Yon0BjJAdFT+yLP4AlGLp6bYg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fwDCsUPEImJ0cEkghGvzsgrw/FghHElN1eAEXuy/y1N+h3TVv2pGCAHUdTLNMKcbuKlkZGPCC8K3VvmJWVpVnunVx7fXVkGtgPPf6mtigOsPVkaqFi6hGQtPWcrDd3zkI9aZtmk7NHink4yzwxc4hMngRucL9LS1DgZ1GLzCYd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SsJwP2Zp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XruEIX07; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FE3Zw13775692
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 14:10:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rrdJsg/xINTNx7WBKUwZo/8lLXCAgU7OCvD1SQztacw=; b=SsJwP2Zpr4BciJEJ
	oKfYxBim4QlDRFxXmpTnxdVzyBOXMQuQWEopHfpLJg1nlY7LWnFyxAyKK+5rmOum
	hQqtI+OMZbE1xDmr3oQCwVZp+EwjQYv03fRMvCetIK152hrZH+qqJnUMYN94oVW4
	4qszCcRtbakyhKlEjLXqz5FLADdSoDLLYx9OKid+y9Shy3ZA+Lzoa8Fly9Om74Jt
	53N/d7L8asau9W5XzySsDnr61Ac3jOKwLeJ71cTBTQEi+6bjUZJ+uY+bSf46L/2i
	c7DyGUJrXUrMPEm3AsNk1aCIrROmPeeso/qnGTJm8XJflnGB9LPVmO1ouqknqzE3
	mOg9Nw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe7ka944k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 14:10:52 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c892143db7fso1992755a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 07:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784124651; x=1784729451; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rrdJsg/xINTNx7WBKUwZo/8lLXCAgU7OCvD1SQztacw=;
        b=XruEIX07Mg7E2OMdAkTGE4BjHOK9bbea/9B4gFlU0pbdvfaZv1PhizLE6HyosGU0gh
         wweo2uPGfaInPuLGOOTe36xZ0jLPNpqGz6FwViM138R4CPUaI67N6uFr2ZU2Kf1/2Fo8
         ZYGmw3MgUnhIK/ivRVrqGkk7xOi/UJuv6v/VRfkTy+Si8ClBIcpPSkO9lgj6Jafdwc+H
         +kmp7bnS4yW24vTfMdr3DoLmrMcRN+WeMVD3b+nBy9BG2J9G4t784wj5/YqU3/r/HOnE
         YDna9AvhtmEgd3YFP+Ay3lG/CFn25FGF0Ltf3feP6ZYWWPmSDLmFa8WpEj052Z7BjJaZ
         5xIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784124651; x=1784729451;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rrdJsg/xINTNx7WBKUwZo/8lLXCAgU7OCvD1SQztacw=;
        b=JLUehbR2Ej50F7ke0U6QUCUqRdmxj/r6SYCl/WSyCBiUSMGxJAViJtckjB1KEWRp3Y
         wWO+d3sxkRIxQWRssUX4KQuQix0Ul3UtRww+UVq/eILsxebkDMPeWWfrJPorybLgjDF4
         S7G0DTbnaMY2CKeG/IZvXRZvR/S4/KnKjAgF+IyxWBLuZOEiHezW8HubBxFwW6B10tBZ
         /dFndqlpdmolCnYQWGkp3tCBGMZ0hSwpiwiVxYI+9bckhOs9Ae+/fSJKrHU1mFHUpIxB
         xiNvRzvv7SOpv51MjpUlU7fwSCZbFKpv4LQTppWs8ckhAj8K1akkQrCxa87tjySW2VL2
         HyTQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq3BVXNrnEJdm4iFw1UHJ082lDS97QoeYF2Fw6Ju+IPV/ROWf4aQb1mIgt9WsCSRXv9SLVgwbfCroKa1dFG@vger.kernel.org
X-Gm-Message-State: AOJu0YwQjtxxXyS287o8zW7RdTTiolhsnPX50Va+HmfLRBrzL0gbJnmI
	bT7dYU7swd5ojrGuimVjpL2HCrRlkAitvddPTCmXAS7tBYFfwBAJj3wfY4OQBhHfUfhDZK/EbQx
	kn/ItF/npNG/Oh2epg7AR/oC/aLv4l1IT/bCCnAZJirq61fevgAnzzgjh4RDn1xnK8V/imfzwz7
	RA
X-Gm-Gg: AfdE7cn2xQF8khD9iTGpz7SUkXL8dUHu4EJkbJNf8hW5+QbE1yoHkSfxFm0lPZD/rob
	CvvS1EoQ2+9+oi6Orqw0GQ3iLCYxd7Ro6o+F0HS0ioUUv7mz+f7T0xOinnRACD0wf1EJ4DOWrtQ
	5z1SC/57adzkSmgKDPCwoCEA1gyxhwiaevIhYxlozXmGKHDUhUgbxsZg6g4WObjrk8TnFCmhp2X
	9FFLLmD3/fTw//qpf+CqYFBG4mOmVQCLe6IDlJuZn60x5PVCOf7Y9nXzYDJdQ6UuQIqBU0h1GVo
	jC2uedBCbTGpVa/xz13Rj5JaD6Wt1fSa3cpOuPSgmnPVGc22LixaJcWiqT/xDoXQs/L1kAdJq1S
	OKLnNeQ+rFnPH9iA68Wm9jRCnX0R1oEqb75nW3pbCA/Et
X-Received: by 2002:a17:903:388c:b0:2cc:9773:1313 with SMTP id d9443c01a7336-2ce9ebf84f7mr162566915ad.11.1784124651287;
        Wed, 15 Jul 2026 07:10:51 -0700 (PDT)
X-Received: by 2002:a17:903:388c:b0:2cc:9773:1313 with SMTP id d9443c01a7336-2ce9ebf84f7mr162566465ad.11.1784124650754;
        Wed, 15 Jul 2026 07:10:50 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf1070b68dsm2913215ad.79.2026.07.15.07.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 07:10:50 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 19:40:00 +0530
Subject: [PATCH v9 06/14] media: iris: Enable Secure PAS support with IOMMU
 managed by Linux
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-glymur-v9-6-8cf2cbe12a07@oss.qualcomm.com>
References: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
In-Reply-To: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784124602; l=7611;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=Wuzgz1rzYvmDPB16a5Puzh+s48WQEHTanWtzd6CqHlE=;
 b=odkLVJ4nr2zh2Z+CcxNiUkSjlLIjbEJAXhQ1GWbxqSD1k9DkP4ivWYWIYf1kfAlbH2uZ6Q8y7
 arzPAi5rPLwAw8+W8GONX/QbpMg2zWInOYrEwk1O9HXmrc+jEcvSA4/
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=TMF1jVla c=1 sm=1 tr=0 ts=6a5794ec cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=U8OLdchxA3Z7P0hrdlYA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: xnz3TItIledQvsc8vGnYEdmbX4l8Fo2E
X-Proofpoint-ORIG-GUID: xnz3TItIledQvsc8vGnYEdmbX4l8Fo2E
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDE0MSBTYWx0ZWRfX8zIS+6dudg0R
 gJo/GI2gRjcPRZFZyUccdZEOU4/5BYLRJPbwdOBitC18UqmrRLQXfWRLOD0coBOAHWUVmzpVaab
 N7rJDXJhv09wkZn37dNVutA4hfJvrRs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDE0MSBTYWx0ZWRfXwW8xcLy/FbUJ
 8S25CzqH+f15qXHeyrK6cSSWklaRwEQJHsiPhmf+8r4gOi9AxIA7oVtkbAh3rQ8WmTa8KDyUfBb
 1/BdX7ie7tQjFNIesUy0+p8Cp/6EN9bMmlFAqByFf9oKJphhoACEwuqEM5tMmAV/Z+RvfexE/1N
 vQ5FvmWs1LkG/yjruP0AV7G2koP/GYgRkvqvnBPhEiHcx4PuK3pjYHWX5Olbrzqui4E9WSjF8YB
 HYGFWd3Nr0jJ6mu342D1NWEaVeG0jgCtg4GnWbn5KcGwZpMcXBrgR7peGJ5oTgE0BXjjiAktRnp
 zjMXFiac2gHLT39ebaXJNeoYv8iw2PxJnJW05i9m0km5WKREvwf4rm1spJwFvbB9xEYFVOw3Wag
 L99+4E8eI46SSs+Yrwb2itNxTfBlEPzaazp4awQDDUkVHvTTTTrqUha7t39gNfjfqBUkHuTOB4t
 v3VRGnlVCWJBVQFuqCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150141
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-119287-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:mchehab@kernel.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:stanimir.k.varbanov@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:mukesh.ojha@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:stanimirkvarbanov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A597F75F3BD
X-Rspamd-Action: no action

From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

On platforms where a hypervisor is present, all Secure Monitor Calls
(SMC) are intercepted. For qcom_scm_pas_auth_and_reset(), the hypervisor
registers a Shared Memory (SHM) bridge over the Peripheral Image Loader
(PIL) memory region so that TrustZone (TZ) can access it, forwards the
authentication SMC to TZ, and upon return maps the PIL region and
triggers the co-processor bring-up sequence:
HLOS -> Hypervisor(SHM setup) -> TZ(auth) -> Hypervisor(map+reset) -> IRIS

On platforms without a hypervisor, Linux drives these steps directly.
The SHM bridge infrastructure required for this is already upstream [1].
To isolate firmware memory in its own Input-Output Memory Management
Unit (IOMMU) context, a dedicated stream ID (SID) is required, tied to
the firmware function ID. This SID is specified via the iommu-map
property in the device tree using the firmware function ID as the lookup
key. A firmware device is created and mapped to this SID.
The presence of a SID mapped to the firmware device via iommu-map is
used to detect whether a hypervisor is absent: when the firmware device
has a SID mapped, Linux manages the IOMMU directly; when no SID is
mapped, a hypervisor is assumed to be present and these steps are
skipped.
Extend the Iris driver to support Secure Peripheral Authentication
Service (PAS) on platforms where Linux manages the IOMMU, by creating
the firmware context device and performing the necessary IOMMU mapping
when the firmware device SID is present.
[1] https://lore.kernel.org/lkml/20260105-kvmrprocv10-v10-0-022e96815380
@oss.qualcomm.com/

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Co-developed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Link: https://lore.kernel.org/lkml/20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com/
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.h     |  4 ++
 drivers/media/platform/qcom/iris/iris_firmware.c | 73 ++++++++++++++++++++----
 2 files changed, 65 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index 3c96f46cf567..5ed2ec0b97ec 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -38,6 +38,8 @@ struct qcom_ubwc_cfg_data;
  * @dev: reference to device structure
  * @np_dev: reference to non-pixel device structure
  * @p_dev: reference to pixel device structure
+ * @fw_dev: reference to firmware device structure
+ * @pas_ctx: PAS context for authenticated firmware load and shutdown
  * @reg_base: IO memory base address
  * @irq: iris irq
  * @v4l2_dev: a holder for v4l2 device structure
@@ -85,6 +87,8 @@ struct iris_core {
 	struct device				*dev;
 	struct device				*np_dev;
 	struct device				*p_dev;
+	struct device				*fw_dev;
+	struct qcom_pas_context			*pas_ctx;
 	void __iomem				*reg_base;
 	int					irq;
 	struct v4l2_device			v4l2_dev;
diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
index 1a476146d758..56c477b36b61 100644
--- a/drivers/media/platform/qcom/iris/iris_firmware.c
+++ b/drivers/media/platform/qcom/iris/iris_firmware.c
@@ -4,7 +4,9 @@
  */
 
 #include <linux/firmware.h>
+#include <linux/firmware/qcom/qcom_pas.h>
 #include <linux/firmware/qcom/qcom_scm.h>
+#include <linux/iommu.h>
 #include <linux/of_address.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/soc/qcom/mdt_loader.h>
@@ -15,11 +17,14 @@
 #define IRIS_PAS_ID				9
 
 #define MAX_FIRMWARE_NAME_SIZE	128
+#define IRIS_FW_START_ADDR	0
 
 static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 {
+	struct device *fw_dev = core->fw_dev ? core->fw_dev : core->dev;
 	const struct firmware *firmware = NULL;
-	struct device *dev = core->dev;
+	struct qcom_pas_context	*ctx;
+	struct iommu_domain *domain;
 	struct resource res;
 	phys_addr_t mem_phys;
 	size_t res_size;
@@ -30,14 +35,21 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 	if (strlen(fw_name) >= MAX_FIRMWARE_NAME_SIZE - 4)
 		return -EINVAL;
 
-	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
+	ret = of_reserved_mem_region_to_resource(core->dev->of_node, 0, &res);
 	if (ret)
 		return ret;
 
 	mem_phys = res.start;
 	res_size = resource_size(&res);
 
-	ret = request_firmware(&firmware, fw_name, dev);
+	if (!core->pas_ctx) {
+		ctx = devm_qcom_pas_context_alloc(core->dev, IRIS_PAS_ID, mem_phys, res_size);
+		if (IS_ERR(ctx))
+			return PTR_ERR(ctx);
+		core->pas_ctx = ctx;
+	}
+
+	ret = request_firmware(&firmware, fw_name, fw_dev);
 	if (ret)
 		return ret;
 
@@ -53,9 +65,23 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 		goto err_release_fw;
 	}
 
-	ret = qcom_mdt_load(dev, firmware, fw_name,
-			    IRIS_PAS_ID, mem_virt, mem_phys, res_size, NULL);
+	core->pas_ctx->use_tzmem = !!core->fw_dev;
+	ret = qcom_mdt_pas_load(core->pas_ctx, firmware, fw_name, mem_virt, NULL);
+	if (ret)
+		goto err_mem_unmap;
+
+	if (core->pas_ctx->use_tzmem) {
+		domain = iommu_get_domain_for_dev(fw_dev);
+		if (!domain) {
+			ret = -ENODEV;
+			goto err_mem_unmap;
+		}
+
+		ret = iommu_map(domain, IRIS_FW_START_ADDR, mem_phys, res_size,
+				IOMMU_READ | IOMMU_WRITE | IOMMU_PRIV, GFP_KERNEL);
+	}
 
+err_mem_unmap:
 	memunmap(mem_virt);
 err_release_fw:
 	release_firmware(firmware);
@@ -63,6 +89,18 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 	return ret;
 }
 
+static void iris_fw_iommu_unmap(struct iris_core *core)
+{
+	struct iommu_domain *domain;
+
+	if (!core->fw_dev)
+		return;
+
+	domain = iommu_get_domain_for_dev(core->fw_dev);
+	if (domain)
+		iommu_unmap(domain, IRIS_FW_START_ADDR, core->pas_ctx->mem_size);
+}
+
 int iris_fw_load(struct iris_core *core)
 {
 	const struct tz_cp_config *cp_config;
@@ -77,13 +115,13 @@ int iris_fw_load(struct iris_core *core)
 	ret = iris_load_fw_to_memory(core, fwpath);
 	if (ret) {
 		dev_err(core->dev, "firmware download failed\n");
-		return -ENOMEM;
+		return ret;
 	}
 
-	ret = qcom_scm_pas_auth_and_reset(IRIS_PAS_ID);
+	ret = qcom_pas_prepare_and_auth_reset(core->pas_ctx);
 	if (ret)  {
 		dev_err(core->dev, "auth and reset failed: %d\n", ret);
-		return ret;
+		goto err_unmap;
 	}
 
 	for (i = 0; i < core->iris_platform_data->tz_cp_config_data_size; i++) {
@@ -94,20 +132,31 @@ int iris_fw_load(struct iris_core *core)
 						     cp_config->cp_nonpixel_size);
 		if (ret) {
 			dev_err(core->dev, "qcom_scm_mem_protect_video_var failed: %d\n", ret);
-			qcom_scm_pas_shutdown(IRIS_PAS_ID);
-			return ret;
+			goto err_pas_shutdown;
 		}
 	}
 
+	return 0;
+
+err_pas_shutdown:
+	qcom_pas_shutdown(IRIS_PAS_ID);
+err_unmap:
+	iris_fw_iommu_unmap(core);
+
 	return ret;
 }
 
 int iris_fw_unload(struct iris_core *core)
 {
-	return qcom_scm_pas_shutdown(IRIS_PAS_ID);
+	int ret;
+
+	ret = qcom_pas_shutdown(IRIS_PAS_ID);
+	iris_fw_iommu_unmap(core);
+
+	return ret;
 }
 
 int iris_set_hw_state(struct iris_core *core, bool resume)
 {
-	return qcom_scm_set_remote_state(resume, 0);
+	return qcom_pas_set_remote_state(resume, 0);
 }

-- 
2.34.1


