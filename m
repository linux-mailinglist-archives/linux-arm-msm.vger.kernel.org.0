Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4ACBD15CBA2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2020 21:03:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727910AbgBMUD5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Feb 2020 15:03:57 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:38190 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727797AbgBMUD5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Feb 2020 15:03:57 -0500
Received: by mail-pl1-f195.google.com with SMTP id t6so2767242plj.5;
        Thu, 13 Feb 2020 12:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UQjjHQDgj0q56YxtAxLxiwd0e2dsyqGtwVu7Hq/6ZWw=;
        b=N/k7RAPUDfZEcoyOkB0wvxfvhSGMwEJU6wxiChP5OO/yVwjVpZSN4JI1eSaUSVN8tm
         YWl7fRqn0MB9brNk7Q8MrlT3MuSh0O5S2tMwW1GuWZwUX7bLucomFKem3FwgSSZVxSUM
         3El9OGIyK8kX91tlZixUZ644/ZIACx51O1h+vgyCKLQEvDPLFbI1o8TI6mRiLIq/ghOS
         cPkbQzKAqvAv68Ca21w/lSp3RuPJiuDzIydBeXAUD8I9EaeqO+cINsvI0ZnCC1j3wbuM
         0b5jUyJ3Z0Kgx9pTtQVVTCJeUVhzy9Rd8AHueHSUlND7MsdoNAkvK+xuNeDdiqONsk3s
         L4GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UQjjHQDgj0q56YxtAxLxiwd0e2dsyqGtwVu7Hq/6ZWw=;
        b=UUowp87HkcsiRrWEvW2Q8d0FbqZnOQc0WuQ8VmWeGN/FZ8wzNFC3Gyh7Kznl1VE0MB
         loqj8YiYgHqkzQVloeP1nZpKSG3G48j4y6QfRBqyJ8WX7NFnSQ/CvkY0e/y2qQkVohY4
         4HZi0McdyD/Zo6ZgtF2vV8nql85rD/eHMg9IibPSff3G0wuIvsvSV+tvdLDNZBhQNCR0
         JnJ72TDoWL27IYRXXRbo+KgN6U87xY6ZwQ+q/hTm/BP7EgzM3nrSr6WqBhvQMAHwTxzP
         6z8VJajBs3UWZkJXxH4x/rLhOIqzpEAiSrk/xb6WgOMzmj/RguBqv6ZcKmkSU8YCkntW
         fbOg==
X-Gm-Message-State: APjAAAVi4ZSPMxx/Da88DCq7F0i99ZhF5UEbl8MNiWumCPMz0fjWyC61
        2qVK8fuB6Zq2kJ91HduO1lQ=
X-Google-Smtp-Source: APXvYqxK3k8dw4bEbots2NbHpnsfrrHqX2qUwnysFEa+wzONL/xB3/2+U19TyNmfD+4AoiDn7+9nGA==
X-Received: by 2002:a17:90a:a88d:: with SMTP id h13mr6597270pjq.55.1581624236430;
        Thu, 13 Feb 2020 12:03:56 -0800 (PST)
Received: from localhost ([100.118.89.211])
        by smtp.gmail.com with ESMTPSA id w25sm4126396pfi.106.2020.02.13.12.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2020 12:03:55 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Fritz Koenig <frkoenig@google.com>,
        Nathan Huckleberry <nhuck@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/dpu: fix BGR565 vs RGB565 confusion
Date:   Thu, 13 Feb 2020 12:01:35 -0800
Message-Id: <20200213200137.745029-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

The component order between the two was swapped, resulting in incorrect
color when games with 565 visual hit the overlay path instead of GPU
composition.

Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index 24ab6249083a..6f420cc73dbd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -255,13 +255,13 @@ static const struct dpu_format dpu_format_map[] = {
 
 	INTERLEAVED_RGB_FMT(RGB565,
 		0, COLOR_5BIT, COLOR_6BIT, COLOR_5BIT,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, 0, 3,
+		C1_B_Cb, C0_G_Y, C2_R_Cr, 0, 3,
 		false, 2, 0,
 		DPU_FETCH_LINEAR, 1),
 
 	INTERLEAVED_RGB_FMT(BGR565,
 		0, COLOR_5BIT, COLOR_6BIT, COLOR_5BIT,
-		C1_B_Cb, C0_G_Y, C2_R_Cr, 0, 3,
+		C2_R_Cr, C0_G_Y, C1_B_Cb, 0, 3,
 		false, 2, 0,
 		DPU_FETCH_LINEAR, 1),
 
-- 
2.24.1

