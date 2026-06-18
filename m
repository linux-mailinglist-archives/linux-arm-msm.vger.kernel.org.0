Return-Path: <linux-arm-msm+bounces-113757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5ge1BGXWM2paHAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 13:28:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC7E69FC10
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 13:28:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Grq9qqTu;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=P7DiIrQk;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113757-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113757-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 163AD301179D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 11:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CD8D3F1AC5;
	Thu, 18 Jun 2026 11:28:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4233E9C26
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 11:28:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781782113; cv=none; b=bRMvzvd70UU23DcXAeExCHxjo25Dp4WddZOJf6y6R2vrjFlPA990n2d1y+YEXdGU29V9AyPY2Xkc5g0FPEqab7uzxJM5KYmJydsEnYtvrPwUjUMw+ae2twubbh5xpjOK+ya2HK4UeVV6WLCTB2Ag8uQujvF6WwmeTzoe7FwPKts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781782113; c=relaxed/simple;
	bh=m6fNSJy3QkAxJP8pAzbB7WkgyCb1W7sL4ipsO1U7nHo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Wbb2mRtFH0bTqdEK7U+zHn3gBiPqiRHRaaR4zs/sNeFodWOT2QWJjP5IW6FiWorS7fCEc4TFw8DCpbnmF+xET2b7pCypKTatNhzzWpQOH/F5tZEJnqX9zr2pV0scvHSkvkA5C0Qjwm3uHgDW6IH+y2fxYbB4Zw2X9kyg33y9iUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Grq9qqTu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P7DiIrQk; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65IAs3Du2612701
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 11:28:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/5h+P94GfQSkUDbb1xQIeOdb8TyPFbx5hbC
	hCvaTXzg=; b=Grq9qqTuS4P+rw7Ci8xC85aFN4JnSV9suYJ9e3IdqtCPirFJHu6
	xrclwg1asPOdmwwxDp+5fllOkJq4DnYC2+bIwJ26AqzvHL8YbgA2VzzIGoZrzx+8
	aeIYvSZhbNmKy6uBOMZQIzm002tuGDDK+LIiRBkjEz5h23lWmeWDkD/woN2FRakA
	QmOW+xxwhRg/ZlvjrdJvWxHJtqyzSjtqaiqgMtDeoepmJRZhYG63WC0+K+hiD3fX
	VsmHVsG/v95Ic1CYw5mhnKts1j3qguk1FrQ5LPOvFtrKSFtaBPwfrRbIDJ3hopFi
	NPSN7uxEcpGnF13Cq2N/o5fqpJo4dajxFzQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euw9vmnbd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 11:28:26 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c6a3ece0d8so6903155ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 04:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781782105; x=1782386905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/5h+P94GfQSkUDbb1xQIeOdb8TyPFbx5hbChCvaTXzg=;
        b=P7DiIrQk1GmrqV+sPSJ5tR0ErBHGJ0t7bcuAHezxuMxmKG2IXJWwB3cp6fDw1B66a0
         qjuZJD8URFkzvofRah+u/9bWcpKoxwP0n3JYvzlx4zkF3ljqHbB087sKkfEweyEb0fSl
         4dQ4R4RB6Eux7jz3WaIDZ3ZNzAeH4vm+fgeaK3JlDCqXd7Y5zIHr4/Sly7R4OCkKJ6r0
         jYvgmjlnxgIezKgfhNpEGrNMzk6ZO7PMAJnWqsJVQ8MeO2ORDNxyLuzva9oP+XQcO25c
         uZNw2MwEroMsp/lqx6r+yR4mK503tEGsWp3N2h6Qi3cUQqQ9FJN6+G2SyJa/UHZZORwe
         2oMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781782105; x=1782386905;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/5h+P94GfQSkUDbb1xQIeOdb8TyPFbx5hbChCvaTXzg=;
        b=PRwFZxDIjOXP6e+IG4ThqDWlahLy7+uRFvLFE7C+HA+4LNz/dnykUB4yHWiPbkQf7W
         L3493XbIP+0KkC/+8dUNxD6l7Q0nYs1CFo6Ly79hjqiwAbBFbo4jPueL8DFasdEh3k6l
         gFrGlTVh2hB1D/n466K/P2ArqfzlzT2KMz+IsJEF3D77wTpMs92QBi8RCR/ED/8/x4oR
         1xP728PGpWpXMqEjkqtuuvwqccrNGSbvWdlOwevvsyzL8xJT9jQy1xKfFyGpctEH/0y+
         mFsJXKB0mvEfHkTBuX8f5sKbZEltgS7p2UCG4HlaoqCAM3BWcZeVO3KYPCf9yQ2+BK6E
         CMkw==
