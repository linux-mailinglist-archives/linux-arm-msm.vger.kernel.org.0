Return-Path: <linux-arm-msm+bounces-7475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B679F830A86
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jan 2024 17:10:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4EA4D289995
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jan 2024 16:10:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42BF7241EC;
	Wed, 17 Jan 2024 16:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="u/ToQgI0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CEF22F1D
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jan 2024 16:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705507717; cv=none; b=UsjPWcImC5u/913S19pEVryANUuE4zHZfzArf4cuv0I5NkXl3WEBq00YN3ieWQBdXbTE77NiHSU7Cm8g18x0m6sCnSQ0EBOuVDQSG0R160dr/GoLDTgWioO5IgfoVEA6Z5JfMjdIvMsWasdTlzFdwS9xTj6FfMyQHZy+tjfMLxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705507717; c=relaxed/simple;
	bh=lTpSs6LvEorlDFYJlBesu7302lT6V9qqbgDL6TCPnF0=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:From:
	 To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding; b=TI9qFjbIVbHb2MrXLdBpzdAxQUmgjP9OgzXoILsmKJb0N55ydLDOHHzcREt5rlZtoz/kaiA47XKRZ5VY3aAu6O8GNWtKawRMZTVsANUQGISkgoeYacPt+HRZZEZDnTDHI9w4ZMnF1nUX7TRHfIklkcgZS20ZMAh1SCgTaVOtagQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=u/ToQgI0; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40e8c5dab9aso5746645e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jan 2024 08:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1705507713; x=1706112513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SBCi6IfvSuWJWsQQRO0GbKoKMq+lADolGg2VRt1L2AY=;
        b=u/ToQgI0j9CVtBRPzW4lR2cmoBy0I4vd2WA76Q2OpF0WXIXY+tuO8Oeo07oTBRiUyS
         gfydF1v4rNlzqkvxcB7+b65zeVr/wx8ZYqbxz5aEKU9fvJ2mUFarQoT6qQy/XnO/bY+W
         ExxSxMowczg/fYj3Wjd0OxtKInQiRtJ4FhGf5kw3qUrZkpgXZgg4+CrWQUlYqQ/JW3PI
         cumz0g1IR/XVz1Yd5CHfVnKfU2ABOw6i9lBhEEph6WFjWX76PfPEe+v8GpR0wB8VHzcD
         DZYh90mtRk0Bi6o3EoKpDMn1ZNxF+0O19MDvrn7LO5SjTqdwM4WOPeJc+nu76bzMZrOe
         h3og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705507713; x=1706112513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SBCi6IfvSuWJWsQQRO0GbKoKMq+lADolGg2VRt1L2AY=;
        b=Lrxz/I4EKMdgjw87fsgvIzVNznmPnqIlzDuM7rb3BTCKPNomTVDhCIwwMIte6vkJvj
         CC40UJZgk30tXMZAnwNZlL8FGf9imLbMG6uezcuZ1mOTvIM7/K+QE2zMYxoCeQRcP0oT
         jcvrzx/Q0tZIcxC3romb2uuy9vBjcvYbhBY5HB1IUxnIkjhusl/H7zPy8ywmzQs3lIrA
         EBSGz0q8aCBOVyqSt9KPJ5YKxUS3ObbPswqlx9JTjMfpqeBgciu+wcEZmC0cKNg/d0ED
         oDzh6ySGKi2Z5zSe7bkJb9H50B5PVvB9N7xQPldVD1je/zjbytWTSRUFTN39aG97TtiN
         Cjtg==
X-Gm-Message-State: AOJu0Yw7x1ahzt+v4SM0QWLdx6sJ9aTBXty3Mobg1JZQiLILBwi16t49
	i9LEpxH388BkCryx9xcHnGkty25fuXlcqQ==
X-Google-Smtp-Source: AGHT+IFjljDDCnBBoAi7yTfH1zGRdwIMW4kRxn1c76OZTcbCEivzT08IjDIvclpxoDafVoi8g/kDtQ==
X-Received: by 2002:a05:600c:2d48:b0:40e:5493:df45 with SMTP id a8-20020a05600c2d4800b0040e5493df45mr5263664wmg.166.1705507713165;
        Wed, 17 Jan 2024 08:08:33 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d0b5:43ec:48:baad])
        by smtp.gmail.com with ESMTPSA id t10-20020a5d6a4a000000b00337b0374a3dsm1972092wrw.57.2024.01.17.08.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 08:08:32 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Kalle Valo <kvalo@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chris Morgan <macromorgan@hotmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Arnd Bergmann <arnd@arndb.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Peng Fan <peng.fan@nxp.com>,
	Robert Richter <rrichter@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Terry Bowman <terry.bowman@amd.com>,
	Lukas Wunner <lukas@wunner.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Alex Elder <elder@linaro.org>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 4/9] PCI: create platform devices for child OF nodes of the port node
Date: Wed, 17 Jan 2024 17:07:43 +0100
Message-Id: <20240117160748.37682-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240117160748.37682-1-brgl@bgdev.pl>
References: <20240117160748.37682-1-brgl@bgdev.pl>
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
 drivers/pci/remove.c | 3 ++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/bus.c b/drivers/pci/bus.c
index 9c2137dae429..8ab07f711834 100644
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
index d749ea8250d6..77be0630b7b3 100644
--- a/drivers/pci/remove.c
+++ b/drivers/pci/remove.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <linux/pci.h>
 #include <linux/module.h>
+#include <linux/of_platform.h>
 #include "pci.h"
 
 static void pci_free_resources(struct pci_dev *dev)
@@ -18,11 +19,11 @@ static void pci_stop_dev(struct pci_dev *dev)
 	pci_pme_active(dev, false);
 
 	if (pci_dev_is_added(dev)) {
-
 		device_release_driver(&dev->dev);
 		pci_proc_detach_device(dev);
 		pci_remove_sysfs_dev_files(dev);
 		of_pci_remove_node(dev);
+		of_platform_depopulate(&dev->dev);
 
 		pci_dev_assign_added(dev, false);
 	}
-- 
2.40.1


