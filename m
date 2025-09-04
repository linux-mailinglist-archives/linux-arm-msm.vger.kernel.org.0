Return-Path: <linux-arm-msm+bounces-71976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEFEB43339
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 09:02:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 145F5685CC0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 07:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C506D288C24;
	Thu,  4 Sep 2025 06:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gUAcJJ3k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95D12874EB
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 06:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756968987; cv=none; b=PeqtH3swtrUYhfwTPFKTfXpUcak/FDKWVZIgFMcWymmhOGwtOYpN+fIKz2UwV0hjKw/UAqVOpDecFg9X4nBmBTZ5FJJHXtird1FuweyaPLeUnDHNK5ilb0k0U8UJs5TsY0IMStIVHb0rZHP71d1BvbD6I3YG0E0n+CdSf4tyOUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756968987; c=relaxed/simple;
	bh=jfzN/ldSxbD//tqugQGgHnEZ1hcjELAxuOulbu9UKOg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R1g+NdEUr8nloZWoemk/KPyCYXPvQsqe4l6VIgRexSCMPUGs/dni0SDIS6E2ytPJmk0n7i/oIBc1NmhK9EzN0DFiVbdQJmA7nVuUzs78TIRrsRX6uQDG9tiCspYHCTMvDhnb8tcdKI8qZ5OQ0jT3g1hLy/BFTgnMPGvv5qHrJ7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gUAcJJ3k; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45b7d485173so4776245e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 23:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756968984; x=1757573784; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/G87kyp/pfaxxUGK2NUKqpezATDG2ia4UyLkERw3KmM=;
        b=gUAcJJ3kiEmYaduxK6nyhqW/ve5Ohxmug11TpqsRaXn1OFjtQDT0ZumEfRYYWVaqdq
         vv3BQ3tldiLNekXChC4vzwKkRS9Ij7SVtjvC/8L7TMS2rpuF46LafBq1MODTvmfGqqnV
         1+7rg2lf29BuDBqfkoATK9RJQBPFFmcXWCPwrmKxmbhKaYbeJCH8WQhCL2Jo8n7rArPw
         RLu0vCQUZstkCYzJ1YGloeR5WxsUkbNATAC5B31Gu/NfjL1sIkE1z/y+U5fB7qvoCs6C
         tHyRiwlZ2luKEbA4adaqK4z66onXwh9t4grw+67GdPIQEDqz7veWyFEZv9azJk24YOpC
         Jd2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756968984; x=1757573784;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/G87kyp/pfaxxUGK2NUKqpezATDG2ia4UyLkERw3KmM=;
        b=rYFHNsJE37wveMChFjZ7pKHqaPivswoktfaDRvHQs3tb/tIcktal2OxNkakGXY7A10
         kxnz3PU68y42Wn9SAsRqqKb0r0C/gJvnn04Kb8Shz+/N7BtseL/j+mQKjzySRHpFqTf4
         qUf/TE5PtYf5EgFTOjXYrYHSocZTv/BJ6EcNi5sCR2XAxIelV/Gjo8shrESR8j+h5sLN
         k6Em0XpojLO7Stze2HryFIRreQiPVQQv75Vfq3g8cTSbdq40wCQP5OVGh/Zji9jdyIp1
         Z+XafSuXfAhKz4bwNjsUGF0A97FEiXIpmsmX/RG8MZO/AvOJtqDCcz0U6ifjBT5he440
         rYdQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2SiVrSwsnbgveDefpHamqPqBMql8nvPCjMXKbI4nr0EkN3PXww31XajKYIDhUKk9Yi4ZivzmUMsMqb8aG@vger.kernel.org
X-Gm-Message-State: AOJu0YwHDk/k2+myELWICTRNHr7fp9wil1ym4t2eK8O1M/zSVTwazxWP
	ZAuSApgxvf/VA6429T6W/tQ7LnZNmtgQbn4kGYmwx8kbAT9pqXjy0htMFdbVzlYQ7z4=
