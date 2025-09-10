Return-Path: <linux-arm-msm+bounces-72919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFBEB510DF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 10:16:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 918547BE5BE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 08:10:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3ED530F943;
	Wed, 10 Sep 2025 08:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="SCkGzMAs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE343148AB
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 08:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757491687; cv=none; b=WygIwojZYcFs5Ks/jXtWUn37hHkvU+249495uCsr98uqgioa4Q/79wFQc4ishvdhl5Di4k4MU6WCLV5A3dWBX8HvMkIJ8WiXNhgwQNgAdjX/E2E0zgUctJfBOXag3tIBbW+Vu9tczIlH8ljLaNwWN8u8catihFjFwcPM01ddv68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757491687; c=relaxed/simple;
	bh=NKTMPnPBEN3JCEgCuFzVlb6Jno24tg0DVRR09XWDb2w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hBGmgjR9/niSJGLRcQjNH0mibL/Vkawm+TBYfICgo6PfNHSH93ZJ+hRQ+RMiIzk6QfY4cC3F23d8q3U8OBLA1dVJPNYP4oEHiVAG1AY4N2fXCld0TOEx49HmC0m5/ZlAfy6Z6dEYdhnjx+YPbJuaNZKNvSR8cbwY63aPsnbScu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=SCkGzMAs; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45cb6428c46so61008755e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 01:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757491684; x=1758096484; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CdoEjc5e7kQwXoL1Cm6IjPM2seG7Imvb9wLqalhk7Jo=;
        b=SCkGzMAsQFap2dIP0bebgFeHUi0m/8G8rGzTLS1qL5rkj+wWcrZ1ecgYCrR+/oX7ER
         CG6yLimcUUus8b5W3ldaQEAvHwTyjzRBcfR+ZVFoHFeLsOoy/88Iu1qAmC2dLNOoi/bM
         iosxic+/1pMYBowPPiT5a6hrZMuq0dXcHog/5CHveuLF/hfN84l7SIebqacEglVNJ/Rm
         dROvzmhoBlqTwtpr8ehtCZwCTGjF4E3z7klInEe1ri5XC/ydp1Dlv+VBxaqQWytqBUA9
         rlLH+covD3C0Tck4/YoSGalPgfhZnNTS7NXjLibKCDzdKeP7izAPdxlRthsqNz+3ioqI
         QApw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757491684; x=1758096484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CdoEjc5e7kQwXoL1Cm6IjPM2seG7Imvb9wLqalhk7Jo=;
        b=cXgPxHteHHVCWrgo8MqepeyAH6wrtCep+O1U8hklDr+T+ku7PE/rOoCRUtoRvzWBFM
         381OX0Mmo3ldoUNyLKH70fXhEXmRVQcWU9sDIfpU7Xb8ezYTfVOYnME6RtAupk5KtJc/
         lbauMTFD2OWNpvYzAMhvbp+qaFoq87L5KmYvtrruOqWFsDpFzPseIoCurkslAcS0MtxW
         KVTRxqX1CorNpv/wsjLkE+v2x5ISSv25bdF4Ew/r5C14UxQSWaMN31mBrVDR1YZd5whP
         YxN265vhW3I8jDD09HlV1otiW07nGehKbgSXbM5ySf+dYyrrEF1Fzujbgj64Iv3oyhvK
         Qlug==
X-Gm-Message-State: AOJu0Ywl1J/nLTwlOw/2lly1OB2LAkxA9ysEo4W5riFw+NYCtg/9rnPT
	6ry1HFCkADeuY8xroMMT82Ukd3yRFFnMIQqtVrOVBsFhrNtx7mtybYSkiI8+wegvTWA=
X-Gm-Gg: ASbGncsclwWfiH2zSTDYe08sGmSQvJSzH8AkCxyaCsdRDc1fGY7f+7kb1Q4h0LGBuRz
	2i0cPNcLphcYKkkKBMVzv1GZcrbjF0ZtFOul8wE6wuvfuATUKII68ctN2VbDXgdALX9JmIsAOBv
	pIW4AuWgZO6Mo18LzsVJmHdd8KA+7fOKv0Dc8VIXa8lWq2TzuyxHKirWnVcvGZ2f9ETxsxN+t66
	qm9OjFxpiHyc1SDI1ew6Y9EU5TSRGmC/DiLdhEcjGQW+Og8j7Kjxj3AAsZKWDKhfBorIklKnDkb
	GPPaUkxyNf6kZsEm239vJOd1MsFyIR4TeV/dF9ZibffCCRK5EB9hBf9QyVnSBzkutMiyQ1cLqj+
	C2fKbCw5oC533EtobiQ==
