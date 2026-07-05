Return-Path: <linux-arm-msm+bounces-116568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Uxr/LXKtSmrZFwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 21:16:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDB170AEFF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 21:15:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Bat8PQbw;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116568-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116568-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E5B71302927B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 19:14:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A900B39FCDD;
	Sun,  5 Jul 2026 19:14:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA38337DAA9
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Jul 2026 19:14:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783278862; cv=none; b=Y2FqaJb0d/xPRuzm88hA5qYGnuTIeiOcZZnxqO4t2l1fmcM3B3rxlwztV1xPkSCepMOO4CoyoxYEK2Ps+i+j+HfDKJIzm2tUj+A3AOWXQW9jR8UGUE1wpRyC6wzqstDEVKlSPNBkWRDE8sFnfj7ZC/FLy2iiGoWiZJBoeFE3nb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783278862; c=relaxed/simple;
	bh=bbKLUcBLFub1tb5TatUPZPAkNtWF5490OkNoXJdO3Uk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mtPOqFepSFG719BotUnHz9GP+UTesSPHFxVZda+WcW2h3hzdVWQAYRxsjFUP2T3FRcG/CFO3jvSbBwHstKWDyIFo4g3DeZq0pmYszXHEdcU5adOVbBxww2KP9UON/uDonBEo6KQOOVfAn/8K8nxflOVJS0K/CZHKdwfEf4XzW3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bat8PQbw; arc=none smtp.client-ip=209.85.221.51
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-471eeac43bfso2560336f8f.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 12:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783278859; x=1783883659; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zDQluHb0hl8HpKdUOUtAwKScA61PoZ6/9MDK96/p22Q=;
        b=Bat8PQbwE3k4HgVVMEDBJsVnSgAfJgyAGPFvHXE9lneEOM87MDsI9VSeovc05LTdcv
         eGGvE8FC8uKHKjzMz6/s2vZDxNVk0VHemnJzb8fHV0crhB61tXaSptYsgsxabLBCgT4B
         iMfRBKzULA4RMgkBUHMrx+iMAGD/AaBIuVKg1oR/YLn4EFOroVBib2fGcioQ0mptJM+f
         DM4EtPq2gQfWqEGUaq4WPHtLRj5pOzzBD7cfk8ULPiPY6SRoTMxkVPYLZQ2CuqfNBAU7
         6TbL5RCk+R5f8K4VB3pN7klqkaDP2CEJC2/5cP1kW5TeouFtx8zEXrZZ5rFJDto7aGAY
         g60A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783278859; x=1783883659;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zDQluHb0hl8HpKdUOUtAwKScA61PoZ6/9MDK96/p22Q=;
        b=bbbzis0HgKDTukcYY667Ud6aECP9UyW0KcPseCd4sAKMlV13AeJdwP3L/ICH7KWI/E
         6ffzu76P1rPGO/mj+/QBpLU0zh7cZqB7E3iRB8V0gjscsIYQ2gqYInMwy4Swj1Vg9xqm
         Xyldsw+BjGK7pKqu0RNFHy2TVWDRw4uzj0LMylLVRmG0SIck4EXCfTEiFxinAMq431PL
         Q5LQF9xFu5Q0XTF8nS97J6IKYLchTUI+MCKpb1l3OjWd48kIDF+lKk6gcCjsc0zw9nIN
         4MlvpUrMMGAzblwM5jJGJ3/M3jSi/kPQ+TXO2Kfvsaiy+cwUJ+PpLoYTQ3dbI9GgD0yN
         ZYBA==
X-Forwarded-Encrypted: i=1; AHgh+RoWOxLxeSCGxCFKUUxLK1wgAEsRay65s6IXzhrDwPL1A6TQkTezh8gZLrlDMSfgyOVyTndZi4Yms+u4x6oc@vger.kernel.org
X-Gm-Message-State: AOJu0Yxtd3QujLWXnkGQtmFwcjFUuUUsuOuHHZujKHF+8A8anQZ2jJBL
	yC/lfNyYChrbGpmAnMkX/zqupCTH8ZTHc4+yBYl3x8Bpndl1DyZGgTY=
X-Gm-Gg: AfdE7cnGF9YJ6nOJP58o80hz56jRadxp4hGBdLWYvtsYgmiwuR0DTftIzCVNxTJQKUU
	kv/D0hOcVQ4lcAjkT2D2TNeTS0BEuu/+aYuHMkcOU3u0A8ct7/nfae5iQ9lyMMTJ6NqjfQ6AKpR
	JYYkFZOG9Mx3IyQUr7+pXUbbaMKLqnKoXoPNBEJ1FRJtn0ZMKQZ6ziqYA8HiYhLJz5kmRtcagLd
	9ryREYjMZmkwSov2C4ts//c4yeTkuUyEwosSsS8cNM9+NS/JnEDO+aRffdHTllAkJzE5gDYtwOu
	IC29JswV5CE0IEeEzkMhC1B2ycyrCM+zVwzO/jT0jrhDwy7FISHIXQ2ab3d917YjVIVRxrrNgHJ
	8WzPwswndAGjIxOMa7IT0+W4vJwB2scKktwYZDHUMdw0ba/MA2Hq+Gp7ctKPifhfB2wyKMG7RQk
	un5C5CWeREhfstDhVADarFLdAKab1BbA==
