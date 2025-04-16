Return-Path: <linux-arm-msm+bounces-54465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 69622A8AC71
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 02:03:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A44CC3B0162
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 00:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B659F1F4C9D;
	Wed, 16 Apr 2025 00:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HnKg+mkB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE5B1B6D06
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 00:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744761744; cv=none; b=FTUMhX/+vaESI55zEFVdOxa0FsE3S7DUE5H1yNw7/y0e8yDfbdUczIpM8mZQGMkdL/yms7qD0zIQWnAZtR+SRpKzACZCByAYdU1d5LPaF84YXaGIqjSSFEOPYGqIa3g0Q1chrQTeOfZaVgX8iPZYJX8qJ8tA2Cgr0i06id5vZ6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744761744; c=relaxed/simple;
	bh=zOmVc3lsujHVGR9M+6Irw8HkDbw5tSV2x/aMh4olbVE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p4Z83Y8s+VpqDBS7tpkDAwx+dVvBOcuyEPsK7GyP93yTPdfPt8HDWsFOF/wBU07X3GQzDSTpaWTA6ZZ3jT1KN+11Z7vjMAv5dicI/AQEi6u42rqfw60xcOS3NEd8tXcjCukjJmTR9o4/CbXzXVvSVaQGr6WWVEFKOfQ3wljT6K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HnKg+mkB; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-225477548e1so60111255ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 17:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744761742; x=1745366542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HHYpHK7kt8aJgnApA+GCQEa2iHMXOWfKlfQqVLhW5Rk=;
        b=HnKg+mkBbHrgIIyQFIbRnLvSVHEDaLRtzQQ0c1D9HTvhmM/YesNo4HqUnTZt5yIBgO
         AE9Na1KLyVyZ7gXvF/5gPubHHd/cktGbeGIzEL3D9hxMrhjLWg5Ffq2/nilux6/jhC/L
         romY3FzDK3qkNhqgG6zYBQ5+2GKvvoqhAucB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744761742; x=1745366542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HHYpHK7kt8aJgnApA+GCQEa2iHMXOWfKlfQqVLhW5Rk=;
        b=fOgOSHPCqjz03vCTMEACG05Xg4MnPDbdbBycYNeSROPmv95Qs8qF7uXj+83j4QnhfX
         UyHlDVrcDcQoTWk62PPJyanrnLgJMRNPSOfeqDhoHo8UUnYRGZpd27ubjgD+9P5Lw9XY
         A3tG2NxU7kZjhDe7IUc9K5Eeg85Pzl2lFsmcOenD9K4/XpRnT1nDlCeITD4sRerIh8pT
         gYkd8KdmSLJrQfO/Yvvf0PpAcWxje7lALlPCQhAphbtRdvZQfjHNxcWRKN1PrEoslu2y
         noa7LEIl5Y+fLpuor3s4YOEZyYWnz67nS7qWgrywk9dHd4RJ8AZaznpb0MscMQqeHKTq
         bMjg==
X-Forwarded-Encrypted: i=1; AJvYcCVXQjhsmDBIuYzErHPii3b3EHaP81fBFLyp44slCApncX1vnoeNz7ROydljeP+J9J0enLfq2CaPd+gdce64@vger.kernel.org
X-Gm-Message-State: AOJu0YwL+zhSMcxvq2c7NtLVAzfve2vN7bssDrV4nifnvHp3jRSddb5i
	5+79R2gz06PkXkAcskxIvI65nk35KaUZJhLEcL0cY1Hbd3QT6kH/8WCt2D+swQ==
X-Gm-Gg: ASbGnctTy2PhpwczITvnQU9HUvO5J2Z5i4CEcWzmHmUT8rbu++hjnHvkRhMVyLS9sqV
	lG2dXdLoJ7KL6SRiL6EwszhxwLZumXf2+uPQC+RNjhobJA3+2nwc7v17vaGJ4JYUiP+9GT9RcY2
	g2w0XwXMlbaD4Cau0uVlPphmS20LHxkXysAon8PT2eMXnKeiIKrrfcrDhB22ir6QfDyxNmoqIB2
	hvhQPWRe+JaWMlYu7k0a4hoF3FRP5NImUDNdX41GoxEsNnTTfQeXy5hbAm3aSGtJEV/cw7qX5ba
	ih2c4crSyeTGwpIrFGK+kjz0+Ya7VjUKDPUfBIgqF0JFj51I7HmCkyT0hmC0Uvu1PsYxti6U+ex
	GJw==
