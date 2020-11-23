Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 598872C0444
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Nov 2020 12:26:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728879AbgKWLTj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 06:19:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728844AbgKWLTi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 06:19:38 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64DF8C061A4F
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2020 03:19:38 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id p22so17511412wmg.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2020 03:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4O9Wtg4ERk7UIKuJVRpIsYKCPive6atwfzd7DqykwOM=;
        b=Fv4WcU24S/mVuirgJJoD8NvlY3hjP06GFhM7tn1pNlSPQQHYkea0xN2LruNIN15ZHV
         wP5l4G3ZNipBvq5duw+OF9G4nJ7sjT303l6Rw2EkYYO8O7MQ3iqaY5PccncHX8gqiq3E
         V8Sf5cxO3BTT156CJgZT45SMdIEYG6Uv0D57dmy7+HGFzdjblGyacZ0KWpfvwXO/2vcI
         bZacMpgn8g/YiDQayXVV3KUx9+W5Rf1U0XJ724yAVa/y8SgXO2Z80tezZMfm5DMxUN5n
         ZtR9YBg1LT8PSnJmE3XvVSZEbQ+YFFOtsnD60T43tdbl6dThfdsNpzPI4i5xXk//Qs5l
         kJmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4O9Wtg4ERk7UIKuJVRpIsYKCPive6atwfzd7DqykwOM=;
        b=gcMnEtVsa7NVGe3MJPrAc4mCWPWpattGbaC7WssnFTjPXVMlpmXcX6qlnsb5+TWMWL
         iwAkQNZZRACN+snEGB7NU3Re3kgabTmFxn0QJvxAZ81DTQ0zl+VHHB/5wax9vSm27C0H
         Plarq8OO82vGNKOPlFCoBApnmgV7Tm2bPlmhogYnG+TxZ5OThV+hizT1xtvp8LmuC41k
         E71u3xdGNOmI+R/1MX8ZZLuLv4FrYBHUjvNzL8hY9up8iunfOk95oS8QcCglVrf9vfwI
         La044/D68SPMt5tJ/DFOdU5yu0hrnt4FLZdtCgpWJoSWn624uzO46UAbBcxsx0c1GtqN
         jRpg==
X-Gm-Message-State: AOAM531dFEh3hy4TcSoJHAw7PRXWC5KihK9/OqPsEqpC0F3YNkykcYQR
        qZn7CD135Hx9mgZl1td+kWjrBw==
X-Google-Smtp-Source: ABdhPJwqwvKgR7IXqRKhLFtae2xL4mkcspCLvAPV8ZXfa0zCpU98VktxupX7MmluRrNJDbEzVPxwsw==
X-Received: by 2002:a1c:f017:: with SMTP id a23mr23703118wmb.56.1606130377058;
        Mon, 23 Nov 2020 03:19:37 -0800 (PST)
Received: from dell.default ([91.110.221.218])
        by smtp.gmail.com with ESMTPSA id n9sm16317290wmd.4.2020.11.23.03.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 03:19:36 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 11/40] drm/msm/disp/dpu1/dpu_hw_blk: Add one missing and remove an extra param description
Date:   Mon, 23 Nov 2020 11:18:50 +0000
Message-Id: <20201123111919.233376-12-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201123111919.233376-1-lee.jones@linaro.org>
References: <20201123111919.233376-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c:28: warning: Function parameter or member 'hw_blk' not described in 'dpu_hw_blk_init'
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c:120: warning: Excess function parameter 'free_blk' description in 'dpu_hw_blk_put'

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c
index ca26666d2af91..819b26e660b9c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c
@@ -19,6 +19,7 @@ static LIST_HEAD(dpu_hw_blk_list);
 
 /**
  * dpu_hw_blk_init - initialize hw block object
+ * @hw_blk: pointer to hw block object
  * @type: hw block type - enum dpu_hw_blk_type
  * @id: instance id of the hw block
  * @ops: Pointer to block operations
@@ -114,7 +115,6 @@ struct dpu_hw_blk *dpu_hw_blk_get(struct dpu_hw_blk *hw_blk, u32 type, int id)
 /**
  * dpu_hw_blk_put - put hw_blk to free pool if decremented refcount is zero
  * @hw_blk: hw block to be freed
- * @free_blk: function to be called when reference count goes to zero
  */
 void dpu_hw_blk_put(struct dpu_hw_blk *hw_blk)
 {
-- 
2.25.1

