Return-Path: <linux-arm-msm+bounces-116571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gqN1O8utSmryFwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 21:17:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0E670AF36
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 21:17:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Agg2jxB5;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116571-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116571-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE132303D4E4
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 19:14:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 468DD39FCAE;
	Sun,  5 Jul 2026 19:14:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D3839EF0C
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Jul 2026 19:14:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783278872; cv=none; b=kxx96YAU2CciNqPg23rFTXJ6qMCvo0UGOlN8NR26mw7LhdGgh1v6QBkjvBXkXzBuenA5GLoszhNftMPWKMlbQCvLcL7pzSqPEJLVJT/ESnW6AyB7z1K8ry63RpUUnH4G0pNSqn+4K944So0ONEDEJNMY7Nzhb+YhjsTCjMqDPzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783278872; c=relaxed/simple;
	bh=U1AI7O1BhdkrzXxItW/0XejZckUMlwC4IaAuS4BWmNY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bTCCUFZmYUeoNueONAzVEv2j2GDOh1Deo82vcWq6xuNg26UERbFwgkAJBnqm9lDkPZtcEhO2ukaPLMV5VLjDhZwKvBdSWwLkIaedWIYITD7EPF4M92WpExgV7rjGq8A+2BV8ytVHjHr9Q/E5rMo6r+fnETrgUYq52I6rOQr6uSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Agg2jxB5; arc=none smtp.client-ip=209.85.221.43
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47c6e9a694bso381567f8f.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 12:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783278866; x=1783883666; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RmTeIgN5AtQt28lNx3DVWq0mIIdy+DVEwXhPE9hXVsA=;
        b=Agg2jxB5IlhXlRYo3Gh1DvIdJCTUI1429cPyMjdFgNzObJb7oQPQuZHJWXZVzYQ1pd
         E4mO+4QGppNKgAZzpDb/+vuZaijpR6W252WOd1LNB9RQbu9GhBksSLgDS/fw4Htrwtyf
         eNME0AnRTKTK2iMty/sPvcmAMcmJbgzEq9QpU4SpBOhbE66FLLXHYorcGKF4k1HvAs81
         8+0uBfSOyZMBXz2TYhcwDx3/DLSvY1qKNCNY+zbDY4OEF6iKjfZuIuytVvReFuxSkkU8
         xoAT74ey/kcmOd/01Tt4A7L6A9GoFr/GwrONUHtqxysp6f9HyekmH5Whr+IhSQ1GbT2X
         jKkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783278866; x=1783883666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RmTeIgN5AtQt28lNx3DVWq0mIIdy+DVEwXhPE9hXVsA=;
        b=tETtoeO3kVH9lmQVc4+y48tbf8d/KCIPGpst2CDzby0gZFykcaLbgEGYyuR8bpbmJB
         CGu6IzS5+qnzUn9V5/lR2Kbyqm/+z11FLT5pGOQ7bX3b2zvYokU/iij/SrkDnUZb0FyI
         0e2fBJZbkqdXmRVKnD9qSRdHctBaZgZtO2+AfXa1YHjkxW5SZ121PlJS5E3iXCPu7Fxr
         IBcsu3OT4+2fBlGQV96O4VMlPxLu457uhPSpTg/2w2sde/vfXDERIQS2GdP7TUBEH8ef
         a/200/MHe1PpA1JzSrF4jIGtWZntNkE4Qjt/sLqtLIilm/SEe+uILC42PQzSMywGMVHy
         CzWw==
X-Forwarded-Encrypted: i=1; AHgh+RrN9YlpdG12G6kaU7u18VLqDC27E1qz/GX9mBADKQkW8qd6Xu6CcTHzdoRdxQk9EdcIXwzc2SYb4FbAY+L2@vger.kernel.org
X-Gm-Message-State: AOJu0YwtovtyhxYMo28v/rCnajcIPUR8Lrbny1u2qEQI9NTka/rlqsLe
	Ux1aprb0zopbTdl2RCj9FEni3ORhuftPRZskpH4y81h7eO+M+Hq+5l0=
