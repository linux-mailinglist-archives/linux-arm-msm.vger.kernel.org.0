Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5696662A71
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 16:48:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236699AbjAIPsJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 10:48:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229824AbjAIPrd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 10:47:33 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 492E917433
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jan 2023 07:47:27 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id g19-20020a05600c4ed300b003d9eb1dbc0aso4256277wmq.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jan 2023 07:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MTJXmNvbTcT89bcSnjaUr7kokclVbE/uDnYILeaGTJs=;
        b=y8MaRHW70+d//7sJkhxiaHBBMPNZR5Iq8YXvFTSUghIC45Xt/aSsmvz+L66if8LqnO
         bdYMxm34U7jGUKlVNyH55ys2tAIncPB4kb3m2+TvUWDNPCx2V0fe1FfTvYY93DR2yYUH
         VTadja7FHUfGn3bgv/aD06jr2QodjjHzlxGlhOK8LjeVkijARIMykcFCgHpi8LBmREbd
         +Vy2skUfj+4X/D588J2Csz+40n0PtJ87xQWqLzb/bCfLlMD3+kt/o5QWcgVK3Q02N/JO
         mueHjZIuvaax3E/c+BfNKA65k8MX/u80kL7FPbqRvwEszYPhX/ly04mpF/xO8wVQKZJ0
         ufrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MTJXmNvbTcT89bcSnjaUr7kokclVbE/uDnYILeaGTJs=;
        b=mAMcfEa4B/RjjY1d0Wh4IxVZ4m+WtnENMluuMjFs1/2s0lQpmcV1Di8FpHilfvvkNb
         3XhNoRkd+wdMqwv+hqwoLQHWsOG6E7jZv0pVXy7b519+PbssGM9q1FzgoAQNgZ/gtBL9
         RFLy3ms0RCqBMDxN1WLW3s198gp5+UdHgZxL+p6tehZ2aT7xQb2k94UKmUpKsh1iWz+a
         nknF7Ue87KR2JBaGJrQt2C1ujZ3dpXixaz1jLnsW73vbg6lcJW8D68IOseG51juw9kFK
         94a5WSrY4mQpuYDQIQkzjuGNvo7jbmHTQDtwVx8y8fRHqG9PwuBGya+q2TBf1IP1Esus
         3mmQ==
X-Gm-Message-State: AFqh2kqtfhnDJJABh1eL99qaCeo0hCUivP1epwi45s1x98ILv083k7j7
        iyZlC4o97zW62jUY9hVPtH0Log==
X-Google-Smtp-Source: AMrXdXs/utoTT9sW9ClFSZZf6K3muRTYtSj7Q8Q9tBdZJFCV2rApztR5jO+gKoDyvUgnH21XECJBcQ==
X-Received: by 2002:a05:600c:54c6:b0:3d3:4ead:bb07 with SMTP id iw6-20020a05600c54c600b003d34eadbb07mr46390155wmb.5.1673279245851;
        Mon, 09 Jan 2023 07:47:25 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id q1-20020a1ce901000000b003b3307fb98fsm11479928wmc.24.2023.01.09.07.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 07:47:25 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Mon, 09 Jan 2023 16:47:22 +0100
Subject: [PATCH v3 2/3] clk: qcom: clk-alpha-pll: define alias of LUCID OLE
 reset ops to EVO reset ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230103-topic-sm8550-upstream-dispcc-v3-2-8a03d348c572@linaro.org>
References: <20230103-topic-sm8550-upstream-dispcc-v3-0-8a03d348c572@linaro.org>
In-Reply-To: <20230103-topic-sm8550-upstream-dispcc-v3-0-8a03d348c572@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.11.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add an alias of LUCID OLE reset ops to EVO reset ops similar
to other aliases.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/clk-alpha-pll.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 2bdae362c827..c67cfda27ecb 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -162,6 +162,7 @@ extern const struct clk_ops clk_alpha_pll_zonda_ops;
 
 extern const struct clk_ops clk_alpha_pll_lucid_evo_ops;
 extern const struct clk_ops clk_alpha_pll_reset_lucid_evo_ops;
+#define clk_alpha_pll_reset_lucid_ole_ops clk_alpha_pll_reset_lucid_evo_ops
 extern const struct clk_ops clk_alpha_pll_fixed_lucid_evo_ops;
 #define clk_alpha_pll_fixed_lucid_ole_ops clk_alpha_pll_fixed_lucid_evo_ops
 extern const struct clk_ops clk_alpha_pll_postdiv_lucid_evo_ops;

-- 
2.34.1
