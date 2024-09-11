Return-Path: <linux-arm-msm+bounces-31500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8464897511B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 13:53:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6FDA1C21CBE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 11:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0013187342;
	Wed, 11 Sep 2024 11:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d/fdVFS6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F161865E2;
	Wed, 11 Sep 2024 11:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726055610; cv=none; b=jKK0R1jZb5Hbk+YXnzrYTT0lbYuouKLVQeCONQsfTHeCRx9803/WGwCfGQKdGYomtmG9Ij7C9B1ArxbAoIMgB7sqdD/gZDq1wCwxZE0Wiev/cuHN081WWs1iXDvTotMAcIw8kO6T52wVtgNRt9/Kbz1zUq9Nh6FOmn5elDQT5Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726055610; c=relaxed/simple;
	bh=IZP0j0URHKg34Z+uDXsss8wvd9andjBbgzMWCUodLmI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P84tqGEyia/f1MwR5y1NOkoCdN2/du75x1Do+KWAVYa8uiM6+kKNX0eGXNy0N5aHaESjU7SVdeSn+FzJY/393obfzql1R9K6jp9b6Qj5rVHYfafiszifGi4BqKstbEWidUD1yQsahczW3VHFTVCPuGn+1dyXQ+E6IqqS60jjrew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d/fdVFS6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66CDBC4CEC6;
	Wed, 11 Sep 2024 11:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726055610;
	bh=IZP0j0URHKg34Z+uDXsss8wvd9andjBbgzMWCUodLmI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d/fdVFS6XEQFeADxLTiFke6jAgpiRerRJ5wROxrE+lBd1o2RdSV9MdHWHj+uZSyTk
	 Aa5yFtJdtYvhZ4UHC/ds5w2sYPQ0PCVu9jxL/RF53gk2LT+9lPc9u1lgvqFH1Gsrn3
	 c3payVXt+6GIJOX1elOndTTHvUAJIy+zVsKuaWTD2xC7SOBeLISnYqnwBe2lLhFGNF
	 0+Uhf8XscvoLCz/oFnKyiQrLcR8fUIm+ySWeCnI56xoHqp156zYYl8Qnj4Wj3SSaWb
	 wfejaQED14F7pR9NtI+WP9HlZuMqUSWrvavnVe9boWENRN6WyK9eTdpgmG2WSqV+E6
	 WT0MlbEwtZn8g==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1soLuv-000000002rS-2cQ7;
	Wed, 11 Sep 2024 13:53:49 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 4/4] phy: qcom: qmp-usb: move driver data initialisation earlier
Date: Wed, 11 Sep 2024 13:52:53 +0200
Message-ID: <20240911115253.10920-5-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240911115253.10920-1-johan+linaro@kernel.org>
References: <20240911115253.10920-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 44aff8e31080 ("phy: qcom-qmp-combo: clean up probe
initialisation") removed most users of the platform device driver data,
but mistakenly also removed the initialisation despite the data still
being used in the runtime PM callbacks.

The initialisation was soon after restored by commit 83a0bbe39b17 ("phy:
qcom-qmp-combo: add support for updated sc8280xp binding") but now
happens slightly later during probe. This should not cause any trouble
currently as runtime PM needs to be enabled manually through sysfs and
the platform device would not be suspended before the PHY has been
registered anyway.

Move the driver data initialisation to avoid a NULL-pointer dereference
on runtime suspend if runtime PM is ever enabled by default in this
driver.

Fixes: 44aff8e31080 ("phy: qcom-qmp-combo: clean up probe initialisation")
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index c478bf74817a..ddecf34968fd 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -3649,6 +3649,7 @@ static int qmp_combo_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	qmp->dev = dev;
+	dev_set_drvdata(dev, qmp);
 
 	qmp->orientation = TYPEC_ORIENTATION_NORMAL;
 
@@ -3725,8 +3726,6 @@ static int qmp_combo_probe(struct platform_device *pdev)
 
 	phy_set_drvdata(qmp->dp_phy, qmp);
 
-	dev_set_drvdata(dev, qmp);
-
 	if (usb_np == dev->of_node)
 		phy_provider = devm_of_phy_provider_register(dev, qmp_combo_phy_xlate);
 	else
-- 
2.44.2