X-Gm-Gg: ASbGncsqyVrlfZL+uSf/gyoVysf1bkb6+TtWuuMpgdjX8FHVmQ+vy8eyq/iPK4PQL7w
	+tmSEeMYzBHNQweHwfUYjIEwXj8XKrlR6d8rQVtcfNUEJnVDsFRWaHvUsr1zKOQuKzs8Q0RrDDX
	j8dI+Gd/DQDNpxXiEBDzG23lfFRnzSYrI5B2NKJ3/Ql7Lghdfk9UFKHOZVlS392nQ65y7l7MdPV
	mhQEzsWagbj5QcozQU0MJs/5i2ymE/ritHjqPeQRKN948vr/Gbg9S0j/B4ZNUNhIY9apZyD+G+I
	4NQEnmj9Dt4CLR06ToD7BaTYLqKVMDYrhTiMZMYBl/4I0i6BSNoNikC5FHJwgfNLShsxyBd5rI/
	4wS+CaWg8R0WYu/oAqOb9hoc=
X-Google-Smtp-Source: AGHT+IGLpTHusCG88E6aPMx5XgydXW/TqsLoxaZrUvpMn95f0fLXzfbFIT7BrF9m0X4BdLAf7NE9/Q==
X-Received: by 2002:a05:600c:3546:b0:459:dc99:51bf with SMTP id 5b1f17b1804b1-45b8557b680mr134917665e9.25.1756968984254;
        Wed, 03 Sep 2025 23:56:24 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d701622b92sm15256075f8f.58.2025.09.03.23.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 23:56:23 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 04 Sep 2025 09:55:52 +0300
Subject: [PATCH 2/3] phy: qcom-qmp: qserdes-com: Add some more v8 register
 offsets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-phy-qcom-edp-add-glymur-support-v1-2-e83c6b9a145b@linaro.org>
References: <20250904-phy-qcom-edp-add-glymur-support-v1-0-e83c6b9a145b@linaro.org>
In-Reply-To: <20250904-phy-qcom-edp-add-glymur-support-v1-0-e83c6b9a145b@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2613; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=jfzN/ldSxbD//tqugQGgHnEZ1hcjELAxuOulbu9UKOg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBouTgOvDY/6mTpV6oXDGupvZt038nd7Su5EthEU
 afAzIQ6deGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaLk4DgAKCRAbX0TJAJUV
 VqBkD/wJINCKAk++NiefvogMxEuq8c5BErQWHuAff0xOb2ncynGXwTa7lJlzFleG8HALLvmvQrY
 4EpsYSanHdOCAwqXFr2/tMw9gieUmFs6MfwqmLq0wKfb4uuGZN4175Nw1E0LatK4QjQ8UpSWU3P
 fO+z9H1z0bxMY+hahGQyF7Y4GQAEloAuopJ6Vx0p7UoKfY84lO8YnDmnZGkQUjlbWthg/PvT4EX
 bhrl/9opLDWgzxvIbvXFT/SYBXrMXVmYSxK9z2ZHNP58/8dZW7uKgyBfO49EXw06XHfHHwvsYI/
 BPSOD/qz+lpY8LH0YuCUNQylLFE5iNO/Kky7Uq8k0biBZaQU3eFUelZ2oKUDtguiqJPuXsxn/C1
 /bjA1dYaCldR65ukku9ynO4WpCIymYg6iyFPgNmqIcfbbgBx1pyo4hob9hRBUspJ6OtKCeNjIcW
 Bxi/qe3ExDH+lo7a43ygLaYWWr/jg39TtpmJk2fjsaKQTeiT6XX8tGkCLKqz3P+KrHNxkyL2YEL
 2sEZUJyAHe214CggoG7ZF2+MumhU16kVYDeHI5z86Jzzol7yv9Tpashb0s2KlgquCHE1cfQjsIq
 3nBGQ51BNSZlQ6WWjcS0ov54OcwMtKfcfV2q0XbbHY6jwZQcvKxWhVVMlSLO92FEY15B6XJpjRb
 wcU2c9MXLVpVJiw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Add the missing v8 register offsets needed by the eDP/DP PHY driver.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v8.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v8.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v8.h
