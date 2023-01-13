Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1831669691
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 13:12:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232678AbjAMMMw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 07:12:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238573AbjAMMLr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 07:11:47 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AADF07DE0A
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 04:06:12 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id y25so32813123lfa.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 04:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mmxbEU7yNm32Cz9XwGJP6LlPVKtTRmfgxQ+3IPRboCA=;
        b=RgOWW5w6/FtVAooz9c1Wm+dFGjj/5RU9DrqMWd63dhcOSGts0cqiahNtYvUS4TU39f
         1TS5hGPWncrwTzQ/xK5PmrMTIjFrGe0H5MwCJTlAxUtUxRvtrgQGaAVGO8smOrpKUfch
         y1hI14wgyVr2xJAFOc9Z9TdZJIU4YoUmaKUClu0NC8eiSIZmi/A7D25LUg1pdot0RvZ8
         kklAV8cBL/rDmXWXE/NrLZXufi4JSiOYav2pZKrtcn8zALdqQxQgDZ+wJjlbNfc1z2iY
         gi+MwzhvO7SPpR2Om0Pd2R3jA4sUBKNTAvRCKOM2qvkEUIjDkQhoI6sMWryQ2W8i+El4
         RXbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mmxbEU7yNm32Cz9XwGJP6LlPVKtTRmfgxQ+3IPRboCA=;
        b=xGlh3gINrHAHRnyGSagyqahEKFcUFUdKmMCAfV1LdyypKe8Ge/YyF6R+lW25FsIbO6
         4XnXspegDTFirbbpkEyRpKaH2gbJE5UxUoLsnRKApuaeFAU+se4ALWZQ8eVkA3DmneLo
         YbJt8VhQGJTMntX4kDJkZwaINYqLc+XRXY95005gH+eejLInaSRnzlSfIhN8QIGSd0Zs
         AumAP8TcyBfkcFlX/9X1ALvK2GgG/JCkPGwN7gN7hVAkje0ts24mxpd1fLtS3+EcAxCm
         U2f31ZNHJIJm95hv4ivi2gS9L4UQSI8048NDfAUkvkJML2uCOn9FSar1TVgg9cdL7kkA
         ZaFA==
X-Gm-Message-State: AFqh2krlA0G7PqkdJ4MSRoYHgTVtGmKBHY/R/3eqgvJyW9xNCiPqXDpU
        yzaHzyuMp9gKkAoGfEHt3rr85Q==
X-Google-Smtp-Source: AMrXdXtLYd/k7aJYj73HtecfF31AhEXVeOHWBBDIKrBb2k1+Wjp3Vgedt0G4DHRiJN6FCsRSk97fPw==
X-Received: by 2002:a05:6512:2344:b0:4cb:90d:41b1 with SMTP id p4-20020a056512234400b004cb090d41b1mr21249865lfu.56.1673611571086;
        Fri, 13 Jan 2023 04:06:11 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.170.82.205])
        by smtp.gmail.com with ESMTPSA id i7-20020ac25227000000b004ac6a444b26sm3806290lfl.141.2023.01.13.04.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 04:06:10 -0800 (PST)
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
Subject: [PATCH v3 02/14] clk: qcom: clk-alpha-pll: program PLL_TEST/PLL_TEST_U if required
Date:   Fri, 13 Jan 2023 14:05:32 +0200
Message-Id: <20230113120544.59320-3-dmitry.baryshkov@linaro.org>
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

Program PLL_TEST and PLL_TEST_U registers if required by the pll
configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index f9e4cfd7261c..e266379427f2 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -358,6 +358,11 @@ void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 
 	regmap_update_bits(regmap, PLL_USER_CTL(pll), mask, val);
 
+	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL(pll),
+						config->test_ctl_val);
+	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL_U(pll),
+						config->test_ctl_hi_val);
+
 	if (pll->flags & SUPPORTS_FSM_MODE)
 		qcom_pll_set_fsm_mode(regmap, PLL_MODE(pll), 6, 0);
 }
-- 
2.39.0

