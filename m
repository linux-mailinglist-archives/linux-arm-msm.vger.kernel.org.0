Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46A0733B5DD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Mar 2021 14:56:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229889AbhCONzm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Mar 2021 09:55:42 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:58629 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231555AbhCONzK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Mar 2021 09:55:10 -0400
Received: from ironmsg07-lv.qualcomm.com (HELO ironmsg07-lv.qulacomm.com) ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 15 Mar 2021 06:55:10 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg07-lv.qulacomm.com with ESMTP/TLS/AES256-SHA; 15 Mar 2021 06:55:09 -0700
X-QCInternal: smtphost
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg01-blr.qualcomm.com with ESMTP; 15 Mar 2021 19:24:35 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id A7FA449D2; Mon, 15 Mar 2021 19:24:33 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, mka@chromium.org,
        rnayak@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        kgunda@codeaurora.org, David Collins <collinsd@codeaurora.org>,
        satya priya <skakit@codeaurora.org>
Subject: [PATCH V2 5/5] dt-bindings: regulator: Add compatibles for PM7325/PMR735A
Date:   Mon, 15 Mar 2021 19:24:14 +0530
Message-Id: <1615816454-1733-6-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615816454-1733-1-git-send-email-skakit@codeaurora.org>
References: <1615816454-1733-1-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add PM7325/PMR735A compatibles for Qualcomm SC7280 platform.

Signed-off-by: satya priya <skakit@codeaurora.org>
Acked-by: Rob Herring <robh@kernel.org>
---
Changes in V2:
 - No change.

 Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
index f29e3b7..bafd52a 100644
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

