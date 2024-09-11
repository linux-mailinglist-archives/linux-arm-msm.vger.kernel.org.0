Return-Path: <linux-arm-msm+bounces-31502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD8B97511D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 13:53:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4446281A8A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 11:53:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E574A18784E;
	Wed, 11 Sep 2024 11:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CcOulFoU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DD355E73;
	Wed, 11 Sep 2024 11:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726055610; cv=none; b=chy2qf6Qhiu/79NIbsDEheR+nEsAGD+xZJ8foCQON7ht1GBtB8Yd7N7pWaQ4wCAi/SgpV4ng2Ha1c3pwXGOw0UFP5Hm5zBTRL3NvyEA63kNZgMwJ1i+Uw9k4XU+PSUho70gof26c3nRgsZcAjgt3oZ5WcFuSD875Dh2JJ9hkLkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726055610; c=relaxed/simple;
	bh=wnlcu3GUOvYuxP341TqK9IEhiSWPkVw9Fa0I9EzEjFw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tXTPZAK9kj2BmghRlNMU5sYPe3MjpwD0urSax9MV5NeapweqU/S3G/eEUvdclA5NT8No3uO5u1VK1j/K4Q+hVkmokhb31K2ynek8g2hN5vuhjM83w2BdxrJ80Omt8RvDRc0AzV5YBBmCTX5mBDj4YTNzIFt5LZXU8pWu0SXwq8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CcOulFoU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7024EC4CEC7;
	Wed, 11 Sep 2024 11:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726055610;
	bh=wnlcu3GUOvYuxP341TqK9IEhiSWPkVw9Fa0I9EzEjFw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CcOulFoUp0JVqELwXzKSFU1c/G2V9DezoCCctHwVTW4jreVPOe3+YS/9fjh9i2Wio
	 NzYzTWesRU/Mbzc3lihTEXVomEVdWHFBuklpMG6Ns2GVtgq2HdMr3UMiviRpZYpQmN
	 ojrODh6zIsz/izFET0GWZ6aYWuYc4R0tCvcjRc/vngTISPwtX4e8nHub3gFgwxDqq7
	 7XaNDwV8fR9ZFZ/+2Ru8lNNqVcBAht1NhH2Dc83iN7n/hjO3eRf97jigeIWtUvh4vN
	 Nzz8WpcfQaigw+C6egA8iYJ6wjR064IerdNtE0zH1du8NcA0CU2KIaqzlqrSCb4qI6
	 G8yDYsJZHVSDg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1soLuv-000000002rQ-2Hvh;
	Wed, 11 Sep 2024 13:53:49 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH 3/4] phy: qcom: qmp-usbc: fix NULL-deref on runtime suspend
Date: Wed, 11 Sep 2024 13:52:52 +0200
Message-ID: <20240911115253.10920-4-johan+linaro@kernel.org>
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

Commit 413db06c05e7 ("phy: qcom-qmp-usb: clean up probe initialisation")
removed most users of the platform device driver data from the
qcom-qmp-usb driver, but mistakenly also removed the initialisation
despite the data still being used in the runtime PM callbacks. This bug
was later reproduced when the driver was copied to create the qmp-usbc
driver.

Restore the driver data initialisation at probe to avoid a NULL-pointer
dereference on runtime suspend.

Apparently no one uses runtime PM, which currently needs to be enabled
manually through sysfs, with these drivers.

Fixes: 19281571a4d5 ("phy: qcom: qmp-usb: split USB-C PHY driver")
Cc: stable@vger.kernel.org	# 6.9
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index 5cbc5fd529eb..dea3456f88b1 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -1049,6 +1049,7 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	qmp->dev = dev;
+	dev_set_drvdata(dev, qmp);
 
 	qmp->orientation = TYPEC_ORIENTATION_NORMAL;
 
-- 
2.44.2


