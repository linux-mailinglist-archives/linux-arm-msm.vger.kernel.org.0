Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB1575EE9FB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Sep 2022 01:10:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234105AbiI1XKl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 19:10:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234124AbiI1XKd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 19:10:33 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 867384C601
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 16:10:32 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id x29so15969374ljq.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 16:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=IHaEFwV8p7aNv8BSTump+u3lPC9NqeTi4ZBra1/OpNk=;
        b=tPY/yU5FeAWcfibRCRxN4qU9S7wMlyr33SkbR6oOVxATszE0EPaX7IFuOHeGik9zju
         6uF5XgkP61gTfTUM3MEpb7dIgqwCCh2JXIzWM9n0i6D5JjHQKRLfkv1Qut8uZXaIN3C1
         QNQJIMjD8gYSYtwe1M2LqtUEySA1G1xhR2NpxO/p+IjY7i+JePil9Qh+I7hKrhH/M4+v
         m+gyK0VzYIQZTAbCum0gJ7FgmqGvV+v2ZcNuaIb/nofk+qCCRSkIXwrJQymbWoM/Lw7t
         Rm5Yh6NqTXF+UVHgQw3K104pwx5iQyH3JgZ9J2mpVxmNkajoF8NoFM5nzIFW+WxJK0lK
         OWiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=IHaEFwV8p7aNv8BSTump+u3lPC9NqeTi4ZBra1/OpNk=;
        b=Cs1J0+5tGWIbI0YdfHWgHXK6zgcfd5+cdLCjN5YEw2HZo2o+GhPPnaFqzYtkq26o99
         VACkAm2PIwK5yUOxa5ASC+lOBdFygw39f5/b25en+/Ev2/unbRDH1H3LcSR64ZoURRwV
         H5CMSC84ezhDssaBb6DUEa0y+kS+RcgqDXLeG+khfT4keKwFpUlg6hLpuXJP7L2EmJCj
         UhN+bzQIRA+vR08slcR5+xo7omagAAdiNyLmxsGxV7rA/AzdVpXFeBHdFpz+zbAEJFxu
         s+msNVgsuYK/7245UKmXN+xFTp3CsodOPQaPraxiX5dn+3up6iEf0y1awl4cus7OJ5qW
         lSOg==
X-Gm-Message-State: ACrzQf2FyMgj1XqkcGtyiZ29SKDHuHuH0oHLmrTc9ps4uV4T42uI1Gho
        1Rcv66R47o0JsGgHISvS1O0TmA==
X-Google-Smtp-Source: AMsMyM4ywhnlEulwv9aPuhSpqjsYpmOvm2q8A0nXqJw60AF+LHsdX2GLrrLZKERsNwTI4Y9pWF8qNw==
X-Received: by 2002:a05:651c:110c:b0:26d:a099:8715 with SMTP id e12-20020a05651c110c00b0026da0998715mr66390ljo.44.1664406630924;
        Wed, 28 Sep 2022 16:10:30 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o16-20020ac24950000000b0049d5733fb3fsm597587lfi.212.2022.09.28.16.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 16:10:30 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 16/18] phy: qcom-qmp-combo: remove QPHY_PCS_LFPS_RXTERM_IRQ_STATUS reg
Date:   Thu, 29 Sep 2022 02:10:12 +0300
Message-Id: <20220928231014.455201-17-dmitry.baryshkov@linaro.org>
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

The QPHY_PCS_LFPS_RXTERM_IRQ_STATUS register is not used, remove it from
register layout.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index c30af34d7f65..64cf43901d64 100644
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