X-Received: by 2002:a05:6000:41e2:b0:46f:ca9:465a with SMTP id ffacd0b85a97d-47aaa60d512mr9236488f8f.21.1783278859133;
        Sun, 05 Jul 2026 12:14:19 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960634sm19209528f8f.26.2026.07.05.12.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:14:18 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Sun, 05 Jul 2026 21:13:37 +0200
Subject: [PATCH RFC 03/13] drm/msm: look for lpac from dts
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-descriptive-name-lpac-upstream-v1-3-01d50c3e0c99@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783278851; l=3023;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=bbKLUcBLFub1tb5TatUPZPAkNtWF5490OkNoXJdO3Uk=;
 b=7V8X3RcC17AsLp4EvKV8VBh99CxZsYWbT6DX1+PJ1oeSqvZHrZHxSjd1CzKlfExV5zUSLhrW1
 hjyiu/P/E73CA/bsNLALt50GwglEelh/PKZjB7H/Z0Rc38c39U6bUFN
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-116568-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5EDB170AEFF

In order to associate the SID used by LPAC to it's own domain and
context bank we need a separate node on the DTS.

Add the code to look up that node on initialization.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 21 ++++++++++++++++++++-
 drivers/gpu/drm/msm/msm_gpu.h           |  1 +
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index f3fc7032fadc..71ce4cbbf27a 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -11,6 +11,8 @@
 #include <linux/firmware/qcom/qcom_scm.h>
 #include <linux/kernel.h>
 #include <linux/of_reserved_mem.h>
+#include <linux/of_device.h>
+#include <linux/of_platform.h>
 #include <linux/pm_opp.h>
 #include <linux/slab.h>
 #include <linux/soc/qcom/mdt_loader.h>
@@ -201,7 +203,9 @@ adreno_iommu_create_vm(struct msm_gpu *gpu,
 	struct drm_gpuvm *vm;
 	u64 start, size;
 
-	mmu = msm_iommu_gpu_new(&pdev->dev, NULL, gpu, quirks);
+	mmu = msm_iommu_gpu_new(&pdev->dev,
+				gpu->lpac_pdev ? &gpu->lpac_pdev->dev : NULL,
+				gpu, quirks);
 	if (IS_ERR(mmu))
 		return ERR_CAST(mmu);
 
@@ -1187,6 +1191,7 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		const struct adreno_gpu_funcs *funcs, int nr_rings)
 {
 	struct device *dev = &pdev->dev;
+	struct device_node *lpac_node;
 	struct adreno_platform_config *config = dev->platform_data;
 	struct msm_gpu_config adreno_gpu_config  = { 0 };
 	struct msm_gpu *gpu = &adreno_gpu->base;
@@ -1200,6 +1205,20 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	gpu->allow_relocs = config->info->family < ADRENO_6XX_GEN1;
 	gpu->pdev = pdev;
 
+	lpac_node = of_parse_phandle(pdev->dev.of_node, "qcom,lpac", 0);
+	if (lpac_node)
+		gpu->lpac_pdev = of_find_device_by_node(lpac_node);
+	if (gpu->lpac_pdev) {
+		of_dma_configure(&gpu->lpac_pdev->dev, lpac_node, true);
+		platform_set_drvdata(gpu->lpac_pdev, &gpu->lpac_adreno_smmu);
+		if (!device_link_add(&pdev->dev, &gpu->lpac_pdev->dev,
+				     DL_FLAG_PM_RUNTIME | DL_FLAG_AUTOREMOVE_CONSUMER))
+			dev_err(&gpu->lpac_pdev->dev, "failed to link to gpu device\n");
+		pm_runtime_enable(&gpu->lpac_pdev->dev);
+	}
+	if (lpac_node)
+		of_node_put(lpac_node);
+
 	/* Only handle the core clock when GMU is not in use (or is absent). */
 	if (adreno_has_gmu_wrapper(adreno_gpu) ||
 	    adreno_has_rgmu(adreno_gpu) ||
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index e2291dfe3ca8..271956e7f870 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -172,6 +172,7 @@ struct msm_gpu {
 	const char *name;
 	struct drm_device *dev;
 	struct platform_device *pdev;
+	struct platform_device *lpac_pdev;
 	const struct msm_gpu_funcs *funcs;
 
 	struct adreno_smmu_priv adreno_smmu;

-- 
2.54.0


