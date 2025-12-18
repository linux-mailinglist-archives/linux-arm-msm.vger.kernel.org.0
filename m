Return-Path: <linux-arm-msm+bounces-85743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CE2CCD90C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 21:47:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F2C6330A5138
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 20:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AA76302756;
	Thu, 18 Dec 2025 20:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="lINwy5ph"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345502E718F
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 20:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766090576; cv=none; b=ClgBkupLeKFQC7L7jQCBAvcOlwpkDjm3huxLKtwk1dmloT5x64oX7wrFwn/sk/m6sc7PeityqVO82skLtB+Du6ZDQuJ+cAZO3o6OBI/lJ7RDahaY974sxqpwcOY8M0CsRnqnZSb7pa+9AVlq0GVEhVevuURNVkM12cnzx9ylgLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766090576; c=relaxed/simple;
	bh=TfNoqkkmLOkqz2jYFrsq7Qx2WYAXW9MRzz4s7xDFcFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Oj7bu96sGhT5EUmw5fAiE4AQ4NO7fehOzC7PRtSEFMSE5cdgc5zlmqG4s35QGVU6plwY58EELu2Q7n6WFepusIhUqUi3Z0Nf96agle7TC2TTcY7bmaBLwXKyvJCLQfoknqyajrJDxeNQWF5ATticytknnmwLtw00JehdE3sbGZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=lINwy5ph; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6418738efa0so2047950a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 12:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1766090570; x=1766695370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AWySTvtz3dhKwkxiZm5piaCDgiFtDwfMFqwVYzPw2jw=;
        b=lINwy5phBr/qrlAQbW7bsT3jzlUoVaL+P7YZXXPLNrKmMgNlMydCeMGFxQ4LpBO2Y9
         S/IYuOtar+XK1NAfD7wrFEa5XFkX25B2GXCkOW7eChWdLeAh+Ua51FiHLXjwSyNf5NKS
         +cfUoxkwUm7ddSAdrKIni1o8C28++xH7ZnP/IHBaDukEBbrgvTK00PRnMg8M3up2M2Nx
         fHHEfXhig6RaXTYAF49eL3slZnKFF2fztOhOUEMYm92EGHsfnxaszzA7/+d3/9h5KUvm
         Puq2VvZ/PMFSqebwBVbTB0RZxSXMChNofnHHSnxwOG9qHQ4WyqIbgHXi829KuTIj2vZ3
         FR1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766090570; x=1766695370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AWySTvtz3dhKwkxiZm5piaCDgiFtDwfMFqwVYzPw2jw=;
        b=P/y1Wj7TA1o5YQTEaK4W0qypFYP9CDV2FBk5zz2ANAogjnMHfKBeCmqz4ksQROoi8X
         s3l6VX87v9DwXgZQ6H42l/ZpNIgt1Xuk2ZmTTMsqe+WSQn45RC96yJ4mCUtyd76mOAKa
         oZslkXOyQK4K3Z6B90+DuAsdJYTifGUU7e8Tva1bUNpnZhiuy0D8kCzKlGBzaQ1hrYZ8
         WfgiObyi6b8zuvPIjzyxQeXOsfzrqBs2rMdU/75ihOkUGC9wXgyV4Hsih4T3SUl11+X6
         yGEKLI+lJLnsvy6LTQuySwB6avjncC7ttBASkwCkSv/ka48Zcu4fs5Xqxrqc5lOTvzCa
         BDQg==
X-Forwarded-Encrypted: i=1; AJvYcCXCgRGQfWTiKcQKW5kiGv8o0rzpYh0YL7TWXRbO/oc1pMxp7+oPHdXqabZsgpKzSy2+wSAhzgFRS2GTljI4@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwjuh9/wBYnEy3NDrX0hzE0qMQnAj1u1Yv3pa2cnXuEMne7BKv
	PNBnOL2mNyTKqc6L/TUqWHrQz0MU+k5fH8En7uINMKfNti+jNrtIx0prjMm0NX+mCDI=
X-Gm-Gg: AY/fxX56l4T5VeBpeuYxfZubqCk0I6Rym3HSpuKGWX/tYti5RlNI0hTatx5iT8JQD+U
	GPRpd+6fNAxMuhFa5QxLWCIWzn3Rx7pGHq2/ru6MtwDsg+Z/EcfDvOJOp7CUi7C4ka5SoQQZDtj
	Luo/MNv0VrNwi+1f7B4whvQi6qS59zlNA9awkN+YlFY49k9kQuEJHuRkPoJmnMSMQs5IOkFcpgU
	SMcxqp2UL9KxrwKuEIdvG93y9W8Qz4yZ3qZpuIK9JU7xSLeLtRoTY4vtHKHO59GTOkVB1rrs3sq
	3MzKVp++rpjc8carr9QfWBGZW6lRYpg9DOdlKWTuk3bIsBPD0VA8wFhayniXsCtzDH4HYO8wprB
	4WGqJyR1Mvk2EZogpEKULgPvQjByVGnaHcDcgFlUSmvMTCJ/cgcG8tbNfsyjoOlzaqg+E0eEe9T
	zn3NYkfTX4B808d0wQ
