Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F102F507D66
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Apr 2022 01:55:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358541AbiDSX5t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Apr 2022 19:57:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357843AbiDSX5f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Apr 2022 19:57:35 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63CF5E24
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 16:54:50 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id x17so32104055lfa.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 16:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bvNMSN3pjje8DO8VKt+U/tOaBPxKcUXo89mN7XSq4VA=;
        b=nWz2J/9FyHAu9c4LAOFJi56mLrG3hncYMeMG7WQmK9BCcR48yGQnhsD7fmJsGOSF2+
         Z/91Q1S5n+B9GILgoq1zRZZkO2ZNEolOvDS1XWOx5nPGoYaGpHZgppET/Mt5pjLExr1V
         h+CvRplZpiGqBAtFiXPT4WhhBcDCj/PwbKpMb25AwQhBIvYhvB7GhawJEATPnszn0pWu
         DmtB7PI5umXOsFnGgvTAtPoQ5IPBqwdR2S1FwsNag9INcST/lgFInL/xDqzdfdRBWlCF
         zqRs6hVI9E7U/YQakjfz93ExlevzIU/mQb6SGe8gVTsHWUnDPNQxB5YymcgcrvFKCMvq
         VwrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bvNMSN3pjje8DO8VKt+U/tOaBPxKcUXo89mN7XSq4VA=;
        b=7ZZzJOxUMeWDxUl2vqpRl4r+FiRxr3XJFyBNx9SIjHcC2DKF1Q6mTbe5Rt/Byk9OrA
         xSoeIj9SM8WnMWvGBU4BMyIKLkEA+8MADme4Oo5/vW974B5cEjXQnz4Hsj4UPnP12bpL
         5fT74p4LmNrwXF8aPUh5Pj7Hd0oLH0C59yiNfxbPLlTiOlS95MrJuGvuvivmEa2Xj0B/
         sobnf2XUywJT9j8p27+pMQNPQBCXaiVmhaTID8B3W3O/BuLAOpn68e8VsHf/QZ++VszO
         mt3OkF0ZcE5eUGbyaPphOA6m7D233Ck4mIcgqAYRVJhRh1+Y7nQz45vJWdqSHsMdIFdu
         tz7A==
X-Gm-Message-State: AOAM533CTXlejAIkFjSH0/qbccaIfdJlsaS2ptUSaR0PCUyIX/MRaS4m
        Ae1M36gPgo8WBqdK7k2nP7Pds/UzMdSQUA==
X-Google-Smtp-Source: ABdhPJx7XT4j1TOlMM92aT+5eWOjZGo3AhiUgM2QzsVkznUoE4H9dn+nAStfZOGFuIvdIa0nYUngsA==
X-Received: by 2002:a05:6512:e87:b0:44a:5117:2b2b with SMTP id bi7-20020a0565120e8700b0044a51172b2bmr13043804lfb.275.1650412488676;
        Tue, 19 Apr 2022 16:54:48 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v9-20020a2e7a09000000b0024dbdd8e297sm647725ljc.19.2022.04.19.16.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 16:54:48 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>,
        freedreno@lists.freedesktop.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH] clk: qcom: clk-rcg2: fix gfx3d frequency calculation
Date:   Wed, 20 Apr 2022 02:54:47 +0300
Message-Id: <20220419235447.1586192-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Since the commit 948fb0969eae ("clk: Always clamp the rounded rate"),
the clk_core_determine_round_nolock() would clamp the requested rate
between min and max rates from the rate request. Normally these fields
would be filled by clk_core_get_boundaries() called from
clk_round_rate().

However clk_gfx3d_determine_rate() uses a manually crafted rate request,
which did not have these fields filled. Thus the requested frequency
would be clamped to 0, resulting in weird frequencies being requested
from the hardware.

Fix this by filling min_rate and max_rate to the values valid for the
respective PLLs (0 and ULONG_MAX).

Fixes: 948fb0969eae ("clk: Always clamp the rounded rate")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-rcg2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index f675fd969c4d..e9c357309fd9 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -818,7 +818,7 @@ EXPORT_SYMBOL_GPL(clk_pixel_ops);
 static int clk_gfx3d_determine_rate(struct clk_hw *hw,
 				    struct clk_rate_request *req)
 {
-	struct clk_rate_request parent_req = { };
+	struct clk_rate_request parent_req = { .min_rate = 0, .max_rate = ULONG_MAX };
 	struct clk_rcg2_gfx3d *cgfx = to_clk_rcg2_gfx3d(hw);
 	struct clk_hw *xo, *p0, *p1, *p2;
 	unsigned long p0_rate;
-- 
2.35.1