X-Google-Smtp-Source: AGHT+IEiQFpTS4vI0noyDuSs6VYTT9MkaGL0pVH3GJ7yVUmMdtuB7YMvp/PXxT4BTHtGtAfI5QsF6w==
X-Received: by 2002:a17:902:a5c7:b0:223:5525:6239 with SMTP id d9443c01a7336-22c31ace733mr15386845ad.38.1744761741951;
        Tue, 15 Apr 2025 17:02:21 -0700 (PDT)
Received: from localhost (199.24.125.34.bc.googleusercontent.com. [34.125.24.199])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-22c33f1d091sm1324475ad.61.2025.04.15.17.02.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 17:02:21 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	devicetree@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	chrome-platform@lists.linux.dev,
	Pin-yen Lin <treapking@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH 6/7] platform/chrome: cros_ec_typec: Add support for DP altmode via drm_bridge
Date: Tue, 15 Apr 2025 17:02:06 -0700
Message-ID: <20250416000208.3568635-7-swboyd@chromium.org>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
In-Reply-To: <20250416000208.3568635-1-swboyd@chromium.org>
References: <20250416000208.3568635-1-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Trogdor platforms, the USB DP altmode is entered and exited by the EC
depending on if DP altmode is possible and if HPD is asserted for a
port. Trogdor has two USB-C connectors but the AP only supports one DP
controller, so the first USB-C connector to assert HPD "wins". The DP
controller on the AP is fixed to output two lanes DP that goes to an
analog mux that steers the DP lanes to one of the two USB-C connectors.
The HPD state in the DP altmode is "captured" by the EC and redriven
from a GPIO on the EC to the AP's GPIO that is muxed to the DisplayPort
controller inside the AP SoC. This allows both HPD high/low and HPD IRQ
to be signaled from the EC as well as making DP altmode possible on
either USB-C connector except at the same time.

Add a drm_bridge to the ChromeOS EC driver to represent this analog mux
on Trogdor and teach the kernel that DP altmode is using this DP
controller on the AP. When the DT node has a graph binding, we assume
that we're muxing DP to one of many USB-C connectors and we terminate
the bridge chain here. In almost all cases we want this bridge to be the
one that signals HPD because the EC is the one managing HPD and
redriving the GPIO, except for in the case that the DP altmode driver is
enabled in which case HPD will be signaled with
drm_bridge_connector_oob_hotplug_event(). Unfortunately Trogdor EC
firmwares have a bug where HPD state isn't discoverable properly, so we
skip signaling HPD in that case if the "no-hpd" property exists in the
node.

Cc: Benson Leung <bleung@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: <chrome-platform@lists.linux.dev>
Cc: Pin-yen Lin <treapking@chromium.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: Łukasz Bartosik <ukaszb@chromium.org>
Cc: Jameson Thies <jthies@google.com>
Cc: Andrei Kuchynski <akuchynski@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/platform/chrome/Kconfig         |  1 +
 drivers/platform/chrome/cros_ec_typec.c | 50 +++++++++++++++++++++++++
 drivers/platform/chrome/cros_ec_typec.h |  7 ++++
 3 files changed, 58 insertions(+)

diff --git a/drivers/platform/chrome/Kconfig b/drivers/platform/chrome/Kconfig
index 1b2f2bd09662..0ed8637b8853 100644
--- a/drivers/platform/chrome/Kconfig
+++ b/drivers/platform/chrome/Kconfig
@@ -247,6 +247,7 @@ config CROS_EC_TYPEC
 	depends on MFD_CROS_EC_DEV && TYPEC
 	depends on CROS_USBPD_NOTIFY
 	depends on USB_ROLE_SWITCH
+	depends on DRM_BRIDGE
 	default MFD_CROS_EC_DEV
 	select CROS_EC_TYPEC_ALTMODES if TYPEC_DP_ALTMODE
 	select CROS_EC_TYPEC_ALTMODES if TYPEC_TBT_ALTMODE
diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 2cbe29f08064..27324cf0c0c6 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -9,6 +9,7 @@
 #include <linux/acpi.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/platform_data/cros_ec_commands.h>
 #include <linux/platform_data/cros_usbpd_notify.h>
 #include <linux/platform_device.h>
@@ -16,6 +17,8 @@
 #include <linux/usb/typec_dp.h>
 #include <linux/usb/typec_tbt.h>
 
