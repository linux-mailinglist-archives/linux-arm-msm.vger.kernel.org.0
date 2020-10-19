Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 540F2292FC5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Oct 2020 22:45:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728648AbgJSUpt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Oct 2020 16:45:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728573AbgJSUpr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Oct 2020 16:45:47 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCCD6C0613CE;
        Mon, 19 Oct 2020 13:45:47 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id e10so694508pfj.1;
        Mon, 19 Oct 2020 13:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t6k0W0LUpGL7/GToLy9vCWhiEXYilH3isH63u8Yx9dc=;
        b=bmzm4rvdVc0FLaxQTSGAk/qiwOyjhcoupgB5tSrmQrQFujkxbkIK3EjvXzLGowRROd
         rhuvPjTy7LFIpDHISKdvy+55RbO+w1ElfMOsxlWMBsGRG29YZ4JNY+zp+OUf+PqAKs4h
         Q1DJC1J6Y0VvtjFmzHKCveP0KQaiDUSgEu7//u+y6meSBNQjm29aadXUo3D7KV4loxS8
         Ucn13vLLgGyJa7L8NZVF7Zd/maxQclUhbLswskMRSEgBlAXIs1abXkdh9hY4v4QKZEP3
         fNVvhj6gsriIAofLRLx2SOcQ+ARdEtaHHXXt5fB7nQ7uF11GiTmOIEgA6gkLmytlBmVP
         Friw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t6k0W0LUpGL7/GToLy9vCWhiEXYilH3isH63u8Yx9dc=;
        b=OVG1tN6Xz/LAeftgT/lfTgA90rhDdnlidN0l0w/sBq/Fd134F+/pcmJ/XetYqoud+d
         U5ZEPZqpfR47ca3CoT50wBjKZTVApxQKXBWCh5Qddz10FbJnC+Mq/ifHiI4VB420ueG4
         WfbQ6sg982N2QfaGKco7o03irAOcM2NwK9Y45asRi4E/4IuMM+si2uvM731OLSvEu0ei
         c9g4mrrPviTMDOkPhJbCzMhDlUsWaioQt88GoqwI1+rxCgNjv3uW7TcSL/G82WSH9AzY
         mW8kLOfydXHznalJev5j7LKZpuIMf/e+YsBvTH4t5Bd/QjcIpcsDa3zKyyQlQY+Y6gk9
         fCIQ==
X-Gm-Message-State: AOAM532NKxGurqXU75NZ0175NzjXrOY+hTxTmEO0yLE83TxbdvImJM3/
        Pt+mmmL5aGcfGx2Y35tzNs4=
X-Google-Smtp-Source: ABdhPJzhXNzkAEZLMxJ0jIMcOrqAtXTdCMiRioH5V6wLNqieqHhykmoBwyeBDpqxkFSN38NHpriFYg==
X-Received: by 2002:a62:1806:0:b029:152:4311:a19d with SMTP id 6-20020a6218060000b02901524311a19dmr1468674pfy.20.1603140347391;
        Mon, 19 Oct 2020 13:45:47 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id n5sm627341pfq.46.2020.10.19.13.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 13:45:46 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 08/23] drm/msm: Do rpm get sooner in the submit path
Date:   Mon, 19 Oct 2020 13:46:09 -0700
Message-Id: <20201019204636.139997-9-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201019204636.139997-1-robdclark@gmail.com>
References: <20201019204636.139997-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Unfortunately, due to an dev_pm_opp locking interaction with
mm->mmap_sem, we need to do pm get before aquiring obj locks,
otherwise we can have anger lockdep with the chain:

  opp_table_lock --> &mm->mmap_sem --> reservation_ww_class_mutex

For an explicit fencing userspace, the impact should be minimal
as we do all the fence waits before this point.  It could result
in some needless resumes in error cases, etc.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 002130d826aa..a9422d043bfe 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -744,11 +744,20 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 
 	ret = submit_lookup_objects(submit, args, file);
 	if (ret)
-		goto out;
+		goto out_pre_pm;
 
 	ret = submit_lookup_cmds(submit, args, file);
 	if (ret)
-		goto out;
+		goto out_pre_pm;
+
+	/*
+	 * Thanks to dev_pm_opp opp_table_lock interactions with mm->mmap_sem
+	 * in the resume path, we need to to rpm get before we lock objs.
+	 * Which unfortunately might involve powering up the GPU sooner than
+	 * is necessary.  But at least in the explicit fencing case, we will
+	 * have already done all the fence waiting.
+	 */
+	pm_runtime_get_sync(&gpu->pdev->dev);
 
 	/* copy_*_user while holding a ww ticket upsets lockdep */
 	ww_acquire_init(&submit->ticket, &reservation_ww_class);
@@ -825,6 +834,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 
 
 out:
+	pm_runtime_put(&gpu->pdev->dev);
+out_pre_pm:
 	submit_cleanup(submit);
 	if (has_ww_ticket)
 		ww_acquire_fini(&submit->ticket);
-- 
2.26.2

