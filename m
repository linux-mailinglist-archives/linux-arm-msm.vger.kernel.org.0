Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B86349745F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jan 2022 19:38:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239549AbiAWSiq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 23 Jan 2022 13:38:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239550AbiAWSip (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 23 Jan 2022 13:38:45 -0500
Received: from mxd2.seznam.cz (mxd2.seznam.cz [IPv6:2a02:598:2::210])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDA54C061401;
        Sun, 23 Jan 2022 10:38:44 -0800 (PST)
Received: from email.seznam.cz
        by email-smtpc20a.ng.seznam.cz (email-smtpc20a.ng.seznam.cz [10.23.18.24])
        id 0f9f5bb354910fda0e3697ed;
        Sun, 23 Jan 2022 19:38:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz; s=beta;
        t=1642963097; bh=6ysqmf+DLqMybDzlOK9bJTtYwpKDptcXhR/vcXoyaoU=;
        h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
         Content-Transfer-Encoding:X-szn-frgn:X-szn-frgc;
        b=TGKVAGXM02QVJsFasv9lfPW7ep8LR+FqDM/ICIhA3eWBhZpWK44f6gbcjX+P4Eg4B
         7ItPk+xJYUB7lu693fk1wXZHi9SsWhIT2sasXp0ntj+cKlJWem+uz4EVzOdI7D/f19
         nab6VXpo3RydT4gYC6SQGY3R+QmQxKvlhRYOPd2c=
Received: from localhost.localdomain (ip-244-214.dynamic.ccinternet.cz [185.148.214.244])
        by email-relay19.ng.seznam.cz (Seznam SMTPD 1.3.136) with ESMTP;
        Sun, 23 Jan 2022 19:38:12 +0100 (CET)  
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
Subject: [PATCH v2 1/5] dt-bindings: clock: gcc-msm8998: Add definitions of SSC-related clocks
Date:   Sun, 23 Jan 2022 19:35:43 +0100
Message-Id: <20220123183547.15830-1-michael.srba@seznam.cz>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-szn-frgn: <430424e6-bf1c-422e-abaa-55831a8b1b02>
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

