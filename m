Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46F5B4FB4B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Apr 2022 09:25:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236703AbiDKH1h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Apr 2022 03:27:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245394AbiDKH1R (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Apr 2022 03:27:17 -0400
Received: from mxd2.seznam.cz (mxd2.seznam.cz [IPv6:2a02:598:2::210])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA33C3A5D6;
        Mon, 11 Apr 2022 00:24:56 -0700 (PDT)
Received: from email.seznam.cz
        by email-smtpc27a.ng.seznam.cz (email-smtpc27a.ng.seznam.cz [10.23.18.38])
        id 6cf7735d37f927346d5ebf03;
        Mon, 11 Apr 2022 09:24:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz; s=beta;
        t=1649661871; bh=o414pkHhgL9vMorRestr4vWHbQMDn+w/yudCwqqpe8M=;
        h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Transfer-Encoding:X-szn-frgn:
         X-szn-frgc;
        b=UFq9wfRe5qfzDyn8C407aykGQdhfYFrlzvbzlNdQXdK3EGj/SvUhYNWPzB/Z/RaAF
         jIBe37GUzpoeNgdGxcGXoabM+sEauLnMxAhcfmiTyNfwEfWBcxOKgtlu1vnEE+m5E6
         QC1G8vPneRA+ROasFSWapHEFBDnHvY6erKIyjPMU=
Received: from localhost.localdomain (ip-111-27.static.ccinternet.cz [147.161.27.111])
        by email-relay18.ng.seznam.cz (Seznam SMTPD 1.3.136) with ESMTP;
        Mon, 11 Apr 2022 09:24:25 +0200 (CEST)  
From:   michael.srba@seznam.cz
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Michael Srba <michael.srba@seznam.cz>,
        Michael Srba <Michael.Srba@seznam.cz>
Subject: [RESEND v9 5/5] arm64: dts: qcom: msm8998: reserve potentially inaccessible clocks
Date:   Mon, 11 Apr 2022 09:21:56 +0200
Message-Id: <20220411072156.24451-6-michael.srba@seznam.cz>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220411072156.24451-1-michael.srba@seznam.cz>
References: <20220411072156.24451-1-michael.srba@seznam.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-szn-frgn: <57c7363e-9df6-4d40-904b-3b8167d4d3c3>
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
Reviewed-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 CHANGES:
 - v2: add this patch
 - v3: fix missing Signed-off-by
 - v4: add a proper explanation as per review, (hopefully) fix the subject and commit message
 - v5: none
 - v6: none
 - v7: none
 - v8: none
 - v9: none
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 2fda21e810c9..4a84de6cee1e 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -815,6 +815,21 @@ gcc: clock-controller@100000 {
 
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
2.35.1

