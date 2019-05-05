Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5735913F86
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 May 2019 15:04:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727404AbfEENEe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 5 May 2019 09:04:34 -0400
Received: from onstation.org ([52.200.56.107]:46338 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727367AbfEENEa (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 5 May 2019 09:04:30 -0400
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id E664445025;
        Sun,  5 May 2019 13:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1557061469;
        bh=VobKfXF3wCh1U9MUc0on+2Lzz9kJHqbfrswL48/mVfU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=SlGCuapUmo0Uruqd3/6TH/mk/NE/d1k767QquWY2HjwUKZuTJ1O7QX9tinWIjpndd
         SrkmFX96GK89YEYpqXHDsfkCzCG0a4qqghWCQs5kbYL33JQp5tJmrqk5e7xvi9ncYq
         RvoAk5nfeHa8bFOYl0V0MrWn7Omjnkw5CZZtHT48=
From:   Brian Masney <masneyb@onstation.org>
To:     robdclark@gmail.com, sean@poorly.run,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, airlied@linux.ie, daniel@ffwll.ch,
        linux-kernel@vger.kernel.org, linus.walleij@linaro.org
Subject: [PATCH RFC 6/6] ARM: dts: qcom: msm8974-hammerhead: add support for display
Date:   Sun,  5 May 2019 09:04:13 -0400
Message-Id: <20190505130413.32253-7-masneyb@onstation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190505130413.32253-1-masneyb@onstation.org>
References: <20190505130413.32253-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add initial support for the display found on the LG Nexus 5 (hammerhead)
phone.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
See the cover letter on this patch series for details about the issue
that I'm running into with this board.

 .../qcom-msm8974-lge-nexus5-hammerhead.dts    | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
index b7cf4b1019e9..749226e18ab5 100644
--- a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
@@ -500,6 +500,51 @@
 			};
 		};
 	};
+
+	mdss@fd900000 {
+		status = "ok";
+
+		mdp@fd900000 {
+			status = "ok";
+		};
+
+		dsi@fd922800 {
+			status = "ok";
+
+			vdda-supply = <&pm8941_l2>;
+			vdd-supply = <&pm8941_lvs3>;
+			vddio-supply = <&pm8941_l12>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			ports {
+				port@1 {
+					endpoint {
+						remote-endpoint = <&panel_in>;
+						data-lanes = <0 1 2 3>;
+					};
+				};
+			};
+
+			panel: panel@0 {
+				reg = <0>;
+				compatible = "lg,acx467akm-7";
+
+				port {
+					panel_in: endpoint {
+						remote-endpoint = <&dsi0_out>;
+					};
+				};
+			};
+		};
+
+		dsi-phy@fd922a00 {
+			status = "ok";
+
+			vddio-supply = <&pm8941_l12>;
+		};
+	};
 };
 
 &spmi_bus {
-- 
2.20.1

