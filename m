Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40E5A87A27
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2019 14:32:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406671AbfHIMcb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Aug 2019 08:32:31 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:59314 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406976AbfHIMcD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Aug 2019 08:32:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
        Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
        List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
        List-Archive; bh=eoY+Th80rH30dC+RAHj1RWkzYop+aXe6pNj+PkTZ5uY=; b=i5KJ1sIngH9l
        IAXMDf1x6MhEQvf10GAcXaXUuvHygOaKFRaHFo34uqzhqEDxWj3XUkSixX4OljFwCuQcVZYykykcK
        6ZLV0T7WTujJS5gGOLUF7+nqrifCBAtewOVUjS9jj4fp7eek9qP7DIscxCZgflAZzjxp1jqo6OpwI
        tFil0=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1hw43r-000628-8X; Fri, 09 Aug 2019 12:31:59 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 55A8B27430B7; Fri,  9 Aug 2019 13:31:58 +0100 (BST)
From:   Mark Brown <broonie@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Brown <broonie@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Applied "regulator: qcom-rpmh: Sort the compatibles" to the regulator tree
In-Reply-To: <20190809073616.1235-2-vkoul@kernel.org>
X-Patchwork-Hint: ignore
Message-Id: <20190809123158.55A8B27430B7@ypsilon.sirena.org.uk>
Date:   Fri,  9 Aug 2019 13:31:58 +0100 (BST)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The patch

   regulator: qcom-rpmh: Sort the compatibles

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

From 7172fb7f3abea4787ca01dda7297241c4b0f0af5 Mon Sep 17 00:00:00 2001
From: Vinod Koul <vkoul@kernel.org>
Date: Fri, 9 Aug 2019 13:06:14 +0530
Subject: [PATCH] regulator: qcom-rpmh: Sort the compatibles

It helps to keep sorted order for compatibles, so sort them

Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Link: https://lore.kernel.org/r/20190809073616.1235-2-vkoul@kernel.org
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/qcom-rpmh-regulator.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index 693ffec62f3e..0ef2716da3bd 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -878,18 +878,14 @@ static int rpmh_regulator_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id rpmh_regulator_match_table[] = {
-	{
-		.compatible = "qcom,pm8998-rpmh-regulators",
-		.data = pm8998_vreg_data,
-	},
-	{
-		.compatible = "qcom,pmi8998-rpmh-regulators",
-		.data = pmi8998_vreg_data,
-	},
 	{
 		.compatible = "qcom,pm8005-rpmh-regulators",
 		.data = pm8005_vreg_data,
 	},
+	{
+		.compatible = "qcom,pm8009-rpmh-regulators",
+		.data = pm8009_vreg_data,
+	},
 	{
 		.compatible = "qcom,pm8150-rpmh-regulators",
 		.data = pm8150_vreg_data,
@@ -899,8 +895,12 @@ static const struct of_device_id rpmh_regulator_match_table[] = {
 		.data = pm8150l_vreg_data,
 	},
 	{
-		.compatible = "qcom,pm8009-rpmh-regulators",
-		.data = pm8009_vreg_data,
+		.compatible = "qcom,pm8998-rpmh-regulators",
+		.data = pm8998_vreg_data,
+	},
+	{
+		.compatible = "qcom,pmi8998-rpmh-regulators",
+		.data = pmi8998_vreg_data,
 	},
 	{}
 };
-- 
2.20.1

