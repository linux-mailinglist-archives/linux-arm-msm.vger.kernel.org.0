Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0823F624A90
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Nov 2022 20:22:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230174AbiKJTW6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Nov 2022 14:22:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230168AbiKJTW5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Nov 2022 14:22:57 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D47B7655
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 11:22:54 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id bp15so4991183lfb.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 11:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vcPWjds6mbsRpPKp/5SVoMeEsYJwXwMrOPUv6AY8j7w=;
        b=hWPTENd16gDyfNtE90doqMgenYj/3vA75LrwWv/0LrS0uMCwx0ESxtzbalYTZ3oZKk
         4uHFI4UO/Fx/ITkGiNmkO1fDojYrFkkiTI5MvZG0Wtmf2QBq6ZCneh4hPsXLI//CmO1T
         18BpolUdU5railfc9gDEjT+wtFgoVpHs+jGFcAFHFow37KhuvQjpe89ZKnunzQhRxS43
         xLCEnmING5OjWg4nu007657rNEWMmR8NWzSVK4aA4VT44CQ3lA+RtnnqoarCwdOsosap
         Z/f6EfKeDLk+n3XYGtJ9XVjgA+LoWQuVHCWa2mxY7yPW7xYT2Ia3m2Iu1iQdo9Vnabkb
         mbGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vcPWjds6mbsRpPKp/5SVoMeEsYJwXwMrOPUv6AY8j7w=;
        b=df/4zXfGY7LqwbzSu8yTn2vmQIZgDr2g2ewtWA3ujTVLk9/c1h4iaT1MXF3em3mUds
         /6ANsw5pGKBJyNsv363UPoS/kNR97ptVhM7JPOiQw9N4vzAtgzs02T0h56FCmGgjYOx9
         rKSUR5dshJtumDcRqZeNJ4pUkbdJ+hCzwKjmb/Q2BueIZ8udBl7dnajxG/eZQueG7j+L
         Co9bcIkQhqX5+pnTjJ7f4zoPVt+YR8km1wIKBaZY+iZAZxI4Xnu7D27BisvkpcXCPYxa
         ouJlPzIV5n42Yp6XCfOr8idNF5hng6J0V6RgU/L2ydF3H/Lsk8654C5GsNhkesJ1R/m+
         Z4sw==
X-Gm-Message-State: ACrzQf04WPuwtYJHDwqag17YtE/QWLLtlOUoz7QrVDfFUZcGt+WOlNiI
        cNsqXxs5sRApEkXt0HICpPEXfA==
X-Google-Smtp-Source: AMsMyM58KmcjPSKgeRBdweaOO+IIBjMMbArHcJIRO29TPoIrgAyAd4GioIIozN1yA+R0n1AGUVr7aQ==
X-Received: by 2002:a19:f607:0:b0:4a2:4f6d:7963 with SMTP id x7-20020a19f607000000b004a24f6d7963mr1956428lfe.638.1668108172881;
        Thu, 10 Nov 2022 11:22:52 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id h8-20020a05651c124800b0027758f0619fsm40345ljh.132.2022.11.10.11.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 11:22:52 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v3 05/13] phy: qcom-qmp-pcie-msm8996: rework regs layout arrays
Date:   Thu, 10 Nov 2022 22:22:40 +0300
Message-Id: <20221110192248.873973-6-dmitry.baryshkov@linaro.org>
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
index ff198d846fd2..b120a7e2e1ec 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
@@ -86,9 +86,9 @@ static const unsigned int pciephy_regs_layout[QPHY_LAYOUT_SIZE] = {
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

