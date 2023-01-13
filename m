Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0BDE669698
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 13:13:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241212AbjAMMNA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 07:13:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233011AbjAMML6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 07:11:58 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 966497DE00
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 04:06:46 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id bu8so32810009lfb.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 04:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cRgpyNZCiNK2oXTfGshioMNKAIlSBJK8yHdZdNBFUDg=;
        b=aoSjh2COawFwiwBbo0LtMpdLFZPDkhiPLt2JAas3Daz8GvO+W1UNtM6feIifCHJL0R
         L6cjZlV6SqdbEgMxkgD6mxUtIzrAPm4Z1wkCkHY5ZAreTAkEgt11fZTPyiRL35CDvpbG
         8Eaxj4Vl/858uxh1f1ydEQghiZiwYsWy5HPoSaAS/wr2EUV+uJ8gmhnXx9lD/cvO2OXK
         WQU7mBkS6yIry0IIDtwLD4HF1g6CZH7yexnijOZdZ8Frr+4KqlW9/Wi9UkImPqerViaS
         rg4wzc/bwLEpKu9A2HD60cim3jGcElqKJcbBkRFkDAuXZziLDARNrGIpTplkIAP+zhuD
         J/GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cRgpyNZCiNK2oXTfGshioMNKAIlSBJK8yHdZdNBFUDg=;
        b=CfLzUQswe5plngHKznFdFtEQJYvFPj8gtwIcukYWe4ZOM1QnlmZDE2J9NZskjD2zdx
         /RNdX2AEGgldjYoA0mzyzrAYbXBPu2OkJq8QNxrbEGee7zDa3JKIcpBDLPZ4mwHSleil
         OnsyX1rQI/dibHeqakgGLsM7M9KKbfoqHCYlcx4y5xJcmd5QVqYU5Zdk3NhuRfmMm5Tn
         wiNCl7S6pCpGwh/ToFnnaX8m3e9jpF8Zc/eRl1RYRQ/DOLTR6J8tjVVL5XIbuaLjBMlk
         d9cIBbWb9NQqHY7nlxu/32Gd2P1tq6x9Dcluc7c2oVP6m9wpfLBTLxDcFciZLumQsnUf
         KbNw==
X-Gm-Message-State: AFqh2krZFfd6FwqrZVzuaztxiVW9nSQQo5rjSbFCgpPK74QORy/ySfwS
        So/h6IczUfJbdey2/Vzyu/PEcQ==
X-Google-Smtp-Source: AMrXdXvxxlLoW2b+XCQojEFe220iqcZDT2wD+GZzrCLDY5PHn/tOBN8mO9AgiQK07M0g8zEkKH5SIg==
X-Received: by 2002:a05:6512:ac8:b0:4b5:b06d:4300 with SMTP id n8-20020a0565120ac800b004b5b06d4300mr25095169lfu.29.1673611604983;
        Fri, 13 Jan 2023 04:06:44 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.170.82.205])
        by smtp.gmail.com with ESMTPSA id i7-20020ac25227000000b004ac6a444b26sm3806290lfl.141.2023.01.13.04.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 04:06:44 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 04/14] clk: qcom: cpu-8996: fix the init clock rate
Date:   Fri, 13 Jan 2023 14:05:34 +0200
Message-Id: <20230113120544.59320-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113120544.59320-1-dmitry.baryshkov@linaro.org>
References: <20230113120544.59320-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Current multiplier (60) results in CPU getting the rate which is
unlisted in the CPU frequency tables (60 * 19.2 = 1152 MHz). This
results in warnings from the cpufreq during startup.

Change PLL programming (l = 54) to init CPU clocks to start with the
frequency of 54 * 19.2 = 1036.8 MHz which is supported by both power and
performance clusters from all speed bins.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-cpu-8996.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
index ed8cb558e1aa..d51965fda56d 100644
--- a/drivers/clk/qcom/clk-cpu-8996.c
+++ b/drivers/clk/qcom/clk-cpu-8996.c
@@ -102,7 +102,7 @@ static const u8 alt_pll_regs[PLL_OFF_MAX_REGS] = {
 /* PLLs */
 
 static const struct alpha_pll_config hfpll_config = {
-	.l = 60,
+	.l = 54,
 	.config_ctl_val = 0x200d4828,
 	.config_ctl_hi_val = 0x006,
 	.test_ctl_val = 0x1c000000,
-- 
2.39.0

