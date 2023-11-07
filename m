Return-Path: <linux-arm-msm+bounces-72-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 229B27E3CE3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 13:21:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9BD95B20C60
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 12:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 620162FE0F;
	Tue,  7 Nov 2023 12:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WWF9uDSG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458CE2E65B
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 12:21:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 299BCC433CB;
	Tue,  7 Nov 2023 12:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699359676;
	bh=3dYMFclV7U3X0PDEb492CafxGf4JqQpklY/xi0vWZWk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WWF9uDSGhbBFfeEssCB/JHOkxRygfA8oDoxA+wXu0jxwlmMmdjKpw8oijm1aJJ25x
	 eSTnJ2lU1b3GYfFpZlewwf60HipQycRg5KQG5KX8G9ZrgPivUNnKwG7b895TsNCzkF
	 YuljHWeEt/ER2unyRZqIxNnO55Qjm+J3mJhWaW6MQ/ph1kIXcxflwws1NW4ejfDMra
	 /w8bR05TJH0xZPh9XWRpUwK17Uf3rmZL2pkPb1Z8iIuQQEWav9DyzoIwf/QsYTwlCP
	 0wspi4xI46NrGpGgzt8sAf1yTgXMKf1FmdQcUPgezuRrnA7shKhfMH1KftuTqiufdb
	 aFmoccTh+27HQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Lu Hongfei <luhongfei@vivo.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	agross@kernel.org,
	konrad.dybcio@linaro.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 35/40] soc: qcom: pmic: Fix resource leaks in a device_for_each_child_node() loop
Date: Tue,  7 Nov 2023 07:16:37 -0500
Message-ID: <20231107121837.3759358-35-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107121837.3759358-1-sashal@kernel.org>
References: <20231107121837.3759358-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6
Content-Transfer-Encoding: 8bit

From: Lu Hongfei <luhongfei@vivo.com>

[ Upstream commit 5692aeea5bcb9331e956628c3bc8fc9afcc9765d ]

The device_for_each_child_node loop should call fwnode_handle_put()
before return in the error cases, to avoid resource leaks.

Let's fix this bug in pmic_glink_altmode_probe().

Signed-off-by: Lu Hongfei <luhongfei@vivo.com>
Link: https://lore.kernel.org/r/20230612133452.47315-1-luhongfei@vivo.com
[bjorn: Rebased patch, moved fw_handle_put() from jump target into the loop]
Signed-off-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/soc/qcom/pmic_glink_altmode.c | 30 ++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index d05e0d6edf493..9569d999391d1 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -444,6 +444,7 @@ static int pmic_glink_altmode_probe(struct auxiliary_device *adev,
 		ret = fwnode_property_read_u32(fwnode, "reg", &port);
 		if (ret < 0) {
 			dev_err(dev, "missing reg property of %pOFn\n", fwnode);
+			fwnode_handle_put(fwnode);
 			return ret;
 		}
 
@@ -454,6 +455,7 @@ static int pmic_glink_altmode_probe(struct auxiliary_device *adev,
 
 		if (altmode->ports[port].altmode) {
 			dev_err(dev, "multiple connector definition for port %u\n", port);
+			fwnode_handle_put(fwnode);
 			return -EINVAL;
 		}
 
@@ -468,45 +470,59 @@ static int pmic_glink_altmode_probe(struct auxiliary_device *adev,
 		alt_port->bridge.type = DRM_MODE_CONNECTOR_USB;
 
 		ret = devm_drm_bridge_add(dev, &alt_port->bridge);
-		if (ret)
+		if (ret) {
+			fwnode_handle_put(fwnode);
 			return ret;
+		}
 
 		alt_port->dp_alt.svid = USB_TYPEC_DP_SID;
 		alt_port->dp_alt.mode = USB_TYPEC_DP_MODE;
 		alt_port->dp_alt.active = 1;
 
 		alt_port->typec_mux = fwnode_typec_mux_get(fwnode);
-		if (IS_ERR(alt_port->typec_mux))
+		if (IS_ERR(alt_port->typec_mux)) {
+			fwnode_handle_put(fwnode);
 			return dev_err_probe(dev, PTR_ERR(alt_port->typec_mux),
 					     "failed to acquire mode-switch for port: %d\n",
 					     port);
+		}
 
 		ret = devm_add_action_or_reset(dev, pmic_glink_altmode_put_mux,
 					       alt_port->typec_mux);
-		if (ret)
+		if (ret) {
+			fwnode_handle_put(fwnode);
 			return ret;
+		}
 
 		alt_port->typec_retimer = fwnode_typec_retimer_get(fwnode);
-		if (IS_ERR(alt_port->typec_retimer))
+		if (IS_ERR(alt_port->typec_retimer)) {
+			fwnode_handle_put(fwnode);
 			return dev_err_probe(dev, PTR_ERR(alt_port->typec_retimer),
 					     "failed to acquire retimer-switch for port: %d\n",
 					     port);
+		}
 
 		ret = devm_add_action_or_reset(dev, pmic_glink_altmode_put_retimer,
 					       alt_port->typec_retimer);
-		if (ret)
+		if (ret) {
+			fwnode_handle_put(fwnode);
 			return ret;
+		}
 
 		alt_port->typec_switch = fwnode_typec_switch_get(fwnode);
-		if (IS_ERR(alt_port->typec_switch))
+		if (IS_ERR(alt_port->typec_switch)) {
+			fwnode_handle_put(fwnode);
 			return dev_err_probe(dev, PTR_ERR(alt_port->typec_switch),
 					     "failed to acquire orientation-switch for port: %d\n",
 					     port);
+		}
 
 		ret = devm_add_action_or_reset(dev, pmic_glink_altmode_put_switch,
 					       alt_port->typec_switch);
-		if (ret)
+		if (ret) {
+			fwnode_handle_put(fwnode);
 			return ret;
+		}
 	}
 
 	altmode->client = devm_pmic_glink_register_client(dev,
-- 
2.42.0


