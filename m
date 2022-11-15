Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15D4C62969D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Nov 2022 12:02:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232322AbiKOLCX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Nov 2022 06:02:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232227AbiKOLBP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Nov 2022 06:01:15 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF5BA1705A
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 03:00:58 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id a15so16999428ljb.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 03:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IjhZ9MEeglzsQ2bcky4g3TTffUyDa0flXvW2nHAxvv4=;
        b=h0l5nN27Vv0WeHXp5GvT1W0Gq8znzVvfMeCk8qzA3Sv4WU7mJy+L0I7PyFas8zpIdl
         5Hw4shvoZiKN7B/6yPp0HFt7hsvI0slv4g5upzgZ70xE2MfqhoYJ0gvyw04M8xgubZbM
         NYtlI78OGxuRh5oA0ISirX+Gw0l+hPjDhqbR1y/yESgFyf0WL9EoTOgfVItw5lpxC9Rc
         FGaWxunRQdm2OAFPU6ESsyxMKeHIGfgIc5Amajr7LOH1UPrc3U5+Gzfd+hqIrCFC1ImP
         8NsExX+kT6KtJLCZwuLFvTvZngwxBq4IRxwwBQuoEv/ZjMdFwCPa8hKss20SrB1vc0z5
         mtSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IjhZ9MEeglzsQ2bcky4g3TTffUyDa0flXvW2nHAxvv4=;
        b=VJNWzXGSN8MfJjnuiaC7q99gO5SR0gu9K08iD2+167LTOJZKwQ1mUiisagzFI0xJgV
         EazbzWuQTDF8ryIxLX/rbH9/hZrTNhoslfqQftIBcikGYOlA5UldIsu7Pg4q1wKzVk+q
         HeblT/maQwQYmwwSfPh0lNqe9H2v+pmmi6YWcuSYIhfuSpZW6PC7A803lCEpHRkJt16D
         gXepbYVN0LdmTIZvOL1dJ89pDlzXtLellgrCHZ6RUcKDbAyx3klE0YrNP1QhQOeRJxg1
         P/7E/O9CLsXbOZFKjtBeV8KmL10Vjvst9hKp9XVPvPxAu74O+/Q8O0No2cq59G4Kar+Z
         6XnA==
X-Gm-Message-State: ANoB5plSiukHevWOoPjQHKoXWrQlQtF5K5o8iJYMbQVjCEqTj4gzWQWE
        fkgmHTs9wVgrRxgHJfh9icVRag==
X-Google-Smtp-Source: AA0mqf6Yr31LRaODIkg7Q/FZltx2YwZgd8+vHrPNbHx17uJdz+tfiq89+YvCCSrAegNw19opZ9RvHg==
X-Received: by 2002:a2e:8456:0:b0:277:5665:2404 with SMTP id u22-20020a2e8456000000b0027756652404mr6189289ljh.155.1668510057036;
        Tue, 15 Nov 2022 03:00:57 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id bf16-20020a056512259000b004b1b0f12cb4sm2152786lfb.201.2022.11.15.03.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 03:00:56 -0800 (PST)
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
Subject: [PATCH v2 1/3] arm64: dts: qcom: sm8450: add GPR node
Date:   Tue, 15 Nov 2022 12:00:51 +0100
Message-Id: <20221115110053.110319-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221115110053.110319-1-krzysztof.kozlowski@linaro.org>
References: <20221115110053.110319-1-krzysztof.kozlowski@linaro.org>
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
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 40 ++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 46f9576f786f..4b0a1eee8bd9 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -13,6 +13,7 @@
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/interconnect/qcom,sm8450.h>
+#include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/thermal/thermal.h>
 
@@ -2134,6 +2135,45 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
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
+						reg = <GPR_APM_MODULE_IID>;
+						compatible = "qcom,q6apm";
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
+						reg = <GPR_PRM_MODULE_IID>;
+						compatible = "qcom,q6prm";
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