X-Gm-Gg: AfdE7cmdbJ2Fo4yhekTmmlLCjpFLcZeO8Xqfxmyf/jwTSp1XLyIK/pjWESeKOEC4kO4
	MOnzGErlZUWkEh/lRhUJl7xveW+v7pQI7NkX6QhA6N9OSNZ+a1++JpwiLOIdKUa7YoTE9/WvkHt
	HXIDPPhXeWto+W0gD8BscWs8gaiYIO32kZZXkxklFRiao/ktMMjayWewN2GttuXLIB3oR98Bjzv
	K+PGWV+OXK82fkP5HpqnhPXVZ2t5V/k9LmbmxK7VZe3FRGdsaJSEV/OwdkxRCT47rP96r35SuhB
	AESoJ0rgLOETG2J4Te98yC4F+8T7+R6FTsx+MoV31BEbtDZ56eAaydAVB/xrYOIovgByn2Iy+Oz
	y00xYURoLQ/D1oVoWRsJQSO0E3HAoLPkQJFhvLrtj0vMI9xpP+YVQuekwjtjkgXZmyiTeze6JcY
	7sJ0qx7uCkfmYNEx2jsxgy8nXSy8lrSg==
X-Received: by 2002:a05:6000:46c4:b0:470:3edf:e2a7 with SMTP id ffacd0b85a97d-47aaaec02c4mr5836740f8f.37.1783278865571;
        Sun, 05 Jul 2026 12:14:25 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960634sm19209528f8f.26.2026.07.05.12.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:14:25 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Sun, 05 Jul 2026 21:13:40 +0200
Subject: [PATCH RFC 06/13] DEBUGGING: print contextbank and other ttbrs on
 fault
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-descriptive-name-lpac-upstream-v1-6-01d50c3e0c99@gmail.com>
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
In-Reply-To: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Anna Maniscalco <anna.maniscalco2000@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783278851; l=2450;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=U1AI7O1BhdkrzXxItW/0XejZckUMlwC4IaAuS4BWmNY=;
 b=M+uiiUBR/lmMuad/SAHrKO891VirOTvBs28b6xreWN52s/uXJnTXUgzkAI4/P/yddSN2TXP4j
 AH+AF+T02UICCWBKtKMyVk6fvecJCMlYT6OCGtiT5he3yQ4MXqiVKBI
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-116571-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:andersson@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:iommu@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:anna.maniscalco2000@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:annamaniscalco2000@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[annamaniscalco2000@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,arm.com,8bytes.org,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,lists.infradead.org,lists.freedesktop.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[annamaniscalco2000@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4A0E670AF36

Faults can now come from different context banks so print that
information as well.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 4 ++--
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 4 ++++
 include/linux/adreno-smmu-priv.h           | 2 ++
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index be374cf209f4..6a48e211fa3c 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -329,8 +329,8 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
 	else if (info->fsr & ARM_SMMU_FSR_EF)
 		type = "EXTERNAL";
 
-	pr_warn_ratelimited("*** gpu fault: ttbr0=%.16llx iova=%.16lx dir=%s type=%s source=%s (%u,%u,%u,%u)\n",
-			info->ttbr0, iova,
+	pr_warn_ratelimited("*** gpu fault: cb=%d ttbr0=%.16llx cb0_ttbr0=%.16llx cb1_ttbr0=%.16llx iova=%.16lx dir=%s type=%s source=%s (%u,%u,%u,%u)\n",
+			info->contextbank, info->ttbr0, info->cb0_ttbr0, info->cb1_ttbr0, iova,
 			flags & IOMMU_FAULT_WRITE ? "WRITE" : "READ",
 			type, block,
 			scratch[0], scratch[1], scratch[2], scratch[3]);
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 48a590aaeb5e..ae6152bddf8f 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -136,6 +136,10 @@ static void qcom_adreno_smmu_get_fault_info(const void *cookie,
 	info->cbfrsynra = arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(cfg->cbndx));
 	info->ttbr0 = arm_smmu_cb_readq(smmu, cfg->cbndx, ARM_SMMU_CB_TTBR0);
 	info->contextidr = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_CONTEXTIDR);
+	info->contextbank = cfg->cbndx;
+
+	info->cb0_ttbr0 = arm_smmu_cb_readq(smmu, 0, ARM_SMMU_CB_TTBR0);
+	info->cb1_ttbr0 = arm_smmu_cb_readq(smmu, 1, ARM_SMMU_CB_TTBR0);
 }
 
 static void qcom_adreno_smmu_set_stall(const void *cookie, bool enabled)
diff --git a/include/linux/adreno-smmu-priv.h b/include/linux/adreno-smmu-priv.h
index d83c9175828f..5d6de4b4de06 100644
--- a/include/linux/adreno-smmu-priv.h
+++ b/include/linux/adreno-smmu-priv.h
@@ -32,6 +32,8 @@ struct adreno_smmu_fault_info {
 	u32 fsynr0;
 	u32 fsynr1;
 	u32 cbfrsynra;
+	u32 contextbank;
+	u64 cb0_ttbr0, cb1_ttbr0;
 };
 
 /**

-- 
2.54.0


