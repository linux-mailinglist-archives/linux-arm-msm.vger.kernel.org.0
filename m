Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD1123766F3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 May 2021 16:16:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237520AbhEGOR6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 May 2021 10:17:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233115AbhEGOR5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 May 2021 10:17:57 -0400
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D72B1C061574
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 May 2021 07:16:57 -0700 (PDT)
Received: by mail-qv1-xf29.google.com with SMTP id z1so4856654qvo.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 May 2021 07:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CrsCAQJk5ZnVE8tHLcfB4TXYodmjeHRejfnH2DA3Xwo=;
        b=gNmi0I+4CIYhNbZW0mjW8xkLfbDle3nmeSHl3j6E8TPjhsuWwRmnSwbeE6MHpKhUI7
         mc2Wo5bRyjZUO09n3MPdnG8XOfARJg842Eez33T8q57wX4PY/bDUrzlhrKP73P8CuJKJ
         ugEs4LCsqjhO3wOEkdr7TYYl0RsHgIgNJSl8vvNQ15o5BCyHaGf0Q+aqq/NlIjL/nt2O
         5zIx1jTVT7Mqd8GXWZ716NkdOOExYzd1lTr/SAUQmHG4WJ1f5cGH0oPcckrBxup9olDF
         R9DgA9WquRKw/btJaBOmn9iMnIhzDQa1ZQN7xv38apNm5nPHQZ3zQ+V+AhBSIIlsBJS/
         hhOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CrsCAQJk5ZnVE8tHLcfB4TXYodmjeHRejfnH2DA3Xwo=;
        b=k70zwC4E2dGsLzqWFT6LBoxp7npZmZ+tIIVF086fwpG6vQ96NKKY1jqgAhQnM50DjV
         rRFb62lIepdV9vWH+6QKujy8IvfWgoo7dqxxE+SYerYzrlmudovSt/ZtMjoFJmWbTfEd
         gtLjfhl+NaYGQ0Ae5eO4Fla2Sw7okuxKZ6lXxueoB/sH5I8fvFbUoA9jpBEbeXRh6SlQ
         N2eWlbsidplmB7pC1lwCWcNsPBYd8796d3CVITnzE1GAlxNYo0PicHCPEor9QUDECEX6
         y7BcDT7LW37o4pSSajCLw1U2Q5dx3z6951QxPFHnUy9evr4T6x8o4V9uPEO0UTzoT7f8
         08EQ==
X-Gm-Message-State: AOAM532Z1WvNYZ/CtRWQOSYDA8RMaOfKwB4JZpF3YB6MimEAAGpeqkU+
        xRuAsIXjZP2zmlB38gtvHhilug==
X-Google-Smtp-Source: ABdhPJxp56tr64aqcM62OQw+TwL3qUEpuXjmL1PUPxM/z2GmPIuBhQjZC4jfARWKPzrg8mF7L12rlg==
X-Received: by 2002:a0c:dd01:: with SMTP id u1mr10179642qvk.32.1620397017195;
        Fri, 07 May 2021 07:16:57 -0700 (PDT)
Received: from localhost ([172.58.157.149])
        by smtp.gmail.com with ESMTPSA id r8sm4642098qtc.24.2021.05.07.07.16.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 May 2021 07:16:56 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm: Fix uninitialized var usage in dsi_phy_28nm_8960.c
Date:   Fri,  7 May 2021 10:16:43 -0400
Message-Id: <20210507141651.2887-1-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

This patch fixes the following error:

drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c:425:11: error: variable 'parent_name' is uninitialized when used here
[-Werror,-Wuninitialized]
        snprintf(parent_name, 32, "dsi%dvco_clk", pll_28nm->phy->id);
                 ^~~~~~~~~~~
drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c:385:30:
note: initialize the variable 'parent_name' to silence this warning
        char *clk_name, *parent_name, *vco_name;
                                    ^
                                     = NULL
1 error generated.
make[5]: ***
[scripts/Makefile.build:279: drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.o] Error 1

It looks like the allocation was inadvertently deleted.

Fixes: 5d13459650b3 ("drm/msm/dsi: push provided clocks handling into a generic code")

Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Stephen Boyd <swboyd@chromium.org>
Cc: Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Rob Clark <robdclark@chromium.org>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
index 582b1428f971..86e40a0d41a3 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
@@ -405,6 +405,10 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **prov
 	if (!vco_name)
 		return -ENOMEM;
 
+	parent_name = devm_kzalloc(dev, 32, GFP_KERNEL);
+	if (!parent_name)
+		return -ENOMEM;
+
 	clk_name = devm_kzalloc(dev, 32, GFP_KERNEL);
 	if (!clk_name)
 		return -ENOMEM;
-- 
Sean Paul, Software Engineer, Google / Chromium OS

