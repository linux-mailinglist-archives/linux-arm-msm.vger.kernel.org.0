Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DA9E49745A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jan 2022 19:38:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239319AbiAWSip (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 23 Jan 2022 13:38:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239547AbiAWSip (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 23 Jan 2022 13:38:45 -0500
Received: from mxd2.seznam.cz (mxd2.seznam.cz [IPv6:2a02:598:2::210])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5973C06173B;
        Sun, 23 Jan 2022 10:38:44 -0800 (PST)
Received: from email.seznam.cz
        by email-smtpc22a.ng.seznam.cz (email-smtpc22a.ng.seznam.cz [10.23.18.28])
        id 3d3e3731663063583c97fb6f;
        Sun, 23 Jan 2022 19:38:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz; s=beta;
        t=1642963097; bh=1YJV/EOy16x2RHaejUBXAfksc3Yd+W/jqegvUTGJoQk=;
        h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Transfer-Encoding:X-szn-frgn:
         X-szn-frgc;
        b=l0s7WgOlllVe7uVBcsrH8EWz5v09hZNF4qKlNTEfzaCuFIvQ3YNIeuaqFwP9pwAjo
         h6mIKz4TpWJWvF4Wg4/RfgqzFO/hhip+vJefybQL1zOfw2ZpEkWsHO2TZWPp00XooJ
         t28nbo2KITVI/jba0viIV9ENXQXcYFZX9ZROyEqs=
Received: from localhost.localdomain (ip-244-214.dynamic.ccinternet.cz [185.148.214.244])
        by email-relay19.ng.seznam.cz (Seznam SMTPD 1.3.136) with ESMTP;
        Sun, 23 Jan 2022 19:38:13 +0100 (CET)  
From:   michael.srba@seznam.cz
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Mis012 <michael.srba@seznam.cz>
Subject: [PATCH v2 5/5] arm64: dts: qcom: msm8998: reserve potentially inaccessible clocks With the gcc driver now being more complete and describing clocks which might not always be write-accessible to the OS, conservatively specify all such clocks as protected in the SoC dts. The board dts - or even user-supplied dts - can override this property to reflect the actual configuration.
Date:   Sun, 23 Jan 2022 19:35:47 +0100
Message-Id: <20220123183547.15830-5-michael.srba@seznam.cz>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220123183547.15830-1-michael.srba@seznam.cz>
References: <20220123183547.15830-1-michael.srba@seznam.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-szn-frgn: <88514794-79d8-4e34-9089-896ebb811a98>
X-szn-frgc: <0>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Mis012 <michael.srba@seznam.cz>

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index f273bc1ff629..cff83af8c12e 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -863,6 +863,12 @@ gcc: clock-controller@100000 {
 
 			clock-names = "xo", "sleep_clk";
 			clocks = <&xo>, <&sleep_clk>;
+
+			// be conservative by default, the board dts
+			// can overwrite this list
+			protected-clocks = <AGGRE2_SNOC_NORTH_AXI>,
+					   <SSC_XO>,
+					   <SSC_CNOC_AHBS_CLK>;
 		};
 
 		rpm_msg_ram: sram@778000 {
-- 
2.34.1

