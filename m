Return-Path: <linux-arm-msm+bounces-1921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CCF7F8750
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Nov 2023 01:36:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 95AA8B214C1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Nov 2023 00:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1A0DA21;
	Sat, 25 Nov 2023 00:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dunZdKMv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6519A1BDD;
	Fri, 24 Nov 2023 16:35:31 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4079ed65582so16486745e9.1;
        Fri, 24 Nov 2023 16:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700872529; x=1701477329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qMmCWPX59UJtqG86RQS8Ot62rGrmo3eqFy3GB/yFnLs=;
        b=dunZdKMvUh6tiSxtKiyKxXZBJ794T5W3wqeJOrCDCQqmjBQ5PxKJffBVxUvdnshF3q
         2IyoDP9NOp70LUCD6073STtSFmlI0lBDCfkpl1YNZxCUDx/OSPQn5gVvGWo3kY3BkDI6
         b/K8pJWtb724d0qu82Afqhn3kftXLi9jR6X4kdml3acahxy7CzOM+/e9YefFkFBg//JL
         DPMX5ySie4tFVOKtMW9EVyYFty/a7BuWsmBHLo31uibDKhBWZpocnGct92/nVgOOArOM
         yj2b99C7oIuWfwU/0goPt3i73k8Pq8V+ddpZd2kjTedasNhxM3D9tYksxw4T4iUZNRW0
         /dmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700872529; x=1701477329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qMmCWPX59UJtqG86RQS8Ot62rGrmo3eqFy3GB/yFnLs=;
        b=r6/LNxNGsaTedG3Cnz7zRktrfFTiSpxJUb3tbS8eRRBb4ez0K+FMZQIlBkF4TA5VNn
         vsauzqQ2F5nFqZoOZbiO60tooylew2FiW82uYRasFw4/wOPEO98Ez/nlo8icWA2ge2Xi
         1gIhn7VZrQsjxEwDxhzEiWj5VqbjwCxj7BnwUK8DbKugUaES8LXLtjrQ0GqZmYrQGYzf
         +byrOWKhB+5bT5+icd8z0FEuDBQCxvtuqsmRszsh6k4wEtesfT7gLLTMoqqfEf9hdiUk
         nKRoGtYO8rSKWvPbFByXmkt3EQSEtM3JLt92mQlhTQAkoDoMVhsQJbp+QOlptCXJe9VO
         4JPg==
X-Gm-Message-State: AOJu0YyFGCbhsv2cbf1eo7Vlugj1xYNGez9djEGG9TYilzyrvwyYZXyd
	dHLpnW2oZpRPb7TZ1PzSRK4=
X-Google-Smtp-Source: AGHT+IFKiEoNKX+AkqKaRb0CQSvaTZ3MufoYCXx4Z6VdVsXI5K9f7c6Uqf9agFzA+WCb4EwraptDVA==
X-Received: by 2002:a05:600c:3104:b0:406:8496:bd8b with SMTP id g4-20020a05600c310400b004068496bd8bmr3949616wmo.9.1700872529488;
        Fri, 24 Nov 2023 16:35:29 -0800 (PST)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id u13-20020a05600c00cd00b00405718cbeadsm4268005wmm.1.2023.11.24.16.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 16:35:29 -0800 (PST)
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
	Vladimir Oltean <olteanv@gmail.com>,
	David Epping <david.epping@missinglinkelectronics.com>,
	Harini Katakam <harini.katakam@amd.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Robert Marko <robert.marko@sartura.hr>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [net-next RFC PATCH v2 08/11] dt-bindings: net: add QCA807x PHY defines
Date: Sat, 25 Nov 2023 01:11:24 +0100
Message-Id: <20231125001127.5674-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231125001127.5674-1-ansuelsmth@gmail.com>
References: <20231125001127.5674-1-ansuelsmth@gmail.com>
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
 include/dt-bindings/net/qcom-qca807x.h | 30 ++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 include/dt-bindings/net/qcom-qca807x.h

diff --git a/include/dt-bindings/net/qcom-qca807x.h b/include/dt-bindings/net/qcom-qca807x.h
new file mode 100644
index 000000000000..e7d4d09b7dd4
--- /dev/null
+++ b/include/dt-bindings/net/qcom-qca807x.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
+/*
+ * Device Tree constants for the Qualcomm QCA807X PHYs
+ */
+
+#ifndef _DT_BINDINGS_QCOM_QCA807X_H
+#define _DT_BINDINGS_QCOM_QCA807X_H
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


