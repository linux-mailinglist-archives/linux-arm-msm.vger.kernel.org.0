Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9269370B02F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 May 2023 22:23:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231149AbjEUUXb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 May 2023 16:23:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230521AbjEUUX3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 May 2023 16:23:29 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2A76E3
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 13:23:28 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2af2e908163so16714391fa.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 13:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684700607; x=1687292607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ByeCSFrNe87g7BfDBXhGdaN8aXwyz3oBdlfmR57lKKY=;
        b=xrh06FAgJiDHQA0f/6LrEkDmZvNeo4GXRTOwxbpdP5Zyvu2j69mldzDsfbkT31sDtm
         ZJGfQCiQY90iL7WJdI1/QWfBWyo5+9BsaWkUBOmi/V0x8bkZgUr6vKKHJIlvtPILcHo5
         NFaRvBqDoi1iGZX7dNp521BnuPDAXF7LbIQm2hIhUTWOcpGM7f6jUHiazH1CMAGhDuK1
         cg/XBlXsKaAd2y+5cyTtZ2KKJpIDW9x3ig8QxJPFhJIgzMVEBkgrSkKBQ9PmDTb5UGWv
         od63vlPJCFBIa1jKWLj9gyMi7yGzMAwx/dj2Ylb76JfgzuTf5lmfrVz4BmOe68woQSRP
         N5iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684700607; x=1687292607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ByeCSFrNe87g7BfDBXhGdaN8aXwyz3oBdlfmR57lKKY=;
        b=C2FZBpIe597JPfZQbHWB1NJ+pTvZGhNmI2AXurvMELQLFXfNl78q/NwJ8551ASR0qr
         iIgm17IqVHoZZ7reKYoplny77MK1iq6mFTmPg04Vf/bIQA5h/irz+NELiifCXnxYACK6
         ob96wNLZhm+u8jZ4jp8Tg4saKzQf3Cj5Hdc/cSi3Q404ErGj1S0atSb5XSFodmGDzU29
         DmHsNkn2tBwRnxknrhTfcwOMlqSaXNcRzJ7AO5WISepdjDpvT1Lv1H/+GuYuEfkYPXUk
         9L4AccKMiYjvNHIKESTxreRS7ftD4QKqtHqPUkuqpar+f2j7gs+ayYIfeVXSkBhGM+Lm
         5+zw==
X-Gm-Message-State: AC+VfDyZDOz92S323uGS7vDIMrUaskK4JoQK8OvjJKQagGzlFFz8PHJ/
        1qO1HQjdHwh2Ry8F6NO6rSwvIg==
X-Google-Smtp-Source: ACHHUZ4HxnBmmkPMKTeLTuKD0J45DS7Loa4n1N8hjxqYZ0MaDzlPWNem/ZoFBNEqlVWj4dJDUHd63g==
X-Received: by 2002:a2e:88d8:0:b0:2a8:c333:ebee with SMTP id a24-20020a2e88d8000000b002a8c333ebeemr2963054ljk.49.1684700607075;
        Sun, 21 May 2023 13:23:27 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u23-20020a2e91d7000000b002adb566dc10sm835589ljg.129.2023.05.21.13.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 May 2023 13:23:26 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v3 06/10] arm64: dts: qcom: sc7280: link usb3_phy_wrapper_gcc_usb30_pipe_clk
Date:   Sun, 21 May 2023 23:23:17 +0300
Message-Id: <20230521202321.19778-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230521202321.19778-1-dmitry.baryshkov@linaro.org>
References: <20230521202321.19778-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use usb_1_ssphy's clock as gcc's usb3_phy_wrapper_gcc_usb30_pipe_clk
clock source.

Suggested-by: Neil Armstrong <neil.armstrong@linaro.org>
Fixes: 1c39e6f9b534 ("arm64: dts: qcom: sc7280: Add USB related nodes")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 31728f461422..5f8a94dd74d2 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -848,7 +848,8 @@ gcc: clock-controller@100000 {
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&rpmhcc RPMH_CXO_CLK_A>, <&sleep_clk>,
 				 <0>, <&pcie1_lane>,
-				 <0>, <0>, <0>, <0>;
+				 <0>, <0>, <0>,
+				 <&usb_1_ssphy>;
 			clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk",
 				      "pcie_0_pipe_clk", "pcie_1_pipe_clk",
 				      "ufs_phy_rx_symbol_0_clk", "ufs_phy_rx_symbol_1_clk",
-- 
2.39.2

