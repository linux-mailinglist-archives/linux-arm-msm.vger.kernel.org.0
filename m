Return-Path: <linux-arm-msm+bounces-19757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D5E8C352C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 May 2024 07:51:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B29661F21468
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 May 2024 05:51:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B92D17758;
	Sun, 12 May 2024 05:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gC8iYiV1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82CE15E9B;
	Sun, 12 May 2024 05:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715493041; cv=none; b=jORH5D6uwlCejpzyDWKBcUJCQd11vsFDj3E5hZiX0coR65aSBcKq/LGN6KFtGoR73yk3WdeBF2axILWXosUCKm0zBSI3tLlDrZ1E6KvCK17qGL2t5wDzT9VutT0+6OuPl/VwxXvoxfKxyeTpXnGRFgao81P3OH2oxX+gUf/rpFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715493041; c=relaxed/simple;
	bh=Kt2K7zMmwsE77jHHj+rr+4K04ypr7zZgiyA3hJnQQlw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nf2PVuMcplA53EKsSgNEWYkSEil8WsDhv+GKmZ2ExYGwa4RvcHWdY8LlgabFP9FtpVLdclJYumUm5vothaD/xIww814iZCT6whq+46/aA8iqFRoyzwIM8lyr5+Ni8VwlrVws0IOZKIjJaOtVMYqWsh9lry4HB/G5WjB6PIU5Y4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gC8iYiV1; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-34ddc9fe497so2022221f8f.3;
        Sat, 11 May 2024 22:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715493038; x=1716097838; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L1XpgzHw/Nytzeexk8L71Zuu6UpL2KUJOeWc+Pl9H0M=;
        b=gC8iYiV1kOPjM9uOLlp9kkCicZxwaEp2xNcO9gN+nTIeG0PqjWT2tJ6O0a4/LfbayE
         h7KzIir0uiVOHI9u+cnBGHZnduiVkIOwdnnuwVz+NeFbzTtW7Yp+qGycNClgSsmTy8Ei
         PLKVZQtyGv/9wPluvG263fUjgoiO1vAOUmPy6e/s9ijeYbqd2ljBR8S/5MDs0k48KK1I
         s9z9E/GuJSTv+e9qlSoamtfJR8cnyg5XHbJ5V9AhdRWbcYa772MbjAxQrhN1IzIxI42A
         E0fgPKkY8Kl2Sze0RWB0PzrBD4+C9OjQmG0xPt9Vgjy3DeUAADlY+EmNTscT9qWfgDG2
         hxoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715493038; x=1716097838;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L1XpgzHw/Nytzeexk8L71Zuu6UpL2KUJOeWc+Pl9H0M=;
        b=CHHdbLQn4qOhQ0+acwzDeP1QgH+DaPux9FQPnck7Gf3dh6oX5IAvzii+CJgYEsLoy8
         YfJdBrmxaScmpG0mr8HkpHqOwdsjxowxNhSWPUPKedsW5n+2/V+8WSjLwuEX29utn9De
         0Azk88ZS13q5E3G2WPV/R/qIbwZ/aOhLqc6DmI3rHSIqyhiNl1ABTFagxC1KXdWRaYB4
         6tiodAYJYEBYzaFsMD905vLjF1DukOyJzf2qEsHP4jz+B/OifbjY9rcn74/PTjdHAYb/
         AQ+85H8A+oM/TMF6zUkOGKg4fTRPAhlU7nKDfbfoqgHI3f5jvYVQcPPXcQePqGNGlBXU
         h2jA==
X-Forwarded-Encrypted: i=1; AJvYcCX6oQLFOagU43L33KDB7B8wWQn5HwptoOK133nWj0qZuE7pF+bYi0hBlxUiVd8WGlqE2Nf+vSlDQL249ON5VCY0WuaAVRutPPfbjez4
X-Gm-Message-State: AOJu0Yy1K4jTTv77hveps27eWQ6pzECbuMeFY3FxyZtc3wHjIAMTwF04
	twFkZpoys+HNG8AQBWgyFUFLXb0dv4AR82STyg4QVppbxVfpO60kUvyi5k3h
