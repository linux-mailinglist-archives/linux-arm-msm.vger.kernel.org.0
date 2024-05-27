Return-Path: <linux-arm-msm+bounces-20536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5238CF9E7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 09:21:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E8401C20D62
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 07:21:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 579423B298;
	Mon, 27 May 2024 07:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zLLKz1qE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55313225D9
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 07:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716794455; cv=none; b=YaHreFgiBREEXqdiC/pJBcpBmzamm1zh8eLc07u1vgWVhdPBQpaeaFhfIonTyXAQufh1MYdJdHvPRxd7nwZuIoC5nbZ9Ttpymn8iaN/WkdwpDpQQ6kSuVssodjKJK1IJBztskjsm3KDPT9uzoZywUPEy/2x3I0iFtA0g2sWeLDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716794455; c=relaxed/simple;
	bh=Lq6v/Q6ZPNow9TWS8ljn6sRKnqpcX+7h8LRLIEOCqgE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LFqMkWOf4nrrL3MkVxVT0LmHrtM9JNBgctHrdYb9l2JCFeQRNTI8bjhj1RkJXBXGOcV6DSGBIcfXt5aUIJegeYzgpdKG4pwUaok+FhDEIODzqkN5Y1i67OzziGKKA1zKwuWMQNMngkUNay/0hnzISPpSEDoSZ7oSegeiLnxzu34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zLLKz1qE; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a6269885572so470126666b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 00:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716794451; x=1717399251; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G9gefSg48+Tl+YDZ+FiM+2AaAewEBXbahACWXUZ2DDg=;
        b=zLLKz1qEj5z7DNNFkBHEInLomsmqp0K1Wsx9NOhjw2a2gEjpRe6dmQSqjzBrGi9exe
         1nRTTBvPEXS5XVVK7BnWKkr/JtAKpYVMDKx/YHd+R0tKtSCeiNCM2rddJdWpg6pnnPgL
         E1f3oE9NjhXjdY0vJvpq05RfqqKI2P/aXQFRS+wVf4MC4COtacET6awfXEdgAtSyd1Qe
         rpD+oxQAhxk0nFNdyXixpYT7p9peJwT7Jsg7ujS7YNNb9+kkEIOPztp5MJLTrvWEqece
         HVAb9q9J7bg0V3Tgqm9eB/zIENIBtbZMrsZhuSqZT9RA3IV8AKlThj3tILa2frmOVrTj
         FLUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716794451; x=1717399251;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G9gefSg48+Tl+YDZ+FiM+2AaAewEBXbahACWXUZ2DDg=;
        b=Go871M//ZnoQfsvbpYAB/idh8dtCf/WUYhGS17ECvYeC0wZdQHWoH5sOFLU8tT8h90
         fu3BPRK6dHebe90bhMx21a4uWXJhzUxGVCyOyuk1Xoyn9NB13OK2f5JSUl6CmxLl+FFI
         z+5KnFkbpbWtcE2LPu3CgZ9UAiKg9hyh/Ogsi/bxjqQYkNit6pG//rdgpUhWyox2I6pz
         cveNvFomNRhEz5fdnmInMldE6OuZdO212fW7NkskI/L7eBqv+JVKgzwWtePKInYlPCEe
         gxX2onDDwwjcpekgUZjjIwICZTEtQmOz+mR9aWETfu50U30UKm9l3+MVbHc7kQCK1hhY
         KDug==
X-Gm-Message-State: AOJu0YwhWLtElPmnwipG0H0wABZH2ibcXKuoPOgHc2VlOwOSYjIUb9Tf
	aJQM7rCCSAubtW3Dq7IA29XoMRIGNfKrJGqoMQn2sIqj06yZ+c5isEWAHMQFhXHof7EgQ3y/K5U
	k
