Return-Path: <linux-arm-msm+bounces-31503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EE47B97511E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 13:53:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A62E71F275E3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 11:53:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E67F2187866;
	Wed, 11 Sep 2024 11:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vM51sJdD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E72185B48;
	Wed, 11 Sep 2024 11:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726055610; cv=none; b=pfgjh7XmRyA8V9prg3j94ZuKJDNu8vOj9tdnvcLXZE3hFuPDcO3UzZVxDTBeq3BrDFOXLHsPZBwk3HK/lc9kS4YRlfSUnBrTfgGqHMbbPjMq+V1ULZxu1vsQym/RDIheR1QooEGb/UAZN2w9GN5oW/YufD9L23smTDeE22sFQfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726055610; c=relaxed/simple;
	bh=pY7ZEUhLGzksrKZfDgxIIs9lG9DM9Yt0khFnqvZZ+d4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nNMkL23mcV0eebMMuBG28eMvqChN8A+2gmIO7n74tBhatxoZR43LXLsucW/UWvJ0sGcBhJ4DGOd8/PZg7lFAYBgp6zL15wlufXhpeDVgJDuGIFdIhUH9a4wgOeG+0z85nsid2x0uUa15LvB9pxTIlh9Pwrlc9+aXGpNRJVlG0sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vM51sJdD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CFADC4CECE;
	Wed, 11 Sep 2024 11:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726055610;
	bh=pY7ZEUhLGzksrKZfDgxIIs9lG9DM9Yt0khFnqvZZ+d4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vM51sJdDqQ4+sKY3Ntz1M0MKkDsCRj3bG5+TWbNJNMvBNAjn4CE/o3GDYl8iFKpii
	 MnYaKOSy9gUC/6kebjavN8KiclPXzIJOZFFzGtALkj4NoWRODotpj405ad8gQzPz64
	 yf670FHTUIQUIAGy82aTVbRYCA4wzOyd2QdAYLqVNq/OSRkYDxRiXd344KWWU/XNKX
	 4WSRLtWZ5nYLlmy122coEfpEZ8Wl2kW4rGAjOKSYjbVMFenGBM4YyojeIbzNzLAgHo
	 bwiaV4EZ/TbzUyHp57BPm2kkQ+d9ETmhg0WZCpTAA7MVIOZr4xSlWqem5bTrJsg8AG
	 yXbZzk4pcViJw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1soLuv-000000002rO-1ufT;
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
Subject: [PATCH 2/4] phy: qcom: qmp-usb-legacy: fix NULL-deref on runtime suspend
Date: Wed, 11 Sep 2024 13:52:51 +0200
Message-ID: <20240911115253.10920-3-johan+linaro@kernel.org>
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
was later reproduced when the driver was copied to create the
qmp-usb-legacy driver.

Restore the driver data initialisation at probe to avoid a NULL-pointer
dereference on runtime suspend.

Apparently no one uses runtime PM, which currently needs to be enabled
manually through sysfs, with these drivers.

Fixes: e464a3180a43 ("phy: qcom-qmp-usb: split off the legacy USB+dp_com support")
Cc: stable@vger.kernel.org	# 6.6
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c
index 6d0ba39c1943..8bf951b0490c 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c
@@ -1248,6 +1248,7 @@ static int qmp_usb_legacy_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	qmp->dev = dev;
+	dev_set_drvdata(dev, qmp);
 
 	qmp->cfg = of_device_get_match_data(dev);
 	if (!qmp->cfg)
-- 
2.44.2


