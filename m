Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2BFB661DDA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 05:32:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236800AbjAIEcr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Jan 2023 23:32:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234286AbjAIEcS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Jan 2023 23:32:18 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2160EE0BA
        for <linux-arm-msm@vger.kernel.org>; Sun,  8 Jan 2023 20:17:31 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id bf43so11163046lfb.6
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Jan 2023 20:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6pepYcOlbjq1Fb0Er9Jysoq0IZv827b0yywGLQA/9UU=;
        b=Nb5Y935HdAir7vdoB+Zhez9YLUbhuwLxA+/NPY8CiCerWrEitZxANN9MolET7WN/b3
         du4YLGbIG62nSVtlqIetJanmoXAMHmJbfxNVoy14ZIytALyK/V9+omPbG5GrA/f3Q8pl
         UkcVCdAa7niotLFn/GzRcUXLxEWBgf0AvoE1tgVhlCO/86qefUj8sef46vaKy/CWGDK2
         EQjTlSjB8hD/X++mjEvEo/IPK4iteLgUQXKNcYAqlo8vdZ5FzFVY31K7RelXQ1lk1Zvf
         MZGkYCvSO136s4a0BdUewyWYtSGywzNP/+noym+Pu09nwYqz4oiH2EDR6GZUsnBzrYR6
         eTdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6pepYcOlbjq1Fb0Er9Jysoq0IZv827b0yywGLQA/9UU=;
        b=oEmv2jniBXKOkFQV80LCfcNmNRvL6gbPpBbIpCePSPdNdOOw6gqzz1Y9kcJWHLrXiT
         oTUbhFuYs/2eZIkeKZF0//ZUlZbv1hmf6/ZejKFFfyUEDlRtt0bW4X+tL2zSUR3EqESw
         jvGIqgLYv0ZgU/vHscB7TYskS62ZJiwcE5E0YpxPvqAKLFUrjIBQcxWdLT4yezQ4Knd8
         Dw+Q11pZT+tJ6At1ARzdilWpYVU/TkPnuQxJB6jpVgdyjFbwk7L6qFkQPi/GrxM0qZeb
         b6xhJoWDF25gtpngznllRMOjjEtUoXUxdrCEoUiaH/ZAikBdQwG8KNEFdRmTQSQ2PfdO
         nuJA==
X-Gm-Message-State: AFqh2ko8dGzlMLL0VAodLBxM1qqzL1AeEZ70S3MJRu4245M3fzxyVBIm
        5ETLllgIaCMzSTCFlWtfkEqR9E5685JxpzhQ
X-Google-Smtp-Source: AMrXdXvV02e4CGBP6DMQqSoNtB+DJhGxb5MWOcQnXZoEAN6yuYWCPusM8UnsPUoewZxK7psbONNpYQ==
X-Received: by 2002:a05:6512:3e10:b0:4a4:68b8:f4f0 with SMTP id i16-20020a0565123e1000b004a468b8f4f0mr20390606lfv.54.1673237849397;
        Sun, 08 Jan 2023 20:17:29 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id a15-20020ac25e6f000000b0049482adb3basm1397940lfr.63.2023.01.08.20.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 20:17:28 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sdm845: make DP node follow the schema
Date:   Mon,  9 Jan 2023 06:17:28 +0200
Message-Id: <20230109041728.308725-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Drop the #clock-cells (leftover probably from the times before the DP
PHY split) and rename dp-opp-table to just opp-table.

Fixes: eaac4e55a6f4 ("arm64: dts: qcom: sdm845: add displayport node")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 9e881e19b984..fa62479206ce 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4593,7 +4593,6 @@ mdss_dp: displayport-controller@ae90000 {
 					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
 				clock-names = "core_iface", "core_aux", "ctrl_link",
 					      "ctrl_link_iface", "stream_pixel";
-				#clock-cells = <1>;
 				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
 						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
 				assigned-clock-parents = <&dp_phy 0>, <&dp_phy 1>;
@@ -4619,7 +4618,7 @@ port@1 {
 					};
 				};
 
-				dp_opp_table: dp-opp-table {
+				dp_opp_table: opp-table {
 					compatible = "operating-points-v2";
 
 					opp-162000000 {
-- 
2.39.0

