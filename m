Return-Path: <linux-arm-msm+bounces-85744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B23ACCD90F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 21:47:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 85C7E30A701A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 20:44:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4227C30B501;
	Thu, 18 Dec 2025 20:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="fN+tZitd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F062F8BC3
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 20:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766090576; cv=none; b=XHN1aE8oNtrFJ2xSnISNhcDFmdAATA6NFAxg5W5eiTnoJarogf5wUHu3heeU6hGKOtosIjhgNoNwIq1eVk/8gioEpyP5pxeZJCrkqntXNAP6Xb3I5FX4D+6QCSVqWXdwIAELwoiJZz38Sf19AV2ZtWnSQ3M+wOHebF3ui52AJ44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766090576; c=relaxed/simple;
	bh=4ICv3yuhPrWHwgL1jUFMIG72Z1BgncvRKKGH0bYdP14=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rZYchZ/vdjLZ/uZzQ6ueZOssZy0Cy8zDADMQn18d7ilf+wOTLE2Hle+EJxEyfaJljLSruvDW69G3y3KVM9EHVJAZ15qTlctBr+Vtkc9JeNv6bMCXEgqTpO+/0DbfwWxKNCzb+rP+9XowcqccrCA/sM+6PcQSfRjPNbSrtPHfb+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=fN+tZitd; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6492e25cd7eso1623487a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 12:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1766090572; x=1766695372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A4g1ryvYz2NMxLIjSNGcYTJ//wVogM+BYR83E55tzQE=;
        b=fN+tZitdlGldRZFwsBPMgJ5unn8oxKOKyn8A4UyklUxpuQom7fy7L6kIzCk5T2jVcM
         KVgO4mzCbFmL2NEiKmIjgirBAguOrS2j9vNNntb65ezHsUVww8+CTulzcc+IC1dYTTrQ
         RyGHOPA6JpLGLb/wmL1KEJ28B/avjdsIGEApmD0J/CwGj9prUS4CDcZcXuHQzXJpdqe+
         8pAuvVEkSsKaWFFVmSYN6eUypEtg+nWjLViXldm4LBL9mw03AnNo9mwutgRGHggC1zgj
         WjNFw5NGIsZRbbyYW5lGHuRKNWTRvkiq2LE0hae9+h+i2d2WKVc0CpM/yN4+Z0ZCZmSl
         MfHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766090572; x=1766695372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A4g1ryvYz2NMxLIjSNGcYTJ//wVogM+BYR83E55tzQE=;
        b=vrHRyjtW3f7841AEj1vUplduTYhO0Z56WMIZ7+jgxCc3Vq8n2dhCzQF2Hb2O1e2iEa
         o5Tg11TOmnd2ctNcgvYfBIglXkb/ZoGcHRqNw2g4kjtUgnW+wxq0QX6HlQ2fd0LcTfNf
         KqAV3TZWT9T9j19qsDT7i9Gxj1ag153KVEkiNEouXSRuQjVQa0QqimxCPCx+Klo/jJ8p
         AwPUxZPpGtXdwdQPrld0qEY/WtMDMY9n9PRgiLkREkWXp1RNfrKSlBUJYKJxCru/ltjx
         /2MLrkL6Y9yF/8jWQ5JoDgLuL4rrGh3JO11KT1c6yLMAT67v3UHwjqxho0GI6rdXGIqU
         WPSA==
X-Forwarded-Encrypted: i=1; AJvYcCVB8AcXgGd8hdcYrkPFArgv1uZGTWUzpCP8VpOFiUSozlTQEXMAVct4ydJFPiPDv1e57H/tKyosYXbGrP3p@vger.kernel.org
X-Gm-Message-State: AOJu0YxUE6gScOHCIB1D82qdifKRt6mUU1hbF9QyoXhdJmYjAmvu8gtz
	77iXpwb2OsEUIZQqp+1FbxPl6KZD4aAM20FsGNXLzDyv0RpjnK0FJEMBB1ojImMT/qo=
X-Gm-Gg: AY/fxX7piM655V6nXRD6oXXdePbWLXh9fBxDBeibyQnbs5kz3Dj6K+/OXIVrWj4rJ3z
	QYyj1w/RGzeSoxViP0+phU+W+yOWz7z383h1r0c8yad1C4oItlr41FPhY/ApTAYT0b7DAC1iuHC
	GUcIHSKIDIwdy3boU4RaTrY+ewNfamZ5O5gijgLczTBjJW6+uGLH5dy/hR+CxdFNav6a+WUKNT0
	svljEWPcYaO0AlUTOrteAULROjYfNMFJIN+hyKGy+Y+azpVSrobOqstYKTPMLG270eSEtSwcv1k
	E1HYKCz/YpUwA2wGzp/phkkDW81Go54mIEXE5U+4lIdesb9TlShbnw3cex3u6ymLp1kmOCU+PbA
	qMQw8CqU8edeo9U2GHooVCPEGJH7M2SjwFltWE5LeG5eA8r0u9gfs72tmVxDZHfQDpgJm6dNyFP
	xxupgxL6fcTz9rqla3
