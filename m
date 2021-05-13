Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAA7637FC5A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 May 2021 19:18:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230483AbhEMRTS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 May 2021 13:19:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231189AbhEMRTO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 May 2021 13:19:14 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5941C0613ED
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 May 2021 10:18:02 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id f18so4357353qko.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 May 2021 10:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vmggi1tOrZ/7NREacuaxcgryuSU/S1q+fl+YG5PANN4=;
        b=rbAflgboFf16SgYS+ys5CR+VSAB/JtRdCzBTbZQAwWW03Fv95nQDuCAaqv8IqsBIf/
         jLnU6oNbTj4urKlDmcbOImMWSGeuYXhVphoffBvMQ0AA5VXYTrbqn7rZCyFOQ97ru4p4
         4AhRiACQH8Es1QsyWFA3iZ3b8EMB60HkwsTDQ8CwrmJEDbqZGQt6nJ5/d1tOSnvicONj
         wLi4jkWdHdSnzDNAjQhJmBo8g6fUALqMIvszfEGFXE3Lenu1inRKVrMWA+ng1pUFdxfI
         L41RRPA2KZmcBUVVhTZDGmdcg7uVgifU9ouwvhtk5ghWuSHrHaZcTqbUK8gqgi/Nlwcc
         zxRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vmggi1tOrZ/7NREacuaxcgryuSU/S1q+fl+YG5PANN4=;
        b=gi/Ca0xtmM3AFouXxeQATcb1PtKE+9UinawvjEBNZRkFYZyy0Nau5MT1FPI3nvo3WT
         ++csrOwhdLSqpFaxMYGTlBAlW0vpQaYoHSwoNb62zKVf/tNOeLW2SSE0UOANWG0W5dvx
         KSt5Xh8HCVn/LMfYHCf8JYLB58HQpSQMbyeah0PJditcf7CDkL3liwo34mN2gmWcuePn
         lVMW8RNg/YpkWYlRD1ftoZqywD2K2o9khvvewQ5lskb7qljJhV2i4OqQ/B/U/WWz2WOH
         EcivO8Dgn4vSHMbQSLIRL42sYpa9oVM4W+ERbcFi4zUR7xFt6wWBS/CjDDjup3LJ+BJK
         CqsQ==
X-Gm-Message-State: AOAM532MOec9f/eNeK4oB+jUtRI6PUoh7Iq1Jx757glrUMiLQGPG/xwR
        mq+SEOAnQD1gXGWNGTZ0NhMs5Q==
X-Google-Smtp-Source: ABdhPJwZ22eRt74l/hlI57Q4bM8PkfOSVTk500ebvRw6wWYM5yMzFkF7M3Vgmbr2uXsAuCtTa1ox0w==
X-Received: by 2002:a37:b947:: with SMTP id j68mr39397620qkf.108.1620926282029;
        Thu, 13 May 2021 10:18:02 -0700 (PDT)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id f132sm2971117qke.104.2021.05.13.10.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 May 2021 10:18:01 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     freedreno@lists.freedesktop.org
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Eric Anholt <eric@anholt.net>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 7/8] drm/msm/a6xx: update a6xx_ucode_check_version for a660
Date:   Thu, 13 May 2021 13:14:02 -0400
Message-Id: <20210513171431.18632-8-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210513171431.18632-1-jonathan@marek.ca>
References: <20210513171431.18632-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Accept all SQE firmware versions for A660.

Re-organize the function a bit and print an error message for unexpected
GPU IDs instead of failing silently.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 36 +++++++++++++--------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 3cc23057b11d..ec66a24fc37e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -697,6 +697,11 @@ static bool a6xx_ucode_check_version(struct a6xx_gpu *a6xx_gpu,
 	 * Targets up to a640 (a618, a630 and a640) need to check for a
 	 * microcode version that is patched to support the whereami opcode or
 	 * one that is new enough to include it by default.
+	 *
+	 * a650 tier targets don't need whereami but still need to be
+	 * equal to or newer than 0.95 for other security fixes
+	 *
+	 * a660 targets have all the critical security fixes from the start
 	 */
 	if (adreno_is_a618(adreno_gpu) || adreno_is_a630(adreno_gpu) ||
 		adreno_is_a640(adreno_gpu)) {
@@ -720,27 +725,20 @@ static bool a6xx_ucode_check_version(struct a6xx_gpu *a6xx_gpu,
 		DRM_DEV_ERROR(&gpu->pdev->dev,
 			"a630 SQE ucode is too old. Have version %x need at least %x\n",
 			buf[0] & 0xfff, 0x190);
-	}  else {
-		/*
-		 * a650 tier targets don't need whereami but still need to be
-		 * equal to or newer than 0.95 for other security fixes
-		 */
-		if (adreno_is_a650(adreno_gpu)) {
-			if ((buf[0] & 0xfff) >= 0x095) {
-				ret = true;
-				goto out;
-			}
-
-			DRM_DEV_ERROR(&gpu->pdev->dev,
-				"a650 SQE ucode is too old. Have version %x need at least %x\n",
-				buf[0] & 0xfff, 0x095);
+	} else if (adreno_is_a650(adreno_gpu)) {
+		if ((buf[0] & 0xfff) >= 0x095) {
+			ret = true;
+			goto out;
 		}
 
-		/*
-		 * When a660 is added those targets should return true here
-		 * since those have all the critical security fixes built in
-		 * from the start
-		 */
+		DRM_DEV_ERROR(&gpu->pdev->dev,
+			"a650 SQE ucode is too old. Have version %x need at least %x\n",
+			buf[0] & 0xfff, 0x095);
+	} else if (adreno_is_a660(adreno_gpu)) {
+		ret = true;
+	} else {
+		DRM_DEV_ERROR(&gpu->pdev->dev,
+			"unknown GPU, add it to a6xx_ucode_check_version()!!\n");
 	}
 out:
 	msm_gem_put_vaddr(obj);
-- 
2.26.1

