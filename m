Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E551649B36
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Dec 2022 10:33:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231892AbiLLJdc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Dec 2022 04:33:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231858AbiLLJdY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Dec 2022 04:33:24 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EEE96313
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 01:33:23 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id a19so11919183ljk.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 01:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xN1LN8Q13bIGioRmVa1bu9PkrPkTjKd3uyYwlIhvFvM=;
        b=sqRK+DUkBbboDM1xjUfhDcSMwMKw02FtrsEce4gvw5gmTle3/0c9mxjQHV7PqlKoLl
         0v+vN217H4gyG8YsjgJ2cKFTqhAEfm3VWyT8+PfMioubEPTLg5sMT/AwwGLWKhwfshaW
         MCupofIq/FZlQy71E5aiWAYHNH2MEQomPzYAy2ej+Yh2yIp8yKxhYP+g2xuYGoTom0jn
         qgD7KNRquiT9Kepl6r/zsZTLSaMdU6E2orkB1fBOqhwL301cUQAcFUv/Q2KhWQd7tgCi
         DWBdnuCZAtekT30+1fbqKD4UtQs932L6pCcKWYjruqVryy/+M/TjEPTYJ9RfhnytCOmc
         rZzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xN1LN8Q13bIGioRmVa1bu9PkrPkTjKd3uyYwlIhvFvM=;
        b=isIkwqAmwQMvLe3NKLBl81XUULDoN4dgLS6bHNyFyEVFaHTruO4SCwm47XeramgBJY
         xpILwQu1sLR46dsSFLXxtpXjlZsAc5uz6Xlu1x1hIBngxq5gtclhtzwEOvODpq6EMZYg
         cIWcZPCMJnCzpHduvm5Zr/v+K1Sp9M7YK6SQHrtnWhC2sHvE9OlsZh3Qr+heBsw9zaSR
         A07wNGFh3aiQz3THycA7pkow4mzVXmf3glQGHWimMxkJGp2QF8MkFSaZKnmk3fgVxBdq
         BhXfkWP0JjLFZWbtNktwHhoi9HuRE6QxtZlPTgBd4wjIFIRSPSYkrL2hrR+pgKY3Cy3H
         iMVg==
X-Gm-Message-State: ANoB5plJJtnxUBbf/sjaL5YT5+2Bz4Ic7H4QoC3Ywm3N/MO7dPeHSg9x
        WVEltpjSf7ms6/nKJU2H8WrxF4NBR6gz7Bj3
X-Google-Smtp-Source: AA0mqf49ZV1sY4WXZX15jqMsuI6ytLu7nqTx7I4CfWaxDkFNza9Q3mIexZm4mXJmXQyUbItioe+ZbQ==
X-Received: by 2002:a2e:be28:0:b0:26f:db35:2e96 with SMTP id z40-20020a2ebe28000000b0026fdb352e96mr7090008ljq.8.1670837601793;
        Mon, 12 Dec 2022 01:33:21 -0800 (PST)
Received: from localhost.localdomain (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id y2-20020a05651c106200b002770fb5722fsm1155081ljm.123.2022.12.12.01.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 01:33:21 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: qcom: sm8150: Add DISPCC node
Date:   Mon, 12 Dec 2022 10:33:13 +0100
Message-Id: <20221212093315.11390-2-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212093315.11390-1-konrad.dybcio@linaro.org>
References: <20221212093315.11390-1-konrad.dybcio@linaro.org>
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

Years after the SoC support has been added, it's high time for it to
get dispcc going. Add the node to ensure that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index a0c57fb798d3..ff04397777f4 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -3579,6 +3579,32 @@ camnoc_virt: interconnect@ac00000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		dispcc: clock-controller@af00000 {
+			compatible = "qcom,sm8150-dispcc";
+			reg = <0 0x0af00000 0 0x10000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>;
+			clock-names = "bi_tcxo",
+				      "dsi0_phy_pll_out_byteclk",
+				      "dsi0_phy_pll_out_dsiclk",
+				      "dsi1_phy_pll_out_byteclk",
+				      "dsi1_phy_pll_out_dsiclk",
+				      "dp_phy_pll_link_clk",
+				      "dp_phy_pll_vco_div_clk";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+
+			power-domains = <&rpmhpd SM8150_MMCX>;
+			/* TODO: Maybe rpmhpd_opp_min_svs could work as well? */
+			required-opps = <&rpmhpd_opp_low_svs>;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8150-pdc", "qcom,pdc";
 			reg = <0 0x0b220000 0 0x400>;
-- 
2.38.1

