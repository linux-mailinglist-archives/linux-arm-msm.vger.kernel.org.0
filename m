Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16A905B1851
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Sep 2022 11:21:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231604AbiIHJUN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Sep 2022 05:20:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231742AbiIHJUH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Sep 2022 05:20:07 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B3653DF10
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Sep 2022 02:19:57 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id b19so19114563ljf.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Sep 2022 02:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=hnmXzvjIzn/KGbEWap9g0ZuckOp+5W2/ARJz1gMjBQE=;
        b=UhFCavhThNh6TxXf4SL58qBR3DKMK3Dy/WVE9vjoVUi2thlgxJN8MvnyCGtnDcrRwm
         RR4DJb2skwIIkAvYmR2omsVfvZlk8eaQAc1Rr9K5yMfxbhk9BSkqh+lhaUV94x3Pq3m+
         H9vcPkfeWSKXDBz/ccPKKcVY/e70v9I5v7ORVfBwRQfNWpBJLR2QkVCGYQDaKoc10dfK
         8hXTyfi0Co5TXfACLqNZhAiFYJiud8uKirjxur0ZZbX3vJK2oplBnsUOQ+LG8V7UEjgg
         A9/v8tmBtsfVdpOhV3fGpxSEWQ4Ib5erExKYR7PQza87uKpa8OslG0ZiWHVvjfbhnyfb
         bw3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=hnmXzvjIzn/KGbEWap9g0ZuckOp+5W2/ARJz1gMjBQE=;
        b=lk7f0gIpTpAU23liZUq8tTHvxo0RV+jVXvQrCPV6jFCWuoKm+7XVWPHBITHvX6xbTn
         1ckfxYshGoWuCnj4LJjRwTdFfq3mgj7W5nW7NMN5ngzKF9dxl3cf/6Lk168iCIKok+/X
         l7AJKxLMDq4vPGO2HGPUJITbI3vnWG3VzCj1a+RYPEj3xWtBYqgzacdvxr45uEP97rJ5
         3yppQPrWA8YvcEJyLYz1Ykni5WRnv/Yd9jG2YVCIAgypYCwS532OQiy5kjn3/PMtM5t3
         Aur+mBSzprvZzXKT5xzQnvVT6jW9XkIMtg2Z3FhBsOdZP50qRyQST87k31tfL+Sc37xH
         6Xlw==
X-Gm-Message-State: ACgBeo1Po0SWYbF5pXG3sbE03LIM5oDC0qfue1ZIGf+edti3lqrx2S68
        XA0GWQlA6u2UmxKZN1ce6ElcRg==
X-Google-Smtp-Source: AA6agR4oswiYip5w2ACiDH4yV3mrpCg2LX56swncTmizedMEFYWoLM75WPpWhtzdRZGY9xvblw4x/Q==
X-Received: by 2002:a2e:84d6:0:b0:26b:dce5:2fe5 with SMTP id q22-20020a2e84d6000000b0026bdce52fe5mr170472ljh.12.1662628795739;
        Thu, 08 Sep 2022 02:19:55 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q17-20020a056512211100b004946a758d21sm218219lfr.161.2022.09.08.02.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 02:19:55 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 04/14] arm64: dts: qcom: msm8996: fix APR services nodes
Date:   Thu,  8 Sep 2022 11:19:36 +0200
Message-Id: <20220908091946.44800-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220908091946.44800-1-krzysztof.kozlowski@linaro.org>
References: <20220908091946.44800-1-krzysztof.kozlowski@linaro.org>
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

DT schema expects APR services node names to be "service" and to have an
unit address (as it has a "reg" property):

  qcom/msm8996-xiaomi-gemini.dtb: apr: 'power-domains', 'q6adm', 'q6afe', 'q6asm', 'qcom,smd-channels' do not match any of the regexes: '^service@[1-9a-d]$', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 1e6b70582866..abc17c905bfe 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -3389,12 +3389,12 @@ apr {
 					#address-cells = <1>;
 					#size-cells = <0>;
 
-					q6core {
+					service@3 {
 						reg = <APR_SVC_ADSP_CORE>;
 						compatible = "qcom,q6core";
 					};
 
-					q6afe: q6afe {
+					q6afe: service@4 {
 						compatible = "qcom,q6afe";
 						reg = <APR_SVC_AFE>;
 						q6afedai: dais {
@@ -3408,7 +3408,7 @@ hdmi@1 {
 						};
 					};
 
-					q6asm: q6asm {
+					q6asm: service@7 {
 						compatible = "qcom,q6asm";
 						reg = <APR_SVC_ASM>;
 						q6asmdai: dais {
@@ -3420,7 +3420,7 @@ q6asmdai: dais {
 						};
 					};
 
-					q6adm: q6adm {
+					q6adm: service@8 {
 						compatible = "qcom,q6adm";
 						reg = <APR_SVC_ADM>;
 						q6routing: routing {
-- 
2.34.1

