Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB5AF514EF2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Apr 2022 17:14:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378210AbiD2PQo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Apr 2022 11:16:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378166AbiD2PQi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Apr 2022 11:16:38 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BD5DD4C54
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 08:13:16 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id g6so16076086ejw.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 08:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2I0IVGg0BbgV1kbTA3FjHG5NPrG7JlSoU1fPvx52hGk=;
        b=QUqOFZHfild3SFCFMiuVaM/8ojoUaHzc/sNxsWRcPWRBbykRgdH4LWMc/lKjYUdHUc
         V+VXdbx4oBB+09JhF8BWUKKE5w0KkoWAwVD8tVp8VJ6cU++Tlyb1RJRykxM0rtSokCEt
         bAEm2fGtw4S8H7v6aPRpOy0YfgUo5G1EyA+FlFBtQqoQoVJyuKSPEC5MfsJ+cGMk6e94
         YSxjQF1jd1deeW1cAduv3kT6EDaKU5JvA4JyAzYqLe5blCpCw1pL72ne/N7V1VWuNEge
         VlD6PPlkEmf8/rKCecr7LK40121FWrwqv9SIts6lH22BgHDKgVqHlh4OaTMEwKfejpDz
         fGrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2I0IVGg0BbgV1kbTA3FjHG5NPrG7JlSoU1fPvx52hGk=;
        b=tbRUXzepx04kTf5MiitnWOuatbmhg/JsSsXztoB3DHOS9H7ueW2j08dia5nuwQm5vi
         cCXQvVip9c7lUcvYPpoyxcjleRWXVfDRIkN6hGk6jB/RAgkoze5BMQBEbyfyXtnxKXdj
         KNLKdYGVfYwwbuff7F4poG/bXb7wpdAgNumpCvRRH9pnZszs1bb/z6pft2vkWd2VpkKn
         I9RbTq53hjvt23ACf2a6X4YjIfNpYCEVh269i2M9DnfCrCmAt5WAFogXR3zJcLl1vrYb
         hUW5KuuDjzGyh5vm2Xy9I2VFRd3tIofMX4WirDMeEvsAa1aIRSEpw2HGD3Mwn/DW3/8B
         fwcw==
X-Gm-Message-State: AOAM531X1CoD2L5tHfKQuPltL1Ku9GSqOYd9GvHHvaSUf8OzxTCF0eUY
        Yo1NxtRZwm+YaHpV2MMbLu1a2Q==
X-Google-Smtp-Source: ABdhPJyHoZGJ43TSX0cs2VBvX7DpGY3ixFpog1wfc7GyZhnw03bwgRZmK+WpJbSitfLu0V/9a1LKiQ==
X-Received: by 2002:a17:907:60d3:b0:6db:8b59:1564 with SMTP id hv19-20020a17090760d300b006db8b591564mr36772935ejc.228.1651245194937;
        Fri, 29 Apr 2022 08:13:14 -0700 (PDT)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
        by smtp.gmail.com with ESMTPSA id zp15-20020a17090684ef00b006f3ef214e4esm712677ejb.180.2022.04.29.08.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 08:13:14 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, jonathan@marek.ca, tdas@codeaurora.org,
        anischal@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v1 3/9] clk: qcom: sm8250-dispcc: Flag shared RCGs as assumed enable
Date:   Fri, 29 Apr 2022 17:12:41 +0200
Message-Id: <20220429151247.388837-3-robert.foss@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220429151247.388837-1-robert.foss@linaro.org>
References: <20220429151247.388837-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bjorn Andersson <bjorn.andersson@linaro.org>

The state of the shared RCGs found in the SM8250 dispcc can't reliably
be queried and hence doesn't implement the is_enabled() callback.

Mark the shared RCGs as CLK_ASSUME_ENABLED_WHEN_UNUSED, to ensure that
clk_disable_unused() will issue a disable and park the RCGs before it
turns off the parent PLLs - which will lock up these RCGs in any system
with continuous splash enabled.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/clk/qcom/dispcc-sm8250.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
index db9379634fb2..22d9cbabecab 100644
--- a/drivers/clk/qcom/dispcc-sm8250.c
+++ b/drivers/clk/qcom/dispcc-sm8250.c
@@ -214,7 +214,7 @@ static struct clk_rcg2 disp_cc_mdss_ahb_clk_src = {
 		.name = "disp_cc_mdss_ahb_clk_src",
 		.parent_data = disp_cc_parent_data_3,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_3),
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_ASSUME_ENABLED_WHEN_UNUSED,
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -546,7 +546,7 @@ static struct clk_rcg2 disp_cc_mdss_mdp_clk_src = {
 		.name = "disp_cc_mdss_mdp_clk_src",
 		.parent_data = disp_cc_parent_data_5,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_ASSUME_ENABLED_WHEN_UNUSED,
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -598,7 +598,7 @@ static struct clk_rcg2 disp_cc_mdss_rot_clk_src = {
 		.name = "disp_cc_mdss_rot_clk_src",
 		.parent_data = disp_cc_parent_data_5,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_ASSUME_ENABLED_WHEN_UNUSED,
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
-- 
2.32.0

