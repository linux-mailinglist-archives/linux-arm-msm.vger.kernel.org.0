Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BA162C5144
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Nov 2020 10:32:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732641AbgKZJac (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Nov 2020 04:30:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:41336 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732578AbgKZJac (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Nov 2020 04:30:32 -0500
Received: from localhost.localdomain (unknown [122.179.79.180])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B17B82173E;
        Thu, 26 Nov 2020 09:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606383031;
        bh=YZj1IydU4I0vSKpgs5ho9/hmedVUqXGt6+jMq33PK6g=;
        h=From:To:Cc:Subject:Date:From;
        b=d2f7YCKIaT8f4aY7OQG5S0uunUUXCq/6HFGJoEgjwObV/K+Oyva3N6xiohgEvyFEU
         xj6wbtd1uHNrPzrbYP6+K0rX1dG5gtIUymDtlcWsFY83g4fXGxUBI7oRW+VRLKTqtV
         DaWupHrDMKa7n6Dp1AKBcCVa3n0y9jj6R0elwWUU=
From:   Vinod Koul <vkoul@kernel.org>
To:     Mark Brown <broonie@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/2] regulator: dt-bindings: Add PMX55 compatibles
Date:   Thu, 26 Nov 2020 15:00:17 +0530
Message-Id: <20201126093018.1085594-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add PMX55 compatibles for PMIC found in SDX55 platform

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 .../devicetree/bindings/regulator/qcom,rpmh-regulator.txt       | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
index 97c3e0b7611c..bae558b87686 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
@@ -30,6 +30,7 @@ Supported regulator node names:
 	PMI8998:	bob
 	PM6150:         smps1 - smps5, ldo1 - ldo19
 	PM6150L:        smps1 - smps8, ldo1 - ldo11, bob
+	PMX55:		smps1 - smps7, ldo1 - ldo16
 
 ========================
 First Level Nodes - PMIC
@@ -47,6 +48,7 @@ First Level Nodes - PMIC
 		    "qcom,pmi8998-rpmh-regulators"
 		    "qcom,pm6150-rpmh-regulators"
 		    "qcom,pm6150l-rpmh-regulators"
+		    "qcom,pmx55-rpmh-regulators"
 
 - qcom,pmic-id
 	Usage:      required
-- 
2.26.2