X-Forwarded-Encrypted: i=1; AFNElJ+7uQDzYaFEg4o0O14hPS++JJkEOw0koFnEgQ8T4w7dqAMCPDdbBZewKH0PsXNLzxaQOV7MvCOuFgibzAfV@vger.kernel.org
X-Gm-Message-State: AOJu0Yx149+yoh6vqIiORun/4fxFhqzglo6xMly+MUAwaZNHRYc8RQcj
	aRd8cb/Ijzmv0piuZ5rQgXVzsoImm4aFVJfoe7g6FusFi71Bf7flDiWjxaJ8ISQSAaT4+6NAByw
	42+6kT4iTRmkvI+HgFRx19LQGf2tSA7GjC8PmSuk9REmaHaWe0GV4Sr0Eus1v39fs9Iu4
X-Gm-Gg: AfdE7cmWyGLLdQQw2EaQvSjYJR3vQNkmQs9WR/wyqEuZri4jAyJtPrm7F49ktorfgWm
	ulwOslradh/Z2vQepbTcFbKLkMV6563SQpzRnrAQJY9sSq3zj2Vthh6u8Fe3k9WbwOt8TG7ELm/
	p6Z044tW5kqbKKHbkM4khtJUsABrBDsCjTYybJknig2J/iX+ZMI9cUYf82ElyhL9oI7P8BMDZGo
	vsKfQ6/fwOfnR/OuWFrs50L6WHQb7Qothq7G+D0kIBbMuh4eS+rxFX+RIKt4KnG674CkdnVzZEe
	nzkXsTiDQUclbbhmi6eMXOJy9d6jt/+njWc7H9wHsjH2pZE3VeVYLjay2Dhq3gYvRTE7w0+tBBj
	0dUWukzSBr5N9ot1ofp5dxPv+Pw4wc9McIIy+nhQ=
X-Received: by 2002:a17:902:da8d:b0:2c2:62ee:5a0d with SMTP id d9443c01a7336-2c6bc0bdc32mr81673395ad.14.1781782105298;
        Thu, 18 Jun 2026 04:28:25 -0700 (PDT)
X-Received: by 2002:a17:902:da8d:b0:2c2:62ee:5a0d with SMTP id d9443c01a7336-2c6bc0bdc32mr81673025ad.14.1781782104804;
        Thu, 18 Jun 2026 04:28:24 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327aca9dsm191971965ad.50.2026.06.18.04.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:28:24 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, ajay.nandam@oss.qualcomm.com
Subject: [PATCH v1] ASoC: qcom: q6apm-dai: add carveout SCM assignment for mDSP buffers
Date: Thu, 18 Jun 2026 16:58:10 +0530
Message-Id: <20260618112810.2009847-1-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: IqivFNT3tibGKUA_KKXMsxd0rh932XwK
X-Proofpoint-GUID: IqivFNT3tibGKUA_KKXMsxd0rh932XwK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDEwNyBTYWx0ZWRfX7GINuMgEscEA
 iftiD2fH8ab4QyBusN1ZmzyJAaoXkElbkjbHuZWULuINWP9Hn/SCKHd0JXmSmJbRR3ATRppahBL
 7GgUM/qISuGG2vdD8xwX12LGNUaQ6llH8Q/3H4JovsHk3ycn0bMbiyzIHpNO05GLXFI15ky4u/p
 mCZ9MvWsDktHqFfRjVHW4J6aHLzzF/voQLa+1yG8MQ5qNW7OGGhRmr+1acb8mbuXW/BLAwV347h
 E9iTh/IZjxedZHdjvVK36y5uuTUdMViIaEfx/MgrlCQjkQnz6KCcBjK+orGTe/91r4lsx8RlbHf
 wAe5MxGZVEd9D9maefC9Jj9KPmP1REQkH1dj4gXkd0NVxzUTOgD0KIIYnAHKct6pVIecUbn9Znq
 0Lq055GPXBC93mhkwoWB/rUpyIN2FNXkVQiiO/sAsgai7pk3ntPr9MGwz8fw/OPQRQ3j84uDm6L
 OK1Y2qEJbF7cV2gpqXg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDEwNyBTYWx0ZWRfX+ZY3bGjtmDGZ
 bKNmRGR2JR0Go0+ZlrdNx7ZdEiM+lns5TkaLXtGyl+chxZ7qptV4UwyaDZlJcwCqjiNmwPfyuqF
 ieyfY2S8OffJi+WzNeB7+e8eL+ce+Pc=
