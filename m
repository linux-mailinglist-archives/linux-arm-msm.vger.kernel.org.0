Return-Path: <linux-arm-msm+bounces-54466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AACA8AC73
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 02:03:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 406221902E90
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 00:03:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47C71290F;
	Wed, 16 Apr 2025 00:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hOFs+dE7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F051E1DF2
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 00:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744761746; cv=none; b=erXODJXWU/Q/YNtlI+MdIh6fR1/Z63mE63zQsUSpnRhSK3QXSkIylaTwB2xzYYH8tW6FmhnW+V8loLe9zYpsnEkQ8Qyvf4sEPJLTHbvJC8cbXoLJZ9kAqRtZxfXakp+zraGC7TFzN4gOFXRyCtn8oNj8MRajspeMxYTLvWbnd6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744761746; c=relaxed/simple;
	bh=eDLBVrgnGdyoJQ79t80ww+yTdagNVGC7c/Zmd+hN+sM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=idqAgvpvMmXr8O8rXZXYFPVuNsJoSQKsCrs9cFZb51rKi5VeYtWzvtK9wwRJOjdlp/kdbhW5526QzkKqdqjCAieOvHJmBigTyVxjvo3QDzo6Wm3372IzhH95We6N4EPS9ryLIQrN/7yZuKj9QBmL3dijV6DuDdMxQ6LLdqkqSbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hOFs+dE7; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-306b78ae2d1so5775432a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 17:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744761744; x=1745366544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GPPbtqsuzK5NYYNdc0zpLwLBjiWgWtV76EEhJ0f/yC8=;
        b=hOFs+dE7qbldjczDg5jaBppniUhUyhdGxQk8sC5969Yoh2DXbfBTep+PUklVDEdcNn
         ivmv/uIAz69Dv+V749MmIVZECSRIve4vSvJ3sanF7hQabeWaZqEosPMZCjSXkh+mCJre
         MOULjY0ewSQ9/qCvNPQLuXe8tNoeUGBO1K+6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744761744; x=1745366544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GPPbtqsuzK5NYYNdc0zpLwLBjiWgWtV76EEhJ0f/yC8=;
        b=fv87x3j4Vre5KmzPPDjEZdH0dMRkLrydxDd2iOF8bWtO50yz++IA1exfHTLa4WSmR+
         kOPKUd06naGOdSTjSvz5VplOwCvpwPF/r8Y3klAcapRD9jPK4mysDjmC+tYlTRHN10Ar
         HZsxwnwCEjKVogoK98H6e8Qe3Q5q5hkvT3ay1xhgDdd8V00nxJldJv477sMsRb9mlvfw
         OTHdttPKnrBBNluj7Q2ntKNKAT8gsb/oE3ei4xE/Mf47hS6e27ZFmjhur+xWk70WBwl6
         K9tYp4JdQ3qoizhkWT6dlL2QofG74lYX8CXNxb47ledhqSR6gu6xopiNmCZPsR/loEZ1
         x30A==
X-Forwarded-Encrypted: i=1; AJvYcCXRL5D3VH+dN+nXz2hX20Gj6t8DZkwfmX1Yl0OCyzKJvJelmNA0vsi3ljSjHYoFfDGckJTyYPWY6ZphB6oj@vger.kernel.org
X-Gm-Message-State: AOJu0YyrQMJi29dESx7uq+AiEqSp7LNyF2Sigo+JXG9n5EDmHZpbDgjM
	khecNgRRL83j3dC0E5AIYkRkPYiWQW9Qt+u0XMGhAtrVdq2/enOos9hPy9bNEg==
X-Gm-Gg: ASbGnctEXauxSJLl8Lv0MNSnBvx94r460CTKnyN1/AfvqnkgRFh6wkx2GmtMBnxQ6xF
	G0mwAIS0EgcFVQ2ZJnJvba+td5a4edoSMp+Fnwnn6AgMinRhX/zH62R9cckUSxQPuX7wTkMRbCT
	WOLi6Ph+1XZzwTHDP8iS8hfDvd5j0nTGwXpayfKvEsQVHEpnE/X6HFR1mKgCCuSUAnHP/qPJxaU
	a/k8Kf3pbzjLgQLgFYGmltIjYFKA59YRzLywkEtmt3XylZeCZd3xbwZTAg+On+KYjlWaGwEKVFI
	Nn6VrLbuLl3pVCfDOs5GNY9XSaFyERZNHC33ihHOAxV73xIpWWalkSb+tc/rh4DbuLYI2mZpGMH
	ABg==
