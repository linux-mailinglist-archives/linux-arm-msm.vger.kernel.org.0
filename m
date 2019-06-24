Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11DBB5289B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2019 11:54:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729863AbfFYJyC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jun 2019 05:54:02 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:37074 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727613AbfFYJyC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jun 2019 05:54:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
        Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
        List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
        List-Archive; bh=cUVbQo3ot022TbqV5UdlVztC91EzyvQI8RT4N5SREkc=; b=TTxEke6uG1dE
        K/YrJsNLx87qrJ4zxgsRAKZIdoBDSRXm5E+Eet7fBYicQz/4HxlmzuT5OkdAem6DAoLJ3vVTiTk0q
        5SsPvQ+WzEzYPOBmBK6dFSOG9wR+RPbLwSidWrFueGchyjErceC2mtgVE62cnqfATmR5TnqCRyP4l
        CsGe8=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=finisterre.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hfi9G-0004mh-LJ; Tue, 25 Jun 2019 09:53:58 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
        id 863AC44006A; Mon, 24 Jun 2019 17:32:21 +0100 (BST)
From:   Mark Brown <broonie@kernel.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        bjorn.andersson@linaro.org, broonie@kernel.org,
        jorge.ramirez-ortiz@linaro.org, lgirdwood@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Brown <broonie@kernel.org>
Subject: Applied "regulator: qcom_spmi: Do NULL check for lvs" to the regulator tree
In-Reply-To: <20190620142228.11773-1-jeffrey.l.hugo@gmail.com>
X-Patchwork-Hint: ignore
Message-Id: <20190624163221.863AC44006A@finisterre.sirena.org.uk>
Date:   Mon, 24 Jun 2019 17:32:21 +0100 (BST)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The patch

   regulator: qcom_spmi: Do NULL check for lvs

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

From b01d18232587881ae813d4a1d14c8d9a2ac36b15 Mon Sep 17 00:00:00 2001
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Thu, 20 Jun 2019 07:22:28 -0700
Subject: [PATCH] regulator: qcom_spmi: Do NULL check for lvs

Low-voltage switches (lvs) don't have set_points since the voltage ranges
of the output are really controlled by the inputs.  This is a problem for
the newly added linear range support in the probe(), as that will cause
a null pointer dereference error on older platforms like msm8974 which
happen to need to control some of the implemented lvs.

Fix this by adding the appropriate null check.

Fixes: 86f4ff7a0c0c ("regulator: qcom_spmi: enable linear range info")
Reported-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/qcom_spmi-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/qcom_spmi-regulator.c b/drivers/regulator/qcom_spmi-regulator.c
index 877df33e0246..7f51c5fc8194 100644
--- a/drivers/regulator/qcom_spmi-regulator.c
+++ b/drivers/regulator/qcom_spmi-regulator.c
@@ -2045,7 +2045,7 @@ static int qcom_spmi_regulator_probe(struct platform_device *pdev)
 			}
 		}
 
-		if (vreg->set_points->count == 1) {
+		if (vreg->set_points && vreg->set_points->count == 1) {
 			/* since there is only one range */
 			range = vreg->set_points->range;
 			vreg->desc.uV_step = range->step_uV;
-- 
2.20.1