X-Google-Smtp-Source: AGHT+IGwt0bwWuwed+nDf7S/9jXgoJKvH8U41QCbKL+7JxgRvCPxZjAin02s162A3K6VXXV5EjBiSg==
X-Received: by 2002:a17:906:4a91:b0:a59:cd1e:2012 with SMTP id a640c23a62f3a-a623e9d499cmr866566566b.23.1716794450566;
        Mon, 27 May 2024 00:20:50 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cc8e295sm457915666b.185.2024.05.27.00.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 00:20:50 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 27 May 2024 10:20:37 +0300
Subject: [PATCH 3/3] phy: qcom: qmp-combo: Switch from V6 to V6 N4 register
 offsets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-x1e80100-phy-qualcomm-combo-fix-dp-v1-3-be8a0b882117@linaro.org>
References: <20240527-x1e80100-phy-qualcomm-combo-fix-dp-v1-0-be8a0b882117@linaro.org>
In-Reply-To: <20240527-x1e80100-phy-qualcomm-combo-fix-dp-v1-0-be8a0b882117@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=14101; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=Lq6v/Q6ZPNow9TWS8ljn6sRKnqpcX+7h8LRLIEOCqgE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmVDRMST518d/skBdZsMIxHmhPnBKeSUA6jHLOR
 Df1Vo0PRVmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZlQ0TAAKCRAbX0TJAJUV
 VmHKEACQtgsEtGkpMXSzwCrLyuRKN/G4oqPlc23tM+gbSS7aI7k3zMzlaEziONkBRlTP3/abPsi
 HuCnYJMnlZiDMFTHvBo9LOZ0quhiiwYsC3VRYhUdZuC6jW42kp5TVqFxoYKJztmc7ylArt2dGJ7
 hJJCchoLs94dwClM76Sh0g/Efqw1oWYwLQpiTnkV3Ir3wmCmdAtlg52WNc19NeLoKiOarMEEuIB
 O24SAENufRnKZk4dlx3gm9i/PQ9YQEQ47GJGQrNkoY0aeCzRHwxtj44ngSG3E49Nkw4YL8oPgXB
 SOPDUZdvGNyqlvpPThQVqbuNAQ1N5Ytp5npPXUBZZIynLnPKEnPNLBobigayHYrOVBDx566bg6R
 0HPGpO2noaeUOWsNsDaDfd19kxc4aYJTJxLOhCi/M7nrmohh942EeSDinHPW2vD2mrgTkwTrNDj
 z+VTpl72TxkOrOTgvshf7u0ghAC8PA9fLX7NBYF2btHVAzW/Qs4WGwtc6JpvkkjRJu5cffFelFO
 +TkEu/GzPa/skECwe4BIsEfmL310a+4GZrv2CasXBKbrxuaVy4etG9dv/M2lVdqnEBeUkIHWY64
 1qs/T1qGFyeGDjW3FPrlX89iSC/7yCynn+fDM1VVSbtkYvhl28g2dCarDAHpHarBUT12XJqzPJd
 rokSfmtER46BDPg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Currently, none of the X1E80100 supported boards upstream have enabled
DP. As for USB, the reason it is not broken when it's obvious that the
offsets are wrong is because the only difference with respect to USB is
the difference in register name. The V6 uses QPHY_V6_PCS_CDR_RESET_TIME
while V6 N4 uses QPHY_V6_N4_PCS_RX_CONFIG. Now, in order for the DP to
work, the DP serdes tables need to be added as they have different
values for V6 N4 when compared to V6 ones, even though they use the same
V6 offsets. While at it, switch swing and pre-emphasis tables to V6 as
well.

Fixes: d7b3579f84f7 ("phy: qcom-qmp-combo: Add x1e80100 USB/DP combo phys")
Co-developed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 189 +++++++++++++++++++++++++-----
 drivers/phy/qualcomm/phy-qcom-qmp.h       |   2 +
 2 files changed, 162 insertions(+), 29 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 7f999e8a433d..7b00945f7191 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -187,6 +187,31 @@ static const unsigned int qmp_v6_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_TX_TRANSCEIVER_BIAS_EN]	= QSERDES_V6_TX_TRANSCEIVER_BIAS_EN,
 };
 
