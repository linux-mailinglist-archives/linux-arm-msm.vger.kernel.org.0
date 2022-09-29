Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C94195EFD83
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Sep 2022 21:00:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230051AbiI2TAc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Sep 2022 15:00:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229991AbiI2TAW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Sep 2022 15:00:22 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E05D3ED78
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 12:00:20 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id a3so3601859lfk.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 12:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=SXNRgezD66dOFNTYj/62XJd73lc2lPvfOvxtQr1WywA=;
        b=GJCkLz0bYM1DYJx9DF36t9LZynTLjvEHbvJVr21dZvoJxtDZKjJCwxIwj7YefOzp4J
         StqsnHUcslalg+H3DWIESp9Tk+SmxpZhxsB+veURlGS64tAWhRwsAgyGRy7o4AcnyH0h
         v9hRl2XuCJvX4QNPvZZt/0G14NhO/pDIytBV7x5/J0G1HuNQC+xh/kElIuYRsIr7sfIr
         N4yaHRjqG0oTy9fwTLdz1I2DzkndKLUxVs7nX6tjNJrPGjUGOWJGOLVMwqLBse2fhSHc
         NmYl+g4Y8r6vEHWs18mfSNyDnFNNFyCmaw0dfLavEYzk2ZnB4F4YbSKlDAls9xfrOy6O
         cmDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=SXNRgezD66dOFNTYj/62XJd73lc2lPvfOvxtQr1WywA=;
        b=eo2vKxdmvJ18LB33XmIQ8FbWhel3ZpgMoip1JA9v4W0O5tCL3ssyJ45qT9PUuomwDA
         Jvp0gIN8MZwIyygtEjQcdnYBr4Ak4iaQnNvGiy3t+lp4hnbd0gM5eDkv4lIRTRaQeZVq
         wa7YhXE32Y19bRS0/1EFPPe2RHGnLQplNYrxNx8ZKvYgnKblowrZV1ArgP78KFfMTtaA
         Ll4YpJgMP3AavWX3Zntd0WfNCb/it5OfX80rXGbLCH3Zc5yf9v66ri2I/KND4e2ghw3S
         VGqarz3uvf5ZdZGs8pZt37AkEf975uW6lsWpSvw66HpguB4kFFa52xBvaipb0zfRAQJZ
         mqVA==
X-Gm-Message-State: ACrzQf1X0g91WcU5rsCvBErxiEqxpedvPz1IArXoOl50lPRMeH2PWcnS
        SfwTCtWIMfA7BNBEIxX7Yj11sg==
X-Google-Smtp-Source: AMsMyM73MLvoFpR7+pjiyJhjx1fnEB4XAntskus3PN3n8DQLM9XxZu1FQGuxDm41mFcMiHOCqGQ9cA==
X-Received: by 2002:a05:6512:3e14:b0:499:1f71:1680 with SMTP id i20-20020a0565123e1400b004991f711680mr1992315lfv.114.1664478018290;
        Thu, 29 Sep 2022 12:00:18 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id j15-20020a056512108f00b0049f87fb416dsm33693lfg.12.2022.09.29.12.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 12:00:17 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Robert Marko <robimarko@gmail.com>
Subject: [PATCH] phy: qcom-qmp-usb: correct registers layout for IPQ8074 USB3 PHY
Date:   Thu, 29 Sep 2022 22:00:17 +0300
Message-Id: <20220929190017.529207-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

According to the kernel 4.4 sources from NHSS.QSDK.9.0.2 and according
to hardware docs, the PHY registers layout used for IPQ8074 USB3 PHY is
incorrect. This platform uses offset 0x174 for the PCS_STATUS register,
0xd8 for PCS_AUTONOMOUS_MODE_CTRL, etc.

Correct the PHY registers layout.

Fixes: 94a407cc17a4 ("phy: qcom-qmp: create copies of QMP PHY driver")
Fixes: 507156f5a99f ("phy: qcom-qmp: Add USB QMP PHY support for IPQ8074")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index b84c0d4b5754..c3e7a860582b 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -1616,7 +1616,7 @@ static const struct qmp_phy_cfg ipq8074_usb3phy_cfg = {
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= usb3phy_regs_layout,
+	.regs			= qmp_v3_usb3phy_regs_layout,
 
 	.start_ctrl		= SERDES_START | PCS_START,
 	.pwrdn_ctrl		= SW_PWRDN,
-- 
2.35.1

