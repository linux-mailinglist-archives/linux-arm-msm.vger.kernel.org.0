Return-Path: <linux-arm-msm+bounces-85841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A865CCF8A1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 12:11:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F107301634E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 11:09:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD6372C21F9;
	Fri, 19 Dec 2025 11:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mid0uPYx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6DA274670;
	Fri, 19 Dec 2025 11:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766142595; cv=none; b=V1jg3Jv2YBMgfClDSN+Q0156YAWmi/SXKRvQjRddVje/Jdr4WxvrGJOmtwGr8/7IaywWLY2iokw2ZNebBsS/YbsJ3U4OYF+VSXIT7WkP9dmK9BMLFhy6v7C41imJAtZUBBL+ePETeUu7RkxHrizjma2T/anpVSuX/3TWc02kEbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766142595; c=relaxed/simple;
	bh=c97n+8D1oS9kVQmjZQi3JmiiQ9fwAc7/pn1+bJHEv/I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=odTZjz7DihK1+3YX/P45EWk3VZL20GIn2trgNhKyDBC1N5X8i50Pf7VmcV68I8H+EK3vlAkXT2GmPmFLnDHzf5QyMPiTiBk8ZL7vPrmcmKagNIs0Q7GGp61qtsn6SbOqv+6mS80PQKQoAKxyzVDL0QQXTJcm+E+8Kzjeoed27I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mid0uPYx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13D11C4CEF1;
	Fri, 19 Dec 2025 11:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766142595;
	bh=c97n+8D1oS9kVQmjZQi3JmiiQ9fwAc7/pn1+bJHEv/I=;
	h=From:To:Cc:Subject:Date:From;
	b=mid0uPYxd1+uYEBWeogqU7MgZAzhvsiRW+4BVa1ba6QTaPWRuMaPLnkhwYj6SCZlC
	 xq6jEpUzXN9OzBH4MCxn0itPBZbdDFP/OHq8tjQp5ED9Oj70/6EtEsJ6GtMbJUORiE
	 5KqkhXiJMiXpbqCt6DZscuWloijYgj1HzPB8DvqbD9yWhZR2BgkDRXAV8NEdHD4UR5
	 l/msxmw5top+HHoFVWIoxEPZh/0xyYF88Xa8bdLdLjJMJ/+EegdNmQAN5/wP9qCIFB
	 doX9hyqCTtL0YAhWufCUJdnvkjTjHK2DtsSx16LYy8J6vBwTRi303aMUSw3rf7vXjQ
	 MMjJI5gEbONoQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vWYMr-000000006H0-2CkK;
	Fri, 19 Dec 2025 12:09:53 +0100
From: Johan Hovold <johan@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH] mfd: qcom-pm8xxx: fix OF populate on driver rebind
Date: Fri, 19 Dec 2025 12:09:47 +0100
Message-ID: <20251219110947.24101-1-johan@kernel.org>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit c6e126de43e7 ("of: Keep track of populated platform
devices") child devices will not be created by of_platform_populate()
if the devices had previously been deregistered individually so that the
OF_POPULATED flag is still set in the corresponding OF nodes.

Switch to using of_platform_depopulate() instead of open coding so that
the child devices are created if the driver is rebound.

Fixes: c6e126de43e7 ("of: Keep track of populated platform devices")
Cc: stable@vger.kernel.org	# 3.16
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/mfd/qcom-pm8xxx.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/mfd/qcom-pm8xxx.c b/drivers/mfd/qcom-pm8xxx.c
index 1149f7102a36..0cf374c015ce 100644
--- a/drivers/mfd/qcom-pm8xxx.c
+++ b/drivers/mfd/qcom-pm8xxx.c
@@ -577,17 +577,11 @@ static int pm8xxx_probe(struct platform_device *pdev)
 	return rc;
 }
 
-static int pm8xxx_remove_child(struct device *dev, void *unused)
-{
-	platform_device_unregister(to_platform_device(dev));
-	return 0;
-}
-
 static void pm8xxx_remove(struct platform_device *pdev)
 {
 	struct pm_irq_chip *chip = platform_get_drvdata(pdev);
 
-	device_for_each_child(&pdev->dev, NULL, pm8xxx_remove_child);
+	of_platform_depopulate(&pdev->dev);
 	irq_domain_remove(chip->irqdomain);
 }
 
-- 
2.51.2


