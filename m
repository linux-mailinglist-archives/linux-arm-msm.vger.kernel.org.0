Return-Path: <linux-arm-msm+bounces-23257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EE890F64F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 20:46:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F98B284DD2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 18:46:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12DBA1586FB;
	Wed, 19 Jun 2024 18:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="CYgJUNPD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC261BF37
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jun 2024 18:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718822764; cv=none; b=uWe1E+TBr7MTNvdfA4av9T9xp8w2YX67JxNE5KeeRV+tkVCPyLwG5lLqAH+6b6Lfw64BGUURoYTKKtkLrLQ3HpeYrLZHZyA3jTWFKVPZ9eKnl/zxr0w9C/BhpQ0/VlizqMcss09LHcmBE0gIjM26Om1CtG8KrWxeQDwGDaG1Ye0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718822764; c=relaxed/simple;
	bh=zPMoBTclesTxV19K2NhgdoO2cUtAkYyX/FhmCFJ4hp0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TjFax5flGZSC4ouStt5RiZ7KYG9kteAk3bAR+b189oBsENgL63fC/gVJccqpaADHN5dbTOGKskbLEivBY5eyL5A7aJxkbh1dbqoCUs1PuUMLcuG62RsRe11k8LPrlErY+1slWTr5jbCugrWH8LPYT/dWkzUY5XAav3/YGeUbVz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=CYgJUNPD; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4217136a74dso1000295e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jun 2024 11:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718822762; x=1719427562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q803tOePwccb1h2zDMiIz3ozPcAah2s1cv6FSztbWf0=;
        b=CYgJUNPDQ7ZPdksmZBrfeC+Mu1rT2mVPgLBZ8IMt0xyOeokMwvefJgBmYqjKmdjXKl
         ppZFyA8jHHIgr2CsL+yjnua7eHsPxism5RwKoqcwpKoC8QNCEybccLmCf5kL+qd5kzEE
         7K6wTCY7+H+jXbI+rGtTF2WEkyfg5n3E9vVQRzaC4iDnutVIP2WS+MeJV9M1EGgaOD44
         7y6hSAtsrF0wYF6bAE/L6yZag4qsBGGiCeJJx0JsdJsTPt7rgrd3PJWa0qC1elHxWYxg
         l0hF6BD5UPLQDnVKLf8QhI9IrUouQYAfEp6NZyf6PtbwFjN9OHYVOSd8KE0Hl7FfRycB
         oMnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718822762; x=1719427562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q803tOePwccb1h2zDMiIz3ozPcAah2s1cv6FSztbWf0=;
        b=umBvYdJfPQs4ycUseIM550189AKX+GcIKGYnYvWZOPhB8rCk7EgPfW3IKWCpr/OlUT
         ihL6y0lxRVkc/t5uNKv2VMwhKZBs38b6dpTy5wrrscUHjZzb7T05+mCvo3Tk4vA/6KOs
         6O3RyFOl5OM91uKVcttcjpzm2oeXJLcBNQK+98LRl1kqJCJqemX/H9d4VjnbCpzLpsDu
         1K/IEXPZgYkNaLMvuGyHStFbPtR/G5XWaynTEqQpjHjbCmKSu9JW/7FrQkRVx4zZaLCV
         rZh9u3pOlQTrgkchCXH9wji0O4/IJU8YqH2rfvbtimQ9UE14Yc7nYelSQKHKmAQLo527
         aBdg==
X-Forwarded-Encrypted: i=1; AJvYcCUI3/1G5tjOuqgQHsBFj5TiczNp6PfLRDQojPd1Z2YGl+Ph9xC0oUAhlq84uEEaX2lnPShD8yzaVt7eMC4C8HJn0UtphUOMvMLFEYocnA==
X-Gm-Message-State: AOJu0YwwQ8d6kd3x8v3KXlTNbKkJszmw7/V3Ra71kJkVRCskQP0GmMtJ
	IDtCg2G+bMrdR9mS5etVKzNogov5GYZ7fVRN7ePeTzf2lhGevX4SqIea0OI0JZI=
X-Google-Smtp-Source: AGHT+IFWT+3bRELnyfZyXWx5RSUNx7IO660yuwGioJQSIgOSEIf5ViL1XqpqGrTP8TUu85sQWpkvPA==
X-Received: by 2002:a5d:43c9:0:b0:35f:d6e:f7bd with SMTP id ffacd0b85a97d-36317b79cabmr2407085f8f.29.1718822761741;
        Wed, 19 Jun 2024 11:46:01 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:991f:deb8:4c5d:d73d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36098c8c596sm7594156f8f.14.2024.06.19.11.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 11:46:01 -0700 (PDT)
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
Subject: [PATCH net-next 0/8] net: support 2.5G ethernet in dwmac-qcom-ethqos
Date: Wed, 19 Jun 2024 20:45:41 +0200
Message-ID: <20240619184550.34524-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The following series introduces various related changes that allow
supporting 2.5G ethernet on the sa8775p-ride board.

First two patches add support for the new SGMII mode in PHY core and the
dwmac-qcom-ethqos driver. Next three introduce support for a new PHY
model to the aquantia driver (while at it: fix two issues I noticed).

Final three provide a way to work around a DMA reset issue on the
sa8775p-ride board where RX clocks from the PHY are not available during
the reset.

Bartosz Golaszewski (8):
  net: phy: add support for overclocked SGMII
  net: stmmac: qcom-ethqos: add support for 2.5G overlocked SGMII mode
  net: phy: aquantia: add missing include guards
  net: phy: aquantia: add support for aqr115c
  net: phy: aquantia: wait for FW reset before checking the vendor ID
  net: stmmac: provide the link_up() callback
  net: stmmac: provide the open() callback
  net: stmmac: qcom-ethqos: add a DMA-reset quirk for sa8775p-ride-r3

 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 44 +++++++++++++++++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  6 +++
 drivers/net/phy/aquantia/aquantia.h           |  6 +++
 drivers/net/phy/aquantia/aquantia_firmware.c  |  4 ++
 drivers/net/phy/aquantia/aquantia_main.c      | 47 +++++++++++++++++--
 drivers/net/phy/phy-core.c                    |  1 +
 drivers/net/phy/phylink.c                     | 13 ++++-
 include/linux/phy.h                           |  4 ++
 include/linux/stmmac.h                        |  2 +
 9 files changed, 121 insertions(+), 6 deletions(-)

-- 
2.43.0