X-Google-Smtp-Source: AGHT+IErLrf4vSn8BQ0x8FQOElvg38uwkXskYXgtvXn9GTzRRW4rhFc/IJBl//1/RAJQqDgW15Gcyw==
X-Received: by 2002:a17:90b:5108:b0:2ee:9b09:7d3d with SMTP id 98e67ed59e1d1-3085ef36625mr1741934a91.19.1744761743673;
        Tue, 15 Apr 2025 17:02:23 -0700 (PDT)
Received: from localhost (199.24.125.34.bc.googleusercontent.com. [34.125.24.199])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-b0b22217eebsm117742a12.67.2025.04.15.17.02.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 17:02:23 -0700 (PDT)
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
Subject: [PATCH 7/7] platform/chrome: cros_ec_typec: Support DP muxing
Date: Tue, 15 Apr 2025 17:02:07 -0700
Message-ID: <20250416000208.3568635-8-swboyd@chromium.org>
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

Most ARM based chromebooks with two usb-c-connector nodes and one DP
controller are muxing the DP lanes between the two USB ports. This is
done so that the type-c ports are at least equal in capability if not
functionality. Either an analog mux is used to steer the DP signal to
one or the other port, or a DP bridge chip has two lanes (e.g. DP
ML0/ML1) wired to one type-c port while the other two (e.g. DP ML2/ML3)
are wired to another type-c port.

If a user connects a DP capable cable to both usb-c-connectors the EC
likes to inform the AP that both ports have entered DP altmode, even
though one of those ports can't actually display anything because the DP
lanes aren't steered there. The answer to this problem is to look at the
HPD bit in the EC messages. The port that isn't steered for DP won't
ever see HPD be asserted, because the EC hides HPD state for the other
port. This isn't a great solution though, because some EC firmwares
don't even signal HPD state in the message at all. Oops! And it really
does throw the whole type-c subsystem for a loop when the port has DP
altmode present but it can't be entered properly.

Let's fix these problems by doing two things.

First, we'll only allow the port that's steered for DP to enter DP mode.
Do that by checking the mux-gpios whenever we see that the EC tells us
DP mode has been entered. If the mux isn't selecting this port, remove
the flag from the message so that DP mode doesn't look to be entered.

Second, inject HPD into the EC message when the EC has busted firmware.
In this case, DT authors add 'no-hpd' to the typec node (essentially
only on Trogdor). Listen for HPD events from the drm_bridge and read the
mux when HPD is asserted to figure out which port actually had HPD
asserted on it. When the port state is processed, check the bit against
the port and if DP mode is entered, i.e. the mux is still steering
toward that port, check if HPD is asserted on that port and inject HPD.
This is necessary so that the typec framework can update the HPD state
in sysfs, and eventually call drm_connector_oob_hotplug_event() from the
DP altmode driver.

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
 drivers/platform/chrome/cros_ec_typec.c      | 115 +++++++++++++++++++
 drivers/platform/chrome/cros_ec_typec.h      |  14 +++
 drivers/platform/chrome/cros_typec_altmode.c |   2 +
 3 files changed, 131 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 27324cf0c0c6..10079129645d 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_graph.h>
@@ -427,6 +428,41 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
 	return ret;
 }
 
