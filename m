Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CBBC2EFCC0
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Jan 2021 02:33:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726098AbhAIBd6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Jan 2021 20:33:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726077AbhAIBd6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Jan 2021 20:33:58 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0446C061574
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Jan 2021 17:33:17 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id b26so27348757lff.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Jan 2021 17:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TGGL7MRmQ1s/aUig13t2N3SebYQRAiSHRFEw3Tw7vUU=;
        b=oLncZA0VOxrBENvLxfad/vGxEmTu3VxjK+jyfd+6NyyR5nwksNus90IADtOC8RrNTR
         YUO9Y4wdY98wrCS5CNhD34MmfaasfdZHADXs/IqhiSQXYD4H7sWiYc3SHWdlK/W6P4m/
         06W5oHou8Z2UI4JXG5swbTNjBmQqEVj5VmV0zleiTlY2mnHjM6PgW+TwDvkttv0b32OP
         VfbDi+p9bwfIvhhxl7rXy7F3ObRoY2UCo/4D5uby1i815vulg/UaJ97Gps+B2EcDkNhY
         0o6Eoxg0vHOjKxMYHCOrP24I0/djgM1xhvLrnQA6/0lJ339Y8lsF9pNcRQFOF7nhgqzd
         0C0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TGGL7MRmQ1s/aUig13t2N3SebYQRAiSHRFEw3Tw7vUU=;
        b=tg/fCBQ3jIfUoPk/8vkYVznLaCeJxhIDt6vINgPGms6l/Ar+HvtFP3ibN/uDq6tbwe
         weBc15dd+xTYN6/svOSgh3yCqt0DBCbnBQWBpp8hDODBhpCvLJ6WHbU0vvSJNfcaSnSI
         +94P7rrq22vIuTNhK/s0qz57Ao2z9uxJyJz0BdZUJs2B26Yl2a5DplK9Y6r9TxA5gvS3
         TssIm+W+aO3bB7cSE1BNCm+p75EvaewCMDLu/dIHHPwKcAWPrQZxMWFNMI2dm38x6fbr
         d24utSHJdzD0IRK+CSEFlEfMBJLGKiE85QzTuWcfweKIHR5zqiHB28Vy1vUu8wMJGe5j
         bJUw==
X-Gm-Message-State: AOAM533mm3HDfTHrx1ASlkRfhVHD1TBI5EOZY/Z8q7tPFG5HMSHRBPd6
        KzyZ7SMjDafIu98H2RI+HXPE6A==
X-Google-Smtp-Source: ABdhPJzAMB93IMXBMOBoiJnM0QcT6vQEB+xhIfti9AgxWh8qIdTppfGZXZ2vPNHA/02c29JDd5RGzg==
X-Received: by 2002:ac2:5e6e:: with SMTP id a14mr2607645lfr.127.1610155996160;
        Fri, 08 Jan 2021 17:33:16 -0800 (PST)
Received: from eriador.lumag.spb.ru ([94.25.228.99])
        by smtp.gmail.com with ESMTPSA id j23sm2197084lfh.194.2021.01.08.17.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jan 2021 17:33:15 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH] clk: qcom: gcc-sm250: Use floor ops for sdcc clks
Date:   Sat,  9 Jan 2021 04:33:14 +0300
Message-Id: <20210109013314.3443134-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Followup to the commits 5e4b7e82d497 ("clk: qcom: gcc-sdm845: Use floor
ops for sdcc clks") and 6d37a8d19283 ("clk: qcom: gcc-sc7180: Use floor ops
for sdcc clks"). Use floor ops for sdcc clocks on sm8250.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Fixes: 3e5770921a88 ("clk: qcom: gcc: Add global clock controller driver
for SM8250")
---
 drivers/clk/qcom/gcc-sm8250.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8250.c b/drivers/clk/qcom/gcc-sm8250.c
index 86381ea8e37f..8e79d0077b55 100644
--- a/drivers/clk/qcom/gcc-sm8250.c
+++ b/drivers/clk/qcom/gcc-sm8250.c
@@ -724,7 +724,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
 		.name = "gcc_sdcc2_apps_clk_src",
 		.parent_data = gcc_parent_data_4,
 		.num_parents = 5,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_floor_ops,
 	},
 };
 
@@ -747,7 +747,7 @@ static struct clk_rcg2 gcc_sdcc4_apps_clk_src = {
 		.name = "gcc_sdcc4_apps_clk_src",
 		.parent_data = gcc_parent_data_0,
 		.num_parents = 3,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_floor_ops,
 	},
 };
 
-- 
2.29.2