X-Authority-Analysis: v=2.4 cv=YJKvDxGx c=1 sm=1 tr=0 ts=6a33d65a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=wSi7XKbgxd81ijyHhsgA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180107
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113757-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ajay.nandam@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9CC7E69FC10

On targets like Shikra where audio processing runs on the mDSP
(modem DSP) instead of the ADSP, the DSP operates with stage-2
secured memory. Unlike ADSP platforms where SMMU-mapped system RAM
is directly accessible, mDSP cannot access buffers unless they are
explicitly SCM-assigned to the appropriate VMIDs. This requires
allocating PCM DMA buffers from reserved carveout regions and
performing SCM assignment to grant both HLOS and the mDSP shared
RW access.

Add support for reserved-memory carveout regions listed in the
memory-region DT property of the q6apm-dais node. When qcom,vmid
is configured, all carveout regions are SCM-assigned to HLOS + the
configured destination VMIDs (RW) at pcm_new() time and ownership is
restored to HLOS-only at pcm_free().

For the data-path region (memory-region index 1), the device DMA pool
is attached via of_reserved_mem_device_init_by_idx() so that
snd_pcm_set_managed_buffer_all() allocates PCM buffers directly from
the carveout. The pool size is read from the DT node and capped at
BUFFER_BYTES_MAX.

All paths are gated on use_scm_assign and has_reserved_mem so existing
platforms without memory-region or qcom,vmid in DT are completely
unaffected.

Depends-on: https://lore.kernel.org/all/20260609064038.492641-1-ajay.nandam@oss.qualcomm.com/
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 207 ++++++++++++++++++++++++++++++-
 1 file changed, 205 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index f3dac2932afe..675cefa96305 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -15,6 +15,7 @@
 #include <asm/dma.h>
 #include <linux/dma-mapping.h>
 #include <linux/firmware/qcom/qcom_scm.h>
+#include <linux/of_reserved_mem.h>
 #include <sound/pcm_params.h>
 #include "q6apm.h"
 
@@ -35,7 +36,8 @@
 #define COMPR_PLAYBACK_MAX_NUM_FRAGMENTS (16 * 4)
 #define COMPR_PLAYBACK_MIN_FRAGMENT_SIZE (8 * 1024)
 #define COMPR_PLAYBACK_MIN_NUM_FRAGMENTS (4)
-#define Q6APM_MAX_VMIDS 8
+#define Q6APM_MAX_VMIDS    8
+#define Q6APM_MAX_CARVEOUTS 8
 #define Q6APM_SCM_MAX_VMID 63
 #define SID_MASK_DEFAULT	0xF
 
