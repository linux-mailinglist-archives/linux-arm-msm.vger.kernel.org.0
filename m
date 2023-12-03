Return-Path: <linux-arm-msm+bounces-3137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0AB80236C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 12:44:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E37F280C62
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 11:44:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E39414F8B;
	Sun,  3 Dec 2023 11:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gLkM0epy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DF3F129
	for <linux-arm-msm@vger.kernel.org>; Sun,  3 Dec 2023 03:43:40 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2c9fbb846b7so2806781fa.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Dec 2023 03:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701603818; x=1702208618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nMbl5DaTa88R8QWO3ldLiDu8WUCRErATauR7weFBowc=;
        b=gLkM0epy4TjTQ9rb/vv4KeugA58TmsM4mCO4x+qTPxUA3pANQb3DcprRYlyGiDO1AX
         V5WahZR7/egHbo5osT+YqIJhLNczkD6aXTX3okTp2jDYqD+iB23nQ/OolXklHNBSY6OW
         FPdmanhvgJlJw0mglXcaXWGcoc5IsD7jrlcFiK1zF+zzR0N6FazmS1e6GvtMD3nEIS3G
         FA39cgaoWx4pTmm6jDOq/6T/Rq7K7wmDKCudcUQyIazLTtf2cRmuoEtC/zQFqN8L+SwN
         jUp0bIyhXNYIw6AUVNHFpnnFUI1da414mVcsNp4YxNiCunsFZmj8ib8TZvMzUNRxlfY/
         nNyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701603818; x=1702208618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nMbl5DaTa88R8QWO3ldLiDu8WUCRErATauR7weFBowc=;
        b=Kh+W4WcELtGCFUu8kVD2I4e/qSFlbTXjvd2SbM3BeFsAc6712ebeAYB6Z+mlrr1zEH
         yJN1/slo5sIr9SiBX3tVc3RAziVPLc511kgL0+drd7ss7H++R3kF4hcXFylGsEePHosn
         Jm7jt+E7A4LILJ+gMz7M74qBIGCc1PXVHAqqkJKhJyJYfyggrtXv2HM/DaJte9hal8Dk
         RcA96R1ahG4ET0Hp8kaXj7eE9ywbN2T5Q6Oe9+7LaWDWhZ/+YZr3TI5GP32qlDKR5xd2
         mSyHHpfPnuqMxqAmF184S8b1LXblH+5oilOQxni+JSu8bs4I3WHEKmhTXxqdB+S9eq5y
         CXVA==
X-Gm-Message-State: AOJu0YxRKWuTmO+JT48H7dkJrzVZRgaNb1wrGqr3fnrv0Gci9cl4Cihv
	DCu9aUH8z2oeKD/nKL2iDoRUNg==
X-Google-Smtp-Source: AGHT+IEtNxbenURZmP44FrTsCAp4qsFXzlCNtSFg4IQrY95AVawx5eoI5ZiIRm8LT7R6121km753XQ==
X-Received: by 2002:a2e:9d17:0:b0:2c9:fa34:332d with SMTP id t23-20020a2e9d17000000b002c9fa34332dmr220397lji.12.1701603818621;
        Sun, 03 Dec 2023 03:43:38 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id o17-20020a2e90d1000000b002c993c5d4c6sm894666ljg.105.2023.12.03.03.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 03:43:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Janne Grunau <j@jannau.net>,
	Simon Ser <contact@emersion.fr>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH RESEND 5/6] soc: qcom: pmic-glink: switch to DRM_AUX_HPD_BRIDGE
Date: Sun,  3 Dec 2023 14:43:32 +0300
Message-Id: <20231203114333.1305826-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231203114333.1305826-1-dmitry.baryshkov@linaro.org>
References: <20231203114333.1305826-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the freshly defined DRM_AUX_HPD_BRIDGE instead of open-coding the
same functionality for the DRM bridge chain termination.

Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Acked-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/soc/qcom/Kconfig              |  1 +
 drivers/soc/qcom/pmic_glink_altmode.c | 33 ++++++++-------------------
 2 files changed, 10 insertions(+), 24 deletions(-)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index b3634e10f6f5..c954001ae79e 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -86,6 +86,7 @@ config QCOM_PMIC_GLINK
 	depends on OF
 	select AUXILIARY_BUS
 	select QCOM_PDR_HELPERS
+	select DRM_AUX_HPD_BRIDGE
 	help
 	  The Qualcomm PMIC GLINK driver provides access, over GLINK, to the
 	  USB and battery firmware running on one of the coprocessors in
diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index b78279e2f54c..053b7393e26a 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -11,7 +11,7 @@
 #include <linux/mutex.h>
 #include <linux/property.h>
 #include <linux/soc/qcom/pdr.h>
-#include <drm/drm_bridge.h>
+#include <drm/bridge/aux-bridge.h>
 
 #include <linux/usb/typec_altmode.h>
 #include <linux/usb/typec_dp.h>
@@ -76,7 +76,7 @@ struct pmic_glink_altmode_port {
 
 	struct work_struct work;
 
-	struct drm_bridge bridge;
+	struct device *bridge;
 
 	enum typec_orientation orientation;
 	u16 svid;
@@ -230,10 +230,10 @@ static void pmic_glink_altmode_worker(struct work_struct *work)
 	else
 		pmic_glink_altmode_enable_usb(altmode, alt_port);
 
-	if (alt_port->hpd_state)
-		drm_bridge_hpd_notify(&alt_port->bridge, connector_status_connected);
-	else
-		drm_bridge_hpd_notify(&alt_port->bridge, connector_status_disconnected);
+	drm_aux_hpd_bridge_notify(alt_port->bridge,
+				  alt_port->hpd_state ?
+				  connector_status_connected :
+				  connector_status_disconnected);
 
 	pmic_glink_altmode_request(altmode, ALTMODE_PAN_ACK, alt_port->index);
 };
@@ -365,16 +365,6 @@ static void pmic_glink_altmode_callback(const void *data, size_t len, void *priv
 	}
 }
 
-static int pmic_glink_altmode_attach(struct drm_bridge *bridge,
-				     enum drm_bridge_attach_flags flags)
-{
-	return flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR ? 0 : -EINVAL;
-}
-
-static const struct drm_bridge_funcs pmic_glink_altmode_bridge_funcs = {
-	.attach = pmic_glink_altmode_attach,
-};
-
 static void pmic_glink_altmode_put_retimer(void *data)
 {
 	typec_retimer_put(data);
@@ -464,15 +454,10 @@ static int pmic_glink_altmode_probe(struct auxiliary_device *adev,
 		alt_port->index = port;
 		INIT_WORK(&alt_port->work, pmic_glink_altmode_worker);
 
-		alt_port->bridge.funcs = &pmic_glink_altmode_bridge_funcs;
-		alt_port->bridge.of_node = to_of_node(fwnode);
-		alt_port->bridge.ops = DRM_BRIDGE_OP_HPD;
-		alt_port->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
-
-		ret = devm_drm_bridge_add(dev, &alt_port->bridge);
-		if (ret) {
+		alt_port->bridge = drm_dp_hpd_bridge_register(dev, to_of_node(fwnode));
+		if (IS_ERR(alt_port->bridge)) {
 			fwnode_handle_put(fwnode);
-			return ret;
+			return PTR_ERR(alt_port->bridge);
 		}
 
 		alt_port->dp_alt.svid = USB_TYPEC_DP_SID;
-- 
2.39.2