X-Google-Smtp-Source: AGHT+IGIegRhuRPR8A8oUnqlzeg+u+kIoiZi/2RatA7tPrm34L76cljbxtIM6JSDvoiVm0RVB2cSvA==
X-Received: by 2002:a05:6000:1d9b:b0:351:b7c8:3efe with SMTP id ffacd0b85a97d-351b7c83f88mr680423f8f.3.1715493038023;
        Sat, 11 May 2024 22:50:38 -0700 (PDT)
Received: from kali.localhost ([5.208.126.127])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502bbbbde1sm8233658f8f.97.2024.05.11.22.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 May 2024 22:50:37 -0700 (PDT)
From: Kiarash Hajian <kiarash8112hajian@gmail.com>
Date: Sun, 12 May 2024 01:49:39 -0400
Subject: [PATCH v3 2/2] drm/msm/a6xx: request memory region
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240512-msm-adreno-memory-region-v3-2-0a728ad45010@gmail.com>
References: <20240512-msm-adreno-memory-region-v3-0-0a728ad45010@gmail.com>
In-Reply-To: <20240512-msm-adreno-memory-region-v3-0-0a728ad45010@gmail.com>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Kiarash Hajian <kiarash8112hajian@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715493029; l=2351;
 i=kiarash8112hajian@gmail.com; s=20240409; h=from:subject:message-id;
 bh=Kt2K7zMmwsE77jHHj+rr+4K04ypr7zZgiyA3hJnQQlw=;
 b=+D9LeDZ7VE3tcvVCJr9j4KAbxEFaFEkYeJj75Ut20EejIA44pc07J/vbovudnIqib5kWvfbPZ
 l7q0Nf+92GNAVKmCJr9YUBXVhTeQMFS6KPXkILP3ksfLfCoehZPdvbg
X-Developer-Key: i=kiarash8112hajian@gmail.com; a=ed25519;
 pk=ehVBr28gPcA8cMB/wneVh0Mj6WGkqZoyYRdRNi5+aI0=

The devm_iounmap function is being used unnecessarily,
managed resource mechanisms (devres) are handling resource cleanup automatically

This commit removes the calls to devm_iounmap and relies on devres

Signed-off-by: Kiarash Hajian <kiarash8112hajian@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index aa83cb461a75..d64bf6212d6f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -524,9 +524,6 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 	uint32_t pdc_address_offset;
 	bool pdc_in_aop = false;
 
-	if (IS_ERR(pdcptr))
-		goto err;
-
 	if (adreno_is_a650(adreno_gpu) ||
 	    adreno_is_a660_family(adreno_gpu) ||
 	    adreno_is_a7xx(adreno_gpu))
@@ -540,8 +537,6 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 
 	if (!pdc_in_aop) {
 		seqptr = a6xx_gmu_get_mmio(pdev, "gmu_pdc_seq");
-		if (IS_ERR(seqptr))
-			goto err;
 	}
 
 	/* Disable SDE clock gating */
@@ -633,12 +628,6 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 	wmb();
 
 	a6xx_rpmh_stop(gmu);
-
-err:
-	if (!IS_ERR_OR_NULL(pdcptr))
-		devm_iounmap(&pdev->dev,pdcptr);
-	if (!IS_ERR_OR_NULL(seqptr))
-		devm_iounmap(&pdev->dev,seqptr);
 }
 
 /*
@@ -1635,7 +1624,6 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	gmu->gxpd = dev_pm_domain_attach_by_name(gmu->dev, "gx");
 	if (IS_ERR(gmu->gxpd)) {
 		ret = PTR_ERR(gmu->gxpd);
-		goto err_mmio;
 	}
 
 	gmu->initialized = true;
@@ -1645,9 +1633,6 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 detach_cxpd:
 	dev_pm_domain_detach(gmu->cxpd, false);
 
-err_mmio:
-	devm_iounmap(gmu->dev ,gmu->mmio);
-
 	/* Drop reference taken in of_find_device_by_node */
 	put_device(gmu->dev);
 
@@ -1825,9 +1810,6 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	dev_pm_domain_detach(gmu->cxpd, false);
 
 err_mmio:
-	devm_iounmap(gmu->dev ,gmu->mmio);
-	if (platform_get_resource_byname(pdev, IORESOURCE_MEM, "rscc"))
-		devm_iounmap(gmu->dev ,gmu->rscc);
 	free_irq(gmu->gmu_irq, gmu);
 	free_irq(gmu->hfi_irq, gmu);
 

-- 
2.43.0


