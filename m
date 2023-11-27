Return-Path: <linux-arm-msm+bounces-2131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 242577FA53E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 16:52:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D0F6F28174C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 15:52:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 233C734CD3;
	Mon, 27 Nov 2023 15:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hEJ9T6vl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F04C6D5A
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 07:52:34 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a00c200782dso642615766b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 07:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701100353; x=1701705153; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nr05hrGkuwY0DK8aGF98uretWKGuiZWVGVkXoVNznFQ=;
        b=hEJ9T6vlLFeLoKzEN9giyFjhRxFnttJoX9wqPfCkc4i35yb9e0C34LSYvT1XwY1CP8
         /Qch3PeMq6QYMqgCvqxPfDaFirpq+p6pQq+1RjYwAsWRC0qjf3YJ2VWlpsu1ULe4TXsV
         gdy7OJANGa+7/iggFyg8oq18s6WLgmSp2meivvwUtfSVKWHCOrOY1/kpOIqDTr1bgfRB
         HiAMH3JWEnBKqYr0exaDmLyhWCzWpV67G7tZBQ4e2EYTj0SN7R5mMGfdEA0Zs/ViKSuG
         H7YAGfgGXxEJRmNPGp4peaJah6PlQNTQQ2jXNFbMrBjkE168vpzJypSVEKf5mvzY+WFz
         L0Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701100353; x=1701705153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nr05hrGkuwY0DK8aGF98uretWKGuiZWVGVkXoVNznFQ=;
        b=gXflmDmfYTkKe93v+iJOagezaWDh4gRVQkHoQsq6v/RI0yiLa4HRysm2h3vkTbdldS
         B6fc6c8U70DOnkL395fyj/YEfiwYyqucccOySXN0WyQdYrYWug/GSwOGe85DSDa/Njxn
         V4OU0qBJxHVr9r3ov05RXt5wUpKSK+dcKqu8Nv4p5oVlE4Mj7HmqU8YyBzRc1nX0s0r0
         hm94O8WmD3+r+IS4SOXUKN3WzoXk+cUUgV2DLgaYLq6EW98YtFnOqkxiEaGGaB2XjmZZ
         OB4KE2w411nNV/1KPDJ6Q+5lj+Rvy96xkfjxyHOcM+BMAsudj2znBNatzOigULYzaUHa
         rUIQ==
X-Gm-Message-State: AOJu0Yyw84KOxDsHoB+IDxYHORjmDqHnM5DlFrYJL16g/Ik0CPpSHJAh
	viJcScJbQxrnd2kjkbK6u/YxqbQOKa10WohE3Jk=
X-Google-Smtp-Source: AGHT+IEkZqbakDX6RaUQMrgNoB1fjuVjSjnDF0xLT5VTu9acxiYeOJPI7DIGLRk8T+aAMsn2tYqiwQ==
X-Received: by 2002:a17:906:66c1:b0:9ff:77c2:e67f with SMTP id k1-20020a17090666c100b009ff77c2e67fmr8380126ejp.33.1701100353110;
        Mon, 27 Nov 2023 07:52:33 -0800 (PST)
Received: from [10.167.154.1] (178235187180.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.180])
        by smtp.gmail.com with ESMTPSA id mb22-20020a170906eb1600b009fc0c42098csm5855150ejb.173.2023.11.27.07.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 07:52:32 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 27 Nov 2023 16:52:13 +0100
Subject: [PATCH v7 2/2] irqchip: irq-qcom-mpm: Support passing a slice of
 SRAM as reg space
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230328-topic-msgram_mpm-v7-2-6ee2bfeaac2c@linaro.org>
References: <20230328-topic-msgram_mpm-v7-0-6ee2bfeaac2c@linaro.org>
In-Reply-To: <20230328-topic-msgram_mpm-v7-0-6ee2bfeaac2c@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Shawn Guo <shawn.guo@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701100347; l=2888;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=xv+mWCEly/nIv85AR5MmmU/wkLvnOBn7Ei5h/U9JNy0=;
 b=d0wDKn96S5wPzxqpjV9SfTtHRQKUGg0oVkzShzFNVW58PHwEZQNEFHHiBEflYbkWgBSJY96Bo
 dermZgeioXjBYae0UzHuHrS04+dp0cFDYzidoyvkZUuBtBTXjCOdJO1
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

The MPM hardware is accessible to us from the ARM CPUs through a shared
memory region (RPM MSG RAM) that's also concurrently accessed by other
kinds of cores on the system (like modem, ADSP etc.). Modeling this
relation in a (somewhat) sane manner in the device tree basically
requires us to either present the MPM as a child of said memory region
(which makes little sense, as a mapped memory carveout is not a bus),
define nodes which bleed their register spaces into one another, or
passing their slice of the MSG RAM through some kind of a property.

Go with the third option and add a way to map a region passed through
the "qcom,rpm-msg-ram" property as our register space.

The current way of using 'reg' is preserved for ABI reasons.

Acked-by: Shawn Guo <shawn.guo@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/irqchip/irq-qcom-mpm.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-qcom-mpm.c b/drivers/irqchip/irq-qcom-mpm.c
index 7124565234a5..cda5838d2232 100644
--- a/drivers/irqchip/irq-qcom-mpm.c
+++ b/drivers/irqchip/irq-qcom-mpm.c
@@ -14,6 +14,7 @@
 #include <linux/mailbox_client.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
@@ -322,8 +323,10 @@ static int qcom_mpm_init(struct device_node *np, struct device_node *parent)
 	struct device *dev = &pdev->dev;
 	struct irq_domain *parent_domain;
 	struct generic_pm_domain *genpd;
+	struct device_node *msgram_np;
 	struct qcom_mpm_priv *priv;
 	unsigned int pin_cnt;
+	struct resource res;
 	int i, irq;
 	int ret;
 
@@ -374,9 +377,26 @@ static int qcom_mpm_init(struct device_node *np, struct device_node *parent)
 
 	raw_spin_lock_init(&priv->lock);
 
-	priv->base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(priv->base))
-		return PTR_ERR(priv->base);
+	/* If we have a handle to an RPM message ram partition, use it. */
+	msgram_np = of_parse_phandle(np, "qcom,rpm-msg-ram", 0);
+	if (msgram_np) {
+		ret = of_address_to_resource(msgram_np, 0, &res);
+		if (ret) {
+			of_node_put(msgram_np);
+			return ret;
+		}
+
+		/* Don't use devm_ioremap_resource, as we're accessing a shared region. */
+		priv->base = devm_ioremap(dev, res.start, resource_size(&res));
+		of_node_put(msgram_np);
+		if (IS_ERR(priv->base))
+			return PTR_ERR(priv->base);
+	} else {
+		/* Otherwise, fall back to simple MMIO. */
+		priv->base = devm_platform_ioremap_resource(pdev, 0);
+		if (IS_ERR(priv->base))
+			return PTR_ERR(priv->base);
+	}
 
 	for (i = 0; i < priv->reg_stride; i++) {
 		qcom_mpm_write(priv, MPM_REG_ENABLE, i, 0);

-- 
2.43.0


