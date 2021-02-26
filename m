Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8524326935
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Feb 2021 22:20:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230032AbhBZVJN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Feb 2021 16:09:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230213AbhBZVJE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Feb 2021 16:09:04 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04803C06174A
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Feb 2021 13:08:24 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id n10so6937338pgl.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Feb 2021 13:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hVGDLSoE8Jf7sMQMQpGvt6Wf6tucKZ6z2KlnT/6iGGM=;
        b=VTRAUebOmOpB43+gbwH+sAbYpe+WigJDzenLk0ghSUS02Z8QA9duwmxELLrdkMDyHg
         bMGSqnRbCa/x7whpnyYq0HvqwsWIbm1iRnB6TbfGm1oCgCvSGkQF/oQtYvwVDF/lkvSp
         T5gTOh1rpTkbPuxkKdKD9CpkwkhiH6Ghpp3jM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hVGDLSoE8Jf7sMQMQpGvt6Wf6tucKZ6z2KlnT/6iGGM=;
        b=gy1k7DBQX8GtJiMZJgHCVDoBdsHCmHptdI+ZA480IA3nM0Ye5lvk9L4+4wEQOqtZEG
         Jug7MGAU+pYOp+U3vIn5MYQd8aQz5Z2j67w1nULhKrtrMFQ1ysKTMkGa9/bbS+0qty/i
         Ju/u4utfWa0SFiWvZMWCG6KHZdDK/KiyudHJ4QQ18bLr+4VcqH5Z/1uFdp+SDygO605h
         cANjxQnBGAYq6O9MvYzI5PaGPue7jAlcCuP2FQ/m2fV+Sr9yIuEp/6OLqsrc+VEKh4Vf
         1EtD6zwgIj0cg4eyVKoBOQc5QXb8M9aQK673wf3k55s/JuV8vYtqxvl74mvKrsjeVzaZ
         ldgQ==
X-Gm-Message-State: AOAM533JVsD4gBQgqPmYJhfENLaQfVWSEiQj9ICJqjgWk3QLEytA+/fk
        SxUhtX6fbTxxlbdvk8CpfYplRw==
X-Google-Smtp-Source: ABdhPJxfJ1Jo8odiEuLEvuDjrXHkdQ5hU5GY3FOzo4tifoV5AaWGnnEImfDgaWh3cPVLPr+a66Mfbw==
X-Received: by 2002:a62:7a88:0:b029:1ee:174:7c22 with SMTP id v130-20020a627a880000b02901ee01747c22mr5003531pfc.35.1614373703568;
        Fri, 26 Feb 2021 13:08:23 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:e8bb:5726:f58b:4e37])
        by smtp.gmail.com with ESMTPSA id u1sm6544501pfn.209.2021.02.26.13.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 13:08:23 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Kuogee Hsieh <khsieh@codeaurora.org>
Subject: [PATCH] drm/msm/dp: Restore aux retry tuning logic
Date:   Fri, 26 Feb 2021 13:08:21 -0800
Message-Id: <20210226210821.682107-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In commit 9fc418430c65 ("drm/msm/dp: unplug interrupt missed after
irq_hpd handler") we dropped a reset of the aux phy during aux transfers
because resetting the phy during active communication caused us to miss
an hpd irq in some cases. Unfortunately, we also dropped the part of the
code that changes the aux phy tuning when an aux transfer fails due to a
timeout. That part of the code was calling into the phy driver to
reconfigure the aux TX swing controls, working around poor channel
quality. Let's restore this phy setting code so that aux channel
communication is more reliable.

Cc: Kuogee Hsieh <khsieh@codeaurora.org>
Fixes: 9fc418430c65 ("drm/msm/dp: unplug interrupt missed after irq_hpd handler")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---

Noticed by code inspection and based on bug reports where the aux channel
stops working once the commit this is fixing is applied.

 drivers/gpu/drm/msm/dp/dp_aux.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index 1c6e1d2b947c..7c22bfe0fc7d 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -32,6 +32,8 @@ struct dp_aux_private {
 	struct drm_dp_aux dp_aux;
 };
 
+#define MAX_AUX_RETRIES			5
+
 static const char *dp_aux_get_error(u32 aux_error)
 {
 	switch (aux_error) {
@@ -377,6 +379,11 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
 	ret = dp_aux_cmd_fifo_tx(aux, msg);
 
 	if (ret < 0) {
+		if (aux->native) {
+			aux->retry_cnt++;
+			if (!(aux->retry_cnt % MAX_AUX_RETRIES))
+				dp_catalog_aux_update_cfg(aux->catalog);
+		}
 		usleep_range(400, 500); /* at least 400us to next try */
 		goto unlock_exit;
 	}

base-commit: 8b83369ddcb3fb9cab5c1088987ce477565bb630
-- 
https://chromeos.dev

