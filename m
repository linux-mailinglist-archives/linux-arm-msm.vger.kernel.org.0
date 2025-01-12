Return-Path: <linux-arm-msm+bounces-44820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C60A0A9F1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jan 2025 15:15:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CF0418877C0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jan 2025 14:15:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84FA41B4157;
	Sun, 12 Jan 2025 14:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="dUkSCULm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-28.smtpout.orange.fr [80.12.242.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9667C29CA;
	Sun, 12 Jan 2025 14:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736691349; cv=none; b=tN0R/+fxphY5q7pgl0HbJnB9501GH/cQS9ueiSft9HiNpDABvzRn8IazG6J0C7zqrYcLI69F/B0hh2tfHuNVGqve5nESrewQEmoj0BrXVDLh3yxiHkUv0IKmr6y9SlfF38q6n8372V6jeYUH3kUv4/fjDHdlbofrn4wS3mWImGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736691349; c=relaxed/simple;
	bh=88kPSa05ZMibHhOQ1lqPvA3Ssd5ivtylUITAjmWMUFg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D99+xrCftc3O/qYCepoXhGbuv6x6yBl2BMENNvkut0ldlrFMLrgJH2DTA/AQAEHylo148SgJoXZa6TkldhMrv9TJcPfn2Hx6NocSLhGcmgiUhjTXm2Yb96Iy9QWDGMOyxaUPqZbLPhXLEtQy6xY4YMCHbo6TiqT51i3scxf3HkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=dUkSCULm; arc=none smtp.client-ip=80.12.242.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id WykPtle2x1CseWykSt5r3y; Sun, 12 Jan 2025 15:15:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1736691338;
	bh=6iqAW7fs2zsususgDSpwxlp9XBeduSVt13lFpOxS9yo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=dUkSCULmnTel+iOIxcz+T9dih+y3ZtoLo52f4AzObbA1MpWqbBKBy9DkR1pO+FW7k
	 ywMB1I+XfZ4KyIpaQW0m9Tr2ouRIOTWdwDY1fTxNBbzMAqb6Gh1K1dMdhz5pOvBMQR
	 da/RGBf60XeKfha7uxSofxtxmRCFN5i1KUhSHQgCJ7sVNiQ0NNcdwJkmyHTqJhya9b
	 doCiaJXoFpn/1rfUQyQAjEYz61mp1t+YolDvVBXyEKNy5TrAcr9ZyhgxGjIrMpKTIM
	 7NgpKt+RayU5ReXIuPZ7Y1Vdnrq/EBduVPSp7u3I44hE7lXbnXD/AZ9xLrISfvgnV0
	 fg+0T3xrt5r5Q==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 12 Jan 2025 15:15:38 +0100
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Michael Hennerich <michael.hennerich@analog.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Richard Cochran <richardcochran@gmail.com>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Arun Ramadoss <arun.ramadoss@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Xu Liang <lxu@maxlinear.com>,
	Piergiorgio Beruto <piergiorgio.beruto@gmail.com>,
	Andrei Botila <andrei.botila@oss.nxp.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH net-next] net: phy: Constify struct mdio_device_id
Date: Sun, 12 Jan 2025 15:14:50 +0100
Message-ID: <403c381b7d9156b67ad68ffc44b8eee70c5e86a9.1736691226.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'struct mdio_device_id' is not modified in these drivers.

Constifying these structures moves some data to a read-only section, so
increase overall security.

On a x86_64, with allmodconfig, as an example:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  27014	  12792	      0	  39806	   9b7e	drivers/net/phy/broadcom.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  27206	  12600	      0	  39806	   9b7e	drivers/net/phy/broadcom.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested-only.
---
 drivers/net/phy/adin.c                   | 2 +-
 drivers/net/phy/adin1100.c               | 2 +-
 drivers/net/phy/air_en8811h.c            | 2 +-
 drivers/net/phy/amd.c                    | 2 +-
 drivers/net/phy/aquantia/aquantia_main.c | 2 +-
 drivers/net/phy/ax88796b.c               | 2 +-
 drivers/net/phy/bcm-cygnus.c             | 2 +-
 drivers/net/phy/bcm54140.c               | 2 +-
 drivers/net/phy/bcm63xx.c                | 2 +-
 drivers/net/phy/bcm7xxx.c                | 2 +-
 drivers/net/phy/bcm84881.c               | 2 +-
 drivers/net/phy/broadcom.c               | 2 +-
 drivers/net/phy/cicada.c                 | 2 +-
 drivers/net/phy/cortina.c                | 2 +-
 drivers/net/phy/davicom.c                | 2 +-
 drivers/net/phy/dp83640.c                | 2 +-
 drivers/net/phy/dp83822.c                | 2 +-
 drivers/net/phy/dp83848.c                | 2 +-
 drivers/net/phy/dp83867.c                | 2 +-
 drivers/net/phy/dp83869.c                | 2 +-
 drivers/net/phy/dp83tc811.c              | 2 +-
 drivers/net/phy/dp83td510.c              | 2 +-
 drivers/net/phy/dp83tg720.c              | 2 +-
 drivers/net/phy/et1011c.c                | 2 +-
 drivers/net/phy/icplus.c                 | 2 +-
 drivers/net/phy/intel-xway.c             | 2 +-
 drivers/net/phy/lxt.c                    | 2 +-
 drivers/net/phy/marvell-88q2xxx.c        | 2 +-
 drivers/net/phy/marvell-88x2222.c        | 2 +-
 drivers/net/phy/marvell.c                | 2 +-
 drivers/net/phy/marvell10g.c             | 2 +-
 drivers/net/phy/mediatek/mtk-ge-soc.c    | 2 +-
 drivers/net/phy/mediatek/mtk-ge.c        | 2 +-
 drivers/net/phy/meson-gxl.c              | 2 +-
 drivers/net/phy/micrel.c                 | 2 +-
 drivers/net/phy/microchip.c              | 2 +-
 drivers/net/phy/microchip_t1.c           | 2 +-
 drivers/net/phy/microchip_t1s.c          | 2 +-
 drivers/net/phy/mscc/mscc_main.c         | 2 +-
 drivers/net/phy/mxl-gpy.c                | 2 +-
 drivers/net/phy/national.c               | 2 +-
 drivers/net/phy/ncn26000.c               | 2 +-
 drivers/net/phy/nxp-c45-tja11xx.c        | 2 +-
 drivers/net/phy/nxp-cbtx.c               | 2 +-
 drivers/net/phy/nxp-tja11xx.c            | 2 +-
 drivers/net/phy/qcom/at803x.c            | 2 +-
 drivers/net/phy/qcom/qca807x.c           | 2 +-
 drivers/net/phy/qcom/qca808x.c           | 2 +-
 drivers/net/phy/qcom/qca83xx.c           | 2 +-
 drivers/net/phy/qsemi.c                  | 2 +-
 drivers/net/phy/rockchip.c               | 2 +-
 drivers/net/phy/smsc.c                   | 2 +-
 drivers/net/phy/ste10Xp.c                | 2 +-
 drivers/net/phy/teranetics.c             | 2 +-
 drivers/net/phy/uPD60620.c               | 2 +-
 drivers/net/phy/vitesse.c                | 2 +-
 56 files changed, 56 insertions(+), 56 deletions(-)

