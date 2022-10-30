Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38290612B7C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Oct 2022 16:55:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229682AbiJ3Pzk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 Oct 2022 11:55:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229828AbiJ3Pzh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 Oct 2022 11:55:37 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1DC3D5B
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Oct 2022 08:55:35 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id j16so15790052lfe.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Oct 2022 08:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O7V4CyZpr/b2Im2N+XfnA0OFQIOTP3kI1ac0hesmz0I=;
        b=QC8gIbdSaCl3TVbq589Ii+Ee2TAv7hafT0zgbbkN9BEfpUliIPcmEfNIcaJzDl+3px
         xXNYCE9d+sRF8kTCvvQedjw3w489VoEsQagACeD85OJt9/HMmqitqVlrPt5L3+w+MbQg
         /yNdxRI9HclY8ibOz1hrI18tNaXl/s/tcsIPZBkXOkcMKDS6+pX/SwhQ4HQg2UNSFYm9
         NoEorMACFqgMvAiXJSt8aiwPmevSX7hyGUzErV+F0bdByZm4s44/1pENZT3EaeCruP2M
         7hyhx3zT8wFJBrY0LUyuM3PHDHw/BRRssMiLL7cgKtzUFE+ryFg2pqlXQqUJiog8Z6tW
         +qEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O7V4CyZpr/b2Im2N+XfnA0OFQIOTP3kI1ac0hesmz0I=;
        b=YA7dKZNNErrrT9gcVqNFBjSSVxvay57AJxjl1jYwZ3PD3LJsaLJ1B0WZADe8OtDvQ3
         J+Dd8Q+v6hiFYjKw2z4oFy10vVquVa8V+l9CTxR075278qqpNYKc4V9IGyhAzSlOXe1V
         rsAFvImG/Wne6kTPSV60h4xHPX0jzlWWQqEYZi+/zzNIe+sE+Fsm90NvKqT5f9QxMN2F
         PVfekVj7idXhyoVBukE6pY5/f4XtwCghgqgfCOEPdr1QCnNy8mAO0/C7o7tdn6yWK/Q0
         N7jdKyQNgplUhMtoo3J838n7rxHOYFSTnWEyD9zCux/cMEa10oENedc4Ki2HOUZ2xrj5
         rnnw==
X-Gm-Message-State: ACrzQf25QuDwhhWGhKJs8V4S1D4pCXyV65SmdhBTCSEAMk1GwkjiH8rn
        cjt1pLaXuj5it8Tv4Iv9czHIJ6eOBKWHTA==
X-Google-Smtp-Source: AMsMyM5+2z77E8/2OIIbFgcfKkGwNPvsoNJerC/83YkrM98avKiL0z0CNtCugI1KDeMYfoCDdy345w==
X-Received: by 2002:a05:6512:228b:b0:4a2:3e53:4af2 with SMTP id f11-20020a056512228b00b004a23e534af2mr3429983lfu.280.1667145333960;
        Sun, 30 Oct 2022 08:55:33 -0700 (PDT)
Received: from localhost.localdomain ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id f4-20020ac24e44000000b00497a1f92a72sm842982lfr.221.2022.10.30.08.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 08:55:33 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 11/11] ARM: dts: qcom: msm8974: add clocks and clock-names to mmcc device
Date:   Sun, 30 Oct 2022 18:55:20 +0300
Message-Id: <20221030155520.91629-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221030155520.91629-1-dmitry.baryshkov@linaro.org>
References: <20221030155520.91629-1-dmitry.baryshkov@linaro.org>
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

Add clocks and clock-names nodes to the mmcc device to bind clocks using
the DT links.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 4e70f51c8750..21abbff2a4df 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1494,6 +1494,30 @@ mmcc: clock-controller@fd8c0000 {
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
 			reg = <0xfd8c0000 0x6000>;
+			clocks = <&xo_board>,
+				 <&gcc GCC_MMSS_GPLL0_CLK_SRC>,
+				 <&gcc GPLL0_VOTE>,
+				 <&gcc GPLL1_VOTE>,
+				 <&rpmcc RPM_SMD_GFX3D_CLK_SRC>,
+				 <&dsi0_phy 1>,
+				 <&dsi0_phy 0>,
+				 <&dsi1_phy 1>,
+				 <&dsi1_phy 0>,
+				 <0>,
+				 <0>,
+				 <0>;
+			clock-names = "xo",
+				      "mmss_gpll0_vote",
+				      "gpll0_vote",
+				      "gpll1_vote",
+				      "gfx3d_clk_src",
+				      "dsi0pll",
+				      "dsi0pllbyte",
+				      "dsi1pll",
+				      "dsi1pllbyte",
+				      "hdmipll",
+				      "edp_link_clk",
+				      "edp_vco_div";
 		};
 
 		mdss: mdss@fd900000 {
-- 
2.35.1