+static const unsigned int qmp_v6_n4_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
+	[QPHY_SW_RESET]			= QPHY_V6_N4_PCS_SW_RESET,
+	[QPHY_START_CTRL]		= QPHY_V6_N4_PCS_START_CONTROL,
+	[QPHY_PCS_STATUS]		= QPHY_V6_N4_PCS_PCS_STATUS1,
+	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V6_N4_PCS_POWER_DOWN_CONTROL,
+
+	/* In PCS_USB */
+	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= QPHY_V6_PCS_USB3_AUTONOMOUS_MODE_CTRL,
+	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = QPHY_V6_PCS_USB3_LFPS_RXTERM_IRQ_CLEAR,
+
+	[QPHY_COM_RESETSM_CNTRL]	= QSERDES_V6_COM_RESETSM_CNTRL,
+	[QPHY_COM_C_READY_STATUS]	= QSERDES_V6_COM_C_READY_STATUS,
+	[QPHY_COM_CMN_STATUS]		= QSERDES_V6_COM_CMN_STATUS,
+	[QPHY_COM_BIAS_EN_CLKBUFLR_EN]	= QSERDES_V6_COM_PLL_BIAS_EN_CLK_BUFLR_EN,
+
+	[QPHY_DP_PHY_STATUS]		= QSERDES_V6_DP_PHY_STATUS,
+	[QPHY_DP_PHY_VCO_DIV]		= QSERDES_V6_DP_PHY_VCO_DIV,
+
+	[QPHY_TX_TX_POL_INV]		= QSERDES_V6_N4_TX_TX_POL_INV,
+	[QPHY_TX_TX_DRV_LVL]		= QSERDES_V6_N4_TX_TX_DRV_LVL,
+	[QPHY_TX_TX_EMP_POST1_LVL]	= QSERDES_V6_N4_TX_TX_EMP_POST1_LVL,
+	[QPHY_TX_HIGHZ_DRVR_EN]		= QSERDES_V6_N4_TX_HIGHZ_DRVR_EN,
+	[QPHY_TX_TRANSCEIVER_BIAS_EN]	= QSERDES_V6_N4_TX_TRANSCEIVER_BIAS_EN,
+};
+
 static const struct qmp_phy_init_tbl qmp_v3_usb3_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V3_COM_PLL_IVCO, 0x07),
 	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SYSCLK_EN_SEL, 0x14),
@@ -997,6 +1022,31 @@ static const struct qmp_phy_init_tbl qmp_v6_dp_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CORE_CLK_EN, 0x0f),
 };
 
+static const struct qmp_phy_init_tbl qmp_v6_n4_dp_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SVS_MODE_CLK_SEL, 0x15),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SYSCLK_EN_SEL, 0x3b),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SYS_CLK_CTRL, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CLK_ENABLE1, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SYSCLK_BUF_ENABLE, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CLK_SELECT, 0x30),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_IVCO, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_CCTRL_MODE0, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_RCTRL_MODE0, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CP_CTRL_MODE0, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE0, 0x34),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START1_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START2_MODE0, 0xc0),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CMN_CONFIG_1, 0x12),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_INTEGLOOP_GAIN0_MODE0, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_INTEGLOOP_GAIN1_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE_MAP, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BG_TIMER, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_CORE_CLK_DIV_MODE0, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE_CTRL, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_BIAS_EN_CLK_BUFLR_EN, 0x17),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CORE_CLK_EN, 0x0f),
+};
+
 static const struct qmp_phy_init_tbl qmp_v6_dp_tx_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V6_TX_VMODE_CTRL1, 0x40),
 	QMP_PHY_INIT_CFG(QSERDES_V6_TX_PRE_STALL_LDO_BOOST_EN, 0x30),
