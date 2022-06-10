Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CDE9546CEB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jun 2022 21:09:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348196AbiFJTJe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jun 2022 15:09:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347158AbiFJTJd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jun 2022 15:09:33 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A078421A7
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 12:09:32 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id g25so149667ljm.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 12:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aJkt2UvzC/fuSbaAFzAgmcuGnHsumZ1LtWfxE2c+EXo=;
        b=IqVo/yDeLrrY6oVxiUm6d7ssqUGieE86BefvLu0kajhUEPSV5bGzJFyZ2jgJyQF0X6
         NE/WH/n6OiTaIKbHbNhYOqAPlkzENyzhKLi3lmSGcEqLdZgGjwK5PFHg3/oHnbrIcyP7
         l+dnSAC11IPBinbsqT1PqgE7bntf0gp9h3VwdnvAPusMqBEjaA/+AJrxhv7sPO++2ESv
         fXeelBj7fJkCgK1qMVddo38utMbKOYEfehbXJgABa8f2KsNpa05Tfco9v4w3JfdptobO
         CaXR+lxMPNpc60BygT4qZzcxjmTjgEyMQJ2U2dd7rjs2angfzCnTOnXct387m6Hd763F
         ONcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aJkt2UvzC/fuSbaAFzAgmcuGnHsumZ1LtWfxE2c+EXo=;
        b=dyYgH6X7jZafpaUCHGBMs/BTI8yI9RkaXQqzZL/HiE1uOuI6tCgfPnSxKJnrG/pjaH
         r9gU948GOkH9BjW/z4UY9xxpufzgi9yLOHdCKvhzMFFvrk0WMTQLGWNK3q/4Zw2z3JJg
         JLJLyNyGEcZuJHPM4RtNjdxWueaC3iJsFvkZIJjO0zV17ni13qDCEEZg4YrLV/8zTbeC
         LSoWMJ5gfBJutJhPOFFXXKB3QsZQPsKxqxi7BdFQTiNVMb8XcCNNuMxfE63VCkNh4BkR
         +lZ+c9uxNO1gg0mHyhdTObaQvfex5MCn6vXH59euFWCeGuJUxhGb+RUJ7t9GZGj7HqMz
         LQAg==
X-Gm-Message-State: AOAM533qn9MN2KMe8Mq0QVCNPTIymSIgAfc1ulS/JWz1Mk7INoIP1o8z
        5NJeTV5bTIYqXp6GkrOg6vXl0g==
X-Google-Smtp-Source: ABdhPJwZXCgHdoBZUEhhs9rJ9ZeOcJ7aq1u8FFnVcVxdDXoVFkmJBktg11yAVRSz5hDopgj+y9Zv/g==
X-Received: by 2002:a2e:9283:0:b0:253:e175:dd84 with SMTP id d3-20020a2e9283000000b00253e175dd84mr56469384ljh.221.1654888171024;
        Fri, 10 Jun 2022 12:09:31 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h2-20020a2e9002000000b00253e1833e8bsm26614ljg.117.2022.06.10.12.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 12:09:30 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan@kernel.org>
Subject: [RFC PATCH 02/28] phy: qcom-qmp-ufs: remove spurious register write in the msm8996 table
Date:   Fri, 10 Jun 2022 22:08:59 +0300
Message-Id: <20220610190925.3670081-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220610190925.3670081-1-dmitry.baryshkov@linaro.org>
References: <20220610190925.3670081-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The msm8996_ufs_serdes_tbl table contains write to
QPHY_POWER_DOWN_CONTROL, however this register doesn't belong to the
QSERDES register space. Also the PHY power down is already handled in
the qcom_qmp_phy_ufs_com_init(). Drop this entry completely.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index a2526068232b..83330f7ec64c 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -163,7 +163,6 @@ static const unsigned int sm8150_ufsphy_regs_layout[QPHY_LAYOUT_SIZE] = {
 };
 
 static const struct qmp_phy_init_tbl msm8996_ufs_serdes_tbl[] = {
-	QMP_PHY_INIT_CFG(QPHY_POWER_DOWN_CONTROL, 0x01),
 	QMP_PHY_INIT_CFG(QSERDES_COM_CMN_CONFIG, 0x0e),
 	QMP_PHY_INIT_CFG(QSERDES_COM_SYSCLK_EN_SEL, 0xd7),
 	QMP_PHY_INIT_CFG(QSERDES_COM_CLK_SELECT, 0x30),
-- 
2.35.1

