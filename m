Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 098173BE8A8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jul 2021 15:16:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231452AbhGGNSe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Jul 2021 09:18:34 -0400
Received: from ixit.cz ([94.230.151.217]:41784 "EHLO ixit.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229829AbhGGNSe (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Jul 2021 09:18:34 -0400
Received: from newone.lan (unknown [94.230.151.217])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id 2870223B1D;
        Wed,  7 Jul 2021 15:15:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1625663752;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=wrtlL4zMNnLfSZb7rkEsPIbnKG+tlPUJAFsF68JHv0E=;
        b=fViwxjM6Zly8RQzmi4Mp7f3kIHeuJVwinThiSk6bwFOp5/lblS0Nn37kBSPp4J4KBs7V6q
        DhkekOjZMXDfE78btgH79M4dl+DBZlQBCArUPLUl355nQIlRqAclWrlJLWMhFY7o0lVrZr
        zF1sr7J2hGDkHMew4qLz8g8tOIDwquU=
From:   David Heidelberg <david@ixit.cz>
To:     linus.walleij@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        David Heidelberg <david@ixit.cz>,
        Brian Masney <masneyb@onstation.org>
Subject: [PATCH v2] ARM: dts: qcom: apq8064: correct clock names
Date:   Wed,  7 Jul 2021 15:14:53 +0200
Message-Id: <20210707131453.24041-1-david@ixit.cz>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Since new code doesn't take old clk names in account, it does fixes
error:

msm_dsi 4700000.mdss_dsi: dev_pm_opp_set_clkname: Couldn't find clock: -2

and following kernel oops introduced by
b0530eb1191 ("drm/msm/dpu: Use OPP API to set clk/perf state").

Also removes warning about deprecated clock names.

Tested against linux-5.10.y LTS on Nexus 7 2013.

Reviewed-by: Brian Masney <masneyb@onstation.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
- v2 improved commit message, added R-b

 arch/arm/boot/dts/qcom-apq8064.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index 6005620ac297..96b7755afabf 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -1262,9 +1262,9 @@ dsi0: mdss_dsi@4700000 {
 				<&mmcc DSI1_BYTE_CLK>,
 				<&mmcc DSI_PIXEL_CLK>,
 				<&mmcc DSI1_ESC_CLK>;
-			clock-names = "iface_clk", "bus_clk", "core_mmss_clk",
-					"src_clk", "byte_clk", "pixel_clk",
-					"core_clk";
+			clock-names = "iface", "bus", "core_mmss",
+					"src", "byte", "pixel",
+					"core";
 
 			assigned-clocks = <&mmcc DSI1_BYTE_SRC>,
 					<&mmcc DSI1_ESC_SRC>,
-- 
2.30.2

