Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 623F84BD200
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Feb 2022 22:27:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245054AbiBTVX4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Feb 2022 16:23:56 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:36484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241809AbiBTVXy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Feb 2022 16:23:54 -0500
Received: from mxd1.seznam.cz (mxd1.seznam.cz [IPv6:2a02:598:a::78:210])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1072337BE4;
        Sun, 20 Feb 2022 13:23:29 -0800 (PST)
Received: from email.seznam.cz
        by email-smtpc16b.ko.seznam.cz (email-smtpc16b.ko.seznam.cz [10.53.18.17])
        id 39c9a9c562c7fdac3860659b;
        Sun, 20 Feb 2022 22:23:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz; s=beta;
        t=1645392183; bh=GZfoJWfiywlXbYQUIpA77s9Kmj3OIROVoXs5oX9y4n8=;
        h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Transfer-Encoding:X-szn-frgn:
         X-szn-frgc;
        b=JWavN21VzNU9Z6tXigp8yTvPXuVEaW84IlhiCPs/2o7hgxntYzGRoI4Q8VHTtv6ZN
         2pnzjQuCrXtz1nnxQz4F7dPNl4u8WbUChtH9LXwH23T0dxiU5WVDuo2lN5nXTGVGxh
         uLOvA5WjKqtOCRGCwiUlDXjhZVSDAdSTe1fDpcJM=
Received: from localhost.localdomain (ip-111-27.static.ccinternet.cz [147.161.27.111])
        by email-relay14.ko.seznam.cz (Seznam SMTPD 1.3.136) with ESMTP;
        Sun, 20 Feb 2022 22:23:00 +0100 (CET)  
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
Subject: [PATCH v8 5/5] arm64: dts: qcom: msm8998: reserve potentially inaccessible clocks
Date:   Sun, 20 Feb 2022 22:20:34 +0100
Message-Id: <20220220212034.9152-5-michael.srba@seznam.cz>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220220212034.9152-1-michael.srba@seznam.cz>
References: <20220220212034.9152-1-michael.srba@seznam.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-szn-frgn: <e0a3744d-40eb-4c0c-aa37-f6065e5f7d61>
X-szn-frgc: <0>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
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
 - v5: none
 - v6: none
 - v7: none
 - v8: none
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

