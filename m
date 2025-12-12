Return-Path: <linux-arm-msm+bounces-85104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CA128CB8350
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Dec 2025 09:09:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 18543304B217
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Dec 2025 08:09:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE8CD30F7EE;
	Fri, 12 Dec 2025 08:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="dD2XmTOl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8607288C30
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Dec 2025 08:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765526972; cv=none; b=DG3Suybqk87NxiUOkDhH8HvmEQLFWtuRKKlT4VRAcc0a9bmHbp9F/GvdlPid5xDfDn68+eGVSv2EfelTh0r3m4k9VjeJQ9RcdtVmfTfxeId3FutIEGRE8PYTsGEBy+JkBP3U8R97hbfnSAZGsBztfzu/EZOICKQeC3T+FaVto0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765526972; c=relaxed/simple;
	bh=IofNINamgUaxUD/ozHNMzT73NVVktMKx/C8cq9MkyxY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ua0eQ+DjDlOA7fSzWpla7o++5Em1AZtR50ZNRgR+V2I+WO9ZAHmFmFMbcRAEGcLlalta85vDTqmgO99yMiOcwF34vONL/TkJg85oRk3JJKCyOdsq5vR8tUOQptG8ro3yIsCti/p0FLI1jgCpGT/bXdMXubPOAYCLzJVQNcFBa5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=dD2XmTOl; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b72b495aa81so176679466b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Dec 2025 00:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765526969; x=1766131769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m+39K34vOi8xVQNaAaMN1cV4zjvBZg7Po2C7wx93ufM=;
        b=dD2XmTOlMothUQmH6NlmG5erdDdoYR34KL0j6gqbnhoQ6U2UJoD8Pzoukcx/MBJvVH
         zj0yNe5ZTRBXEGwyYFwpHHWW3buJ9GjicCOFkIHOGb+eHBb9JhMG++LtNrHKcbJscjiL
         kOEsM+9QqwzuAVmMEptyM3/L8LFnVY6IYdso9Z22azFOMnR5cD/n1RBCct4mgJStXfIU
         IkfTD/b93XWG5zhZJcBB1Khw+BxRTkN6KrPNm9MUnzyz+uF4mj+EOAT28f9qexkaLiH/
         qB5Lv9PvMWd9Yj0e92sRwIcRnkexdLKKj58f63os9QVZYn5mPj2ecjkqM1k3UUEkVG4N
         hW9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765526969; x=1766131769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m+39K34vOi8xVQNaAaMN1cV4zjvBZg7Po2C7wx93ufM=;
        b=fxml1GsF7oO7SrBfpfqxqszYGzAFPccXXv2epNghRzA4fP/RJGQXrql1g4BiVnlp7G
         E8BeCvE7PUoya5VMynjmyPkt3/fxBTyl4tAFkoRzbjxfxuTZFourETdf8TX292d+rEs2
         VNbsFxsv7FMtoGfpOrUWN6be9KKXBYCyCMcvAok82G5k5pYmAV//vjPeM76uN0gH5H6h
         /HjEsDCRRQ9U/kcpZOSxnjHNXsII3krTgPVkJqCE5+cOVl+4IFw92Axar6x3JhIa/lUP
         GJV3SP5jQunN/oK0axbP52aZQlOaSFwpc8fUygY4Dw6koRfDll2YFLK4HkjT1xgPc/W4
         MBYw==
X-Forwarded-Encrypted: i=1; AJvYcCWggW7Por9kkqmEDc0Uzsnb7tvZiJVUjLT5yvU4NQ9zY2N3+FTnmsIYeAkEn2mT2QBXag0INpQ+SeAHqHiL@vger.kernel.org
X-Gm-Message-State: AOJu0YwdEurAzC65LoNBatoFAG07xDHI4D6gJJU2lKiAM4tP+ihcbToX
	2sc6aOf5sU+Ju9vG2ilsfqwQF+slee9iEqsl1+WDc606LfvLAFzHwI07tSkS0g2eRzk=
X-Gm-Gg: AY/fxX5RnKOgapt70Kb52tvXGwgJUrHmjnbU75AEf6FDbkrTDEWYk52VDzxw9udUnpT
	+CzxKUZpUe4lVM+5XxDtrlzmYwqeQ+IvU/D9+jlmQTCHII2CjKIYVrQ4uDo2Kf1wQi3p0bjDJVP
	Xw1XjUpfFfGxyd80G/WnWL+QtjJLQ8i27uT9AIDQmcR7TNcfj1f2WCNnbekCdf5yqup4T4behsS
	7tDdeC5Dz/gle+utap+3Ax0qxITS9BC+hsOMzj8MoeTHH4yokI6+08ol9f3kfrSNANp8cdhjHdi
	FLUciCEGWbu1ENNtWLAwhfm0RNCyEFi6SWxkRq/D0GUEXXgx+8K7y5OtdofAbTpUHzYSXZf/ZTX
	vxRtomacO4TKIdBfRa/RywGeA342P5Kra6AwtdGpME7dHeCgdkwJHqohS56arloJ+aBy4OfKqAN
	RupfM0yPGWGrLAVRoj5Kdgaf+kEWe5yax4ey/G/m2vrdBpsuTzj88ISPMVXSgcNNV6SWZiLs2IR
	cc=
