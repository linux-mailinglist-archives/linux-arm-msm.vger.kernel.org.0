Return-Path: <linux-arm-msm+bounces-2351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF7A7FCCC6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 03:13:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 28589B215EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 02:13:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 949F56FB6;
	Wed, 29 Nov 2023 02:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FLUwBoKp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFCE81BE3;
	Tue, 28 Nov 2023 18:12:42 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4079ed65582so45792545e9.1;
        Tue, 28 Nov 2023 18:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701223961; x=1701828761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K01CrylXQ/Y0LBryWNGxMBkxZuhuQFBcceV1xDoH9h8=;
        b=FLUwBoKpERR+YlYg6EpXAJg9jMLr/rTIlRkxecxYYNmZTQnHwJIv9NlGgugmRuOo7R
         hzc07lgjacRUXpRSBiJF6EAoCQjfnJt566AI9+gCPcmLcoJ8LX3c7WzqqkAU0T9A5ZT6
         U0//ztMdgKePrc0NdaflwCQl/Gt9RHciKKHzjCt1vVZZk1iO/vu60dhPjV5nXsl5QH0R
         G8lVklRYNDhGffWbP8jbl8OONVenEb1X8GFoIpvsYCa5y0XfK7GBz0AfwIv2TJnRP6oH
         0PaAyBdMTB8B99WbzOENL+pS09Z+LeFETDWL/HKlOWkwjYw7S858Z61Oy2pSXeCgg5l7
         RwnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701223961; x=1701828761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K01CrylXQ/Y0LBryWNGxMBkxZuhuQFBcceV1xDoH9h8=;
        b=PZ6zxz6wt+wT/cIuU7RjQnR7orD6NhLK1VqOxQVp2nqw9vs3jwYOeBWHf+JxpZDtff
         EyCFK2CiYuyJkXudvg1d+aeDxubOe1JUACo2THnc+wv89cbRLw0QJkEz3QwyhfhJuvbp
         n62pKhvKCsY+/IsnG6ryuYC3/htRe7gvwAfsF4+9hln7ZbOp0bIKDbFvqKOl/aXnF4UH
         7Chgkc1AlOj7TYRjiokVWMksyrCUKxsxuHnfun2Hg2r5DrKFMeb77Hb81rZS80+JMtmX
         ZjWGz9yiyJuJtQdT/EUInzrUn9vyc0qZrDY3MpU8Or1dkvTAfncpFKsd9bwqASv4Y5P5
         ZACQ==
X-Gm-Message-State: AOJu0YyV9VSn8BqlFBASwpopdMthI9JEfySyBdYaQecXaM+Jx+zAYR9p
	wcxRUEO1d/VdyN1OnW5gT2s=
X-Google-Smtp-Source: AGHT+IHDIzrR8HW2qWuiakVjIVV8ZhM83+9ldOSTesQ07hdRRf6I9nG7s6ISXrM8S8tiGu3wqoMAKg==
X-Received: by 2002:a05:600c:293:b0:409:787b:5ab5 with SMTP id 19-20020a05600c029300b00409787b5ab5mr11810494wmk.23.1701223961074;
        Tue, 28 Nov 2023 18:12:41 -0800 (PST)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id b19-20020a05600c4e1300b0040648217f4fsm321406wmq.39.2023.11.28.18.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 18:12:40 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [net-next PATCH 12/14] net: phy: move at803x PHY driver to dedicated directory
Date: Wed, 29 Nov 2023 03:12:17 +0100
Message-Id: <20231129021219.20914-13-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231129021219.20914-1-ansuelsmth@gmail.com>
References: <20231129021219.20914-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for addition of other Qcom PHY and to tidy things up,
move the at803x PHY driver to dedicated directory.

The same order in the Kconfig selection is saved.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/Kconfig             | 7 +------
 drivers/net/phy/Makefile            | 2 +-
 drivers/net/phy/qcom/Kconfig        | 7 +++++++
 drivers/net/phy/qcom/Makefile       | 2 ++
 drivers/net/phy/{ => qcom}/at803x.c | 0
 5 files changed, 11 insertions(+), 7 deletions(-)
 create mode 100644 drivers/net/phy/qcom/Kconfig
 create mode 100644 drivers/net/phy/qcom/Makefile
 rename drivers/net/phy/{ => qcom}/at803x.c (100%)

diff --git a/drivers/net/phy/Kconfig b/drivers/net/phy/Kconfig
index 25cfc5ded1da..c47fe2302150 100644
--- a/drivers/net/phy/Kconfig
+++ b/drivers/net/phy/Kconfig
@@ -318,12 +318,7 @@ config NCN26000_PHY
 	  Currently supports the NCN26000 10BASE-T1S Industrial PHY
 	  with MII interface.
 
-config AT803X_PHY
-	tristate "Qualcomm Atheros AR803X PHYs and QCA833x PHYs"
-	depends on REGULATOR
-	help
-	  Currently supports the AR8030, AR8031, AR8033, AR8035 and internal
-	  QCA8337(Internal qca8k PHY) model
+source "drivers/net/phy/qcom/Kconfig"
 
 config QSEMI_PHY
 	tristate "Quality Semiconductor PHYs"
diff --git a/drivers/net/phy/Makefile b/drivers/net/phy/Makefile
index f65e85c91fc1..4ecf704d0e4b 100644
--- a/drivers/net/phy/Makefile
+++ b/drivers/net/phy/Makefile
@@ -36,7 +36,7 @@ obj-$(CONFIG_ADIN_PHY)		+= adin.o
 obj-$(CONFIG_ADIN1100_PHY)	+= adin1100.o
 obj-$(CONFIG_AMD_PHY)		+= amd.o
 obj-$(CONFIG_AQUANTIA_PHY)	+= aquantia/
-obj-$(CONFIG_AT803X_PHY)	+= at803x.o
+obj-$(CONFIG_AT803X_PHY)	+= qcom/
 obj-$(CONFIG_AX88796B_PHY)	+= ax88796b.o
 obj-$(CONFIG_BCM54140_PHY)	+= bcm54140.o
 obj-$(CONFIG_BCM63XX_PHY)	+= bcm63xx.o
diff --git a/drivers/net/phy/qcom/Kconfig b/drivers/net/phy/qcom/Kconfig
new file mode 100644
index 000000000000..2c274fbbe410
--- /dev/null
+++ b/drivers/net/phy/qcom/Kconfig
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config AT803X_PHY
+	tristate "Qualcomm Atheros AR803X PHYs and QCA833x PHYs"
+	depends on REGULATOR
+	help
+	  Currently supports the AR8030, AR8031, AR8033, AR8035 and internal
+	  QCA8337(Internal qca8k PHY) model
diff --git a/drivers/net/phy/qcom/Makefile b/drivers/net/phy/qcom/Makefile
new file mode 100644
index 000000000000..6a68da8aaa7b
--- /dev/null
+++ b/drivers/net/phy/qcom/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_AT803X_PHY)	+= at803x.o
diff --git a/drivers/net/phy/at803x.c b/drivers/net/phy/qcom/at803x.c
similarity index 100%
rename from drivers/net/phy/at803x.c
rename to drivers/net/phy/qcom/at803x.c
-- 
2.40.1


