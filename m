Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76B3342D571
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Oct 2021 10:52:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229910AbhJNIyC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Oct 2021 04:54:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230035AbhJNIx7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Oct 2021 04:53:59 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF53CC061570
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Oct 2021 01:51:54 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id f5so4858335pgc.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Oct 2021 01:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6jgDb3M3io+rP9GTtHizhwp9IylxMtBAssaQYLzeYCg=;
        b=OmQyXPE9dw0hzwqg//r4eNt027bVJ817n1HlHeR8D+ABNRYfheM/cZtGq4pfc2+hMI
         PYVznm7LYSbm9UklHIi/sEeBRJTnzJsyiLXIO8zv/Roz3WZNCxCGnBU905yPMutb8k9R
         f7mciwRHZD4dhca3G24oL1l0Kd7nhxcExgQ+gjKwukBoKzmKDTrkAEPY7sBiqS8i/STl
         Nif3TwwV7/xVo+NOq6oUrwtVr3cRtE7B9BvTMl6CVvoLF154lrcmmc14kmg5kXByGpyy
         273GQXDHh52cHxpp7pe8/BuGaOwD9EZsq8kRcjx5CO0PVxtubgeBCjs1+CgOJo6hkCOD
         zkdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6jgDb3M3io+rP9GTtHizhwp9IylxMtBAssaQYLzeYCg=;
        b=wleQ8LPRPqrFZpb907iZlboX/yVi4yvrAiSU4g89KRT7E68Evv+Q/bQ2A/Dh89ttFz
         6iK6ba+rZHtpBeGH4W/04vCZ25nJc00iupFLZECm5UxGOJRrYOu0FTQI9dLrpfsVYhVJ
         isUaw6KNhx67qPxhAnF8yFki2EOoCss0bWUEUbYD9vpXDJTZiX9n7zFMUTNPblxX2CFY
         NpF2CLyfPwVe+p72otCjnu6nWzlqZHgKf1GATMjmWle1Z34/UBybwZqVyvJxZ9v+ENWY
         Is+mL9UtJsVKqCXJ4OcR/FctaKx+E29o7SBFQ+mlGh8EF+JoLRp1NwN+a5w8okLuw+qz
         graA==
X-Gm-Message-State: AOAM531SCsRi/jeD0qnwNTxpDkAMBHT/0WSuCdeD6UpOcoHFs2cg+Yml
        Hme5GgE1IGSa0fWnqW02YCVdtelL84PVJ34oYD8=
X-Google-Smtp-Source: ABdhPJzVBS9jlVx01prr+6mCQWcsDOQkJBwL744a4eCFZpRrUT9Bc3LUdRP3EHSUtoB7JNU9cBnrrw==
X-Received: by 2002:a62:5209:0:b0:44c:68a7:3a61 with SMTP id g9-20020a625209000000b0044c68a73a61mr4181502pfb.83.1634201514511;
        Thu, 14 Oct 2021 01:51:54 -0700 (PDT)
Received: from localhost.localdomain ([8.47.15.154])
        by smtp.gmail.com with ESMTPSA id i2sm7968082pjt.19.2021.10.14.01.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 01:51:54 -0700 (PDT)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     Yanteng Si <siyanteng@loongson.cn>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 1/2] drm/msm: Fix missing include files in msm_gem.c
Date:   Thu, 14 Oct 2021 16:51:33 +0800
Message-Id: <15f30165e94574e4cd7c4da9f9c6fd1e320d4d8e.1634200323.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1634200323.git.siyanteng@loongson.cn>
References: <cover.1634200323.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Include linux/vmalloc.h to fix below errors:
error: implicit declaration of function 'vmap'

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 drivers/gpu/drm/msm/msm_gem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 40a9863f5951..198caa9c22e4 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/dma-map-ops.h>
+#include <linux/vmalloc.h>
 #include <linux/spinlock.h>
 #include <linux/shmem_fs.h>
 #include <linux/dma-buf.h>
-- 
2.27.0

