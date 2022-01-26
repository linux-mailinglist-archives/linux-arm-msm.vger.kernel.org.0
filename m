Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7730F49D1CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jan 2022 19:35:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231495AbiAZSf6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Jan 2022 13:35:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230354AbiAZSf5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Jan 2022 13:35:57 -0500
Received: from mxd1.seznam.cz (mxd1.seznam.cz [IPv6:2a02:598:a::78:210])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5836EC061748;
        Wed, 26 Jan 2022 10:35:56 -0800 (PST)
Received: from email.seznam.cz
        by email-smtpc26b.ko.seznam.cz (email-smtpc26b.ko.seznam.cz [10.53.18.37])
        id 7c365e5627380a3f7d9f9208;
        Wed, 26 Jan 2022 19:35:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz; s=beta;
        t=1643222136; bh=N7Z0TgBqcMlNBuyZQo/fdQSFLPZ4eH8wQaILENj49WE=;
        h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Transfer-Encoding:X-szn-frgn:
         X-szn-frgc;
        b=oPfbQv1uQOzyBqK55K7KpNxPIvo/vhjzoV6/KIeMdq2fozQKXB5Y3lXfxo58aprG+
         prFjwa/iwTO9IbVAW10S83fdEaRTEKEUfLVIDg+nYyieU8WB9AN5FgmJnV3toL1O0H
         QuK4yC2dNl6o2nCsyGPs5O3ug+QVvB6wvwB+RN3Q=
Received: from localhost.localdomain (ip-244-214.dynamic.ccinternet.cz [185.148.214.244])
        by email-relay21.ko.seznam.cz (Seznam SMTPD 1.3.136) with ESMTP;
        Wed, 26 Jan 2022 19:35:27 +0100 (CET)  
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
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Michael Srba <michael.srba@seznam.cz>,
        Michael Srba <Michael.Srba@seznam.cz>
Subject: [PATCH v4 5/5] arm64: dts: qcom: msm8998: reserve potentially inaccessible clocks
Date:   Wed, 26 Jan 2022 19:32:50 +0100
Message-Id: <20220126183250.11924-5-michael.srba@seznam.cz>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220126183250.11924-1-michael.srba@seznam.cz>
References: <20220126183250.11924-1-michael.srba@seznam.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-szn-frgn: <ca8c4a70-7e2b-42fd-9f40-80c58c1e4f75>
X-szn-frgc: <0>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Michael Srba <michael.srba@seznam.cz>

With the gcc driver now being more complete and describing clocks which
might not always be write-accessible to the OS, conservatively specify
all such clocks as protected in the SoC dts.
The board dts - or even user-supplied dts - can override this property
to reflect the actual configuration.

Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>
---
 CHANGES:
 - v2: add this patch
 - v3: fix missing Signed-off-by
 - v4: add a proper explanation as per review, (hopefully) fix the subject and commit message
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index f273bc1ff629..16dccf9d881e 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -863,6 +863,21 @@ gcc: clock-controller@100000 {
 
 			clock-names = "xo", "sleep_clk";
 			clocks = <&xo>, <&sleep_clk>;
+
+			/*
+			 * The hypervisor typically configures the memory region where these clocks
+			 * reside as read-only for the HLOS. If the HLOS tried to enable or disable
+			 * these clocks on a device with such configuration (e.g. because they are
+			 * enabled but unused during boot-up), the device will most likely decide
+			 * to reboot.
+			 * In light of that, we are conservative here and we list all such clocks
+			 * as protected. The board dts (or a user-supplied dts) can override the
+			 * list of protected clocks if it differs from the norm, and it is in fact
+			 * desired for the HLOS to manage these clocks
+			 */
+			protected-clocks = <AGGRE2_SNOC_NORTH_AXI>,
+					   <SSC_XO>,
+					   <SSC_CNOC_AHBS_CLK>;
 		};
 
 		rpm_msg_ram: sram@778000 {
-- 
2.34.1

