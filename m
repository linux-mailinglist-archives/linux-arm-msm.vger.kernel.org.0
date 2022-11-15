Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C840F629FE0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Nov 2022 18:03:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230300AbiKORDQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Nov 2022 12:03:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230459AbiKORDK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Nov 2022 12:03:10 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55E902F028
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 09:02:59 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id cl5so25352122wrb.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 09:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7vOAdIUmGMxdUp1gtYvPxRf9ED25yi+MPvUy63Nj+0E=;
        b=pgmyXclGCmGSPtny7bNgUDi7gOL7+zcjbvh8fwSS1Yn/LTgFHuhqdZGs1Wtoc5E4Nn
         XPsQfu7ctqpTZiTYH3Am2kLdRLZ2+E3FaXEEpAUqWOklEkulx1q7XScBj+Cm0VT85o8Y
         xxIjHMz8+uAQTv+Oz9U8bV+4mFsHdHgoR3Y2oMyFOPooUh3sRDX40v2KsqNEFM9Rqwx3
         HLFFOh6tsM+MgbQohHKIIYAFOCGvBQLx4OUijNL6A+c17KEzJhKM2B1pPEyvgTn0B0tG
         8tfiC+4N/MHJawsjkdPRqBF4MZnxMvR2nvcRUR+8IrDkwGl718GLc7Zo5r7qOTC0Uldr
         gq4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7vOAdIUmGMxdUp1gtYvPxRf9ED25yi+MPvUy63Nj+0E=;
        b=H38zP4klsXZeMR77IB+JbNIpWVNyGS9V1taOaErEXwjqf6pBNaAoN2rWOloZKYfV/w
         tRQDZdSLCegtkL6vSqdcdV2esJsaJpkum5LZOopWoxwY9ZtrHeLHcXLOY3n/l1qtj+n5
         5GLMZ5T4GqMIrycvmkyUjxId0Gzhz/inMJPeAm8pPSV0/P9ba+oPqUhYdC/dyhcvUI02
         eNmBPpwr9w+/ZzGWOv49nQ77AD+MAAUUJhGVv/evP/jp8s+187WnuOfXgqGnMC3dvuR6
         mED+7NdAu96xai04vRN9JAoN7BZThNjyun9ARxN3jbxZxgZGk+X5c1djyD8/vDpJBtBt
         Pr/A==
X-Gm-Message-State: ANoB5plRramlt9rhNXimfyovB+pyaK4btjThFDXgQ+J7VVNlcr2DKAOu
        2EgY3zJB0bwpYNuBbKI5fwSLWIf7J3Fmpg==
X-Google-Smtp-Source: AA0mqf4rHFiQEWGtb8m0eUAW5tfz9Vxxma7QYLLMxnVW87FjPC0zVB+HHZBFhRrBuloDrgJheKaBoA==
X-Received: by 2002:adf:f606:0:b0:236:8a0:2d76 with SMTP id t6-20020adff606000000b0023608a02d76mr11305223wrp.28.1668531777805;
        Tue, 15 Nov 2022 09:02:57 -0800 (PST)
Received: from localhost.localdomain ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id v21-20020a05600c215500b003c6c3fb3cf6sm15747090wml.18.2022.11.15.09.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 09:02:57 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     agross@kernel.org, andersson@kernel.org
Cc:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 1/3] arm64: dts: qcom: sc8280xp/sa8540p: add gpr node
Date:   Tue, 15 Nov 2022 17:02:40 +0000
Message-Id: <20221115170242.150246-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221115170242.150246-1-srinivas.kandagatla@linaro.org>
References: <20221115170242.150246-1-srinivas.kandagatla@linaro.org>
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

Add GPR node along with APM(Audio Process Manager) and PRM(Proxy
resource Manager) audio services.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 40 ++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index c32bcded2aef..e3cdd8bccb0c 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/thermal/thermal.h>
+#include <dt-bindings/soc/qcom,gpr.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -1152,6 +1153,45 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 
 				label = "lpass";
 				qcom,remote-pid = <2>;
+
+				gpr {
+					compatible = "qcom,gpr";
+					qcom,glink-channels = "adsp_apps";
+					qcom,domain = <GPR_DOMAIN_ID_ADSP>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+					qcom,intents = <512 20>;
+
+					q6apm: q6apm {
+						reg = <GPR_APM_MODULE_IID>;
+						compatible = "qcom,q6apm";
+						#sound-dai-cells = <0>;
+						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+						q6apmdai: dais {
+							compatible = "qcom,q6apm-dais";
+							#sound-dai-cells = <1>;
+							iommus = <&apps_smmu 0x0c01 0x0>;
+						};
+
+						q6apmbedai: bedais {
+							compatible = "qcom,q6apm-lpass-dais";
+							#sound-dai-cells = <1>;
+						};
+					};
+
+					q6prm: q6prm {
+						reg = <GPR_PRM_MODULE_IID>;
+						compatible = "qcom,q6prm";
+						#clock-cells = <2>;
+						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+						q6prmcc: cc {
+							compatible = "qcom,q6prm-lpass-clocks";
+							#clock-cells = <2>;
+						};
+					};
+
+				};
+
 			};
 		};
 
-- 
2.25.1

