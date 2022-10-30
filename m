Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 632A9612B90
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Oct 2022 17:16:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229494AbiJ3QQT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 Oct 2022 12:16:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbiJ3QQR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 Oct 2022 12:16:17 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D60B09FD7
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Oct 2022 09:16:16 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id bn35so14155002ljb.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Oct 2022 09:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=68rmT9CDBNJxMSsX7vpgr5//HUlb4XYOCFYBDSG7T2s=;
        b=jQ3FtU8DrM/03XzRvRJh8suGvJjHj3wCrSQR8EQjbk5cptgGDqDmwIQi8nNCdPH1hB
         nrYV4WPnGgorq/QZULn4voZwXE5OxsXHSVc2KbAd3yOVmOdOox28NJ/tUoKTdZW8M05l
         zWqKcN9lEKbQpQ6FJj830rRHvCiHMOZGGyrZNoUtHL1grKHUvaJ1lddJPHLJVueGiRxC
         TnA76JmQI+7SMwpb9FOm2zWfZmL6A02fh/JrCRDmENT8dsz21v6v1DucsmiRuVRvLJFD
         9ybqntjVA0kYKhKbED6YmI+weepaJMOc07UBJniGYHGEG72gSRdKxS7CbLVrZaz7Dibx
         A1mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=68rmT9CDBNJxMSsX7vpgr5//HUlb4XYOCFYBDSG7T2s=;
        b=bAvFEKaHxPsKZiRlL0BpMy1XecMvTNucDzf9AwIPaY+yBwW9/t7+nohz6XHmgewqZi
         ZM+asYlhEIRjvEgOajoQan18TO35Wo7DJbZE7KLSx4x06UhAtfOJhrIiE1M2UHf5KWDX
         KtAPZIqGAVTZwbcSzRdypX2i39x/V8tjgRIhOjRFijW16BoHnfGeTJplPCdmHllf7F7f
         9zqAVvIZCAB5zHPSe81q1S4ru2sNLlsdqeQ33FL2oXe68foi3XgS51dxMzmGNJJ+x6hv
         RyPFgoAFzbiSnJYs02g7Lj7QFNsjIEfnLg+lO80p5e3w2bCMkaKSV5rCian60gtDKejY
         qLvA==
X-Gm-Message-State: ACrzQf3/e/wKKm7Pr1GmcVwPFASNzTQAJut0da/tbC0mw9zke/wPVjN1
        xyxJ67M8Zz1eZHvdP+EmBChNxw==
X-Google-Smtp-Source: AMsMyM6PnLqYnEazYPKytW2ajiZsFHXE6wcQ45zGZoi8psQ3xUXrsbaxzktCwQJausiYC64Hij+ILA==
X-Received: by 2002:a2e:a374:0:b0:277:2463:cfc1 with SMTP id i20-20020a2ea374000000b002772463cfc1mr3537970ljn.43.1667146575179;
        Sun, 30 Oct 2022 09:16:15 -0700 (PDT)
Received: from localhost.localdomain ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id v9-20020ac258e9000000b004a47e7b91c4sm854365lfo.195.2022.10.30.09.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 09:16:14 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: qcom: msm8996: use dsi1_phy for the MMCC's dsi1 clocks
Date:   Sun, 30 Oct 2022 19:16:12 +0300
Message-Id: <20221030161612.95471-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221030161612.95471-1-dmitry.baryshkov@linaro.org>
References: <20221030161612.95471-1-dmitry.baryshkov@linaro.org>
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

Link dsi1_phy as a clock provider of "dsi1pll" and "dsi1pllbyte" clocks
to the MMCC.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 4ba5d13da23b..6939dd6821e9 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -880,8 +880,8 @@ mmcc: clock-controller@8c0000 {
 				 <&gcc GPLL0>,
 				 <&dsi0_phy 1>,
 				 <&dsi0_phy 0>,
-				 <0>,
-				 <0>,
+				 <&dsi1_phy 1>,
+				 <&dsi1_phy 0>,
 				 <&hdmi_phy>;
 			clock-names = "xo",
 				      "gcc_mmss_noc_cfg_ahb_clk",
-- 
2.35.1

