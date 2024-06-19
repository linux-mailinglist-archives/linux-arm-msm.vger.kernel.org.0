Return-Path: <linux-arm-msm+bounces-23259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE0590F657
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 20:46:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 550201F24058
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 18:46:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 763E1158DB1;
	Wed, 19 Jun 2024 18:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="UhZR3aWJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D55158A33
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jun 2024 18:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718822767; cv=none; b=olwptyBavNpDhE59SfVQHgsaJ/wx0LX70Qo1LYfGW52nwO7SFcGhKfM94Ri+SeSIrcXzrjQnSj1HEv4Wll0IPz3fQx6JuFRuF0pdKAnzR8dgc557HhndiQikyROnUbaGYa7ZIHujpibQzwfXY5+Myz1n4r2RDf/UfaO1vhkRahk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718822767; c=relaxed/simple;
	bh=UgqhHqlcoo2GUEDYVQSY/0NQPdIbLo3HZeq6E2j6UQE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T9MakCPYhfbeeJ4+TY4npEuqS0dLxk/A3ckKRvuVy6j2OW/C3270ftWvTyNcUayaOA5NhoHqqonXOOpxBcoCpobr6jhkdibitK+zSxeIMKAmIg85LHqGo7bLOVF8bC4bny2RQNTJa43cMz7LYLuEcSkMcZhkcnz0K61XjaOzz6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=UhZR3aWJ; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-35f23f3da44so94091f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jun 2024 11:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718822764; x=1719427564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SJn78QxgCMJZC/Bt30akmrrLqCYwQcxiOnm8hqmwEKA=;
        b=UhZR3aWJxp0gOrbcEpQNpumjbS8dyeRLGT5X9QdlNQExYb9ibz/xvMUMxFuBBVcdC3
         Mu+7Exm7m1Hli3rwoo3YgBFu1LW7GaGzO/fKczVdiHW+UK38uF0OQ4KPXKh3lURkzqtD
         jUReJmlXvic5in0KsOyBSb5PPHlDL9SNKP8xnDwL8ehPZHX0lerwqoBRuK1Sz7Y+bWb8
         uIP7GGTAPvEYP3YzO8JfAhqTlXYTLgK+IqWSSF6GDTuWkrItvTo0eMoJr5C1A7Yh8L7B
         A8i3NpqjldX+01WaerzRRn558W+K/T+gVA93uZgi6L3bc+WbJ8M+MtcQV4kgRGMv0ohx
         0+zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718822764; x=1719427564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SJn78QxgCMJZC/Bt30akmrrLqCYwQcxiOnm8hqmwEKA=;
        b=GvJLyZdUHtFFhQfacr+Lck4HDLPLo4H0zYratIduc5PMufJCq4mQqOF56D6rj0ugn9
         YW/FmruV8IkOJwecIcTfKzvMLXIyMWeUuq4tAPE9ooYRRtys2L+BDIc7zdm2ClBBp+/n
         Dc9xPkzONsFaXR/gEYJvRXnrfoa1LCQlroUhwjId8GtkQVnzlVsJf2/eyHkezPTRZZVX
         9FXKYIfQdEY37KvJHgZ0uzqJzyqQMDKPD9O83XDUb93B7EpeOIEFRIoxoBEv4li4+6mI
         nbu+RBhJFynQi/k8XBpMNJ7jdK1kbGD7jAMyzhLz9PJr3Oe3v4qfxzGGGDRF4v6uHr8u
         cBnA==
X-Forwarded-Encrypted: i=1; AJvYcCVB1Uyofd2kAWpX7c4bofcPJ9r4WSs2gIRgyg4Vdz0M82a8cz1ZhqVBoqHS+6bZofik5vUbvd7+88cH+FRilE5V7ZwoziTbqql7SAOp4Q==
X-Gm-Message-State: AOJu0YzEAaOqPTq9ai0TTSHTUO5e2FYnpHQWDX+Ug4JULLXF+3QcSYCW
	+mB0cLRRzwXGBsswXzcYHtBfPWqYlx23fFujLcHE5FLEt6IBtNuyDwAAcpMa2Gc=
X-Google-Smtp-Source: AGHT+IGvNKdudrDJsFCz+vta1snIK9cUncMqGFnepCueFTkJUGgeHU0mX5Ge8h1gAZtVNK+LZc9FoA==
X-Received: by 2002:a05:6000:1363:b0:362:dbc2:9486 with SMTP id ffacd0b85a97d-36319c6f86emr2312112f8f.68.1718822764283;
        Wed, 19 Jun 2024 11:46:04 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:991f:deb8:4c5d:d73d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36098c8c596sm7594156f8f.14.2024.06.19.11.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 11:46:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Vinod Koul <vkoul@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH net-next 2/8] net: stmmac: qcom-ethqos: add support for 2.5G overlocked SGMII mode
Date: Wed, 19 Jun 2024 20:45:43 +0200
Message-ID: <20240619184550.34524-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240619184550.34524-1-brgl@bgdev.pl>
References: <20240619184550.34524-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add support for 2.5G speed in Overclocked SGMII mode to the QCom ethqos
driver.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c   | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 80eb72bc6311..dac91bc72070 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -665,6 +665,14 @@ static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos)
 	return val;
 }
 
+static void qcom_ethqos_speed_mode_2500(struct net_device *ndev, void *data)
+{
+	struct stmmac_priv *priv = netdev_priv(ndev);
+
+	priv->plat->max_speed = 2500;
+	priv->plat->phy_interface = PHY_INTERFACE_MODE_OCSGMII;
+}
+
 static int ethqos_configure(struct qcom_ethqos *ethqos)
 {
 	return ethqos->configure_func(ethqos);
@@ -787,6 +795,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	case PHY_INTERFACE_MODE_RGMII_TXID:
 		ethqos->configure_func = ethqos_configure_rgmii;
 		break;
+	case PHY_INTERFACE_MODE_OCSGMII:
+		plat_dat->speed_mode_2500 = qcom_ethqos_speed_mode_2500;
+		fallthrough;
 	case PHY_INTERFACE_MODE_SGMII:
 		ethqos->configure_func = ethqos_configure_sgmii;
 		break;
-- 
2.43.0


