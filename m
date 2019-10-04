Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F57ACC221
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2019 19:54:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389012AbfJDRxL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Oct 2019 13:53:11 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:50966 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388648AbfJDRwr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Oct 2019 13:52:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
        Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
        List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
        List-Archive; bh=Z7nsFJXI9WnA9ER91wdkft7vbWP+YLeTSIFLA7ZXd9A=; b=lYettB7+ajDb
        JD3KPvzeWCkXx3uhtELzTsMAQ2QMzjAF0765h3Q9saXBwlRBSbQo5pYjILePyTSAWA4krh8RN21m0
        OenwhjTCRC4Vx10XU0zMlvtuyyl44HF/gB2bdX/3cJveAYSnehqUVUhRB2cKkIJmAmCrphtER4Vsc
        5lyNA=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iGRkx-0003wW-Np; Fri, 04 Oct 2019 17:52:43 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 44F772741F98; Fri,  4 Oct 2019 18:52:43 +0100 (BST)
From:   Mark Brown <broonie@kernel.org>
To:     Kiran Gunda <kgunda@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>, bjorn.andersson@linaro.org,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Brown <broonie@kernel.org>
Subject: Applied "regulator: qcom-rpmh: Fix PMIC5 BoB min voltage" to the regulator tree
In-Reply-To: <1570184215-5355-1-git-send-email-kgunda@codeaurora.org>
X-Patchwork-Hint: ignore
Message-Id: <20191004175243.44F772741F98@ypsilon.sirena.org.uk>
Date:   Fri,  4 Oct 2019 18:52:43 +0100 (BST)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The patch

   regulator: qcom-rpmh: Fix PMIC5 BoB min voltage

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

From 77fd66c9ff3e992718a79fa6407148935d34b50f Mon Sep 17 00:00:00 2001
From: Kiran Gunda <kgunda@codeaurora.org>
Date: Fri, 4 Oct 2019 15:46:55 +0530
Subject: [PATCH] regulator: qcom-rpmh: Fix PMIC5 BoB min voltage

Correct the PMIC5 BoB min voltage from 0.3V to 3V. Also correct
the voltage selector accordingly.

Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
Link: https://lore.kernel.org/r/1570184215-5355-1-git-send-email-kgunda@codeaurora.org
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/qcom-rpmh-regulator.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index db6c085da65e..0246b6f99fb5 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -735,8 +735,8 @@ static const struct rpmh_vreg_hw_data pmic5_hfsmps515 = {
 static const struct rpmh_vreg_hw_data pmic5_bob = {
 	.regulator_type = VRM,
 	.ops = &rpmh_regulator_vrm_bypass_ops,
-	.voltage_range = REGULATOR_LINEAR_RANGE(300000, 0, 135, 32000),
-	.n_voltages = 136,
+	.voltage_range = REGULATOR_LINEAR_RANGE(3000000, 0, 31, 32000),
+	.n_voltages = 32,
 	.pmic_mode_map = pmic_mode_map_pmic5_bob,
 	.of_map_mode = rpmh_regulator_pmic4_bob_of_map_mode,
 };
-- 
2.20.1

