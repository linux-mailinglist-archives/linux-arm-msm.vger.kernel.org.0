Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9489849D1CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jan 2022 19:35:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230092AbiAZSf5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Jan 2022 13:35:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229945AbiAZSf4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Jan 2022 13:35:56 -0500
Received: from mxd1.seznam.cz (mxd1.seznam.cz [IPv6:2a02:598:a::78:210])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37986C061747;
        Wed, 26 Jan 2022 10:35:56 -0800 (PST)
Received: from email.seznam.cz
        by email-smtpc11b.ko.seznam.cz (email-smtpc11b.ko.seznam.cz [10.53.14.75])
        id 706ddd202b63894971c4117e;
        Wed, 26 Jan 2022 19:35:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz; s=beta;
        t=1643222131; bh=3ODJBwEEFJsF7627Edi7m/bUgORhDR864iHPLNOGkks=;
        h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
         Content-Transfer-Encoding:X-szn-frgn:X-szn-frgc;
        b=CuBwwQC490PgAWKwqSzAyUqoYcFJSIGUSFkvObPnNP/fBt0E/CpnH7lrp45k25fre
         ER+K2xIkYe8RX0OJZGmyUDYiH5fzTIQslLar+BzNSjNLOnSERDl+6ikeydU0dtETm1
         hs+FJsHGyzgZkov+FJpHbi4n07Tx7a/qwmhJiVkQ=
Received: from localhost.localdomain (ip-244-214.dynamic.ccinternet.cz [185.148.214.244])
        by email-relay21.ko.seznam.cz (Seznam SMTPD 1.3.136) with ESMTP;
        Wed, 26 Jan 2022 19:35:26 +0100 (CET)  
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
        devicetree@vger.kernel.org, Michael Srba <Michael.Srba@seznam.cz>
Subject: [PATCH v4 1/5] dt-bindings: clock: gcc-msm8998: Add definitions of SSC-related clocks
Date:   Wed, 26 Jan 2022 19:32:46 +0100
Message-Id: <20220126183250.11924-1-michael.srba@seznam.cz>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-szn-frgn: <8f4be0af-a948-41cd-a03a-0cafe905a619>
X-szn-frgc: <0>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Michael Srba <Michael.Srba@seznam.cz>

This patch adds definitions of four clocks which need to be manipulated
in order to initialize the AHB bus which exposes the SCC block in the
global address space.

Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>
---
 CHANGES:
 - v2: none
 - v3: none
 - v4: none
---
 include/dt-bindings/clock/qcom,gcc-msm8998.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,gcc-msm8998.h b/include/dt-bindings/clock/qcom,gcc-msm8998.h
index 72c99e486d86..1badb4f9c58f 100644
--- a/include/dt-bindings/clock/qcom,gcc-msm8998.h
+++ b/include/dt-bindings/clock/qcom,gcc-msm8998.h
@@ -186,6 +186,10 @@
 #define UFS_UNIPRO_CORE_CLK_SRC					177
 #define GCC_MMSS_GPLL0_CLK					178
 #define HMSS_GPLL0_CLK_SRC					179
+#define GCC_IM_SLEEP						180
+#define AGGRE2_SNOC_NORTH_AXI					181
+#define SSC_XO							182
+#define SSC_CNOC_AHBS_CLK					183
 
 #define PCIE_0_GDSC						0
 #define UFS_GDSC						1
-- 
2.34.1