+#include <drm/drm_bridge.h>
+
 #include "cros_ec_typec.h"
 #include "cros_typec_vdm.h"
 #include "cros_typec_altmode.h"
@@ -337,6 +340,9 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
 	u32 port_num = 0;
 
 	nports = device_get_child_node_count(dev);
+	/* Don't count any 'ports' child node */
+	if (of_graph_is_present(dev->of_node))
+		nports--;
 	if (nports == 0) {
 		dev_err(dev, "No port entries found.\n");
 		return -ENODEV;
@@ -350,6 +356,10 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
 	/* DT uses "reg" to specify port number. */
 	port_prop = dev->of_node ? "reg" : "port-number";
 	device_for_each_child_node(dev, fwnode) {
+		/* An OF graph isn't a connector */
+		if (fwnode_name_eq(fwnode, "ports"))
+			continue;
+
 		if (fwnode_property_read_u32(fwnode, port_prop, &port_num)) {
 			ret = -EINVAL;
 			dev_err(dev, "No port-number for port, aborting.\n");
@@ -417,6 +427,42 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
 	return ret;
 }
 
+static int cros_typec_dp_bridge_attach(struct drm_bridge *bridge,
+				       enum drm_bridge_attach_flags flags)
+{
+	return flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR ? 0 : -EINVAL;
+}
+
+static const struct drm_bridge_funcs cros_typec_dp_bridge_funcs = {
+	.attach	= cros_typec_dp_bridge_attach,
+};
+
+static int cros_typec_init_dp_bridge(struct cros_typec_data *typec)
+{
+	struct device *dev = typec->dev;
+	struct cros_typec_dp_bridge *dp_bridge;
+	struct drm_bridge *bridge;
+	struct device_node *np = dev->of_node;
+
+	/* Not capable of DP altmode switching. Ignore. */
+	if (!of_graph_is_present(np))
+		return 0;
+
+	dp_bridge = devm_kzalloc(dev, sizeof(*dp_bridge), GFP_KERNEL);
+	if (!dp_bridge)
+		return -ENOMEM;
+	typec->dp_bridge = dp_bridge;
+
+	bridge = &dp_bridge->bridge;
+	bridge->funcs = &cros_typec_dp_bridge_funcs;
+	bridge->of_node = np;
+	bridge->type = DRM_MODE_CONNECTOR_DisplayPort;
+	if (!device_property_read_bool(dev, "no-hpd"))
+		bridge->ops |= DRM_BRIDGE_OP_HPD;
+
+	return devm_drm_bridge_add(dev, bridge);
+}
+
 static int cros_typec_usb_safe_state(struct cros_typec_port *port)
 {
 	int ret;
@@ -1276,6 +1322,10 @@ static int cros_typec_probe(struct platform_device *pdev)
 		typec->num_ports = EC_USB_PD_MAX_PORTS;
 	}
 
+	ret = cros_typec_init_dp_bridge(typec);
+	if (ret < 0)
+		return ret;
+
 	ret = cros_typec_init_ports(typec);
 	if (ret < 0)
 		return ret;
diff --git a/drivers/platform/chrome/cros_ec_typec.h b/drivers/platform/chrome/cros_ec_typec.h
index 9fd5342bb0ad..090f8f5c0492 100644
--- a/drivers/platform/chrome/cros_ec_typec.h
+++ b/drivers/platform/chrome/cros_ec_typec.h
@@ -14,6 +14,8 @@
 #include <linux/usb/typec_retimer.h>
 #include <linux/workqueue.h>
 
+#include <drm/drm_bridge.h>
+
 /* Supported alt modes. */
 enum {
 	CROS_EC_ALTMODE_DP = 0,
@@ -35,6 +37,7 @@ struct cros_typec_data {
 	unsigned int pd_ctrl_ver;
 	/* Array of ports, indexed by port number. */
 	struct cros_typec_port *ports[EC_USB_PD_MAX_PORTS];
+	struct cros_typec_dp_bridge *dp_bridge;
 	struct notifier_block nb;
 	struct work_struct port_work;
 	bool typec_cmd_supported;
@@ -83,4 +86,8 @@ struct cros_typec_port {
 	struct cros_typec_data *typec_data;
 };
 
+struct cros_typec_dp_bridge {
+	struct drm_bridge bridge;
+};
+
 #endif /*  __CROS_EC_TYPEC__ */
-- 
https://chromeos.dev


