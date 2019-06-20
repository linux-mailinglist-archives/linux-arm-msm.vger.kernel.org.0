Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9CAA4CEB6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2019 15:32:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727552AbfFTNce (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jun 2019 09:32:34 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:59128 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726530AbfFTNce (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jun 2019 09:32:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
        Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
        List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
        List-Archive; bh=Jueyu+KsHGFDIqe1H2Sbw0WA1QJ6TzthvL4xQX/GrMg=; b=kCwwzUI+wK9H
        fq8XUOrkjvi58npc6E9HdvuzfySpPPwN+JVy/zJi5z1u9J3Vmk/3lCUG+B1BDGAVgNHqINz0J0QVb
        ORwVPNZZFOwSJMzVdIrvENMz26bB6ILfOyNjdWVrv4WykXw0M83k4TsChHl0bPMRV/bkSlPmrmj7J
        lvlaU=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=finisterre.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hdxB1-0000kF-RP; Thu, 20 Jun 2019 13:32:31 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
        id 63BB5440046; Thu, 20 Jun 2019 14:32:31 +0100 (BST)
From:   Mark Brown <broonie@kernel.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        bjorn.andersson@linaro.org, broonie@kernel.org,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        jorge.ramirez-ortiz@linaro.org, lgirdwood@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Brown <broonie@kernel.org>
Subject: Applied "regulator: qcom_spmi: Fix math of spmi_regulator_set_voltage_time_sel" to the regulator tree
In-Reply-To: <20190619185636.10831-1-jeffrey.l.hugo@gmail.com>
X-Patchwork-Hint: ignore
Message-Id: <20190620133231.63BB5440046@finisterre.sirena.org.uk>
Date:   Thu, 20 Jun 2019 14:32:31 +0100 (BST)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The patch

   regulator: qcom_spmi: Fix math of spmi_regulator_set_voltage_time_sel

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

From 61d7fdc49f03f4ec990974d1d2a8b05e64afeae4 Mon Sep 17 00:00:00 2001
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Wed, 19 Jun 2019 11:56:36 -0700
Subject: [PATCH] regulator: qcom_spmi: Fix math of
 spmi_regulator_set_voltage_time_sel

spmi_regulator_set_voltage_time_sel() calculates the amount of delay
needed as the result of setting a new voltage.  Essentially this is the
absolute difference of the old and new voltages, divided by the slew rate.

The implementation of spmi_regulator_set_voltage_time_sel() is wrong.

It attempts to calculate the difference in voltages by using the
difference in selectors and multiplying by the voltage step between
selectors.  This ignores the possibility that the old and new selectors
might be from different ranges, which have different step values.  Also,
the difference between the selectors may encapsulate N ranges inbetween,
so a summation of each selector change from old to new would be needed.

Lets avoid all of that complexity, and just get the actual voltage
represented by both the old and new selector, and use those to directly
compute the voltage delta.  This is more straight forward, and has the
side benifit of avoiding issues with regulator implementations that don't
have hardware register support to get the current configured range.

Fixes: e92a4047419c ("regulator: Add QCOM SPMI regulator driver")
Reported-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reported-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Reported-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Tested-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/qcom_spmi-regulator.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/regulator/qcom_spmi-regulator.c b/drivers/regulator/qcom_spmi-regulator.c
index 13f83be50076..877df33e0246 100644
--- a/drivers/regulator/qcom_spmi-regulator.c
+++ b/drivers/regulator/qcom_spmi-regulator.c
@@ -813,14 +813,10 @@ static int spmi_regulator_set_voltage_time_sel(struct regulator_dev *rdev,
 		unsigned int old_selector, unsigned int new_selector)
 {
 	struct spmi_regulator *vreg = rdev_get_drvdata(rdev);
-	const struct spmi_voltage_range *range;
 	int diff_uV;
 
-	range = spmi_regulator_find_range(vreg);
-	if (!range)
-		return -EINVAL;
-
-	diff_uV = abs(new_selector - old_selector) * range->step_uV;
+	diff_uV = abs(spmi_regulator_common_list_voltage(rdev, new_selector) -
+		      spmi_regulator_common_list_voltage(rdev, old_selector));
 
 	return DIV_ROUND_UP(diff_uV, vreg->slew_rate);
 }
-- 
2.20.1

