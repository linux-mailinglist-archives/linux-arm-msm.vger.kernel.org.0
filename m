Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C5FD127D5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 May 2019 08:39:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726244AbfECGjX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 May 2019 02:39:23 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:59988 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725804AbfECGjX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 May 2019 02:39:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
        Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
        List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
        List-Archive; bh=NNDaBX/us8Cu1XYul1em7lrFs2nNIKPS6kMaF/YVrzQ=; b=TOKfBDguV+OP
        YSvQorhZ6bImmdnjwZLgHoEPgW71kxqB2Tsj8urqLryqrG3h2ZJAYMidIjrDG79Qj37hJSzehmMzr
        YfMBikfiL8VJYHxQ42kEQ64PtYQwQVgB6gY2rz2nbJJXuzzZ0fpHKxhBS1gMxcbm0J6WQZzypVi7u
        Tsbd0=;
Received: from [42.29.24.106] (helo=finisterre.ee.mobilebroadband)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hMRqp-0000rK-9z; Fri, 03 May 2019 06:39:19 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
        id E1A2D441D3D; Fri,  3 May 2019 07:39:13 +0100 (BST)
From:   Mark Brown <broonie@kernel.org>
To:     Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc:     bjorn.andersson@linaro.org, broonie@kernel.org,
        jorge.ramirez-ortiz@linaro.org, lgirdwood@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Brown <broonie@kernel.org>
Subject: Applied "regulator: core: simplify return value on suported_voltage" to the regulator tree
In-Reply-To: <20190422172824.13720-1-jorge.ramirez-ortiz@linaro.org>
X-Patchwork-Hint: ignore
Message-Id: <20190503063913.E1A2D441D3D@finisterre.ee.mobilebroadband>
Date:   Fri,  3 May 2019 07:39:13 +0100 (BST)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The patch

   regulator: core: simplify return value on suported_voltage

has been applied to the regulator tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-5.2

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

From 498209445124920b365ef43aac93d6f1acbaa1b7 Mon Sep 17 00:00:00 2001
From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Date: Mon, 22 Apr 2019 19:28:24 +0200
Subject: [PATCH] regulator: core: simplify return value on suported_voltage

All the current clients of this API  assume that 0 corresponds
to a failure and non-zero to a pass therefore ignoring the need to
handle a negative error code.

This commit modifies the API to follow that standard since returning a
negative (EINVAL) doesn't seem to provide enough value to justify
the need to handle it.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 08ccabe07fe3..af8b4dadb09b 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -3002,7 +3002,7 @@ EXPORT_SYMBOL_GPL(regulator_get_linear_step);
  * @min_uV: Minimum required voltage in uV.
  * @max_uV: Maximum required voltage in uV.
  *
- * Returns a boolean or a negative error code.
+ * Returns a boolean.
  */
 int regulator_is_supported_voltage(struct regulator *regulator,
 				   int min_uV, int max_uV)
@@ -3026,7 +3026,7 @@ int regulator_is_supported_voltage(struct regulator *regulator,
 
 	ret = regulator_count_voltages(regulator);
 	if (ret < 0)
-		return ret;
+		return 0;
 	voltages = ret;
 
 	for (i = 0; i < voltages; i++) {
-- 
2.20.1

