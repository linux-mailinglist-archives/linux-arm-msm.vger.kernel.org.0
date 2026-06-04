Return-Path: <linux-arm-msm+bounces-111265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XmB8IL/cIWpUPwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 22:14:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B35643283
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 22:14:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="DAcVTu/Z";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=U+di4EAy;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111265-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111265-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C9E1B3077729
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 20:10:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 021BF367B90;
	Thu,  4 Jun 2026 20:10:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC01C3AD503
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 20:10:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780603829; cv=none; b=iAMcFLYdw78gPVXReM50gQmMjEX93sjivEWYziTEbVkTbUXjJGbsfCsNnntv5oCpHZDaFEo1yHGWEL84IYXVwxdIRlu9imu+x9yKkujl4M3kr85wFL9pXdDUWB7hr1nNGnxKWINFSABYsWkl2IG7JqqmGXX8jmuBdRJpVtMQnyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780603829; c=relaxed/simple;
	bh=0JtUaQvboU3d5FZGjs2lXGu+/oyb3FPNWrHbhX/nIu8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DtCA4LEtEjZSrmffhxP46/buHtP5dkxOzdOudUw0qLJE2mXJJQ3RsrYYrNMBZJP6bmDv14UY+uKNy7Q3oG5aXMVx0flSKZJH49XUGZaCx34VqHLRwlfVkRqYuK9Bc3M1bPaapVbTBQpJdVzOfdqkcLKnIoe2w3UPgZ3y/wpi7EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DAcVTu/Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U+di4EAy; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654JnvVI3111633
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 20:10:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d1LOKmeWCklvB1wmRVCwZ81uqYX7Kq6ssXn3ZHjkSh0=; b=DAcVTu/Z9OlhPpun
	94V4DwJbaIGHP/fLh1hipVBMmcLRLxBXvfdQt3hnj+jvjwIkApN+yOxICE3ISDtv
	djyL12gvDf5Na7wT6SQFbX7IawSsJEwfVKt8DzdoNLRIAFrapqweMH6r2Jl2Fo+N
	P5TERCMynl0eC+T5X4CCYArbosk+4nr7S/2+Z5mUmW7ysF9qfAezur27SKnwLbwb
	PwE7cr7PVkqTDhHzWEpVavYxDDiTcYqw8huIkDW2J29dC3DP5cn3h+Dnsg+KPKQu
	tKsSKvqF6/zz4C3VK9CJLGLNsRQOpjGsEBY+2Tgr5f/yDHWuYReFexiPFLiL6Dlx
	XOu6Ow==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekfv702q1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 20:10:27 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85798977dcso805078a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 13:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780603827; x=1781208627; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d1LOKmeWCklvB1wmRVCwZ81uqYX7Kq6ssXn3ZHjkSh0=;
        b=U+di4EAyJXxeOTZr8skk9P4bPz5vgzIkCm9xPDRBmiLSjmDCsJ5lQy1XcLY5gJDVqo
         J370EMHLqWljv93hF3aPRwm8n7fND6tfXB8yOJuO9fqCK/Lgni5QT5di9NKc3bn3GS0C
         IGk/sq8vZjR4gGiH3tRujkoN+pNCq7NDS0LeFKt3Nb/tYA2JaLBvuJGjYMdFcxZZdHt/
         oJIpJecGMcqoSaUA4qyD3E9bdksga0ph6QLBhW1vnwxjNwkWq/0gv92bllJvXOkjaQou
         BD/c82yosg1dPqabvFn3kgbvPRpZEUfduSLQyxZTGHNsXncfGVis0EBAX9OLC1ESwxbu
         EtHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780603827; x=1781208627;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d1LOKmeWCklvB1wmRVCwZ81uqYX7Kq6ssXn3ZHjkSh0=;
        b=XPM3AADLOGDjoxoykrXnvxtarkOYglwQ71j1eBAAuRgzLwMCS9r5aQYld3vU5jmlOh
         aNsKnyIckAHZWYil6vkQG/eR4NqvY6RopPIwET3B7/8AyOsMOiGMMeiJG5Nvjk25e/cS
         +uAGxw8jK3cyJvzuO1AVlJXvBwg+EY4NBXtNo7H5cebG0uz1Yat/J33ktfYq+NsczRTK
         GLOEJifpQnQTqyr5NiICxZVn2MGjiqAoaR6x20o01WkrQcbYS7OthkSSF964Or71FOvV
         +EOQ/EHQyYv14gYsdJqaWM/cRjgaqDmsrZ9H2Z0HgSwM0in5Bm57EpmOhqyX3GyxJ2lz
         /XQg==
