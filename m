Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1F605EE9F8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Sep 2022 01:10:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233894AbiI1XKi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 19:10:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233945AbiI1XK3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 19:10:29 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7868A1EED1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 16:10:27 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id o2so22518396lfc.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 16:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=y0/09TmWpDPvIAj1+gHWN9vwz0OzEVkNofRC0Kb/Zdw=;
        b=C5H32G8PnAnRTTea3OUP5T7CsvD9rrXvs/amWgcYOwtyM7q2NOmXm3PXL9pfQvA7mZ
         MYO+G3ZXofwoGb1dZGa8QcFSWSQF0rFZC/B+8+vEN2RgMMjp1EJjvL1TmVv4McCHahKT
         Pri+hYpLT/ssUzsE0hii6fNbztjg1DtlWp9fByvhtpUue4vpYkSa8KgftkQV9Ukndb73
         mWPmSTRHcevuSM8+6bj5bEfpIdY2gapBRgAgoYCp/TG3J4TOxPaWAPZgP5YiZIBuDaw1
         40tfy+Qt+Q7UJ95Kqy0cfMGjl9+KGmNbLz2bIonzLbfP6lEQ6Ct3kr5Mc310pNBVkduk
         WZ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=y0/09TmWpDPvIAj1+gHWN9vwz0OzEVkNofRC0Kb/Zdw=;
        b=6ERGfOHiJ7xaot5OEhezrwxTN9E5KFrar0gYT7uoJ20N1w9gTTnIXIoAYK8Enrko6U
         ubFk93Kmh5Zv9WUMNEyaQIuxLN1jeZZwFx79QmoQSsRo0OpxxoZDC9E47PnbANScrvtu
         Q3dLqgB2lhABhSpBJgM2XQqoL7rjM5iuSdju80dNBTypLC7+gyELDmbTUh/k9CsS60R1
         cjZGP6SIM+Xy7AwVXvNOZzB1lCEmPzWGLfpk6Q0BUNUM7gDkfopPoMMnVs8ZwDvTEQsw
         AOiJZt3i8ccxrPyQ+MDAQDTKIP0z8vhTiEl9kt3sD4nZ2iMyLvLZxrmm92zW8wWYmkuv
         2xMQ==
X-Gm-Message-State: ACrzQf2GRmmrO4nCp3/FUrlh5efBBRraxDzPBUwGzW7oMpSOKPLU5Ui3
        r57NCYwJ888Y70GENvfoqjSeuWnaXxVNfg==
X-Google-Smtp-Source: AMsMyM7weg0lRkP0pXL1damegfo9nOMubyOhEQHYs0BwUyhGSZV7J7d0GOUHNwz2xviM4MMyf3R9Rg==
X-Received: by 2002:a05:6512:3d9f:b0:497:a108:544f with SMTP id k31-20020a0565123d9f00b00497a108544fmr110094lfv.688.1664406625900;
        Wed, 28 Sep 2022 16:10:25 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o16-20020ac24950000000b0049d5733fb3fsm597587lfi.212.2022.09.28.16.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 16:10:25 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 13/18] phy: qcom-qmp-usb: remove QPHY_PCS_MISC_TYPEC_CTRL reg
Date:   Thu, 29 Sep 2022 02:10:09 +0300
Message-Id: <20220928231014.455201-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220928231014.455201-1-dmitry.baryshkov@linaro.org>
References: <20220928231014.455201-1-dmitry.baryshkov@linaro.org>
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

The QPHY_PCS_MISC_TYPEC_CTRL register is not used, remove it from
register layout.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index 43b7ad2c9479..54e6032b4bf7 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -109,8 +109,6 @@ enum qphy_reg_layout {
 	QPHY_PCS_AUTONOMOUS_MODE_CTRL,
 	QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR,
 	QPHY_PCS_POWER_DOWN_CONTROL,
-	/* PCS_MISC registers */
-	QPHY_PCS_MISC_TYPEC_CTRL,
 	/* Keep last to ensure regs_layout arrays are properly initialized */
 	QPHY_LAYOUT_SIZE
 };
@@ -151,7 +149,6 @@ static const unsigned int qcm2290_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= 0xd8,
 	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = 0xdc,
 	[QPHY_PCS_STATUS]		= 0x174,
-	[QPHY_PCS_MISC_TYPEC_CTRL]	= 0x00,
 };
 
 static const struct qmp_phy_init_tbl ipq8074_usb3_serdes_tbl[] = {
-- 
2.35.1

