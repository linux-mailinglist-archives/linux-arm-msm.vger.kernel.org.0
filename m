Return-Path: <linux-arm-msm+bounces-78979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9648BC0F0F6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 16:53:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 15ADF4FB237
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 15:48:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 754C33148D0;
	Mon, 27 Oct 2025 15:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="smSMBJ7p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6209830DD36
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 15:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761579910; cv=none; b=D7MPceAJq8wz5LAtZ1GU1LMnbpfBE2y3yX/8xe41P7hjVArz00o51BAngoDG7Thsi4FjmcmQt7aBpKJLsFANffQxH5dGzWNYgwIayqtxtZ2nOo5qKe9Fj+HcNQKg6LGa9XhDYCSTA3PZzHnde9kF7B/GEUXuWmES0dp748dqRzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761579910; c=relaxed/simple;
	bh=ExojDb41iXZ/wPAxRGpSxEr0wf1BiXIiQyP4GRsSHFU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CzUXvcKe+hsN6MM5b4brQgc2lOh2FRdAnksU6fU3a2d/bJmIMp36SuiXIZp0iVwnX27SHIEmtmt9FWueZRlt5ESA66ygoCWIwL9v77YBjF674AZ8ibYBTGNENJz71R12W8rTy7D8AsAX10UTZaXPKhlB16MD+D83wNEu0CFLdfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=smSMBJ7p; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4710022571cso50493515e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 08:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761579905; x=1762184705; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hPXw61XXVZPE5iGSa5+dbW4T5B5jPT8r8QbZD1R689Y=;
        b=smSMBJ7pEVQfJ6mMOb4n+CQRWqClYewppcOiMOiFnpvzc6FFLwKEWhMchNbrwipxaJ
         fXu2BCc2WVGBVGgnZ9Igt7ArznAntpxdHxJbutzX7+VRFg1Rw3ewXOnHmNGPD2vP/sNm
         Mm3z85NHtw0u0wRfyzbw4lT0ZPci/BU/LTCwLNqiGoghQYy8Tmpbf4QaZ1ANfeu1RQk7
         OdloWMXMfaKx6Lr3D5PadOysQm113QAwu8ig0DiqX3vTEtF0eslS8T8b+AYt3UVmeg50
         49xk5MhIBQ/kS1QlArstm8gnuQhKq/hEU171yjlQmAo4bPuWjY8xqCUL1kVrjHpzAavw
         lg3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761579905; x=1762184705;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hPXw61XXVZPE5iGSa5+dbW4T5B5jPT8r8QbZD1R689Y=;
        b=qvxWGvkQaxX4fFphIoPs58BIIMdQf0MLbNam+skgytvSSnckfXuPhTAFtY2H0QNkL4
         6U5a2WnPICFXpm4X1+lu0cqwgKJ8OycinHBuVsxif9nzK4XCDI/NDi/81rRLcvGGdMTK
         +C27cplk5hGGObxJkvdGYjq7Z3iC5+M+OJ22DC67Y+xdvIwCcGRwk3jACw3sRU/SoLYT
         BuI0GQUOo21oSq//W137I8Pdn2v5G2DZ6YW/7WAjr3qc3v0dGAXj2ZbGh+1ZA94dBk8e
         HpXdOxn4DGdF9dg4NvFUIR3vXcnSBBb0Nxw1E+eo5zbo48nRyN3yWC25pgdx9l30gODN
         QVuA==
X-Gm-Message-State: AOJu0YzAYkJ6OJlr1DS7MMNi9CwkdAZDrmn86nl0/5EFuNOYjmqUwSZb
	Cdgw16Q8Vt8F09erxSKcJD9a4NIThYzRCPaNuyyTNVK3Sg52pagn1Gkf4xCM753QhS4=
X-Gm-Gg: ASbGncvbaV4cW2fGWT9ivW5zlyRDeEsKlCKEMw/IeSsst8fe3Lv0vk466F90SG2ewlI
	XF327c77J+D8TG3e8cnhtz4ZTKd925xdUw+0vZWf/QVQuMQ4cgUUG/OwBwlQ8PdW3i/M6WuXoSA
	QkaqHZ4Og18htjymX2+zZiOqIaCXcSuDQ62miQCgSRGKT4Af7GAkR+S4O2GDtDcov/Tg00Svxys
	XaUJ51m/AZD4+mMSs035sFQpuAbYSKRCSYKIrULB0q7HcqBqyFv6dMwAri5oaKY+l5kYxZygkUm
	TnqOXQkiY1OxXMeuHuESVmF6AT/W5Nl4huLdAf1SAR6K9Lj1TE/cpeTxI44J2GTzm3G0rVWkjjr
	lX0dvHNdxgYrxVYumCzv2cj1cOFUmfQVVnpaVjp7KLHorfdgXtl4aRC0q1kcdy0+wb+xBrFbM21
	/ZVo+PhA==
