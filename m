Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67BBB5EE9FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Sep 2022 01:10:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234014AbiI1XKl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 19:10:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234105AbiI1XKd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 19:10:33 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1AFC40E2D
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 16:10:31 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id d42so22659084lfv.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 16:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=4WYMXtDG8vwSmmDzKjiS8Vfwi7MpTHhnmDtgJ0kUazk=;
        b=F5HxpY2UAf5W5atXt2Xce4Y4AKKtZMx0rU4pPfO6hexZlMcuuV6KEXM21yi2IrJhRu
         sJXmVgQ2+7+blb0gD+LNJMzyzuS5OrvytzeyMSY+KC7oUZEImQhXFcO22EuXUHreAhw9
         fIs9Jy5YGjbT3bt+TxvDUebezE6796v7S8NkVNfG/PBYWfp/ikEfzXmqhOMFpOQMmO0H
         F3+gB8EOAZo40A020JPAlT9OLlOKDI+4NpZmLEK91NyERc3KV+UawLlwNPOvr50Ovnsk
         jH4qPIw7H9w4oVIZPYY04t+QQeKg6hU1zKQXV5awy0NhS0ff8QCVSRB067FA/ickjWMi
         vB+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=4WYMXtDG8vwSmmDzKjiS8Vfwi7MpTHhnmDtgJ0kUazk=;
        b=FFQ+bfMn2R7ShSGj7wfLNzesiZgJnrLU6ad//O2L4rsnVSWylnWEu7BqzmrGZVVFz4
         hiKMecAZHKUON0O6B/FBoNcu7vwjvAOCpLcvqLRdPZOK6jzKB1mAkCg2uZpDVS7BRgOJ
         DO1K5vAbO+jiZyij2g3+DH6BEL5oPXzst0mS7WJE/tYxGDxAi4a/vLZiLxqJK3vkuce6
         d8tZwWYi2VLWL1/9UYFHrV8WaLyHaQ4JHRHYDcQwwe3SR80wYfappOLGO4IO5sPSGcnm
         GfJLfYIpayNC4dY91nVzAzV1DYNrh9LCIlyLZYY3tenKR3R5No8Ks04tQS/LlwbV9zY2
         dg3w==
X-Gm-Message-State: ACrzQf2QTaIhOaiFveN8olqHDKZLzgVKQ8xaEgo7OTrqCVmJe5W9o3NE
        6PzOGj0cmRfKJyD6kT15uzhUMQ==
X-Google-Smtp-Source: AMsMyM548qJJ4CEz7gtfgNPXPo4Thxq/shXv6RNqT3q8vpLVwsWiAuaajRjAw6/aC0l1WXja9/e1cA==
X-Received: by 2002:a05:6512:78e:b0:49a:d9ae:3051 with SMTP id x14-20020a056512078e00b0049ad9ae3051mr108370lfr.203.1664406627340;
        Wed, 28 Sep 2022 16:10:27 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o16-20020ac24950000000b0049d5733fb3fsm597587lfi.212.2022.09.28.16.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 16:10:27 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 15/18] phy: qcom-qmp-pcie-msm8996: rework regs layout arrays
Date:   Thu, 29 Sep 2022 02:10:11 +0300
Message-Id: <20220928231014.455201-16-dmitry.baryshkov@linaro.org>
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

Use symbolic names for the values inside reg layout arrays. New register
names are added following the PCS register layout that is used by the
particular PHY.

Note: ipq8074 tables appear to use a mixture of v2 and v3 registers.
This might need additional fixes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
index a5ebd77d5905..9a05c9f9e5b2 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
@@ -100,9 +100,9 @@ static const unsigned int pciephy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_COM_POWER_DOWN_CONTROL]	= 0x404,
 	[QPHY_COM_START_CONTROL]	= 0x408,
 	[QPHY_COM_PCS_READY_STATUS]	= 0x448,
-	[QPHY_SW_RESET]			= 0x00,
-	[QPHY_START_CTRL]		= 0x08,
-	[QPHY_PCS_STATUS]		= 0x174,
+	[QPHY_SW_RESET]			= QPHY_V2_PCS_SW_RESET,
+	[QPHY_START_CTRL]		= QPHY_V2_PCS_START_CONTROL,
+	[QPHY_PCS_STATUS]		= QPHY_V2_PCS_PCI_PCS_STATUS,
 };
 
 static const struct qmp_phy_init_tbl msm8996_pcie_serdes_tbl[] = {
-- 
2.35.1

