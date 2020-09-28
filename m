Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B04127B7ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Sep 2020 01:19:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727226AbgI1XTZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Sep 2020 19:19:25 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:27496 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726477AbgI1XTS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Sep 2020 19:19:18 -0400
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 28 Sep 2020 15:49:11 -0700
X-QCInternal: smtphost
Received: from gurus-linux.qualcomm.com ([10.46.162.81])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP; 28 Sep 2020 15:49:11 -0700
Received: by gurus-linux.qualcomm.com (Postfix, from userid 383780)
        id DAE91193D; Mon, 28 Sep 2020 15:49:10 -0700 (PDT)
From:   Guru Das Srinagesh <gurus@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org
Cc:     Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Anirudh Ghayal <aghayal@codeaurora.org>,
        Guru Das Srinagesh <gurus@codeaurora.org>
Subject: [RESEND PATCH v1 1/2] bindings: pm8941-misc: Add support for VBUS detection
Date:   Mon, 28 Sep 2020 15:49:08 -0700
Message-Id: <d9f8255a6996596e4fb9dc6404da160d7a4af77f.1601333246.git.gurus@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1601333246.git.gurus@codeaurora.org>
References: <cover.1601333246.git.gurus@codeaurora.org>
In-Reply-To: <cover.1601333246.git.gurus@codeaurora.org>
References: <cover.1601333246.git.gurus@codeaurora.org>
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

