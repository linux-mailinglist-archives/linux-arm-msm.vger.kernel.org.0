Return-Path: <linux-arm-msm+bounces-6933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2CC829A09
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jan 2024 13:00:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5DDC71F25E63
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jan 2024 12:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF8E94A9A2;
	Wed, 10 Jan 2024 11:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EVChuEYD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F58495FA;
	Wed, 10 Jan 2024 11:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40e5521dab6so7747705e9.1;
        Wed, 10 Jan 2024 03:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704887891; x=1705492691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3gC5sFrLKailmw7Ih0rq8tcQ1TFJrDnCzR4F2JCcuEs=;
        b=EVChuEYDOcd8RWOtNMSHQ39J8S4HtjU6/4mjqrjmReYk5YqopceYsGP4+lgPExQ5h8
         DinXrim9Xr4mG47o+7sa5a1K5bqXVfpEKnPEIqvdzLE7Y/E4tzYo7rENblgkhNqtCp7O
         j9faMNKRCAgQTFBq93NLJ3NAhz/GbVk0QaNlE2B8yeaTFeV7G3eo7430SfSN3p2IthaB
         C0FeZOzwIu1QzbA+g3N7VJ+btmuBzeFJdnRLMG5oVir++9pgu6VftSwen7moyxIRv+Nf
         m6w/oEK0dzp/rDwYeIZfTY1hIuxQmBRoSpuZlp4qeCGMkZEASypCXNOPDiCO6pJitDHn
         qqRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704887891; x=1705492691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3gC5sFrLKailmw7Ih0rq8tcQ1TFJrDnCzR4F2JCcuEs=;
        b=xMdrXQ2oNoVJ36jG3JC/W8iT+O1FoQgNNrJYPAiG2MBP6yrNqDQPVNZDnm+YKap9JJ
         6Ohtck824JEpb1J6PUJep2gQjDSZ7OuChy25Tff3WFGSnmdZrRDS5c+jbvSbfxgx6jgB
         zEedSa/tyGTY70d/J7+GeJDRDzdgVIGnaBldmLaI3O/FtRWtn/ssKfEIN1+z1/tDQMrs
         iG5OZZPaxqdzt+XFkDhaOtvEGsbdttkS2G9nc9CYhpyQFQEJ0cEMmDg2Kkcq9udexLBt
         c63LaunVi7TlzPzdmANKbVXKP0+m9+ik36JDCyf2HplsBzeAjs5PUzoh6qAFimZBsd7S
         vSIw==
X-Gm-Message-State: AOJu0YyWgeAWSM+jYNuuq+gWI1hfsEn+to/4/29hXwNkLItrXgp9bEQ8
	I4HiaT5ewi9IzfzBX3mwhx8=
X-Google-Smtp-Source: AGHT+IHcRmxl6QMcr8zzEnItaU6yxW/lhNki9JM1m2vYzE5Nf/KOT35767a3NUzj3FgprI54vT1rvA==
X-Received: by 2002:a05:600c:35d0:b0:40d:8855:a79b with SMTP id r16-20020a05600c35d000b0040d8855a79bmr554321wmq.78.1704887890722;
        Wed, 10 Jan 2024 03:58:10 -0800 (PST)
Received: from localhost.localdomain ([78.209.40.150])
        by smtp.googlemail.com with ESMTPSA id f17-20020a05600c155100b0040d62f89381sm1962136wmg.35.2024.01.10.03.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 03:58:10 -0800 (PST)
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
Subject: [net-next RFC PATCH 5/5] net: phy: qcom: detach qca808x PHY driver from at803x
Date: Wed, 10 Jan 2024 12:57:35 +0100
Message-ID: <20240110115741.17300-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240110115741.17300-1-ansuelsmth@gmail.com>
References: <20240110115741.17300-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Almost all the QCA8081 PHY driver OPs are specific and only some of them
use the generic at803x.

To make the at803x code slimmer, move all the specific qca808x regs and
functions to a dedicated PHY driver.

Probe function and priv struct is reworked to allocate and use only the
qca808x specific data. Unused data from at803x PHY driver are dropped
from at803x priv struct.

Also a new Kconfig is introduced QCA808X_PHY, to compile the newly
introduced PHY driver for QCA8081 PHY.

As the Kconfig name starts with Qualcomm the same order is kept.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/qcom/Kconfig   |   6 +
 drivers/net/phy/qcom/Makefile  |   1 +
 drivers/net/phy/qcom/at803x.c  | 895 +------------------------------
 drivers/net/phy/qcom/qca808x.c | 934 +++++++++++++++++++++++++++++++++
 4 files changed, 942 insertions(+), 894 deletions(-)
 create mode 100644 drivers/net/phy/qcom/qca808x.c

diff --git a/drivers/net/phy/qcom/Kconfig b/drivers/net/phy/qcom/Kconfig
index bdd55a2f6b3c..30c8ab95e4ca 100644
--- a/drivers/net/phy/qcom/Kconfig
+++ b/drivers/net/phy/qcom/Kconfig
@@ -14,3 +14,9 @@ config QCA83XX_PHY
 	select QCOM_NET_PHYLIB
 	help
 	  Currently supports the internal QCA8337(Internal qca8k PHY) model
+
+config QCA808X_PHY
+	tristate "Qualcomm QCA808x PHYs"
+	select QCOM_NET_PHYLIB
+	help
+	  Currently supports the QCA8081 model
diff --git a/drivers/net/phy/qcom/Makefile b/drivers/net/phy/qcom/Makefile
index 3d98e397e063..0362d7ed47be 100644
--- a/drivers/net/phy/qcom/Makefile
+++ b/drivers/net/phy/qcom/Makefile
@@ -2,3 +2,4 @@
 obj-$(CONFIG_QCOM_NET_PHYLIB)	+= qcom-phy-lib.o
 obj-$(CONFIG_AT803X_PHY)	+= at803x.o
 obj-$(CONFIG_QCA83XX_PHY)	+= qca83xx.o
+obj-$(CONFIG_QCA808X_PHY)	+= qca808x.o
diff --git a/drivers/net/phy/qcom/at803x.c b/drivers/net/phy/qcom/at803x.c
index e04cc2aa3e34..e158c205fa5f 100644
--- a/drivers/net/phy/qcom/at803x.c
+++ b/drivers/net/phy/qcom/at803x.c
@@ -96,8 +96,6 @@
 #define ATH8035_PHY_ID				0x004dd072
 #define AT8030_PHY_ID_MASK			0xffffffef
 
-#define QCA8081_PHY_ID				0x004dd101
-
 #define QCA9561_PHY_ID				0x004dd042
 
 #define AT803X_SS_SPEED_MASK			GENMASK(15, 14)
@@ -112,201 +110,7 @@
 /* disable hibernation mode */
 #define AT803X_DISABLE_HIBERNATION_MODE		BIT(2)
 
