Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3C806621E2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 10:44:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234477AbjAIJoY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 04:44:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236008AbjAIJoQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 04:44:16 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46EA6766C
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jan 2023 01:44:15 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id bk16so7514154wrb.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jan 2023 01:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MTJXmNvbTcT89bcSnjaUr7kokclVbE/uDnYILeaGTJs=;
        b=FrBnF3rWRk7bzbwUWmQMpOyScdM5qv/9A4MjtMCsSPe0Ppim5rppW6/fU1rqtRZeB4
         pI9pBgWO0YafRhWyWp0rijk8Ti8S+0Tp5dV4xglP0Jgdm91EoPF7tE+fs2par/9eFA++
         FR1Qf1vU0TIIHNLsdJ7y3ATumITrcjBWbXrO383oujAzC7ve09968aV+QizW5uDKAXNE
         wBGozIWjTkHz3PP4+CLeZ1RPoQWJfYxOHYpzTS2hO4w5lYa1TnFpLUfr7id9rFVGtd5N
         UJaDxfpt/dtitb5Vo5QbE2lML8rSmhJn+6/inKCF8dydRYrqQ7/WL5J5rmQQlb8x9Ei1
         neOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MTJXmNvbTcT89bcSnjaUr7kokclVbE/uDnYILeaGTJs=;
        b=d8mO0oCsXN7UdqhaSkZ4Ufx9T2Wxr4OC9QtNPnGC2Wvo0GIbDVMNbfKfo6KEKHftfS
         FLmeyk/AjGaDyOK8RYZwXxJt/I2QT6aR4KN8yS6aU1pKlodhmq8ZurJPz6Q6n3qePz0o
         SCKRbJI6NHhVUN8xy+tNFD1K7SIhlt0qH4okFGb8rl6rKUVZj/Haai5nMQJW7cXPodQQ
         mUQAJbRs2e0nah5RtBQ55f0WWAMoL/mlfhXYb+IPat+bVqcx1KnA70cBkucmDPj7qB/y
         ZJp3hUwNEiRb5FE0AmdDAhHyaAXuWs9F408vN09y0mc3LCUAM0yHl//uTPTXhi+nWtmR
         mKEA==
X-Gm-Message-State: AFqh2kr3wCj0XmD/gR8p6n1pCdhnpe4JgzbH1FJWJXmC07um7TtRAKQz
        jtPHEleSxWYaKnJ19RhVulOdsw==
X-Google-Smtp-Source: AMrXdXtfo1Jxt/b7bOLVybmtxtbfEiF4LdN1IU+wKfRkYws4TSJAjIE/jFfpSiY9oCtFZlGuhLXFog==
X-Received: by 2002:a5d:488b:0:b0:242:5ae0:5b41 with SMTP id g11-20020a5d488b000000b002425ae05b41mr41463424wrq.33.1673257453873;
        Mon, 09 Jan 2023 01:44:13 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id f7-20020a5d6647000000b002bbeb700c38sm2965185wrw.91.2023.01.09.01.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 01:44:13 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Mon, 09 Jan 2023 10:43:29 +0100
Subject: [PATCH v2 2/3] clk: qcom: clk-alpha-pll: define alias of LUCID OLE
 reset ops to EVO reset ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230103-topic-sm8550-upstream-dispcc-v2-2-786ddd8785a2@linaro.org>
References: <20230103-topic-sm8550-upstream-dispcc-v2-0-786ddd8785a2@linaro.org>
In-Reply-To: <20230103-topic-sm8550-upstream-dispcc-v2-0-786ddd8785a2@linaro.org>
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
