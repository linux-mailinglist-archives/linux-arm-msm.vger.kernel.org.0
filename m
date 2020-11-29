Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA89F2C7A77
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Nov 2020 19:11:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727739AbgK2SL2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 29 Nov 2020 13:11:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727556AbgK2SL1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 29 Nov 2020 13:11:27 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EC16C0613CF;
        Sun, 29 Nov 2020 10:10:47 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id w4so8549579pgg.13;
        Sun, 29 Nov 2020 10:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EVR6Dei8Bnt3OCxC95LBwIuM/4G2sFcsm8vaAAg9zHw=;
        b=pLbgtMYF6C4LhXbvtthI4VE4GeH7PSNJTDAReVjFExXzpHh9hosl9/odkNkV8cZcrw
         h6VVppYcTosIljKdoD3kiKU0YX/qPgzuZfq7ZcDsj8bs7QE1RJngAiyvogjZ3sr7y0yL
         xgWvv+MEQ/6UQGIrPoFDhBrqwtuGIJ1eAMWkrDMWc61qzy1vuYYyYU5tHe04T3jjSwER
         kCBH5Ygx0/uKXWSKacL1u32RRU/DL4njb62ZAE7h5iX9tSeCjugKGn0/fsV4B1G89s+a
         KMd0FnmXwMDszqCCl8iGZXB47Z6SQ6q9unAnX2/vRMolOwnjTD1W8BtTMxwimExAdjIe
         LawQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EVR6Dei8Bnt3OCxC95LBwIuM/4G2sFcsm8vaAAg9zHw=;
        b=t47M1GwdEAuXojhjowQmI5xc1Q13ctf7K9G0bDfow8MkahULgavb7SVAcJrQHI9RYd
         kbBYZqeJ6K6sT6oRNDk8+X0nqUyIGh+lbPYheInZ9PkQWGLW86emNAzr3HeD7CAo0W3P
         5S300Z2EFne5BGiRmm5nx6Hyeo+aQPobpN3wkDykef74LM1+hLCR7C7B69m1M7y4XkSr
         sJ5tss6DzdnScpReBoiduBxvtry1YTLpbejEiK/1dEs2JN1JUpOf2LceedNoVw8iQpbZ
         WZC6dOUcNQn+o57fUj59eSeC0A7aqD8ZR696DM/0dUq/Q9Z+7k9Yr7Xv+iowKhrKP6X9
         flTw==
X-Gm-Message-State: AOAM53133h9xvNv2U43wmm8sI55QChkFVqNcd6CaIBI0OCJ2rJJq2Zh5
        vOp3cBW2X2w2Fp7ToZsuZxc=
X-Google-Smtp-Source: ABdhPJzn7CuP2SUe4fgH+BNUk3eUTnzgiUKfmd5REq9zmWNXr/V2XilbUSU9UY5tJ6B4x0F0B4Y7rg==
X-Received: by 2002:a17:90a:5905:: with SMTP id k5mr21915670pji.198.1606673446893;
        Sun, 29 Nov 2020 10:10:46 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id bf3sm5142567pjb.45.2020.11.29.10.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Nov 2020 10:10:45 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] msm/mdp5: Fix some kernel-doc warnings
Date:   Sun, 29 Nov 2020 10:12:40 -0800
Message-Id: <20201129181243.1091742-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:227: warning: Function parameter or member 'ctl' not described in 'mdp5_ctl_set_encoder_state'
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:227: warning: Function parameter or member 'pipeline' not described in 'mdp5_ctl_set_encoder_state'
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:227: warning: Function parameter or member 'enabled' not described in 'mdp5_ctl_set_encoder_state'
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:227: warning: Excess function parameter 'enable' description in 'mdp5_ctl_set_encoder_state'
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:529: warning: Function parameter or member 'ctl' not described in 'mdp5_ctl_commit'
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:529: warning: Function parameter or member 'pipeline' not described in 'mdp5_ctl_commit'
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:529: warning: Function parameter or member 'flush_mask' not described in 'mdp5_ctl_commit'
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:529: warning: Function parameter or member 'start' not described in 'mdp5_ctl_commit'

Cc: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
index 030279d7b64b..81b0c7cf954e 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
@@ -216,7 +216,9 @@ static void send_start_signal(struct mdp5_ctl *ctl)
 /**
  * mdp5_ctl_set_encoder_state() - set the encoder state
  *
- * @enable: true, when encoder is ready for data streaming; false, otherwise.
+ * @ctl:      the CTL instance
+ * @pipeline: the encoder's INTF + MIXER configuration
+ * @enabled:  true, when encoder is ready for data streaming; false, otherwise.
  *
  * Note:
  * This encoder state is needed to trigger START signal (data path kickoff).
@@ -510,6 +512,13 @@ static void fix_for_single_flush(struct mdp5_ctl *ctl, u32 *flush_mask,
 /**
  * mdp5_ctl_commit() - Register Flush
  *
+ * @ctl:        the CTL instance
+ * @pipeline:   the encoder's INTF + MIXER configuration
+ * @flush_mask: bitmask of display controller hw blocks to flush
+ * @start:      if true, immediately update flush registers and set START
+ *              bit, otherwise accumulate flush_mask bits until we are
+ *              ready to START
+ *
  * The flush register is used to indicate several registers are all
  * programmed, and are safe to update to the back copy of the double
  * buffered registers.
-- 
2.28.0