X-Gm-Message-State: AOJu0YyFIK6fefTbXvFNDOsScNaZz0Pwu/p6qldnOoBsC3a8VWJvkJT1
	TlgA/4Pa223bM4il3JMRLaaDTBR8UXzModdp2tnuNCt3d/WlyNnDukCDPgSJBIWOsDZK52YIEha
	/90aaxLuF77QWZwnSsCUYG3cJgyh6Q9HX/aWzluSyfqvgmlhEIWq+KFZ3Ca7OjzCzFcqe
X-Gm-Gg: Acq92OG5VGilyhXFY61MXfkSUzz6eqQd0wyzh1YGaHq+NPZQbgK1iQi7IUTmggPqZw8
	p5MoqqCNw1+aUbOpjG0bPjFJcwUORMlYEDCxFX+uEk4ZUDFab95KQUWFqA6903A6tv6ZO4zpMSq
	kUDEP4HcDbxkWHtnGfZi+SUi2PXzyLzCuMq0RqZT+YDz6aL1b7eNV5N6e+yCm+qJCXGFhxg6VRb
	G1QcdCmCabGbuaB2KHtsApqm98cgVFj28HR1UON+C0+uulQqZV6fs1VnXzAWlkk0MtZMUHlUYzF
	Y6n3Ay48lQdGkCc9H/akxQIUuUerT6Zc3u7ZVMRTllXBMEtSckAziIam6E14Ko21r/eJhQ7cZd/
	yjGQIHUn9fGkRtLpgNIKo1CVPkFUGW4WmRSRKYGO+iIDpPojKfK7J/ShK
X-Received: by 2002:a05:6a00:4390:b0:842:6a3b:60ea with SMTP id d2e1a72fcca58-842b0fbbb03mr218426b3a.40.1780603827118;
        Thu, 04 Jun 2026 13:10:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:4390:b0:842:6a3b:60ea with SMTP id d2e1a72fcca58-842b0fbbb03mr218394b3a.40.1780603826637;
        Thu, 04 Jun 2026 13:10:26 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428290067dsm6721425b3a.53.2026.06.04.13.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 13:10:26 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 05 Jun 2026 01:38:20 +0530
Subject: [PATCH 4/6] drm/msm/a6xx: Fix A621 GPUCC register list for state
 capture
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-assorted-fixes-june-v1-4-2caa04f7287c@oss.qualcomm.com>
References: <20260605-assorted-fixes-june-v1-0-2caa04f7287c@oss.qualcomm.com>
In-Reply-To: <20260605-assorted-fixes-june-v1-0-2caa04f7287c@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>,
        Jie Zhang <quic_jiezh@quicinc.com>,
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780603799; l=3134;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=tSqg6MXJBXS7dUIh0h2uqjrVYJ/YB9NP37NGGPXAuYY=;
 b=6PwCHeX/RE9aoAgTAtoWXZ2Zk7LDsArqadG9cXOU0KlksNYRsDwRIrOwz4MDZ0LQcHMOqdGqP
 M6QWCLhg6pTDw6BSMoNDfyadY/C5BK4iuY0lk9A+DSeJb8FqRyJSamN
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: ULk9cvoBkmV5tS_lYh6XdriJzs-WUQFp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDE5NyBTYWx0ZWRfXznJUdUTiqCsS
 SFOgh7j/EiXk0/q4NeJ0wChIE3qr3+Ry3unE/Ggv6JD1j44YW0RSbjmZs/EE0O5uESQheAoq5mQ
 JoDHo+Ypw5lCylaQbtdmc27AdZUmg0xeE3FbLd5fuQzFNHYZavsKzS5gXbUMBSXJO6nIR3lMjUN
 uUzhHNSNANtfKo/M1moXYNFu8U8FgKtP56BrB2Ouw/ypTMS5l/JIrXPfinZ5W0dCTsjm/bOj6VG
 EhXdIocxbGAbuVo+n6olmNN55/MhrpgTBTBn6w2GVhD/PFLiHlvsQsRhagrPx5p6nXfkxoaq0w4
 j2ePDq6SjTHIKlAJo5hYSJuwRW9WbKS8Y+fsKeXyVZdZ2kGChoGBI515zII2zqkG01+nAfZP62c
 N4d7lqbyOmwvf/dmo+Tsut/wTiWocDFJg5uPCxaXcF/3XqEJHuMm5UYKnfPhWc79lOoZ3evPClr
 k0V3fHsqGblDAvr+DZg==
