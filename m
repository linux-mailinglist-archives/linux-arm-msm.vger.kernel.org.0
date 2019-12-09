Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07E3B117775
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2019 21:32:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726598AbfLIUcl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Dec 2019 15:32:41 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:33797 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726509AbfLIUcl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Dec 2019 15:32:41 -0500
Received: by mail-oi1-f193.google.com with SMTP id l136so7656075oig.1;
        Mon, 09 Dec 2019 12:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QcDMXx7JLbsJ2UCoZNJKLtfB+ZkWm+OkWxKRuqwbsNs=;
        b=ii5EIKHBMaUVjEe/pz16DIxXm7wIOI19PiJzZ/jRWPQdu6FJoVjJ0CDB9uIbNL4bhT
         B+rmUwsjdnM2DJtFKideItEvY2CMBK4T3nHz780Don2HA/9AaYPso9dyQbR5SUcHq3JX
         DNgFjgLNLcjaMR44m6YmsQZWcYZ+y8sobtakx0B+rV8O9haEKPhcG+p0HcED+hMfw42b
         2Ci7tVAleD761wJTbclrhtNiWcs1HAkGMLdIOXbXzYElCdYa3Z8DM9A4XPGaD8On7uqS
         th3RknfkyGEL09MbE6gt382YWYtvPpxrUVO0vcp8hRazfg5L+22guUXO3hfiasrzmIHZ
         aVqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QcDMXx7JLbsJ2UCoZNJKLtfB+ZkWm+OkWxKRuqwbsNs=;
        b=Ztm024coPL41NjmNmntXMUozDBQBjGV6N6tPXbQ+PhR8xMK68JwMrCh5lh5B+hkvXy
         I5s5A5i3+TN3C+ulJj1uTvco9r+SC3cprnA43z/tpQEYlsL/fd+7f1py/8nYY7/m3Ivq
         a+tRCiAt5vdpsJ6FRKvBnfCDuigYTsXqILD5MzQzfQBLgkwEISCosoRPvAkIsc8SFRps
         n+yEL3xcIbkD6kMufN/jgIw79q0cynW4UIVaylUmKuFE9/aRpnom7gmdUoLKMNOGKv9+
         w3F4x5jQajHcWdeAnbWmENOnuSpSLCY87m8fqRHFm6MlfuNhKpDGKnvVlIvliTTzmzEN
         +QcA==
X-Gm-Message-State: APjAAAXHYg6gV9fVfzgXmVxUdVqGrXJcWdscrzX0KG+zIh048ic26yXY
        k6gECv7X8ntAqw5Gc5lc+bI=
X-Google-Smtp-Source: APXvYqwQiJRdqznvLkCjZMRsuRjsUdi2zEVecgF+rxwnBIHpEw9DLBMn1AR7VjFqiDCXnvZTVFexsg==
X-Received: by 2002:aca:570f:: with SMTP id l15mr917514oib.120.1575923559992;
        Mon, 09 Dec 2019 12:32:39 -0800 (PST)
Received: from localhost.localdomain ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id f3sm368332oto.57.2019.12.09.12.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2019 12:32:39 -0800 (PST)
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Nathan Chancellor <natechancellor@gmail.com>
Subject: [PATCH] drm: msm: mdp4: Adjust indentation in mdp4_dsi_encoder_enable
Date:   Mon,  9 Dec 2019 13:32:30 -0700
Message-Id: <20191209203230.1593-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Clang warns:

../drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c:124:3: warning:
misleading indentation; statement is not part of the previous 'if'
[-Wmisleading-indentation]
         mdp4_crtc_set_config(encoder->crtc,
         ^
../drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c:121:2: note:
previous statement is here
        if (mdp4_dsi_encoder->enabled)
        ^

This warning occurs because there is a space after the tab on this line.
Remove it so that the indentation is consistent with the Linux kernel
coding style and clang no longer warns.

Fixes: 776638e73a19 ("drm/msm/dsi: Add a mdp4 encoder for DSI")
Link: https://github.com/ClangBuiltLinux/linux/issues/792
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c
index 772f0753ed38..aaf2f26f8505 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c
@@ -121,7 +121,7 @@ static void mdp4_dsi_encoder_enable(struct drm_encoder *encoder)
 	if (mdp4_dsi_encoder->enabled)
 		return;
 
-	 mdp4_crtc_set_config(encoder->crtc,
+	mdp4_crtc_set_config(encoder->crtc,
 			MDP4_DMA_CONFIG_PACK_ALIGN_MSB |
 			MDP4_DMA_CONFIG_DEFLKR_EN |
 			MDP4_DMA_CONFIG_DITHER_EN |
-- 
2.24.0

