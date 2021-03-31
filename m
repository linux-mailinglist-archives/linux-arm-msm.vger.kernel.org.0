Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03275350A06
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 00:14:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232716AbhCaWNj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 18:13:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229787AbhCaWNK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 18:13:10 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3CCCC061574;
        Wed, 31 Mar 2021 15:13:09 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id y2so8629836plg.5;
        Wed, 31 Mar 2021 15:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OhRKnjnp04/KR/sSNoa+tu/vhEXwdj63Uk5C6mZJOQk=;
        b=R61jEIdU7UJlduyCmpi1FgYLKVeDrBBnWycok2VFemsAh8ONoU6Ct/jfQFcIDuxI1B
         cL0Ahh1wL0jtMlDTsygl9ed4T3bDYtTbLXcwB9uT7W3dYPCQlCxQgdJ9tpyPcaYtguhG
         TnevF4xcxxWQVmYJu32jkfE29aQP4m/IyI9g+cqdxuHAvayoZKNOWYjXVjpdzbXixmOd
         NV30uRz65bYHZ4b/0KZRbeA0GRMKAwk8J10MR25VmWvBPEt7wO0vlQrrNjXBA1wPfX7s
         kE98yJByo8AWC7cEIO9QliGVpm+GFX2FyNKLmgTPMGg8Ha7W27Q0QLTZZZrSq/1EX4Fn
         DSLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OhRKnjnp04/KR/sSNoa+tu/vhEXwdj63Uk5C6mZJOQk=;
        b=hvt4wPim+B9Aaf2ET++N4PjX7YY7LLrW5kvs6NEAD/Jm6IiR2OYkx1/HEsJLFSE47q
         TMx8lLWsWy7xrIoxLkEq3U2D02S2qM1+wb4TbfJtFq4BAt3Fzvq4bO9W6GfF1iEpkKxw
         /nVV+fTlZQkGQOeUlbCz0vMpIeopMYoBAa1AhyVn3Jqp/e2r0j+sq7k+s0Jdm+1SCMDa
         bsm/9u0cPVmWy17WmivM4m04DKX45lF6j1m55sw93LmBRJfayEsrheQA9U1f1kEj0ZS5
         nlos1+5SOmi3CsX5cJAjIFgqwq1XHsePQNJiAMlC8onRV1Xk/8424HzZ2n7wCXoXmF+z
         8Zow==
X-Gm-Message-State: AOAM532JBCI6i18n5yeAYZbnGHp3j2Knd7Z+wpUTHkLlMoUC0QEIwp6D
        Zs3OZEncgYeedUHF+wJcNBQ=
X-Google-Smtp-Source: ABdhPJzx4z92OqXjJmA2aDQUjVGO3fWl15Kt1bf1LZ1Za5EpQuUlXCbs5blxseMptA2QArFmtiPUWQ==
X-Received: by 2002:a17:90b:fce:: with SMTP id gd14mr5702746pjb.8.1617228789609;
        Wed, 31 Mar 2021 15:13:09 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id gm9sm3035227pjb.13.2021.03.31.15.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 15:13:08 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/4] drm/msm: Remove unused freed llist node
Date:   Wed, 31 Mar 2021 15:16:26 -0700
Message-Id: <20210331221630.488498-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210331221630.488498-1-robdclark@gmail.com>
References: <20210331221630.488498-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Unused since c951a9b284b907604759628d273901064c60d09f

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index b3a0a880cbab..7a9107cf1818 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -78,8 +78,6 @@ struct msm_gem_object {
 
 	struct list_head vmas;    /* list of msm_gem_vma */
 
-	struct llist_node freed;
-
 	/* For physically contiguous buffers.  Used when we don't have
 	 * an IOMMU.  Also used for stolen/splashscreen buffer.
 	 */
-- 
2.30.2