-/* ADC threshold */
-#define QCA808X_PHY_DEBUG_ADC_THRESHOLD		0x2c80
-#define QCA808X_ADC_THRESHOLD_MASK		GENMASK(7, 0)
-#define QCA808X_ADC_THRESHOLD_80MV		0
-#define QCA808X_ADC_THRESHOLD_100MV		0xf0
-#define QCA808X_ADC_THRESHOLD_200MV		0x0f
-#define QCA808X_ADC_THRESHOLD_300MV		0xff
-
-/* CLD control */
-#define QCA808X_PHY_MMD3_ADDR_CLD_CTRL7		0x8007
-#define QCA808X_8023AZ_AFE_CTRL_MASK		GENMASK(8, 4)
-#define QCA808X_8023AZ_AFE_EN			0x90
-
-/* AZ control */
-#define QCA808X_PHY_MMD3_AZ_TRAINING_CTRL	0x8008
-#define QCA808X_MMD3_AZ_TRAINING_VAL		0x1c32
-
-#define QCA808X_PHY_MMD1_MSE_THRESHOLD_20DB	0x8014
-#define QCA808X_MSE_THRESHOLD_20DB_VALUE	0x529
-
-#define QCA808X_PHY_MMD1_MSE_THRESHOLD_17DB	0x800E
-#define QCA808X_MSE_THRESHOLD_17DB_VALUE	0x341
-
-#define QCA808X_PHY_MMD1_MSE_THRESHOLD_27DB	0x801E
-#define QCA808X_MSE_THRESHOLD_27DB_VALUE	0x419
-
-#define QCA808X_PHY_MMD1_MSE_THRESHOLD_28DB	0x8020
-#define QCA808X_MSE_THRESHOLD_28DB_VALUE	0x341
-
-#define QCA808X_PHY_MMD7_TOP_OPTION1		0x901c
-#define QCA808X_TOP_OPTION1_DATA		0x0
-
-#define QCA808X_PHY_MMD3_DEBUG_1		0xa100
-#define QCA808X_MMD3_DEBUG_1_VALUE		0x9203
-#define QCA808X_PHY_MMD3_DEBUG_2		0xa101
-#define QCA808X_MMD3_DEBUG_2_VALUE		0x48ad
-#define QCA808X_PHY_MMD3_DEBUG_3		0xa103
-#define QCA808X_MMD3_DEBUG_3_VALUE		0x1698
-#define QCA808X_PHY_MMD3_DEBUG_4		0xa105
-#define QCA808X_MMD3_DEBUG_4_VALUE		0x8001
-#define QCA808X_PHY_MMD3_DEBUG_5		0xa106
-#define QCA808X_MMD3_DEBUG_5_VALUE		0x1111
-#define QCA808X_PHY_MMD3_DEBUG_6		0xa011
-#define QCA808X_MMD3_DEBUG_6_VALUE		0x5f85
-
-/* master/slave seed config */
-#define QCA808X_PHY_DEBUG_LOCAL_SEED		9
-#define QCA808X_MASTER_SLAVE_SEED_ENABLE	BIT(1)
-#define QCA808X_MASTER_SLAVE_SEED_CFG		GENMASK(12, 2)
-#define QCA808X_MASTER_SLAVE_SEED_RANGE		0x32
-
-/* Hibernation yields lower power consumpiton in contrast with normal operation mode.
- * when the copper cable is unplugged, the PHY enters into hibernation mode in about 10s.
- */
-#define QCA808X_DBG_AN_TEST			0xb
-#define QCA808X_HIBERNATION_EN			BIT(15)
-
-#define QCA808X_CDT_ENABLE_TEST			BIT(15)
-#define QCA808X_CDT_INTER_CHECK_DIS		BIT(13)
-#define QCA808X_CDT_STATUS			BIT(11)
-#define QCA808X_CDT_LENGTH_UNIT			BIT(10)
-
-#define QCA808X_MMD3_CDT_STATUS			0x8064
-#define QCA808X_MMD3_CDT_DIAG_PAIR_A		0x8065
-#define QCA808X_MMD3_CDT_DIAG_PAIR_B		0x8066
-#define QCA808X_MMD3_CDT_DIAG_PAIR_C		0x8067
-#define QCA808X_MMD3_CDT_DIAG_PAIR_D		0x8068
-#define QCA808X_CDT_DIAG_LENGTH_SAME_SHORT	GENMASK(15, 8)
-#define QCA808X_CDT_DIAG_LENGTH_CROSS_SHORT	GENMASK(7, 0)
-
-#define QCA808X_CDT_CODE_PAIR_A			GENMASK(15, 12)
-#define QCA808X_CDT_CODE_PAIR_B			GENMASK(11, 8)
-#define QCA808X_CDT_CODE_PAIR_C			GENMASK(7, 4)
-#define QCA808X_CDT_CODE_PAIR_D			GENMASK(3, 0)
-
-#define QCA808X_CDT_STATUS_STAT_TYPE		GENMASK(1, 0)
-#define QCA808X_CDT_STATUS_STAT_FAIL		FIELD_PREP_CONST(QCA808X_CDT_STATUS_STAT_TYPE, 0)
-#define QCA808X_CDT_STATUS_STAT_NORMAL		FIELD_PREP_CONST(QCA808X_CDT_STATUS_STAT_TYPE, 1)
-#define QCA808X_CDT_STATUS_STAT_SAME_OPEN	FIELD_PREP_CONST(QCA808X_CDT_STATUS_STAT_TYPE, 2)
-#define QCA808X_CDT_STATUS_STAT_SAME_SHORT	FIELD_PREP_CONST(QCA808X_CDT_STATUS_STAT_TYPE, 3)
-
-#define QCA808X_CDT_STATUS_STAT_MDI		GENMASK(3, 2)
-#define QCA808X_CDT_STATUS_STAT_MDI1		FIELD_PREP_CONST(QCA808X_CDT_STATUS_STAT_MDI, 1)
-#define QCA808X_CDT_STATUS_STAT_MDI2		FIELD_PREP_CONST(QCA808X_CDT_STATUS_STAT_MDI, 2)
-#define QCA808X_CDT_STATUS_STAT_MDI3		FIELD_PREP_CONST(QCA808X_CDT_STATUS_STAT_MDI, 3)
-
-/* NORMAL are MDI with type set to 0 */
-#define QCA808X_CDT_STATUS_STAT_CROSS_SHORT_WITH_MDI1_SAME_NORMAL	QCA808X_CDT_STATUS_STAT_MDI1
-#define QCA808X_CDT_STATUS_STAT_CROSS_SHORT_WITH_MDI1_SAME_OPEN		(QCA808X_CDT_STATUS_STAT_SAME_OPEN |\
-									 QCA808X_CDT_STATUS_STAT_MDI1)
-#define QCA808X_CDT_STATUS_STAT_CROSS_SHORT_WITH_MDI1_SAME_SHORT	(QCA808X_CDT_STATUS_STAT_SAME_SHORT |\
-									 QCA808X_CDT_STATUS_STAT_MDI1)
-#define QCA808X_CDT_STATUS_STAT_CROSS_SHORT_WITH_MDI2_SAME_NORMAL	QCA808X_CDT_STATUS_STAT_MDI2
-#define QCA808X_CDT_STATUS_STAT_CROSS_SHORT_WITH_MDI2_SAME_OPEN		(QCA808X_CDT_STATUS_STAT_SAME_OPEN |\
-									 QCA808X_CDT_STATUS_STAT_MDI2)
-#define QCA808X_CDT_STATUS_STAT_CROSS_SHORT_WITH_MDI2_SAME_SHORT	(QCA808X_CDT_STATUS_STAT_SAME_SHORT |\
-									 QCA808X_CDT_STATUS_STAT_MDI2)
-#define QCA808X_CDT_STATUS_STAT_CROSS_SHORT_WITH_MDI3_SAME_NORMAL	QCA808X_CDT_STATUS_STAT_MDI3
-#define QCA808X_CDT_STATUS_STAT_CROSS_SHORT_WITH_MDI3_SAME_OPEN		(QCA808X_CDT_STATUS_STAT_SAME_OPEN |\
-									 QCA808X_CDT_STATUS_STAT_MDI3)
-#define QCA808X_CDT_STATUS_STAT_CROSS_SHORT_WITH_MDI3_SAME_SHORT	(QCA808X_CDT_STATUS_STAT_SAME_SHORT |\
-									 QCA808X_CDT_STATUS_STAT_MDI3)
-
-/* Added for reference of existence but should be handled by wait_for_completion already */
-#define QCA808X_CDT_STATUS_STAT_BUSY		(BIT(1) | BIT(3))
-
-#define QCA808X_MMD7_LED_GLOBAL			0x8073
-#define QCA808X_LED_BLINK_1			GENMASK(11, 6)
-#define QCA808X_LED_BLINK_2			GENMASK(5, 0)
-/* Values are the same for both BLINK_1 and BLINK_2 */
-#define QCA808X_LED_BLINK_FREQ_MASK		GENMASK(5, 3)
-#define QCA808X_LED_BLINK_FREQ_2HZ		FIELD_PREP(QCA808X_LED_BLINK_FREQ_MASK, 0x0)
-#define QCA808X_LED_BLINK_FREQ_4HZ		FIELD_PREP(QCA808X_LED_BLINK_FREQ_MASK, 0x1)
-#define QCA808X_LED_BLINK_FREQ_8HZ		FIELD_PREP(QCA808X_LED_BLINK_FREQ_MASK, 0x2)
-#define QCA808X_LED_BLINK_FREQ_16HZ		FIELD_PREP(QCA808X_LED_BLINK_FREQ_MASK, 0x3)
-#define QCA808X_LED_BLINK_FREQ_32HZ		FIELD_PREP(QCA808X_LED_BLINK_FREQ_MASK, 0x4)
-#define QCA808X_LED_BLINK_FREQ_64HZ		FIELD_PREP(QCA808X_LED_BLINK_FREQ_MASK, 0x5)
-#define QCA808X_LED_BLINK_FREQ_128HZ		FIELD_PREP(QCA808X_LED_BLINK_FREQ_MASK, 0x6)
-#define QCA808X_LED_BLINK_FREQ_256HZ		FIELD_PREP(QCA808X_LED_BLINK_FREQ_MASK, 0x7)
-#define QCA808X_LED_BLINK_DUTY_MASK		GENMASK(2, 0)
-#define QCA808X_LED_BLINK_DUTY_50_50		FIELD_PREP(QCA808X_LED_BLINK_DUTY_MASK, 0x0)
-#define QCA808X_LED_BLINK_DUTY_75_25		FIELD_PREP(QCA808X_LED_BLINK_DUTY_MASK, 0x1)
-#define QCA808X_LED_BLINK_DUTY_25_75		FIELD_PREP(QCA808X_LED_BLINK_DUTY_MASK, 0x2)
-#define QCA808X_LED_BLINK_DUTY_33_67		FIELD_PREP(QCA808X_LED_BLINK_DUTY_MASK, 0x3)
-#define QCA808X_LED_BLINK_DUTY_67_33		FIELD_PREP(QCA808X_LED_BLINK_DUTY_MASK, 0x4)
-#define QCA808X_LED_BLINK_DUTY_17_83		FIELD_PREP(QCA808X_LED_BLINK_DUTY_MASK, 0x5)
-#define QCA808X_LED_BLINK_DUTY_83_17		FIELD_PREP(QCA808X_LED_BLINK_DUTY_MASK, 0x6)
-#define QCA808X_LED_BLINK_DUTY_8_92		FIELD_PREP(QCA808X_LED_BLINK_DUTY_MASK, 0x7)
-
-#define QCA808X_MMD7_LED2_CTRL			0x8074
-#define QCA808X_MMD7_LED2_FORCE_CTRL		0x8075
-#define QCA808X_MMD7_LED1_CTRL			0x8076
-#define QCA808X_MMD7_LED1_FORCE_CTRL		0x8077
-#define QCA808X_MMD7_LED0_CTRL			0x8078
-#define QCA808X_MMD7_LED_CTRL(x)		(0x8078 - ((x) * 2))
-
-/* LED hw control pattern is the same for every LED */
-#define QCA808X_LED_PATTERN_MASK		GENMASK(15, 0)
-#define QCA808X_LED_SPEED2500_ON		BIT(15)
-#define QCA808X_LED_SPEED2500_BLINK		BIT(14)
-/* Follow blink trigger even if duplex or speed condition doesn't match */
-#define QCA808X_LED_BLINK_CHECK_BYPASS		BIT(13)
-#define QCA808X_LED_FULL_DUPLEX_ON		BIT(12)
-#define QCA808X_LED_HALF_DUPLEX_ON		BIT(11)
-#define QCA808X_LED_TX_BLINK			BIT(10)
-#define QCA808X_LED_RX_BLINK			BIT(9)
-#define QCA808X_LED_TX_ON_10MS			BIT(8)
-#define QCA808X_LED_RX_ON_10MS			BIT(7)
-#define QCA808X_LED_SPEED1000_ON		BIT(6)
-#define QCA808X_LED_SPEED100_ON			BIT(5)
-#define QCA808X_LED_SPEED10_ON			BIT(4)
-#define QCA808X_LED_COLLISION_BLINK		BIT(3)
-#define QCA808X_LED_SPEED1000_BLINK		BIT(2)
-#define QCA808X_LED_SPEED100_BLINK		BIT(1)
-#define QCA808X_LED_SPEED10_BLINK		BIT(0)
-
-#define QCA808X_MMD7_LED0_FORCE_CTRL		0x8079
-#define QCA808X_MMD7_LED_FORCE_CTRL(x)		(0x8079 - ((x) * 2))
-
-/* LED force ctrl is the same for every LED
- * No documentation exist for this, not even internal one
- * with NDA as QCOM gives only info about configuring
- * hw control pattern rules and doesn't indicate any way
- * to force the LED to specific mode.
- * These define comes from reverse and testing and maybe
- * lack of some info or some info are not entirely correct.
- * For the basic LED control and hw control these finding
- * are enough to support LED control in all the required APIs.
- *
- * On doing some comparison with implementation with qca807x,
- * it was found that it's 1:1 equal to it and confirms all the
- * reverse done. It was also found further specification with the
- * force mode and the blink modes.
- */
-#define QCA808X_LED_FORCE_EN			BIT(15)
-#define QCA808X_LED_FORCE_MODE_MASK		GENMASK(14, 13)
-#define QCA808X_LED_FORCE_BLINK_1		FIELD_PREP(QCA808X_LED_FORCE_MODE_MASK, 0x3)
-#define QCA808X_LED_FORCE_BLINK_2		FIELD_PREP(QCA808X_LED_FORCE_MODE_MASK, 0x2)
-#define QCA808X_LED_FORCE_ON			FIELD_PREP(QCA808X_LED_FORCE_MODE_MASK, 0x1)
-#define QCA808X_LED_FORCE_OFF			FIELD_PREP(QCA808X_LED_FORCE_MODE_MASK, 0x0)
-
-#define QCA808X_MMD7_LED_POLARITY_CTRL		0x901a
-/* QSDK sets by default 0x46 to this reg that sets BIT 6 for
- * LED to active high. It's not clear what BIT 3 and BIT 4 does.
- */
-#define QCA808X_LED_ACTIVE_HIGH			BIT(6)
-
-/* QCA808X 1G chip type */
-#define QCA808X_PHY_MMD7_CHIP_TYPE		0x901d
-#define QCA808X_PHY_CHIP_TYPE_1G		BIT(0)
-
-#define QCA8081_PHY_SERDES_MMD1_FIFO_CTRL	0x9072
-#define QCA8081_PHY_FIFO_RSTN			BIT(11)
-
-MODULE_DESCRIPTION("Qualcomm Atheros AR803x and QCA808X PHY driver");
+MODULE_DESCRIPTION("Qualcomm Atheros AR803x PHY driver");
 MODULE_AUTHOR("Matus Ujhelyi");
 MODULE_LICENSE("GPL");
 
@@ -320,7 +124,6 @@ struct at803x_priv {
 	bool is_1000basex;
 	struct regulator_dev *vddio_rdev;
 	struct regulator_dev *vddh_rdev;
-	int led_polarity_mode;
 };
 
 struct at803x_context {
@@ -521,9 +324,6 @@ static int at803x_probe(struct phy_device *phydev)
 	if (!priv)
 		return -ENOMEM;
 
-	/* Init LED polarity mode to -1 */
-	priv->led_polarity_mode = -1;
-
 	phydev->priv = priv;
 
 	ret = at803x_parse_dt(phydev);
@@ -1218,670 +1018,6 @@ static int at8035_probe(struct phy_device *phydev)
 	return at8035_parse_dt(phydev);
 }
 
