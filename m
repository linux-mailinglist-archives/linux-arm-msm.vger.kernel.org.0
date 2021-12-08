Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7926D46CACF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Dec 2021 03:22:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229481AbhLHCZr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Dec 2021 21:25:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233825AbhLHCZq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Dec 2021 21:25:46 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C9DEC061746
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Dec 2021 18:22:15 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id bi37so2564302lfb.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Dec 2021 18:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A28NpQx62660xbFHsS7Y/NYN52Y6d2zHm3km6spqAcA=;
        b=QPXHGIt8s6JpN2l+y92i2DtbE5YWNEE7wdCxJD8uZEdSkcavIRwIB8A7MVyna+238J
         HVE9gsBqyTvCBp8FOUWHoV6ZZURiFCGomh4k5HLK87H9STNtKYdMqQ8ewc1cG4W3iAO6
         SQ5fm1eltzIXWHCSP+UYvD4E9WXYhZEqBzUS6XbsUrbt0J7bf2Bjf5k1MCWBMuGTf1uK
         dTbmIHjF+hfDFaefgxb9nZL7cQraJ1MlOXAecGo0dfPnZNsQL9I9rDr3V5CgwitGcvxO
         Dk4NGEK2IwXwcGKLHb+MxAMXJfLMKlxL/BqolAoGx6Mfv3REIfYQRVxmGcGKCkuN/xQN
         KbkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A28NpQx62660xbFHsS7Y/NYN52Y6d2zHm3km6spqAcA=;
        b=SGc91lmaBm+oGfmA1XJXVZgeSygOuTP1NL3thxYs3jsIgDIZC5gdcrigKIGuq167VD
         h/ygKIKKpGL6P/lv/3E2jLQVioZXwYhasCLL/GniqHjN0/k9W8Ao8fKwkDEUxRsnnim4
         uaAOhgukYTlVdh6q3Ak4LCXhSJoWNsT0clxIQOnPAxFIPFk6XCMiDSUACZT1GYcS28r0
         iEugFXyUkMu+C8Tjr6vpfptuhemx/GJ/DADgVw1tfHq3av2fYcjHY17ZqNa2Hh8ArHUt
         2gvrmSTLchIck+NCD6AfaBMadJInsdipDy1NAV/xFAOsRtm5sxm+Sgvxr4x/YanROrYx
         M+2g==
X-Gm-Message-State: AOAM531W7Jmhr4zgH3qVcxQlpqE85V60llfHtn+j3WbUlnVnkfdLnCr5
        WPIhhgw0TX7unqbnhnN/1bo1Lg==
X-Google-Smtp-Source: ABdhPJwRZLhfImT9L33P6rokXze202juMqSpTINL7c5tiOVS8y1pBSxs9z9lTujsbSbxUx1KKVGfJw==
X-Received: by 2002:a05:6512:22d3:: with SMTP id g19mr43589323lfu.404.1638930133558;
        Tue, 07 Dec 2021 18:22:13 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o22sm114111lfu.274.2021.12.07.18.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 18:22:13 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 2/2] clk: qcom: dispcc-sdm845: park disp_cc_mdss_mdp_clk_src
Date:   Wed,  8 Dec 2021 05:22:10 +0300
Message-Id: <20211208022210.1300773-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211208022210.1300773-1-dmitry.baryshkov@linaro.org>
References: <20211208022210.1300773-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

To stop disp_cc_mdss_mdp_clk_src from getting stuck during boot if it
was enabled by the bootloader, part it to the TCXO clock source.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/dispcc-sdm845.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/qcom/dispcc-sdm845.c b/drivers/clk/qcom/dispcc-sdm845.c
index 735adfefc379..f2afbba7bc72 100644
--- a/drivers/clk/qcom/dispcc-sdm845.c
+++ b/drivers/clk/qcom/dispcc-sdm845.c
@@ -858,6 +858,9 @@ static int disp_cc_sdm845_probe(struct platform_device *pdev)
 
 	clk_fabia_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
 
+	/* Park disp_cc_mdss_mdp_clk_src */
+	clk_rcg2_park_safely(regmap, 0x2088, 0);
+
 	/* Enable hardware clock gating for DSI and MDP clocks */
 	regmap_update_bits(regmap, 0x8000, 0x7f0, 0x7f0);
 
-- 
2.33.0

