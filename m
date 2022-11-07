Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1026A620441
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Nov 2022 00:57:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232979AbiKGX5u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 18:57:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232986AbiKGX5X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 18:57:23 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BF8C28732
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Nov 2022 15:57:11 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id m7-20020a05600c090700b003cf8a105d9eso8089548wmp.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Nov 2022 15:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qYH5haM+xykCAUvWQG03MnTL50y/QIrNNdZ33dlxoek=;
        b=ox7WzTPMUqdqfiSfNSLpeeNfzevdNLKN22OBCDoR67Jx+3ejiKQVMOojjZ2KSyiyu/
         vlgCjrCcECcN9o8HOIV5OJ/cbsLkCcrZ6lyAtL3NSQfA+/CDhJvgdS10wt0mL4B0ik7S
         fZ/wdDxB0x49BjPVLYkA8kayn6h5CLI9xhKQ2hS3lv3X+oOFvP6i1Pm2gTUyVTEtvS5j
         fGUEWSUrN5NtyAfZIx5T504T+7fJxcpUWhycxw4ugPLQCEXWJHj37moVWw7opmxAJhSa
         YzNT824XUt0PWHUABohRrG3Jg0KtxhOuIKHR/HsAMExthY4+zYvtITSQduuknBIKotCM
         pA4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qYH5haM+xykCAUvWQG03MnTL50y/QIrNNdZ33dlxoek=;
        b=GKYaxb8HVS/lmIGyMgT/Vpk5sV2R7ohHtQvb8jm8X3j8cOLv7Zda9dFEbeID8vrVZ5
         Pl7CtGVEs8RwEzyNbjXlBtTnXfS+Iq3A5fw9R1qgmKJpFhkGyD/JCNE5KlOwxKvp3HPa
         52KALIovXGKHKIUtVvQJTZf/hwUlPo6zHAF7rKPMwa6Lgxx78G6/4JDqQ0OSCTM9Yic6
         k8f7eIgKX5UycXfHxha9lqFKPD1jaffKxA7S0FfnnKZ1TOcRlwIW6UX4/8MTvC9XofdZ
         EgEvTCUvC+c6tbff7ovyONEdQ/ay9r1B2aN4mvOVLA9TBCc6r43UWyD7E/cdcGjow8C3
         W6/A==
X-Gm-Message-State: ACrzQf1tR7PeQnX3g4RP185SeIfliQMz/aR/LXaRz2W3UZrrDtfImRwC
        IoGAfPLozvdBS/Bsc4r8Dle03g==
X-Google-Smtp-Source: AMsMyM4k0zJMWrOWckg4YDUdS9DX6Ck0nXqJshFnHAHRwU9zcd8p1y1ceS/gRqsA4EkXleYv84mfFQ==
X-Received: by 2002:a05:600c:26cb:b0:3cf:6265:ddc6 with SMTP id 11-20020a05600c26cb00b003cf6265ddc6mr35326311wmv.195.1667865429536;
        Mon, 07 Nov 2022 15:57:09 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id b18-20020a056000055200b00236545edc91sm8386161wrf.76.2022.11.07.15.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 15:57:09 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, quic_mkrishn@quicinc.com,
        linux-arm-msm@vger.kernel.org
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>
Subject: [PATCH v2 12/18] arm64: dts: qcom: msm8996: Add compat qcom,mdss-dsi-ctrl-msm8996
Date:   Mon,  7 Nov 2022 23:56:48 +0000
Message-Id: <20221107235654.1769462-13-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107235654.1769462-1-bryan.odonoghue@linaro.org>
References: <20221107235654.1769462-1-bryan.odonoghue@linaro.org>
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

Add silicon specific compatible qcom,mdss-dsi-ctrl-msm8996 to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for msm8996 against the yaml documentation.

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 081e20a63c610..c1a99b325269f 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -968,7 +968,8 @@ mdp5_intf2_out: endpoint {
 			};
 
 			dsi0: dsi@994000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,mdss-dsi-ctrl-msm8996",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0x00994000 0x400>;
 				reg-names = "dsi_ctrl";
 
@@ -1035,7 +1036,8 @@ dsi0_phy: dsi-phy@994400 {
 			};
 
 			dsi1: dsi@996000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,mdss-dsi-ctrl-msm8996",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0x00996000 0x400>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

