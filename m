Return-Path: <linux-arm-msm+bounces-106979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MN8vEWANAmpSngEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 19:09:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A185131AE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 19:09:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BF2B430EEE41
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 16:42:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C50B9453482;
	Mon, 11 May 2026 16:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="TywpEAD7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3067D450906;
	Mon, 11 May 2026 16:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778517644; cv=none; b=L9fd8Hm2lv1AOfqc6OXl0YutSs7IumU88YKYCr9xodQZw7RmddScBDO7trHyt2EKaKFM857I6NzRknwL7R/83agzWRhZcpoEXz9Txoyh7U9GUlJM6L78m54ppIMlhy3+I7Hg2FYgB22IXWqIPr0RLYEDQ2nWLWVfQti5KcTTv7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778517644; c=relaxed/simple;
	bh=lce+aTTRLhf1XWWeSc0EFw29OaFv8KqBsBL1+8mD/mM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sLpCe/jMr7R7dAU4A+x/imuNFj28M0jDsNTqfdRse3R6hcJNuXT8B7B8UCSOmmGMJFNZSvkTaK/LlhvVmav8GKA+q7ukAS/dA9eLD4jP8DMVfWFhlqN1eEe3Nu8OQkg5xm78QtbLDigxTduIihwu82dqjxYMi3sAu+4qYqKmfU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TywpEAD7; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8AF4FC5E154;
	Mon, 11 May 2026 16:41:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EF8E760646;
	Mon, 11 May 2026 16:40:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 26AF211AF9F70;
	Mon, 11 May 2026 18:40:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778517640; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=695tIBtiGj0Zt5p+JSC1oz7b/RdXY/fqVD2MgB83H7c=;
	b=TywpEAD7Uo6nhAi0zlkPDokGJfN0z9RNpa71Y1ZzG9CIbCN9beeMSWqlofXm4mahl1HHOR
	cDTQJNzwT7j8gJ2n3cyGpa6OVDH7w7Qh8vhmpjgnZ6x4+31EdtzESYLyfb9otJF5Di06xl
	6+LFcCA6Zg7KxP1r4sc3YI1sL3W2AhAtTff+5f2pLoH1YbJC83ZgKf5TbSvG1hoja4Hc6Z
	PTnpkk6B5wG1Udpyl49oxtlyIUBF4NXjvyCvICFYm/zZ9oEtuI+zO2EMz/21aqtWZapHE6
	jLvQ1NQETLUODEEBs/lA4EEKlM2qLFlnuyHUhTgo04hHF/492BLWrktCr8XRdQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon, 11 May 2026 18:40:07 +0200
Subject: [PATCH v6 03/11] drm/msm/hdmi: switch to
 of_drm_get_bridge_by_endpoint()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-drm-bridge-alloc-getput-panel_or_bridge-v6-3-f61c9e498b3f@bootlin.com>
References: <20260511-drm-bridge-alloc-getput-panel_or_bridge-v6-0-f61c9e498b3f@bootlin.com>
In-Reply-To: <20260511-drm-bridge-alloc-getput-panel_or_bridge-v6-0-f61c9e498b3f@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, John Stultz <jstultz@google.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 85A185131AE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106979-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,google.com,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

This driver calls drm_of_find_panel_or_bridge() with a NULL pointer in the
@panel parameter, thus using a reduced feature set of that function.
Replace this call with the simpler of_drm_get_bridge_by_endpoint().

Since of_drm_get_bridge_by_endpoint() increases the refcount of the
returned bridge, ensure it is put on removal.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v6:
- move assignment of next_bridge earlier (avoid access before assignment)

Changes in v5:
- simplify error management code flow

Changes in v4:
- ensure next_bridge is put on later probe failures

Changes in v3:
- fix ERR_PTR deref when -ENODEV is returned

- move assignment of next_bridge earlier (avoid access before assignment)
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 70 +++++++++++++++++++++++++++--------------
 1 file changed, 47 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index d9491aac1a89..474006084633 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -285,19 +285,27 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
 	spin_lock_init(&hdmi->reg_lock);
 	mutex_init(&hdmi->state_mutex);
 
-	ret = drm_of_find_panel_or_bridge(dev_of_node(dev), 1, 0, NULL, &hdmi->next_bridge);
-	if (ret && ret != -ENODEV)
-		return ret;
+	hdmi->next_bridge = of_drm_get_bridge_by_endpoint(dev_of_node(dev), 1, 0);
+	if (IS_ERR(hdmi->next_bridge)) {
+		if (PTR_ERR(hdmi->next_bridge) != -ENODEV)
+			return PTR_ERR(hdmi->next_bridge);
+
+		hdmi->next_bridge = NULL;
+	}
 
 	hdmi->mmio = msm_ioremap(pdev, "core_physical");