X-Google-Smtp-Source: AGHT+IEGeaS0+QG2Aha1NgT9BPrRrz4NonOWyil4rVeyKXTgBzuqvDLGB5Q4ZzRtF1NNuDSXdfB8XA==
X-Received: by 2002:a05:600c:45c7:b0:471:747:2116 with SMTP id 5b1f17b1804b1-47717e62ebdmr726945e9.41.1761579905524;
        Mon, 27 Oct 2025 08:45:05 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1c6:7dde:fe94:6881])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd477d0esm138708045e9.0.2025.10.27.08.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 08:45:04 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 27 Oct 2025 16:44:50 +0100
Subject: [PATCH v3 2/8] net: stmmac: qcom-ethqos: use generic device
 properties
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-qcom-sa8255p-emac-v3-2-75767b9230ab@linaro.org>
References: <20251027-qcom-sa8255p-emac-v3-0-75767b9230ab@linaro.org>
In-Reply-To: <20251027-qcom-sa8255p-emac-v3-0-75767b9230ab@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2896;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=vnoFLVrcb6l7nKIGlK4OOB/YGlbBMeK7LkpWKpc+pc0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo/5N7HQYH3vFxPerzcQsvDYeZugsZRuhl7VhVy
 2Quu9L5hP6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaP+TewAKCRARpy6gFHHX
 csb+D/4hfQLnbDWWeEYALfZLjfvHcxj8QC1o1ijyYS0DGDMJ3ieET7R5s5vFXLyeidjo2LB6Tkh
 8xuNaYYnOMXK012RnFUcfWsqh9VA6dULq/Jec7Icz2SLCkvhUoOz1ECVU8P7/1HgscqZhmPhOrA
 OAVF7sMh5tRhWVl9KR89qFqaOsx3xtcKj1Irh465tlUbN0zClc5WMgPgXvHthIRPi0mT7evAzul
 0BFb8/NM0urZ3Ltl0bA7WAnBBi7dQFlTXlebiWRHr9tRKb1lRD3yOq+JZBOdi6YGlBRX7lPU9qh
 toxfr8G9uzCoO74mRZa3B4nfcbC3XPCMc5ElZCyAizNPH8G9poSOjBCbTIqCtm3liPTitgcCX9K
 Wato94CMw/zKGgD1iH7/PXuT9dUx9nVhoKh4HihhNHyhIFhdXusnBLB6Ef6t0UwNF6lxxZbmbG0
 sbFuan/mab3AyWEcHTXgY0kQWr61TRd61v7YFITF6W9l0sfwuHXbcDKUR8LRrP3dd4pr4IsNNwd
 a58xY/CshZ5B6P6t4DUaz27fECD5yhDvH1034dCAf5VZCUSjfXtpsLy/nyoaZsZXDJsYSQARDry
 sMsM1CFH/f6CYRh1vjyNCQgrB0KaYJGp7Iwc31evTSdVWgJzwY4Ou/YG7ueRtt4DzQU4AZaAjgA
 sickoFDA15UyOgg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

In order to drop the dependency on CONFIG_OF, convert all device property
getters from OF-specific to generic device properties and stop pulling
in any linux/of.h symbols.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig             | 2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 9 ++++-----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index 716daa51df7e50e401e2c2ca305055dc52897793..d27733b8a05a393ce356543c799da18a6d9b9083 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -134,7 +134,7 @@ config DWMAC_MESON
 config DWMAC_QCOM_ETHQOS
 	tristate "Qualcomm ETHQOS support"
 	default ARCH_QCOM
-	depends on OF && (ARCH_QCOM || COMPILE_TEST)
+	depends on ARCH_QCOM || COMPILE_TEST
 	help
 	  Support for the Qualcomm ETHQOS core.
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index d1e48b524d7a964f229e2bf28e7a316325726193..b24134923fdff0de8b608c140dfb8ffaccd19303 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2018-19, Linaro Limited
 
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/of_net.h>
 #include <linux/platform_device.h>
 #include <linux/phy.h>
@@ -762,7 +762,6 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node;
 	const struct ethqos_emac_driver_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
@@ -813,7 +812,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 	ethqos->mac_base = stmmac_res.addr;
 
-	data = of_device_get_match_data(dev);
+	data = device_get_match_data(dev);
 	ethqos->por = data->por;
 	ethqos->num_por = data->num_por;
 	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
@@ -850,9 +849,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (ethqos->has_emac_ge_3)
 		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
 	plat_dat->pmt = 1;
-	if (of_property_read_bool(np, "snps,tso"))
+	if (device_property_present(dev, "snps,tso"))
 		plat_dat->flags |= STMMAC_FLAG_TSO_EN;
-	if (of_device_is_compatible(np, "qcom,qcs404-ethqos"))
+	if (device_is_compatible(dev, "qcom,qcs404-ethqos"))
 		plat_dat->flags |= STMMAC_FLAG_RX_CLK_RUNS_IN_LPI;
 	if (data->dma_addr_width)
 		plat_dat->host_dma_width = data->dma_addr_width;

-- 
2.48.1


