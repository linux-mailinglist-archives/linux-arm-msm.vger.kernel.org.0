Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66EDB63230E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Nov 2022 14:04:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230043AbiKUNEW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Nov 2022 08:04:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbiKUNEV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Nov 2022 08:04:21 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9D57326DA
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Nov 2022 05:04:18 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id l14so872907wrw.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Nov 2022 05:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lcQAjzVivIzQj2w9iKAgRK1Du16HBMevQocYIlmnioc=;
        b=vX4H259eD8RhoO4kSAXbSzSeRlhQTv2XGt9JgkZ3WQhcZbREpLqO1IdxqMo+hwGhRO
         HYdGMaecdNg4KL2cEsqS76uSE/JVoZOvIlE4m5GSjPazcQgz46AolmzPACXeWTD0tfe1
         3LwBvSNI0Ta54mPgYgRXTuzHixYeO3eNk6UEjBUak1s/Z3ZHAwLNB2JvgvB2VXt6fguW
         BPtRdXxcdf/JgirPEqQAs6Za8OEKUf2F8fosPtb4cf8J20Muzhb2k2QmPb+FqxDyWt9P
         KygKL+P9kmbMma/jCxfSM/pq1ubB3Akru6BWp5HlEFdoftosqzxZecf1AMqsoXMABEfO
         f+qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lcQAjzVivIzQj2w9iKAgRK1Du16HBMevQocYIlmnioc=;
        b=RMbrA7OFzRtGxxEMDzF2JNwhAdZkQH+O8SvJ28akAQcyqlEEuKN5qRcm85nKb5R9Fj
         rdPr3+qaG4k2jqkO4DqS3uH4z1W9Us0ROEsB5d9WAti1WQ4XdY/T39xKyQ/3gwl8DLBY
         L/mpicLxrHNxl3m2m/ewwcTADj2FZ2Gv1TqnUTvZkSTUaMaNKNAZ+YByvYg/GD0q9gKP
         lhSfyTaItPOa9ycTHZgg66HtmdOLR0ExJVhGt3X+NzU/xUdolF3fax4HErUbYxXDfpjc
         f/MGhJNeww5oC4r6egUNVLM4yJSfB9BLhdzDzYPyv4q4CZEuyk1tXQJhDp8mNvtBvME2
         0niA==
X-Gm-Message-State: ANoB5pnqiQtcu/WzzQ6EC9hxhG00nRJfNkeZ/Jqorp9gTrW/4S+TibaC
        bq2NUQMY2sbB79l8pZ0sfgUUjA==
X-Google-Smtp-Source: AA0mqf4FxFE9yBJ+aw2hFn8IjkppIm3a/2jPd4xhwPRB69GMpY1Jz04V6UA8DrfZiRGiek+7dEL9tQ==
X-Received: by 2002:a5d:5d0b:0:b0:241:9e29:17cd with SMTP id ch11-20020a5d5d0b000000b002419e2917cdmr11008044wrb.167.1669035857195;
        Mon, 21 Nov 2022 05:04:17 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id a13-20020a5d53cd000000b002383edcde09sm11133898wrw.59.2022.11.21.05.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 05:04:16 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     agross@kernel.org, andersson@kernel.org
Cc:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 1/3] arm64: dts: qcom: sc8280xp/sa8540p: add gpr node
Date:   Mon, 21 Nov 2022 13:04:01 +0000
Message-Id: <20221121130403.161817-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221121130403.161817-1-srinivas.kandagatla@linaro.org>
References: <20221121130403.161817-1-srinivas.kandagatla@linaro.org>
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
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 39 ++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index be72b1f7ad61..65b657f73ebb 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -1626,6 +1627,44 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 
 				label = "lpass";
 				qcom,remote-pid = <2>;
+
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
+						q6apmdai: dais {
+							compatible = "qcom,q6apm-dais";
+							iommus = <&apps_smmu 0x0c01 0x0>;
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
+						q6prmcc: clock-controller {
+							compatible = "qcom,q6prm-lpass-clocks";
+							clock-controller;
+							#clock-cells = <2>;
+						};
+					};
+				};
 			};
 		};
 
-- 
2.25.1

