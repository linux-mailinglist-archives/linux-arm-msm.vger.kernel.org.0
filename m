Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 704376ADEC3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Mar 2023 13:32:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230235AbjCGMcJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Mar 2023 07:32:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230164AbjCGMcH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Mar 2023 07:32:07 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA86E76F67
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Mar 2023 04:32:04 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id d36so13685403lfv.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Mar 2023 04:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678192323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aPs2AsYZOYaw55T4/U7uB6HluDp2jLmqFur5Lgl7Udk=;
        b=lK7Eu/N/ysN2wh72dor8CsgesQs98RJOZna5u/ukEz1oLX8YRdNbNDRGc4jcyEMRKM
         4TfTARbnX6WoV0YH69UfNrmSwElbwyZrSqKbNwZ1V8MwedHXNeMdGIm7h/QQlLz9fV9l
         yTawG25BE1AjrcycBPi60mgp838z4VmStZpC1dR/+9lWjJ/p85l2lyDpIoTiQ0oHSmXu
         vIOuWX9mg+iiMBUN7N5fVDcfBLFMFbUM42f7sSzXxa11YrsSoLrT+Jj5Rnr7HnUr/+5R
         qdtk4y8K/I63delBF3PAs61PurOwHiYTHMW/BkVRn108GPWOeH4eh5XB+R7SMVDSu1Mk
         Nf7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678192323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aPs2AsYZOYaw55T4/U7uB6HluDp2jLmqFur5Lgl7Udk=;
        b=pcDIuEyo1rEJ4/xUD72JX2UW0Q40yD+TfhV6RMFzNx5wlC+4lh0+oOxgJO/+pTJjLm
         cMCs41kvt9uZv7x7EqrFe3gcGMd5EN7E3cKpVZ36hEHoxPiukpEjxS5FurowU7vu8SuX
         KGh4lYwREuueDBCmEHsExMmGZI3d9gfX4/LZY64RT9aHWhL+WD6QnZKgvEmxVa1AvKLC
         7YhN1BiRM/IUw/ODgzNa/K+E2i9UajdzCLtkEkmYp6kZ+Z2XjITmdAVFfj5K8gp9YUqS
         7uUIqbgeVRS4RFG1qH2U2VrPhHwtVVBKOE8ub4I8PFxxB2u0tTi8c8vHwEMPWb2xYDhd
         7SCg==
X-Gm-Message-State: AO0yUKW3iTcVX7gq5BThsmTYBHzgWcICr5Wj5JqiaT1uYZsQjdwdL8vs
        egVB1JelrKB8UiRFtWjS7PZjqAQY6iKEC4RYjV4=
X-Google-Smtp-Source: AK7set+U3njUjM09dNb3PhuIwUi7v92VZ3jxeQsc4pQp6g50/l2NlUMjFGNBfyAF+0AeOnOrTUXGgQ==
X-Received: by 2002:ac2:560b:0:b0:4db:2c28:8974 with SMTP id v11-20020ac2560b000000b004db2c288974mr3923462lfd.12.1678192322765;
        Tue, 07 Mar 2023 04:32:02 -0800 (PST)
Received: from localhost.localdomain (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id t20-20020a2e7814000000b0029462e98c07sm2156501ljc.35.2023.03.07.04.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 04:32:02 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] clk: qcom: gcc-sm6375: Update the .pwrsts for usb gdsc
Date:   Tue,  7 Mar 2023 13:31:57 +0100
Message-Id: <20230307123159.3797551-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The USB controller on sm6375 doesn't retain its state when the system
goes into low power state and the GDSCs are turned off.

This can be observed by the USB connection not coming back alive after
putting the device into suspend, essentially breaking USB.

Work around this by updating the .pwrsts for the USB GDSCs so they only
transition to retention state in low power.

This change should be reverted when a proper suspend sequence is
implemented in the USB drivers.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
v1 -> v2:
- Reword "fix" to "work around", mention it should be temporary
- Add TODO:

 drivers/clk/qcom/gcc-sm6375.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-sm6375.c b/drivers/clk/qcom/gcc-sm6375.c
index ad3c4833990d..417a0fd242ec 100644
--- a/drivers/clk/qcom/gcc-sm6375.c
+++ b/drivers/clk/qcom/gcc-sm6375.c
@@ -3534,7 +3534,8 @@ static struct gdsc usb30_prim_gdsc = {
 	.pd = {
 		.name = "usb30_prim_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	/* TODO: Change to OFF_ON when USB drivers get proper suspend support */
+	.pwrsts = PWRSTS_RET_ON,
 };
 
 static struct gdsc ufs_phy_gdsc = {
-- 
2.39.2