@@ -1011,6 +1061,19 @@ static const struct qmp_phy_init_tbl qmp_v6_dp_tx_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V6_TX_TX_BAND, 0x4),
 };
 
+static const struct qmp_phy_init_tbl qmp_v6_n4_dp_tx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_TX_VMODE_CTRL1, 0x40),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_TX_PRE_STALL_LDO_BOOST_EN, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_TX_INTERFACE_SELECT, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_TX_CLKBUF_ENABLE, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_TX_RESET_TSYNC_EN, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_TX_TRAN_DRVR_EMP_EN, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_TX_PARRATE_REC_DETECT_IDLE_EN, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_TX_RES_CODE_LANE_OFFSET_TX, 0x11),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_TX_RES_CODE_LANE_OFFSET_RX, 0x11),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_TX_TX_BAND, 0x1),
+};
+
 static const struct qmp_phy_init_tbl qmp_v6_dp_serdes_tbl_rbr[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_HSCLK_SEL_1, 0x05),
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE0, 0x34),
@@ -1059,6 +1122,74 @@ static const struct qmp_phy_init_tbl qmp_v6_dp_serdes_tbl_hbr3[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x0c),
 };
 
+static const struct qmp_phy_init_tbl qmp_v6_n4_dp_serdes_tbl_rbr[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_HSCLK_SEL_1, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE0, 0x34),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP_EN, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START3_MODE0, 0x0b),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP1_MODE0, 0x37),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP2_MODE0, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0x71),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_EN_CENTER, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_ADJ_PER1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_PER1, 0x6b),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_PER2, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE1_MODE0, 0x92),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE2_MODE0, 0x01),
+};
+
+static const struct qmp_phy_init_tbl qmp_v6_n4_dp_serdes_tbl_hbr[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_HSCLK_SEL_1, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE0, 0x34),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP_EN, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START3_MODE0, 0x0b),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP1_MODE0, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP2_MODE0, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0x71),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_EN_CENTER, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_ADJ_PER1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_PER1, 0x6b),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_PER2, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE1_MODE0, 0x92),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE2_MODE0, 0x01),
+};
+
+static const struct qmp_phy_init_tbl qmp_v6_n4_dp_serdes_tbl_hbr2[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_HSCLK_SEL_1, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE0, 0x46),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP_EN, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START3_MODE0, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP1_MODE0, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP2_MODE0, 0x0e),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0x97),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x10),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_EN_CENTER, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_ADJ_PER1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_PER1, 0x6b),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_PER2, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE1_MODE0, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE2_MODE0, 0x02),
+};
+
+static const struct qmp_phy_init_tbl qmp_v6_n4_dp_serdes_tbl_hbr3[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_HSCLK_SEL_1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE0, 0x34),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP_EN, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START3_MODE0, 0x0b),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP1_MODE0, 0x17),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP2_MODE0, 0x15),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0x71),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_EN_CENTER, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_ADJ_PER1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_PER1, 0x6b),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_PER2, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE1_MODE0, 0x92),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE2_MODE0, 0x01),
+};
+
 static const struct qmp_phy_init_tbl sc8280xp_usb43dp_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V5_COM_SSC_EN_CENTER, 0x01),
 	QMP_PHY_INIT_CFG(QSERDES_V5_COM_SSC_PER1, 0x31),
