Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 610C83B0EDB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 22:32:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230206AbhFVUfL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Jun 2021 16:35:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbhFVUfK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Jun 2021 16:35:10 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF2BBC061766;
        Tue, 22 Jun 2021 13:32:53 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id h17so464471edw.11;
        Tue, 22 Jun 2021 13:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bRmU0C3A1PBdjl5vqeNkyE5P00d04OKPIvoyRXjo+cI=;
        b=eh78Bnm+j6S+6X8B4s3AYZQLwNjytisFyOUjyuDFx/wSupiyaqCr2ozjjOv6M3xEqX
         LU8IHRiV8IikDPeGWn/cBz0LRw5XUW1oZZJikY2RaYpnqDuq+3itzyiBjkUKKA0UOP9l
         cFi8EcRZyKKbhool2g1Amf2jS3UevUz5Q4OfwvgdsBYgcZHT2RHKBzUXmWH3+XAPgYXa
         jfNLyJSbdoK0ztXXFJf8QNHc7ZYjqVosv/vk4a1Si7e6iGL+Kzy/pS36SOzBK2kpIAR3
         2NH4RdTLdZkWdxqJi68zLT1icK5SJ+nuniJ72MUADL+Yvq3IryMgUigBgelEnS+5O6iX
         5OOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bRmU0C3A1PBdjl5vqeNkyE5P00d04OKPIvoyRXjo+cI=;
        b=I/GoTaPyD/BuTjdQYbatJKdNIBXTV4UL1Rw0NC0/qSkJ5EnFeN3mLCSYuRfYlBLpSg
         SUXCJXGhAd9Md+dXEL21LhuWgjKCNbzf8yQJ/VRa+L1MElBTcslfhYjx7Jw14VF+5P/0
         5olodnEewA35rOKm5Aaul55zl6AS6FqInq4tbneH2PFKGEPUPSg5QsXz+HPIb7LPExXw
         9OMyfEUNCKXVs7wY9O60sI33kuyX236lnh5OBdOsum7qvzUMrxNsLIzpS/XaWcjU/1ez
         ogPWOnrCid8mKpdqee8umRmFDF8b3362PPBJtXtirECi3ib4OXRx7znOfTgB7CperkkU
         p+9Q==
X-Gm-Message-State: AOAM530xILXF8KCiEvGBkoNZACWCjS4gXFFCMx+w0EgvXdj/kw4v2aFV
        8ych88WeF+hHUIFAsCek/iM=
X-Google-Smtp-Source: ABdhPJwbz3QUmSTzQ0fczfEhsl+CmyOYAFuQUrl3h0/d+tDgTfmd4HKyyk8/MVZ3hoPB7fbCSsY/BA==
X-Received: by 2002:a05:6402:138c:: with SMTP id b12mr7698964edv.268.1624393972375;
        Tue, 22 Jun 2021 13:32:52 -0700 (PDT)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id fl21sm6514883ejc.79.2021.06.22.13.32.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jun 2021 13:32:51 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Manu Gautam <mgautam@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH v1 3/3] phy: qcom-qusb2: Add configuration for SM4250 and SM6115
Date:   Tue, 22 Jun 2021 23:32:40 +0300
Message-Id: <20210622203240.559979-4-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210622203240.559979-1-iskren.chernev@gmail.com>
References: <20210622203240.559979-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The SM4250 and SM6115 uses the same register layout as MSM8996, but the
tune sequence is a bit different.

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---
 drivers/phy/qualcomm/phy-qcom-qusb2.c | 34 +++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index 8f1bf7e2186b..3c1d3b71c825 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -219,6 +219,22 @@ static const struct qusb2_phy_init_tbl msm8998_init_tbl[] = {
 	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_DIGITAL_TIMERS_TWO, 0x19),
 };
 
+static const struct qusb2_phy_init_tbl sm6115_init_tbl[] = {
+	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE1, 0xf8),
+	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE2, 0x53),
+	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE3, 0x81),
+	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE4, 0x17),
+
+	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_TUNE, 0x30),
+	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_USER_CTL1, 0x79),
+	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_USER_CTL2, 0x21),
+
+	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TEST2, 0x14),
+
+	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_AUTOPGM_CTL1, 0x9f),
+	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_PWR_CTRL, 0x00),
+};
+
 static const unsigned int qusb2_v2_regs_layout[] = {
 	[QUSB2PHY_PLL_CORE_INPUT_OVERRIDE] = 0xa8,
 	[QUSB2PHY_PLL_STATUS]		= 0x1a0,
@@ -342,6 +358,18 @@ static const struct qusb2_phy_cfg sdm660_phy_cfg = {
 	.autoresume_en	 = BIT(3),
 };
 
+static const struct qusb2_phy_cfg sm6115_phy_cfg = {
+	.tbl		= sm6115_init_tbl,
+	.tbl_num	= ARRAY_SIZE(sm6115_init_tbl),
+	.regs		= msm8996_regs_layout,
+
+	.has_pll_test	= true,
+	.se_clk_scheme_default = true,
+	.disable_ctrl	= (CLAMP_N_EN | FREEZIO_N | POWER_DOWN),
+	.mask_core_ready = PLL_LOCKED,
+	.autoresume_en	 = BIT(3),
+};
+
 static const char * const qusb2_phy_vreg_names[] = {
 	"vdda-pll", "vdda-phy-dpdm",
 };
@@ -888,6 +916,12 @@ static const struct of_device_id qusb2_phy_of_match_table[] = {
 	}, {
 		.compatible	= "qcom,sdm660-qusb2-phy",
 		.data		= &sdm660_phy_cfg,
+	}, {
+		.compatible	= "qcom,sm4250-qusb2-phy",
+		.data		= &sm6115_phy_cfg,
+	}, {
+		.compatible	= "qcom,sm6115-qusb2-phy",
+		.data		= &sm6115_phy_cfg,
 	}, {
 		/*
 		 * Deprecated. Only here to support legacy device
-- 
2.31.1

