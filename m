Return-Path: <linux-arm-msm+bounces-77149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B3DBD8AA4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 12:08:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E982545F4D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 10:03:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 121E83043C1;
	Tue, 14 Oct 2025 10:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="za/2JYZS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B579306B08
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 10:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760436184; cv=none; b=EWBv2pXxOaob5idyusk6RS+QkWYFFXh2bOFXYaF1gRZom5Q6Judfwazb0lmXaXcVnEx5ssoyZTpPl5wmEAreyFL5je8VCi3KWTvVvfFa9/imOntcKUoTsG+ORQ+ZajHBKDx3kuDGZcjYYRT7UUjGzDtzqPRrqml0q+E3GyJwj9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760436184; c=relaxed/simple;
	bh=BgmhdRMvLlgpN/7k6aQQi92mlj64RE1e5APUgFOVVyc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SEXHEts6TQNwoDpgdV2F/NqvvLGVKxW1NWZMKMYjauXLq9+u10daGMQFXPt9LBHr6mDtP7PlOt5Q7/mB0ErLYL1+24XZEChAzxjpkN1jroSD1rX2PrRulkmqb+Xd+Oq3WQCA0nlOmRZhDidyu7hS6I0NRVqxYuoau90eA/AEpTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=za/2JYZS; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-46e2e6a708fso30951045e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 03:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760436180; x=1761040980; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oe1S5QdAgZ6PQC+SmWz8IK3Ii5YFBwtBoAcJ3b2LeJA=;
        b=za/2JYZStWMhJPkXWw98xPwtr08XUJW9sZu3l1M2a1YOyqbBjfWlHu3URFjrKeu29T
         mnHqezEoGElKGw1Pvjz1VaSL4rSfdgPifBQWqBpofJc2DAKWFEOu9PaNjOt/q6+72lOY
         R5lrzQa2lMPH/h1Lj96fgBC73xiw+QuVYjh49KrcCY+1JM7sYG+HzEmX8YZJbmf8F1P7
         5ZJ9BgUOgj1hIfP1GCsPsmIneDX8mA/+NMV+BzYUb7R0V8SrKiqkkWj7jOGMGiLRDbdY
         3b2pukweA9LEMpwXRosGPQqO9iT4xxLAXJ0PX0n1M8GnhTcpsCdv59tZOiZLYFEnBKxq
         fJYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760436180; x=1761040980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oe1S5QdAgZ6PQC+SmWz8IK3Ii5YFBwtBoAcJ3b2LeJA=;
        b=bIXgpRlOFtO93setdi9RayGZsZA4rPeFAXVQyUFCYzDXcjaVVTl4S/t8lxgnWDyLgO
         qHrfDhB/vz2tCnNXBZRmCplIkBuBZ7UZddh5Op/0s2ynHGO8Gb0ynnCRA2wYMwDOwH+p
         u4ZzRu4+/dlqUCui0Q/nRGT5FMfjVuldIXS8M2Mc9ldKEdovctx5mgBAHcJOO9xlPzC+
         dLArYs1DBK2amZSPA5q0ZIP2wS2CjNljsbQwlf5OfZAhBRltWebl1A91WEGxSnVmr35c
         +6SqT7wP7TldCvigFPa2Rw/dSG6R0pnztAP1yMXjttIN/a/+8gkc8/RIPckphenBqKQJ
         WgVg==
X-Forwarded-Encrypted: i=1; AJvYcCWXjtAg+H4wNDOIQa25nC0ytrkPaEcMnumFLZH823ZAZXuu5WCl9stpYP8MY1JaYGta3kGogkyfFpf6nZ5g@vger.kernel.org
X-Gm-Message-State: AOJu0YwrXm/qLy1w/ShRT3k+YY5OS42+24B1+UVEgPPn0ZnuMkIZ+DXm
	V5lxiSq79CQH+nukc9FdBDqH/rgw7HmkC+xW7bZfiTqEIyUVXXdQFvTK51WVnIPtjv4=
