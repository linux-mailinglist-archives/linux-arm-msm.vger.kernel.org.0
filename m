Return-Path: <linux-arm-msm+bounces-9345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DED845C4A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Feb 2024 16:57:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F8B11F2C8AF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Feb 2024 15:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 511D9160874;
	Thu,  1 Feb 2024 15:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="G9dsRo5m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6D715B970
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Feb 2024 15:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706802952; cv=none; b=Ozfsknlp3toGzE/sKTIpGsJ9csTRpc3bA0a/90xWhGrxc7jJiwHoDBG6rFDTVRCrg0Zipbnx5NxX67S2bzLmgR72GG6fXCcXt1h3lJCMe27R8V5F/Yh+JBPpG06uOJAPKkMgrFjjXHJJAXFv70JbmtzYJCkX8eO04azHm2G9KDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706802952; c=relaxed/simple;
	bh=2TB7G9586wBiGx6TP08ByJQQGcZ49ktk6A5S0Zz7eEA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TfI9BFNY6P4PErnPf+uixtzBFl9uaunyvE2XuRjAhvgIcBPEJfJ6oqRDKYxIJusYsXkE7wvanSdG33qCj1cTJV/Qm+9PTyoZ8UCElPxAqz/poUKQLAPeT4QP8NbL8mD9NMkK4jHnRqoxU8HCaiMVPIRGbjH5nbUgzWlqsuyr6Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=G9dsRo5m; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-33b1bb47c4fso123027f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Feb 2024 07:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1706802947; x=1707407747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rGIV5k0CAIkt4/Drq57Mr31uOV54nJUOwQSsCzcpX2k=;
        b=G9dsRo5mBndH0MSMW/uIl8ZTCJMpbP3e+U977Pmx50Reev4/hGbbKFGBEa9gOtTHJC
         ID5z1P9L5CvkQymS8iaQ+y/mzAlLqWcHlxeBqb4swkzauyAomfVjEnsGBnGPcvfx/wRz
         T4xlsYTOygksWhfjaDrC3geL8Opf4yoKTMAVbtW0vwOAQ/LrnYVrAaIoiVH+40XjsVxa
         6q3QPbK6LeclniG5WGwJriXZ7NIvToK/Jf1H5CZK3ZVJTqP/kqSETyyBJXa2PVpJkwtX
         XyaSOtzAXpSU0/UxVScVGyMhvyTr60EfXB15zko2cgLL0U6Vyv//EOZTvQbaEWkmTRAB
         zFpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706802947; x=1707407747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rGIV5k0CAIkt4/Drq57Mr31uOV54nJUOwQSsCzcpX2k=;
        b=dYHI7lymS7LJbcKWr6AepCw8JKN3e+/7Xs8jt286G2w4rdK3iTLltt38Dx38KzwIjm
         rCC2K+4pD9/Yf3kp6eBRBMwA16I1SQjOn3ugDZISk9dxCzRi1HbDmZb22Kk7474qKFow
         3Dv3aoVLrV1fzWraq6aL/uHnpZp5E7vnYWB7b5DEFlaqTap/ODWR9yQErLwQZeQksLbv
         ssixkzx9MN439Auj8WZP6Eir17DKVsfbD8GBSRToaBJhLrFAkKbLO5vjRrmrhEPRloDR
         fpvWffWx6rhYxxViPNkq7KOxuGYaHRTT+/yAzZJB4paw7MXP7QdHq4ShiAJys9B+UnRU
         U9BQ==
X-Gm-Message-State: AOJu0Yz7wuv+Oz19i4zD2/aRZ7f7IGZFeNYwiKeUEgBWf3R+yJwWHHPJ
	rDh/acK1T5oiUgGAM7AnZqbLXixZhd+XDFX+vqRiBnFvEziZC60Gz6EnkLjIRJ4=
