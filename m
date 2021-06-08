Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8101339FDB2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jun 2021 19:30:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232644AbhFHRcM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Jun 2021 13:32:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233602AbhFHRcM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Jun 2021 13:32:12 -0400
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92B61C061787
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jun 2021 10:30:02 -0700 (PDT)
Received: by mail-qv1-xf2f.google.com with SMTP id x2so10565483qvo.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jun 2021 10:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cw/T67Raxlwp2J/xqRY1bIakrTpt8tOc7nmYdzBT6xs=;
        b=1T31TM63QiG2dKOFLdxurQr/m4Jmu5IwlHOD35wSveX6hm7+yCwgqyYw4UCKmYnBra
         XsSY4CZA+kc/UHkyzOTr4jFaB1xQRBcUJFpppcq85vuGfL8yN42svxL6IvzlEO0DYMC9
         qudTb9KNNaXpopN/T/MiY7NCPyZC1M/5+jR2RWEqHoKfT+H3+L/jsjTbIo69Ic194UPm
         motbyKq9g//QQaFnXILWb6bl8i9EJukaHvgaGkdWK5bs3/OrGnsRkqOiLJALl/7A7iNE
         hIReNAt5rWTFND601Yn8TT2tEHWuM56boRjYz/SFlXwCzFWK9E+Qpn9meiyYgs0n9QOx
         nYcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cw/T67Raxlwp2J/xqRY1bIakrTpt8tOc7nmYdzBT6xs=;
        b=s5A3z+0Xm6e4uUbrVfUQ+5e1I6Z0hZZDfvVrSKPChM24kovsts5cHviaqhN+dn/Uyo
         UFjzXAI41F/HkDZCu8n3f447IwFTLBQrq2K8ouaz3WEm9ufel4+xUlXs7Rr0WAiwc0Oa
         Q9R3WRvJF+ON9qONcM0XvcQOwdzeIE0FI7Zoawuxk3t0WAFqvBQllo9WyZv8vzlsKaFx
         mNzAu52j0/PyvBEEprpFFIFUnPEMC/MN5Ve+8vumqa94Tesj15UP4fQqYSefG4ql7eJM
         EGudGsW2IB2Js7lUKA3OXiAgmvftMmPfGET+dtt9LY5LOPF8UQUEvOiTlXxj59306FFc
         UPbg==
X-Gm-Message-State: AOAM5304lwDS1Fu+2HCzB1vC6El+zkM2tFPLt1hKsI7lWBUX910UZsXy
        5jHVgtz/HcWH66SOpaWVO/gvHQ==
X-Google-Smtp-Source: ABdhPJy3w3HKrVCLTroG4bo1kOv1Rypz99JMObgdkPPBnC36pyGLQe2FP3KEN4BIeSxcP+h24xA/HA==
X-Received: by 2002:a0c:f650:: with SMTP id s16mr1269451qvm.0.1623173400924;
        Tue, 08 Jun 2021 10:30:00 -0700 (PDT)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id d10sm9482983qke.47.2021.06.08.10.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 10:30:00 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     freedreno@lists.freedesktop.org
Cc:     Akhil P Oommen <akhilpo@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Dave Airlie <airlied@redhat.com>,
        Sharat Masetty <smasetty@codeaurora.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 1/5] drm/msm: remove unused icc_path/ocmem_icc_path
Date:   Tue,  8 Jun 2021 13:27:44 -0400
Message-Id: <20210608172808.11803-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210608172808.11803-1-jonathan@marek.ca>
References: <20210608172808.11803-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

These aren't used by anything anymore.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Akhil P Oommen <akhilpo@codeaurora.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 3 ---
 drivers/gpu/drm/msm/msm_gpu.h           | 9 ---------
 2 files changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 8fd0777f2dc9..009f4c560f16 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -946,7 +946,4 @@ void adreno_gpu_cleanup(struct adreno_gpu *adreno_gpu)
 	pm_runtime_disable(&priv->gpu_pdev->dev);
 
 	msm_gpu_cleanup(&adreno_gpu->base);
-
-	icc_put(gpu->icc_path);
-	icc_put(gpu->ocmem_icc_path);
 }
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 18baf935e143..c302ab7ffb06 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -118,15 +118,6 @@ struct msm_gpu {
 	struct clk *ebi1_clk, *core_clk, *rbbmtimer_clk;
 	uint32_t fast_rate;
 
-	/* The gfx-mem interconnect path that's used by all GPU types. */
-	struct icc_path *icc_path;
-
-	/*
-	 * Second interconnect path for some A3xx and all A4xx GPUs to the
-	 * On Chip MEMory (OCMEM).
-	 */
-	struct icc_path *ocmem_icc_path;
-
 	/* Hang and Inactivity Detection:
 	 */
 #define DRM_MSM_INACTIVE_PERIOD   66 /* in ms (roughly four frames) */
-- 
2.26.1