X-Gm-Gg: ASbGncv3/TwbU1sRaWlxPMRoaP6OSkGMiyn5llqz1u4+XVmqiKocCXkKmYy439xEiA5
	7F8u6xfmn9/47im8IkchF2EgZzt/wUJX86YYnpKra/VyVSYOEYISdCgqiFyKnagoAIrx9i1BQi+
	PetItPk+iTr9Eejp0vvqyDruAvTh9eJ0OH9OzsGf5kA7Vn6jRYUFQxsn1rmDrcyjFmh/eB8wg4k
	YzvI04gBeYyWZ23yvRZYNgVVm6oc4awfBy/YO1g64/bwgYnvC8rvAr8aAvq7RQClDrRa1bexUut
	89IykDj4OJWOkDKaghFkfqfAgrl1/3pGu+Foh7Gt7hRWHsyOhEYd7Tfostme7edq4HNPUqePYLV
	qRTjXWoxgM6vzE6XmFD7WoVqcsGaPKHlT/KXW7Xg9LLvpThiWo4U5erwBcdjbhlA5
X-Google-Smtp-Source: AGHT+IFXQlAiZxUpsOyWjLYxCb+pvuSYy9txnYsOvvpPOnU09dHCFC7P0rFzgIwqYP2wrZy+bzd05Q==
X-Received: by 2002:a05:600c:4586:b0:46e:4883:27d with SMTP id 5b1f17b1804b1-46fa9b079a9mr175260475e9.30.1760436179564;
        Tue, 14 Oct 2025 03:02:59 -0700 (PDT)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb489197dsm239615305e9.10.2025.10.14.03.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 03:02:58 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 14 Oct 2025 13:02:29 +0300
Subject: [PATCH v3 3/4] phy: qcom-qmp: qserdes-com: Add v8 DP-specific
 qserdes register offsets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-phy-qcom-edp-add-glymur-support-v3-3-2772837032ef@linaro.org>
References: <20251014-phy-qcom-edp-add-glymur-support-v3-0-2772837032ef@linaro.org>
In-Reply-To: <20251014-phy-qcom-edp-add-glymur-support-v3-0-2772837032ef@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3130; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=BgmhdRMvLlgpN/7k6aQQi92mlj64RE1e5APUgFOVVyc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBo7h/GA0vAQpCOUSzu7GQbh+2HdAfu23u1UpDub
 WitMODqp7GJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaO4fxgAKCRAbX0TJAJUV
 VuN/D/9IfUrD89o1znhS/+WIZEUUX22u6tBBNtCfgoIn1xFZwEHQGZ4Y8rqqdj5oxvsUHw77llw
 iLVkZz30oOmeWU/L6ekYL5QKZtfaCLkj759plcykOir9hdj8ZorRWgqgYqk/wNNAeOGBJDjKoj3
 7b/bkrCnH6oxnKT/QSaBUT6BJXImE9hGNOau77blIPM9fxOaHMCJ0GuHZnqW49IWE0mQ71yKrCy
 ZrDu6nIdS5jAC8VfrjVITCHCSfEEyP/WqRhLHcuHxYB7fe38z2QO5F6SrQDdKFnaVF6dsqJT+p1
 dyzeuwZdM6VqZ/P51IatZdyGP0JN6sewENPGo183lagBs2GXx8jABFeqOhNNR2D1yZ3rcVFr+Fz
 MwcM/b+spsB2IfyhmyPbw7+Gl4ZlYjTDfFSjvPmMjY/kEGn/gachZbBqBispFHTRbXURxIsgp/5
 9ni3B1lhmd9BRj6kveErpT56wODedqJJUisCkXLkxgNW2mnvY874EjPFw8cpBu0DpxDfIk6qVNI
 X0I6tyyHO5wVPCCxb7M2JMtE+8X67oOUYSUZVPzPWSSCBew4r4OYcefC66fzwlAhCLUvRVR3msX
 /s9ys6tIFBvw4HhZsRBbmNvCy69iFvpYGCww6VynwmA6iOt0Frn1jXJ1sDJ+VHBJcDhkY2Zt/gg
 qaglYmirNyQHdPQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Starting with Glymur, the PCIe and DP PHYs qserdes register offsets differ