diff --git a/drivers/net/phy/adin.c b/drivers/net/phy/adin.c
index a2a862bae2ed..7fa713ca8d45 100644
--- a/drivers/net/phy/adin.c
+++ b/drivers/net/phy/adin.c
@@ -1038,7 +1038,7 @@ static struct phy_driver adin_driver[] = {
 
 module_phy_driver(adin_driver);
 
-static struct mdio_device_id __maybe_unused adin_tbl[] = {
+static const struct mdio_device_id __maybe_unused adin_tbl[] = {
 	{ PHY_ID_MATCH_MODEL(PHY_ID_ADIN1200) },
 	{ PHY_ID_MATCH_MODEL(PHY_ID_ADIN1300) },
 	{ }
diff --git a/drivers/net/phy/adin1100.c b/drivers/net/phy/adin1100.c
index 85f910e2d4fb..6bb469429b9d 100644
--- a/drivers/net/phy/adin1100.c
+++ b/drivers/net/phy/adin1100.c
@@ -340,7 +340,7 @@ static struct phy_driver adin_driver[] = {
 
 module_phy_driver(adin_driver);
 
-static struct mdio_device_id __maybe_unused adin_tbl[] = {
+static const struct mdio_device_id __maybe_unused adin_tbl[] = {
 	{ PHY_ID_MATCH_MODEL(PHY_ID_ADIN1100) },
 	{ PHY_ID_MATCH_MODEL(PHY_ID_ADIN1110) },
 	{ PHY_ID_MATCH_MODEL(PHY_ID_ADIN2111) },
diff --git a/drivers/net/phy/air_en8811h.c b/drivers/net/phy/air_en8811h.c
index 8d076b9609fd..e9fd24cb7270 100644
--- a/drivers/net/phy/air_en8811h.c
+++ b/drivers/net/phy/air_en8811h.c
@@ -1075,7 +1075,7 @@ static struct phy_driver en8811h_driver[] = {
 
 module_phy_driver(en8811h_driver);
 
-static struct mdio_device_id __maybe_unused en8811h_tbl[] = {
+static const struct mdio_device_id __maybe_unused en8811h_tbl[] = {
 	{ PHY_ID_MATCH_MODEL(EN8811H_PHY_ID) },
 	{ }
 };
diff --git a/drivers/net/phy/amd.c b/drivers/net/phy/amd.c
index 930b15fa6ce9..75b5fe65500a 100644
--- a/drivers/net/phy/amd.c
+++ b/drivers/net/phy/amd.c
@@ -111,7 +111,7 @@ static struct phy_driver am79c_drivers[] = {
 
 module_phy_driver(am79c_drivers);
 
-static struct mdio_device_id __maybe_unused amd_tbl[] = {
+static const struct mdio_device_id __maybe_unused amd_tbl[] = {
 	{ PHY_ID_AC101L, 0xfffffff0 },
 	{ PHY_ID_AM79C874, 0xfffffff0 },
 	{ }
diff --git a/drivers/net/phy/aquantia/aquantia_main.c b/drivers/net/phy/aquantia/aquantia_main.c
index bb56a66d2a48..e42ace4e682a 100644
--- a/drivers/net/phy/aquantia/aquantia_main.c
+++ b/drivers/net/phy/aquantia/aquantia_main.c
@@ -1200,7 +1200,7 @@ static struct phy_driver aqr_driver[] = {
 
 module_phy_driver(aqr_driver);
 
-static struct mdio_device_id __maybe_unused aqr_tbl[] = {
+static const struct mdio_device_id __maybe_unused aqr_tbl[] = {
 	{ PHY_ID_MATCH_MODEL(PHY_ID_AQ1202) },
 	{ PHY_ID_MATCH_MODEL(PHY_ID_AQ2104) },
 	{ PHY_ID_MATCH_MODEL(PHY_ID_AQR105) },
diff --git a/drivers/net/phy/ax88796b.c b/drivers/net/phy/ax88796b.c
index eb74a8cf8df1..694df1401aa2 100644
--- a/drivers/net/phy/ax88796b.c
+++ b/drivers/net/phy/ax88796b.c
@@ -121,7 +121,7 @@ static struct phy_driver asix_driver[] = {
 
 module_phy_driver(asix_driver);
 
-static struct mdio_device_id __maybe_unused asix_tbl[] = {
+static const struct mdio_device_id __maybe_unused asix_tbl[] = {
 	{ PHY_ID_MATCH_EXACT(PHY_ID_ASIX_AX88772A) },
 	{ PHY_ID_MATCH_EXACT(PHY_ID_ASIX_AX88772C) },
 	{ PHY_ID_ASIX_AX88796B, 0xfffffff0 },
diff --git a/drivers/net/phy/bcm-cygnus.c b/drivers/net/phy/bcm-cygnus.c
index da8f7cb41b44..15cbef8202bc 100644
--- a/drivers/net/phy/bcm-cygnus.c
+++ b/drivers/net/phy/bcm-cygnus.c
@@ -278,7 +278,7 @@ static struct phy_driver bcm_cygnus_phy_driver[] = {
 }
 };
 
-static struct mdio_device_id __maybe_unused bcm_cygnus_phy_tbl[] = {
+static const struct mdio_device_id __maybe_unused bcm_cygnus_phy_tbl[] = {
 	{ PHY_ID_BCM_CYGNUS, 0xfffffff0, },
 	{ PHY_ID_BCM_OMEGA, 0xfffffff0, },
 	{ }
diff --git a/drivers/net/phy/bcm54140.c b/drivers/net/phy/bcm54140.c
index 2eea3d09b1e6..7969345f6b35 100644
--- a/drivers/net/phy/bcm54140.c
+++ b/drivers/net/phy/bcm54140.c
@@ -883,7 +883,7 @@ static struct phy_driver bcm54140_drivers[] = {
 };
 module_phy_driver(bcm54140_drivers);
 
-static struct mdio_device_id __maybe_unused bcm54140_tbl[] = {
+static const struct mdio_device_id __maybe_unused bcm54140_tbl[] = {
 	{ PHY_ID_BCM54140, BCM54140_PHY_ID_MASK },
 	{ }
 };
diff --git a/drivers/net/phy/bcm63xx.c b/drivers/net/phy/bcm63xx.c
index 0eb33be824f1..b46a736a3130 100644
--- a/drivers/net/phy/bcm63xx.c
+++ b/drivers/net/phy/bcm63xx.c
@@ -93,7 +93,7 @@ static struct phy_driver bcm63xx_driver[] = {
 
 module_phy_driver(bcm63xx_driver);
 
-static struct mdio_device_id __maybe_unused bcm63xx_tbl[] = {
+static const struct mdio_device_id __maybe_unused bcm63xx_tbl[] = {
 	{ 0x00406000, 0xfffffc00 },
 	{ 0x002bdc00, 0xfffffc00 },
 	{ }
diff --git a/drivers/net/phy/bcm7xxx.c b/drivers/net/phy/bcm7xxx.c
index 97638ba7ae85..00e8fa14aa77 100644
--- a/drivers/net/phy/bcm7xxx.c
+++ b/drivers/net/phy/bcm7xxx.c
@@ -929,7 +929,7 @@ static struct phy_driver bcm7xxx_driver[] = {
 	BCM7XXX_16NM_EPHY(PHY_ID_BCM7712, "Broadcom BCM7712"),
 };
 
-static struct mdio_device_id __maybe_unused bcm7xxx_tbl[] = {
+static const struct mdio_device_id __maybe_unused bcm7xxx_tbl[] = {
 	{ PHY_ID_BCM72113, 0xfffffff0 },
 	{ PHY_ID_BCM72116, 0xfffffff0, },
 	{ PHY_ID_BCM72165, 0xfffffff0, },
diff --git a/drivers/net/phy/bcm84881.c b/drivers/net/phy/bcm84881.c
index 47405bded677..d7f7cc44c532 100644
--- a/drivers/net/phy/bcm84881.c
+++ b/drivers/net/phy/bcm84881.c
@@ -262,7 +262,7 @@ static struct phy_driver bcm84881_drivers[] = {
 module_phy_driver(bcm84881_drivers);
 
 /* FIXME: module auto-loading for Clause 45 PHYs seems non-functional */
-static struct mdio_device_id __maybe_unused bcm84881_tbl[] = {
+static const struct mdio_device_id __maybe_unused bcm84881_tbl[] = {
 	{ 0xae025150, 0xfffffff0 },
 	{ },
 };
diff --git a/drivers/net/phy/broadcom.c b/drivers/net/phy/broadcom.c
index ddded162c44c..22edb7e4c1a1 100644
--- a/drivers/net/phy/broadcom.c
+++ b/drivers/net/phy/broadcom.c
@@ -1717,7 +1717,7 @@ static struct phy_driver broadcom_drivers[] = {
 
 module_phy_driver(broadcom_drivers);
 
-static struct mdio_device_id __maybe_unused broadcom_tbl[] = {
+static const struct mdio_device_id __maybe_unused broadcom_tbl[] = {
 	{ PHY_ID_BCM5411, 0xfffffff0 },
 	{ PHY_ID_BCM5421, 0xfffffff0 },
 	{ PHY_ID_BCM54210E, 0xfffffff0 },
diff --git a/drivers/net/phy/cicada.c b/drivers/net/phy/cicada.c
index ef5f412e101f..d87cf8b94cf8 100644
--- a/drivers/net/phy/cicada.c
+++ b/drivers/net/phy/cicada.c
@@ -145,7 +145,7 @@ static struct phy_driver cis820x_driver[] = {
 
 module_phy_driver(cis820x_driver);
 
-static struct mdio_device_id __maybe_unused cicada_tbl[] = {
+static const struct mdio_device_id __maybe_unused cicada_tbl[] = {
 	{ 0x000fc410, 0x000ffff0 },
 	{ 0x000fc440, 0x000fffc0 },
 	{ }
diff --git a/drivers/net/phy/cortina.c b/drivers/net/phy/cortina.c
index 40514a94e6ff..3b65f37f1c57 100644
--- a/drivers/net/phy/cortina.c
+++ b/drivers/net/phy/cortina.c
@@ -87,7 +87,7 @@ static struct phy_driver cortina_driver[] = {
 
 module_phy_driver(cortina_driver);
 
-static struct mdio_device_id __maybe_unused cortina_tbl[] = {
+static const struct mdio_device_id __maybe_unused cortina_tbl[] = {
 	{ PHY_ID_CS4340, 0xffffffff},
 	{},
 };
diff --git a/drivers/net/phy/davicom.c b/drivers/net/phy/davicom.c
index 4ac4bce1bf32..fa3692508f16 100644
--- a/drivers/net/phy/davicom.c
+++ b/drivers/net/phy/davicom.c
@@ -209,7 +209,7 @@ static struct phy_driver dm91xx_driver[] = {
 
 module_phy_driver(dm91xx_driver);
 
-static struct mdio_device_id __maybe_unused davicom_tbl[] = {
+static const struct mdio_device_id __maybe_unused davicom_tbl[] = {
 	{ 0x0181b880, 0x0ffffff0 },
 	{ 0x0181b8b0, 0x0ffffff0 },
 	{ 0x0181b8a0, 0x0ffffff0 },
diff --git a/drivers/net/phy/dp83640.c b/drivers/net/phy/dp83640.c
index 075d2beea716..85e231451093 100644
--- a/drivers/net/phy/dp83640.c
+++ b/drivers/net/phy/dp83640.c
@@ -1548,7 +1548,7 @@ MODULE_LICENSE("GPL");
 module_init(dp83640_init);
 module_exit(dp83640_exit);
 
-static struct mdio_device_id __maybe_unused dp83640_tbl[] = {
+static const struct mdio_device_id __maybe_unused dp83640_tbl[] = {
 	{ DP83640_PHY_ID, 0xfffffff0 },
 	{ }
 };
diff --git a/drivers/net/phy/dp83822.c b/drivers/net/phy/dp83822.c
index 334c17a68edd..308d7d096cf8 100644
--- a/drivers/net/phy/dp83822.c
+++ b/drivers/net/phy/dp83822.c
@@ -876,7 +876,7 @@ static struct phy_driver dp83822_driver[] = {
 };
 module_phy_driver(dp83822_driver);
 
-static struct mdio_device_id __maybe_unused dp83822_tbl[] = {
+static const struct mdio_device_id __maybe_unused dp83822_tbl[] = {
 	{ DP83822_PHY_ID, 0xfffffff0 },
 	{ DP83825I_PHY_ID, 0xfffffff0 },
 	{ DP83826C_PHY_ID, 0xfffffff0 },
diff --git a/drivers/net/phy/dp83848.c b/drivers/net/phy/dp83848.c
index 351411f0aa6f..d88b1999d596 100644
--- a/drivers/net/phy/dp83848.c
+++ b/drivers/net/phy/dp83848.c
@@ -123,7 +123,7 @@ static int dp83848_config_init(struct phy_device *phydev)
 	return 0;
 }
 
-static struct mdio_device_id __maybe_unused dp83848_tbl[] = {
+static const struct mdio_device_id __maybe_unused dp83848_tbl[] = {
 	{ TI_DP83848C_PHY_ID, 0xfffffff0 },
 	{ NS_DP83848C_PHY_ID, 0xfffffff0 },
 	{ TI_DP83620_PHY_ID, 0xfffffff0 },
diff --git a/drivers/net/phy/dp83867.c b/drivers/net/phy/dp83867.c
index 4120385c5a79..c1451df430ac 100644
--- a/drivers/net/phy/dp83867.c
+++ b/drivers/net/phy/dp83867.c
@@ -1210,7 +1210,7 @@ static struct phy_driver dp83867_driver[] = {
 };
 module_phy_driver(dp83867_driver);
 
-static struct mdio_device_id __maybe_unused dp83867_tbl[] = {
+static const struct mdio_device_id __maybe_unused dp83867_tbl[] = {
 	{ DP83867_PHY_ID, 0xfffffff0 },
 	{ }
 };
diff --git a/drivers/net/phy/dp83869.c b/drivers/net/phy/dp83869.c
index b6b38caf9c0e..a62cd838a9ea 100644
--- a/drivers/net/phy/dp83869.c
+++ b/drivers/net/phy/dp83869.c
@@ -928,7 +928,7 @@ static struct phy_driver dp83869_driver[] = {
 };
 module_phy_driver(dp83869_driver);
 
-static struct mdio_device_id __maybe_unused dp83869_tbl[] = {
+static const struct mdio_device_id __maybe_unused dp83869_tbl[] = {
 	{ PHY_ID_MATCH_MODEL(DP83869_PHY_ID) },
 	{ PHY_ID_MATCH_MODEL(DP83561_PHY_ID) },
 	{ }
diff --git a/drivers/net/phy/dp83tc811.c b/drivers/net/phy/dp83tc811.c
index 7ea32fb77190..e480c2a07450 100644
--- a/drivers/net/phy/dp83tc811.c
+++ b/drivers/net/phy/dp83tc811.c
@@ -403,7 +403,7 @@ static struct phy_driver dp83811_driver[] = {
 };
 module_phy_driver(dp83811_driver);
 
-static struct mdio_device_id __maybe_unused dp83811_tbl[] = {
+static const struct mdio_device_id __maybe_unused dp83811_tbl[] = {
 	{ DP83TC811_PHY_ID, 0xfffffff0 },
 	{ },
 };
diff --git a/drivers/net/phy/dp83td510.c b/drivers/net/phy/dp83td510.c
index 92aa3a2b9744..56ae24ad6c90 100644
--- a/drivers/net/phy/dp83td510.c
+++ b/drivers/net/phy/dp83td510.c
@@ -605,7 +605,7 @@ static struct phy_driver dp83td510_driver[] = {
 } };
 module_phy_driver(dp83td510_driver);
 
-static struct mdio_device_id __maybe_unused dp83td510_tbl[] = {
+static const struct mdio_device_id __maybe_unused dp83td510_tbl[] = {
 	{ PHY_ID_MATCH_MODEL(DP83TD510E_PHY_ID) },
 	{ }
 };
diff --git a/drivers/net/phy/dp83tg720.c b/drivers/net/phy/dp83tg720.c
index 0ef4d7dba065..da9230b1ba30 100644
--- a/drivers/net/phy/dp83tg720.c
+++ b/drivers/net/phy/dp83tg720.c
@@ -361,7 +361,7 @@ static struct phy_driver dp83tg720_driver[] = {
 } };
 module_phy_driver(dp83tg720_driver);
 
-static struct mdio_device_id __maybe_unused dp83tg720_tbl[] = {
+static const struct mdio_device_id __maybe_unused dp83tg720_tbl[] = {
 	{ PHY_ID_MATCH_MODEL(DP83TG720S_PHY_ID) },
 	{ }
 };
diff --git a/drivers/net/phy/et1011c.c b/drivers/net/phy/et1011c.c
index be1b71d7cab7..6cd8d77586fd 100644
--- a/drivers/net/phy/et1011c.c
+++ b/drivers/net/phy/et1011c.c
@@ -94,7 +94,7 @@ static struct phy_driver et1011c_driver[] = { {
 
 module_phy_driver(et1011c_driver);
 
-static struct mdio_device_id __maybe_unused et1011c_tbl[] = {
+static const struct mdio_device_id __maybe_unused et1011c_tbl[] = {
 	{ 0x0282f014, 0xfffffff0 },
 	{ }
 };
diff --git a/drivers/net/phy/icplus.c b/drivers/net/phy/icplus.c
index ee438b71a0b4..bbcc7d2b54cd 100644
--- a/drivers/net/phy/icplus.c
+++ b/drivers/net/phy/icplus.c
@@ -623,7 +623,7 @@ static struct phy_driver icplus_driver[] = {
 
 module_phy_driver(icplus_driver);
 
-static struct mdio_device_id __maybe_unused icplus_tbl[] = {
+static const struct mdio_device_id __maybe_unused icplus_tbl[] = {
 	{ PHY_ID_MATCH_MODEL(IP175C_PHY_ID) },
 	{ PHY_ID_MATCH_MODEL(IP1001_PHY_ID) },
 	{ PHY_ID_MATCH_EXACT(IP101A_PHY_ID) },
diff --git a/drivers/net/phy/intel-xway.c b/drivers/net/phy/intel-xway.c
index e6ed2413e514..a44771e8acdc 100644
--- a/drivers/net/phy/intel-xway.c
+++ b/drivers/net/phy/intel-xway.c
@@ -691,7 +691,7 @@ static struct phy_driver xway_gphy[] = {
 };
 module_phy_driver(xway_gphy);
 
-static struct mdio_device_id __maybe_unused xway_gphy_tbl[] = {
+static const struct mdio_device_id __maybe_unused xway_gphy_tbl[] = {
 	{ PHY_ID_PHY11G_1_3, 0xffffffff },
 	{ PHY_ID_PHY22F_1_3, 0xffffffff },
 	{ PHY_ID_PHY11G_1_4, 0xffffffff },
diff --git a/drivers/net/phy/lxt.c b/drivers/net/phy/lxt.c
index e3bf827b7959..5251a61c8b0f 100644
--- a/drivers/net/phy/lxt.c
+++ b/drivers/net/phy/lxt.c
@@ -348,7 +348,7 @@ static struct phy_driver lxt97x_driver[] = {
 
 module_phy_driver(lxt97x_driver);
 
-static struct mdio_device_id __maybe_unused lxt_tbl[] = {
+static const struct mdio_device_id __maybe_unused lxt_tbl[] = {
 	{ 0x78100000, 0xfffffff0 },
 	{ 0x001378e0, 0xfffffff0 },
 	{ 0x00137a10, 0xfffffff0 },
diff --git a/drivers/net/phy/marvell-88q2xxx.c b/drivers/net/phy/marvell-88q2xxx.c
index 5107f58338af..4494b3e39ce2 100644
--- a/drivers/net/phy/marvell-88q2xxx.c
+++ b/drivers/net/phy/marvell-88q2xxx.c
@@ -939,7 +939,7 @@ static struct phy_driver mv88q2xxx_driver[] = {
 
 module_phy_driver(mv88q2xxx_driver);
 
-static struct mdio_device_id __maybe_unused mv88q2xxx_tbl[] = {
+static const struct mdio_device_id __maybe_unused mv88q2xxx_tbl[] = {
 	{ MARVELL_PHY_ID_88Q2110, MARVELL_PHY_ID_MASK },
 	{ MARVELL_PHY_ID_88Q2220, MARVELL_PHY_ID_MASK },
 	{ /*sentinel*/ }
diff --git a/drivers/net/phy/marvell-88x2222.c b/drivers/net/phy/marvell-88x2222.c
index 0b777cdd7078..fad2f54c1eac 100644
--- a/drivers/net/phy/marvell-88x2222.c
+++ b/drivers/net/phy/marvell-88x2222.c
@@ -613,7 +613,7 @@ static struct phy_driver mv2222_drivers[] = {
 };
 module_phy_driver(mv2222_drivers);
 
-static struct mdio_device_id __maybe_unused mv2222_tbl[] = {
+static const struct mdio_device_id __maybe_unused mv2222_tbl[] = {
 	{ MARVELL_PHY_ID_88X2222, MARVELL_PHY_ID_MASK },
 	{ }
 };
diff --git a/drivers/net/phy/marvell.c b/drivers/net/phy/marvell.c
index ffe223ad9e5f..44e1927de499 100644
--- a/drivers/net/phy/marvell.c
+++ b/drivers/net/phy/marvell.c
@@ -4189,7 +4189,7 @@ static struct phy_driver marvell_drivers[] = {
 
 module_phy_driver(marvell_drivers);
 
-static struct mdio_device_id __maybe_unused marvell_tbl[] = {
+static const struct mdio_device_id __maybe_unused marvell_tbl[] = {
 	{ MARVELL_PHY_ID_88E1101, MARVELL_PHY_ID_MASK },
 	{ MARVELL_PHY_ID_88E3082, MARVELL_PHY_ID_MASK },
 	{ MARVELL_PHY_ID_88E1112, MARVELL_PHY_ID_MASK },
diff --git a/drivers/net/phy/marvell10g.c b/drivers/net/phy/marvell10g.c
index 6642eb642d4b..623bdb8466b8 100644
--- a/drivers/net/phy/marvell10g.c
+++ b/drivers/net/phy/marvell10g.c
@@ -1484,7 +1484,7 @@ static struct phy_driver mv3310_drivers[] = {
 
 module_phy_driver(mv3310_drivers);
 
-static struct mdio_device_id __maybe_unused mv3310_tbl[] = {
+static const struct mdio_device_id __maybe_unused mv3310_tbl[] = {
 	{ MARVELL_PHY_ID_88X3310, MARVELL_PHY_ID_MASK },
 	{ MARVELL_PHY_ID_88E2110, MARVELL_PHY_ID_MASK },
 	{ },
diff --git a/drivers/net/phy/mediatek/mtk-ge-soc.c b/drivers/net/phy/mediatek/mtk-ge-soc.c
index 38dc898eaf7b..bdf99b327029 100644
--- a/drivers/net/phy/mediatek/mtk-ge-soc.c
+++ b/drivers/net/phy/mediatek/mtk-ge-soc.c
@@ -1356,7 +1356,7 @@ static struct phy_driver mtk_socphy_driver[] = {
 
 module_phy_driver(mtk_socphy_driver);
 
-static struct mdio_device_id __maybe_unused mtk_socphy_tbl[] = {
+static const struct mdio_device_id __maybe_unused mtk_socphy_tbl[] = {
 	{ PHY_ID_MATCH_EXACT(MTK_GPHY_ID_MT7981) },
 	{ PHY_ID_MATCH_EXACT(MTK_GPHY_ID_MT7988) },
 	{ }
diff --git a/drivers/net/phy/mediatek/mtk-ge.c b/drivers/net/phy/mediatek/mtk-ge.c
index ed2617bc20f4..b517ca8573e7 100644
--- a/drivers/net/phy/mediatek/mtk-ge.c
+++ b/drivers/net/phy/mediatek/mtk-ge.c
@@ -93,7 +93,7 @@ static struct phy_driver mtk_gephy_driver[] = {
 
 module_phy_driver(mtk_gephy_driver);
 
-static struct mdio_device_id __maybe_unused mtk_gephy_tbl[] = {
+static const struct mdio_device_id __maybe_unused mtk_gephy_tbl[] = {
 	{ PHY_ID_MATCH_EXACT(MTK_GPHY_ID_MT7530) },
 	{ PHY_ID_MATCH_EXACT(MTK_GPHY_ID_MT7531) },
 	{ }
diff --git a/drivers/net/phy/meson-gxl.c b/drivers/net/phy/meson-gxl.c
index bb9b33b6bce2..962ebbbc1348 100644
--- a/drivers/net/phy/meson-gxl.c
+++ b/drivers/net/phy/meson-gxl.c
@@ -221,7 +221,7 @@ static struct phy_driver meson_gxl_phy[] = {
 	},
 };
 
-static struct mdio_device_id __maybe_unused meson_gxl_tbl[] = {
+static const struct mdio_device_id __maybe_unused meson_gxl_tbl[] = {
 	{ PHY_ID_MATCH_VENDOR(0x01814400) },
 	{ PHY_ID_MATCH_VENDOR(0x01803301) },
 	{ }
diff --git a/drivers/net/phy/micrel.c b/drivers/net/phy/micrel.c
index eeb33eb181ac..f69710dc7f96 100644
--- a/drivers/net/phy/micrel.c
+++ b/drivers/net/phy/micrel.c
@@ -5689,7 +5689,7 @@ MODULE_DESCRIPTION("Micrel PHY driver");
 MODULE_AUTHOR("David J. Choi");
 MODULE_LICENSE("GPL");
 
-static struct mdio_device_id __maybe_unused micrel_tbl[] = {
+static const struct mdio_device_id __maybe_unused micrel_tbl[] = {
 	{ PHY_ID_KSZ9021, 0x000ffffe },
 	{ PHY_ID_KSZ9031, MICREL_PHY_ID_MASK },
 	{ PHY_ID_KSZ9131, MICREL_PHY_ID_MASK },
diff --git a/drivers/net/phy/microchip.c b/drivers/net/phy/microchip.c
index 691969a4910f..0e17cc458efd 100644
--- a/drivers/net/phy/microchip.c
+++ b/drivers/net/phy/microchip.c
@@ -548,7 +548,7 @@ static struct phy_driver microchip_phy_driver[] = {
 
 module_phy_driver(microchip_phy_driver);
 
-static struct mdio_device_id __maybe_unused microchip_tbl[] = {
+static const struct mdio_device_id __maybe_unused microchip_tbl[] = {
 	{ 0x0007c132, 0xfffffff2 },
 	{ PHY_ID_MATCH_MODEL(PHY_ID_LAN937X_TX) },
 	{ }
diff --git a/drivers/net/phy/microchip_t1.c b/drivers/net/phy/microchip_t1.c
index 73f28463bc35..76e5b01832f3 100644
--- a/drivers/net/phy/microchip_t1.c
+++ b/drivers/net/phy/microchip_t1.c
@@ -2154,7 +2154,7 @@ static struct phy_driver microchip_t1_phy_driver[] = {
 
 module_phy_driver(microchip_t1_phy_driver);
 
-static struct mdio_device_id __maybe_unused microchip_t1_tbl[] = {
+static const struct mdio_device_id __maybe_unused microchip_t1_tbl[] = {
 	{ PHY_ID_MATCH_MODEL(PHY_ID_LAN87XX) },
 	{ PHY_ID_MATCH_MODEL(PHY_ID_LAN937X) },
 	{ PHY_ID_MATCH_MODEL(PHY_ID_LAN887X) },
diff --git a/drivers/net/phy/microchip_t1s.c b/drivers/net/phy/microchip_t1s.c
index 75d291154b4c..e50a0c102a86 100644
--- a/drivers/net/phy/microchip_t1s.c
+++ b/drivers/net/phy/microchip_t1s.c
@@ -497,7 +497,7 @@ static struct phy_driver microchip_t1s_driver[] = {
 
 module_phy_driver(microchip_t1s_driver);
 
-static struct mdio_device_id __maybe_unused tbl[] = {
+static const struct mdio_device_id __maybe_unused tbl[] = {
 	{ PHY_ID_MATCH_EXACT(PHY_ID_LAN867X_REVB1) },
 	{ PHY_ID_MATCH_EXACT(PHY_ID_LAN867X_REVC1) },
 	{ PHY_ID_MATCH_EXACT(PHY_ID_LAN867X_REVC2) },
diff --git a/drivers/net/phy/mscc/mscc_main.c b/drivers/net/phy/mscc/mscc_main.c
index bee381200ab8..19cf12ee8990 100644
--- a/drivers/net/phy/mscc/mscc_main.c
+++ b/drivers/net/phy/mscc/mscc_main.c
@@ -2699,7 +2699,7 @@ static struct phy_driver vsc85xx_driver[] = {
 
 module_phy_driver(vsc85xx_driver);
 
-static struct mdio_device_id __maybe_unused vsc85xx_tbl[] = {
+static const struct mdio_device_id __maybe_unused vsc85xx_tbl[] = {
 	{ PHY_ID_MATCH_VENDOR(PHY_VENDOR_MSCC) },
 	{ }
 };
diff --git a/drivers/net/phy/mxl-gpy.c b/drivers/net/phy/mxl-gpy.c
index a8ccf257c109..94d9cb727121 100644
--- a/drivers/net/phy/mxl-gpy.c
+++ b/drivers/net/phy/mxl-gpy.c
@@ -1274,7 +1274,7 @@ static struct phy_driver gpy_drivers[] = {
 };
 module_phy_driver(gpy_drivers);
 
-static struct mdio_device_id __maybe_unused gpy_tbl[] = {
+static const struct mdio_device_id __maybe_unused gpy_tbl[] = {
 	{PHY_ID_MATCH_MODEL(PHY_ID_GPY2xx)},
 	{PHY_ID_GPY115B, PHY_ID_GPYx15B_MASK},
 	{PHY_ID_MATCH_MODEL(PHY_ID_GPY115C)},
diff --git a/drivers/net/phy/national.c b/drivers/net/phy/national.c
index 9ae9cc6b23c2..7f3ff322892e 100644
--- a/drivers/net/phy/national.c
+++ b/drivers/net/phy/national.c
@@ -173,7 +173,7 @@ MODULE_DESCRIPTION("NatSemi PHY driver");
 MODULE_AUTHOR("Stuart Menefy");
 MODULE_LICENSE("GPL");
 
-static struct mdio_device_id __maybe_unused ns_tbl[] = {
+static const struct mdio_device_id __maybe_unused ns_tbl[] = {
 	{ DP83865_PHY_ID, 0xfffffff0 },
 	{ }
 };
diff --git a/drivers/net/phy/ncn26000.c b/drivers/net/phy/ncn26000.c
index 5680584f659e..cabdd83c614f 100644
--- a/drivers/net/phy/ncn26000.c
+++ b/drivers/net/phy/ncn26000.c
@@ -159,7 +159,7 @@ static struct phy_driver ncn26000_driver[] = {
 
 module_phy_driver(ncn26000_driver);
 
-static struct mdio_device_id __maybe_unused ncn26000_tbl[] = {
+static const struct mdio_device_id __maybe_unused ncn26000_tbl[] = {
 	{ PHY_ID_MATCH_MODEL(PHY_ID_NCN26000) },
 	{ }
 };
diff --git a/drivers/net/phy/nxp-c45-tja11xx.c b/drivers/net/phy/nxp-c45-tja11xx.c
index ade544bc007d..323717a4821f 100644
--- a/drivers/net/phy/nxp-c45-tja11xx.c
+++ b/drivers/net/phy/nxp-c45-tja11xx.c
@@ -2008,7 +2008,7 @@ static struct phy_driver nxp_c45_driver[] = {
 
 module_phy_driver(nxp_c45_driver);
 
-static struct mdio_device_id __maybe_unused nxp_c45_tbl[] = {
+static const struct mdio_device_id __maybe_unused nxp_c45_tbl[] = {
 	{ PHY_ID_MATCH_MODEL(PHY_ID_TJA_1103) },
 	{ PHY_ID_MATCH_MODEL(PHY_ID_TJA_1120) },
 	{ /*sentinel*/ },
diff --git a/drivers/net/phy/nxp-cbtx.c b/drivers/net/phy/nxp-cbtx.c
index 3d25491043a3..3286fcb4f47e 100644
--- a/drivers/net/phy/nxp-cbtx.c
+++ b/drivers/net/phy/nxp-cbtx.c
@@ -215,7 +215,7 @@ static struct phy_driver cbtx_driver[] = {
 
 module_phy_driver(cbtx_driver);
 
-static struct mdio_device_id __maybe_unused cbtx_tbl[] = {
+static const struct mdio_device_id __maybe_unused cbtx_tbl[] = {
 	{ PHY_ID_MATCH_MODEL(PHY_ID_CBTX_SJA1110) },
 	{ },
 };
diff --git a/drivers/net/phy/nxp-tja11xx.c b/drivers/net/phy/nxp-tja11xx.c
index 2c263ae44b4f..ed7fa26bac8e 100644
--- a/drivers/net/phy/nxp-tja11xx.c
+++ b/drivers/net/phy/nxp-tja11xx.c
@@ -888,7 +888,7 @@ static struct phy_driver tja11xx_driver[] = {
 
 module_phy_driver(tja11xx_driver);
 
-static struct mdio_device_id __maybe_unused tja11xx_tbl[] = {
+static const struct mdio_device_id __maybe_unused tja11xx_tbl[] = {
 	{ PHY_ID_MATCH_MODEL(PHY_ID_TJA1100) },
 	{ PHY_ID_MATCH_MODEL(PHY_ID_TJA1101) },
 	{ PHY_ID_MATCH_MODEL(PHY_ID_TJA1102) },
diff --git a/drivers/net/phy/qcom/at803x.c b/drivers/net/phy/qcom/at803x.c
index 105602581a03..26350b962890 100644
--- a/drivers/net/phy/qcom/at803x.c
+++ b/drivers/net/phy/qcom/at803x.c
@@ -1098,7 +1098,7 @@ static struct phy_driver at803x_driver[] = {
 
 module_phy_driver(at803x_driver);
 
-static struct mdio_device_id __maybe_unused atheros_tbl[] = {
+static const struct mdio_device_id __maybe_unused atheros_tbl[] = {
 	{ ATH8030_PHY_ID, AT8030_PHY_ID_MASK },
 	{ PHY_ID_MATCH_EXACT(ATH8031_PHY_ID) },
 	{ PHY_ID_MATCH_EXACT(ATH8032_PHY_ID) },
diff --git a/drivers/net/phy/qcom/qca807x.c b/drivers/net/phy/qcom/qca807x.c
index bd8a51ec0ecd..3279de857b47 100644
--- a/drivers/net/phy/qcom/qca807x.c
+++ b/drivers/net/phy/qcom/qca807x.c
@@ -828,7 +828,7 @@ static struct phy_driver qca807x_drivers[] = {
 };
 module_phy_driver(qca807x_drivers);
 
-static struct mdio_device_id __maybe_unused qca807x_tbl[] = {
+static const struct mdio_device_id __maybe_unused qca807x_tbl[] = {
 	{ PHY_ID_MATCH_EXACT(PHY_ID_QCA8072) },
 	{ PHY_ID_MATCH_EXACT(PHY_ID_QCA8075) },
 	{ }
diff --git a/drivers/net/phy/qcom/qca808x.c b/drivers/net/phy/qcom/qca808x.c
index 5048304ccc9e..71498c518f0f 100644
--- a/drivers/net/phy/qcom/qca808x.c
+++ b/drivers/net/phy/qcom/qca808x.c
@@ -655,7 +655,7 @@ static struct phy_driver qca808x_driver[] = {
 
 module_phy_driver(qca808x_driver);
 
-static struct mdio_device_id __maybe_unused qca808x_tbl[] = {
+static const struct mdio_device_id __maybe_unused qca808x_tbl[] = {
 	{ PHY_ID_MATCH_EXACT(QCA8081_PHY_ID) },
 	{ }
 };
diff --git a/drivers/net/phy/qcom/qca83xx.c b/drivers/net/phy/qcom/qca83xx.c
index 7a5039920b9f..bc70ed8efd86 100644
--- a/drivers/net/phy/qcom/qca83xx.c
+++ b/drivers/net/phy/qcom/qca83xx.c
@@ -259,7 +259,7 @@ static struct phy_driver qca83xx_driver[] = {
 
 module_phy_driver(qca83xx_driver);
 
-static struct mdio_device_id __maybe_unused qca83xx_tbl[] = {
+static const struct mdio_device_id __maybe_unused qca83xx_tbl[] = {
 	{ PHY_ID_MATCH_EXACT(QCA8337_PHY_ID) },
 	{ PHY_ID_MATCH_EXACT(QCA8327_A_PHY_ID) },
 	{ PHY_ID_MATCH_EXACT(QCA8327_B_PHY_ID) },
diff --git a/drivers/net/phy/qsemi.c b/drivers/net/phy/qsemi.c
index 30d15f7c9b03..7b70ba6cab66 100644
--- a/drivers/net/phy/qsemi.c
+++ b/drivers/net/phy/qsemi.c
@@ -155,7 +155,7 @@ static struct phy_driver qs6612_driver[] = { {
 
 module_phy_driver(qs6612_driver);
 
-static struct mdio_device_id __maybe_unused qs6612_tbl[] = {
+static const struct mdio_device_id __maybe_unused qs6612_tbl[] = {
 	{ 0x00181440, 0xfffffff0 },
 	{ }
 };
diff --git a/drivers/net/phy/rockchip.c b/drivers/net/phy/rockchip.c
index bb13e75183ee..b338f385e15a 100644
--- a/drivers/net/phy/rockchip.c
+++ b/drivers/net/phy/rockchip.c
@@ -188,7 +188,7 @@ static struct phy_driver rockchip_phy_driver[] = {
 
 module_phy_driver(rockchip_phy_driver);
 
-static struct mdio_device_id __maybe_unused rockchip_phy_tbl[] = {
+static const struct mdio_device_id __maybe_unused rockchip_phy_tbl[] = {
 	{ INTERNAL_EPHY_ID, 0xfffffff0 },
 	{ }
 };
diff --git a/drivers/net/phy/smsc.c b/drivers/net/phy/smsc.c
index e1853599d9ba..31463b9e5697 100644
--- a/drivers/net/phy/smsc.c
+++ b/drivers/net/phy/smsc.c
@@ -838,7 +838,7 @@ MODULE_DESCRIPTION("SMSC PHY driver");
 MODULE_AUTHOR("Herbert Valerio Riedel");
 MODULE_LICENSE("GPL");
 
-static struct mdio_device_id __maybe_unused smsc_tbl[] = {
+static const struct mdio_device_id __maybe_unused smsc_tbl[] = {
 	{ 0x0007c0a0, 0xfffffff0 },
 	{ 0x0007c0b0, 0xfffffff0 },
 	{ 0x0007c0c0, 0xfffffff0 },
diff --git a/drivers/net/phy/ste10Xp.c b/drivers/net/phy/ste10Xp.c
index 309e4c3496c4..d4835d4c50e0 100644
--- a/drivers/net/phy/ste10Xp.c
+++ b/drivers/net/phy/ste10Xp.c
@@ -124,7 +124,7 @@ static struct phy_driver ste10xp_pdriver[] = {
 
 module_phy_driver(ste10xp_pdriver);
 
-static struct mdio_device_id __maybe_unused ste10Xp_tbl[] = {
+static const struct mdio_device_id __maybe_unused ste10Xp_tbl[] = {
 	{ STE101P_PHY_ID, 0xfffffff0 },
 	{ STE100P_PHY_ID, 0xffffffff },
 	{ }
diff --git a/drivers/net/phy/teranetics.c b/drivers/net/phy/teranetics.c
index 8057ea8dbc21..752d4bf7bb99 100644
--- a/drivers/net/phy/teranetics.c
+++ b/drivers/net/phy/teranetics.c
@@ -87,7 +87,7 @@ static struct phy_driver teranetics_driver[] = {
 
 module_phy_driver(teranetics_driver);
 
-static struct mdio_device_id __maybe_unused teranetics_tbl[] = {
+static const struct mdio_device_id __maybe_unused teranetics_tbl[] = {
 	{ PHY_ID_TN2020, 0xffffffff },
 	{ }
 };
diff --git a/drivers/net/phy/uPD60620.c b/drivers/net/phy/uPD60620.c
index 38834347a427..900cb756c366 100644
--- a/drivers/net/phy/uPD60620.c
+++ b/drivers/net/phy/uPD60620.c
@@ -90,7 +90,7 @@ static struct phy_driver upd60620_driver[1] = { {
 
 module_phy_driver(upd60620_driver);
 
-static struct mdio_device_id __maybe_unused upd60620_tbl[] = {
+static const struct mdio_device_id __maybe_unused upd60620_tbl[] = {
 	{ UPD60620_PHY_ID, 0xfffffffe },
 	{ }
 };
diff --git a/drivers/net/phy/vitesse.c b/drivers/net/phy/vitesse.c
index 2377179de017..b1b7bbba284e 100644
--- a/drivers/net/phy/vitesse.c
+++ b/drivers/net/phy/vitesse.c
@@ -674,7 +674,7 @@ static struct phy_driver vsc82xx_driver[] = {
 
 module_phy_driver(vsc82xx_driver);
 
-static struct mdio_device_id __maybe_unused vitesse_tbl[] = {
+static const struct mdio_device_id __maybe_unused vitesse_tbl[] = {
 	{ PHY_ID_VSC8234, 0x000ffff0 },
 	{ PHY_ID_VSC8244, 0x000fffc0 },
 	{ PHY_ID_VSC8572, 0x000ffff0 },
-- 
2.47.1


