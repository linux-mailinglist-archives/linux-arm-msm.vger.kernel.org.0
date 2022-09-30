Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B303A5F0ABB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 13:39:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229628AbiI3LjC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Sep 2022 07:39:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231638AbiI3LiI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Sep 2022 07:38:08 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C268E0A6
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 04:29:37 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id x29so4484134ljq.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 04:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=rY1dkWkbpUk5yxsY7viJALOltWHB3nciD/DTFAI20GY=;
        b=fAJYjarC5kQ2fOgNSGcvoPbVEBrd+qTtXAcobYminPtONgIZ/MSGEz+lLfQkcmDzUR
         M4iP7gQ8LQKxt1+XOiVDsZnPKs+5gmE23NKDG1ubTw7gt8C0bqfcWPxVIOn2g61jQiIe
         m1n0BX3k1I55Zi48reRtvylYU6s+ZRAzZZtISnLETiKPgnbAfirrk3KEY1mp/NJPs/Aq
         VZUnu8urAO1h9snrsnI8eL2lCkE7xQawyr5CKVTuKKn/AfK2SLnj8rfeDHG74Y0D8+qU
         ReXBWNam1OD9j9sUew4x11BzSqgOTfIqUI3EtNTZ/aieI+SGxE6ilCvLuvRPuB0dLzwY
         KvhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=rY1dkWkbpUk5yxsY7viJALOltWHB3nciD/DTFAI20GY=;
        b=SQ3+fKPzsi1W4hHCzvelM5gg9E+o5xdveqRAOHzciBslmQDNllrHtf8Qoufs+LnUjN
         Ih/N5fWOh8t8jw+or+0ln4PbwVAq8wY8N9Wka2CfxiAhphxy+/5niNWactiaLfHzURBr
         FFgo/4iACa/GnzMjsbWXsFsskpmiD5PxDl5ua/ZJaW0yqEm2Cx1PAZZNBo7w03plo1E+
         qlwbBEEtDzZD8MeC6FlKTijjUxchfInNvqrerBUrQ0KEK3sE8chKGWD0i7snZSW/s4Fh
         I15+M9ACEdSP8n7g7nyV7TrtuHhtDuBSf3TsF8LkvC7M3et0xPas/eLOhJRTJ1X/A2SM
         cRZQ==
X-Gm-Message-State: ACrzQf29Dx8AM8kcTnlidlSi1M867fFpTkgks+s+w8/hKJU5h6uzs9ah
        4T1H9KGCENwI4fQzT8+w17ltGQ==
X-Google-Smtp-Source: AMsMyM4HOU1A/bPL4JzGnSjhF5QZVnByaj+fftFp6vaCjNXBP0tTXxDH7dA46Q1rkbKkEtwXdneWEQ==
X-Received: by 2002:a2e:8190:0:b0:26b:d94b:75e9 with SMTP id e16-20020a2e8190000000b0026bd94b75e9mr2891463ljg.379.1664537375463;
        Fri, 30 Sep 2022 04:29:35 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v18-20020a197412000000b0049493c14b17sm264672lfe.181.2022.09.30.04.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 04:29:35 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v2 10/12] phy: qcom-qmp-combo: remove QPHY_PCS_LFPS_RXTERM_IRQ_STATUS reg
Date:   Fri, 30 Sep 2022 14:29:24 +0300
Message-Id: <20220930112926.638543-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220930112926.638543-1-dmitry.baryshkov@linaro.org>
References: <20220930112926.638543-1-dmitry.baryshkov@linaro.org>
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
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 7b434e2ee640..cf675a00e391 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -56,9 +56,6 @@
 /* QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR register bits */
 #define IRQ_CLEAR				BIT(0)
 
-/* QPHY_PCS_LFPS_RXTERM_IRQ_STATUS register bits */
-#define RCVR_DETECT				BIT(0)
-
 /* QPHY_V3_PCS_MISC_CLAMP_ENABLE register bits */
 #define CLAMP_EN				BIT(0) /* enables i/o clamp_n */
 
@@ -111,7 +108,6 @@ enum qphy_reg_layout {
 	QPHY_PCS_STATUS,
 	QPHY_PCS_AUTONOMOUS_MODE_CTRL,
 	QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR,
-	QPHY_PCS_LFPS_RXTERM_IRQ_STATUS,
 	QPHY_PCS_POWER_DOWN_CONTROL,
 	/* Keep last to ensure regs_layout arrays are properly initialized */
 	QPHY_LAYOUT_SIZE
@@ -124,7 +120,6 @@ static const unsigned int qmp_v3_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_PCS_POWER_DOWN_CONTROL]	= 0x04,
 	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= 0x0d8,
 	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR]  = 0x0dc,
-	[QPHY_PCS_LFPS_RXTERM_IRQ_STATUS] = 0x170,
 };
 
 static const unsigned int qmp_v4_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
-- 
2.35.1

