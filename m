Return-Path: <linux-arm-msm+bounces-3686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F7680877B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 13:19:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2F331F2241A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 12:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 206B339AFD;
	Thu,  7 Dec 2023 12:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XOxvio2T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A790D4A
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 04:19:38 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a1e2f34467aso78342266b.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 04:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701951576; x=1702556376; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EsQY5wdtf2BXxOhs26sA3XI/MGPOIVweT0ZY3rFx6EE=;
        b=XOxvio2TGxyBrSrkmlKHoQdF7wQsqIB8fxc/Uv3j5OD+vo8LTnnTceAugcsVHBcXw8
         Z4R1z/VyLQMAXJAtJafvI8H/RSBdqCDimAWyJSLiPoo5ISU8VcurlSY8ME621iZt6Ap2
         3qz8YOtfFzhkMXxvZ3Op3FjT9oowWyRq00X72dELipaC+WLqvbLiu/ZH8yM1MJF0Kafg
         h/p61Il+wcQvQ7JtzvnzM47yRM6XY33Z26auAacWQiHJmPILl225hFftGU4XxfQMGryi
         hJaqfeIVY+PbbIXwkRdNs/GbfYjbAAdVeu/lCwm4x7MDw0hVmCvEZN3Kv0W5SvyYM5+/
         vtYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701951576; x=1702556376;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EsQY5wdtf2BXxOhs26sA3XI/MGPOIVweT0ZY3rFx6EE=;
        b=eDgu8eOVBBsY9gRgW0yosHXsypl296M8+8CCChKckeCM0WbtBQzC595Jw6CmcbOTfp
         ElgyszfHOauXBZXx+hDa7IhSIsWTJvFfLPeqs7QRcGXmh8ygVcE4uOpcogvfv0KFphJZ
         WkhNYtM2X+36NUJlJYF1mM+PzhT4dcLGJPwIALO+smUnBPSSvs9S8a+yaLsZKwEHAWi0
         y+Uy/4F+7NdeYiCNd1ujnImVbON82uoNKDkUXQx2zL2DHPJD6wxKdOs4myCUPchTmDhF
         MHJdJ/8pB7JtD6zbeCeTBvhUBXtJPOjtJy7KEfLC4r0iRpcK0GE+rq7KwimFMAg5Rx/b
         6Gwg==
X-Gm-Message-State: AOJu0Yw/TfmNCHPnlV9MNJ6CBKpXXOXvNgNPG5oeOS+7Y7uM7o0GG5kJ
	j0A9hSkmyCY0aVqvnhd4zzLxUk878fIVOOyNB9c=
X-Google-Smtp-Source: AGHT+IEJh+HNNCNW6mga6raHMrGIrb/9Y+5aKaSMdFVj9Bs4AgM45TqY+hEdQivTRCcaNo5UacOMmQ==
X-Received: by 2002:a17:906:4b55:b0:a04:bc39:c1c7 with SMTP id j21-20020a1709064b5500b00a04bc39c1c7mr1806037ejv.36.1701951576296;
        Thu, 07 Dec 2023 04:19:36 -0800 (PST)
Received: from [127.0.1.1] ([82.79.186.233])
        by smtp.gmail.com with ESMTPSA id f24-20020a170906c09800b00a1e814b7155sm761394ejz.62.2023.12.07.04.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 04:19:35 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 07 Dec 2023 14:19:10 +0200
Subject: [PATCH v3 1/7] phy: qcom-qmp: qserdes-com: Add some more v6
 register offsets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v3-1-dfd1c375ef61@linaro.org>
