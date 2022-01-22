Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30B0B496D39
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Jan 2022 19:09:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234670AbiAVSJT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 22 Jan 2022 13:09:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231812AbiAVSJT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 22 Jan 2022 13:09:19 -0500
Received: from mxd2.seznam.cz (mxd2.seznam.cz [IPv6:2a02:598:2::210])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B457C06173B;
        Sat, 22 Jan 2022 10:09:18 -0800 (PST)
Received: from email.seznam.cz
        by email-smtpc1b.ng.seznam.cz (email-smtpc1b.ng.seznam.cz [10.23.13.15])
        id 7fbae1b324b4b5da7e132ded;
        Sat, 22 Jan 2022 19:09:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz; s=beta;
        t=1642874957; bh=1EnTIdt2O2BU0FhIK6Yn08TeenHwWuw5X96kZ29foJ4=;
        h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
         Content-Transfer-Encoding:X-szn-frgn:X-szn-frgc;
        b=k+cGD6vvq9kpXANrY2THUJXhM/GT95qZbbji6rpfjF/pTClbc1Uh/NuhQ5eCCsV0q
         qDa1stRakwLesNGSTs39WAqSpycY9gPqI4+/Bgy6SMMztm7nWFyaR2ASSV2l/tc7Bh
         FxvuEt9gviRV9JCy6vF4mpY0wABYJraAtzWExAeE=
Received: from localhost.localdomain (ip-244-214.dynamic.ccinternet.cz [185.148.214.244])
        by email-relay24.ng.seznam.cz (Seznam SMTPD 1.3.136) with ESMTP;
        Sat, 22 Jan 2022 19:06:48 +0100 (CET)  
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
        Michael Srba <Michael.Srba@seznam.cz>
Subject: [PATCH 1/4] dt-bindings: clock: gcc-msm8998: Add definitions of SSC-related clocks
Date:   Sat, 22 Jan 2022 19:04:10 +0100
Message-Id: <20220122180413.1480-1-michael.srba@seznam.cz>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-szn-frgn: <e6182ed4-c1ff-46a6-91dc-c5b444140202>
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

