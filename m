Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49C46566653
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 11:43:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230002AbiGEJn2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 05:43:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229885AbiGEJn0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 05:43:26 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 369B2E18
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 02:43:24 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id z21so19541144lfb.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 02:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=01bj+k2iK46i8ygWClSrCFjTLx488NH70cSKsBIKTsg=;
        b=EBgIy95oI1YlRgvATQfJpS80cR7EKsjCNm4gaabQMdE36oQ9UB4d7CLRx0DUJcgtZR
         9sst1JhY5f10oCLZxtduKw5h5XQsAuREy/710ch6VcAzhx0Z2Poy55Zly5n3lKc0Yc6J
         dI21tdKCkbfGHjVT53SzHgoqD8QuP1bswransbJNb6dKvxqPgM9mV10EHrYx8EWNd9jd
         G8cPRINN7VaKqCDffeao7LkChyQ+/FQCmuNgO3q0EaSmMLIXfGRr/+Iy1s1bASStqP7v
         SOCgW26WRGL7s8rqCkmqwp7nvfOWL8FE8TAsAjKtswA2gmohvA4VO+DvoAnjiFj1DyxY
         0Bvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=01bj+k2iK46i8ygWClSrCFjTLx488NH70cSKsBIKTsg=;
        b=6BwLeXUzwnFiFYB6xB70byTgHtWIaCDwPlfQPtJlLWv3m6p+JvqxvIYRKp8LEK+z+T
         I3aermhQ77tQjVsWNbB8XsHRcGOz8uQmYo7bE9hfgRplMX4DShqRPv4/JgbVkrhOVHdG
         VCtDMBIfu7tSY7TDj4B/ucjWnrSMysGLE2gjX8qPZMvCPI+mtZ9m3zSR5KpKWDkk/wIc
         o/lu+geYAEIBZ5v8AilvfYNFVd+Vw8MiPxwA4MNq5VibaEk9iw3DX9gA0ia+5pLEWQ0J
         p6GIH6UETxsO0O3y4qi9nrw4WGksiLc529M8zKTvPfFCkmjK+fBHHluS8zI4OEhkbJUF
         hVow==
X-Gm-Message-State: AJIora8oLdEnTCsAEJWhBNLCUVPtCABkGgrZxMtSTYW95oCCAz1xqVrw
        1Vwv5W1b74d+DUA11gDxExyPsw==
X-Google-Smtp-Source: AGRyM1t3YCQvDbMe1JwFFlmHtpCo9dv5TH+j6hW5E21eFvkk5xFInDRir/IU9QDicNR/uPGC213yAw==
X-Received: by 2002:a05:6512:128f:b0:480:fd23:6647 with SMTP id u15-20020a056512128f00b00480fd236647mr22510026lfs.136.1657014202606;
        Tue, 05 Jul 2022 02:43:22 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f7-20020a056512360700b00482f206b087sm491683lfs.39.2022.07.05.02.43.21
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
Subject: [PATCH v1 01/28] phy: qcom-qmp: fix the QSERDES_V5_COM_CMN_MODE register
Date:   Tue,  5 Jul 2022 12:42:53 +0300
Message-Id: <20220705094320.1313312-2-dmitry.baryshkov@linaro.org>
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

Change QSERDES_V5_COM_CMN_MODE to be defined to 0x1a0 rather than 0x1a4.
The only user of this register name (sm8450_qmp_gen4x2_pcie_serdes_tbl)
should use the 0x1a0 register, as stated in the downstream dtsi tree.

Fixes: 2c91bf6bf290 ("phy: qcom-qmp: Add SM8450 PCIe1 PHY support")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index f4ee5884c076..581f09c71667 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -1116,7 +1116,8 @@
 #define QSERDES_V5_COM_CORE_CLK_EN			0x174
 #define QSERDES_V5_COM_CMN_CONFIG			0x17c
 #define QSERDES_V5_COM_CMN_MISC1			0x19c
-#define QSERDES_V5_COM_CMN_MODE				0x1a4
+#define QSERDES_V5_COM_CMN_MODE				0x1a0
+#define QSERDES_V5_COM_CMN_MODE_CONTD			0x1a4
 #define QSERDES_V5_COM_VCO_DC_LEVEL_CTRL		0x1a8
 #define QSERDES_V5_COM_BIN_VCOCAL_CMP_CODE1_MODE0	0x1ac
 #define QSERDES_V5_COM_BIN_VCOCAL_CMP_CODE2_MODE0	0x1b0
-- 
2.35.1