@@ -1273,20 +1404,20 @@ static const struct qmp_phy_init_tbl x1e80100_usb43dp_rx_tbl[] = {
 };
 
 static const struct qmp_phy_init_tbl x1e80100_usb43dp_pcs_tbl[] = {
-	QMP_PHY_INIT_CFG(QPHY_V6_PCS_RCVR_DTCT_DLY_P1U2_L, 0xe7),
-	QMP_PHY_INIT_CFG(QPHY_V6_PCS_RCVR_DTCT_DLY_P1U2_H, 0x03),
-	QMP_PHY_INIT_CFG(QPHY_V6_PCS_LOCK_DETECT_CONFIG1, 0xc4),
-	QMP_PHY_INIT_CFG(QPHY_V6_PCS_LOCK_DETECT_CONFIG2, 0x89),
-	QMP_PHY_INIT_CFG(QPHY_V6_PCS_LOCK_DETECT_CONFIG3, 0x20),
-	QMP_PHY_INIT_CFG(QPHY_V6_PCS_LOCK_DETECT_CONFIG6, 0x13),
-	QMP_PHY_INIT_CFG(QPHY_V6_PCS_REFGEN_REQ_CONFIG1, 0x21),
-	QMP_PHY_INIT_CFG(QPHY_V6_PCS_RX_SIGDET_LVL, 0x55),
-	QMP_PHY_INIT_CFG(QPHY_V6_PCS_CDR_RESET_TIME, 0x0a),
-	QMP_PHY_INIT_CFG(QPHY_V6_PCS_ALIGN_DETECT_CONFIG1, 0xd4),
-	QMP_PHY_INIT_CFG(QPHY_V6_PCS_ALIGN_DETECT_CONFIG2, 0x30),
-	QMP_PHY_INIT_CFG(QPHY_V6_PCS_PCS_TX_RX_CONFIG, 0x0c),
-	QMP_PHY_INIT_CFG(QPHY_V6_PCS_EQ_CONFIG1, 0x4b),
-	QMP_PHY_INIT_CFG(QPHY_V6_PCS_EQ_CONFIG5, 0x10),
+	QMP_PHY_INIT_CFG(QPHY_V6_N4_PCS_RCVR_DTCT_DLY_P1U2_L, 0xe7),
+	QMP_PHY_INIT_CFG(QPHY_V6_N4_PCS_RCVR_DTCT_DLY_P1U2_H, 0x03),
+	QMP_PHY_INIT_CFG(QPHY_V6_N4_PCS_LOCK_DETECT_CONFIG1, 0xc4),
+	QMP_PHY_INIT_CFG(QPHY_V6_N4_PCS_LOCK_DETECT_CONFIG2, 0x89),
+	QMP_PHY_INIT_CFG(QPHY_V6_N4_PCS_LOCK_DETECT_CONFIG3, 0x20),
+	QMP_PHY_INIT_CFG(QPHY_V6_N4_PCS_LOCK_DETECT_CONFIG6, 0x13),
+	QMP_PHY_INIT_CFG(QPHY_V6_N4_PCS_REFGEN_REQ_CONFIG1, 0x21),
+	QMP_PHY_INIT_CFG(QPHY_V6_N4_PCS_RX_SIGDET_LVL, 0x55),
+	QMP_PHY_INIT_CFG(QPHY_V6_N4_PCS_RX_CONFIG, 0x0a),
+	QMP_PHY_INIT_CFG(QPHY_V6_N4_PCS_ALIGN_DETECT_CONFIG1, 0xd4),
+	QMP_PHY_INIT_CFG(QPHY_V6_N4_PCS_ALIGN_DETECT_CONFIG2, 0x30),
+	QMP_PHY_INIT_CFG(QPHY_V6_N4_PCS_PCS_TX_RX_CONFIG, 0x0c),
+	QMP_PHY_INIT_CFG(QPHY_V6_N4_PCS_EQ_CONFIG1, 0x4b),
+	QMP_PHY_INIT_CFG(QPHY_V6_N4_PCS_EQ_CONFIG5, 0x10),
 };
 
 static const struct qmp_phy_init_tbl x1e80100_usb43dp_pcs_usb_tbl[] = {
@@ -1794,22 +1925,22 @@ static const struct qmp_phy_cfg x1e80100_usb3dpphy_cfg = {
 	.pcs_usb_tbl		= x1e80100_usb43dp_pcs_usb_tbl,
 	.pcs_usb_tbl_num	= ARRAY_SIZE(x1e80100_usb43dp_pcs_usb_tbl),
 
-	.dp_serdes_tbl		= qmp_v6_dp_serdes_tbl,
-	.dp_serdes_tbl_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl),
-	.dp_tx_tbl		= qmp_v6_dp_tx_tbl,
-	.dp_tx_tbl_num		= ARRAY_SIZE(qmp_v6_dp_tx_tbl),
+	.dp_serdes_tbl		= qmp_v6_n4_dp_serdes_tbl,
+	.dp_serdes_tbl_num	= ARRAY_SIZE(qmp_v6_n4_dp_serdes_tbl),
+	.dp_tx_tbl		= qmp_v6_n4_dp_tx_tbl,
+	.dp_tx_tbl_num		= ARRAY_SIZE(qmp_v6_n4_dp_tx_tbl),
 
-	.serdes_tbl_rbr		= qmp_v6_dp_serdes_tbl_rbr,
-	.serdes_tbl_rbr_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl_rbr),
-	.serdes_tbl_hbr		= qmp_v6_dp_serdes_tbl_hbr,
-	.serdes_tbl_hbr_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl_hbr),
-	.serdes_tbl_hbr2	= qmp_v6_dp_serdes_tbl_hbr2,
-	.serdes_tbl_hbr2_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl_hbr2),
-	.serdes_tbl_hbr3	= qmp_v6_dp_serdes_tbl_hbr3,
-	.serdes_tbl_hbr3_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl_hbr3),
+	.serdes_tbl_rbr		= qmp_v6_n4_dp_serdes_tbl_rbr,
+	.serdes_tbl_rbr_num	= ARRAY_SIZE(qmp_v6_n4_dp_serdes_tbl_rbr),
+	.serdes_tbl_hbr		= qmp_v6_n4_dp_serdes_tbl_hbr,
+	.serdes_tbl_hbr_num	= ARRAY_SIZE(qmp_v6_n4_dp_serdes_tbl_hbr),
+	.serdes_tbl_hbr2	= qmp_v6_n4_dp_serdes_tbl_hbr2,
+	.serdes_tbl_hbr2_num	= ARRAY_SIZE(qmp_v6_n4_dp_serdes_tbl_hbr2),
+	.serdes_tbl_hbr3	= qmp_v6_n4_dp_serdes_tbl_hbr3,
+	.serdes_tbl_hbr3_num	= ARRAY_SIZE(qmp_v6_n4_dp_serdes_tbl_hbr3),
 
