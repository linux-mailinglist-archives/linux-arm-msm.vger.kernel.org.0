Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB9C0497F41
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jan 2022 13:21:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239462AbiAXMVr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Jan 2022 07:21:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239500AbiAXMVn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Jan 2022 07:21:43 -0500
Received: from mxd1.seznam.cz (mxd1.seznam.cz [IPv6:2a02:598:a::78:210])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A337C061749;
        Mon, 24 Jan 2022 04:21:41 -0800 (PST)
Received: from email.seznam.cz
        by email-smtpc19a.ko.seznam.cz (email-smtpc19a.ko.seznam.cz [10.53.18.22])
        id 45464a151e481e7c44ef864b;
        Mon, 24 Jan 2022 13:21:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz; s=beta;
        t=1643026881; bh=zYQEmRawZQYZJJTHE4ElIs5NJPlKvgxPLzAY5nWjyLs=;
        h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
         Content-Transfer-Encoding:X-szn-frgn:X-szn-frgc;
        b=CADxL70CdGDfvKtGTumEu7i9/7OwIzlapDHnWVg6atYhGsQ5xoRTZ2qJXWO/it1+6
         SKwIakcxfXW+YPek6dmsUztMFIFOfFIBAUlWG69tRr1v3rWfHIpdtWBMJX2Suc+uyV
         sRpw8fa3bxOL/pMlTjOmMRGhh7LQmI8kzEv2FxyQ=
Received: from localhost.localdomain (ip-244-214.dynamic.ccinternet.cz [185.148.214.244])
        by email-relay21.ko.seznam.cz (Seznam SMTPD 1.3.136) with ESMTP;
        Mon, 24 Jan 2022 13:21:16 +0100 (CET)  
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
Subject: [PATCH v3 1/5] dt-bindings: clock: gcc-msm8998: Add definitions of SSC-related clocks
Date:   Mon, 24 Jan 2022 13:18:49 +0100
Message-Id: <20220124121853.23600-1-michael.srba@seznam.cz>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-szn-frgn: <1f2d1a29-a523-400c-b821-7879a9ee9178>
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

