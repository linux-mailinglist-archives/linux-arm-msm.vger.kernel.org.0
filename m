Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDB90FCE28
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2019 19:54:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726098AbfKNSyN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Nov 2019 13:54:13 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:40121 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725976AbfKNSyM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Nov 2019 13:54:12 -0500
Received: by mail-pf1-f196.google.com with SMTP id r4so4888195pfl.7;
        Thu, 14 Nov 2019 10:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lv3vbSb0hoGBjroJ2Tdn1yzUDZjbGKNm38UA4zcYa4s=;
        b=JYzvXJ92P3URGM1EZVGOx6BuS8G4Mdx15aVK361Xo3brwt7T11v6tN/M85BmixF8gm
         x9yQqCmBVzfduyEnfCvp8OvAk6hx93Hdz2OR6cgIh01VVT+oRC/15Y6ffc5bxDSPIH+m
         27S1Q27OQ7Oxi4IShfALB58nC8gzc6U+FByDvqh9wnV4JmJNdvXSxxlAoOLKmUdPw7Km
         cMBy+MuOmR00vi49P8s0QN2KOrFwtwaacAeRm4lOENFwdo6f8jaqq3LOY8PSAzf5k2w6
         lgrxioLslzBMzzYyOtWC3JQaQOGjqlMdG1lnsTx/I1ofrt3o+CF2UEEzPD4WoTP6FM0U
         61aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lv3vbSb0hoGBjroJ2Tdn1yzUDZjbGKNm38UA4zcYa4s=;
        b=XL2cDeLzX+o5hUJ13aoZhSV5mNTttGfqXYtZpLqSKTjtrC90zSMtIE7uGngsiNzWGk
         leS/W1Nci60UwZG9As5b0QOExPM6k0cjNmUIbf/IIs5kPxlDgwqPAj0BlWvQWz2fwhZO
         +YgyBmyM4RhsN/j9BxpesCSDPAxxKepk66FZPviWjVdGwfiU0PMDiznVF9E8wEA1HucD
         raXA64JA4RS8IBg2PxajPKvIu/TlSIACi3hBQOyVjsBlv7uyfsV4XVoE2+RuyNlCCj0c
         9hYh+JbAWRrbJrqsGtf9FY6FxcZw1TSFghhJyk2D+WolVcJmFL38rmC+Cc/ZU7FQ5qY/
         Utpw==
X-Gm-Message-State: APjAAAWjJWOl0CtlN3FXkP8RdJmCj3fDrYwjcKeUJxa8f06obUW0PhPq
        8W0ycmNKxApnvLq5EMwdazb6V38Vjb8=
X-Google-Smtp-Source: APXvYqxUcHD8QYR04zvjEfVRrevsRkXrCYCaiTtozRf4mEoOkYqRB3I7hM7yBUhdoONpAtm79wmvnw==
X-Received: by 2002:a63:c24f:: with SMTP id l15mr4182842pgg.279.1573757651698;
        Thu, 14 Nov 2019 10:54:11 -0800 (PST)
Received: from localhost ([100.118.89.215])
        by smtp.gmail.com with ESMTPSA id y123sm7220013pfg.64.2019.11.14.10.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2019 10:54:11 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mamta Shukla <mamtashukla555@gmail.com>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/dpu: ignore NULL clocks
Date:   Thu, 14 Nov 2019 10:51:50 -0800
Message-Id: <20191114185152.101059-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

This isn't an error.  Also the clk APIs handle the NULL case, so we can
just delete the check.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Tested-by: Matthias Kaehlcke <mka@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c | 26 ++++++---------------
 1 file changed, 7 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c
index 27fbeb504362..ec1437b0ef75 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c
@@ -93,19 +93,12 @@ int msm_dss_enable_clk(struct dss_clk *clk_arry, int num_clk, int enable)
 			DEV_DBG("%pS->%s: enable '%s'\n",
 				__builtin_return_address(0), __func__,
 				clk_arry[i].clk_name);
-			if (clk_arry[i].clk) {
-				rc = clk_prepare_enable(clk_arry[i].clk);
-				if (rc)
-					DEV_ERR("%pS->%s: %s en fail. rc=%d\n",
-						__builtin_return_address(0),
-						__func__,
-						clk_arry[i].clk_name, rc);
-			} else {
-				DEV_ERR("%pS->%s: '%s' is not available\n",
-					__builtin_return_address(0), __func__,
-					clk_arry[i].clk_name);
-				rc = -EPERM;
-			}
+			rc = clk_prepare_enable(clk_arry[i].clk);
+			if (rc)
+				DEV_ERR("%pS->%s: %s en fail. rc=%d\n",
+					__builtin_return_address(0),
+					__func__,
+					clk_arry[i].clk_name, rc);
 
 			if (rc && i) {
 				msm_dss_enable_clk(&clk_arry[i - 1],
@@ -119,12 +112,7 @@ int msm_dss_enable_clk(struct dss_clk *clk_arry, int num_clk, int enable)
 				__builtin_return_address(0), __func__,
 				clk_arry[i].clk_name);
 
-			if (clk_arry[i].clk)
-				clk_disable_unprepare(clk_arry[i].clk);
-			else
-				DEV_ERR("%pS->%s: '%s' is not available\n",
-					__builtin_return_address(0), __func__,
-					clk_arry[i].clk_name);
+			clk_disable_unprepare(clk_arry[i].clk);
 		}
 	}
 
-- 
2.23.0