X-Google-Smtp-Source: AGHT+IGvVc5t4v/zXXj3XSOg9VlCKaRjy8RNapwWMKX626xKKo9LfhELM3jW9IkDumPkK7A4e7csLA==
X-Received: by 2002:a05:600c:1f11:b0:45d:db2a:ce4a with SMTP id 5b1f17b1804b1-45de07ee7b3mr127598945e9.9.1757491684304;
        Wed, 10 Sep 2025 01:08:04 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df8247cc6sm17813605e9.12.2025.09.10.01.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 01:08:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 10:07:45 +0200
Subject: [PATCH 8/9] net: stmmac: qcom-ethqos: define a callback for
 setting the serdes speed
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-qcom-sa8255p-emac-v1-8-32a79cf1e668@linaro.org>
References: <20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org>
In-Reply-To: <20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1914;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=xmsTTIN+xNt0moiTieLp775A3Rxh60igauD1SnixUA4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowTHO6EyrLNmJZzntjQ+QxktZHKsf8HIE32fP3
 DKzaOXZ/t2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMExzgAKCRARpy6gFHHX
 cjAhD/9mxAdGPfan6KTr7LSNd95YNC9Xhm8DikmzNJETYy9C99YxJGy+fco1O7O6JQB/NB2yyqj
 b8H7YlXOcHEWEpajLXslZcKO+MGrldGf+4YySTKrgVI0eJfC2tiKU72AgyWVX8mTvzbCYd/QE1B
 Q/q6VX+d5LcP83v7vJMP+qvyJCEc9zm/AGrV1v67wekYIh0jN+i9PITEBqqCqdHyNeEmhtxXDbH
 BrPBe/0Q7vQH4t0YCui0PB67K2J7bTu2TE3be8u3eJQ+AyDXkQIMGNxfmZ7/SHhPk8ISPRarx6P
 3A/7hoe2nFnpq78Jtda4OWOzSxizgWCwylVbcGAY6N6B1bFwxBkmu3xFk4yvXeO5YueTq7XFbc7
 /SsCnTdkkNI/qwMHtzRaF1aqEy4A8gqomnxkO/icK9cUAGKtvyI4JbAfp9DzrkTsfAkZF6C9Fg0
 yqbqHPKHpiecBRW4GDJZl4YiqP/IA+wPY/D7Pj4VJjpdfID0XsnGAOgonVEzjPxwoPm4C2iKk1W
 Q/P8QkqnnazoP08VI0ZR/oUhxONVStSbiCTJ2IOvWcUYSUfm6/2lJeAvxvQ4l7aQfjFi0mTbUok
 mGTyi/ZSo1b+kDIJ9Swlrh8hlqVaEirtfRm1fTTz0L0md52Fn65DO4rIbsFEm83rxn1oWUZ8KJJ
 dA/04HfQrhChqmA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Ahead of adding support for firmware driven power management, let's
allow different ways of setting the PHY speed. To that end create a
callback with a single implementation for now, that will be extended
later.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 1fec3aa62f0f01b29cdbc4a5887dbaa0c3c60fcd..2a6136a663268ed40f99b47c9f0694f30053b94a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -125,6 +125,7 @@ struct qcom_ethqos {
 	struct ethqos_emac_pm_ctx pm;
 	phy_interface_t phy_mode;
 	int serdes_speed;
+	int (*set_serdes_speed)(struct qcom_ethqos *ethqos);
 
 	const struct ethqos_emac_por *por;
 	unsigned int num_por;
@@ -646,11 +647,16 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos, int speed)
 	return 0;
 }
 
+static int ethqos_set_serdes_speed_phy(struct qcom_ethqos *ethqos)
+{
+	return phy_set_speed(ethqos->pm.serdes_phy, ethqos->serdes_speed);
+}
+
 static void ethqos_set_serdes_speed(struct qcom_ethqos *ethqos, int speed)
 {
 	if (ethqos->serdes_speed != speed) {
-		phy_set_speed(ethqos->pm.serdes_phy, speed);
 		ethqos->serdes_speed = speed;
+		ethqos->set_serdes_speed(ethqos);
 	}
 }
 
@@ -881,6 +887,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(ethqos->pm.serdes_phy),
 				     "Failed to get serdes phy\n");
 
+	ethqos->set_serdes_speed = ethqos_set_serdes_speed_phy;
 	ethqos->serdes_speed = SPEED_1000;
 	ethqos_update_link_clk(ethqos, SPEED_1000);
 	ethqos_set_func_clk_en(ethqos);

-- 
2.48.1


