Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF8CD624A8F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Nov 2022 20:22:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230142AbiKJTW5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Nov 2022 14:22:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230174AbiKJTW4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Nov 2022 14:22:56 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA04D45A33
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 11:22:55 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id b3so5058599lfv.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 11:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NzgfHXCd9bT9AU1uUDCeffQ3kVak86+68W/RoCE18ZU=;
        b=b/3yIlzQq8JBW9V1+6+OL36Lnum6Dg9vpAiHCaByGjfWZHFLeyVHDmv4jIRPHS2R3q
         bgu7/2gUiymdjHKS/7QJEzw+44aH8/6c2jcQhb8ce9NND11YJG/H8d/wf+GibVkr6+cl
         9DE5Wmj6OaPrg4RSdZPQkc95XF/2Vx1empRu4jj2RKnId865DJM3uF6HZYuKotLypsVF
         QdWdgEjPNU6osNIDbE4Ay44y90CTudY4UWaHIG9i3pAeYPwr3PJnXo0a2cknQ8xqTVFN
         TgejzpXwxF+vi/Hd6dekKCnMglQj5sZcyBw4rHVznHFCYH+q8pPu14zzEyce9MeJ6Aqc
         WFIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NzgfHXCd9bT9AU1uUDCeffQ3kVak86+68W/RoCE18ZU=;
        b=RsrvLjncWnoXBbCHYhXS+RTs4gBHfTwcoVnyEIxbCgAcgD3R3rTZGc/KWlT/m4FR2h
         Q9NkXvT1zjypbcpkjXQJjiBCv8fxSYTl6tzwNOVAmwJ7W1OCslLVSk2W3xBodghDyzP/
         OKLKGeRhTG+GH5Y55eORy+lmwOn1cCWiteL13xagfklNFY2BHucgSewA4Le7JuPnqFqe
         RGTWKWIVJdYm2aNgGtAo5NO3Bl0yAWfHOmookpt5eELCvIqViG7054On+6nfmFH7mmU8
         KyL3ySkInu5ComSrQelC3zvD7gVnaIjpHsNbAxEXXp5V7U6bfk7gtrodMevGgz4TSdoX
         pphA==
X-Gm-Message-State: ACrzQf1HH7KtjRVpa+jDiEJdEZSBSy3u5b4Jwmwz8drya9OyiIK49Rp7
        GBamgrc1rUVMl8BSwj7L+FowIg==
X-Google-Smtp-Source: AMsMyM7KTkQx49nWHjMV5Z4sGcjZK4dvqQG4bNovDTIA/Mq5+i4U6+k877QouxVZdGrBRL+eAXX1Hg==
X-Received: by 2002:a19:385a:0:b0:4a2:5008:d235 with SMTP id d26-20020a19385a000000b004a25008d235mr1857987lfj.7.1668108175368;
        Thu, 10 Nov 2022 11:22:55 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id h8-20020a05651c124800b0027758f0619fsm40345ljh.132.2022.11.10.11.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 11:22:55 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v3 09/13] phy: qcom-qmp-usb: remove QPHY_PCS_LFPS_RXTERM_IRQ_STATUS reg
Date:   Thu, 10 Nov 2022 22:22:44 +0300
Message-Id: <20221110192248.873973-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221110192248.873973-1-dmitry.baryshkov@linaro.org>
References: <20221110192248.873973-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The QPHY_PCS_LFPS_RXTERM_IRQ_STATUS register is not used, remove it from
register layout.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v2.h | 1 +
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c    | 6 ------
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v2.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v2.h
index 431e9148b8d0..c7e8e2a28e6e 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v2.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v2.h
@@ -28,6 +28,7 @@
 #define QPHY_V2_PCS_FLL_CNT_VAL_L			0x0c8
 #define QPHY_V2_PCS_FLL_CNT_VAL_H_TOL			0x0cc
 #define QPHY_V2_PCS_FLL_MAN_CODE			0x0d0
+#define QPHY_V2_PCS_LFPS_RXTERM_IRQ_STATUS		0x178
 #define QPHY_V2_PCS_PLL_LOCK_CHK_DLY_TIME_AUXCLK_LSB	0x1a8
 #define QPHY_V2_PCS_OSC_DTCT_ACTIONS			0x1ac
 #define QPHY_V2_PCS_RX_SIGDET_LVL			0x1d8
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index 55029ea63f73..3d920a834486 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -56,9 +56,6 @@
 /* QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR register bits */
 #define IRQ_CLEAR				BIT(0)
 
-/* QPHY_PCS_LFPS_RXTERM_IRQ_STATUS register bits */
-#define RCVR_DETECT				BIT(0)
-
 /* QPHY_V3_PCS_MISC_CLAMP_ENABLE register bits */
 #define CLAMP_EN				BIT(0) /* enables i/o clamp_n */
 
@@ -96,7 +93,6 @@ enum qphy_reg_layout {
 	QPHY_PCS_STATUS,
 	QPHY_PCS_AUTONOMOUS_MODE_CTRL,
 	QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR,
-	QPHY_PCS_LFPS_RXTERM_IRQ_STATUS,
 	QPHY_PCS_POWER_DOWN_CONTROL,
 	/* PCS_MISC registers */
 	QPHY_PCS_MISC_TYPEC_CTRL,
@@ -110,7 +106,6 @@ static const unsigned int usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_PCS_STATUS]		= 0x17c,
 	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= 0x0d4,
 	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR]  = 0x0d8,
-	[QPHY_PCS_LFPS_RXTERM_IRQ_STATUS] = 0x178,
 	[QPHY_PCS_POWER_DOWN_CONTROL]	= 0x04,
 };
 
@@ -120,7 +115,6 @@ static const unsigned int qmp_v3_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_PCS_STATUS]		= 0x174,
 	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= 0x0d8,
 	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR]  = 0x0dc,
-	[QPHY_PCS_LFPS_RXTERM_IRQ_STATUS] = 0x170,
 	[QPHY_PCS_POWER_DOWN_CONTROL]	= 0x04,
 };
 
-- 
2.35.1

