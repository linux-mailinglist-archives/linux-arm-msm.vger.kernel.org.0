Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82A25615F5C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Nov 2022 10:15:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231330AbiKBJPv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Nov 2022 05:15:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231341AbiKBJPU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Nov 2022 05:15:20 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23E9A286E0
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Nov 2022 02:13:29 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id 20so15713745pgc.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Nov 2022 02:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z6bT5Xy6HJSVHzE3w5gAF7ODmVO+QE+Pvk+SDh7p/kA=;
        b=E3pcsNmKJwCHYP4+h8cp2Qdi0ZJw93oQ2eEiTNWjZrSfcGDGnfVsIuW/78DL8qIpgu
         JCyGeEIcLinSAAs92VkrT6MtUpexab0mwEAwwyV0wSrfDjZmsJ0uG4xGxyS1mT0qZI21
         ldp1QWbxcfaWqcv6AMHUfjYVS9AXfgZ6szI9K/QFplxK5bdfdDd7xtNnWoz/uSaTXcaF
         o450nTqt1yA5lE+/R+GloJYJlNpzJyIm8WIVPEvHSES6vXDHpj/HOsYh209vN0QaFIo5
         V9LiLPX+DCRCRpgnJwAXFAniMJZcb/7UcPCWUC2orU9Hxkp+CFaVbkXKaGXvWY4zQbSL
         NhAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z6bT5Xy6HJSVHzE3w5gAF7ODmVO+QE+Pvk+SDh7p/kA=;
        b=pPkIJHz+p+jhHhPqLxE561PGbGU2WEecRx/8bWV2vvT75J0N5eHi325ymYnYxdOGYA
         kfSE7DJK+OjEk4gt9GOkVjMTBMCrivWc7ne50cbZ9xhsjGkvxfkxH7oqy++dsyzVk3pm
         6523a2jCDZEi7bQhwH1uANX0eAxNzxlwcuq6JFvokSA0wMPNxWZ7AX9bXNJ1cnAhBYxK
         /ZxitYq8SIObyW3iqZthTX4Q2OBREIn/jLNx22ErADm+5NwC9M+aE31uQlszKxY/jrUm
         X7uVwjFKshic2+8cCBOrAqJjCrkWyRxDF/DkAT+q0FhAwAAH5VGGEGh5XxtPhSg2j6fR
         KOqQ==
X-Gm-Message-State: ACrzQf22Qp5xfUUqQbx219OdVgzHwI5Ch7VUJGoZjdVkSwI2ysqdJa1E
        5xo58zfL90tvm4GTIaPITK0HNmV4lr9I
X-Google-Smtp-Source: AMsMyM60KpzKt0yB7l73uqhrr+KKKC15Y6Stqq2UU7CyxVz3h8qGMEbpZm86IpTPJAbryyd5G3nJnA==
X-Received: by 2002:a63:187:0:b0:43b:cf3c:c64d with SMTP id 129-20020a630187000000b0043bcf3cc64dmr20511639pgb.359.1667380408555;
        Wed, 02 Nov 2022 02:13:28 -0700 (PDT)
Received: from localhost.localdomain ([117.193.209.178])
        by smtp.gmail.com with ESMTPSA id n4-20020a170903110400b001869394a372sm7847689plh.201.2022.11.02.02.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 02:13:27 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org
Cc:     konrad.dybcio@somainline.org, mturquette@baylibre.com,
        sboyd@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2] clk: qcom: gcc-sm8250: Use retention mode for USB GDSCs
Date:   Wed,  2 Nov 2022 14:43:20 +0530
Message-Id: <20221102091320.66007-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

USB controllers on SM8250 doesn't work after coming back from suspend.
This can be fixed by keeping the USB GDSCs in retention mode so that
hardware can keep them ON and put into rentention mode once the parent
domain goes to a low power state.

Fixes: 3e5770921a88 ("clk: qcom: gcc: Add global clock controller driver for SM8250")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---

Changes in v2:

* Added Fixes tag (Stephen)

 drivers/clk/qcom/gcc-sm8250.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8250.c b/drivers/clk/qcom/gcc-sm8250.c
index 9755ef4888c1..a0ba37656b07 100644
--- a/drivers/clk/qcom/gcc-sm8250.c
+++ b/drivers/clk/qcom/gcc-sm8250.c
@@ -3267,7 +3267,7 @@ static struct gdsc usb30_prim_gdsc = {
 	.pd = {
 		.name = "usb30_prim_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 };
 
 static struct gdsc usb30_sec_gdsc = {
@@ -3275,7 +3275,7 @@ static struct gdsc usb30_sec_gdsc = {
 	.pd = {
 		.name = "usb30_sec_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 };
 
 static struct gdsc hlos1_vote_mmnoc_mmu_tbu_hf0_gdsc = {
-- 
2.25.1