-static int qca808x_phy_fast_retrain_config(struct phy_device *phydev)
-{
-	int ret;
-
-	/* Enable fast retrain */
-	ret = genphy_c45_fast_retrain(phydev, true);
-	if (ret)
-		return ret;
-
-	phy_write_mmd(phydev, MDIO_MMD_AN, QCA808X_PHY_MMD7_TOP_OPTION1,
-		      QCA808X_TOP_OPTION1_DATA);
-	phy_write_mmd(phydev, MDIO_MMD_PMAPMD, QCA808X_PHY_MMD1_MSE_THRESHOLD_20DB,
-		      QCA808X_MSE_THRESHOLD_20DB_VALUE);
-	phy_write_mmd(phydev, MDIO_MMD_PMAPMD, QCA808X_PHY_MMD1_MSE_THRESHOLD_17DB,
-		      QCA808X_MSE_THRESHOLD_17DB_VALUE);
-	phy_write_mmd(phydev, MDIO_MMD_PMAPMD, QCA808X_PHY_MMD1_MSE_THRESHOLD_27DB,
-		      QCA808X_MSE_THRESHOLD_27DB_VALUE);
-	phy_write_mmd(phydev, MDIO_MMD_PMAPMD, QCA808X_PHY_MMD1_MSE_THRESHOLD_28DB,
-		      QCA808X_MSE_THRESHOLD_28DB_VALUE);
-	phy_write_mmd(phydev, MDIO_MMD_PCS, QCA808X_PHY_MMD3_DEBUG_1,
-		      QCA808X_MMD3_DEBUG_1_VALUE);
-	phy_write_mmd(phydev, MDIO_MMD_PCS, QCA808X_PHY_MMD3_DEBUG_4,
-		      QCA808X_MMD3_DEBUG_4_VALUE);
-	phy_write_mmd(phydev, MDIO_MMD_PCS, QCA808X_PHY_MMD3_DEBUG_5,
-		      QCA808X_MMD3_DEBUG_5_VALUE);
-	phy_write_mmd(phydev, MDIO_MMD_PCS, QCA808X_PHY_MMD3_DEBUG_3,
-		      QCA808X_MMD3_DEBUG_3_VALUE);
-	phy_write_mmd(phydev, MDIO_MMD_PCS, QCA808X_PHY_MMD3_DEBUG_6,
-		      QCA808X_MMD3_DEBUG_6_VALUE);
-	phy_write_mmd(phydev, MDIO_MMD_PCS, QCA808X_PHY_MMD3_DEBUG_2,
-		      QCA808X_MMD3_DEBUG_2_VALUE);
-
-	return 0;
-}
-
-static int qca808x_phy_ms_seed_enable(struct phy_device *phydev, bool enable)
-{
-	u16 seed_value;
-
-	if (!enable)
-		return at803x_debug_reg_mask(phydev, QCA808X_PHY_DEBUG_LOCAL_SEED,
-				QCA808X_MASTER_SLAVE_SEED_ENABLE, 0);
-
-	seed_value = get_random_u32_below(QCA808X_MASTER_SLAVE_SEED_RANGE);
-	return at803x_debug_reg_mask(phydev, QCA808X_PHY_DEBUG_LOCAL_SEED,
-			QCA808X_MASTER_SLAVE_SEED_CFG | QCA808X_MASTER_SLAVE_SEED_ENABLE,
-			FIELD_PREP(QCA808X_MASTER_SLAVE_SEED_CFG, seed_value) |
-			QCA808X_MASTER_SLAVE_SEED_ENABLE);
-}
-
-static bool qca808x_is_prefer_master(struct phy_device *phydev)
-{
-	return (phydev->master_slave_get == MASTER_SLAVE_CFG_MASTER_FORCE) ||
-		(phydev->master_slave_get == MASTER_SLAVE_CFG_MASTER_PREFERRED);
-}
-
-static bool qca808x_has_fast_retrain_or_slave_seed(struct phy_device *phydev)
-{
-	return linkmode_test_bit(ETHTOOL_LINK_MODE_2500baseT_Full_BIT, phydev->supported);
-}
-
-static int qca808x_config_init(struct phy_device *phydev)
-{
-	int ret;
-
-	/* Active adc&vga on 802.3az for the link 1000M and 100M */
-	ret = phy_modify_mmd(phydev, MDIO_MMD_PCS, QCA808X_PHY_MMD3_ADDR_CLD_CTRL7,
-			     QCA808X_8023AZ_AFE_CTRL_MASK, QCA808X_8023AZ_AFE_EN);
-	if (ret)
-		return ret;
-
-	/* Adjust the threshold on 802.3az for the link 1000M */
-	ret = phy_write_mmd(phydev, MDIO_MMD_PCS,
-			    QCA808X_PHY_MMD3_AZ_TRAINING_CTRL,
-			    QCA808X_MMD3_AZ_TRAINING_VAL);
-	if (ret)
-		return ret;
-
-	if (qca808x_has_fast_retrain_or_slave_seed(phydev)) {
-		/* Config the fast retrain for the link 2500M */
-		ret = qca808x_phy_fast_retrain_config(phydev);
-		if (ret)
-			return ret;
-
-		ret = genphy_read_master_slave(phydev);
-		if (ret < 0)
-			return ret;
-
-		if (!qca808x_is_prefer_master(phydev)) {
-			/* Enable seed and configure lower ramdom seed to make phy
-			 * linked as slave mode.
-			 */
-			ret = qca808x_phy_ms_seed_enable(phydev, true);
-			if (ret)
-				return ret;
-		}
-	}
-
-	/* Configure adc threshold as 100mv for the link 10M */
-	return at803x_debug_reg_mask(phydev, QCA808X_PHY_DEBUG_ADC_THRESHOLD,
-				     QCA808X_ADC_THRESHOLD_MASK,
-				     QCA808X_ADC_THRESHOLD_100MV);
-}
-
-static int qca808x_read_status(struct phy_device *phydev)
-{
-	struct at803x_ss_mask ss_mask = { 0 };
-	int ret;
-
-	ret = phy_read_mmd(phydev, MDIO_MMD_AN, MDIO_AN_10GBT_STAT);
-	if (ret < 0)
-		return ret;
-
-	linkmode_mod_bit(ETHTOOL_LINK_MODE_2500baseT_Full_BIT, phydev->lp_advertising,
-			 ret & MDIO_AN_10GBT_STAT_LP2_5G);
-
-	ret = genphy_read_status(phydev);
-	if (ret)
-		return ret;
-
-	/* qca8081 takes the different bits for speed value from at803x */
-	ss_mask.speed_mask = QCA808X_SS_SPEED_MASK;
-	ss_mask.speed_shift = __bf_shf(QCA808X_SS_SPEED_MASK);
-	ret = at803x_read_specific_status(phydev, ss_mask);
-	if (ret < 0)
-		return ret;
-
-	if (phydev->link) {
-		if (phydev->speed == SPEED_2500)
-			phydev->interface = PHY_INTERFACE_MODE_2500BASEX;
-		else
-			phydev->interface = PHY_INTERFACE_MODE_SGMII;
-	} else {
-		/* generate seed as a lower random value to make PHY linked as SLAVE easily,
-		 * except for master/slave configuration fault detected or the master mode
-		 * preferred.
-		 *
-		 * the reason for not putting this code into the function link_change_notify is
-		 * the corner case where the link partner is also the qca8081 PHY and the seed
-		 * value is configured as the same value, the link can't be up and no link change
-		 * occurs.
-		 */
-		if (qca808x_has_fast_retrain_or_slave_seed(phydev)) {
-			if (phydev->master_slave_state == MASTER_SLAVE_STATE_ERR ||
-			    qca808x_is_prefer_master(phydev)) {
-				qca808x_phy_ms_seed_enable(phydev, false);
-			} else {
-				qca808x_phy_ms_seed_enable(phydev, true);
-			}
-		}
-	}
-
-	return 0;
-}
-
-static int qca808x_soft_reset(struct phy_device *phydev)
-{
-	int ret;
-
-	ret = genphy_soft_reset(phydev);
-	if (ret < 0)
-		return ret;
-
-	if (qca808x_has_fast_retrain_or_slave_seed(phydev))
-		ret = qca808x_phy_ms_seed_enable(phydev, true);
-
-	return ret;
-}
-
-static bool qca808x_cdt_fault_length_valid(int cdt_code)
-{
-	switch (cdt_code) {
-	case QCA808X_CDT_STATUS_STAT_SAME_SHORT:
-	case QCA808X_CDT_STATUS_STAT_SAME_OPEN:
-	case QCA808X_CDT_STATUS_STAT_CROSS_SHORT_WITH_MDI1_SAME_NORMAL:
-	case QCA808X_CDT_STATUS_STAT_CROSS_SHORT_WITH_MDI1_SAME_OPEN:
-	case QCA808X_CDT_STATUS_STAT_CROSS_SHORT_WITH_MDI1_SAME_SHORT:
-	case QCA808X_CDT_STATUS_STAT_CROSS_SHORT_WITH_MDI2_SAME_NORMAL:
-	case QCA808X_CDT_STATUS_STAT_CROSS_SHORT_WITH_MDI2_SAME_OPEN:
-	case QCA808X_CDT_STATUS_STAT_CROSS_SHORT_WITH_MDI2_SAME_SHORT:
-	case QCA808X_CDT_STATUS_STAT_CROSS_SHORT_WITH_MDI3_SAME_NORMAL:
-	case QCA808X_CDT_STATUS_STAT_CROSS_SHORT_WITH_MDI3_SAME_OPEN:
-	case QCA808X_CDT_STATUS_STAT_CROSS_SHORT_WITH_MDI3_SAME_SHORT:
-		return true;
-	default:
-		return false;
-	}
-}
-
-static int qca808x_cable_test_result_trans(int cdt_code)
-{
-	switch (cdt_code) {
-	case QCA808X_CDT_STATUS_STAT_NORMAL:
-		return ETHTOOL_A_CABLE_RESULT_CODE_OK;
-	case QCA808X_CDT_STATUS_STAT_SAME_SHORT:
-		return ETHTOOL_A_CABLE_RESULT_CODE_SAME_SHORT;
-	case QCA808X_CDT_STATUS_STAT_SAME_OPEN:
-		return ETHTOOL_A_CABLE_RESULT_CODE_OPEN;
-	case QCA808X_CDT_STATUS_STAT_CROSS_SHORT_WITH_MDI1_SAME_NORMAL:
-	case QCA808X_CDT_STATUS_STAT_CROSS_SHORT_WITH_MDI1_SAME_OPEN:
-	case QCA808X_CDT_STATUS_STAT_CROSS_SHORT_WITH_MDI1_SAME_SHORT:
-	case QCA808X_CDT_STATUS_STAT_CROSS_SHORT_WITH_MDI2_SAME_NORMAL:
-	case QCA808X_CDT_STATUS_STAT_CROSS_SHORT_WITH_MDI2_SAME_OPEN:
-	case QCA808X_CDT_STATUS_STAT_CROSS_SHORT_WITH_MDI2_SAME_SHORT:
-	case QCA808X_CDT_STATUS_STAT_CROSS_SHORT_WITH_MDI3_SAME_NORMAL:
-	case QCA808X_CDT_STATUS_STAT_CROSS_SHORT_WITH_MDI3_SAME_OPEN:
-	case QCA808X_CDT_STATUS_STAT_CROSS_SHORT_WITH_MDI3_SAME_SHORT:
-		return ETHTOOL_A_CABLE_RESULT_CODE_CROSS_SHORT;
-	case QCA808X_CDT_STATUS_STAT_FAIL:
-	default:
-		return ETHTOOL_A_CABLE_RESULT_CODE_UNSPEC;
-	}
-}
-
-static int qca808x_cdt_fault_length(struct phy_device *phydev, int pair,
-				    int result)
-{
-	int val;
-	u32 cdt_length_reg = 0;
-
-	switch (pair) {
-	case ETHTOOL_A_CABLE_PAIR_A:
-		cdt_length_reg = QCA808X_MMD3_CDT_DIAG_PAIR_A;
-		break;
-	case ETHTOOL_A_CABLE_PAIR_B:
-		cdt_length_reg = QCA808X_MMD3_CDT_DIAG_PAIR_B;
-		break;
-	case ETHTOOL_A_CABLE_PAIR_C:
-		cdt_length_reg = QCA808X_MMD3_CDT_DIAG_PAIR_C;
-		break;
-	case ETHTOOL_A_CABLE_PAIR_D:
-		cdt_length_reg = QCA808X_MMD3_CDT_DIAG_PAIR_D;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	val = phy_read_mmd(phydev, MDIO_MMD_PCS, cdt_length_reg);
-	if (val < 0)
-		return val;
-
-	if (result == ETHTOOL_A_CABLE_RESULT_CODE_SAME_SHORT)
-		val = FIELD_GET(QCA808X_CDT_DIAG_LENGTH_SAME_SHORT, val);
-	else
-		val = FIELD_GET(QCA808X_CDT_DIAG_LENGTH_CROSS_SHORT, val);
-
-	return at803x_cdt_fault_length(val);
-}
-
-static int qca808x_cable_test_start(struct phy_device *phydev)
-{
-	int ret;
-
-	/* perform CDT with the following configs:
-	 * 1. disable hibernation.
-	 * 2. force PHY working in MDI mode.
-	 * 3. for PHY working in 1000BaseT.
-	 * 4. configure the threshold.
-	 */
-
-	ret = at803x_debug_reg_mask(phydev, QCA808X_DBG_AN_TEST, QCA808X_HIBERNATION_EN, 0);
-	if (ret < 0)
-		return ret;
-
-	ret = at803x_config_mdix(phydev, ETH_TP_MDI);
-	if (ret < 0)
-		return ret;
-
-	/* Force 1000base-T needs to configure PMA/PMD and MII_BMCR */
-	phydev->duplex = DUPLEX_FULL;
-	phydev->speed = SPEED_1000;
-	ret = genphy_c45_pma_setup_forced(phydev);
-	if (ret < 0)
-		return ret;
-
-	ret = genphy_setup_forced(phydev);
-	if (ret < 0)
-		return ret;
-
-	/* configure the thresholds for open, short, pair ok test */
-	phy_write_mmd(phydev, MDIO_MMD_PCS, 0x8074, 0xc040);
-	phy_write_mmd(phydev, MDIO_MMD_PCS, 0x8076, 0xc040);
-	phy_write_mmd(phydev, MDIO_MMD_PCS, 0x8077, 0xa060);
-	phy_write_mmd(phydev, MDIO_MMD_PCS, 0x8078, 0xc050);
-	phy_write_mmd(phydev, MDIO_MMD_PCS, 0x807a, 0xc060);
-	phy_write_mmd(phydev, MDIO_MMD_PCS, 0x807e, 0xb060);
-
-	return 0;
-}
-
-static int qca808x_cable_test_get_pair_status(struct phy_device *phydev, u8 pair,
-					      u16 status)
-{
-	int length, result;
-	u16 pair_code;
-
-	switch (pair) {
-	case ETHTOOL_A_CABLE_PAIR_A:
-		pair_code = FIELD_GET(QCA808X_CDT_CODE_PAIR_A, status);
-		break;
-	case ETHTOOL_A_CABLE_PAIR_B:
-		pair_code = FIELD_GET(QCA808X_CDT_CODE_PAIR_B, status);
-		break;
-	case ETHTOOL_A_CABLE_PAIR_C:
-		pair_code = FIELD_GET(QCA808X_CDT_CODE_PAIR_C, status);
-		break;
-	case ETHTOOL_A_CABLE_PAIR_D:
-		pair_code = FIELD_GET(QCA808X_CDT_CODE_PAIR_D, status);
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	result = qca808x_cable_test_result_trans(pair_code);
-	ethnl_cable_test_result(phydev, pair, result);
-
-	if (qca808x_cdt_fault_length_valid(pair_code)) {
-		length = qca808x_cdt_fault_length(phydev, pair, result);
-		ethnl_cable_test_fault_length(phydev, pair, length);
-	}
-
-	return 0;
-}
-
-static int qca808x_cable_test_get_status(struct phy_device *phydev, bool *finished)
-{
-	int ret, val;
-
-	*finished = false;
-
-	val = QCA808X_CDT_ENABLE_TEST |
-	      QCA808X_CDT_LENGTH_UNIT;
-	ret = at803x_cdt_start(phydev, val);
-	if (ret)
-		return ret;
-
-	ret = at803x_cdt_wait_for_completion(phydev, QCA808X_CDT_ENABLE_TEST);
-	if (ret)
-		return ret;
-
-	val = phy_read_mmd(phydev, MDIO_MMD_PCS, QCA808X_MMD3_CDT_STATUS);
-	if (val < 0)
-		return val;
-
-	ret = qca808x_cable_test_get_pair_status(phydev, ETHTOOL_A_CABLE_PAIR_A, val);
-	if (ret)
-		return ret;
-
-	ret = qca808x_cable_test_get_pair_status(phydev, ETHTOOL_A_CABLE_PAIR_B, val);
-	if (ret)
-		return ret;
-
-	ret = qca808x_cable_test_get_pair_status(phydev, ETHTOOL_A_CABLE_PAIR_C, val);
-	if (ret)
-		return ret;
-
-	ret = qca808x_cable_test_get_pair_status(phydev, ETHTOOL_A_CABLE_PAIR_D, val);
-	if (ret)
-		return ret;
-
-	*finished = true;
-
-	return 0;
-}
-
-static int qca808x_get_features(struct phy_device *phydev)
-{
-	int ret;
-
-	ret = genphy_c45_pma_read_abilities(phydev);
-	if (ret)
-		return ret;
-
-	/* The autoneg ability is not existed in bit3 of MMD7.1,
-	 * but it is supported by qca808x PHY, so we add it here
-	 * manually.
-	 */
-	linkmode_set_bit(ETHTOOL_LINK_MODE_Autoneg_BIT, phydev->supported);
-
-	/* As for the qca8081 1G version chip, the 2500baseT ability is also
-	 * existed in the bit0 of MMD1.21, we need to remove it manually if
-	 * it is the qca8081 1G chip according to the bit0 of MMD7.0x901d.
-	 */
-	ret = phy_read_mmd(phydev, MDIO_MMD_AN, QCA808X_PHY_MMD7_CHIP_TYPE);
-	if (ret < 0)
-		return ret;
-
-	if (QCA808X_PHY_CHIP_TYPE_1G & ret)
-		linkmode_clear_bit(ETHTOOL_LINK_MODE_2500baseT_Full_BIT, phydev->supported);
-
-	return 0;
-}
-
-static int qca808x_config_aneg(struct phy_device *phydev)
-{
-	int phy_ctrl = 0;
-	int ret;
-
-	ret = at803x_prepare_config_aneg(phydev);
-	if (ret)
-		return ret;
-
-	/* The reg MII_BMCR also needs to be configured for force mode, the
-	 * genphy_config_aneg is also needed.
-	 */
-	if (phydev->autoneg == AUTONEG_DISABLE)
-		genphy_c45_pma_setup_forced(phydev);
-
-	if (linkmode_test_bit(ETHTOOL_LINK_MODE_2500baseT_Full_BIT, phydev->advertising))
-		phy_ctrl = MDIO_AN_10GBT_CTRL_ADV2_5G;
-
-	ret = phy_modify_mmd_changed(phydev, MDIO_MMD_AN, MDIO_AN_10GBT_CTRL,
-				     MDIO_AN_10GBT_CTRL_ADV2_5G, phy_ctrl);
-	if (ret < 0)
-		return ret;
-
-	return __genphy_config_aneg(phydev, ret);
-}
-
-static void qca808x_link_change_notify(struct phy_device *phydev)
-{
-	/* Assert interface sgmii fifo on link down, deassert it on link up,
-	 * the interface device address is always phy address added by 1.
-	 */
-	mdiobus_c45_modify_changed(phydev->mdio.bus, phydev->mdio.addr + 1,
-				   MDIO_MMD_PMAPMD, QCA8081_PHY_SERDES_MMD1_FIFO_CTRL,
-				   QCA8081_PHY_FIFO_RSTN,
-				   phydev->link ? QCA8081_PHY_FIFO_RSTN : 0);
-}
-
-static int qca808x_led_parse_netdev(struct phy_device *phydev, unsigned long rules,
-				    u16 *offload_trigger)
-{
-	/* TODO: add link_2500 when added to netdev trigger */
-	/* Parsing specific to netdev trigger */
-	if (test_bit(TRIGGER_NETDEV_TX, &rules))
-		*offload_trigger |= QCA808X_LED_TX_BLINK;
-	if (test_bit(TRIGGER_NETDEV_RX, &rules))
-		*offload_trigger |= QCA808X_LED_RX_BLINK;
-	if (test_bit(TRIGGER_NETDEV_LINK_10, &rules))
-		*offload_trigger |= QCA808X_LED_SPEED10_ON;
-	if (test_bit(TRIGGER_NETDEV_LINK_100, &rules))
-		*offload_trigger |= QCA808X_LED_SPEED100_ON;
-	if (test_bit(TRIGGER_NETDEV_LINK_1000, &rules))
-		*offload_trigger |= QCA808X_LED_SPEED1000_ON;
-	if (test_bit(TRIGGER_NETDEV_HALF_DUPLEX, &rules))
-		*offload_trigger |= QCA808X_LED_HALF_DUPLEX_ON;
-	if (test_bit(TRIGGER_NETDEV_FULL_DUPLEX, &rules))
-		*offload_trigger |= QCA808X_LED_FULL_DUPLEX_ON;
-
-	if (rules && !*offload_trigger)
-		return -EOPNOTSUPP;
-
-	/* Enable BLINK_CHECK_BYPASS by default to make the LED
-	 * blink even with duplex or speed mode not enabled.
-	 */
-	*offload_trigger |= QCA808X_LED_BLINK_CHECK_BYPASS;
-
-	return 0;
-}
-
-static int qca808x_led_hw_control_enable(struct phy_device *phydev, u8 index)
-{
-	u16 reg;
-
-	if (index > 2)
-		return -EINVAL;
-
-	reg = QCA808X_MMD7_LED_FORCE_CTRL(index);
-
-	return phy_clear_bits_mmd(phydev, MDIO_MMD_AN, reg,
-				  QCA808X_LED_FORCE_EN);
-}
-
-static int qca808x_led_hw_is_supported(struct phy_device *phydev, u8 index,
-				       unsigned long rules)
-{
-	u16 offload_trigger = 0;
-
-	if (index > 2)
-		return -EINVAL;
-
-	return qca808x_led_parse_netdev(phydev, rules, &offload_trigger);
-}
-
-static int qca808x_led_hw_control_set(struct phy_device *phydev, u8 index,
-				      unsigned long rules)
-{
-	u16 reg, offload_trigger = 0;
-	int ret;
-
-	if (index > 2)
-		return -EINVAL;
-
-	reg = QCA808X_MMD7_LED_CTRL(index);
-
-	ret = qca808x_led_parse_netdev(phydev, rules, &offload_trigger);
-	if (ret)
-		return ret;
-
-	ret = qca808x_led_hw_control_enable(phydev, index);
-	if (ret)
-		return ret;
-
-	return phy_modify_mmd(phydev, MDIO_MMD_AN, reg,
-			      QCA808X_LED_PATTERN_MASK,
-			      offload_trigger);
-}
-
-static bool qca808x_led_hw_control_status(struct phy_device *phydev, u8 index)
-{
-	u16 reg;
-	int val;
-
-	if (index > 2)
-		return false;
-
-	reg = QCA808X_MMD7_LED_FORCE_CTRL(index);
-
-	val = phy_read_mmd(phydev, MDIO_MMD_AN, reg);
-
-	return !(val & QCA808X_LED_FORCE_EN);
-}
-
-static int qca808x_led_hw_control_get(struct phy_device *phydev, u8 index,
-				      unsigned long *rules)
-{
-	u16 reg;
-	int val;
-
-	if (index > 2)
-		return -EINVAL;
-
-	/* Check if we have hw control enabled */
-	if (qca808x_led_hw_control_status(phydev, index))
-		return -EINVAL;
-
-	reg = QCA808X_MMD7_LED_CTRL(index);
-
-	/* TODO: add link_2500 when added to netdev trigger */
-	val = phy_read_mmd(phydev, MDIO_MMD_AN, reg);
-	if (val & QCA808X_LED_TX_BLINK)
-		set_bit(TRIGGER_NETDEV_TX, rules);
-	if (val & QCA808X_LED_RX_BLINK)
-		set_bit(TRIGGER_NETDEV_RX, rules);
-	if (val & QCA808X_LED_SPEED10_ON)
-		set_bit(TRIGGER_NETDEV_LINK_10, rules);
-	if (val & QCA808X_LED_SPEED100_ON)
-		set_bit(TRIGGER_NETDEV_LINK_100, rules);
-	if (val & QCA808X_LED_SPEED1000_ON)
-		set_bit(TRIGGER_NETDEV_LINK_1000, rules);
-	if (val & QCA808X_LED_HALF_DUPLEX_ON)
-		set_bit(TRIGGER_NETDEV_HALF_DUPLEX, rules);
-	if (val & QCA808X_LED_FULL_DUPLEX_ON)
-		set_bit(TRIGGER_NETDEV_FULL_DUPLEX, rules);
-
-	return 0;
-}
-
-static int qca808x_led_hw_control_reset(struct phy_device *phydev, u8 index)
-{
-	u16 reg;
-
-	if (index > 2)
-		return -EINVAL;
-
-	reg = QCA808X_MMD7_LED_CTRL(index);
-
-	return phy_clear_bits_mmd(phydev, MDIO_MMD_AN, reg,
-				  QCA808X_LED_PATTERN_MASK);
-}
-
-static int qca808x_led_brightness_set(struct phy_device *phydev,
-				      u8 index, enum led_brightness value)
-{
-	u16 reg;
-	int ret;
-
-	if (index > 2)
-		return -EINVAL;
-
-	if (!value) {
-		ret = qca808x_led_hw_control_reset(phydev, index);
-		if (ret)
-			return ret;
-	}
-
-	reg = QCA808X_MMD7_LED_FORCE_CTRL(index);
-
-	return phy_modify_mmd(phydev, MDIO_MMD_AN, reg,
-			      QCA808X_LED_FORCE_EN | QCA808X_LED_FORCE_MODE_MASK,
-			      QCA808X_LED_FORCE_EN | value ? QCA808X_LED_FORCE_ON :
-							     QCA808X_LED_FORCE_OFF);
-}
-
-static int qca808x_led_blink_set(struct phy_device *phydev, u8 index,
-				 unsigned long *delay_on,
-				 unsigned long *delay_off)
-{
-	int ret;
-	u16 reg;
-
-	if (index > 2)
-		return -EINVAL;
-
-	reg = QCA808X_MMD7_LED_FORCE_CTRL(index);
-
-	/* Set blink to 50% off, 50% on at 4Hz by default */
-	ret = phy_modify_mmd(phydev, MDIO_MMD_AN, QCA808X_MMD7_LED_GLOBAL,
-			     QCA808X_LED_BLINK_FREQ_MASK | QCA808X_LED_BLINK_DUTY_MASK,
-			     QCA808X_LED_BLINK_FREQ_4HZ | QCA808X_LED_BLINK_DUTY_50_50);
-	if (ret)
-		return ret;
-
-	/* We use BLINK_1 for normal blinking */
-	ret = phy_modify_mmd(phydev, MDIO_MMD_AN, reg,
-			     QCA808X_LED_FORCE_EN | QCA808X_LED_FORCE_MODE_MASK,
-			     QCA808X_LED_FORCE_EN | QCA808X_LED_FORCE_BLINK_1);
-	if (ret)
-		return ret;
-
-	/* We set blink to 4Hz, aka 250ms */
-	*delay_on = 250 / 2;
-	*delay_off = 250 / 2;
-
-	return 0;
-}
-
-static int qca808x_led_polarity_set(struct phy_device *phydev, int index,
-				    unsigned long modes)
-{
-	struct at803x_priv *priv = phydev->priv;
-	bool active_low = false;
-	u32 mode;
-
-	for_each_set_bit(mode, &modes, __PHY_LED_MODES_NUM) {
-		switch (mode) {
-		case PHY_LED_ACTIVE_LOW:
-			active_low = true;
-			break;
-		default:
-			return -EINVAL;
-		}
-	}
-
-	/* PHY polarity is global and can't be set per LED.
-	 * To detect this, check if last requested polarity mode
-	 * match the new one.
-	 */
-	if (priv->led_polarity_mode >= 0 &&
-	    priv->led_polarity_mode != active_low) {
-		phydev_err(phydev, "PHY polarity is global. Mismatched polarity on different LED\n");
-		return -EINVAL;
-	}
-
-	/* Save the last PHY polarity mode */
-	priv->led_polarity_mode = active_low;
-
-	return phy_modify_mmd(phydev, MDIO_MMD_AN,
-			      QCA808X_MMD7_LED_POLARITY_CTRL,
-			      QCA808X_LED_ACTIVE_HIGH,
-			      active_low ? 0 : QCA808X_LED_ACTIVE_HIGH);
-}
-
 static struct phy_driver at803x_driver[] = {
 {
 	/* Qualcomm Atheros AR8035 */
@@ -1989,34 +1125,6 @@ static struct phy_driver at803x_driver[] = {
 	.read_status		= at803x_read_status,
 	.soft_reset		= genphy_soft_reset,
 	.config_aneg		= at803x_config_aneg,
-}, {
-	/* Qualcomm QCA8081 */
-	PHY_ID_MATCH_EXACT(QCA8081_PHY_ID),
-	.name			= "Qualcomm QCA8081",
-	.flags			= PHY_POLL_CABLE_TEST,
-	.probe			= at803x_probe,
-	.config_intr		= at803x_config_intr,
-	.handle_interrupt	= at803x_handle_interrupt,
-	.get_tunable		= at803x_get_tunable,
-	.set_tunable		= at803x_set_tunable,
-	.set_wol		= at803x_set_wol,
-	.get_wol		= at803x_get_wol,
-	.get_features		= qca808x_get_features,
-	.config_aneg		= qca808x_config_aneg,
-	.suspend		= genphy_suspend,
-	.resume			= genphy_resume,
-	.read_status		= qca808x_read_status,
-	.config_init		= qca808x_config_init,
-	.soft_reset		= qca808x_soft_reset,
-	.cable_test_start	= qca808x_cable_test_start,
-	.cable_test_get_status	= qca808x_cable_test_get_status,
-	.link_change_notify	= qca808x_link_change_notify,
-	.led_brightness_set	= qca808x_led_brightness_set,
-	.led_blink_set		= qca808x_led_blink_set,
-	.led_hw_is_supported	= qca808x_led_hw_is_supported,
-	.led_hw_control_set	= qca808x_led_hw_control_set,
-	.led_hw_control_get	= qca808x_led_hw_control_get,
-	.led_polarity_set	= qca808x_led_polarity_set,
 }, };
 
 module_phy_driver(at803x_driver);
@@ -2028,7 +1136,6 @@ static struct mdio_device_id __maybe_unused atheros_tbl[] = {
 	{ PHY_ID_MATCH_EXACT(ATH8035_PHY_ID) },
 	{ PHY_ID_MATCH_EXACT(ATH9331_PHY_ID) },
 	{ PHY_ID_MATCH_EXACT(QCA9561_PHY_ID) },
-	{ PHY_ID_MATCH_EXACT(QCA8081_PHY_ID) },
 	{ }
 };
 
diff --git a/drivers/net/phy/qcom/qca808x.c b/drivers/net/phy/qcom/qca808x.c
new file mode 100644
index 000000000000..c4cbc022a00c
--- /dev/null
+++ b/drivers/net/phy/qcom/qca808x.c
@@ -0,0 +1,934 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <linux/phy.h>
+#include <linux/module.h>
+#include <linux/ethtool_netlink.h>
+
+#include "qcom.h"
+
+/* ADC threshold */
+#define QCA808X_PHY_DEBUG_ADC_THRESHOLD		0x2c80
+#define QCA808X_ADC_THRESHOLD_MASK		GENMASK(7, 0)
+#define QCA808X_ADC_THRESHOLD_80MV		0
+#define QCA808X_ADC_THRESHOLD_100MV		0xf0
+#define QCA808X_ADC_THRESHOLD_200MV		0x0f
+#define QCA808X_ADC_THRESHOLD_300MV		0xff
+
+/* CLD control */
+#define QCA808X_PHY_MMD3_ADDR_CLD_CTRL7		0x8007
+#define QCA808X_8023AZ_AFE_CTRL_MASK		GENMASK(8, 4)
+#define QCA808X_8023AZ_AFE_EN			0x90
+
+/* AZ control */
+#define QCA808X_PHY_MMD3_AZ_TRAINING_CTRL	0x8008
+#define QCA808X_MMD3_AZ_TRAINING_VAL		0x1c32
+
+#define QCA808X_PHY_MMD1_MSE_THRESHOLD_20DB	0x8014
+#define QCA808X_MSE_THRESHOLD_20DB_VALUE	0x529
+
+#define QCA808X_PHY_MMD1_MSE_THRESHOLD_17DB	0x800E
+#define QCA808X_MSE_THRESHOLD_17DB_VALUE	0x341
+
+#define QCA808X_PHY_MMD1_MSE_THRESHOLD_27DB	0x801E
+#define QCA808X_MSE_THRESHOLD_27DB_VALUE	0x419
+
+#define QCA808X_PHY_MMD1_MSE_THRESHOLD_28DB	0x8020
+#define QCA808X_MSE_THRESHOLD_28DB_VALUE	0x341
+
+#define QCA808X_PHY_MMD7_TOP_OPTION1		0x901c
+#define QCA808X_TOP_OPTION1_DATA		0x0
+
+#define QCA808X_PHY_MMD3_DEBUG_1		0xa100
+#define QCA808X_MMD3_DEBUG_1_VALUE		0x9203
+#define QCA808X_PHY_MMD3_DEBUG_2		0xa101
+#define QCA808X_MMD3_DEBUG_2_VALUE		0x48ad
+#define QCA808X_PHY_MMD3_DEBUG_3		0xa103
+#define QCA808X_MMD3_DEBUG_3_VALUE		0x1698
+#define QCA808X_PHY_MMD3_DEBUG_4		0xa105
+#define QCA808X_MMD3_DEBUG_4_VALUE		0x8001
+#define QCA808X_PHY_MMD3_DEBUG_5		0xa106
+#define QCA808X_MMD3_DEBUG_5_VALUE		0x1111
+#define QCA808X_PHY_MMD3_DEBUG_6		0xa011
+#define QCA808X_MMD3_DEBUG_6_VALUE		0x5f85
+
+/* master/slave seed config */
+#define QCA808X_PHY_DEBUG_LOCAL_SEED		9
+#define QCA808X_MASTER_SLAVE_SEED_ENABLE	BIT(1)
+#define QCA808X_MASTER_SLAVE_SEED_CFG		GENMASK(12, 2)
+#define QCA808X_MASTER_SLAVE_SEED_RANGE		0x32
+
+/* Hibernation yields lower power consumpiton in contrast with normal operation mode.
+ * when the copper cable is unplugged, the PHY enters into hibernation mode in about 10s.
+ */
+#define QCA808X_DBG_AN_TEST			0xb
+#define QCA808X_HIBERNATION_EN			BIT(15)
+
+#define QCA808X_CDT_ENABLE_TEST			BIT(15)
+#define QCA808X_CDT_INTER_CHECK_DIS		BIT(13)
+#define QCA808X_CDT_STATUS			BIT(11)
+#define QCA808X_CDT_LENGTH_UNIT			BIT(10)
+
+#define QCA808X_MMD3_CDT_STATUS			0x8064
+#define QCA808X_MMD3_CDT_DIAG_PAIR_A		0x8065
+#define QCA808X_MMD3_CDT_DIAG_PAIR_B		0x8066
+#define QCA808X_MMD3_CDT_DIAG_PAIR_C		0x8067
+#define QCA808X_MMD3_CDT_DIAG_PAIR_D		0x8068
+#define QCA808X_CDT_DIAG_LENGTH_SAME_SHORT	GENMASK(15, 8)
+#define QCA808X_CDT_DIAG_LENGTH_CROSS_SHORT	GENMASK(7, 0)
+
+#define QCA808X_CDT_CODE_PAIR_A			GENMASK(15, 12)
+#define QCA808X_CDT_CODE_PAIR_B			GENMASK(11, 8)
+#define QCA808X_CDT_CODE_PAIR_C			GENMASK(7, 4)
+#define QCA808X_CDT_CODE_PAIR_D			GENMASK(3, 0)
+
+#define QCA808X_CDT_STATUS_STAT_TYPE		GENMASK(1, 0)
+#define QCA808X_CDT_STATUS_STAT_FAIL		FIELD_PREP_CONST(QCA808X_CDT_STATUS_STAT_TYPE, 0)
+#define QCA808X_CDT_STATUS_STAT_NORMAL		FIELD_PREP_CONST(QCA808X_CDT_STATUS_STAT_TYPE, 1)
+#define QCA808X_CDT_STATUS_STAT_SAME_OPEN	FIELD_PREP_CONST(QCA808X_CDT_STATUS_STAT_TYPE, 2)
+#define QCA808X_CDT_STATUS_STAT_SAME_SHORT	FIELD_PREP_CONST(QCA808X_CDT_STATUS_STAT_TYPE, 3)
+
+#define QCA808X_CDT_STATUS_STAT_MDI		GENMASK(3, 2)
+#define QCA808X_CDT_STATUS_STAT_MDI1		FIELD_PREP_CONST(QCA808X_CDT_STATUS_STAT_MDI, 1)
+#define QCA808X_CDT_STATUS_STAT_MDI2		FIELD_PREP_CONST(QCA808X_CDT_STATUS_STAT_MDI, 2)
+#define QCA808X_CDT_STATUS_STAT_MDI3		FIELD_PREP_CONST(QCA808X_CDT_STATUS_STAT_MDI, 3)
+
+/* NORMAL are MDI with type set to 0 */
+#define QCA808X_CDT_STATUS_STAT_CROSS_SHORT_WITH_MDI1_SAME_NORMAL	QCA808X_CDT_STATUS_STAT_MDI1
+#define QCA808X_CDT_STATUS_STAT_CROSS_SHORT_WITH_MDI1_SAME_OPEN		(QCA808X_CDT_STATUS_STAT_SAME_OPEN |\
+									 QCA808X_CDT_STATUS_STAT_MDI1)
+#define QCA808X_CDT_STATUS_STAT_CROSS_SHORT_WITH_MDI1_SAME_SHORT	(QCA808X_CDT_STATUS_STAT_SAME_SHORT |\
+									 QCA808X_CDT_STATUS_STAT_MDI1)
+#define QCA808X_CDT_STATUS_STAT_CROSS_SHORT_WITH_MDI2_SAME_NORMAL	QCA808X_CDT_STATUS_STAT_MDI2
+#define QCA808X_CDT_STATUS_STAT_CROSS_SHORT_WITH_MDI2_SAME_OPEN		(QCA808X_CDT_STATUS_STAT_SAME_OPEN |\
+									 QCA808X_CDT_STATUS_STAT_MDI2)
+#define QCA808X_CDT_STATUS_STAT_CROSS_SHORT_WITH_MDI2_SAME_SHORT	(QCA808X_CDT_STATUS_STAT_SAME_SHORT |\
+									 QCA808X_CDT_STATUS_STAT_MDI2)
+#define QCA808X_CDT_STATUS_STAT_CROSS_SHORT_WITH_MDI3_SAME_NORMAL	QCA808X_CDT_STATUS_STAT_MDI3
+#define QCA808X_CDT_STATUS_STAT_CROSS_SHORT_WITH_MDI3_SAME_OPEN		(QCA808X_CDT_STATUS_STAT_SAME_OPEN |\
+									 QCA808X_CDT_STATUS_STAT_MDI3)
+#define QCA808X_CDT_STATUS_STAT_CROSS_SHORT_WITH_MDI3_SAME_SHORT	(QCA808X_CDT_STATUS_STAT_SAME_SHORT |\
+									 QCA808X_CDT_STATUS_STAT_MDI3)
+
+/* Added for reference of existence but should be handled by wait_for_completion already */
+#define QCA808X_CDT_STATUS_STAT_BUSY		(BIT(1) | BIT(3))
+
+#define QCA808X_MMD7_LED_GLOBAL			0x8073
+#define QCA808X_LED_BLINK_1			GENMASK(11, 6)
+#define QCA808X_LED_BLINK_2			GENMASK(5, 0)
+/* Values are the same for both BLINK_1 and BLINK_2 */
+#define QCA808X_LED_BLINK_FREQ_MASK		GENMASK(5, 3)
+#define QCA808X_LED_BLINK_FREQ_2HZ		FIELD_PREP(QCA808X_LED_BLINK_FREQ_MASK, 0x0)
+#define QCA808X_LED_BLINK_FREQ_4HZ		FIELD_PREP(QCA808X_LED_BLINK_FREQ_MASK, 0x1)
+#define QCA808X_LED_BLINK_FREQ_8HZ		FIELD_PREP(QCA808X_LED_BLINK_FREQ_MASK, 0x2)
+#define QCA808X_LED_BLINK_FREQ_16HZ		FIELD_PREP(QCA808X_LED_BLINK_FREQ_MASK, 0x3)
+#define QCA808X_LED_BLINK_FREQ_32HZ		FIELD_PREP(QCA808X_LED_BLINK_FREQ_MASK, 0x4)
+#define QCA808X_LED_BLINK_FREQ_64HZ		FIELD_PREP(QCA808X_LED_BLINK_FREQ_MASK, 0x5)
+#define QCA808X_LED_BLINK_FREQ_128HZ		FIELD_PREP(QCA808X_LED_BLINK_FREQ_MASK, 0x6)
+#define QCA808X_LED_BLINK_FREQ_256HZ		FIELD_PREP(QCA808X_LED_BLINK_FREQ_MASK, 0x7)
+#define QCA808X_LED_BLINK_DUTY_MASK		GENMASK(2, 0)
+#define QCA808X_LED_BLINK_DUTY_50_50		FIELD_PREP(QCA808X_LED_BLINK_DUTY_MASK, 0x0)
+#define QCA808X_LED_BLINK_DUTY_75_25		FIELD_PREP(QCA808X_LED_BLINK_DUTY_MASK, 0x1)
+#define QCA808X_LED_BLINK_DUTY_25_75		FIELD_PREP(QCA808X_LED_BLINK_DUTY_MASK, 0x2)
+#define QCA808X_LED_BLINK_DUTY_33_67		FIELD_PREP(QCA808X_LED_BLINK_DUTY_MASK, 0x3)
+#define QCA808X_LED_BLINK_DUTY_67_33		FIELD_PREP(QCA808X_LED_BLINK_DUTY_MASK, 0x4)
+#define QCA808X_LED_BLINK_DUTY_17_83		FIELD_PREP(QCA808X_LED_BLINK_DUTY_MASK, 0x5)
+#define QCA808X_LED_BLINK_DUTY_83_17		FIELD_PREP(QCA808X_LED_BLINK_DUTY_MASK, 0x6)
+#define QCA808X_LED_BLINK_DUTY_8_92		FIELD_PREP(QCA808X_LED_BLINK_DUTY_MASK, 0x7)
+
+#define QCA808X_MMD7_LED2_CTRL			0x8074
+#define QCA808X_MMD7_LED2_FORCE_CTRL		0x8075
+#define QCA808X_MMD7_LED1_CTRL			0x8076
+#define QCA808X_MMD7_LED1_FORCE_CTRL		0x8077
+#define QCA808X_MMD7_LED0_CTRL			0x8078
+#define QCA808X_MMD7_LED_CTRL(x)		(0x8078 - ((x) * 2))
+
+/* LED hw control pattern is the same for every LED */
+#define QCA808X_LED_PATTERN_MASK		GENMASK(15, 0)
+#define QCA808X_LED_SPEED2500_ON		BIT(15)
+#define QCA808X_LED_SPEED2500_BLINK		BIT(14)
+/* Follow blink trigger even if duplex or speed condition doesn't match */
+#define QCA808X_LED_BLINK_CHECK_BYPASS		BIT(13)
+#define QCA808X_LED_FULL_DUPLEX_ON		BIT(12)
+#define QCA808X_LED_HALF_DUPLEX_ON		BIT(11)
+#define QCA808X_LED_TX_BLINK			BIT(10)
+#define QCA808X_LED_RX_BLINK			BIT(9)
+#define QCA808X_LED_TX_ON_10MS			BIT(8)
+#define QCA808X_LED_RX_ON_10MS			BIT(7)
+#define QCA808X_LED_SPEED1000_ON		BIT(6)
+#define QCA808X_LED_SPEED100_ON			BIT(5)
+#define QCA808X_LED_SPEED10_ON			BIT(4)
+#define QCA808X_LED_COLLISION_BLINK		BIT(3)
+#define QCA808X_LED_SPEED1000_BLINK		BIT(2)
+#define QCA808X_LED_SPEED100_BLINK		BIT(1)
+#define QCA808X_LED_SPEED10_BLINK		BIT(0)
+
+#define QCA808X_MMD7_LED0_FORCE_CTRL		0x8079
+#define QCA808X_MMD7_LED_FORCE_CTRL(x)		(0x8079 - ((x) * 2))
+
+/* LED force ctrl is the same for every LED
+ * No documentation exist for this, not even internal one
+ * with NDA as QCOM gives only info about configuring
+ * hw control pattern rules and doesn't indicate any way
+ * to force the LED to specific mode.
+ * These define comes from reverse and testing and maybe
+ * lack of some info or some info are not entirely correct.
+ * For the basic LED control and hw control these finding
+ * are enough to support LED control in all the required APIs.
+ *
+ * On doing some comparison with implementation with qca807x,
+ * it was found that it's 1:1 equal to it and confirms all the
+ * reverse done. It was also found further specification with the
+ * force mode and the blink modes.
+ */
+#define QCA808X_LED_FORCE_EN			BIT(15)
+#define QCA808X_LED_FORCE_MODE_MASK		GENMASK(14, 13)
+#define QCA808X_LED_FORCE_BLINK_1		FIELD_PREP(QCA808X_LED_FORCE_MODE_MASK, 0x3)
+#define QCA808X_LED_FORCE_BLINK_2		FIELD_PREP(QCA808X_LED_FORCE_MODE_MASK, 0x2)
+#define QCA808X_LED_FORCE_ON			FIELD_PREP(QCA808X_LED_FORCE_MODE_MASK, 0x1)
+#define QCA808X_LED_FORCE_OFF			FIELD_PREP(QCA808X_LED_FORCE_MODE_MASK, 0x0)
+
+#define QCA808X_MMD7_LED_POLARITY_CTRL		0x901a
+/* QSDK sets by default 0x46 to this reg that sets BIT 6 for
+ * LED to active high. It's not clear what BIT 3 and BIT 4 does.
+ */
+#define QCA808X_LED_ACTIVE_HIGH			BIT(6)
+
+/* QCA808X 1G chip type */
+#define QCA808X_PHY_MMD7_CHIP_TYPE		0x901d
+#define QCA808X_PHY_CHIP_TYPE_1G		BIT(0)
+
+#define QCA8081_PHY_SERDES_MMD1_FIFO_CTRL	0x9072
+#define QCA8081_PHY_FIFO_RSTN			BIT(11)
+
+#define QCA8081_PHY_ID				0x004dd101
+
+#define QCA808X_SS_SPEED_MASK			GENMASK(9, 7)
+
+MODULE_DESCRIPTION("Qualcomm Atheros QCA808X PHY driver");
+MODULE_AUTHOR("Matus Ujhelyi");
+MODULE_LICENSE("GPL");
+
+struct qca808x_priv {
+	int led_polarity_mode;
+};
+
+static int qca808x_phy_fast_retrain_config(struct phy_device *phydev)
+{
+	int ret;
+
+	/* Enable fast retrain */
+	ret = genphy_c45_fast_retrain(phydev, true);
+	if (ret)
+		return ret;
+
+	phy_write_mmd(phydev, MDIO_MMD_AN, QCA808X_PHY_MMD7_TOP_OPTION1,
+		      QCA808X_TOP_OPTION1_DATA);
+	phy_write_mmd(phydev, MDIO_MMD_PMAPMD, QCA808X_PHY_MMD1_MSE_THRESHOLD_20DB,
+		      QCA808X_MSE_THRESHOLD_20DB_VALUE);
+	phy_write_mmd(phydev, MDIO_MMD_PMAPMD, QCA808X_PHY_MMD1_MSE_THRESHOLD_17DB,
+		      QCA808X_MSE_THRESHOLD_17DB_VALUE);
+	phy_write_mmd(phydev, MDIO_MMD_PMAPMD, QCA808X_PHY_MMD1_MSE_THRESHOLD_27DB,
+		      QCA808X_MSE_THRESHOLD_27DB_VALUE);
+	phy_write_mmd(phydev, MDIO_MMD_PMAPMD, QCA808X_PHY_MMD1_MSE_THRESHOLD_28DB,
+		      QCA808X_MSE_THRESHOLD_28DB_VALUE);
+	phy_write_mmd(phydev, MDIO_MMD_PCS, QCA808X_PHY_MMD3_DEBUG_1,
+		      QCA808X_MMD3_DEBUG_1_VALUE);
+	phy_write_mmd(phydev, MDIO_MMD_PCS, QCA808X_PHY_MMD3_DEBUG_4,
+		      QCA808X_MMD3_DEBUG_4_VALUE);
+	phy_write_mmd(phydev, MDIO_MMD_PCS, QCA808X_PHY_MMD3_DEBUG_5,
+		      QCA808X_MMD3_DEBUG_5_VALUE);
+	phy_write_mmd(phydev, MDIO_MMD_PCS, QCA808X_PHY_MMD3_DEBUG_3,
+		      QCA808X_MMD3_DEBUG_3_VALUE);
+	phy_write_mmd(phydev, MDIO_MMD_PCS, QCA808X_PHY_MMD3_DEBUG_6,
+		      QCA808X_MMD3_DEBUG_6_VALUE);
+	phy_write_mmd(phydev, MDIO_MMD_PCS, QCA808X_PHY_MMD3_DEBUG_2,
+		      QCA808X_MMD3_DEBUG_2_VALUE);
+
+	return 0;
+}
+
+static int qca808x_phy_ms_seed_enable(struct phy_device *phydev, bool enable)
+{
+	u16 seed_value;
+
+	if (!enable)
+		return at803x_debug_reg_mask(phydev, QCA808X_PHY_DEBUG_LOCAL_SEED,
+				QCA808X_MASTER_SLAVE_SEED_ENABLE, 0);
+
+	seed_value = get_random_u32_below(QCA808X_MASTER_SLAVE_SEED_RANGE);
+	return at803x_debug_reg_mask(phydev, QCA808X_PHY_DEBUG_LOCAL_SEED,
+			QCA808X_MASTER_SLAVE_SEED_CFG | QCA808X_MASTER_SLAVE_SEED_ENABLE,
+			FIELD_PREP(QCA808X_MASTER_SLAVE_SEED_CFG, seed_value) |
+			QCA808X_MASTER_SLAVE_SEED_ENABLE);
+}
+
+static bool qca808x_is_prefer_master(struct phy_device *phydev)
+{
+	return (phydev->master_slave_get == MASTER_SLAVE_CFG_MASTER_FORCE) ||
+		(phydev->master_slave_get == MASTER_SLAVE_CFG_MASTER_PREFERRED);
+}
+
+static bool qca808x_has_fast_retrain_or_slave_seed(struct phy_device *phydev)
+{
+	return linkmode_test_bit(ETHTOOL_LINK_MODE_2500baseT_Full_BIT, phydev->supported);
+}
+
+static int qca808x_probe(struct phy_device *phydev)
+{
+	struct device *dev = &phydev->mdio.dev;
+	struct qca808x_priv *priv;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	/* Init LED polarity mode to -1 */
+	priv->led_polarity_mode = -1;
+
+	phydev->priv = priv;
+
+	return 0;
+}
+
+static int qca808x_config_init(struct phy_device *phydev)
+{
+	int ret;
+
+	/* Active adc&vga on 802.3az for the link 1000M and 100M */
+	ret = phy_modify_mmd(phydev, MDIO_MMD_PCS, QCA808X_PHY_MMD3_ADDR_CLD_CTRL7,
+			     QCA808X_8023AZ_AFE_CTRL_MASK, QCA808X_8023AZ_AFE_EN);
+	if (ret)
+		return ret;
+
+	/* Adjust the threshold on 802.3az for the link 1000M */
+	ret = phy_write_mmd(phydev, MDIO_MMD_PCS,
+			    QCA808X_PHY_MMD3_AZ_TRAINING_CTRL,
+			    QCA808X_MMD3_AZ_TRAINING_VAL);
+	if (ret)
+		return ret;
+
+	if (qca808x_has_fast_retrain_or_slave_seed(phydev)) {
+		/* Config the fast retrain for the link 2500M */
+		ret = qca808x_phy_fast_retrain_config(phydev);
+		if (ret)
+			return ret;
+
+		ret = genphy_read_master_slave(phydev);
+		if (ret < 0)
+			return ret;
+
+		if (!qca808x_is_prefer_master(phydev)) {
+			/* Enable seed and configure lower ramdom seed to make phy
+			 * linked as slave mode.
+			 */
+			ret = qca808x_phy_ms_seed_enable(phydev, true);
+			if (ret)
+				return ret;
+		}
+	}
+
+	/* Configure adc threshold as 100mv for the link 10M */
+	return at803x_debug_reg_mask(phydev, QCA808X_PHY_DEBUG_ADC_THRESHOLD,
+				     QCA808X_ADC_THRESHOLD_MASK,
+				     QCA808X_ADC_THRESHOLD_100MV);
+}
+
+static int qca808x_read_status(struct phy_device *phydev)
+{
+	struct at803x_ss_mask ss_mask = { 0 };
+	int ret;
+
+	ret = phy_read_mmd(phydev, MDIO_MMD_AN, MDIO_AN_10GBT_STAT);
+	if (ret < 0)
+		return ret;
+
+	linkmode_mod_bit(ETHTOOL_LINK_MODE_2500baseT_Full_BIT, phydev->lp_advertising,
+			 ret & MDIO_AN_10GBT_STAT_LP2_5G);
+
+	ret = genphy_read_status(phydev);
+	if (ret)
+		return ret;
+
+	/* qca8081 takes the different bits for speed value from at803x */
+	ss_mask.speed_mask = QCA808X_SS_SPEED_MASK;
+	ss_mask.speed_shift = __bf_shf(QCA808X_SS_SPEED_MASK);
+	ret = at803x_read_specific_status(phydev, ss_mask);
+	if (ret < 0)
+		return ret;
+
+	if (phydev->link) {
+		if (phydev->speed == SPEED_2500)
+			phydev->interface = PHY_INTERFACE_MODE_2500BASEX;
+		else
+			phydev->interface = PHY_INTERFACE_MODE_SGMII;
+	} else {
+		/* generate seed as a lower random value to make PHY linked as SLAVE easily,
+		 * except for master/slave configuration fault detected or the master mode
+		 * preferred.
+		 *
+		 * the reason for not putting this code into the function link_change_notify is
+		 * the corner case where the link partner is also the qca8081 PHY and the seed
+		 * value is configured as the same value, the link can't be up and no link change
+		 * occurs.
+		 */
+		if (qca808x_has_fast_retrain_or_slave_seed(phydev)) {
+			if (phydev->master_slave_state == MASTER_SLAVE_STATE_ERR ||
+			    qca808x_is_prefer_master(phydev)) {
+				qca808x_phy_ms_seed_enable(phydev, false);
+			} else {
+				qca808x_phy_ms_seed_enable(phydev, true);
+			}
+		}
+	}
+
+	return 0;
+}
+
+static int qca808x_soft_reset(struct phy_device *phydev)
+{
+	int ret;
+
+	ret = genphy_soft_reset(phydev);
+	if (ret < 0)
+		return ret;
+
+	if (qca808x_has_fast_retrain_or_slave_seed(phydev))
+		ret = qca808x_phy_ms_seed_enable(phydev, true);
+
+	return ret;
+}
+
+static bool qca808x_cdt_fault_length_valid(int cdt_code)
+{
+	switch (cdt_code) {
+	case QCA808X_CDT_STATUS_STAT_SAME_SHORT:
+	case QCA808X_CDT_STATUS_STAT_SAME_OPEN:
+	case QCA808X_CDT_STATUS_STAT_CROSS_SHORT_WITH_MDI1_SAME_NORMAL:
+	case QCA808X_CDT_STATUS_STAT_CROSS_SHORT_WITH_MDI1_SAME_OPEN:
+	case QCA808X_CDT_STATUS_STAT_CROSS_SHORT_WITH_MDI1_SAME_SHORT:
+	case QCA808X_CDT_STATUS_STAT_CROSS_SHORT_WITH_MDI2_SAME_NORMAL:
+	case QCA808X_CDT_STATUS_STAT_CROSS_SHORT_WITH_MDI2_SAME_OPEN:
+	case QCA808X_CDT_STATUS_STAT_CROSS_SHORT_WITH_MDI2_SAME_SHORT:
+	case QCA808X_CDT_STATUS_STAT_CROSS_SHORT_WITH_MDI3_SAME_NORMAL:
+	case QCA808X_CDT_STATUS_STAT_CROSS_SHORT_WITH_MDI3_SAME_OPEN:
+	case QCA808X_CDT_STATUS_STAT_CROSS_SHORT_WITH_MDI3_SAME_SHORT:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static int qca808x_cable_test_result_trans(int cdt_code)
+{
+	switch (cdt_code) {
+	case QCA808X_CDT_STATUS_STAT_NORMAL:
+		return ETHTOOL_A_CABLE_RESULT_CODE_OK;
+	case QCA808X_CDT_STATUS_STAT_SAME_SHORT:
+		return ETHTOOL_A_CABLE_RESULT_CODE_SAME_SHORT;
+	case QCA808X_CDT_STATUS_STAT_SAME_OPEN:
+		return ETHTOOL_A_CABLE_RESULT_CODE_OPEN;
+	case QCA808X_CDT_STATUS_STAT_CROSS_SHORT_WITH_MDI1_SAME_NORMAL:
+	case QCA808X_CDT_STATUS_STAT_CROSS_SHORT_WITH_MDI1_SAME_OPEN:
+	case QCA808X_CDT_STATUS_STAT_CROSS_SHORT_WITH_MDI1_SAME_SHORT:
+	case QCA808X_CDT_STATUS_STAT_CROSS_SHORT_WITH_MDI2_SAME_NORMAL:
+	case QCA808X_CDT_STATUS_STAT_CROSS_SHORT_WITH_MDI2_SAME_OPEN:
+	case QCA808X_CDT_STATUS_STAT_CROSS_SHORT_WITH_MDI2_SAME_SHORT:
+	case QCA808X_CDT_STATUS_STAT_CROSS_SHORT_WITH_MDI3_SAME_NORMAL:
+	case QCA808X_CDT_STATUS_STAT_CROSS_SHORT_WITH_MDI3_SAME_OPEN:
+	case QCA808X_CDT_STATUS_STAT_CROSS_SHORT_WITH_MDI3_SAME_SHORT:
+		return ETHTOOL_A_CABLE_RESULT_CODE_CROSS_SHORT;
+	case QCA808X_CDT_STATUS_STAT_FAIL:
+	default:
+		return ETHTOOL_A_CABLE_RESULT_CODE_UNSPEC;
+	}
+}
+
+static int qca808x_cdt_fault_length(struct phy_device *phydev, int pair,
+				    int result)
+{
+	int val;
+	u32 cdt_length_reg = 0;
+
+	switch (pair) {
+	case ETHTOOL_A_CABLE_PAIR_A:
+		cdt_length_reg = QCA808X_MMD3_CDT_DIAG_PAIR_A;
+		break;
+	case ETHTOOL_A_CABLE_PAIR_B:
+		cdt_length_reg = QCA808X_MMD3_CDT_DIAG_PAIR_B;
+		break;
+	case ETHTOOL_A_CABLE_PAIR_C:
+		cdt_length_reg = QCA808X_MMD3_CDT_DIAG_PAIR_C;
+		break;
+	case ETHTOOL_A_CABLE_PAIR_D:
+		cdt_length_reg = QCA808X_MMD3_CDT_DIAG_PAIR_D;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	val = phy_read_mmd(phydev, MDIO_MMD_PCS, cdt_length_reg);
+	if (val < 0)
+		return val;
+
+	if (result == ETHTOOL_A_CABLE_RESULT_CODE_SAME_SHORT)
+		val = FIELD_GET(QCA808X_CDT_DIAG_LENGTH_SAME_SHORT, val);
+	else
+		val = FIELD_GET(QCA808X_CDT_DIAG_LENGTH_CROSS_SHORT, val);
+
+	return at803x_cdt_fault_length(val);
+}
+
+static int qca808x_cable_test_start(struct phy_device *phydev)
+{
+	int ret;
+
+	/* perform CDT with the following configs:
+	 * 1. disable hibernation.
+	 * 2. force PHY working in MDI mode.
+	 * 3. for PHY working in 1000BaseT.
+	 * 4. configure the threshold.
+	 */
+
+	ret = at803x_debug_reg_mask(phydev, QCA808X_DBG_AN_TEST, QCA808X_HIBERNATION_EN, 0);
+	if (ret < 0)
+		return ret;
+
+	ret = at803x_config_mdix(phydev, ETH_TP_MDI);
+	if (ret < 0)
+		return ret;
+
+	/* Force 1000base-T needs to configure PMA/PMD and MII_BMCR */
+	phydev->duplex = DUPLEX_FULL;
+	phydev->speed = SPEED_1000;
+	ret = genphy_c45_pma_setup_forced(phydev);
+	if (ret < 0)
+		return ret;
+
+	ret = genphy_setup_forced(phydev);
+	if (ret < 0)
+		return ret;
+
+	/* configure the thresholds for open, short, pair ok test */
+	phy_write_mmd(phydev, MDIO_MMD_PCS, 0x8074, 0xc040);
+	phy_write_mmd(phydev, MDIO_MMD_PCS, 0x8076, 0xc040);
+	phy_write_mmd(phydev, MDIO_MMD_PCS, 0x8077, 0xa060);
+	phy_write_mmd(phydev, MDIO_MMD_PCS, 0x8078, 0xc050);
+	phy_write_mmd(phydev, MDIO_MMD_PCS, 0x807a, 0xc060);
+	phy_write_mmd(phydev, MDIO_MMD_PCS, 0x807e, 0xb060);
+
+	return 0;
+}
+
+static int qca808x_cable_test_get_pair_status(struct phy_device *phydev, u8 pair,
+					      u16 status)
+{
+	int length, result;
+	u16 pair_code;
+
+	switch (pair) {
+	case ETHTOOL_A_CABLE_PAIR_A:
+		pair_code = FIELD_GET(QCA808X_CDT_CODE_PAIR_A, status);
+		break;
+	case ETHTOOL_A_CABLE_PAIR_B:
+		pair_code = FIELD_GET(QCA808X_CDT_CODE_PAIR_B, status);
+		break;
+	case ETHTOOL_A_CABLE_PAIR_C:
+		pair_code = FIELD_GET(QCA808X_CDT_CODE_PAIR_C, status);
+		break;
+	case ETHTOOL_A_CABLE_PAIR_D:
+		pair_code = FIELD_GET(QCA808X_CDT_CODE_PAIR_D, status);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	result = qca808x_cable_test_result_trans(pair_code);
+	ethnl_cable_test_result(phydev, pair, result);
+
+	if (qca808x_cdt_fault_length_valid(pair_code)) {
+		length = qca808x_cdt_fault_length(phydev, pair, result);
+		ethnl_cable_test_fault_length(phydev, pair, length);
+	}
+
+	return 0;
+}
+
+static int qca808x_cable_test_get_status(struct phy_device *phydev, bool *finished)
+{
+	int ret, val;
+
+	*finished = false;
+
+	val = QCA808X_CDT_ENABLE_TEST |
+	      QCA808X_CDT_LENGTH_UNIT;
+	ret = at803x_cdt_start(phydev, val);
+	if (ret)
+		return ret;
+
+	ret = at803x_cdt_wait_for_completion(phydev, QCA808X_CDT_ENABLE_TEST);
+	if (ret)
+		return ret;
+
+	val = phy_read_mmd(phydev, MDIO_MMD_PCS, QCA808X_MMD3_CDT_STATUS);
+	if (val < 0)
+		return val;
+
+	ret = qca808x_cable_test_get_pair_status(phydev, ETHTOOL_A_CABLE_PAIR_A, val);
+	if (ret)
+		return ret;
+
+	ret = qca808x_cable_test_get_pair_status(phydev, ETHTOOL_A_CABLE_PAIR_B, val);
+	if (ret)
+		return ret;
+
+	ret = qca808x_cable_test_get_pair_status(phydev, ETHTOOL_A_CABLE_PAIR_C, val);
+	if (ret)
+		return ret;
+
+	ret = qca808x_cable_test_get_pair_status(phydev, ETHTOOL_A_CABLE_PAIR_D, val);
+	if (ret)
+		return ret;
+
+	*finished = true;
+
+	return 0;
+}
+
+static int qca808x_get_features(struct phy_device *phydev)
+{
+	int ret;
+
+	ret = genphy_c45_pma_read_abilities(phydev);
+	if (ret)
+		return ret;
+
+	/* The autoneg ability is not existed in bit3 of MMD7.1,
+	 * but it is supported by qca808x PHY, so we add it here
+	 * manually.
+	 */
+	linkmode_set_bit(ETHTOOL_LINK_MODE_Autoneg_BIT, phydev->supported);
+
+	/* As for the qca8081 1G version chip, the 2500baseT ability is also
+	 * existed in the bit0 of MMD1.21, we need to remove it manually if
+	 * it is the qca8081 1G chip according to the bit0 of MMD7.0x901d.
+	 */
+	ret = phy_read_mmd(phydev, MDIO_MMD_AN, QCA808X_PHY_MMD7_CHIP_TYPE);
+	if (ret < 0)
+		return ret;
+
+	if (QCA808X_PHY_CHIP_TYPE_1G & ret)
+		linkmode_clear_bit(ETHTOOL_LINK_MODE_2500baseT_Full_BIT, phydev->supported);
+
+	return 0;
+}
+
+static int qca808x_config_aneg(struct phy_device *phydev)
+{
+	int phy_ctrl = 0;
+	int ret;
+
+	ret = at803x_prepare_config_aneg(phydev);
+	if (ret)
+		return ret;
+
+	/* The reg MII_BMCR also needs to be configured for force mode, the
+	 * genphy_config_aneg is also needed.
+	 */
+	if (phydev->autoneg == AUTONEG_DISABLE)
+		genphy_c45_pma_setup_forced(phydev);
+
+	if (linkmode_test_bit(ETHTOOL_LINK_MODE_2500baseT_Full_BIT, phydev->advertising))
+		phy_ctrl = MDIO_AN_10GBT_CTRL_ADV2_5G;
+
+	ret = phy_modify_mmd_changed(phydev, MDIO_MMD_AN, MDIO_AN_10GBT_CTRL,
+				     MDIO_AN_10GBT_CTRL_ADV2_5G, phy_ctrl);
+	if (ret < 0)
+		return ret;
+
+	return __genphy_config_aneg(phydev, ret);
+}
+
+static void qca808x_link_change_notify(struct phy_device *phydev)
+{
+	/* Assert interface sgmii fifo on link down, deassert it on link up,
+	 * the interface device address is always phy address added by 1.
+	 */
+	mdiobus_c45_modify_changed(phydev->mdio.bus, phydev->mdio.addr + 1,
+				   MDIO_MMD_PMAPMD, QCA8081_PHY_SERDES_MMD1_FIFO_CTRL,
+				   QCA8081_PHY_FIFO_RSTN,
+				   phydev->link ? QCA8081_PHY_FIFO_RSTN : 0);
+}
+
+static int qca808x_led_parse_netdev(struct phy_device *phydev, unsigned long rules,
+				    u16 *offload_trigger)
+{
+	/* TODO: add link_2500 when added to netdev trigger */
+	/* Parsing specific to netdev trigger */
+	if (test_bit(TRIGGER_NETDEV_TX, &rules))
+		*offload_trigger |= QCA808X_LED_TX_BLINK;
+	if (test_bit(TRIGGER_NETDEV_RX, &rules))
+		*offload_trigger |= QCA808X_LED_RX_BLINK;
+	if (test_bit(TRIGGER_NETDEV_LINK_10, &rules))
+		*offload_trigger |= QCA808X_LED_SPEED10_ON;
+	if (test_bit(TRIGGER_NETDEV_LINK_100, &rules))
+		*offload_trigger |= QCA808X_LED_SPEED100_ON;
+	if (test_bit(TRIGGER_NETDEV_LINK_1000, &rules))
+		*offload_trigger |= QCA808X_LED_SPEED1000_ON;
+	if (test_bit(TRIGGER_NETDEV_HALF_DUPLEX, &rules))
+		*offload_trigger |= QCA808X_LED_HALF_DUPLEX_ON;
+	if (test_bit(TRIGGER_NETDEV_FULL_DUPLEX, &rules))
+		*offload_trigger |= QCA808X_LED_FULL_DUPLEX_ON;
+
+	if (rules && !*offload_trigger)
+		return -EOPNOTSUPP;
+
+	/* Enable BLINK_CHECK_BYPASS by default to make the LED
+	 * blink even with duplex or speed mode not enabled.
+	 */
+	*offload_trigger |= QCA808X_LED_BLINK_CHECK_BYPASS;
+
+	return 0;
+}
+
+static int qca808x_led_hw_control_enable(struct phy_device *phydev, u8 index)
+{
+	u16 reg;
+
+	if (index > 2)
+		return -EINVAL;
+
+	reg = QCA808X_MMD7_LED_FORCE_CTRL(index);
+
+	return phy_clear_bits_mmd(phydev, MDIO_MMD_AN, reg,
+				  QCA808X_LED_FORCE_EN);
+}
+
+static int qca808x_led_hw_is_supported(struct phy_device *phydev, u8 index,
+				       unsigned long rules)
+{
+	u16 offload_trigger = 0;
+
+	if (index > 2)
+		return -EINVAL;
+
+	return qca808x_led_parse_netdev(phydev, rules, &offload_trigger);
+}
+
+static int qca808x_led_hw_control_set(struct phy_device *phydev, u8 index,
+				      unsigned long rules)
+{
+	u16 reg, offload_trigger = 0;
+	int ret;
+
+	if (index > 2)
+		return -EINVAL;
+
+	reg = QCA808X_MMD7_LED_CTRL(index);
+
+	ret = qca808x_led_parse_netdev(phydev, rules, &offload_trigger);
+	if (ret)
+		return ret;
+
+	ret = qca808x_led_hw_control_enable(phydev, index);
+	if (ret)
+		return ret;
+
+	return phy_modify_mmd(phydev, MDIO_MMD_AN, reg,
+			      QCA808X_LED_PATTERN_MASK,
+			      offload_trigger);
+}
+
+static bool qca808x_led_hw_control_status(struct phy_device *phydev, u8 index)
+{
+	u16 reg;
+	int val;
+
+	if (index > 2)
+		return false;
+
+	reg = QCA808X_MMD7_LED_FORCE_CTRL(index);
+
+	val = phy_read_mmd(phydev, MDIO_MMD_AN, reg);
+
+	return !(val & QCA808X_LED_FORCE_EN);
+}
+
+static int qca808x_led_hw_control_get(struct phy_device *phydev, u8 index,
+				      unsigned long *rules)
+{
+	u16 reg;
+	int val;
+
+	if (index > 2)
+		return -EINVAL;
+
+	/* Check if we have hw control enabled */
+	if (qca808x_led_hw_control_status(phydev, index))
+		return -EINVAL;
+
+	reg = QCA808X_MMD7_LED_CTRL(index);
+
+	/* TODO: add link_2500 when added to netdev trigger */
+	val = phy_read_mmd(phydev, MDIO_MMD_AN, reg);
+	if (val & QCA808X_LED_TX_BLINK)
+		set_bit(TRIGGER_NETDEV_TX, rules);
+	if (val & QCA808X_LED_RX_BLINK)
+		set_bit(TRIGGER_NETDEV_RX, rules);
+	if (val & QCA808X_LED_SPEED10_ON)
+		set_bit(TRIGGER_NETDEV_LINK_10, rules);
+	if (val & QCA808X_LED_SPEED100_ON)
+		set_bit(TRIGGER_NETDEV_LINK_100, rules);
+	if (val & QCA808X_LED_SPEED1000_ON)
+		set_bit(TRIGGER_NETDEV_LINK_1000, rules);
+	if (val & QCA808X_LED_HALF_DUPLEX_ON)
+		set_bit(TRIGGER_NETDEV_HALF_DUPLEX, rules);
+	if (val & QCA808X_LED_FULL_DUPLEX_ON)
+		set_bit(TRIGGER_NETDEV_FULL_DUPLEX, rules);
+
+	return 0;
+}
+
+static int qca808x_led_hw_control_reset(struct phy_device *phydev, u8 index)
+{
+	u16 reg;
+
+	if (index > 2)
+		return -EINVAL;
+
+	reg = QCA808X_MMD7_LED_CTRL(index);
+
+	return phy_clear_bits_mmd(phydev, MDIO_MMD_AN, reg,
+				  QCA808X_LED_PATTERN_MASK);
+}
+
+static int qca808x_led_brightness_set(struct phy_device *phydev,
+				      u8 index, enum led_brightness value)
+{
+	u16 reg;
+	int ret;
+
+	if (index > 2)
+		return -EINVAL;
+
+	if (!value) {
+		ret = qca808x_led_hw_control_reset(phydev, index);
+		if (ret)
+			return ret;
+	}
+
+	reg = QCA808X_MMD7_LED_FORCE_CTRL(index);
+
+	return phy_modify_mmd(phydev, MDIO_MMD_AN, reg,
+			      QCA808X_LED_FORCE_EN | QCA808X_LED_FORCE_MODE_MASK,
+			      QCA808X_LED_FORCE_EN | value ? QCA808X_LED_FORCE_ON :
+							     QCA808X_LED_FORCE_OFF);
+}
+
+static int qca808x_led_blink_set(struct phy_device *phydev, u8 index,
+				 unsigned long *delay_on,
+				 unsigned long *delay_off)
+{
+	int ret;
+	u16 reg;
+
+	if (index > 2)
+		return -EINVAL;
+
+	reg = QCA808X_MMD7_LED_FORCE_CTRL(index);
+
+	/* Set blink to 50% off, 50% on at 4Hz by default */
+	ret = phy_modify_mmd(phydev, MDIO_MMD_AN, QCA808X_MMD7_LED_GLOBAL,
+			     QCA808X_LED_BLINK_FREQ_MASK | QCA808X_LED_BLINK_DUTY_MASK,
+			     QCA808X_LED_BLINK_FREQ_4HZ | QCA808X_LED_BLINK_DUTY_50_50);
+	if (ret)
+		return ret;
+
+	/* We use BLINK_1 for normal blinking */
+	ret = phy_modify_mmd(phydev, MDIO_MMD_AN, reg,
+			     QCA808X_LED_FORCE_EN | QCA808X_LED_FORCE_MODE_MASK,
+			     QCA808X_LED_FORCE_EN | QCA808X_LED_FORCE_BLINK_1);
+	if (ret)
+		return ret;
+
+	/* We set blink to 4Hz, aka 250ms */
+	*delay_on = 250 / 2;
+	*delay_off = 250 / 2;
+
+	return 0;
+}
+
+static int qca808x_led_polarity_set(struct phy_device *phydev, int index,
+				    unsigned long modes)
+{
+	struct qca808x_priv *priv = phydev->priv;
+	bool active_low = false;
+	u32 mode;
+
+	for_each_set_bit(mode, &modes, __PHY_LED_MODES_NUM) {
+		switch (mode) {
+		case PHY_LED_ACTIVE_LOW:
+			active_low = true;
+			break;
+		default:
+			return -EINVAL;
+		}
+	}
+
+	/* PHY polarity is global and can't be set per LED.
+	 * To detect this, check if last requested polarity mode
+	 * match the new one.
+	 */
+	if (priv->led_polarity_mode >= 0 &&
+	    priv->led_polarity_mode != active_low) {
+		phydev_err(phydev, "PHY polarity is global. Mismatched polarity on different LED\n");
+		return -EINVAL;
+	}
+
+	/* Save the last PHY polarity mode */
+	priv->led_polarity_mode = active_low;
+
+	return phy_modify_mmd(phydev, MDIO_MMD_AN,
+			      QCA808X_MMD7_LED_POLARITY_CTRL,
+			      QCA808X_LED_ACTIVE_HIGH,
+			      active_low ? 0 : QCA808X_LED_ACTIVE_HIGH);
+}
+
+static struct phy_driver qca808x_driver[] = {
+{
+	/* Qualcomm QCA8081 */
+	PHY_ID_MATCH_EXACT(QCA8081_PHY_ID),
+	.name			= "Qualcomm QCA8081",
+	.flags			= PHY_POLL_CABLE_TEST,
+	.probe			= qca808x_probe,
+	.config_intr		= at803x_config_intr,
+	.handle_interrupt	= at803x_handle_interrupt,
+	.get_tunable		= at803x_get_tunable,
+	.set_tunable		= at803x_set_tunable,
+	.set_wol		= at803x_set_wol,
+	.get_wol		= at803x_get_wol,
+	.get_features		= qca808x_get_features,
+	.config_aneg		= qca808x_config_aneg,
+	.suspend		= genphy_suspend,
+	.resume			= genphy_resume,
+	.read_status		= qca808x_read_status,
+	.config_init		= qca808x_config_init,
+	.soft_reset		= qca808x_soft_reset,
+	.cable_test_start	= qca808x_cable_test_start,
+	.cable_test_get_status	= qca808x_cable_test_get_status,
+	.link_change_notify	= qca808x_link_change_notify,
+	.led_brightness_set	= qca808x_led_brightness_set,
+	.led_blink_set		= qca808x_led_blink_set,
+	.led_hw_is_supported	= qca808x_led_hw_is_supported,
+	.led_hw_control_set	= qca808x_led_hw_control_set,
+	.led_hw_control_get	= qca808x_led_hw_control_get,
+	.led_polarity_set	= qca808x_led_polarity_set,
+}, };
+
+module_phy_driver(qca808x_driver);
+
+static struct mdio_device_id __maybe_unused qca808x_tbl[] = {
+	{ PHY_ID_MATCH_EXACT(QCA8081_PHY_ID) },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(mdio, qca808x_tbl);
-- 
2.43.0


