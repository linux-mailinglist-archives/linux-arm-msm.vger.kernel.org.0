Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01B0A2CD039
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Dec 2020 08:15:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727394AbgLCHOH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Dec 2020 02:14:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:59324 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725912AbgLCHOG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Dec 2020 02:14:06 -0500
From:   Vinod Koul <vkoul@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     Mark Brown <broonie@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 1/2] regulator: dt-bindings: Add PM8350x compatibles
Date:   Thu,  3 Dec 2020 12:42:43 +0530
Message-Id: <20201203071244.2652297-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add PM8350 and PM8350C compatibles for these PMICs found in some
Qualcomm platforms.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 .../devicetree/bindings/regulator/qcom,rpmh-regulator.txt     | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
index 97c3e0b7611c..0f5f4029d9a2 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
@@ -26,6 +26,8 @@ Supported regulator node names:
 	PM8009:		smps1 - smps2, ldo1 - ldo7
 	PM8150:		smps1 - smps10, ldo1 - ldo18
 	PM8150L:	smps1 - smps8, ldo1 - ldo11, bob, flash, rgb
+	PM8350:		smps1 - smps12, ldo1 - ldo10,
+	PM8350C:	smps1 - smps10, ldo1 - ldo13, bob
 	PM8998:		smps1 - smps13, ldo1 - ldo28, lvs1 - lvs2
 	PMI8998:	bob
 	PM6150:         smps1 - smps5, ldo1 - ldo19
@@ -43,6 +45,8 @@ First Level Nodes - PMIC
 		    "qcom,pm8009-rpmh-regulators"
 		    "qcom,pm8150-rpmh-regulators"
 		    "qcom,pm8150l-rpmh-regulators"
+		    "qcom,pm8350-rpmh-regulators"
+		    "qcom,pm8350c-rpmh-regulators"
 		    "qcom,pm8998-rpmh-regulators"
 		    "qcom,pmi8998-rpmh-regulators"
 		    "qcom,pm6150-rpmh-regulators"
-- 
2.26.2

