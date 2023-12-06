Return-Path: <linux-arm-msm+bounces-3582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CABC0807666
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 18:20:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D4F41F2110A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 17:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F353161FD7;
	Wed,  6 Dec 2023 17:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="JkLSOGsb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 445E7D3;
	Wed,  6 Dec 2023 09:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=y6VpUz4b510Kv9jC4j72epDxCDpD3FJ3vGcM2z5b3qk=; b=JkLSOGsbLcnNGqJf5i1ZRDtVxv
	agrgw1SSzj/fHdj+et+CeGYzWMjzUYxZFWw8QJ9cUKR4Jtw8bfLQ1WuPACyVjiajCpDh4mVQqLgAy
	gEcjJCtH0g9Hl/oPrBpd+Z/GQqrXsOCXTPSDsQ1I88dbAaXiyg1G+k/WXVamYqf8bpBFUGZQhnmXS
	BXFlgLZDAKX9Ra7JngC9lwOnFiSl7jjo0sNHvpKAJGQPE/9tVal3Tz9G36Y82Vi24wKTboTf89I7A
	ZIW4/ED7xFI3vLfQZOeW+8pn55Zj/Q9goKOlZqu7t8hozU+hV0ehsZd3bO9Vz30CgFIimalZqEXrG
	vU9ib6DQ==;
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rAvZd-00AsMr-3D;
	Wed, 06 Dec 2023 17:20:38 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] usb: typec: qcom-pmic: add CONFIG_OF dependency
Date: Wed,  6 Dec 2023 09:20:37 -0800
Message-ID: <20231206172037.12072-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DRM_AUX_BRIDGE depends on CONFIG_OF, so that is also needed here
to fix a kconfig warning:

WARNING: unmet direct dependencies detected for DRM_AUX_HPD_BRIDGE
  Depends on [n]: HAS_IOMEM [=y] && DRM_BRIDGE [=y] && OF [=n]
  Selected by [y]:
  - TYPEC_QCOM_PMIC [=y] && USB_SUPPORT [=y] && TYPEC [=y] && TYPEC_TCPM [=y] && (ARCH_QCOM || COMPILE_TEST [=y]) && (DRM [=y] || DRM [=y]=n) && DRM_BRIDGE [=y]

Fixes: 7d9f1b72b296 ("usb: typec: qcom-pmic-typec: switch to DRM_AUX_HPD_BRIDGE")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-usb@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>
---
 drivers/usb/typec/tcpm/Kconfig |    1 +
 1 file changed, 1 insertion(+)

diff -- a/drivers/usb/typec/tcpm/Kconfig b/drivers/usb/typec/tcpm/Kconfig
--- a/drivers/usb/typec/tcpm/Kconfig
+++ b/drivers/usb/typec/tcpm/Kconfig
@@ -80,6 +80,7 @@ config TYPEC_QCOM_PMIC
 	tristate "Qualcomm PMIC USB Type-C Port Controller Manager driver"
 	depends on ARCH_QCOM || COMPILE_TEST
 	depends on DRM || DRM=n
+	depends on OF
 	select DRM_AUX_HPD_BRIDGE if DRM_BRIDGE
 	help
 	  A Type-C port and Power Delivery driver which aggregates two