X-Google-Smtp-Source: AGHT+IGNnpdBTKQikQZocIsWq3iB22zoBWwmboLhMYxqkAhxGrqfRLDHCiiACwlMqdCYJH9TsGGe6Q==
X-Received: by 2002:a05:6402:35cc:b0:64b:58df:cf24 with SMTP id 4fb4d7f45d1cf-64b8d24f389mr839814a12.11.1766090572290;
        Thu, 18 Dec 2025 12:42:52 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-64b916b82e7sm365476a12.35.2025.12.18.12.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 12:42:51 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v1 2/2] bus: mhi: ep: Use bus callbacks for .probe() and .remove()
Date: Thu, 18 Dec 2025 21:42:16 +0100
Message-ID:  <2a79d99182a5171e83a07bf9f438ae31362f7e5d.1766090211.git.ukleinek@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2477; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=4ICv3yuhPrWHwgL1jUFMIG72Z1BgncvRKKGH0bYdP14=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpRGc4B+Cx+6lrqUdq7rJgJqKco6uBImN1TK7ym 0GbyAT+zdOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaURnOAAKCRCPgPtYfRL+ Ts7LCACyd1U3000e73Nv1IXXeQ6//AjKstvpejHgoauxmaGI6W3tf9Nawu36xzhcpeALS0Jdcl5 LGQ7dWXDHbikv28ppVKFJvzaB4zcH8GZ3l8YThYF3Mkw2W+z6i+tVadpLDrLClB788IQM5/rGB5 bNvfpUC302SwXHm+e34veYWO5RvmET9LhT4cEhRNsDzB+RUcbUQnn3/rOyHfNBgZvrPCOuIE8wh cy1lFiVuc8XLxrcYsMYdUpLABQfE3bwKiiBBiMCo5jvivw1JrHuLT/P34IiBYJsE8PJBVtFk2zC aC29/LgwIBOaqHNaTyd/jyDnFNvdWSgwzTfE7JDfD4ZzLyDg
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

These are nearly identical to the driver callbacks, the only relevant
difference is that the bus remove method returns void (instead of an int
where the value is ignored).

The objective is to get rid of users of struct device_driver callbacks
.probe(), and .remove() to eventually remove these.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/bus/mhi/ep/main.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index 3c208b5c8446..35922e7a24c1 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -1596,7 +1596,7 @@ void mhi_ep_unregister_controller(struct mhi_ep_cntrl *mhi_cntrl)
 }
 EXPORT_SYMBOL_GPL(mhi_ep_unregister_controller);
 
-static int mhi_ep_driver_probe(struct device *dev)
+static int mhi_ep_probe(struct device *dev)
 {
 	struct mhi_ep_device *mhi_dev = to_mhi_ep_device(dev);
 	struct mhi_ep_driver *mhi_drv = to_mhi_ep_driver(dev->driver);
@@ -1609,7 +1609,7 @@ static int mhi_ep_driver_probe(struct device *dev)
 	return mhi_drv->probe(mhi_dev, mhi_dev->id);
 }
 
-static int mhi_ep_driver_remove(struct device *dev)
+static void mhi_ep_remove(struct device *dev)
 {
 	struct mhi_ep_device *mhi_dev = to_mhi_ep_device(dev);
 	struct mhi_ep_driver *mhi_drv = to_mhi_ep_driver(dev->driver);
@@ -1619,7 +1619,7 @@ static int mhi_ep_driver_remove(struct device *dev)
 
 	/* Skip if it is a controller device */
 	if (mhi_dev->dev_type == MHI_DEVICE_CONTROLLER)
-		return 0;
+		return;
 
 	/* Disconnect the channels associated with the driver */
 	for (dir = 0; dir < 2; dir++) {
@@ -1643,8 +1643,6 @@ static int mhi_ep_driver_remove(struct device *dev)
 
 	/* Remove the client driver now */
 	mhi_drv->remove(mhi_dev);
-
-	return 0;
 }
 
 int __mhi_ep_driver_register(struct mhi_ep_driver *mhi_drv, struct module *owner)
@@ -1660,8 +1658,6 @@ int __mhi_ep_driver_register(struct mhi_ep_driver *mhi_drv, struct module *owner
 
 	driver->bus = &mhi_ep_bus_type;
 	driver->owner = owner;
-	driver->probe = mhi_ep_driver_probe;
-	driver->remove = mhi_ep_driver_remove;
 
 	return driver_register(driver);
 }
@@ -1708,6 +1704,8 @@ const struct bus_type mhi_ep_bus_type = {
 	.dev_name = "mhi_ep",
 	.match = mhi_ep_match,
 	.uevent = mhi_ep_uevent,
+	.probe = mhi_ep_probe,
+	.remove = mhi_ep_remove,
 };
 
 static int __init mhi_ep_init(void)
-- 
2.47.3


