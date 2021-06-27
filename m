Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 348023B54D9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Jun 2021 20:58:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231614AbhF0TA2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Jun 2021 15:00:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231516AbhF0TA0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Jun 2021 15:00:26 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5331CC061574;
        Sun, 27 Jun 2021 11:58:01 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id j2so17896492wrs.12;
        Sun, 27 Jun 2021 11:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8hmlrjkmcfJ1aygTd9/3P+2nz6SFwwd1iwgYQqcLxhs=;
        b=UfmKcy5TpNUzSWe4GDJCKf7QvH9lAePOnJ3l/TC7g94fZWkUGKrLKanodLbckQmQSp
         sGSy/AFz/V5SsyEYyE1UWwAO6pWI4w1SQ0oIC/TT+iQQwzaDj60bXsg5ITQ1ueFlkb4p
         SKFfl0wyY6vI8d3d8jkj+ZAni3IxYCgn5Ju9B+RVgii8GFNm6mbpJqosemtf5xASnl+E
         Ip0woSYOgNJ+WZkG/+klMFXX2Vpa7rK1e+i6B/Yus7JKKewa1NLu3yQU9yOdC3wCfhAL
         tbPiczpgRYNwOi/fZHllyhMzMIka+bOYXC/4g1d8mMfkaggAwyeO668jTlc/Gyzu4okJ
         JVhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8hmlrjkmcfJ1aygTd9/3P+2nz6SFwwd1iwgYQqcLxhs=;
        b=BsQlC/ucidjBFaeYkyfQMZpQsTBv5cAzZgTSQXQOURy7smpaq73h1TNtYp5ZL01ZC1
         HwLp4GfNbqg3tGEyyCv1bIQ+WFbRrRf9TN6hLqnhoJaqFcOCmY5qq8P5WHa7zg0tiIcu
         vyf1bvV4UKb8b+4Uc4nxtHq2K7E4lRVK7almRyMHpvhU3xlMwTrFA7gHfVv+YVT8nEs8
         rbUFNyEDhvik/DZ4XxEASnpVO8Sv07UfW04ornfP4dTmHGInv4PCRYgH/FgHJ1ok3NsW
         zN7enXIXTzrwixEZ1yernUCtz6s96cNRNJJf7mZYLOSe+0+0w0lRkaTvSc/57mrxAN4l
         MQWw==
X-Gm-Message-State: AOAM5325fjtzbY6aNFsNvH8G4P+BHQ2uLaBb93VfVhzdPK5BWPQyngUi
        tRPubzqa3n28GyIVj5uqJvc=
X-Google-Smtp-Source: ABdhPJwP2SMhEedxbe82P5wnMpvxkRpnjkXS+JizfvwCU1buhGIqG5czHnUzlvRZHiZeyJ85LnzcJQ==
X-Received: by 2002:adf:a2d1:: with SMTP id t17mr22941948wra.74.1624820280034;
        Sun, 27 Jun 2021 11:58:00 -0700 (PDT)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id i9sm11890745wrn.13.2021.06.27.11.57.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Jun 2021 11:57:59 -0700 (PDT)
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
Subject: [PATCH v2 3/3] phy: qcom-qusb2: Add configuration for SM6115
Date:   Sun, 27 Jun 2021 21:57:50 +0300
Message-Id: <20210627185750.693222-4-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210627185750.693222-1-iskren.chernev@gmail.com>
References: <20210627185750.693222-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The SM4250/6115 uses the same register layout as MSM8996, but the
tune sequence is a bit different.

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qusb2.c | 31 +++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index 8f1bf7e2186b..51e5478ea7f0 100644
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
@@ -888,6 +916,9 @@ static const struct of_device_id qusb2_phy_of_match_table[] = {
 	}, {
 		.compatible	= "qcom,sdm660-qusb2-phy",
 		.data		= &sdm660_phy_cfg,
+	}, {
+		.compatible	= "qcom,sm6115-qusb2-phy",
+		.data		= &sm6115_phy_cfg,
 	}, {
 		/*
 		 * Deprecated. Only here to support legacy device
-- 
2.32.0

