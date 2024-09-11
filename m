Return-Path: <linux-arm-msm+bounces-31504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED53397511F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 13:53:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97FB51F2750F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 11:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E99DC18754E;
	Wed, 11 Sep 2024 11:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VQqh694f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9EC3185B7B;
	Wed, 11 Sep 2024 11:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726055610; cv=none; b=P+c7LBoUG4EsZZT477zbgiChntf2wM1pHegPVoNrCqV6EO38k+pnRUiY5oDqW67pZmoqd/FsE+dqeSblKLcf/h5dPismUbB6O1PmqZCDQiBeYtxkkbO64skM6q7FiSFKTXotKmYPQW58VVRooiARSBGa4B+yJCZQd+qFNPq69p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726055610; c=relaxed/simple;
	bh=zhjs0HCCkCG44moeklx+BEEW7yaiU/+Dj4UI+iaJ2eI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=elkiURA8xsaE/iOujsAbzJv/z/wzcV0JDvLIGmPIhuQBRmWRs1TGy9MBhiJ0TctBKXgTLdJNLG0wnyWNruvDrFAST6EGQpaeeqYgsC/ZfuH1KydyJ8OXFiOWVCIQ9HFOr1/LKB+ls1OjludhGr+tZ10bZJQuw+P2BtOpjC9QyLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VQqh694f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 661A4C4CEC5;
	Wed, 11 Sep 2024 11:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726055610;
	bh=zhjs0HCCkCG44moeklx+BEEW7yaiU/+Dj4UI+iaJ2eI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VQqh694fEMkFMNJ5j/gBTLOa6DLKSlMgjzgp09f/Z6k6vObr9ha03j7vAZvQppN26
	 54E3beImSDwAVbyKgYY5Moy1RiVl70z6B99BS8EYcyOrosoEJLFRwaNR87NCBvQ4eg
	 O9tJAD4ea+oJ7rzsWxJ8ElTZEtZyTtmNrruPih3OJXwEF0qlyoFKDfsiTM49QH9cFR
	 MjkFT7OL4dtbHwKIr2Oa0Vl61RxZo14+6x8M/Bkawye8l3NzufbzBAsf0ho1tMUm4q
	 khzx5+DlUxJZn/kiSgHrvt0zPKH6JCp3688qVUOY/EqhxZVmlWEMVNEHq83BANkpf+
	 Dy+45qFLRFxPA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1soLuv-000000002rM-1Vkj;
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
Subject: [PATCH 1/4] phy: qcom: qmp-usb: fix NULL-deref on runtime suspend
Date: Wed, 11 Sep 2024 13:52:50 +0200
Message-ID: <20240911115253.10920-2-johan+linaro@kernel.org>
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
removed most users of the platform device driver data, but mistakenly
also removed the initialisation despite the data still being used in the
runtime PM callbacks.

Restore the driver data initialisation at probe to avoid a NULL-pointer
dereference on runtime suspend.

Apparently no one uses runtime PM, which currently needs to be enabled
manually through sysfs, with this driver.

Fixes: 413db06c05e7 ("phy: qcom-qmp-usb: clean up probe initialisation")
Cc: stable@vger.kernel.org	# 6.2
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index 49f4a53f9b2c..76068393e4ba 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -2191,6 +2191,7 @@ static int qmp_usb_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	qmp->dev = dev;
+	dev_set_drvdata(dev, qmp);
 
 	qmp->cfg = of_device_get_match_data(dev);
 	if (!qmp->cfg)
-- 
2.44.2


