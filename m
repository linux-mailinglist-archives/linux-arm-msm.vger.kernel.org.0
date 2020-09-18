Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77DAD2705FB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Sep 2020 22:09:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726290AbgIRUJ3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Sep 2020 16:09:29 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:53650 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726276AbgIRUJ3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Sep 2020 16:09:29 -0400
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 18 Sep 2020 13:03:24 -0700
Received: from gurus-linux.qualcomm.com ([10.46.162.81])
  by ironmsg02-sd.qualcomm.com with ESMTP; 18 Sep 2020 13:03:23 -0700
Received: by gurus-linux.qualcomm.com (Postfix, from userid 383780)
        id D62BF1975; Fri, 18 Sep 2020 13:03:23 -0700 (PDT)
From:   Guru Das Srinagesh <gurus@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org
Cc:     Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Anirudh Ghayal <aghayal@codeaurora.org>,
        Guru Das Srinagesh <gurus@codeaurora.org>
Subject: [PATCH v1 1/2] bindings: pm8941-misc: Add support for VBUS detection
Date:   Fri, 18 Sep 2020 13:03:21 -0700
Message-Id: <5b90efd2c95bbf680b28e0f9e07123778c265fbe.1600459322.git.gurus@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1600459322.git.gurus@codeaurora.org>
References: <cover.1600459322.git.gurus@codeaurora.org>
In-Reply-To: <cover.1600459322.git.gurus@codeaurora.org>
References: <cover.1600459322.git.gurus@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Anirudh Ghayal <aghayal@codeaurora.org>

VBUS can be detected via a dedicated PMIC pin. Enable compatible string
that adds support for reporting the VBUS status.

Signed-off-by: Anirudh Ghayal <aghayal@codeaurora.org>
Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
---
 Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.txt b/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.txt
index 35383adb..91a49af 100644
--- a/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.txt
+++ b/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.txt
@@ -8,7 +8,7 @@ PROPERTIES
 - compatible:
     Usage: required
     Value type: <string>
-    Definition: Should contain "qcom,pm8941-misc";
+    Definition: Should contain "qcom,pm8941-misc" or "qcom,pmd-vbus-det";
 
 - reg:
     Usage: required
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

