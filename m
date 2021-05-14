Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 838673812D5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 May 2021 23:31:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232369AbhENVcg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 May 2021 17:32:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:55178 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229504AbhENVcf (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 May 2021 17:32:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4D9306140A;
        Fri, 14 May 2021 21:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621027884;
        bh=r4ZITb5VahQ1bp4eOnHrhuqUyrRIdgRO+1xUikzpyiU=;
        h=From:To:Cc:Subject:Date:From;
        b=YxucMdfrO3LsjOLFgbwf4gd1fZXfgu1IvyP2icIRwYCV4bedtaWMzi1WGRNs0Eowl
         tXuYLbhMVhEqACnTNhbLJBvJzz1S1cnhww1BzNrVek3qqJ9X7QsjegPzRvrgOmZqpY
         oPBoQQcwqIinJ4IBNcFEgcMigj7WzH7dbEyc1kgzL/owH6UttN0NYnfLnYd9oiqrIX
         Cgb5M/SOrlWGpzdDrC4AJaCUtAMk8BDOLRtOpnXef19SaUjzjnSoIVE8kHr0dIsD23
         7yBmUtwPDb/CzoliYRLu9Jx7O64M1056cFB//tOzWcpL3bkMJjHuIRm0Lju5wZL0sr
         0+Q1xtHzt8zhA==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com
Subject: [PATCH] drm/msm/dsi: fix 32-bit clang warning
Date:   Fri, 14 May 2021 23:30:17 +0200
Message-Id: <20210514213032.575161-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

clang is a little overzealous with warning about a constant conversion
in an untaken branch of a ternary expression:

drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c:975:48: error: implicit conversion from 'unsigned long long' to 'unsigned long' changes value from 5000000000 to 705032704 [-Werror,-Wconstant-conversion]
        .max_pll_rate = (5000000000ULL < ULONG_MAX) ? 5000000000UL : ULONG_MAX,
                                                      ^~~~~~~~~~~~

Rewrite this to use a preprocessor conditional instead to avoid the
warning.

Fixes: 076437c9e360 ("drm/msm/dsi: move min/max PLL rate to phy config")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
As found with another patch, using __builtin_choose_expr() would
likely also work here, but doesn't seem any more readable.
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index e76ce40a12ab..accd6b4eb7c2 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -972,7 +972,11 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
 		.restore_pll_state = dsi_7nm_pll_restore_state,
 	},
 	.min_pll_rate = 600000000UL,
-	.max_pll_rate = (5000000000ULL < ULONG_MAX) ? 5000000000ULL : ULONG_MAX,
+#ifdef CONFIG_64BIT
+	.max_pll_rate = 5000000000UL,
+#else
+	.max_pll_rate = ULONG_MAX,
+#endif
 	.io_start = { 0xae94400, 0xae96400 },
 	.num_dsi_phy = 2,
 	.quirks = DSI_PHY_7NM_QUIRK_V4_1,
-- 
2.29.2

