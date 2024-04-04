Return-Path: <linux-arm-msm+bounces-16444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8F8899248
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 01:43:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DCF3B1F23FE1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Apr 2024 23:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3407F130E57;
	Thu,  4 Apr 2024 23:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YDCPsRK8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CFC13C672
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Apr 2024 23:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712274231; cv=none; b=i7RRr1mFmUX1d7dNnwAJFNkQvYuSFRhaU1NcNpUAB4LYQuT5Q6BX/pzqetUMupM3TzDy1KBhNODeJPFjqmLjvD9vtPF/QjlfgDaBGOAnGKSCIs/fI+uquheuSsBJRZgsQJ8bcca2iHl0fRvRVLpYjgGAO+V00Ku7xDSsSHmGoGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712274231; c=relaxed/simple;
	bh=JJPz/P2CcR2ZufWiDJCZzZH/1OFiSj5m3Mdo8cC++Zw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m8LYdILkIr3JX05PlNjayvyp/f221syOKKedEzF3kyH8rYk0DTYIVS8Zj40lhavrgx3RFgU6LdWaqA0nrUg+IqrSvNHhYw9pVILA9BWUi6yWgy36Qz8jTgPVn9HlTGeqKdRrAwc7fn138Vzof4EEis1xmkXF3k5XdiHfxvP6tWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YDCPsRK8; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-5e152c757a5so1143013a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Apr 2024 16:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712274229; x=1712879029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RMI5yWOLAVIgIkbCc96VWxktkn/9P3095VY77NHNd1o=;
        b=YDCPsRK8OhajbKvIhfTJub2L64/s9EM6WJdQPsXmJ7Sc/0oPsmAJrtX5Z1dTLr1yva
         sKQIJy8w9rdGGLt9mVG9XiYKzf44O6N6O6gE/qZOJK7u/cjX/zFkZZ01dfxSBWWsTlp1
         nym5Ay1AzbiYtrpInNNcN7GX/KeStG3Hs9TM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712274229; x=1712879029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RMI5yWOLAVIgIkbCc96VWxktkn/9P3095VY77NHNd1o=;
        b=YfCvFIBX+0+ev527Ay0GgtCbWTHXeNllZy4+2YCSoVNYXoVJs32a1Rnl3ivBDIzoQC
         91bNFzBZWAWYln1QvmP8F2DC1OOa0P4jBHEWVF+YFTOHZKzMj97Ny3UKOw91OSNYUtli
         j8tCBF0liaJrCtJ0zdSGAClAl213JXzbhU4deJUoOmkoNHv05toUC7mrUo04HIdsCpje
         I6O1kA8YJArt89rfSgU4qu8rSfh0DsIGReZZzw3blPHNdbHxztaPzc8Vu0W1I2AlgWBu
         Px/uBHk9GbJedxq0F44T8LOHrxqqW6EPEty8rKqtPy55wyxwof49Pd77lUWpbknxL0nh
         hz1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVIkcfkIK5iHVNRCErrVOcIRT6jcnyqSEvZogqmBLfSX/fcOUisKjgzS91hJ8/BVxoACigMRBDLmzDHaL1MVDGCmtnxGe/8XMGmbZr6DQ==
X-Gm-Message-State: AOJu0YwBh6Lag4JInqdBczlEKrNoKTu3nMieMQ7ttZLDaRo93CTa+BxQ
	bbeGN8uvNI/2c/8Z8FQFhpax7v+kW0VpWdoyZpjuotnLW28BbJK/NPLt/ehTzw==
X-Google-Smtp-Source: AGHT+IEXZdsBDxClfnWn4V8ckwcGELQZihfoKdxkgEQZf2dDcxavcBDgDIZ9TfrbOn0Q57NFbPr69Q==
X-Received: by 2002:a05:6a20:1057:b0:1a3:6bb1:92fb with SMTP id gt23-20020a056a20105700b001a36bb192fbmr45166pzc.19.1712274228928;
        Thu, 04 Apr 2024 16:43:48 -0700 (PDT)
Received: from localhost (4.198.125.34.bc.googleusercontent.com. [34.125.198.4])
        by smtp.gmail.com with UTF8SMTPSA id ga16-20020a17090b039000b002a2b06cbe46sm269450pjb.22.2024.04.04.16.43.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Apr 2024 16:43:47 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-phy@lists.infradead.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	freedreno@lists.freedesktop.org,
	Douglas Anderson <dianders@chromium.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH] phy: qcom: qmp-combo: Fix VCO div offset on v3
