Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6750497F47
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jan 2022 13:21:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239547AbiAXMVu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Jan 2022 07:21:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239388AbiAXMVp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Jan 2022 07:21:45 -0500
Received: from mxd1.seznam.cz (mxd1.seznam.cz [IPv6:2a02:598:a::78:210])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2230C06174E;
        Mon, 24 Jan 2022 04:21:41 -0800 (PST)
Received: from email.seznam.cz
        by email-smtpc11b.ko.seznam.cz (email-smtpc11b.ko.seznam.cz [10.53.14.75])
        id 74d40d302fda5959757dc16e;
        Mon, 24 Jan 2022 13:21:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz; s=beta;
        t=1643026882; bh=8JZyBxXKKOKhDZXX1JIFw0alRV+LtFd3/r+7u2U3kRU=;
        h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Transfer-Encoding:X-szn-frgn:
         X-szn-frgc;
        b=N45MjB9luoTi4nx0MtbsLcVbWAn2wbErkq62cgp4r5MLhu3UsMkR8rVkurr2eHewn
         KKdaHJEXQocmwSB3mZtNa764w/oFuCvQfSbEOXOhWnJj6WsOvHE8EenqGe+0F8X6fx
         tjzTB0khbXEW5FZESZWdqmRmK059SC6TiF34AjQ8=
Received: from localhost.localdomain (ip-244-214.dynamic.ccinternet.cz [185.148.214.244])
        by email-relay21.ko.seznam.cz (Seznam SMTPD 1.3.136) with ESMTP;
        Mon, 24 Jan 2022 13:21:17 +0100 (CET)  
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
        Michael Srba <michael.srba@seznam.cz>,
        Michael Srba <Michael.Srba@seznam.cz>
Subject: [PATCH v3 5/5] arm64: dts: qcom: msm8998: reserve potentially inaccessible clocks With the gcc driver now being more complete and describing clocks which might not always be write-accessible to the OS, conservatively specify all such clocks as protected in the SoC dts. The board dts - or even user-supplied dts - can override this property to reflect the actual configuration.
Date:   Mon, 24 Jan 2022 13:18:53 +0100
Message-Id: <20220124121853.23600-5-michael.srba@seznam.cz>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220124121853.23600-1-michael.srba@seznam.cz>
References: <20220124121853.23600-1-michael.srba@seznam.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-szn-frgn: <88700ecb-56bb-4257-a664-352fb530fab5>
X-szn-frgc: <0>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Michael Srba <michael.srba@seznam.cz>

Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>
---
 CHANGES:
 - v2: add this patch
 - v3: fix missing Signed-off-by
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

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

