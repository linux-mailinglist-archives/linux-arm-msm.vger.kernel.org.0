Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7511C638DCD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Nov 2022 16:53:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229737AbiKYPw4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Nov 2022 10:52:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229618AbiKYPwy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Nov 2022 10:52:54 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34C422F023
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Nov 2022 07:52:53 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id d6so7486078lfs.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Nov 2022 07:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=esCAgcV2LDr9vGPult1Qa0Bflqq5ECWpDf0nuMK/Ujg=;
        b=oQKXjtt0EQ9ogql4HSaBHJDF5txRvjNG7Z+SB5IR/lAAkcP0VWFkI5w6cn8LRVONry
         Y6jJa8BBGvgPvjh3vz7dJ+Ocq/bRFzFdz5fDKy43pkNA+X7aDz6R0CTiqa021i0vojJo
         YLB2Zb0dyvA92qjHAcAooIxFyWYXOuByJNgOxZ8nsy2PY9ArempdRIlRt460JyLZklVP
         9JyHgZmAiTLKgLVaoMx8vpkUBNXEDm++QljfIMHBZ1G8AVlEkyX9UO2ghB6rQ+zU0Xzt
         Skytc8OQrpKZQLKMdsxv+lY2Qwy+Mq2C8nGY4hbjeGcdAtqRPrM21KQ1RQahBX0f2Qxx
         p6lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=esCAgcV2LDr9vGPult1Qa0Bflqq5ECWpDf0nuMK/Ujg=;
        b=PAmCYWjFAi4/ywuAh9ThyuRKtg7UY0RWF5J1FBbkkvWFfAMkYzGXdrUNM1Lkamu1gz
         1QQfyqum8hDrZ9fkz61K8NXBsVO9StIuE+LXknMiQJhv8PP8lwMgjWMTMMba3xtMoO+M
         K/8KIoyWyr19Lj/Mq/YdZlmgXLz2/UlrBym/S07+NTfJMarVOYnBKqF7NCjQDYFRL+E6
         /2pN/ZIglv/zHQrDVGLmatkNqkRvpJsBm8v1SXLUbPp0YuBpiYrwpCO+xvFcMEn+UAaZ
         1341CM2QRHg2gGdGaT1nBZFbR5HOg16zfdFwdOI865ydsASgYP8ufJi+llLJ7nH0cT49
         doog==
X-Gm-Message-State: ANoB5pnsskQcXhrcxEs3Yn5KtL9KtO64z0xQBv1pSpTZbNktRRlI5Epx
        bxAv2KGMii/RvznhAbnbVlOkKw==
X-Google-Smtp-Source: AA0mqf7ATyXPLOfIo2vBfIkqa7Zu12uYRX9GN30f80QWYCMcEeTSVBp0HE1svD8Wpr8YuhlW0mznBg==
X-Received: by 2002:a05:6512:2814:b0:4b1:b7a0:aa69 with SMTP id cf20-20020a056512281400b004b1b7a0aa69mr8694904lfb.239.1669391571509;
        Fri, 25 Nov 2022 07:52:51 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id t14-20020a05651c204e00b002778a76a3c3sm391488ljo.112.2022.11.25.07.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 07:52:51 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 1/3] arm64: dts: qcom: sm8450: add GPR node
Date:   Fri, 25 Nov 2022 16:52:45 +0100
Message-Id: <20221125155247.501203-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221125155247.501203-1-krzysztof.kozlowski@linaro.org>
References: <20221125155247.501203-1-krzysztof.kozlowski@linaro.org>
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

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Add Generic Packet Router (GPR) device node with ADSP services.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Co-developed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

---

Changes since v3:
1. Re-order reg.
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 40 ++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index f20db5456765..7b63c56ff2f4 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -13,6 +13,7 @@
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/interconnect/qcom,sm8450.h>
+#include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/thermal/thermal.h>
 
@@ -2127,6 +2128,45 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 				label = "lpass";
 				qcom,remote-pid = <2>;
 
+				gpr {
+					compatible = "qcom,gpr";
+					qcom,glink-channels = "adsp_apps";
+					qcom,domain = <GPR_DOMAIN_ID_ADSP>;
+					qcom,intents = <512 20>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					q6apm: service@1 {
+						compatible = "qcom,q6apm";
+						reg = <GPR_APM_MODULE_IID>;
+						#sound-dai-cells = <0>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+
+						q6apmdai: dais {
+							compatible = "qcom,q6apm-dais";
+							iommus = <&apps_smmu 0x1801 0x0>;
+						};
+
+						q6apmbedai: bedais {
+							compatible = "qcom,q6apm-lpass-dais";
+							#sound-dai-cells = <1>;
+						};
+					};
+
+					q6prm: service@2 {
+						compatible = "qcom,q6prm";
+						reg = <GPR_PRM_MODULE_IID>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+
+						q6prmcc: clock-controller {
+							compatible = "qcom,q6prm-lpass-clocks";
+							#clock-cells = <2>;
+						};
+					};
+				};
+
 				fastrpc {
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
-- 
2.34.1