X-Google-Smtp-Source: AGHT+IHrIgtPBGOwwkToCnKJnB1aV9LD4TnNqN3x0TxT01CT3Pl7rZrWkB/WvconB244cLvA5Ru8sw==
X-Received: by 2002:a5d:5051:0:b0:33a:e8b7:14e6 with SMTP id h17-20020a5d5051000000b0033ae8b714e6mr3518028wrt.55.1706802947384;
        Thu, 01 Feb 2024 07:55:47 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXUMnyLPTzxs2SEFue0K3khL4YRX36+K6a24zNZtfHXX30QIy5AwLzkcOFoQSx9bYdOnjgFk7fGi0X9bf1oNY2Rzsr48eGGsQM0HqMrTVjODTok8uzFCEUfZMJ/z0yH2DMWVPkCgiO68mL/fAJoYRlh4Bht0FXuPud6GmRWwoHr5b0I5y7PiyFAHcZbs7jjbceC/CpoxGEKvsgtzrD7cBZyPq18HXGgzDlBxCaos0IFTiXOezjtX7SoBaSj7pgGXyNXnX/p9Wpc4F/rDMrXogWXuMF4jYSV9N3WATTc9bh9Ks9ibvnx+bPrvGdjN2q6VpaysNTaWNew82h33i/0/7b3DY3XG1/VBurZpJLKtQcBCiDZjKJGcUcOPEpcQ1UVzRy+qayZSl1ia/C2V8RhZ8LlWcHt49Zms7PtlFW1RbPzdG6u92Nyk8/WnpHoLTyTbZptchTnRl3JYj3PsW2XAXxiwB703s3Mvf8nGow5+gFM3Xhv3paQaGkxlIz3PZiwmP+Q2rRBdxhqLKPOcWNXxxB42qj5QBv5APxVn+nzH/EDWPc9WRVh/KcN0tf4zmDdNiOUnpSZBvkNAxjXh7EaukBQOjDrQyhBz2FmKdlD3UppVYUnQJdIR82XBPMlDYo6YG17TNElV7HBrLnk7AHx9sUICFEbIsJoNdLpDlrkadi6IWQJy3ycgqIukkp/LzSJyUvja3GPJN3+
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:dd01:5dec:43e3:b607])
        by smtp.gmail.com with ESMTPSA id ce2-20020a5d5e02000000b0033af4848124sm9650318wrb.109.2024.02.01.07.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 07:55:47 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Alex Elder <elder@linaro.org>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Abel Vesa <abel.vesa@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lukas Wunner <lukas@wunner.de>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	linux-pci@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [RFC 6/9] PCI: create platform devices for child OF nodes of the port node
Date: Thu,  1 Feb 2024 16:55:29 +0100
Message-Id: <20240201155532.49707-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240201155532.49707-1-brgl@bgdev.pl>
References: <20240201155532.49707-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

In order to introduce PCI power-sequencing, we need to create platform
devices for child nodes of the port node. They will get matched against
the pwrseq drivers (if one exists) and then the actual PCI device will
reuse the node once it's detected on the bus.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pci/bus.c    | 9 ++++++++-
 drivers/pci/remove.c | 2 ++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/bus.c b/drivers/pci/bus.c
index 826b5016a101..17ab41094c4e 100644
--- a/drivers/pci/bus.c
+++ b/drivers/pci/bus.c
@@ -12,6 +12,7 @@
 #include <linux/errno.h>
 #include <linux/ioport.h>
 #include <linux/of.h>
+#include <linux/of_platform.h>
 #include <linux/proc_fs.h>
 #include <linux/slab.h>
 
@@ -342,8 +343,14 @@ void pci_bus_add_device(struct pci_dev *dev)
 	 */
 	pcibios_bus_add_device(dev);
 	pci_fixup_device(pci_fixup_final, dev);
-	if (pci_is_bridge(dev))
+	if (pci_is_bridge(dev)) {
 		of_pci_make_dev_node(dev);
+		retval = of_platform_populate(dev->dev.of_node, NULL, NULL,
+					      &dev->dev);
+		if (retval)
+			pci_err(dev, "failed to populate child OF nodes (%d)\n",
+				retval);
+	}
 	pci_create_sysfs_dev_files(dev);
 	pci_proc_attach_device(dev);
 	pci_bridge_d3_update(dev);
diff --git a/drivers/pci/remove.c b/drivers/pci/remove.c
index d749ea8250d6..fc9db2805888 100644
--- a/drivers/pci/remove.c
+++ b/drivers/pci/remove.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <linux/pci.h>
 #include <linux/module.h>
+#include <linux/of_platform.h>
 #include "pci.h"
 
 static void pci_free_resources(struct pci_dev *dev)
@@ -22,6 +23,7 @@ static void pci_stop_dev(struct pci_dev *dev)
 		device_release_driver(&dev->dev);
 		pci_proc_detach_device(dev);
 		pci_remove_sysfs_dev_files(dev);
+		of_platform_depopulate(&dev->dev);
 		of_pci_remove_node(dev);
 
 		pci_dev_assign_added(dev, false);
-- 
2.40.1