-	if (IS_ERR(hdmi->mmio))
-		return PTR_ERR(hdmi->mmio);
+	if (IS_ERR(hdmi->mmio)) {
+		ret = PTR_ERR(hdmi->mmio);
+		goto err_put_bridge;
+	}
 
 	/* HDCP needs physical address of hdmi register */
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
 		"core_physical");
-	if (!res)
-		return -EINVAL;
+	if (!res) {
+		ret = -EINVAL;
+		goto err_put_bridge;
+	}
 	hdmi->mmio_phy_addr = res->start;
 
 	hdmi->qfprom_mmio = msm_ioremap(pdev, "qfprom_physical");
@@ -307,45 +315,58 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
 	}
 
 	hdmi->irq = platform_get_irq(pdev, 0);
-	if (hdmi->irq < 0)
-		return hdmi->irq;
+	if (hdmi->irq < 0) {
+		ret = hdmi->irq;
+		goto err_put_bridge;
+	}
 
 	hdmi->pwr_regs = devm_kcalloc(dev, config->pwr_reg_cnt,
 				      sizeof(hdmi->pwr_regs[0]),
 				      GFP_KERNEL);
-	if (!hdmi->pwr_regs)
-		return -ENOMEM;
+	if (!hdmi->pwr_regs) {
+		ret = -ENOMEM;
+		goto err_put_bridge;
+	}
 
 	for (i = 0; i < config->pwr_reg_cnt; i++)
 		hdmi->pwr_regs[i].supply = config->pwr_reg_names[i];
 
 	ret = devm_regulator_bulk_get(dev, config->pwr_reg_cnt, hdmi->pwr_regs);
-	if (ret)
-		return dev_err_probe(dev, ret, "failed to get pwr regulators\n");
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to get pwr regulators\n");
+		goto err_put_bridge;
+	}
 
 	hdmi->pwr_clks = devm_kcalloc(dev, config->pwr_clk_cnt,
 				      sizeof(hdmi->pwr_clks[0]),
 				      GFP_KERNEL);
-	if (!hdmi->pwr_clks)
-		return -ENOMEM;
+	if (!hdmi->pwr_clks) {
+		ret = -ENOMEM;
+		goto err_put_bridge;
+	}
 
 	for (i = 0; i < config->pwr_clk_cnt; i++)
 		hdmi->pwr_clks[i].id = config->pwr_clk_names[i];
 
 	ret = devm_clk_bulk_get(dev, config->pwr_clk_cnt, hdmi->pwr_clks);
 	if (ret)
-		return ret;
+		goto err_put_bridge;
+
 
 	hdmi->extp_clk = devm_clk_get_optional(dev, "extp");
-	if (IS_ERR(hdmi->extp_clk))
-		return dev_err_probe(dev, PTR_ERR(hdmi->extp_clk),
-				     "failed to get extp clock\n");
+	if (IS_ERR(hdmi->extp_clk)) {
+		ret = dev_err_probe(dev, PTR_ERR(hdmi->extp_clk),
+				    "failed to get extp clock\n");
+		goto err_put_bridge;
+	}
 
 	hdmi->hpd_gpiod = devm_gpiod_get_optional(dev, "hpd", GPIOD_IN);
 	/* This will catch e.g. -EPROBE_DEFER */
-	if (IS_ERR(hdmi->hpd_gpiod))
-		return dev_err_probe(dev, PTR_ERR(hdmi->hpd_gpiod),
-				     "failed to get hpd gpio\n");
+	if (IS_ERR(hdmi->hpd_gpiod)) {
+		ret = dev_err_probe(dev, PTR_ERR(hdmi->hpd_gpiod),
+				    "failed to get hpd gpio\n");
+		goto err_put_bridge;
+	}
 
 	if (!hdmi->hpd_gpiod)
 		DBG("failed to get HPD gpio");
@@ -355,7 +376,7 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
 
 	ret = msm_hdmi_get_phy(hdmi);
 	if (ret)
-		return ret;
+		goto err_put_bridge;
 
 	ret = devm_pm_runtime_enable(dev);
 	if (ret)
@@ -371,6 +392,8 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
 
 err_put_phy:
 	msm_hdmi_put_phy(hdmi);
+err_put_bridge:
+	drm_bridge_put(hdmi->next_bridge);
 	return ret;
 }
 
@@ -381,6 +404,7 @@ static void msm_hdmi_dev_remove(struct platform_device *pdev)
 	component_del(&pdev->dev, &msm_hdmi_ops);
 
 	msm_hdmi_put_phy(hdmi);
+	drm_bridge_put(hdmi->next_bridge);
 }
 
 static int msm_hdmi_runtime_suspend(struct device *dev)

-- 
2.54.0