Date: Thu,  4 Apr 2024 16:43:44 -0700
Message-ID: <20240404234345.1446300-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit ec17373aebd0 ("phy: qcom: qmp-combo: extract common function to
setup clocks") changed the offset that is used to write to
DP_PHY_VCO_DIV from QSERDES_V3_DP_PHY_VCO_DIV to
QSERDES_V4_DP_PHY_VCO_DIV. Unfortunately, this offset is different
between v3 and v4 phys:

 #define QSERDES_V3_DP_PHY_VCO_DIV                 0x064
 #define QSERDES_V4_DP_PHY_VCO_DIV                 0x070

meaning that we write the wrong register on v3 phys now. Add another
generic register to 'regs' and use it here instead of a version specific
define to fix this.

This was discovered after Abhinav looked over register dumps with me
from sc7180 Trogdor devices that started failing to light up the
external display with v6.6 based kernels. It turns out that some
monitors are very specific about their link clk frequency and if the
default power on reset value is still there the monitor will show a
blank screen or a garbled display. Other monitors are perfectly happy to
get a bad clock signal.

Cc: Douglas Anderson <dianders@chromium.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Fixes: ec17373aebd0 ("phy: qcom: qmp-combo: extract common function to setup clocks")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 7d585a4bbbba..3b19d8ebf467 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -77,6 +77,7 @@ enum qphy_reg_layout {
 	QPHY_COM_BIAS_EN_CLKBUFLR_EN,
 
 	QPHY_DP_PHY_STATUS,
+	QPHY_DP_PHY_VCO_DIV,
 
 	QPHY_TX_TX_POL_INV,
 	QPHY_TX_TX_DRV_LVL,
@@ -102,6 +103,7 @@ static const unsigned int qmp_v3_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_COM_BIAS_EN_CLKBUFLR_EN]	= QSERDES_V3_COM_BIAS_EN_CLKBUFLR_EN,
 
 	[QPHY_DP_PHY_STATUS]		= QSERDES_V3_DP_PHY_STATUS,
+	[QPHY_DP_PHY_VCO_DIV]		= QSERDES_V3_DP_PHY_VCO_DIV,
 
 	[QPHY_TX_TX_POL_INV]		= QSERDES_V3_TX_TX_POL_INV,
 	[QPHY_TX_TX_DRV_LVL]		= QSERDES_V3_TX_TX_DRV_LVL,
@@ -126,6 +128,7 @@ static const unsigned int qmp_v45_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_COM_BIAS_EN_CLKBUFLR_EN]	= QSERDES_V4_COM_BIAS_EN_CLKBUFLR_EN,
 
 	[QPHY_DP_PHY_STATUS]		= QSERDES_V4_DP_PHY_STATUS,
+	[QPHY_DP_PHY_VCO_DIV]		= QSERDES_V4_DP_PHY_VCO_DIV,
 
 	[QPHY_TX_TX_POL_INV]		= QSERDES_V4_TX_TX_POL_INV,
 	[QPHY_TX_TX_DRV_LVL]		= QSERDES_V4_TX_TX_DRV_LVL,
@@ -2162,6 +2165,7 @@ static int qmp_combo_configure_dp_clocks(struct qmp_combo *qmp)
 	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
 	u32 phy_vco_div;
 	unsigned long pixel_freq;
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
 
 	switch (dp_opts->link_rate) {
 	case 1620:
@@ -2184,7 +2188,7 @@ static int qmp_combo_configure_dp_clocks(struct qmp_combo *qmp)
 		/* Other link rates aren't supported */
 		return -EINVAL;
 	}
-	writel(phy_vco_div, qmp->dp_dp_phy + QSERDES_V4_DP_PHY_VCO_DIV);
+	writel(phy_vco_div, qmp->dp_dp_phy + cfg->regs[QPHY_DP_PHY_VCO_DIV]);
 
 	clk_set_rate(qmp->dp_link_hw.clk, dp_opts->link_rate * 100000);
 	clk_set_rate(qmp->dp_pixel_hw.clk, pixel_freq);

base-commit: 4cece764965020c22cff7665b18a012006359095
-- 
https://chromeos.dev


