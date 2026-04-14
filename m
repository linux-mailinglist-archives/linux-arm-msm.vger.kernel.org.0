Return-Path: <linux-arm-msm+bounces-103178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJTICC9s3mncEAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 18:32:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1BF3FC9E1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 18:32:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A7AE2300D4FE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 16:31:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A01831E82F;
	Tue, 14 Apr 2026 16:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sl23EOQO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68D8288C30;
	Tue, 14 Apr 2026 16:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776184281; cv=none; b=WxEL3Ka4B8dgPSP3uNkZ6i/yrwpLukE84+rTQ/iCfwmFCOhbhD6CMWsKih+wUXVxZrOBiZAhFeOGw23q3zc5QEIf7GJFz8OAYrf2NH/d+TUPhV/JePjCu9xbViqtnuwP+B2EstPaSQur3254M+JxCFJn8U4aSlDhbeoavJTaG9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776184281; c=relaxed/simple;
	bh=Xcje/jed8ZwOn7gRcR4WUVa/XkNJGc5sFLasaQZsHEo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rUKh1FEAMxt2mIEPg83e4TYgwqQR8nxNPhe73EBXM7dI98txqGQW5493R1L559/dUresInp4mrwMs3SEpaWttZQTeYcZWlHmBuc+prV93as0VgZA6Kd+NguoS2Bd7LrnH0HlSypTWydDrwAf9KclcX1p+I/d3tGIgAZSCD4Ax7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sl23EOQO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6EB9AC2BCB5;
	Tue, 14 Apr 2026 16:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776184280;
	bh=Xcje/jed8ZwOn7gRcR4WUVa/XkNJGc5sFLasaQZsHEo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Sl23EOQOrOUSm+TNf/WDDX6GJXmyjo1lPHEAT2oe79CFibRS8Al27zKKghKKgz5sS
	 jb2Dk9Fj0VLuMBnKB+h3nMed+ZqCj5buBgv1R3fbASvUAhqVvTsy1E5XxsUVpEkMQ7
	 O+9+a+gF4Dxf/PhWz4Tuwv1aJo0bDQDxrcfKV+oQyugQltQYmfPE2EU+3WptXIWmE6
	 rK53tfASjizMPyrovDO6BY8C3RFTqFHbcktC5jpXvct6jh1dsnZVpnTUPjo7Bmz5N0
	 h1dX63c6DcVK+V8mY7Hl/+qKq/bzhUjXJXjDoqZYM1dr98LX9/7RuzswlOChPoyXzU
	 JrROHtlfrym9g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D462F9D0E7;
	Tue, 14 Apr 2026 16:31:20 +0000 (UTC)
From: Ekansh Gupta via B4 Relay <devnull+ekansh.gupta.oss.qualcomm.com@kernel.org>
Date: Tue, 14 Apr 2026 22:01:15 +0530
Subject: [PATCH 1/3] drivers: base: Add generic context device bus
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-computebus-v1-1-4d904d40926a@oss.qualcomm.com>
References: <20260414-computebus-v1-0-4d904d40926a@oss.qualcomm.com>
In-Reply-To: <20260414-computebus-v1-0-4d904d40926a@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Arnd Bergmann <arnd@arndb.de>, Srinivas Kandagatla <srini@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Bharath Kumar <quic_bkumar@quicinc.com>, 
 Chenna Kesava Raju <quic_chennak@quicinc.com>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
 iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776184278; l=3013;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=GiaW9KX6EnyHl15uXUaLI85Eugyx6gIsQQrGnKwyVVk=;
 b=g7ZvTKbHA9UTo3rRc56oQRClDN77YoCoOIyf0Ch0pvK4S/d5lszMPmM5fNmU56g6YpXEOAu9x
 J6BS+tcG340ACkYknZbhTqxrn/ex62ByFElTbD0dzk54v75d4aqeryz
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Endpoint-Received: by B4 Relay for ekansh.gupta@oss.qualcomm.com/20260223
 with auth_id=647
X-Original-From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Reply-To: ekansh.gupta@oss.qualcomm.com
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103178-lists,linux-arm-msm=lfdr.de,ekansh.gupta.oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,nvidia.com,gmail.com,ffwll.ch,8bytes.org,arm.com,arndb.de,oss.qualcomm.com,quicinc.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[ekansh.gupta@oss.qualcomm.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:replyto,oss.qualcomm.com:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: 1A1BF3FC9E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

Introduce a new generic bus type for synthetic context bank devices
that require IOMMU context isolation. This bus provides a shared
infrastructure for accelerator and GPU drivers that create virtual
devices representing IOMMU context banks.

Currently, drivers like host1x implement their own bus types for
context devices. This generic implementation allows multiple drivers
to share the same bus infrastructure, simplifying the IOMMU subsystem
integration and reducing code duplication.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/base/Kconfig        |  3 +++
 drivers/base/Makefile       |  1 +
 drivers/base/context_bus.c  | 24 ++++++++++++++++++++++++
 include/linux/context_bus.h | 15 +++++++++++++++
 4 files changed, 43 insertions(+)

diff --git a/drivers/base/Kconfig b/drivers/base/Kconfig
index f7d385cbd3ba..479bc4bb442b 100644
--- a/drivers/base/Kconfig
+++ b/drivers/base/Kconfig
@@ -4,6 +4,9 @@ menu "Generic Driver Options"
 config AUXILIARY_BUS
 	bool
 
+config CONTEXT_DEVICE_BUS
+	bool
+
 config UEVENT_HELPER
 	bool "Support for uevent helper"
 	help
diff --git a/drivers/base/Makefile b/drivers/base/Makefile
index 8074a10183dc..ab9a0b2dc73b 100644
--- a/drivers/base/Makefile
+++ b/drivers/base/Makefile
@@ -8,6 +8,7 @@ obj-y			:= component.o core.o bus.o dd.o syscore.o \
 			   topology.o container.o property.o cacheinfo.o \
 			   swnode.o faux.o
 obj-$(CONFIG_AUXILIARY_BUS) += auxiliary.o
+obj-$(CONFIG_CONTEXT_DEVICE_BUS) += context_bus.o
 obj-$(CONFIG_DEVTMPFS)	+= devtmpfs.o
 obj-y			+= power/
 obj-$(CONFIG_ISA_BUS_API)	+= isa.o
diff --git a/drivers/base/context_bus.c b/drivers/base/context_bus.c
new file mode 100644
index 000000000000..6ddb6c27bf69
--- /dev/null
+++ b/drivers/base/context_bus.c
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+
+#include <linux/context_bus.h>
+#include <linux/init.h>
+
+const struct bus_type context_device_bus_type = {
+	.name = "context-device",
+};
+EXPORT_SYMBOL_GPL(context_device_bus_type);
+
+static int __init context_device_bus_init(void)
+{
+	int err;
+
+	err = bus_register(&context_device_bus_type);
+	if (err < 0) {
+		pr_err("context-device bus registration failed: %d\n", err);
+		return err;
+	}
+
+	return 0;
+}
+postcore_initcall(context_device_bus_init);
diff --git a/include/linux/context_bus.h b/include/linux/context_bus.h
new file mode 100644
index 000000000000..0cd44cb5b147
--- /dev/null
+++ b/include/linux/context_bus.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __LINUX_CONTEXT_BUS_H
+#define __LINUX_CONTEXT_BUS_H
+
+#include <linux/device.h>
+
+#ifdef CONFIG_CONTEXT_DEVICE_BUS
+extern const struct bus_type context_device_bus_type;
+#endif
+
+#endif /* __LINUX_CONTEXT_BUS_H */

-- 
2.34.1