for the same version number. So in order to be able to differentiate
between them, add these ones with DP prefix.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 .../phy/qualcomm/phy-qcom-qmp-dp-qserdes-com-v8.h  | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-dp-qserdes-com-v8.h b/drivers/phy/qualcomm/phy-qcom-qmp-dp-qserdes-com-v8.h
new file mode 100644
index 0000000000000000000000000000000000000000..2bef1eecdc56a75e954ebdbcd168ab7306be1302
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-dp-qserdes-com-v8.h
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2025 Linaro Ltd.
+ */
+
+#ifndef QCOM_PHY_QMP_DP_QSERDES_COM_V8_H_
+#define QCOM_PHY_QMP_DP_QSERDES_COM_V8_H_
+
+/* Only for DP QMP V8 PHY - QSERDES COM registers */
+#define DP_QSERDES_V8_COM_HSCLK_SEL_1			0x03c
+#define DP_QSERDES_V8_COM_BIN_VCOCAL_CMP_CODE1_MODE0	0x058
+#define DP_QSERDES_V8_COM_BIN_VCOCAL_CMP_CODE2_MODE0	0x05c
+#define DP_QSERDES_V8_COM_SSC_STEP_SIZE1_MODE0		0x060
+#define DP_QSERDES_V8_COM_SSC_STEP_SIZE2_MODE0		0x064
+#define DP_QSERDES_V8_COM_CP_CTRL_MODE0			0x070
+#define DP_QSERDES_V8_COM_PLL_RCTRL_MODE0		0x074
+#define DP_QSERDES_V8_COM_PLL_CCTRL_MODE0		0x078
+#define DP_QSERDES_V8_COM_CORECLK_DIV_MODE0		0x07c
+#define DP_QSERDES_V8_COM_LOCK_CMP1_MODE0		0x080
+#define DP_QSERDES_V8_COM_LOCK_CMP2_MODE0		0x084
+#define DP_QSERDES_V8_COM_DEC_START_MODE0		0x088
+#define DP_QSERDES_V8_COM_DIV_FRAC_START1_MODE0		0x090
+#define DP_QSERDES_V8_COM_DIV_FRAC_START2_MODE0		0x094
+#define DP_QSERDES_V8_COM_DIV_FRAC_START3_MODE0		0x098
+#define DP_QSERDES_V8_COM_INTEGLOOP_GAIN0_MODE0		0x0a0
+#define DP_QSERDES_V8_COM_VCO_TUNE1_MODE0		0x0a8
+#define DP_QSERDES_V8_COM_INTEGLOOP_GAIN1_MODE0		0x0a4
+#define DP_QSERDES_V8_COM_VCO_TUNE2_MODE0		0x0ac
+#define DP_QSERDES_V8_COM_BG_TIMER			0x0bc
+#define DP_QSERDES_V8_COM_SSC_EN_CENTER			0x0c0
+#define DP_QSERDES_V8_COM_SSC_ADJ_PER1			0x0c4
+#define DP_QSERDES_V8_COM_SSC_PER1			0x0cc
+#define DP_QSERDES_V8_COM_SSC_PER2			0x0d0
+#define DP_QSERDES_V8_COM_BIAS_EN_CLKBUFLR_EN		0x0dc
+#define DP_QSERDES_V8_COM_CLK_ENABLE1			0x0e0
+#define DP_QSERDES_V8_COM_SYS_CLK_CTRL			0x0e4
+#define DP_QSERDES_V8_COM_SYSCLK_BUF_ENABLE		0x0e8
+#define DP_QSERDES_V8_COM_PLL_IVCO			0x0f4
+#define DP_QSERDES_V8_COM_SYSCLK_EN_SEL			0x110
+#define DP_QSERDES_V8_COM_RESETSM_CNTRL			0x118
+#define DP_QSERDES_V8_COM_LOCK_CMP_EN			0x120
+#define DP_QSERDES_V8_COM_VCO_TUNE_CTRL			0x13c
+#define DP_QSERDES_V8_COM_VCO_TUNE_MAP			0x140
+#define DP_QSERDES_V8_COM_CLK_SELECT			0x164
+#define DP_QSERDES_V8_COM_CORE_CLK_EN			0x170
+#define DP_QSERDES_V8_COM_CMN_CONFIG_1			0x174
+#define DP_QSERDES_V8_COM_SVS_MODE_CLK_SEL		0x180
+#define DP_QSERDES_V8_COM_CLK_FWD_CONFIG_1		0x2f4
+#define DP_QSERDES_V8_COM_CMN_STATUS			0x314
+#define DP_QSERDES_V8_COM_C_READY_STATUS		0x33c
+
+#endif

-- 
2.48.1


