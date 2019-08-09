Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6C0987A1D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2019 14:32:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406985AbfHIMcD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Aug 2019 08:32:03 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:59310 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406973AbfHIMcC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Aug 2019 08:32:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
        Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
        List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
        List-Archive; bh=0fYfG885FJ5I78wk1+e/jJlsGJIsHRza+XCXpRd8Jvw=; b=K6RDdWMJVmSV
        bHdwgogsULvhpdSnvt7LGHXl7+EIvmRrH86TxJLPzdW1cKUdjPbtzy5i+VltFlprjLpR8Go78Eb07
        uBgcI2b2JLxVP4kaDOQgAvgj0/JdpCQXMF9NA/nGCvLULYBFM6V672EQmeYSPv87oxy2oZ++Gv/Rh
        ySWko=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1hw43r-00062C-1x; Fri, 09 Aug 2019 12:31:59 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 92D87274303D; Fri,  9 Aug 2019 13:31:58 +0100 (BST)
From:   Mark Brown <broonie@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Brown <broonie@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Applied "regulator: dt-bindings: Sort the compatibles and nodes" to the regulator tree
In-Reply-To: <20190809073616.1235-1-vkoul@kernel.org>
X-Patchwork-Hint: ignore
Message-Id: <20190809123158.92D87274303D@ypsilon.sirena.org.uk>
Date:   Fri,  9 Aug 2019 13:31:58 +0100 (BST)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The patch

   regulator: dt-bindings: Sort the compatibles and nodes

has been applied to the regulator tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-5.4

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From c6e20fa49818381dfa7288fad4c33b84408aab54 Mon Sep 17 00:00:00 2001
From: Vinod Koul <vkoul@kernel.org>
Date: Fri, 9 Aug 2019 13:06:13 +0530
Subject: [PATCH] regulator: dt-bindings: Sort the compatibles and nodes

It helps to keep sorted order for compatibles and nodes, so sort them

Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Link: https://lore.kernel.org/r/20190809073616.1235-1-vkoul@kernel.org
Signed-off-by: Mark Brown <broonie@kernel.org>
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

