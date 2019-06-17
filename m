Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBB7B48702
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2019 17:27:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728620AbfFQPYv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jun 2019 11:24:51 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:52094 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728602AbfFQPYt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jun 2019 11:24:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
        Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
        List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
        List-Archive; bh=BjW9HNHz5KOtc9NkCfpQrJY++tgx8ed1xcEUiVcmxgw=; b=jB1vsl8oPtHT
        xPNUZhDDvuPNUwhZaHfdcjoBw2YJuEwKMG3h5FMXxGO1Uu58pLOoBNwv0OASzMiyYe3ejIL5tQLR0
        BcxHv1cFfsk/7NL1YurTrJp/XxBXNynf1w5jovc3BSg2y/dV0IVsFHfl1AzNehTVplV8HDN5+233X
        h3XsM=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45] (helo=finisterre.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hctV0-0001zm-8i; Mon, 17 Jun 2019 15:24:46 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
        id B71F1440049; Mon, 17 Jun 2019 16:24:45 +0100 (BST)
From:   Mark Brown <broonie@kernel.org>
To:     Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, broonie@kernel.org,
        devicetree@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, lgirdwood@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Brown <broonie@kernel.org>, mark.rutland@arm.com,
        robh+dt@kernel.org
Subject: Applied "regulator: qcom_spmi: enable linear range info" to the regulator tree
In-Reply-To: <20190613212531.10452-1-jeffrey.l.hugo@gmail.com>
X-Patchwork-Hint: ignore
Message-Id: <20190617152445.B71F1440049@finisterre.sirena.org.uk>
Date:   Mon, 17 Jun 2019 16:24:45 +0100 (BST)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The patch

   regulator: qcom_spmi: enable linear range info

has been applied to the regulator tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-5.3

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

From 86f4ff7a0c0cd8e391ffa4dd0edb82ae0eedcc9e Mon Sep 17 00:00:00 2001
From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Date: Thu, 13 Jun 2019 14:25:30 -0700
Subject: [PATCH] regulator: qcom_spmi: enable linear range info

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/qcom_spmi-regulator.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/regulator/qcom_spmi-regulator.c b/drivers/regulator/qcom_spmi-regulator.c
index 53a61fb65642..42c429d50743 100644
--- a/drivers/regulator/qcom_spmi-regulator.c
+++ b/drivers/regulator/qcom_spmi-regulator.c
@@ -1744,6 +1744,7 @@ MODULE_DEVICE_TABLE(of, qcom_spmi_regulator_match);
 static int qcom_spmi_regulator_probe(struct platform_device *pdev)
 {
 	const struct spmi_regulator_data *reg;
+	const struct spmi_voltage_range *range;
 	const struct of_device_id *match;
 	struct regulator_config config = { };
 	struct regulator_dev *rdev;
@@ -1833,6 +1834,12 @@ static int qcom_spmi_regulator_probe(struct platform_device *pdev)
 			}
 		}
 
+		if (vreg->set_points->count == 1) {
+			/* since there is only one range */
+			range = vreg->set_points->range;
+			vreg->desc.uV_step = range->step_uV;
+		}
+
 		config.dev = dev;
 		config.driver_data = vreg;
 		config.regmap = regmap;
-- 
2.20.1

