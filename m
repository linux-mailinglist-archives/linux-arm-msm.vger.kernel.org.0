Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55F2A48703
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2019 17:27:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728614AbfFQPYv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jun 2019 11:24:51 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:52062 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726822AbfFQPYt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jun 2019 11:24:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
        Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
        List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
        List-Archive; bh=FGYGt9gR3ov0mDYFBrKxZVHm7Q6JC8o022bDhrc2nks=; b=sgV9DYSdi17l
        bXgPQR71kqZ1Os9L7ZHn5N9IsX02P/ySrrZgxuo+MoIm9RIp5y08NjpUhq+zGI8ImlMqPenYSlMYQ
        cz80uDmUWQFmegcK2Vi3D+A3k3/5fl+tq0fEiSqOoCjGXUilWHh4kLYAadyIjpXrG9bJ91IkMHWri
        4yOK8=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=finisterre.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hctUz-0001zj-Ll; Mon, 17 Jun 2019 15:24:45 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
        id 34116440046; Mon, 17 Jun 2019 16:24:45 +0100 (BST)
From:   Mark Brown <broonie@kernel.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, broonie@kernel.org,
        devicetree@vger.kernel.org, lgirdwood@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Brown <broonie@kernel.org>, mark.rutland@arm.com,
        robh+dt@kernel.org
Subject: Applied "regulator: qcom_spmi: Refactor get_mode/set_mode" to the regulator tree
In-Reply-To: <20190613212531.10452-2-jeffrey.l.hugo@gmail.com>
X-Patchwork-Hint: ignore
Message-Id: <20190617152445.34116440046@finisterre.sirena.org.uk>
Date:   Mon, 17 Jun 2019 16:24:45 +0100 (BST)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The patch

   regulator: qcom_spmi: Refactor get_mode/set_mode

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

From ba576a6232dc06605f4edfaeea9b526ba7724f84 Mon Sep 17 00:00:00 2001
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Thu, 13 Jun 2019 14:25:31 -0700
Subject: [PATCH] regulator: qcom_spmi: Refactor get_mode/set_mode

spmi_regulator_common_get_mode and spmi_regulator_common_set_mode use
multi-level ifs which mirror a switch statement.  Refactor to use a switch
statement to make the code flow more clear.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/qcom_spmi-regulator.c | 26 +++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/regulator/qcom_spmi-regulator.c b/drivers/regulator/qcom_spmi-regulator.c
index 42c429d50743..1b3383a24c9d 100644
--- a/drivers/regulator/qcom_spmi-regulator.c
+++ b/drivers/regulator/qcom_spmi-regulator.c
@@ -911,13 +911,16 @@ static unsigned int spmi_regulator_common_get_mode(struct regulator_dev *rdev)
 
 	spmi_vreg_read(vreg, SPMI_COMMON_REG_MODE, &reg, 1);
 
-	if (reg & SPMI_COMMON_MODE_HPM_MASK)
-		return REGULATOR_MODE_NORMAL;
+	reg &= SPMI_COMMON_MODE_HPM_MASK | SPMI_COMMON_MODE_AUTO_MASK;
 
-	if (reg & SPMI_COMMON_MODE_AUTO_MASK)
+	switch (reg) {
+	case SPMI_COMMON_MODE_HPM_MASK:
+		return REGULATOR_MODE_NORMAL;
+	case SPMI_COMMON_MODE_AUTO_MASK:
 		return REGULATOR_MODE_FAST;
-
-	return REGULATOR_MODE_IDLE;
+	default:
+		return REGULATOR_MODE_IDLE;
+	}
 }
 
 static int
@@ -925,12 +928,19 @@ spmi_regulator_common_set_mode(struct regulator_dev *rdev, unsigned int mode)
 {
 	struct spmi_regulator *vreg = rdev_get_drvdata(rdev);
 	u8 mask = SPMI_COMMON_MODE_HPM_MASK | SPMI_COMMON_MODE_AUTO_MASK;
-	u8 val = 0;
+	u8 val;
 
-	if (mode == REGULATOR_MODE_NORMAL)
+	switch (mode) {
+	case REGULATOR_MODE_NORMAL:
 		val = SPMI_COMMON_MODE_HPM_MASK;
-	else if (mode == REGULATOR_MODE_FAST)
+		break;
+	case REGULATOR_MODE_FAST:
 		val = SPMI_COMMON_MODE_AUTO_MASK;
+		break;
+	default:
+		val = 0;
+		break;
+	}
 
 	return spmi_vreg_update_bits(vreg, SPMI_COMMON_REG_MODE, val, mask);
 }
-- 
2.20.1

