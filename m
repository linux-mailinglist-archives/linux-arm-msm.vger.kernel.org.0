Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B150566655
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 11:43:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229658AbiGEJna (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 05:43:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229978AbiGEJn0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 05:43:26 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6698F21
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 02:43:24 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id n15so13792420ljg.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 02:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aJkt2UvzC/fuSbaAFzAgmcuGnHsumZ1LtWfxE2c+EXo=;
        b=O8YQugHMOYm2/KHrxrLpRojyXdP07gY1seUt7/dV4rHlWaAuwMCl94Wd8urU74KZw+
         7XjR77/8mOqgvwzouCoOj0ZfdmQVknsbkLMahh6M9J9GMyq5XgpN2XfWSYzAvhYzeNpN
         ZR2MEzyObQYpPTCKSsZ0Aqqq11l2cWtqjRT1yVK+GkSSEcDdeJjO8viGdeysiFRfJxNg
         UD/uGCIicASOig4hdT3wIawt08kwoACW4HudrTBjfQTzszUuedH6nWtrW7TPJ7KkOScj
         Z0O/TkRegimiqap174N48q1+z6SAhLFIcYPlmLk+gBJ3SyF8wiNNCgRLflkaFkMQoIbJ
         JGLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aJkt2UvzC/fuSbaAFzAgmcuGnHsumZ1LtWfxE2c+EXo=;
        b=l/BVLH14LXzb6SWw1B/X41TPPjnQhhYgrlTzRrgNiWABQr5RxX+wCMOjwMhGKREmfc
         U4jbQ23nAcs9FRaD8uVZASWbGJ6wSUN9durKW6OR32bNrPusIqfRMUVTwicjceL5TL0t
         OMlF321Qhc4X80iKGfMi7heGHQfKOPUJIn6MG2URjKvNPi2fTFU1yKZ4Frqe0w9O92R1
         n2A4bJCNEIWo5KN9i6KKBAxa9T663NVi63kuaeSpc6g5HQZ3Nci+TQeoZxFxlWIwpr2B
         yjzwl88KWPad9GihHR09E+aUHv/AiaA0nZ+BDKo/6o1BwXXlDg+2vz+R3Nnx+KgCcPli
         B3KA==
X-Gm-Message-State: AJIora9O6rWXui/afW+1v1i4cUTqjgsPjWG1UWsVdtmvOKk5Nl4jegrt
        F3SKag1/okha+HsskRyVIcjVaw==
X-Google-Smtp-Source: AGRyM1vj42PFm7A9iIDXzIFR7Za32RnS+gIzpD1bpf1eYK4NkVqebr+LfZJhvNZt5ocTkAbVaVvP3w==
X-Received: by 2002:a05:651c:23c:b0:25b:eb1e:c52 with SMTP id z28-20020a05651c023c00b0025beb1e0c52mr18861524ljn.481.1657014203332;
        Tue, 05 Jul 2022 02:43:23 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f7-20020a056512360700b00482f206b087sm491683lfs.39.2022.07.05.02.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 02:43:22 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v1 02/28] phy: qcom-qmp-ufs: remove spurious register write in the msm8996 table
Date:   Tue,  5 Jul 2022 12:42:54 +0300
Message-Id: <20220705094320.1313312-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220705094320.1313312-1-dmitry.baryshkov@linaro.org>
References: <20220705094320.1313312-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
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

