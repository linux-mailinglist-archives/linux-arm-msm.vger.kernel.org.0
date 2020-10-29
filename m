Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82FF629F478
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Oct 2020 20:04:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725910AbgJ2TEQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Oct 2020 15:04:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725778AbgJ2TEP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Oct 2020 15:04:15 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86C7DC0613CF;
        Thu, 29 Oct 2020 12:04:14 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id g12so3116262pgm.8;
        Thu, 29 Oct 2020 12:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=E/YO8QhrBtgOUHxaIDNankNBd/9HmVJuOo7AD36126w=;
        b=PLfkqocEdos35ZQHCQz/KTCSR/zMAv3dAbZfuP5kApLSMaTsx7PFKmmwIEBMuJFbFC
         qC9PdeAhCfMDVWkvy7mrzdhGx8oHpIjCVqULqOklNfRAXVfXVA2r8nPjl2mFopa9IxIp
         bGQIykKdYgDlBFjJHtGKn43D02lpYwtRVslmiIVm4XXBTr+RbE5XUwGb+k3LOCthAz7g
         cv6P2xhzPjSwC8fWDCToPqu0kJOxC3WT8a/sp7Xb7gq40x9A64votvET4rP2ylYSwn+a
         CNl1LQvuP93+p+ZbgI0roqCVTxygv6KD7V3x6aedt6LifnYrTC8MXqvj7SIP+7AR51fj
         OqLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=E/YO8QhrBtgOUHxaIDNankNBd/9HmVJuOo7AD36126w=;
        b=cQfsImgYTb7I2PCjSjsHxsJB+rh0+AUcYTzc87B17iTLaO64AeMkrVRbu4y4lYCJcS
         zdKPoPrZTC7B4woYNAa88miFBUJuCz9B12SI2146bWZLYIhf44XXH48cE8onB3hVCDF0
         JJmnaHsV25uUFJREFr/wp8GMcAhAeHb80kn+Q9g4QuHu+YGu/wKgA7zBpkRnTMRtpISm
         DeQSMWGWxLDyngIb+tkb8zm5oAXKnPXJTQkw1Uj2uqxY5m+m07VdTEpUnSbvZBTmP56a
         RsQpJ6RbfAZTlrsKir7AvTa3rPP9NH7hDtLUrgzbS/ZtzfJbQ1wuk2eB0IVfJ0i1qyxE
         mvXQ==
X-Gm-Message-State: AOAM5312anXHvwM1f6d9tCNdxIQS/PrKTZWwoBrXaUym1gFjIyLZ69+I
        WXvVy6hnI1OWO5Tz22ysNUY=
X-Google-Smtp-Source: ABdhPJw9nDFNuKk/faRep1zMYuYjpRmAzLiIeyJ73bCvjZKMjBLsJZ2uz8PYM+c8gd4OhgIEGjyrHA==
X-Received: by 2002:a62:e113:0:b029:152:69aa:6a08 with SMTP id q19-20020a62e1130000b029015269aa6a08mr5770954pfh.14.1603998254180;
        Thu, 29 Oct 2020 12:04:14 -0700 (PDT)
Received: from my--box ([103.98.79.70])
        by smtp.gmail.com with ESMTPSA id ne17sm547478pjb.44.2020.10.29.12.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 12:04:13 -0700 (PDT)
Date:   Fri, 30 Oct 2020 00:34:08 +0530
From:   Deepak R Varma <mh12gx2825@gmail.com>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Cc:     mh12gx2825@gmail.com
Subject: [PATCH 2/2] drm: msm: adreno: improve code indentation & alignment
Message-ID: <e196c426de9e12f149492a92c0a8d92b6106f27c.1603998014.git.mh12gx2825@gmail.com>
References: <9ca2c2e4cbd9ebb282b90f742305fd9b481aacc2.1603998014.git.mh12gx2825@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ca2c2e4cbd9ebb282b90f742305fd9b481aacc2.1603998014.git.mh12gx2825@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Align instructions split across multiple lines as per the coding
standards. Issue flagged by checkpatch script.

Signed-off-by: Deepak R Varma <mh12gx2825@gmail.com>
---
Please note: This is a project task specific patch.

 drivers/gpu/drm/msm/adreno/a5xx_debugfs.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c b/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
index ffe1fb9be155..ac9296f314be 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
@@ -20,7 +20,7 @@ static void pfp_print(struct msm_gpu *gpu, struct drm_printer *p)
 	for (i = 0; i < 36; i++) {
 		gpu_write(gpu, REG_A5XX_CP_PFP_STAT_ADDR, i);
 		drm_printf(p, "  %02x: %08x\n", i,
-			gpu_read(gpu, REG_A5XX_CP_PFP_STAT_DATA));
+			   gpu_read(gpu, REG_A5XX_CP_PFP_STAT_DATA));
 	}
 }
 
@@ -33,7 +33,7 @@ static void me_print(struct msm_gpu *gpu, struct drm_printer *p)
 	for (i = 0; i < 29; i++) {
 		gpu_write(gpu, REG_A5XX_CP_ME_STAT_ADDR, i);
 		drm_printf(p, "  %02x: %08x\n", i,
-			gpu_read(gpu, REG_A5XX_CP_ME_STAT_DATA));
+			   gpu_read(gpu, REG_A5XX_CP_ME_STAT_DATA));
 	}
 }
 
@@ -46,7 +46,7 @@ static void meq_print(struct msm_gpu *gpu, struct drm_printer *p)
 
 	for (i = 0; i < 64; i++) {
 		drm_printf(p, "  %02x: %08x\n", i,
-			gpu_read(gpu, REG_A5XX_CP_MEQ_DBG_DATA));
+			   gpu_read(gpu, REG_A5XX_CP_MEQ_DBG_DATA));
 	}
 }
 
@@ -63,7 +63,7 @@ static void roq_print(struct msm_gpu *gpu, struct drm_printer *p)
 		for (j = 0; j < 4; j++)
 			val[j] = gpu_read(gpu, REG_A5XX_CP_ROQ_DBG_DATA);
 		drm_printf(p, "  %02x: %08x %08x %08x %08x\n", i,
-			val[0], val[1], val[2], val[3]);
+			   val[0], val[1], val[2], val[3]);
 	}
 }
 
@@ -155,5 +155,5 @@ void a5xx_debugfs_init(struct msm_gpu *gpu, struct drm_minor *minor)
 				 minor->debugfs_root, minor);
 
 	debugfs_create_file_unsafe("reset", S_IWUGO, minor->debugfs_root, dev,
-				&reset_fops);
+				   &reset_fops);
 }
-- 
2.25.1

