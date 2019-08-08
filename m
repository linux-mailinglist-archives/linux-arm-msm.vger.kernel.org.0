Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA71A86B97
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2019 22:34:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404567AbfHHUdz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Aug 2019 16:33:55 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:59014 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390186AbfHHUdx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Aug 2019 16:33:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
        Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
        List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
        List-Archive; bh=TGTfGqfOMgVvjL/QPZF6UpiPmWUonJ4ujvK9D1SoyDs=; b=d259rLtczXP/
        L9mMrJ+SQA15m0imXlYkwBndLcFlBVvOW4JgRhQmQL4gYJ6a2AakfXSOfwMnrXiBrA3eaBbv1X4DA
        WCIZ6CvHkVITeqb1KGtlhUN8wzMyBRAnx720dyUma0jGvghUjVBD6GMllS+bGE7voOBkPZg8q7LRq
        JWvyM=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1hvp6b-00042k-Q6; Thu, 08 Aug 2019 20:33:49 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 57C7A2742BE9; Thu,  8 Aug 2019 21:33:49 +0100 (BST)
From:   Mark Brown <broonie@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Brown <broonie@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Applied "regulator: dt-bindings: Add PM8150x compatibles" to the regulator tree
In-Reply-To: <20190808093343.5600-1-vkoul@kernel.org>
X-Patchwork-Hint: ignore
Message-Id: <20190808203349.57C7A2742BE9@ypsilon.sirena.org.uk>
Date:   Thu,  8 Aug 2019 21:33:49 +0100 (BST)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The patch

   regulator: dt-bindings: Add PM8150x compatibles

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

From d566aae1c80d9be2276057b3236c68bdcc5b3254 Mon Sep 17 00:00:00 2001
From: Vinod Koul <vkoul@kernel.org>
Date: Thu, 8 Aug 2019 15:03:42 +0530
Subject: [PATCH] regulator: dt-bindings: Add PM8150x compatibles

Add PM8150, PM8150L and PM8009 compatibles for these PMICs found
in some Qualcomm platforms.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Link: https://lore.kernel.org/r/20190808093343.5600-1-vkoul@kernel.org
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../devicetree/bindings/regulator/qcom,rpmh-regulator.txt | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
index 14d2eee96b3d..1a9cab50503a 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
@@ -25,6 +25,9 @@ Supported regulator node names:
 	PM8998:		smps1 - smps13, ldo1 - ldo28, lvs1 - lvs2
 	PMI8998:	bob
 	PM8005:		smps1 - smps4
+	PM8150:		smps1 - smps10, ldo1 - ldo18
+	PM8150L:	smps1 - smps8, ldo1 - ldo11, bob, flash, rgb
+	PM8009:		smps1 - smps2, ld01 - ldo7
 
 ========================
 First Level Nodes - PMIC
@@ -35,7 +38,10 @@ First Level Nodes - PMIC
 	Value type: <string>
 	Definition: Must be one of: "qcom,pm8998-rpmh-regulators",
 		    "qcom,pmi8998-rpmh-regulators" or
-		    "qcom,pm8005-rpmh-regulators".
+		    "qcom,pm8005-rpmh-regulators" or
+		    "qcom,pm8150-rpmh-regulators" or
+		    "qcom,pm8150l-rpmh-regulators" or
+		    "qcom,pm8009-rpmh-regulators".
 
 - qcom,pmic-id
 	Usage:      required
-- 
2.20.1

