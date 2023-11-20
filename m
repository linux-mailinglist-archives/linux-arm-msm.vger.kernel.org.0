Return-Path: <linux-arm-msm+bounces-1166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 394A27F14E3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 14:52:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A3A21C216EC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 13:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CFA71D540;
	Mon, 20 Nov 2023 13:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HeWb+XlZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A9F810E4;
	Mon, 20 Nov 2023 05:51:31 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3316d3d11e1so1603694f8f.0;
        Mon, 20 Nov 2023 05:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700488290; x=1701093090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+bK4gHzJ+y3tePc89TtX9q7l+Za/0YYi8syFPOCy8lg=;
        b=HeWb+XlZCqLF+KUgMKMDI142PLxAvEzhH679iJOPRQav8kONDKqe0ksdNf7O4EOy6s
         1G53YHkVQ7mQd2rxAVkuTK2fj99PyHXAyWDGtmZgqR/yObCxvqUCoQdZ36HNLWzeGNYe
         YnJQQnFuO08xFuA6PMnEBdETs6T0ZPVcbyqX5nWvwFCrj3dx+x4puWT6meqXgXwwILB5
         8nhHg1Ts8ncTHRAy+g9b93slJWnwUEXZKgfZZLe3d+9SKp8xVFwViuzgbhekF/NDTDZi
         TdTeotSovBcYBpQgnMhkYfrdtknFk7YDkfeEQPBnaVGlj5DRutk4nv/zNwyLFrzx8bN5
         2W2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700488290; x=1701093090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+bK4gHzJ+y3tePc89TtX9q7l+Za/0YYi8syFPOCy8lg=;
        b=vVU7nWnQDbtL6gK3cZnt1vlYxRZpUkq6KvpbKTIBYMJgGy2cn7jKylS6EhGJ8Wrmev
         cESEjWVy3mJyVEDrPT+uoBi/EYJZsKjcEEyUIj3OIjd8PAkxmUuoPUTxRM/HHoFzryoW
         zx5M0EwJNKaQB1az2ySRVPoee16KRic2oRLFY4JjhI7JqknSFTf6WllK9E29a5NNMlt9
         yqcpmT4RyhMDR0aFfjYjF/KR4UVj0XU8f/84t5OntC5dafEpyV85RmfWW7oK7ZLI0Pmt
         4mtTdnFmLO6SkVqs0PDOJDc7fiXBfa3I4E70wz78pkuo3PIWd6zcDZ03Jp3s2YulVqd0
         5jCg==
X-Gm-Message-State: AOJu0YwrXezaYAQirMZDDJYoXsVdGsePfRgUMgqnh5VygBSMSmXeZ7YW
	dnb7GP8v9Y6cTQSxV5NmkOc=
X-Google-Smtp-Source: AGHT+IGQpqPZK+oPA2rWRqOtnSOKMxcGuZz5hDx228kkb7ZrMwBDn5rbRsE/t5rqE8I++LpS4paQag==
X-Received: by 2002:a05:6000:1445:b0:332:cb0e:73b6 with SMTP id v5-20020a056000144500b00332cb0e73b6mr1341263wrx.2.1700488289753;
        Mon, 20 Nov 2023 05:51:29 -0800 (PST)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id j33-20020a05600c1c2100b0040772934b12sm18205846wms.7.2023.11.20.05.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 05:51:29 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	David Epping <david.epping@missinglinkelectronics.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Harini Katakam <harini.katakam@amd.com>,
	Simon Horman <horms@kernel.org>,
	Robert Marko <robert.marko@sartura.hr>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [net-next RFC PATCH 11/14] dt-bindings: net: add QCA807x PHY defines
Date: Mon, 20 Nov 2023 14:50:38 +0100
Message-Id: <20231120135041.15259-12-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231120135041.15259-1-ansuelsmth@gmail.com>
References: <20231120135041.15259-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Robert Marko <robert.marko@sartura.hr>

Add DT bindings defined for Qualcomm QCA807x PHY series related to
calibration and DAC settings.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 include/dt-bindings/net/qcom-qca807x.h | 45 ++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 include/dt-bindings/net/qcom-qca807x.h

diff --git a/include/dt-bindings/net/qcom-qca807x.h b/include/dt-bindings/net/qcom-qca807x.h
new file mode 100644
index 000000000000..42c45c7d5210
--- /dev/null
+++ b/include/dt-bindings/net/qcom-qca807x.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
+/*
+ * Device Tree constants for the Qualcomm QCA807X PHYs
+ */
+
+#ifndef _DT_BINDINGS_QCOM_QCA807X_H
+#define _DT_BINDINGS_QCOM_QCA807X_H
+
+#define PSGMII_QSGMII_TX_DRIVER_140MV	0
+#define PSGMII_QSGMII_TX_DRIVER_160MV	1
+#define PSGMII_QSGMII_TX_DRIVER_180MV	2
+#define PSGMII_QSGMII_TX_DRIVER_200MV	3
+#define PSGMII_QSGMII_TX_DRIVER_220MV	4
+#define PSGMII_QSGMII_TX_DRIVER_240MV	5
+#define PSGMII_QSGMII_TX_DRIVER_260MV	6
+#define PSGMII_QSGMII_TX_DRIVER_280MV	7
+#define PSGMII_QSGMII_TX_DRIVER_300MV	8
+#define PSGMII_QSGMII_TX_DRIVER_320MV	9
+#define PSGMII_QSGMII_TX_DRIVER_400MV	10
+#define PSGMII_QSGMII_TX_DRIVER_500MV	11
+/* Default value */
+#define PSGMII_QSGMII_TX_DRIVER_600MV	12
+
+/* Full amplitude, full bias current */
+#define QCA807X_CONTROL_DAC_FULL_VOLT_BIAS		0
+/* Amplitude follow DSP (amplitude is adjusted based on cable length), half bias current */
+#define QCA807X_CONTROL_DAC_DSP_VOLT_HALF_BIAS		1
+/* Full amplitude, bias current follow DSP (bias current is adjusted based on cable length) */
+#define QCA807X_CONTROL_DAC_FULL_VOLT_DSP_BIAS		2
+/* Both amplitude and bias current follow DSP */
+#define QCA807X_CONTROL_DAC_DSP_VOLT_BIAS		3
+/* Full amplitude, half bias current */
+#define QCA807X_CONTROL_DAC_FULL_VOLT_HALF_BIAS		4
+/* Amplitude follow DSP setting; 1/4 bias current when cable<10m,
+ * otherwise half bias current
+ */
+#define QCA807X_CONTROL_DAC_DSP_VOLT_QUARTER_BIAS	5
+/* Full amplitude; same bias current setting with “010” and “011”,
+ * but half more bias is reduced when cable <10m
+ */
+#define QCA807X_CONTROL_DAC_FULL_VOLT_HALF_BIAS_SHORT	6
+/* Amplitude follow DSP; same bias current setting with “110”, default value */
+#define QCA807X_CONTROL_DAC_DSP_VOLT_HALF_BIAS_SHORT	7
+
+#endif
-- 
2.40.1


