Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDDFE624A93
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Nov 2022 20:23:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229757AbiKJTXA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Nov 2022 14:23:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230342AbiKJTW5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Nov 2022 14:22:57 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74B4145A0D
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 11:22:56 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id u11so2072263ljk.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 11:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ss+R42CNBHIHLS2XAWDJxwiWvT6NqxNzbFS7Tsy5NgA=;
        b=luOpQF+aalxNssLwmiGa+0n7OBgK9dp488UgA0pdb5FQaQt2N7p0+yW7ORT2HmMVb6
         +WbM2+CPM432YHmxMPCvS7lK50rxW4DvJy3xlo3pCRm9q/dhzydhIXSKrm0HnNFAE6FO
         CaRNDx5CM7TVuhMHHzv0ya9xVDy9+tMFpFiDpT/5GlhprXVMo2r7kQmNnjzZG3Zt9fWi
         OECGChK0hxGUuAlimKiAcOEaZbw9TVS7QcHeBnyh46LeQ+JNvtlIUsAfuvwncoocM273
         gyUnGQn1mbkZRRKxJh0pcw6OCrkSn6adQfbq7Z/Xeq2S1+JpKjbZdwBgHxYE8hJgxCfx
         uN3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ss+R42CNBHIHLS2XAWDJxwiWvT6NqxNzbFS7Tsy5NgA=;
        b=PNpfhORUT2DnmMLkVIC6o8hC4Z8tO/DE5FS1B8cAXwaH8qL2Iq3GnlZwSOubULYBrG
         UeYnzOK8cUu8eHgFxZeEzZQWLJSSp7ITKqmkwwwpnNgU8gf3Xf5PWUd/h6uU0jcjqmxp
         Bea5K9Qh2snnaU8/zURAa8BcGb1CRa7R7HixjsRu0GAQrxfCWiSwH5HwFtWlT9Oh2c0V
         WdKxJTDyP8mC6GKhwjCLJJV2LQUy14DRKffGYs0y9AkCDxYt4q0Mt7K1gGkhINKAUwXw
         zXtyfbIWAuIwqlw2MW3JmCAsRUqIvuVehoLgpOx/3ODWZgIFb3/3UfTSHKOMboF0p9fL
         WcqA==
X-Gm-Message-State: ACrzQf2I28Oh+ZhTbUtLpkfL/XdWFHDXLnjchgt0kiD2ZcTTuThs/9an
        m8kKfGpAASGXx0pU1vQCDBXFjA==
X-Google-Smtp-Source: AMsMyM5plQcJVpMaW0hsjj4qUFUQyn3OoKLOLwXeWOnKHn8Y9Bk8xk7/WmVkDsNP+Y9BloZwBe2TMA==
X-Received: by 2002:a2e:549:0:b0:26f:bf8e:20e8 with SMTP id 70-20020a2e0549000000b0026fbf8e20e8mr9777182ljf.451.1668108175999;
        Thu, 10 Nov 2022 11:22:55 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id h8-20020a05651c124800b0027758f0619fsm40345ljh.132.2022.11.10.11.22.55
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
Subject: [PATCH v3 10/13] phy: qcom-qmp-usb: remove QPHY_PCS_MISC_TYPEC_CTRL reg
Date:   Thu, 10 Nov 2022 22:22:45 +0300
Message-Id: <20221110192248.873973-11-dmitry.baryshkov@linaro.org>
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

The QPHY_PCS_MISC_TYPEC_CTRL register is not used, remove it from
register layout.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index 3d920a834486..1c2c17880a40 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -94,8 +94,6 @@ enum qphy_reg_layout {
 	QPHY_PCS_AUTONOMOUS_MODE_CTRL,
 	QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR,
 	QPHY_PCS_POWER_DOWN_CONTROL,
-	/* PCS_MISC registers */
-	QPHY_PCS_MISC_TYPEC_CTRL,
 	/* Keep last to ensure regs_layout arrays are properly initialized */
 	QPHY_LAYOUT_SIZE
 };
@@ -136,7 +134,6 @@ static const unsigned int qcm2290_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= 0xd8,
 	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = 0xdc,
 	[QPHY_PCS_STATUS]		= 0x174,
-	[QPHY_PCS_MISC_TYPEC_CTRL]	= 0x00,
 };
 
 static const struct qmp_phy_init_tbl ipq8074_usb3_serdes_tbl[] = {
-- 
2.35.1

