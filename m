Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4452D41F277
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Oct 2021 18:50:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355210AbhJAQwD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 12:52:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352696AbhJAQwD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 12:52:03 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BFE9C061775
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Oct 2021 09:50:18 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id g41so40862917lfv.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Oct 2021 09:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z/4G9vgAEk+347Zn9eb+ZAGOAkOwqhySgRQtqU2xH8A=;
        b=LHQTDyqMA4HpiTqHGSqD7z+pmM1cbi9k0rEeOMYnHVY8ya5KNnSAwVogIZCTJWYkbl
         HPoBQmBixW04wPiOZq38dZcOL98kS3o7kJGk2AxawJRdDiX+7KHCcWjQRuv5yRi5NBY0
         agPmY68EmkoYpTJ8w5Sf02kpJO2wjhCZZjIWy2X3+HZ47w1pctbUHmAe+BwCJdUc0TQm
         vu2rTaZS1tP310WamJ0Q4a5/gCznv8KHu4yaME6sC1u4ceGmR1rp823xIVxfhGIqvDIf
         32UynKpf/MCyV9ToGQU5BAN5QGVOyk5UjkiluFdo+dxdEMuAOxtKMSQcx6PNPQuIk/2K
         5eIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z/4G9vgAEk+347Zn9eb+ZAGOAkOwqhySgRQtqU2xH8A=;
        b=cqrF78AiRrlbU9bZuxLYA3ivJbECZ0i6urWK14lf+qevO8OePRC8iX8t9C/Tq4MzLp
         Fz470cch7cI7dfmrdra0v1R+QCgpYlRKljkKgl0L1v8VbH/U+nfETWp3eneRbWIE0zel
         Ez6niukA8Y9+oaVl2IBCFfea263oXyJKj5Ii1/GEpf6NeImS9rgR/8HZaxG3s+N5hktJ
         V/PKJIdVqbBa/eu63x6TAx/ASlIp7dTiR4ut/+zWbO/XYxKgEjSY52K6LfpQq9jRJfVg
         WujW3BVBoR0EdbaBAnBrLinq7xEDy9RCrK+gQJamsep3Brv6Dziw+S5X2Te08DoZznqg
         iQIw==
X-Gm-Message-State: AOAM532BoAPSoFInI7s+77fz3f7+0Nk7EMTOIYBjwVV6MIxqNObcbpoT
        b3/utJ7FXB/jCtxAV9SK6XSVgA==
X-Google-Smtp-Source: ABdhPJzkHZSNcqsjg13S+lAYsg5LtJPkpuOdkh2vYaxSFaqjldIgW17EDxKXWS6QZeYGnubmGFFJ6A==
X-Received: by 2002:a2e:5807:: with SMTP id m7mr13160180ljb.25.1633107016953;
        Fri, 01 Oct 2021 09:50:16 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id n24sm787052lfq.294.2021.10.01.09.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 09:50:16 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 3/3] dt-bindings: display/msm: remove edp.txt
Date:   Fri,  1 Oct 2021 19:50:11 +0300
Message-Id: <20211001165011.441945-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211001165011.441945-1-dmitry.baryshkov@linaro.org>
References: <20211001165011.441945-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

eDP driver is being removed, so drop bindings description.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/msm/edp.txt   | 56 -------------------
 1 file changed, 56 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/msm/edp.txt

diff --git a/Documentation/devicetree/bindings/display/msm/edp.txt b/Documentation/devicetree/bindings/display/msm/edp.txt
deleted file mode 100644
index eff9daff418c..000000000000
--- a/Documentation/devicetree/bindings/display/msm/edp.txt
+++ /dev/null
@@ -1,56 +0,0 @@
-Qualcomm Technologies Inc. adreno/snapdragon eDP output
-
-Required properties:
-- compatible:
-  * "qcom,mdss-edp"
-- reg: Physical base address and length of the registers of controller and PLL
-- reg-names: The names of register regions. The following regions are required:
-  * "edp"
-  * "pll_base"
-- interrupts: The interrupt signal from the eDP block.
-- power-domains: Should be <&mmcc MDSS_GDSC>.
-- clocks: device clocks
-  See Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
-- clock-names: the following clocks are required:
-  * "core"
-  * "iface"
-  * "mdp_core"
-  * "pixel"
-  * "link"
-- #clock-cells: The value should be 1.
-- vdda-supply: phandle to vdda regulator device node
-- lvl-vdd-supply: phandle to regulator device node which is used to supply power
-  to HPD receiving chip
-- panel-en-gpios: GPIO pin to supply power to panel.
-- panel-hpd-gpios: GPIO pin used for eDP hpd.
-
-
-Example:
-	mdss_edp: qcom,mdss_edp@fd923400 {
-			compatible = "qcom,mdss-edp";
-			reg-names =
-				"edp",
-				"pll_base";
-			reg =	<0xfd923400 0x700>,
-				<0xfd923a00 0xd4>;
-			interrupt-parent = <&mdss_mdp>;
-			interrupts = <12 0>;
-			power-domains = <&mmcc MDSS_GDSC>;
-			clock-names =
-				"core",
-				"pixel",
-				"iface",
-				"link",
-				"mdp_core";
-			clocks =
-				<&mmcc MDSS_EDPAUX_CLK>,
-				<&mmcc MDSS_EDPPIXEL_CLK>,
-				<&mmcc MDSS_AHB_CLK>,
-				<&mmcc MDSS_EDPLINK_CLK>,
-				<&mmcc MDSS_MDP_CLK>;
-			#clock-cells = <1>;
-			vdda-supply = <&pma8084_l12>;
-			lvl-vdd-supply = <&lvl_vreg>;
-			panel-en-gpios = <&tlmm 137 0>;
-			panel-hpd-gpios = <&tlmm 103 0>;
-	};
-- 
2.33.0