+static void cros_typec_dp_bridge_hpd_notify(struct drm_bridge *bridge, enum drm_connector_status status)
+{
+	struct cros_typec_dp_bridge *dp_bridge = bridge_to_cros_typec_dp_bridge(bridge);
+	struct cros_typec_data *typec = dp_bridge->typec_data;
+	struct gpio_desc *mux_gpio = dp_bridge->mux_gpio;
+	int val;
+	DECLARE_BITMAP(orig, EC_USB_PD_MAX_PORTS);
+	DECLARE_BITMAP(changed, EC_USB_PD_MAX_PORTS);
+
+	if (!mux_gpio)
+		return;
+
+	/* This bridge signals HPD so it must be able to detect HPD properly */
+	if (dp_bridge->bridge.ops & DRM_BRIDGE_OP_HPD)
+		return;
+
+	bitmap_copy(orig, dp_bridge->hpd_asserted, EC_USB_PD_MAX_PORTS);
+	bitmap_zero(changed, EC_USB_PD_MAX_PORTS);
+
+	if (status == connector_status_connected) {
+		val = gpiod_get_value_cansleep(mux_gpio);
+		if (val < 0) {
+			dev_err(typec->dev, "Failed to read mux gpio\n");
+			return;
+		}
+		__set_bit(val, changed);
+	}
+
+	bitmap_copy(dp_bridge->hpd_asserted, changed, EC_USB_PD_MAX_PORTS);
+
+	/* Refresh port state. */
+	if (!bitmap_equal(orig, changed, EC_USB_PD_MAX_PORTS))
+		schedule_work(&typec->port_work);
+}
+
 static int cros_typec_dp_bridge_attach(struct drm_bridge *bridge,
 				       enum drm_bridge_attach_flags flags)
 {
@@ -435,6 +471,7 @@ static int cros_typec_dp_bridge_attach(struct drm_bridge *bridge,
 
 static const struct drm_bridge_funcs cros_typec_dp_bridge_funcs = {
 	.attach	= cros_typec_dp_bridge_attach,
+	.hpd_notify = cros_typec_dp_bridge_hpd_notify,
 };
 
 static int cros_typec_init_dp_bridge(struct cros_typec_data *typec)
@@ -452,6 +489,11 @@ static int cros_typec_init_dp_bridge(struct cros_typec_data *typec)
 	if (!dp_bridge)
 		return -ENOMEM;
 	typec->dp_bridge = dp_bridge;
+	dp_bridge->typec_data = typec;
+
+	dp_bridge->mux_gpio = devm_gpiod_get_optional(dev, "mux", GPIOD_ASIS);
+	if (IS_ERR(dp_bridge->mux_gpio))
+		return dev_err_probe(dev, PTR_ERR(dp_bridge->mux_gpio), "failed to get mux gpio\n");
 
 	bridge = &dp_bridge->bridge;
 	bridge->funcs = &cros_typec_dp_bridge_funcs;
@@ -662,6 +704,77 @@ static int cros_typec_enable_usb4(struct cros_typec_data *typec,
 	return typec_mux_set(port->mux, &port->state);
 }
 
+/*
+ * Some ECs like to tell AP that both ports have DP enabled when that's
+ * impossible because the EC is muxing DP to one or the other port. Check the
+ * mux on the EC in this case and ignore what the EC tells us about DP on the
+ * port that isn't actually muxed for DP.
+ */
+void cros_typec_check_dp(struct cros_typec_data *typec,
+			 struct ec_response_usb_pd_mux_info *resp,
+			 struct cros_typec_port *port)
+{
+	struct cros_typec_dp_bridge *dp_bridge = typec->dp_bridge;
+	struct gpio_desc *mux_gpio;
+	int val;
+
+	/* Never registered a drm_bridge. Skip. */
+	if (!dp_bridge)
+		return;
+
+	/* Don't need to override DP enabled when DP isn't enabled. */
+	if (!(resp->flags & USB_PD_MUX_DP_ENABLED))
+		return;
+
+	mux_gpio = dp_bridge->mux_gpio;
+	/* EC mux is required to determine which port actually has DP on it. */
+	if (!mux_gpio)
+		return;
+
+	val = gpiod_get_value_cansleep(mux_gpio);
+	if (val < 0) {
+		dev_err(typec->dev, "Failed to read mux gpio\n");
+		return;
+	}
+
+	/* Only the muxed port can have DP enabled. Ignore. */
+	if (val != port->port_num)
+		resp->flags &= ~USB_PD_MUX_DP_ENABLED;
+}
+
+/*
+ * Some ECs don't notify AP when HPD goes high or low because their firmware is
+ * broken. Capture the state of HPD in cros_typec_dp_bridge_hpd_notify() and
+ * inject the asserted state into the EC's response (deasserted is the
+ * default).
+ */
+static void cros_typec_inject_hpd(struct cros_typec_data *typec,
+				  struct ec_response_usb_pd_mux_info *resp,
+				  struct cros_typec_port *port)
+{
+	struct cros_typec_dp_bridge *dp_bridge = typec->dp_bridge;
+
+	/* Never registered a drm_bridge. Skip. */
+	if (!dp_bridge)
+		return;
+
+	/* Don't need to inject HPD level when DP isn't enabled. */
+	if (!(resp->flags & USB_PD_MUX_DP_ENABLED))
+		return;
+
+	/* This bridge signals HPD so it doesn't need to be reinjected */
+	if (dp_bridge->bridge.ops & DRM_BRIDGE_OP_HPD)
+		return;
+
+	/*
+	 * The default setting is HPD deasserted. Ignore if nothing to inject.
+	 */
+	if (!test_bit(port->port_num, dp_bridge->hpd_asserted))
+		return;
+
+	resp->flags |= USB_PD_MUX_HPD_LVL;
+}
+
 static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
 				struct ec_response_usb_pd_control_v2 *pd_ctrl)
 {
@@ -682,6 +795,8 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
 			 port_num, ret);
 		return ret;
 	}
