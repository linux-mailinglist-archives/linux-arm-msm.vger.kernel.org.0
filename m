Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 658824B9EA8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Feb 2022 12:33:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239772AbiBQLdP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Feb 2022 06:33:15 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:57024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239773AbiBQLdJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Feb 2022 06:33:09 -0500
Received: from mxd2.seznam.cz (mxd2.seznam.cz [IPv6:2a02:598:2::210])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E04317C11E;
        Thu, 17 Feb 2022 03:32:54 -0800 (PST)
Received: from email.seznam.cz
        by email-smtpc1a.ng.seznam.cz (email-smtpc1a.ng.seznam.cz [10.23.10.15])
        id 3e720113657c557a3fdbcd4d;
        Thu, 17 Feb 2022 12:32:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz; s=beta;
        t=1645097554; bh=I0huqjO3Ze0Tthxe1VueCZOTHs0UvA6L60KoxxYO8N0=;
        h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
         Content-Transfer-Encoding:X-szn-frgn:X-szn-frgc;
        b=ClrwNRfoAJ+hpNfeOvbn4OYghlQvpIWh+Ktnn7faEw+xnKW4X/FyNzz53+HbBKrE7
         3MX0I+hSvx2Yj8wyyTAz0iMmevjI7NtlTGTQz8k9KcgRsxm4P4I84zhJFLqONQIjKJ
         7PqErwgzO6iPEJr6fGVoOLvRncol21lhnhpego0o=
Received: from localhost.localdomain (ip-111-27.static.ccinternet.cz [147.161.27.111])
        by email-relay20.ng.seznam.cz (Seznam SMTPD 1.3.136) with ESMTP;
        Thu, 17 Feb 2022 12:32:31 +0100 (CET)  
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
        devicetree@vger.kernel.org, Michael Srba <Michael.Srba@seznam.cz>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v6 1/5] dt-bindings: clock: gcc-msm8998: Add definitions of SSC-related clocks
Date:   Thu, 17 Feb 2022 12:30:00 +0100
Message-Id: <20220217113004.22757-1-michael.srba@seznam.cz>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-szn-frgn: <beafa1f3-a171-4ad1-9b7a-1724450eefa2>
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

From: Michael Srba <Michael.Srba@seznam.cz>

This patch adds definitions of four clocks which need to be manipulated
in order to initialize the AHB bus which exposes the SCC block in the
global address space.

Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>
Acked-by: Rob Herring <robh@kernel.org>
---
 CHANGES:
 - v2: none
 - v3: none
 - v4: none
 - v5: none
 - v6: none
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