X-Google-Smtp-Source: AGHT+IHMfiMGCf0YoD8f4MOehHnb4tGUdxYLtrvwwgomiu/kgdhz4PIvouWs6MJ5HiEloPqOCQTXFw==
X-Received: by 2002:a17:907:c14:b0:b80:1309:aa09 with SMTP id a640c23a62f3a-b803718387cmr65389066b.47.1766090570493;
        Thu, 18 Dec 2025 12:42:50 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b8037a604f5sm38457966b.11.2025.12.18.12.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 12:42:50 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v1 1/2] bus: mhi: host: Use bus callbacks for .probe() and .remove()
Date: Thu, 18 Dec 2025 21:42:15 +0100
Message-ID:  <e8032b3c2a8953a4a2b84dfa79a260c35f1d71b7.1766090211.git.ukleinek@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1766090211.git.ukleinek@kernel.org>
References: <cover.1766090211.git.ukleinek@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2296; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=TfNoqkkmLOkqz2jYFrsq7Qx2WYAXW9MRzz4s7xDFcFk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpRGc1lKdzluQ+MGcjj+bu8gTVnx8irr/WtRqhc aBbAW7AN/yJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaURnNQAKCRCPgPtYfRL+ TjiVB/4zh5xiU7gbg5Q1jjcD5KNz0Pvwp6ar/mUOA5vbrO2iu2YFA844yhGAa/TqKrIPFsVZK0m H+FvTnFd5reEyJKlqiuGDHqovd0gwYIB7rhJYtGAmGbhPw0ajU3KyUttABkgfgZIA49CmRXaAD3 p7A7Y3PZl0TUTVOJLA+qFIYe8eY7LDx04iNgGFm4iP8ioBrYM9vAReDb3JBVempe5M79O9+cTLJ CvQEft7MoTNRteXpvhFhUsxqYwZ2IeEggnOzc/XuKqhXkwUvu0bRy+mQ+oqdOYDVvSfTQ2DIYh4 tmeC2GXzKM9oWGxZGZtRl/tLFnPh+aJM5CCcZtDFZQ6DMdcN
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

These are nearly identical to the driver callbacks, the only relevant
difference is that the bus remove method returns void (instead of an int
where the value is ignored).

The objective is to get rid of users of struct device_driver callbacks
.probe(), and .remove() to eventually remove these.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/bus/mhi/host/init.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index 099be8dd1900..8a0fe09d974a 100644
--- a/drivers/bus/mhi/host/init.c
+++ b/drivers/bus/mhi/host/init.c
@@ -1265,7 +1265,7 @@ struct mhi_device *mhi_alloc_device(struct mhi_controller *mhi_cntrl)
 	return mhi_dev;
 }
 
-static int mhi_driver_probe(struct device *dev)
+static int mhi_probe(struct device *dev)
 {
 	struct mhi_device *mhi_dev = to_mhi_device(dev);
 	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
@@ -1341,7 +1341,7 @@ static int mhi_driver_probe(struct device *dev)
 	return ret;
 }
 
-static int mhi_driver_remove(struct device *dev)
+static void mhi_remove(struct device *dev)
 {
 	struct mhi_device *mhi_dev = to_mhi_device(dev);
 	struct mhi_driver *mhi_drv = to_mhi_driver(dev->driver);
@@ -1355,7 +1355,7 @@ static int mhi_driver_remove(struct device *dev)
 
 	/* Skip if it is a controller device */
 	if (mhi_dev->dev_type == MHI_DEVICE_CONTROLLER)
-		return 0;
+		return;
 
 	/* Reset both channels */
 	for (dir = 0; dir < 2; dir++) {
@@ -1407,8 +1407,6 @@ static int mhi_driver_remove(struct device *dev)
 
 	while (mhi_dev->dev_wake)
 		mhi_device_put(mhi_dev);
-
-	return 0;
 }
 
 int __mhi_driver_register(struct mhi_driver *mhi_drv, struct module *owner)
@@ -1420,8 +1418,6 @@ int __mhi_driver_register(struct mhi_driver *mhi_drv, struct module *owner)
 
 	driver->bus = &mhi_bus_type;
 	driver->owner = owner;
-	driver->probe = mhi_driver_probe;
-	driver->remove = mhi_driver_remove;
 
 	return driver_register(driver);
 }
@@ -1468,6 +1464,8 @@ const struct bus_type mhi_bus_type = {
 	.dev_name = "mhi",
 	.match = mhi_match,
 	.uevent = mhi_uevent,
+	.probe = mhi_probe,
+	.remove = mhi_remove,
 	.dev_groups = mhi_dev_groups,
 };
 
-- 
2.47.3


