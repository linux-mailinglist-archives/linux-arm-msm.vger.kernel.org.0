Return-Path: <linux-arm-msm+bounces-2017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FECF7F90CD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Nov 2023 02:54:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C154F1C20AD7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Nov 2023 01:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B95F1368;
	Sun, 26 Nov 2023 01:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PE/mzQvL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 221F2182;
	Sat, 25 Nov 2023 17:54:01 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-40b2ad4953cso22873245e9.0;
        Sat, 25 Nov 2023 17:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700963639; x=1701568439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qMmCWPX59UJtqG86RQS8Ot62rGrmo3eqFy3GB/yFnLs=;
        b=PE/mzQvLCET07AQLvRIG9wwbHZOjHS6eh4aC2K5pJOcd19QdkjmJ2Y86nkOS3FnjgZ
         QtXXu/gT6YFcLUJ3lGrWW+eFKbuKm2LkuNnA/JLOzNYb0c7FztjYhWFS/torW1D01GM6
         wlGWChxdiV5KONbiPXrooyFB62orpH2ekheDpItAyxu/UcuVmv3o8Dc42jMzS2GmwZJJ
         5YzlmJjlIWdxHGLgrDFUhs+GUKTRROaeqaBHfSQgx763qcp/noTKvFct6llRMjzA0u0T
         KO9fmaymAMniyY4lOAaszmykyta+uqW7x/cDBmsZ8eblz5J5BHXtMS/+xDZr/RjS1XCk
         V88g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700963639; x=1701568439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qMmCWPX59UJtqG86RQS8Ot62rGrmo3eqFy3GB/yFnLs=;
        b=sV46AEbHUvH3sPMv9wC++vSdBjwFeeNGS21KsVp7+Njbu2TPCqNLhM3PVmIu4qH4Gc
         EbAaf4ui5gO2RUvY6tUXdiVCzNhCXwTiu7MxI087D8aNb9t0pT42MyeMYcOl6mGKdICA
         dOvTdqlNLa+sB71vso+TI2ckbCUOdwmYZQuobkNGpPW7w+8OcruXuQLmH/BV3IQ1pwdg
         Cv2VQvGa2Z9XKRXV9ffKNvr/ZsyRnlSFvmgGK+NV1NtqUD0+aXnkeSbNOXDi81IYbaBw
         JBE0P35M0aHaXyYqroWdEJtxjoGqWTC9+JjXbpemzYmoAhgOZXNPXW7Ic0a+cmKK4XvG
         pafw==
X-Gm-Message-State: AOJu0YzELvAsksLiz/9b8I5A746tc3rLDEeycOet+xgoODSSYAQIQ+6l
	M0Inrad8ZKoWsB+l4tUWwHtI0QIWFZCo8g==
X-Google-Smtp-Source: AGHT+IG1ceziC/+z97gXuY0UcTtf4RtdValQD8/J9dsJkOT+P4ZAnEAQamQO6FPuVGCiIDUiL9zX0A==
X-Received: by 2002:a05:600c:1d03:b0:40b:3e26:8733 with SMTP id l3-20020a05600c1d0300b0040b3e268733mr3829685wms.0.1700963639298;
        Sat, 25 Nov 2023 17:53:59 -0800 (PST)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id p34-20020a05600c1da200b00406408dc788sm9875344wms.44.2023.11.25.17.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Nov 2023 17:53:59 -0800 (PST)
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
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Robert Marko <robert.marko@sartura.hr>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [net-next PATCH RFC v3 5/8] dt-bindings: net: add QCA807x PHY defines
Date: Sun, 26 Nov 2023 02:53:43 +0100
Message-Id: <20231126015346.25208-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231126015346.25208-1-ansuelsmth@gmail.com>
References: <20231126015346.25208-1-ansuelsmth@gmail.com>
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


