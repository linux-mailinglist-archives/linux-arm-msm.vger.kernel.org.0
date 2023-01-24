Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D20C67A402
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jan 2023 21:36:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229482AbjAXUgJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Jan 2023 15:36:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjAXUgI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Jan 2023 15:36:08 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55D6C23C7D
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jan 2023 12:36:03 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id az20so42364459ejc.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jan 2023 12:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HwFJKNSrUsLZF3pRcPrp9cxahQadgD7Il3ZvZ++NO24=;
        b=JGeYk1gZ7GM328h1VDCLBAJX4XuMLdrvCQ8Xai8Wui+Vs3NEsImHs0GaVYlf/TY3Ks
         Lvr0fMZ+Yk+UNWlc+FKMnesDSs4qscikSqjN+rQFr4tf8dSVv55W5Kni5oPqL/+8XU80
         SiiFesSnYBjdZ3JZlmlJxLxPrZNqVmwYqFFU7dCCXXNbpZ3j28pp0u9Qn92pgrAxlcNo
         wtMZtZBgRgo1c+qrd8uvHLNF2LpH0q58Ig4F0aeJvXfVAE0LarnX/Ziw1FFHO0gVm5kI
         3tSiJTlEjFoq0pRXYWfXOPqa4XkTEdf+d8lAjEGblJAcT02EsSr6JiXKcwpAU1htLxPc
         Rh9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HwFJKNSrUsLZF3pRcPrp9cxahQadgD7Il3ZvZ++NO24=;
        b=Cb6tg/glnWzCBsGCaEWqEwJ+t8akoYbshVCCxFTGP4MEfESf27jKS/FDdD5N7RNRT1
         k68yzdKf8i+DQZbT+nRKQqgA6fZJMB2r4xGvQST9wiURWHk1jU+l9l6MyyvVJKtRP50h
         Af6rNxL5Uf/9Zcd5kPmC/F5/tS1NephFDpwk79VMBx1dRujmEei6RsoTfpkO9KTAYW1y
         jSkIyR2+42I6zbrc5hU/0yMjeIvFBrIuZiQFRtzzhJ8fXMK+kZ8dpJLOCE1d0N5xOAjl
         dtE/KDk6exTdk7ybeGF4l68KRM+M8vmKaVO028ouH3MPoncFId/R9bOMwOb2txR2ENhw
         hV+A==
X-Gm-Message-State: AFqh2kohUj+lUaHuOyr5fJN+9BtC54pblwm1EuhxTQIV61wtC3a/thqF
        7nkIi1ss1y3lbRhBnfO0gXclGg==
X-Google-Smtp-Source: AMrXdXteP4LEALyM4F9F14V8cNbRWseI3yC7j7m0Zi38vdh9alw7GqXpHVWalztCignMGYQ9ufvPag==
X-Received: by 2002:a17:906:b34c:b0:7c0:b770:df94 with SMTP id cd12-20020a170906b34c00b007c0b770df94mr28169627ejb.63.1674592561881;
        Tue, 24 Jan 2023 12:36:01 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id j5-20020a170906050500b00780982d77d1sm1344255eja.154.2023.01.24.12.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 12:36:01 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/dsi: properly handle the case of empty OPP table in dsi_mgr_bridge_mode_valid
Date:   Tue, 24 Jan 2023 22:36:00 +0200
Message-Id: <20230124203600.3488766-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It was left unnoticed during the review that even if there is no OPP
table in device tree, one will be created by a call to the function
devm_pm_opp_set_clkname(). This leads to dsi_mgr_bridge_mode_valid()
rejecting all modes if DT contains no OPP table for the DSI host.

Rework dsi_mgr_bridge_mode_valid() to handle this case by actually
checking that the table is populated with frequency entries before
returning an error.

Fixes: 8328041b8c82 ("drm/msm/dsi: implement opp table based check for dsi_mgr_bridge_mode_valid()")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index b20fddb534a7..1bbac72dad35 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -456,18 +456,19 @@ static enum drm_mode_status dsi_mgr_bridge_mode_valid(struct drm_bridge *bridge,
 
 	byte_clk_rate = dsi_byte_clk_get_rate(host, IS_BONDED_DSI(), mode);
 
-	/*
-	 * fail all errors except -ENODEV as that could mean that opp
-	 * table is not yet implemented
-	 */
 	opp = dev_pm_opp_find_freq_ceil(&pdev->dev, &byte_clk_rate);
-	if (IS_ERR(opp)) {
-		if (PTR_ERR(opp) == -ERANGE)
+	if (!IS_ERR(opp)) {
+		dev_pm_opp_put(opp);
+	} else if (PTR_ERR(opp) == -ERANGE) {
+		/*
+		 * An empty table is created by devm_pm_opp_set_clkname() even
+		 * if there is none. Thus find_freq_ceil will still return
+		 * -ERANGE in such case.
+		 */
+		if (dev_pm_opp_get_opp_count(&pdev->dev) != 0)
 			return MODE_CLOCK_RANGE;
-		else if (PTR_ERR(opp) != -ENODEV)
-			return MODE_ERROR;
 	} else {
-		dev_pm_opp_put(opp);
+			return MODE_ERROR;
 	}
 
 	return msm_dsi_host_check_dsc(host, mode);
-- 
2.39.0

