Return-Path: <linux-arm-msm+bounces-21744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BD28FCB40
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 13:56:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1946B282C31
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 11:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC2CD19AD81;
	Wed,  5 Jun 2024 11:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="srSLjOHJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8865919885B;
	Wed,  5 Jun 2024 11:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717588226; cv=none; b=OWLvvORgEX5eYV+fmZZG8IpwfzxVVwtqofGDuBKQwFYR0E6OGPcXknNMRd2+zpx7tOzpXGtCtvXGDp6ve7/UgLcPk1ZP30t00MO7J+dizY+uq5mk8D41uUbSRxkpjJ2ErvlZFhab+1wWtrit/y8rhiqSDOUpsuA3YJaNc2arvrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717588226; c=relaxed/simple;
	bh=k9wMZie2g8zido3r8l4XxgOwAvQm8nitQZP1EAGITQo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MrUImC5OpCr8CX9WRbOoj/IhAwRdXjx/sMvIBqVK471xZzmi+U3/vYPjvcOiAJPpecz4obEmPNCix5vmmEQ9dTH5iTgpsmASemjWwFM+ab46ZBVtdHAF+0ZvQ88cjMCtLlIkRKTWfPsOqN5nIpWuL/1F8+TNFLXsFoHZIxZdsH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=srSLjOHJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6686C32781;
	Wed,  5 Jun 2024 11:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717588226;
	bh=k9wMZie2g8zido3r8l4XxgOwAvQm8nitQZP1EAGITQo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=srSLjOHJPV5k+Ehbe7IXYhch/SaoMiisFIobMaX3hHfYkqH8syKfSI390h2AeFDVV
	 2Lvb+4sqSgaLC4vGoSWUHvPy7A4cperkpQtbTJCBRsRYh6vwuqg6+3Za24tCewtH6l
	 aj01P70pxm25gAqCiuzKxt48wB1VhDk8lx2Dis9UsX/PeBxMWSTqMUGz5AxxJ2naZz
	 09Gf+U3pFrduu/Lp55vUXz1D+rehjevzHgrf3V9lfJ4giA+C9LW8kMImmxFuschxyq
	 XLpvkoHFKT7WXHZzEAFdV35kYsx8vH0mE+OoKPoP9QK9aY6mHETLQyZbHmlb3pfqfW
	 ZO7geDPqlin/Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 6.9 24/28] usb: typec: qcom-pmic-typec: split HPD bridge alloc and registration
Date: Wed,  5 Jun 2024 07:48:53 -0400
Message-ID: <20240605114927.2961639-24-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240605114927.2961639-1-sashal@kernel.org>
References: <20240605114927.2961639-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.9.3
Content-Transfer-Encoding: 8bit

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

[ Upstream commit 718b36a7b49acbba36546371db2d235271ceb06c ]

If a probe function returns -EPROBE_DEFER after creating another device
there is a change of ending up in a probe deferral loop, (see commit
fbc35b45f9f6 ("Add documentation on meaning of -EPROBE_DEFER"). In case
of the qcom-pmic-typec driver the tcpm_register_port() function looks up
external resources (USB role switch and inherently via called
typec_register_port() USB-C muxes, switches and retimers).

In order to prevent such probe-defer loops caused by qcom-pmic-typec
driver, use the API added by Johan Hovold and move HPD bridge
registration to the end of the probe function.

The devm_drm_dp_hpd_bridge_add() is called at the end of the probe
function after all TCPM start functions. This is done as a way to
overcome a different problem, the DRM subsystem can not properly cope
with the DRM bridges being destroyed once the bridge is attached. Having
this function call at the end of the probe function prevents possible
DRM bridge device creation followed by destruction in case one of the
TCPM start functions returns an error.

Reported-by: Caleb Connolly <caleb.connolly@linaro.org>
Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Link: https://lore.kernel.org/r/20240424-qc-pmic-typec-hpd-split-v4-1-f7e10d147443@linaro.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
index d3958c061a972..501eddb294e43 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
@@ -41,7 +41,7 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
 	struct device_node *np = dev->of_node;
 	const struct pmic_typec_resources *res;
 	struct regmap *regmap;
-	struct device *bridge_dev;
+	struct auxiliary_device *bridge_dev;
 	u32 base;
 	int ret;
 
@@ -92,7 +92,7 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
 	if (!tcpm->tcpc.fwnode)
 		return -EINVAL;
 
-	bridge_dev = drm_dp_hpd_bridge_register(tcpm->dev, to_of_node(tcpm->tcpc.fwnode));
+	bridge_dev = devm_drm_dp_hpd_bridge_alloc(tcpm->dev, to_of_node(tcpm->tcpc.fwnode));
 	if (IS_ERR(bridge_dev))
 		return PTR_ERR(bridge_dev);
 
@@ -110,8 +110,14 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
 	if (ret)
 		goto port_stop;
 
+	ret = devm_drm_dp_hpd_bridge_add(tcpm->dev, bridge_dev);
+	if (ret)
+		goto pdphy_stop;
+
 	return 0;
 
+pdphy_stop:
+	tcpm->pdphy_stop(tcpm);
 port_stop:
 	tcpm->port_stop(tcpm);
 port_unregister:
-- 
2.43.0


