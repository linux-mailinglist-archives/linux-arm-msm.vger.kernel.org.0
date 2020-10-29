Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAA0129F468
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Oct 2020 20:02:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725940AbgJ2TCt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Oct 2020 15:02:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725912AbgJ2TCs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Oct 2020 15:02:48 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAF90C0613CF;
        Thu, 29 Oct 2020 12:02:48 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id o129so3149291pfb.1;
        Thu, 29 Oct 2020 12:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=azmT/G24N8TE/tNqTJcXP4u4R0G+FAx2JFXhfXQuMug=;
        b=MFzmyii/YJeRHKCIqFT/YTLhoiu2BinAEhntzjpS0mqt8LswpzA/CFS2KeuOEv0HGK
         j2kWo8RJcKrKSy9nuG9J3NMPHBqdopefT/QJVs5GD1Kv/0lBbUXzLNxmXAy4zVkD1MIN
         C7eRRuc5W5q+khDk26AsTcgo6t81c/3Bga+gwjYlIJF+qXbzuQmp7zKmJiuwmISf1/sz
         vufi+QuFE79Mi9ObCs67utwW3qT3kmJjiUiGkaflT9N+c7AXQydioHOMQdPBQPdtGNQG
         SSxWYFcXMcRJs+Y2j1QSkzGMl/OwBF3VlfvhPIJvhSGaO7mO84hQQWSxxf8BQLM5WAkk
         bNnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=azmT/G24N8TE/tNqTJcXP4u4R0G+FAx2JFXhfXQuMug=;
        b=aWJFAeo0PWEOT2E3koJFgPFmfbx2+/OyDM/7DjwuvYgSd8OTK3uPuq3LKTPb54govP
         EXBCwOTqQ/QggN1sxKm4BxwdTft+yZrR8weLuqg+7+24IOUbloeI97ghiewRxv+jRMry
         UcUhh5S7NLNZgDc5GutZzx5aavf/nCZcNsuCn9SriCn9fryyaC6+h5srODtNKxlJVIcy
         aZUJMlRF7gA2kSiymB8+K6vrPfMSjjH3gRdLVpORQOSTePfNPW4AWMPGgGhIy9aUHezU
         qJzP9cHJkHr6OLOwDGLJGs1Afb7ySgNnf3TTR3C8d4KeLkgZWrKcPyZA+4rCJu/LiGGE
         OWnw==
X-Gm-Message-State: AOAM533cC+N+suDVqgL1LLnVlGX34O+4S6iZ47pG/iD9LDBuJo22VIK1
        px0xJz90otprYB0i39t21qc=
X-Google-Smtp-Source: ABdhPJw5Eyg9jWRWL/0l6YSrt+Zz4nxhuw1qb7xVLw0srA+3h1RQYmrtFAIogzRd9bv84oV1HqsgPA==
X-Received: by 2002:a62:6496:0:b029:155:b152:f0cf with SMTP id y144-20020a6264960000b0290155b152f0cfmr5910952pfb.75.1603998168350;
        Thu, 29 Oct 2020 12:02:48 -0700 (PDT)
Received: from my--box ([103.98.79.70])
        by smtp.gmail.com with ESMTPSA id i123sm3680527pfc.13.2020.10.29.12.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 12:02:47 -0700 (PDT)
Date:   Fri, 30 Oct 2020 00:32:41 +0530
From:   Deepak R Varma <mh12gx2825@gmail.com>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Cc:     mh12gx2825@gmail.com
Subject: [PATCH 1/2] drm: msm: adreno: use DEFINE_DEBUGFS_ATTRIBUTE with
 debugfs_create_file_unsafe()
Message-ID: <9ca2c2e4cbd9ebb282b90f742305fd9b481aacc2.1603998014.git.mh12gx2825@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Using DEFINE_DEBUGFS_ATTRIBUTE macro with debugfs_create_file_unsafe()
function in place of the debugfs_create_file() function will make the
file operation struct "reset" aware of the file's lifetime. Additional
details here: https://lists.archive.carbon60.com/linux/kernel/2369498

Issue reported by Coccinelle script:
scripts/coccinelle/api/debugfs/debugfs_simple_attr.cocci

Signed-off-by: Deepak R Varma <mh12gx2825@gmail.com>
---
Please Note: This is project task specific patch.

 drivers/gpu/drm/msm/adreno/a5xx_debugfs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c b/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
index fc2c905b6c9e..ffe1fb9be155 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
@@ -138,7 +138,7 @@ reset_set(void *data, u64 val)
 	return 0;
 }
 
-DEFINE_SIMPLE_ATTRIBUTE(reset_fops, NULL, reset_set, "%llx\n");
+DEFINE_DEBUGFS_ATTRIBUTE(reset_fops, NULL, reset_set, "%llx\n");
 
 
 void a5xx_debugfs_init(struct msm_gpu *gpu, struct drm_minor *minor)
@@ -154,6 +154,6 @@ void a5xx_debugfs_init(struct msm_gpu *gpu, struct drm_minor *minor)
 				 ARRAY_SIZE(a5xx_debugfs_list),
 				 minor->debugfs_root, minor);
 
-	debugfs_create_file("reset", S_IWUGO, minor->debugfs_root, dev,
-			    &reset_fops);
+	debugfs_create_file_unsafe("reset", S_IWUGO, minor->debugfs_root, dev,
+				&reset_fops);
 }
-- 
2.25.1