-	.swing_hbr_rbr		= &qmp_dp_v5_voltage_swing_hbr_rbr,
-	.pre_emphasis_hbr_rbr	= &qmp_dp_v5_pre_emphasis_hbr_rbr,
+	.swing_hbr_rbr		= &qmp_dp_v6_voltage_swing_hbr_rbr,
+	.pre_emphasis_hbr_rbr	= &qmp_dp_v6_pre_emphasis_hbr_rbr,
 	.swing_hbr3_hbr2	= &qmp_dp_v5_voltage_swing_hbr3_hbr2,
 	.pre_emphasis_hbr3_hbr2 = &qmp_dp_v5_pre_emphasis_hbr3_hbr2,
 
@@ -1822,7 +1953,7 @@ static const struct qmp_phy_cfg x1e80100_usb3dpphy_cfg = {
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= qmp_v45_usb3phy_regs_layout,
+	.regs			= qmp_v6_n4_usb3phy_regs_layout,
 };
 
 static const struct qmp_phy_cfg sm6350_usb3dpphy_cfg = {
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index d10b8f653c4b..d0f41e4aaa85 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -46,6 +46,8 @@
 
 #include "phy-qcom-qmp-pcs-v6.h"
 
+#include "phy-qcom-qmp-pcs-v6-n4.h"
+
 #include "phy-qcom-qmp-pcs-v6_20.h"
 
 #include "phy-qcom-qmp-pcs-v7.h"

-- 
2.34.1


