Return-Path: <linux-arm-msm+bounces-1466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B0F7F4323
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 11:04:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9BE41C20A1E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 10:04:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3D172556B;
	Wed, 22 Nov 2023 10:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iZjH4zgd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6387719E
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 02:04:11 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5401bab7525so9419001a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 02:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700647450; x=1701252250; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=37pl4HMRaLDQ9/dj8EKKJfS1KLcArLtO6z5a7AglAAw=;
        b=iZjH4zgdC5hBooeWE1g5C0EJP35DWq8nK9MKCMBuLO5qFtW2aT3SLDfrwkOQ1mETje
         ho4yOMoatAQfMVO7bqhX5W4gJJbW0fphhjym6r5E49YXsChQaunwa+S9j+9IEJ3bA5A8
         i4Xciz7szC4tRN4Z0bcwPsEIFG7BT7N4x19s2NQE3geuRmAnnk8ek5Kb8RKgVb61knTw
         51DWmT5izj7nOUU/kl1XQI7F76gqAfr3D39Es82QQkS44XML/t+neOcJOSHc5ZU7xArW
         209T3Q4pn4AiE8VsE5iuBoD8dX6pCSd0rz4IsEJr6ttakCrAiIiMHdU+LKXm7F5K5V7o
         o98Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700647450; x=1701252250;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=37pl4HMRaLDQ9/dj8EKKJfS1KLcArLtO6z5a7AglAAw=;
        b=HhQZVCbJoMBYjYnNqRu8qyRC59r2dzQZLgMGJFnuKwP8S40rRgJSBpHTUtmp1l612R
         fcWAfH3SMMuuYVJxR0/tZ3VPhnzspKy305STFlfTmp2SoWnR8CctkdwAywoxkzDuQeX5
         zWaUEm2a0sBUBf+FPeuDp34fhGxVJZg4FQvAXlKR8ghUo1CG2VcZ6Xw0ORG+4rQqYjp7
         Y2NRfVUDsAzmebLgkBfzYb20KNgf9odDb59txwI7F28A0OBhWcPTLt50FYiGOPGOyHSw
         fi+oskyBR2HZdZ97QlXmfvhssTmmxi70oOz9ElmU64J4Cg4Noh8Zms2wq96rVOzcfX0g
         PWBQ==
X-Gm-Message-State: AOJu0YyRaTJJjgBTAjXMor1o9jGwIbEU5jSAVlAaylO5AigIxDkyYQFu
	gsheM3b2oFxHfhqyvoh/VGl5dzxtc3A5nVlHh58=
X-Google-Smtp-Source: AGHT+IFWU0iEv8BqhoV9DV+1eqEuqLkQxxovBx4eY0rIvhqZbZqTHH27JWzfm+iKIpLrGqEimllvtw==
X-Received: by 2002:aa7:d8c2:0:b0:543:566f:2e89 with SMTP id k2-20020aa7d8c2000000b00543566f2e89mr1545070eds.37.1700647449802;
        Wed, 22 Nov 2023 02:04:09 -0800 (PST)
Received: from [127.0.1.1] ([86.123.99.122])
        by smtp.gmail.com with ESMTPSA id o9-20020a509b09000000b0053deb97e8e6sm6110456edi.28.2023.11.22.02.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 02:04:09 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 22 Nov 2023 12:03:53 +0200
Subject: [PATCH 1/7] phy: qcom-qmp: qserdes-com: Add some more v6 register
 offsets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v1-1-d9340d362664@linaro.org>
References: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v1-0-d9340d362664@linaro.org>
In-Reply-To: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v1-0-d9340d362664@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2713; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=wuMKuc8sVyzIHG6Zfhec3C34NmF6yKe0sA4KnFTG0yQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlXdIOpu4pjNY+PIV9zXxRsqB/b+GHqkbuLaTx5
 TFsZbeY9TSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZV3SDgAKCRAbX0TJAJUV
 VrZXD/9+eXGz1JvGFxI8N3bHnDjKGj/dkgLOOFlJrq4RVUMw7ZXu4wZoeea9CTDpWjmf9pR0DE/
 d22IEP5rv2kl2KN2SVuTBnVrFtOZlQAurk+NeUcgWSnhmb3aZ9UrediFpviRC7MBz0ESMDFb4rx
 1GJnQA16R/ZmZmD6fG4WzE3GBJnp+3sbd0t5hgdWYfcFxnqxyPFi3xcyOQXMGHiAziNSBJdtNmw
 pNRz7hogIIw30pLlEYCb+9U0oQVChgkJ4gX/sy1zdfZ9/pwiZh0JpjpUdiKeZxXbd+Hf4tbsTSe
 U62/3zFbRy9za7B7OXqh0rDczc+E9LMo1jB8V/JO6Gz9PyyVRg2QjrH5Nvcn7FGC4v4reevqI5H
 tNNc5oCxuppVcfx3PjA68LfFU9YjnGlVRu6TSA//QkByqAAi000iFwdHgL2eyAa/h64qNqKFVnA
 q7cayY0zJMnTFyFzkGiXqsjgpQY25XrmuNPxo6hvglBf2swe5NGJz2X3ZAO9T6V+N2C2zxJ00ig
 z0ZSlo9Ncb3bdPxzgcsO/SyGKz6b/FHi/L8VPoj53uLkDQn3h38gRCDF5tg5gHB4LITNATQjYl6
 +WH6IFTsdkeoTgXmSbX51d9oPWy27ShMHwMaEXxpESUV2Q1sPw704KwI7NEXcp30c5LzB/T2aNP
 Qm6esAaYkkzZxtw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Add some missing V6 registers offsets that are needed by the new
Snapdragon X Elite (X1E80100) platform.

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


