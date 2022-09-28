Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C92B55EE9F2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Sep 2022 01:10:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233739AbiI1XKc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 19:10:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233134AbiI1XKW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 19:10:22 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17BB32A95F
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 16:10:20 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id a8so22520584lff.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 16:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ZjxL8JpqOHRf8ei/lLU7w0LbF8sHURWW068haj65LQI=;
        b=BEFT7v8K9Bg0MxWasSUH0TmrXxEmqJZsGIaW0cNQxNckfDaV754Ck1/wJOUgLBdnC+
         PMP9vbdQt6bGW1WlHj94qzHSCuWFswKTinNoI3nXAmLpdeq9fwTSGNA8sRYxLX3fcFy+
         o4LYs19tEl4GuC0VobovD9PZBBO7Z+mtV0R5o0NqzGs83cr+G9NNiiSb3Er0NdhMTk2p
         kf6U7kbKEVK9g3+FkV4xhzTGz0dPK3kz1N7Y4BPm1AjBIOGEQ3DKa04A/b513fGI8z3I
         JSGl49FIHTEUjkaCqXUEJWDmzB5bnVPNo+hIndzsNaocYcjEQEQIsfrHWZYx/z7KYmt+
         nPXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ZjxL8JpqOHRf8ei/lLU7w0LbF8sHURWW068haj65LQI=;
        b=gUh1LnV0KMXOdku0dcCcNQBwCnovMfhri2ogPDb7qk17Nh5gT0QAiiQ5UWPoQFVC58
         627TFLPFaLmNg8xEMjx9XAyDwvKgddpP43vSosK4y1XvSFuR5pLCsZ0Y6fq0IPNMD6uO
         IyFJqnTItU8lEUNiFK6iRvvAAlzi5ktyL9wALWz0jX08rZivPw8fZb/80x9/JfiX+lOL
         a7+rQWv+SY7sAlnrHXC3pFmeyT8oIejJf6qZ4JD2a7Lis1XfvOMg5PUP3Fq6OUl8nM5r
         ohiLxaJ0zpy2pgluEtJGa11054/RV44FSTtNFs9pOiQ4Kq/MfABzIjsIFCXtLFxYBLdq
         M4vg==
X-Gm-Message-State: ACrzQf16ZGkGRqRXLIumAWQBplKCCuU1bvSE6a53INM1A4bQU5UJRXwR
        ko0hQNEjW5t7J6r5lpzUCbfZOQ==
X-Google-Smtp-Source: AMsMyM4NdRvm4xr7ZI4GnHs6jRWy5XWglseDufrHYmKdy8F5VUdPauguGjg8r/Vm/bx/i7sgwoPHWA==
X-Received: by 2002:ac2:5e3c:0:b0:49c:9cc3:a530 with SMTP id o28-20020ac25e3c000000b0049c9cc3a530mr121587lfg.486.1664406619262;
        Wed, 28 Sep 2022 16:10:19 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o16-20020ac24950000000b0049d5733fb3fsm597587lfi.212.2022.09.28.16.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 16:10:18 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 04/18] phy: qcom-qmp-combo: clean up power-down handling
Date:   Thu, 29 Sep 2022 02:10:00 +0300
Message-Id: <20220928231014.455201-5-dmitry.baryshkov@linaro.org>
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

From: Johan Hovold <johan+linaro@kernel.org>

Always define the POWER_DOWN_CONTROL register instead of falling back to
the v2 (and v3) offset during power on and power off.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 9807c4d935cd..c30af34d7f65 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -121,6 +121,7 @@ static const unsigned int qmp_v3_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_SW_RESET]			= 0x00,
 	[QPHY_START_CTRL]		= 0x08,
 	[QPHY_PCS_STATUS]		= 0x174,
+	[QPHY_PCS_POWER_DOWN_CONTROL]	= 0x04,
 	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= 0x0d8,
 	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR]  = 0x0dc,
 	[QPHY_PCS_LFPS_RXTERM_IRQ_STATUS] = 0x170,
@@ -1994,13 +1995,8 @@ static int qmp_combo_com_init(struct qmp_phy *qphy)
 	qphy_clrbits(dp_com, QPHY_V3_DP_COM_SWI_CTRL, 0x03);
 	qphy_clrbits(dp_com, QPHY_V3_DP_COM_SW_RESET, SW_RESET);
 
-	if (cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL])
-		qphy_setbits(pcs,
-				cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
-				cfg->pwrdn_ctrl);
-	else
-		qphy_setbits(pcs, QPHY_V2_PCS_POWER_DOWN_CONTROL,
-				cfg->pwrdn_ctrl);
+	qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
+			cfg->pwrdn_ctrl);
 
 	mutex_unlock(&qmp->phy_mutex);
 
@@ -2153,13 +2149,8 @@ static int qmp_combo_power_off(struct phy *phy)
 		qphy_clrbits(qphy->pcs, cfg->regs[QPHY_START_CTRL], cfg->start_ctrl);
 
 		/* Put PHY into POWER DOWN state: active low */
-		if (cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL]) {
-			qphy_clrbits(qphy->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
-				     cfg->pwrdn_ctrl);
-		} else {
-			qphy_clrbits(qphy->pcs, QPHY_V2_PCS_POWER_DOWN_CONTROL,
-					cfg->pwrdn_ctrl);
-		}
+		qphy_clrbits(qphy->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
+				cfg->pwrdn_ctrl);
 	}
 
 	return 0;
-- 
2.35.1