References: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v3-0-dfd1c375ef61@linaro.org>
In-Reply-To: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v3-0-dfd1c375ef61@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2774; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=tCAG5xQlxlUAJwFjT/XmANZmT3YOrqILBnsoD1MYGiU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlcbhMn3n8hOVtt/nVR4qTH6yHdvi+vFAu6hL+b
 3Zd7S1yA/uJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZXG4TAAKCRAbX0TJAJUV
 VoUREACS1VbRFuBKoqaNg7LioCZuD+Rt7ozvg+Nru7b5dHH9uxBIE317hv3GB3JtWIYpM/9y8ku
 L6pTqF8XhFK1a+a33/QuBLArjmZv+gGeehZfbMgGgsPo5xtUVH3+ROPlJE1PRmtDfa5NuN9fTZ+
 Y/e59nnaQD14EfrDP8+llIvmwrZdpNthlDmvZipFQ3er/dCU7FxctIrU4Tup1rg6k2X5IpZF6YI
 8kIVrnvXlkRIKwTi/dhW3XM5qRbMhAtalNBcnIFCrA6n7E8wfQRe1txa5WryTGc6kNNmImbRAFT
 8VLjEOvMhQdBfB7lylXPxiksy7ole8zQZw0dA3P8nCk8vQa7jH2kcxmaDBqDpbZSeky3osKzDiv
 B5NAiGMdJWUx+7mYdjas52hvDulLNV8ovCwSQjnS1VaAoVkX3o0WvVg3D6vVx13A/xPoAMha7jG
 cIfPJhXdBPiAneNgTCp90XwsmOpLfhKs/0LXvsTsEs+rAqBDvKSLnkhsruDteuKI2l42ToKkCmD
 1GzOodkLKeNaaxbNGIFR4RBnjxCGyrYC2kvjQ9ieereZTckCwIzlLwLfTZvFsRsAisrY7Yc8NIE
 RT4guFZdHY45g19ILveh/1p7x7tnRIqST3RueopTzRQ5kfZy8uQfwuO5kqs2mqN6S/QDA01hJJ+
 bdViTlaNFYyXO2g==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Add some missing V6 registers offsets that are needed by the new
Snapdragon X Elite (X1E80100) platform.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v6.h  | 5 +++++
 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v6.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v6.h
index f420f8faf16a..ec7291424dd1 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v6.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v6.h
@@ -22,6 +22,8 @@
 #define QSERDES_V6_COM_DIV_FRAC_START2_MODE1			0x34
 #define QSERDES_V6_COM_DIV_FRAC_START3_MODE1			0x38
 #define QSERDES_V6_COM_HSCLK_SEL_1				0x3c
+#define QSERDES_V6_COM_INTEGLOOP_GAIN0_MODE1			0x40
+#define QSERDES_V6_COM_INTEGLOOP_GAIN1_MODE1			0x44
 #define QSERDES_V6_COM_VCO_TUNE1_MODE1				0x48
 #define QSERDES_V6_COM_VCO_TUNE2_MODE1				0x4c
 #define QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE1_MODE1		0x50
@@ -48,6 +50,7 @@
 #define QSERDES_V6_COM_VCO_TUNE2_MODE0				0xac
 #define QSERDES_V6_COM_BG_TIMER					0xbc
 #define QSERDES_V6_COM_SSC_EN_CENTER				0xc0
+#define QSERDES_V6_COM_SSC_ADJ_PER1				0xc4
 #define QSERDES_V6_COM_SSC_PER1					0xcc
 #define QSERDES_V6_COM_SSC_PER2					0xd0
 #define QSERDES_V6_COM_PLL_POST_DIV_MUX				0xd8
@@ -56,6 +59,7 @@
 #define QSERDES_V6_COM_SYS_CLK_CTRL				0xe4
 #define QSERDES_V6_COM_SYSCLK_BUF_ENABLE			0xe8
 #define QSERDES_V6_COM_PLL_IVCO					0xf4
+#define QSERDES_V6_COM_PLL_IVCO_MODE1				0xf8
 #define QSERDES_V6_COM_SYSCLK_EN_SEL				0x110
 #define QSERDES_V6_COM_RESETSM_CNTRL				0x118
 #define QSERDES_V6_COM_LOCK_CMP_EN				0x120
@@ -63,6 +67,7 @@
 #define QSERDES_V6_COM_VCO_TUNE_CTRL				0x13c
 #define QSERDES_V6_COM_VCO_TUNE_MAP				0x140
 #define QSERDES_V6_COM_VCO_TUNE_INITVAL2			0x148
+#define QSERDES_V6_COM_VCO_TUNE_MAXVAL2				0x158
 #define QSERDES_V6_COM_CLK_SELECT				0x164
 #define QSERDES_V6_COM_CORE_CLK_EN				0x170
 #define QSERDES_V6_COM_CMN_CONFIG_1				0x174
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6.h
index 8883e1de730e..23ffcfae9efa 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6.h
@@ -23,6 +23,7 @@
 #define QSERDES_V6_TX_PARRATE_REC_DETECT_IDLE_EN		0x60
 #define QSERDES_V6_TX_BIST_PATTERN7				0x7c
 #define QSERDES_V6_TX_LANE_MODE_1				0x84
+#define QSERDES_V6_TX_LANE_MODE_2				0x88
 #define QSERDES_V6_TX_LANE_MODE_3				0x8c
 #define QSERDES_V6_TX_LANE_MODE_4				0x90
 #define QSERDES_V6_TX_LANE_MODE_5				0x94

-- 
2.34.1


