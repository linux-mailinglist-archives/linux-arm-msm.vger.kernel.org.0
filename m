Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0856334FFEC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Mar 2021 14:07:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235412AbhCaMG6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 08:06:58 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:51415 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235119AbhCaMG3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 08:06:29 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 31 Mar 2021 05:06:29 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 31 Mar 2021 05:06:27 -0700
X-QCInternal: smtphost
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg01-blr.qualcomm.com with ESMTP; 31 Mar 2021 17:36:00 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id 0C7F149E0; Wed, 31 Mar 2021 17:35:57 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, rnayak@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org,
        satya priya <skakit@codeaurora.org>
Subject: [PATCH V3 5/5] dt-bindings: regulator: Add compatibles for PM7325/PMR735A
Date:   Wed, 31 Mar 2021 17:35:39 +0530
Message-Id: <1617192339-3760-6-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617192339-3760-1-git-send-email-skakit@codeaurora.org>
References: <1617192339-3760-1-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add PM7325/PMR735A compatibles for Qualcomm SC7280 platform.

Signed-off-by: satya priya <skakit@codeaurora.org>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
---
 Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
index ac13c3c..e561a5b 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
@@ -44,6 +44,8 @@ description: |
       For PM6150, smps1 - smps5, ldo1 - ldo19
       For PM6150L, smps1 - smps8, ldo1 - ldo11, bob
       For PMX55, smps1 - smps7, ldo1 - ldo16
+      For PM7325, smps1 - smps8, ldo1 - ldo19
+      For PMR735A, smps1 - smps3, ldo1 - ldo7
 
 properties:
   compatible:
@@ -60,6 +62,8 @@ properties:
       - qcom,pm6150-rpmh-regulators
       - qcom,pm6150l-rpmh-regulators
       - qcom,pmx55-rpmh-regulators
+      - qcom,pm7325-rpmh-regulators
+      - qcom,pmr735a-rpmh-regulators
 
   qcom,pmic-id:
     description: |
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