index d3b2292257bc521cb66562a5b6bfae8dc8c92cc1..7143925fbeecd9586d27ffef98ed3e8a232f39e7 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v8.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v8.h
@@ -33,6 +33,7 @@
 #define QSERDES_V8_COM_CP_CTRL_MODE0			0x070
 #define QSERDES_V8_COM_PLL_RCTRL_MODE0			0x074
 #define QSERDES_V8_COM_PLL_CCTRL_MODE0			0x078
+#define QSERDES_V8_COM_CORECLK_DIV_MODE0		0x07c
 #define QSERDES_V8_COM_LOCK_CMP1_MODE0			0x080
 #define QSERDES_V8_COM_LOCK_CMP2_MODE0			0x084
 #define QSERDES_V8_COM_DEC_START_MODE0			0x088
@@ -40,25 +41,36 @@
 #define QSERDES_V8_COM_DIV_FRAC_START1_MODE0		0x090
 #define QSERDES_V8_COM_DIV_FRAC_START2_MODE0		0x094
 #define QSERDES_V8_COM_DIV_FRAC_START3_MODE0		0x098
+#define QSERDES_V8_COM_INTEGLOOP_GAIN0_MODE0		0x0a0
 #define QSERDES_V8_COM_VCO_TUNE1_MODE0			0x0a8
+#define QSERDES_V8_COM_INTEGLOOP_GAIN1_MODE0		0x0a4
 #define QSERDES_V8_COM_VCO_TUNE2_MODE0			0x0ac
 #define QSERDES_V8_COM_BG_TIMER				0x0bc
 #define QSERDES_V8_COM_SSC_EN_CENTER			0x0c0
+#define QSERDES_V8_COM_SSC_ADJ_PER1			0x0c4
 #define QSERDES_V8_COM_SSC_PER1				0x0cc
 #define QSERDES_V8_COM_SSC_PER2				0x0d0
 #define QSERDES_V8_COM_BIAS_EN_CLKBUFLR_EN		0x0dc
+#define QSERDES_V8_COM_CLK_ENABLE1			0x0e0
+#define QSERDES_V8_COM_SYS_CLK_CTRL			0x0e4
 #define QSERDES_V8_COM_SYSCLK_BUF_ENABLE		0x0e8
+#define QSERDES_V8_COM_PLL_IVCO				0x0f4
 #define QSERDES_V8_COM_SYSCLK_EN_SEL			0x110
 #define QSERDES_V8_COM_RESETSM_CNTRL			0x118
+#define QSERDES_V8_COM_LOCK_CMP_EN			0x120
 #define QSERDES_V8_COM_LOCK_CMP_CFG			0x124
+#define QSERDES_V8_COM_VCO_TUNE_CTRL			0x13c
 #define QSERDES_V8_COM_VCO_TUNE_MAP			0x140
+#define QSERDES_V8_COM_CLK_SELECT			0x164
 #define QSERDES_V8_COM_CORE_CLK_EN			0x170
 #define QSERDES_V8_COM_CMN_CONFIG_1			0x174
+#define QSERDES_V8_COM_SVS_MODE_CLK_SEL			0x180
 #define QSERDES_V8_COM_AUTO_GAIN_ADJ_CTRL_1		0x1a4
 #define QSERDES_V8_COM_AUTO_GAIN_ADJ_CTRL_2		0x1a8
 #define QSERDES_V8_COM_AUTO_GAIN_ADJ_CTRL_3		0x1ac
 #define QSERDES_V8_COM_ADDITIONAL_MISC			0x1b4
 #define QSERDES_V8_COM_CMN_STATUS			0x2c8
 #define QSERDES_V8_COM_C_READY_STATUS			0x2f0
+#define QSERDES_V8_COM_CLK_FWD_CONFIG_1			0x2f4
 
 #endif

-- 
2.45.2