X-Authority-Analysis: v=2.4 cv=JNULdcKb c=1 sm=1 tr=0 ts=6a21dbb3 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=PA11-Dht09vKeR9g0aoA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: ULk9cvoBkmV5tS_lYh6XdriJzs-WUQFp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040197
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111265-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:quic_pvgtejas@quicinc.com,m:quic_jiezh@quicinc.com,m:mcanal@igalia.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:akhilpo@oss.qualcomm.com,m:jie.zhang@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,quicinc.com,igalia.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D2B35643283

From: Jie Zhang <jie.zhang@oss.qualcomm.com>

A621 uses an incorrect GPUCC register list during state capture.

The existing list matches A623/A663. Rename it accordingly and add a
dedicated A621 GPUCC register list.

Fixes: 11cdb81b3c1b ("drm/msm/a6xx: Fix gpucc register block for A621")
Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  7 ++++---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h | 12 ++++++++++++
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 2a62a22077f9..3ea8ff8c7404 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -1244,11 +1244,12 @@ static void a6xx_get_gmu_registers(struct msm_gpu *gpu,
 	_a6xx_get_gmu_registers(gpu, a6xx_state, &a6xx_gmu_reglist[1],
 		&a6xx_state->gmu_registers[1], true);
 
-	if (adreno_is_a621(adreno_gpu) ||
-	    adreno_is_a623(adreno_gpu) ||
-	    adreno_is_a663(adreno_gpu))
+	if (adreno_is_a621(adreno_gpu))
 		_a6xx_get_gmu_registers(gpu, a6xx_state, &a621_gpucc_reg,
 			&a6xx_state->gmu_registers[2], false);
+	else if (adreno_is_a623(adreno_gpu) || adreno_is_a663(adreno_gpu))
+		_a6xx_get_gmu_registers(gpu, a6xx_state, &a623_gpucc_reg,
+			&a6xx_state->gmu_registers[2], false);
 	else
 		_a6xx_get_gmu_registers(gpu, a6xx_state, &a6xx_gpucc_reg,
 			&a6xx_state->gmu_registers[2], false);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
index b49d8427b59e..0a13a65f89ac 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
@@ -377,6 +377,17 @@ static const u32 a6xx_gmu_gpucc_registers[] = {
 };
 
 static const u32 a621_gmu_gpucc_registers[] = {
+	/* GPU CC */
+	0x24000, 0x2400e, 0x24400, 0x2440e, 0x24800, 0x24805, 0x24c00, 0x24cff,
+	0x25800, 0x25804, 0x25c00, 0x25c04, 0x26000, 0x26004, 0x26400, 0x26405,
+	0x26414, 0x2641d, 0x2642a, 0x26430, 0x26432, 0x26432, 0x26441, 0x26455,
+	0x26466, 0x26468, 0x26478, 0x2647a, 0x26489, 0x2648a, 0x2649c, 0x2649e,
+	0x264a0, 0x264a3, 0x264b3, 0x264b5, 0x264c5, 0x264c7, 0x264d6, 0x264d8,
+	0x264e8, 0x264e9, 0x264f9, 0x264fc, 0x2650b, 0x2650c, 0x2651c, 0x2651e,
+	0x26540, 0x26570, 0x26600, 0x26616, 0x26620, 0x2662d,
+};
+
+static const u32 a623_gmu_gpucc_registers[] = {
 	/* GPU CC */
 	0x24000, 0x2400e, 0x24400, 0x2440e, 0x25800, 0x25804, 0x25c00, 0x25c04,
 	0x26000, 0x26004, 0x26400, 0x26405, 0x26414, 0x2641d, 0x2642a, 0x26430,
@@ -402,6 +413,7 @@ static const struct a6xx_registers a6xx_gmu_reglist[] = {
 
 static const struct a6xx_registers a6xx_gpucc_reg = REGS(a6xx_gmu_gpucc_registers, 0, 0);
 static const struct a6xx_registers a621_gpucc_reg = REGS(a621_gmu_gpucc_registers, 0, 0);
+static const struct a6xx_registers a623_gpucc_reg = REGS(a623_gmu_gpucc_registers, 0, 0);
 
 static u32 a6xx_get_cp_roq_size(struct msm_gpu *gpu);
 static u32 a7xx_get_cp_roq_size(struct msm_gpu *gpu);

-- 
2.51.0


