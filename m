Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A26E21D8E0A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2020 05:09:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727964AbgESDJB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 May 2020 23:09:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727045AbgESDJB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 May 2020 23:09:01 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3285C05BD09
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 20:08:59 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id 4so10034754qtb.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 20:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mQJ5GEq7PDJ+xmAy1f1Vg4ydmsBKJSVL7rBc7e/vN0Q=;
        b=tuU+WBq+N01erbYivv1k/19CTmRAoPPA+gTWI2uPJpN5ra9HL7KDI0EOkRqal8XT5+
         UmJu47AJ0w83pu/+rzwUJjZyXM2l5j1yzJctHB7SWyjyUZ7SdmyNTCw6ef5eVpdmNM8Q
         cJXVx8QHLckBAxV+yRAtLeDXOIlPb0doargDP1sxtACXPLZQSRwvWgcrwm/cCmCHi4rH
         pw5KH+asQZ/FEyXaRkStMrXR32n09Ee7EDVH0FIzpDyGoWd4hqRqaU/vkfutWmQX2PLX
         UqDYLDRo/4/rFsP80YDtdPPeirV7Azpe9aKEiHmNQPGsjSrpLOh6Sn0sAwYDQMZ06ky8
         dUCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mQJ5GEq7PDJ+xmAy1f1Vg4ydmsBKJSVL7rBc7e/vN0Q=;
        b=HiBY7vnDrie0FRp3HePXgbe/Eh65IgbCOsH/6sTgEzxI1eUnqzFATJn4sxPI3ju2g+
         hX+zWS1MXD9wzNZJprucrMBeSt3aUpWKM8MxMDxqhkfOLc4L9DEPH/Ej6Cc5ZESbbaDq
         zSOPcKcgRH4SljoM5KKRDtU2CuceQcWNKgkueXsD3LCm2aWHVsby2C/75tqzTctXqb5y
         VEm8BCTDuLSbRQzdjdr1jwZYUvjGfMEnRFcw7mbKna7H2/ZwSFELQqxW3smo0ST52yXR
         cJl18x36zARCasayPMWZfwumF2euJEKSaPtnr0DyiWMNHpBKEUmyxXUc5uVV068A9BQk
         n9yg==
X-Gm-Message-State: AOAM530fbLWwSvbrxIsvtTlf3I8gXPRq58I3A4iqKzRDlnFPzDFyZ9mz
        oLgEvh+do6j7TU1kcR8cRRSgqLS+060=
X-Google-Smtp-Source: ABdhPJyqNsHhYZbp5yPpTg7RdDlSSku/gcOTr/4QKk3jwHyz0DH+TNY+8xf4dnxg+M92BBjHTCB5Gg==
X-Received: by 2002:ac8:37e6:: with SMTP id e35mr13537025qtc.310.1589857739104;
        Mon, 18 May 2020 20:08:59 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id s74sm9941014qka.54.2020.05.18.20.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 20:08:58 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     freedreno@lists.freedesktop.org
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
        Sharat Masetty <smasetty@codeaurora.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/a6xx: don't try to set GPU frequency when GMU is suspended
Date:   Mon, 18 May 2020 23:07:33 -0400
Message-Id: <20200519030735.24713-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This fixes changing the frequency in sysfs while suspended, for example
when doing something like this:

cat devfreq/3d00000.gpu/max_freq > devfreq/3d00000.gpu/min_freq

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index aec54cde8534..9498803dcad9 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -151,13 +151,20 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, unsigned long freq)
 			break;
 
 	gmu->current_perf_index = perf_index;
+	gmu->freq = gmu->gpu_freqs[perf_index];
+
+	/*
+	 * devfreq may try to change frequency target even when suspended
+	 * this can happen when changing frequency through sysfs
+	 * don't try to set freq when suspended, it will be set on resume
+	 */
+	if (!pm_runtime_active(gmu->dev))
+		return;
 
 	if (gmu->legacy)
 		__a6xx_gmu_set_freq(gmu, perf_index);
 	else
 		a6xx_hfi_set_freq(gmu, perf_index);
-
-	gmu->freq = gmu->gpu_freqs[perf_index];
 }
 
 unsigned long a6xx_gmu_get_freq(struct msm_gpu *gpu)
-- 
2.26.1