X-Google-Smtp-Source: AGHT+IGWoL0XbNTGLHz8ZMU3qIOVibIWmHjvpfqntUFsxPPnIC82hljoVzU0mysv424t1g+zGsP5hw==
X-Received: by 2002:a17:907:961e:b0:b74:984c:a3de with SMTP id a640c23a62f3a-b7d238f0517mr103594866b.28.1765526969146;
        Fri, 12 Dec 2025 00:09:29 -0800 (PST)
Received: from localhost (p200300f65f0066082ad4229ee042f7ed.dip0.t-ipconnect.de. [2003:f6:5f00:6608:2ad4:229e:e042:f7ed])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b7cfa5d0b20sm509586566b.64.2025.12.12.00.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 00:09:28 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Rob Herring <robh@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Yang Li <yang.li@amlogic.com>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-serial@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v1 1/4] serdev: Provide a bustype shutdown function
Date: Fri, 12 Dec 2025 09:09:06 +0100
Message-ID:  <ab518883e3ed0976a19cb5b5b5faf42bd3a655b7.1765526117.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1765526117.git.u.kleine-koenig@baylibre.com>
References: <cover.1765526117.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2676; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=IofNINamgUaxUD/ozHNMzT73NVVktMKx/C8cq9MkyxY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpO82lAtuYw6Euh1IHnIa6xp9GNMOn1AaC2Ib0i 9lpX36+U8SJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaTvNpQAKCRCPgPtYfRL+ TqNACACH1o7gDLn5mSsNnqmEeWdHjGGepoGjub0UwowXB0KqPgYNHHlXzwyIqTZHOOQBkbFjNpf vyrAK2pkvbg+a/xWPkX58TZB60Swhut8sU610vYfNubAGFvQ0/myc/EzLQLw/ITKJTyef19yVdu KIOGWMTtaBKXjx9a+dLYM3o77G7gNlAxbbinORTJcte8D73D/fAzsdTHEtgmUaNiwNM+2BZnUTh 0Lgz13OMX3yedVsT2kd9+jx+4VwZV8U2oy9wXgqB9D6UjFWqmYO5gLX2vElXV5WASbcDmyxbnYe EMFzOL/CgtH8WJICT0P4sNqRSy1NLW6ffoZyYeejkOpKXu23
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

To prepare serdev driver to migrate away from struct device_driver::shutdown
(and then eventually remove that callback) create a serdev driver shutdown
callback and migration code to keep the existing behaviour. Note this
introduces a warning for each driver at register time that isn't converted
yet to that callback.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/tty/serdev/core.c | 21 +++++++++++++++++++++
 include/linux/serdev.h    |  1 +
 2 files changed, 22 insertions(+)

diff --git a/drivers/tty/serdev/core.c b/drivers/tty/serdev/core.c
index b33e708cb245..40eedc15277c 100644
--- a/drivers/tty/serdev/core.c
+++ b/drivers/tty/serdev/core.c
@@ -414,11 +414,21 @@ static void serdev_drv_remove(struct device *dev)
 		sdrv->remove(to_serdev_device(dev));
 }
 
+static void serdev_drv_shutdown(struct device *dev)
+{
+	const struct serdev_device_driver *sdrv =
+		to_serdev_device_driver(dev->driver);
+
+	if (dev->driver && sdrv->shutdown)
+		sdrv->shutdown(to_serdev_device(dev));
+}
+
 static const struct bus_type serdev_bus_type = {
 	.name		= "serial",
 	.match		= serdev_device_match,
 	.probe		= serdev_drv_probe,
 	.remove		= serdev_drv_remove,
+	.shutdown	= serdev_drv_shutdown,
 };
 
 /**
@@ -814,6 +824,14 @@ void serdev_controller_remove(struct serdev_controller *ctrl)
 }
 EXPORT_SYMBOL_GPL(serdev_controller_remove);
 
+static void serdev_legacy_shutdown(struct serdev_device *serdev)
+{
+	struct device *dev = &serdev->dev;
+	struct device_driver *driver = dev->driver;
+
+	driver->shutdown(dev);
+}
+
 /**
  * __serdev_device_driver_register() - Register client driver with serdev core
  * @sdrv:	client driver to be associated with client-device.
@@ -830,6 +848,9 @@ int __serdev_device_driver_register(struct serdev_device_driver *sdrv, struct mo
 	/* force drivers to async probe so I/O is possible in probe */
         sdrv->driver.probe_type = PROBE_PREFER_ASYNCHRONOUS;
 
+	if (!sdrv->shutdown && sdrv->driver.shutdown)
+		sdrv->shutdown = serdev_legacy_shutdown;
+
 	return driver_register(&sdrv->driver);
 }
 EXPORT_SYMBOL_GPL(__serdev_device_driver_register);
diff --git a/include/linux/serdev.h b/include/linux/serdev.h
index 34562eb99931..5654c58eb73c 100644
--- a/include/linux/serdev.h
+++ b/include/linux/serdev.h
@@ -65,6 +65,7 @@ struct serdev_device_driver {
 	struct device_driver driver;
 	int	(*probe)(struct serdev_device *);
 	void	(*remove)(struct serdev_device *);
+	void	(*shutdown)(struct serdev_device *);
 };
 
 static inline struct serdev_device_driver *to_serdev_device_driver(struct device_driver *d)
-- 
2.47.3


