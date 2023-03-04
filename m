Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D96FE6AA9F2
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Mar 2023 14:28:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229874AbjCDN2X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 4 Mar 2023 08:28:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229832AbjCDN2C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 4 Mar 2023 08:28:02 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2829D4
        for <linux-arm-msm@vger.kernel.org>; Sat,  4 Mar 2023 05:27:54 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id n2so6984665lfb.12
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Mar 2023 05:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677936473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u4xjt06WuAITrEBDOoRj+XcumFMWUoW9/PgZ8QRo1yo=;
        b=qsH57wZVqsviRiiy+sAvZQeDJz6JOSQJrqq7pMaajwjdJpKR7JK/3yyGLjDqV7Lkig
         iO8PZoTutgbJoXnqilTeWS4bVDXmAC4Nv0IEfKDUNAAIZfekEYcLM6BzTW6jOw7T+f7q
         YBsNc+N6DuEjFpJWygbDU6io212Mi4Czl18FYZ7Sn9747PMbEQMnXp9SFVNOQi/uzinB
         UW0QESCIcRiY4nyUjoA7kiZfDORGJRnRPV0p59lMErg/QIElhOz+JCGtl0XjpQEQJtKQ
         XCeSphFnAGb8CLVdy5rlBo3UEqQqKjXM2s/zST7VckzdR1At9NRDF4YsTsvaw7IQzr/3
         nxMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677936473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u4xjt06WuAITrEBDOoRj+XcumFMWUoW9/PgZ8QRo1yo=;
        b=fClmqXyuYV0U6ijOLp1uBtciLwOOR7YoSa3C6EQZqkqJ/dTyQmm5r0uHpm2Vkdpb9V
         K1CtzK4qOKBFC4bCki9rnXGxgWVzEJ19xW4xbmdZK4ePv0SbxPqJqOUhCU+JQ42FTdmd
         GzseKxmhhmTKIv1dQDhtHv+82ZqTDTacbaZv6/sCjyIs0YsC8PRYI7yk4a8azzUAd6WL
         RzGS3bRAwPfQIZZ4Sd0pX10k17tzUP3SgNRHwfAsI7pz/y9vYoQU0gXexOm6OZek3sHq
         GHwL5+HYSH1TABTO8+GghpV2JtU8iwFxvPpltgDzhrGIXNqRj71n4b1jnVS3lCOF2/zG
         7WdQ==
X-Gm-Message-State: AO0yUKU63AaRz10uwc+VyNwHh9n7TCzRTVBFi5n+aCZKD/tDUM6ZogGi
        cfVNe9Tq1eSA88+bCgk73bLcWA==
X-Google-Smtp-Source: AK7set/CTUB4TtljN8nsuZVG5WhmIRgCpK4mO2WAK+VtRvCPNoXzUk26JHKe87g1K3LvBAX57AuaQg==
X-Received: by 2002:ac2:508b:0:b0:4dc:4afe:1622 with SMTP id f11-20020ac2508b000000b004dc4afe1622mr1544781lfm.42.1677936473075;
        Sat, 04 Mar 2023 05:27:53 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id j15-20020a19f50f000000b004e7fa99f2b5sm342975lfb.186.2023.03.04.05.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 05:27:52 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Sat, 04 Mar 2023 14:27:44 +0100
Subject: [PATCH RFT 09/20] clk: qcom: smd-rpm: Add keepalive_clks for
 MSM8974
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230303-topic-rpmcc_sleep-v1-9-d9cfaf9b27a7@linaro.org>
References: <20230303-topic-rpmcc_sleep-v1-0-d9cfaf9b27a7@linaro.org>
In-Reply-To: <20230303-topic-rpmcc_sleep-v1-0-d9cfaf9b27a7@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677936461; l=782;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=yyAylWkjsHJ9M8f72hhFGXM7popO5Dzt7+QVKW2XYCk=;
 b=4+QXrXJyh0wapuYvuA1ri2hQ0axqyeo9BQ/+5lOsCyS4bb1RxeUj3NwF+dEOZcWUWkQy4hW3j2m3
 rZl1rasHBDo4YWi4Sy27GGjEbQTSzZpb44ZJDJHiJGqrB7bXJOA8
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MSM8974 requires that the PCNoC clock always gets an active vote.
Guarantee that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 6db78aeae9dd..a390ec3d6c01 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -686,6 +686,8 @@ static struct clk_smd_rpm *msm8974_clks[] = {
 static const struct rpm_smd_clk_desc rpm_clk_msm8974 = {
 	.clks = msm8974_clks,
 	.num_clks = ARRAY_SIZE(msm8974_clks),
+	.keepalive_clks = pnoc_keepalive_clks,
+	.num_keepalive_clks = ARRAY_SIZE(pnoc_keepalive_clks),
 };
 
 static struct clk_smd_rpm *msm8976_clks[] = {

-- 
2.39.2

