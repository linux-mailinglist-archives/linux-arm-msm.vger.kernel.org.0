Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9171266648B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 21:06:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234409AbjAKUFs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 15:05:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239533AbjAKUFN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 15:05:13 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBCA844350
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 12:01:38 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id m6so25185656lfj.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 12:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o9TfgZ8Zdbv763+42Ud+oVMz+eIqSvcSMEMLtjMi/xo=;
        b=P7Smr92zOlywwMa0St+UlpLwcsWQHyEqbTXUQbXpg60P4Oxg7QQs7e9KYMQXzoZm7L
         fKxQ30JxkitVEJ9JvXvOX42CZIidGbpxoJ8vwWe/2QqATTfjB8KMawPZPL09Xq7NH/Sc
         K2hBQLpKeN9G5afBRKUeRTLfpndCbmiYnzbx8xTGRu05TCQWVS7M8N49i8Lfe3zZU6NK
         nxgu7zxAlu+9ZhH9ywaD1bFeEMC7y8lV7eKV0GjPltwIzNguBkf1v5lNwbF3zwTrYw0f
         UXHNodFuO91ybKxu5Fyku3LipNKvVqWHtR78Y4Nep6H1P9TDz5XwOWtDGq0qVyG//N2S
         ftTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o9TfgZ8Zdbv763+42Ud+oVMz+eIqSvcSMEMLtjMi/xo=;
        b=CM88WoNbwOR08bxSYtB36qdwBDfCri3iUA72iDEzvQOlLoRWe1T3cC6+KOa+QHhXA+
         jREDv50uJfGDYI/uk+VoZhgxPG8hEwJpfq+uCH52uVoA1q5NP+8vOQVSJHmoera/ck/0
         4uvWSAICtgwvJhIBuqxfsncrpeH2Pn04t3b0UGrDl2hdPTUmmKNkHDl8V3VDfaPbTXvM
         QR46sBLfLb59iXC0TBztqY25v7sqcNw0VELRVYiJPqt4LKG9rgf4Qq0Dn4AacI6BwfE4
         HwqUawcV4XbyH9mdcAY3lRBiZ00QRsdYBkD5oI24JrX8KO1+aWvNX87Ucxd3U4sk+qpv
         hnBg==
X-Gm-Message-State: AFqh2kpDvQsJKJrNKuZ3xENWUNAUPH2YxTiF7Td3yujdq93pT8E4MJLZ
        71rN+qKQk5ZRImMLCC8sv2LWPw==
X-Google-Smtp-Source: AMrXdXvyYXcfYVDZQsuAoEWn//qYYYRt60Ia0I/JDej1xxCAqmJzYzMbJXK0nUliEPjY5B19npeLog==
X-Received: by 2002:ac2:430c:0:b0:4cb:10ad:76bd with SMTP id l12-20020ac2430c000000b004cb10ad76bdmr14049334lfh.64.1673467297308;
        Wed, 11 Jan 2023 12:01:37 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v20-20020a05651203b400b004b4e6dab30esm2881437lfp.222.2023.01.11.12.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 12:01:36 -0800 (PST)
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
Subject: [PATCH v2 12/14] clk: qcom: cpu-8996: fix PLL clock ops
Date:   Wed, 11 Jan 2023 23:01:26 +0300
Message-Id: <20230111200128.2593359-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230111200128.2593359-1-dmitry.baryshkov@linaro.org>
References: <20230111200128.2593359-1-dmitry.baryshkov@linaro.org>
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

Switch CPU PLLs to use clk_alpha_pll_hwfsm_ops, it seems to suit
better.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-cpu-8996.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
index 1c00eb629b61..b53cddc4bca3 100644
--- a/drivers/clk/qcom/clk-cpu-8996.c
+++ b/drivers/clk/qcom/clk-cpu-8996.c
@@ -128,7 +128,7 @@ static struct clk_alpha_pll pwrcl_pll = {
 		.name = "pwrcl_pll",
 		.parent_data = pll_parent,
 		.num_parents = ARRAY_SIZE(pll_parent),
-		.ops = &clk_alpha_pll_huayra_ops,
+		.ops = &clk_alpha_pll_hwfsm_ops,
 	},
 };
 
@@ -140,7 +140,7 @@ static struct clk_alpha_pll perfcl_pll = {
 		.name = "perfcl_pll",
 		.parent_data = pll_parent,
 		.num_parents = ARRAY_SIZE(pll_parent),
-		.ops = &clk_alpha_pll_huayra_ops,
+		.ops = &clk_alpha_pll_hwfsm_ops,
 	},
 };
 
-- 
2.30.2

