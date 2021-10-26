Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4398243AE29
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Oct 2021 10:34:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232773AbhJZIfb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Oct 2021 04:35:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:55694 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234242AbhJZIfW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Oct 2021 04:35:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A34D560E75;
        Tue, 26 Oct 2021 08:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635237179;
        bh=uCkPTVoU53WjkdLeoB8wj5W6HHDIndi8XX783vkYnKc=;
        h=From:To:Cc:Subject:Date:From;
        b=Gnv4MSVeqWWK56HzvTnGFjdyR/wiG3tDifj8A5YLdfJ/4f8btdSbqrXjKstEWmLyf
         QUIlgZFQzmlVv+P2lYbmy1ty/dE3+j074o2VXsuTjFxqT0LYvr8AQpTJQ8NrkbYdqZ
         75pQMJSPAT0ASTXKy0FKHtF5MZxuVqUGbnuxEz4hCJRhmp+8HOYpIUCB1xV6T553Dv
         IxZmfJqqbod7V1leev1sqxjIvnDo1WD9KtY6xaoSIkNXrxl3SGxvH6mX84Ox4SQyJM
         910fPjNsidwc/V5b7+jTjmst0vKF9iw+misyqbT3x3lKwdaWilCULzcAOBEUQVCnDc
         0PRBT2rbeHA3A==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/dp: fix missing #include
Date:   Tue, 26 Oct 2021 10:32:41 +0200
Message-Id: <20211026083254.3396322-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

Some randconfig builds fail when drm/drm_bridge.h is not included
implicitly in this file:

drivers/gpu/drm/msm/dp/dp_parser.c:279:25: error: implicit declaration of function 'devm_drm_panel_bridge_add' [-Werror,-Wimplicit-function-declaration]
        parser->panel_bridge = devm_drm_panel_bridge_add(dev, panel);

Fixes: 4b296d15b355 ("drm/msm/dp: Allow attaching a drm_panel")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/msm/dp/dp_parser.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
index 81dbcc86d08a..a7acc23f742b 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -8,6 +8,7 @@
 
 #include <drm/drm_of.h>
 #include <drm/drm_print.h>
+#include <drm/drm_bridge.h>
 
 #include "dp_parser.h"
 #include "dp_reg.h"
-- 
2.29.2

