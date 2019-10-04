Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EC1CCC209
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2019 19:52:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388667AbfJDRwr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Oct 2019 13:52:47 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:50930 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388643AbfJDRwr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Oct 2019 13:52:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
        Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
        List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
        List-Archive; bh=DZteKWiCg/rzRkGg/VW0yCwD7S2qYWJWyPuyGedcDZc=; b=YtY6+wThIvSZ
        Vh4I5gFdI+VGZtDtGv4taDLVXjfuMAXgj8+BjJHVBHei20mw//JqV9sOFmz8JSPXPSL37R6wJREpd
        G1pJ9Pg/+tlatuWnx0WVs5SfIZkbhZThmrxrk8CfkYAIJ8i1nutNYXZqtGVvb6zq58mRy/v4/lVWS
        WugLM=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iGRkx-0003wJ-7e; Fri, 04 Oct 2019 17:52:43 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id C0B6B2741EF2; Fri,  4 Oct 2019 18:52:42 +0100 (BST)
From:   Mark Brown <broonie@kernel.org>
To:     Kiran Gunda <kgunda@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Brown <broonie@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Applied "regulator: dt-bindings: Add PM6150x compatibles" to the regulator tree
In-Reply-To: <1570183734-30706-2-git-send-email-kgunda@codeaurora.org>
X-Patchwork-Hint: ignore
Message-Id: <20191004175242.C0B6B2741EF2@ypsilon.sirena.org.uk>
Date:   Fri,  4 Oct 2019 18:52:42 +0100 (BST)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The patch

   regulator: dt-bindings: Add PM6150x compatibles

has been applied to the regulator tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-5.5

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

From 0c06b311c053ab12a9690e17a98ff4e4a90ab3e5 Mon Sep 17 00:00:00 2001
From: Kiran Gunda <kgunda@codeaurora.org>
Date: Fri, 4 Oct 2019 15:38:53 +0530
Subject: [PATCH] regulator: dt-bindings: Add PM6150x compatibles

Add PM6150 and PM6150L compatibles for Qualcomm SC7180 platfrom.

Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
Link: https://lore.kernel.org/r/1570183734-30706-2-git-send-email-kgunda@codeaurora.org
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../devicetree/bindings/regulator/qcom,rpmh-regulator.txt     | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
index bab9f71140b8..97c3e0b7611c 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
@@ -28,6 +28,8 @@ Supported regulator node names:
 	PM8150L:	smps1 - smps8, ldo1 - ldo11, bob, flash, rgb
 	PM8998:		smps1 - smps13, ldo1 - ldo28, lvs1 - lvs2
 	PMI8998:	bob
+	PM6150:         smps1 - smps5, ldo1 - ldo19
+	PM6150L:        smps1 - smps8, ldo1 - ldo11, bob
 
 ========================
 First Level Nodes - PMIC
@@ -43,6 +45,8 @@ First Level Nodes - PMIC
 		    "qcom,pm8150l-rpmh-regulators"
 		    "qcom,pm8998-rpmh-regulators"
 		    "qcom,pmi8998-rpmh-regulators"
+		    "qcom,pm6150-rpmh-regulators"
+		    "qcom,pm6150l-rpmh-regulators"
 
 - qcom,pmic-id
 	Usage:      required
-- 
2.20.1