@@ -99,6 +101,16 @@ struct q6apm_dai_data {
 	int num_vmids;
 	u32 vmids[Q6APM_MAX_VMIDS];
 	bool use_scm_assign;
+	/*
+	 * carveout regions from memory-region DT property
+	 * (index 0: control path, index 1+: data path)
+	 */
+	struct q6apm_scm_region carveout_regions[Q6APM_MAX_CARVEOUTS];
+	int num_carveouts;
+	/* true when memory-region DT property is present and DMA pool attached */
+	bool has_reserved_mem;
+	/* size of the data-path reserved region, capped at BUFFER_BYTES_MAX */
+	size_t reserved_buf_size;
 };
 
 static int q6apm_dai_assign_memory(struct q6apm_dai_rtd *prtd,
@@ -188,6 +200,103 @@ static int q6apm_dai_unassign_memory(struct snd_soc_component *component,
 	return ret;
 }
 
+static int q6apm_dai_assign_one_region(struct q6apm_scm_region *region,
+				       struct q6apm_dai_data *pdata)
+{
+	struct qcom_scm_vmperm *dst_vmids;
+	int dst_count = 0;
+	int ret, i;
+
+	if (region->assigned)
+		return 0;
+
+	dst_vmids = kcalloc(pdata->num_vmids + 1, sizeof(*dst_vmids),
+			    GFP_KERNEL);
+	if (!dst_vmids)
+		return -ENOMEM;
+
+	/* Always keep HLOS RW so CPU can continue carveout access. */
+	dst_vmids[dst_count].vmid = QCOM_SCM_VMID_HLOS;
+	dst_vmids[dst_count].perm = QCOM_SCM_PERM_RW;
+	dst_count++;
+
+	for (i = 0; i < pdata->num_vmids; i++) {
+		if (WARN_ON_ONCE(pdata->vmids[i] == QCOM_SCM_VMID_HLOS))
+			continue;
+		dst_vmids[dst_count].vmid = pdata->vmids[i];
+		dst_vmids[dst_count].perm = QCOM_SCM_PERM_RW;
+		dst_count++;
+	}
+
+	if (dst_count == 1) {
+		/* Nothing to assign beyond HLOS access. */
+		kfree(dst_vmids);
+		return 0;
+	}
+
+	ret = qcom_scm_assign_mem(region->dma_addr, region->size,
+				  &region->src_perms, dst_vmids, dst_count);
+	kfree(dst_vmids);
+	if (!ret)
+		region->assigned = true;
+	return ret;
+}
+
+static int q6apm_dai_assign_carveout(struct q6apm_dai_data *pdata)
+{
+	int i, ret;
+
+	if (!pdata->use_scm_assign || !pdata->num_carveouts)
+		return 0;
+
+	for (i = 0; i < pdata->num_carveouts; i++) {
+		ret = q6apm_dai_assign_one_region(&pdata->carveout_regions[i],
+						  pdata);
+		if (ret)
+			return ret;
+	}
+	return 0;
+}
+
+static void q6apm_dai_unassign_one_region(struct snd_soc_component *component,
+					  struct q6apm_scm_region *region)
+{
+	struct device *dev = component->dev;
+	struct qcom_scm_vmperm hlos = {
+		.vmid = QCOM_SCM_VMID_HLOS,
+		.perm = QCOM_SCM_PERM_RW,
+	};
+	int ret;
+
+	if (!region->assigned)
+		return;
+
+	ret = qcom_scm_assign_mem(region->dma_addr, region->size,
+				  &region->src_perms, &hlos, 1);
+	if (!ret) {
+		region->assigned = false;
+		region->src_perms = BIT_ULL(QCOM_SCM_VMID_HLOS);
+	} else {
+		dev_err(dev,
+			"Failed to unassign carveout %pa from VMIDs: %d\n",
+			&region->dma_addr, ret);
+	}
+}
+
+static void q6apm_dai_unassign_carveout(struct snd_soc_component *component,
+					struct q6apm_dai_data *pdata)
+{
+	int i;
+
+	if (!pdata->use_scm_assign || !pdata->num_carveouts)
+		return;
+
+	for (i = 0; i < pdata->num_carveouts; i++)
+		q6apm_dai_unassign_one_region(component,
+					      &pdata->carveout_regions[i]);
+}
+
+
 static const struct snd_pcm_hardware q6apm_dai_hardware_capture = {
 	.info =                 (SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_BLOCK_TRANSFER |
 				 SNDRV_PCM_INFO_MMAP_VALID | SNDRV_PCM_INFO_INTERLEAVED |
@@ -716,7 +825,19 @@ static int q6apm_dai_pcm_new(struct snd_soc_component *component, struct snd_soc
 		if (is_push_pull)
 			size += POS_BUFFER_BYTES;
 
-		ret = snd_pcm_set_fixed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, component->dev, size);
+		/*
+		 * When a reserved DMA pool is attached (memory-region in DT), allocate
+		 * PCM buffers from it so the DSP accesses the carveout address directly.
+		 * Fall back to the standard fixed system-RAM buffer on other platforms.
+		 */
+		if (pdata->has_reserved_mem)
+			ret = snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
+							     component->dev,
+							     pdata->reserved_buf_size,
+							     pdata->reserved_buf_size);
+		else
+			ret = snd_pcm_set_fixed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
+							   component->dev, size);
 		if (ret)
 			return ret;
 
@@ -725,6 +846,12 @@ static int q6apm_dai_pcm_new(struct snd_soc_component *component, struct snd_soc
 			return ret;
 	}
 
+	if (pdata->use_scm_assign && pdata->num_carveouts) {
+		ret = q6apm_dai_assign_carveout(pdata);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
@@ -758,6 +885,9 @@ static void q6apm_dai_pcm_free(struct snd_soc_component *component, struct snd_p
 	if (!pdata)
 		return;
 
+	if (pdata->use_scm_assign && pdata->num_carveouts)
+		q6apm_dai_unassign_carveout(component, pdata);
+
 	substream = pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream;
 	if (substream)
 		q6apm_dai_memory_unmap(component, substream);
@@ -1214,6 +1344,79 @@ static int q6apm_dai_probe(struct platform_device *pdev)
 		pdata->use_scm_assign = true;
 	}
 
+	/*
+	 * Attach the data-path reserved memory region (index 1 in
+	 * memory-region, e.g. audio_mdsp_carveout_mem on shikra) as a DMA
+	 * pool so that snd_pcm_set_managed_buffer_all() allocates PCM
+	 * buffers from the carveout instead of system RAM. The size is read
+	 * from the DT node and capped at BUFFER_BYTES_MAX.
+	 * Index 0 is the control-path carveout (SCM-assigned separately).
+	 * Platforms without memory-region are completely unaffected.
+	 */
+	if (of_property_present(node, "memory-region")) {
+		struct device_node *rmem_node;
+		struct reserved_mem *rmem = NULL;
+
+		/* index 1 = data path (PCM DMA buffer pool) */
+		rmem_node = of_parse_phandle(node, "memory-region", 1);
+		if (rmem_node) {
+			rmem = of_reserved_mem_lookup(rmem_node);
+			of_node_put(rmem_node);
+		}
+
+		if (rmem) {
+			rc = of_reserved_mem_device_init_by_idx(dev, node, 1);
+			if (rc) {
+				dev_err(dev,
+					"failed to attach reserved memory pool: %d\n",
+					rc);
+				return rc;
+			}
+			rc = devm_add_action_or_reset(dev,
+				(void (*)(void *))of_reserved_mem_device_release, dev);
+			if (rc)
+				return rc;
+			pdata->reserved_buf_size = min_t(size_t, rmem->size,
+							 BUFFER_BYTES_MAX);
+			pdata->has_reserved_mem = true;
+			dev_dbg(dev,
+				"reserved PCM pool: base=%pa size=%zu buf_size=%zu\n",
+				&rmem->base, rmem->size,
+				pdata->reserved_buf_size);
+		} else {
+			dev_warn(dev,
+				 "memory-region index 1 not found, using system RAM\n");
+		}
+	}
+
+	if (pdata->use_scm_assign) {
+		struct device_node *mem_node;
+		int idx = 0;
+
+		while ((mem_node = of_parse_phandle(node, "memory-region",
+						    idx++))) {
+			struct reserved_mem *rmem;
+			struct q6apm_scm_region *r;
+
+			if (pdata->num_carveouts >= Q6APM_MAX_CARVEOUTS) {
+				dev_warn(dev,
+					 "memory-region: too many entries, ignoring rest\n");
+				of_node_put(mem_node);
+				break;
+			}
+
+			rmem = of_reserved_mem_lookup(mem_node);
+			of_node_put(mem_node);
+			if (!rmem)
+				continue;
+
+			r = &pdata->carveout_regions[pdata->num_carveouts++];
+			r->dma_addr  = rmem->base;
+			r->size      = ALIGN(rmem->size, PAGE_SIZE);
+			r->src_perms = BIT_ULL(QCOM_SCM_VMID_HLOS);
+		}
+	}
+
 	if (pdata->use_scm_assign && !qcom_scm_is_available())
 		return -EPROBE_DEFER;
 

base-commit: df8ed08e768021cfd059d910ba10b2c888beaeb6
-- 
2.34.1


