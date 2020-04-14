Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0331E1A83F2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2020 17:58:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391180AbgDNP6X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Apr 2020 11:58:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:57418 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391163AbgDNP6Q (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Apr 2020 11:58:16 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F2015206D5;
        Tue, 14 Apr 2020 15:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586879895;
        bh=HmaU3l3swntVmTdV5jrthH/lFKI1N3adOZ+7biFLSOI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=dxVMlYZXoaXe/aiN330f9RuzDmQjZoNCvN62MZ9dHRvl65zKDCwjTGXWhhNe7wjK4
         ld5qvIbx0Qrfvc23Klc24ONin5cq6TltqWHPXkgmp0478PKpHyk2fwTDuVBMN4eIyS
         zqpV+LK0YbvaBGVOJ57xUAhozogNVdHAt/SnPiGI=
Date:   Tue, 14 Apr 2020 16:58:12 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Jason Yan <yanaijie@huawei.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, broonie@kernel.org,
        Hulk Robot <hulkci@huawei.com>, lgirdwood@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Brown <broonie@kernel.org>
Subject: Applied "regulator: qcom_rpm: remove defined but not used 'pm8921_ftsmps'" to the regulator tree
In-Reply-To:  <20200409114026.38383-1-yanaijie@huawei.com>
Message-Id:  <applied-20200409114026.38383-1-yanaijie@huawei.com>
X-Patchwork-Hint: ignore
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The patch

   regulator: qcom_rpm: remove defined but not used 'pm8921_ftsmps'

has been applied to the regulator tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git 

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

From d2c2c218ea3f46cabd0955307d246e18371565dd Mon Sep 17 00:00:00 2001
From: Jason Yan <yanaijie@huawei.com>
Date: Thu, 9 Apr 2020 19:40:26 +0800
Subject: [PATCH] regulator: qcom_rpm: remove defined but not used
 'pm8921_ftsmps'
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix the following gcc warning:

drivers/regulator/qcom_rpm-regulator.c:607:34: warning: ‘pm8921_ftsmps’
defined but not used [-Wunused-const-variable=]
 static const struct qcom_rpm_reg pm8921_ftsmps = {
                                  ^~~~~~~~~~~~~

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Jason Yan <yanaijie@huawei.com>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Link: https://lore.kernel.org/r/20200409114026.38383-1-yanaijie@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/qcom_rpm-regulator.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/regulator/qcom_rpm-regulator.c b/drivers/regulator/qcom_rpm-regulator.c
index 7fc97f23fcf4..1ee8ec686ed3 100644
--- a/drivers/regulator/qcom_rpm-regulator.c
+++ b/drivers/regulator/qcom_rpm-regulator.c
@@ -604,16 +604,6 @@ static const struct qcom_rpm_reg pm8921_smps = {
 	.supports_force_mode_bypass = false,
 };
 
-static const struct qcom_rpm_reg pm8921_ftsmps = {
-	.desc.linear_ranges = ftsmps_ranges,
-	.desc.n_linear_ranges = ARRAY_SIZE(ftsmps_ranges),
-	.desc.n_voltages = 101,
-	.desc.ops = &uV_ops,
-	.parts = &rpm8960_smps_parts,
-	.supports_force_mode_auto = true,
-	.supports_force_mode_bypass = false,
-};
-
 static const struct qcom_rpm_reg pm8921_ncp = {
 	.desc.linear_ranges = ncp_ranges,
 	.desc.n_linear_ranges = ARRAY_SIZE(ncp_ranges),
-- 
2.20.1