+	cros_typec_check_dp(typec, &resp, port);
+	cros_typec_inject_hpd(typec, &resp, port);
 
 	/* No change needs to be made, let's exit early. */
 	if (port->mux_flags == resp.flags && port->role == pd_ctrl->role)
diff --git a/drivers/platform/chrome/cros_ec_typec.h b/drivers/platform/chrome/cros_ec_typec.h
index 090f8f5c0492..b4b331aa5dc7 100644
--- a/drivers/platform/chrome/cros_ec_typec.h
+++ b/drivers/platform/chrome/cros_ec_typec.h
@@ -6,6 +6,7 @@
 #include <linux/list.h>
 #include <linux/notifier.h>
 #include <linux/platform_data/cros_ec_proto.h>
+#include <linux/types.h>
 #include <linux/usb/pd.h>
 #include <linux/usb/role.h>
 #include <linux/usb/typec.h>
@@ -88,6 +89,19 @@ struct cros_typec_port {
 
 struct cros_typec_dp_bridge {
 	struct drm_bridge bridge;
+	struct cros_typec_data *typec_data;
+	struct gpio_desc *mux_gpio;
+	DECLARE_BITMAP(hpd_asserted, EC_USB_PD_MAX_PORTS);
 };
 
+static inline struct cros_typec_dp_bridge *
+bridge_to_cros_typec_dp_bridge(struct drm_bridge *bridge)
+{
+	return container_of(bridge, struct cros_typec_dp_bridge, bridge);
+}
+
+void cros_typec_check_dp(struct cros_typec_data *typec,
+			 struct ec_response_usb_pd_mux_info *resp,
+			 struct cros_typec_port *port);
+
 #endif /*  __CROS_EC_TYPEC__ */
diff --git a/drivers/platform/chrome/cros_typec_altmode.c b/drivers/platform/chrome/cros_typec_altmode.c
index 97ca4cfabbc0..10d21da592f1 100644
--- a/drivers/platform/chrome/cros_typec_altmode.c
+++ b/drivers/platform/chrome/cros_typec_altmode.c
@@ -82,6 +82,7 @@ static int cros_typec_altmode_enter(struct typec_altmode *alt, u32 *vdo)
 		if (ret < 0)
 			return ret;
 
+		cros_typec_check_dp(adata->port->typec_data, &resp, adata->port);
 		if (!(resp.flags & flags))
 			return -EINVAL;
 	} else {
@@ -147,6 +148,7 @@ static int cros_typec_altmode_exit(struct typec_altmode *alt)
 		if (ret < 0)
 			return ret;
 
+		cros_typec_check_dp(adata->port->typec_data, &resp, adata->port);
 		if (resp.flags & flags)
 			return -EINVAL;
 	} else {
-- 
https://chromeos.dev


