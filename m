Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDCE377963A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Aug 2023 19:36:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236881AbjHKRgD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Aug 2023 13:36:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236888AbjHKRf6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Aug 2023 13:35:58 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0520735A7
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Aug 2023 10:35:56 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4fe28e4671dso3566012e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Aug 2023 10:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691775354; x=1692380154;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HfLubtIZQvKVY12cc57BekhKmhGyPc6/U2LUN7lhfrA=;
        b=U0RYkZbgCV+ewevBcG3e7HsxvLS/XZARb7kBYWlc0OxjDKoxcLzLoxxoX4B/lSrJYj
         EIvxjmi2LKI5K8tvRIs9Pw4+TgCalY4accvuq5U8dnwGq9ghybBjGxr14m0Wc/TXe3aq
         Ey0tb7qCjMG5YDINhoh3zr7GlzxcXrrLI6Sf+B08NdJj+Ql5Jh24TONXCt3S0dbxh4DH
         s4M1Sdv+W865gwXAE1DVRHtDEdvfFdSfYs68MtCEhZYVQt1NIwdH+CBEQ9pnGC0xZCk3
         LdsM1AJ4daiuWUuT1tJNS42lvKsy98+43labV1L/WZBwA3mDd5u2uL30qqXnjETGqNEP
         VZjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691775354; x=1692380154;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HfLubtIZQvKVY12cc57BekhKmhGyPc6/U2LUN7lhfrA=;
        b=MzzjTujGwWUXCirhe/gRwgbBtYAH9c21JPBJptlBTU67ynT8ygIZUIzIOr4gT+3Usf
         ggMHgL++OtOXbR/rRcfJN2LRcNLtFuxfeHgoPfdr22AGYeNu8jG7qB2g5J7+osbJZulI
         dPImtvmujQEG2je4cEdm9PZjYpctJEhg84TLQBnsHi97mbbMcKSFkWH1gC09kadysc//
         ZXRXnlWwRIAfem9Y3S5rqxfsql+Y3JLRP+PNQinGzmCFVfwcNFGC5z3seGtOjtDXe4HP
         9etGSBPZb9LZxwfN1jLOUvoWQitVOruUS4izLNrNseZ4aV4BNMApEzeZR0wv5G3dcQgV
         qp7A==
X-Gm-Message-State: AOJu0YygFHrQy5NNczB4s8+pkr2Cb6Sv7o+uakCjxHOOXRDErlO319Lx
        E5MFD8Hj8/PWuIk3u0X8B4yAuQ==
X-Google-Smtp-Source: AGHT+IEbD/J7ZLWBC5U/ZB6nTgtXG8QaCBYxNJPvOeVzlq+rlliPkTdRR3iw24nHnWN0PtxaqE8jdA==
X-Received: by 2002:a05:6512:33d5:b0:4fe:3364:6c20 with SMTP id d21-20020a05651233d500b004fe33646c20mr2490195lfg.16.1691775354237;
        Fri, 11 Aug 2023 10:35:54 -0700 (PDT)
Received: from [192.168.1.101] (abyj188.neoplus.adsl.tpnet.pl. [83.9.29.188])
        by smtp.gmail.com with ESMTPSA id v19-20020a197413000000b004fdfeee003csm794976lfe.228.2023.08.11.10.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 10:35:53 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 11 Aug 2023 19:35:53 +0200
Subject: [PATCH] clk: qcom: gcc-sm8450: Use floor ops for SDCC RCGs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230811-topic-8450_clk-v1-1-88031478d548@linaro.org>
X-B4-Tracking: v=1; b=H4sIAHhx1mQC/x2N0QrCMAwAf6Xk2UC7Tan+iohkbXTB0o5Wx2Ds3
 xd8vIPjNmhchRvczAaVF2lSsoI7GQgT5TejRGXobNdb7xx+yywB/XC2z5A+6Mk7e4kcabiCRiM
 1xrFSDpNm+ZeSyrnyS9b/5f7Y9wO+7RcTdQAAAA==
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691775353; l=1261;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=PX0bPY4Yk70OpSIODbp0s8wfu2ffU9qawAOfbJJPy7I=;
 b=7G+QXuBhurMxCmWUUbDQtLVIN1NB+HTz+q3r3hPjodip+cs+TJzInqx7DzYzITpBJPtMCDfUF
 +ljqwYrGwGTC/AEhy96cr2fh/8h/JlG8GzSF1tJ/0NiVaAW96aihonj
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use the floor ops to prevent warnings like this at suspend exit and boot:

mmc0: Card appears overclocked; req 800000 Hz, actual 25000000 Hz

Fixes: db0c944ee92b ("clk: qcom: Add clock driver for SM8450")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/gcc-sm8450.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8450.c b/drivers/clk/qcom/gcc-sm8450.c
index 86ad085260db..563542982551 100644
--- a/drivers/clk/qcom/gcc-sm8450.c
+++ b/drivers/clk/qcom/gcc-sm8450.c
@@ -936,7 +936,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
 		.parent_data = gcc_parent_data_7,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_7),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_floor_ops,
 	},
 };
 
@@ -959,7 +959,7 @@ static struct clk_rcg2 gcc_sdcc4_apps_clk_src = {
 		.parent_data = gcc_parent_data_0,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_floor_ops,
 	},
 };
 

---
base-commit: 21ef7b1e17d039053edaeaf41142423810572741
change-id: 20230811-topic-8450_clk-8a8106deda49

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

