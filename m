Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08C7129754D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Oct 2020 18:53:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752262AbgJWQwR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Oct 2020 12:52:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752745AbgJWQu3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Oct 2020 12:50:29 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3364CC0613D2;
        Fri, 23 Oct 2020 09:50:29 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id 126so1367854pfu.4;
        Fri, 23 Oct 2020 09:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1nFWz7TauCZeK9jB7qRHq2/DLyA1MoAVvcU8Ul/qSVc=;
        b=AjUHdScRbMGE0mb7wPFvxl2OkcajrtiwNnNTYoW4VNn95/pHATQekqrYNMB35rNdfE
         DlyAKcTOQmVWtuWK/Y6dNzVHpNs/AxONzsZU9N1r6o+HAjZhr5WemklERI/8JkuGce49
         bi9kLWgn7SozK0QUTp2+h3yppZ0RjcbVukc52uSwu3tMQ1VaJ6rwdzYTsbYtn5JrRziv
         RkTT6vH1NYnOSptD9tyzxkvDB9pM4LaFI80SR+PKOL/LAQMN5UodLG9jLoed+ptidhtB
         NnUViLYmbPs6hyl8BGTpdVXNlck7m3RAEOAh/x6/sB8IH7DVkxrn4nLhuAHZUrXzoF6F
         c52Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1nFWz7TauCZeK9jB7qRHq2/DLyA1MoAVvcU8Ul/qSVc=;
        b=lx8pyL3vm6k/QsLq4pcji5i5uWc1qv4dFgf/Q85CVRcFLY8hmCVdoJui3J09S0EmV2
         ToVwnddR0wszlu+q6H6txKRpCAugBbZ9mnc73IGDkt0aIZfYEUVPGsONMSfQ1DABQZ/i
         mleZeBzldOffJSpVPb1KmMsy6DhjPFAaAEhMT981tCO5CKgOxX8htd7fEISyDblQNIIv
         aGR36o4m//rf4NPXfGoOWN8JqAnB4AP2vNcm0EyPhojzjddbXKiQKY5EfdQleoJCU/p/
         g0IBqIY8kdzCvRNgXPumxmm2gV6lP21TEDHYoPr9sQVUKEVHTULndJV/YD23QJPjpMtk
         NYZA==
X-Gm-Message-State: AOAM531kRtXfvqisPwY3u0029dO3ig1/56P2qcG/8uMme8gyV9xy0+q2
        VNcAm5SG8/PJXqS0E6NlQQ8=
X-Google-Smtp-Source: ABdhPJxClr5yl2UDdlPhpEcmq7MchF1xsGWuH2QJzB2FK+8JOjLnLaUbvyvCGaXCRQpd+dnyymFjuw==
X-Received: by 2002:a62:1856:0:b029:155:1718:91a3 with SMTP id 83-20020a6218560000b0290155171891a3mr94730pfy.66.1603471828701;
        Fri, 23 Oct 2020 09:50:28 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id u14sm3443232pjf.53.2020.10.23.09.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 09:50:27 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 08/23] drm/msm: Do rpm get sooner in the submit path
Date:   Fri, 23 Oct 2020 09:51:09 -0700
Message-Id: <20201023165136.561680-9-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201023165136.561680-1-robdclark@gmail.com>
References: <20201023165136.561680-1-robdclark@gmail.com>
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
Reviewed-by: Kristian H. Kristensen <hoegsberg@google.com>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index b6c258c89290..aa3c7af54079 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -750,11 +750,20 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 
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
@@ -831,6 +840,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 
 
 out:
+	pm_runtime_put(&gpu->pdev->dev);
+out_pre_pm:
 	submit_cleanup(submit);
 	if (has_ww_ticket)
 		ww_acquire_fini(&submit->ticket);
-- 
2.26.2

