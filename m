Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB01287333
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2019 09:37:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405582AbfHIHhy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Aug 2019 03:37:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:35744 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725980AbfHIHhy (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Aug 2019 03:37:54 -0400
Received: from localhost.localdomain (unknown [122.167.65.92])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3780B2171F;
        Fri,  9 Aug 2019 07:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565336274;
        bh=Wub1Zh9b0Ued8Nu9nACHA+ybTs6jaysV3XnW8dA4YcE=;
        h=From:To:Cc:Subject:Date:From;
        b=ocuwjTNk7pUIjC5736gkGIKpY0rf1OIL2FwHCE4UXCLKNpWmctZP9xCrt6lJZaty3
         SBlB2aUUkhGsMmqJ3d2mvtYNTpsB4aqjdoh5nV6JS/hxZWSACsyCpzaamXh/VamDez
         o+97aOd+qcKlDt8zJZUbpD/Vv/Cdx71bMqeWoO88=
From:   Vinod Koul <vkoul@kernel.org>
To:     Mark Brown <broonie@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/4] regulator: dt-bindings: Sort the compatibles and nodes
Date:   Fri,  9 Aug 2019 13:06:13 +0530
Message-Id: <20190809073616.1235-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It helps to keep sorted order for compatibles and nodes, so sort them

Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 .../regulator/qcom,rpmh-regulator.txt         | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
index 1a9cab50503a..bab9f71140b8 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
@@ -22,12 +22,12 @@ RPMh resource.
 
 The names used for regulator nodes must match those supported by a given PMIC.
 Supported regulator node names:
-	PM8998:		smps1 - smps13, ldo1 - ldo28, lvs1 - lvs2
-	PMI8998:	bob
 	PM8005:		smps1 - smps4
+	PM8009:		smps1 - smps2, ldo1 - ldo7
 	PM8150:		smps1 - smps10, ldo1 - ldo18
 	PM8150L:	smps1 - smps8, ldo1 - ldo11, bob, flash, rgb
-	PM8009:		smps1 - smps2, ld01 - ldo7
+	PM8998:		smps1 - smps13, ldo1 - ldo28, lvs1 - lvs2
+	PMI8998:	bob
 
 ========================
 First Level Nodes - PMIC
@@ -36,12 +36,13 @@ First Level Nodes - PMIC
 - compatible
 	Usage:      required
 	Value type: <string>
-	Definition: Must be one of: "qcom,pm8998-rpmh-regulators",
-		    "qcom,pmi8998-rpmh-regulators" or
-		    "qcom,pm8005-rpmh-regulators" or
-		    "qcom,pm8150-rpmh-regulators" or
-		    "qcom,pm8150l-rpmh-regulators" or
-		    "qcom,pm8009-rpmh-regulators".
+	Definition: Must be one of below:
+		    "qcom,pm8005-rpmh-regulators"
+		    "qcom,pm8009-rpmh-regulators"
+		    "qcom,pm8150-rpmh-regulators"
+		    "qcom,pm8150l-rpmh-regulators"
+		    "qcom,pm8998-rpmh-regulators"
+		    "qcom,pmi8998-rpmh-regulators"
 
 - qcom,pmic-id
 	Usage:      required
-- 
2.20.1

