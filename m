Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 300915AE7BB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Sep 2022 14:20:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239899AbiIFMT6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Sep 2022 08:19:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240233AbiIFMTX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Sep 2022 08:19:23 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF95962F5
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Sep 2022 05:17:04 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id z20so12091828ljq.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Sep 2022 05:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=lVPyeQ2iOH6eoW7svXNN0i3ITGNgus4jUsMchB4/XmY=;
        b=AfprGoA9gCfMR73Wg2GWfLozAtEGnAbp6sHvLZ00EjGtnDIuoGEe0xV1lB6n4FeG2e
         o5jLEAfPqYzYODGVmc2h7dlB2ykI6pLGPHnAzmNecnXfG8nI6QpkWi1xf6ntnKjV6NLp
         4xanHlI+G447u1cBNFpnZC6EU6zTyjsBVfq5lcqS3UDbyIKSqeu7AtwIvMkQ0Wpya47q
         vhDgoLyiTgouDFdqWphAC2MvDa4goUrd7QXTksd8iwOV8k7qjIdzIjQuHnR8/UBU+bCC
         DyPcdM6ge2STts7jAseikP42KE3Y8q+JHRSPEdlFVajnKkxrWypLqdiWKOo/TDAWp7SQ
         eL/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=lVPyeQ2iOH6eoW7svXNN0i3ITGNgus4jUsMchB4/XmY=;
        b=FEIk6KUhpa9VGB8Y6K976Zehi53mZFJYK1Rm5kQWL81LgVArIOfIejQFHDrxjye2AU
         rp3vELdw7zvnR0mWjuo1/9e+B43WMfloW5iFQOyUj69QyKATannsdnjGnhNQ9NlXJpfK
         j2PNOaGh+FBd5XtL7f5AaQHaMWZ4+psu/P8g0lbbGiLKJ6D2ry3im10gDUFFbWehQYAo
         +lm7QhNJMp1GQTsYXRywBoA3BkEDYXUrTEEqSHbQ5mMV94cqTzzS+Hfx7090ffjPti3g
         L90zrY2EA86mVO/jZmlAaHwz73pecUb1HkAP2ec7Qc2eJMfMEBG+7Erj4mz1yZHfGa/B
         AXLg==
X-Gm-Message-State: ACgBeo1h6lmNwmKRNVsmuZVP98DYxqx3UkltNZ0C+Ab/35Ujf/WKsKhc
        A0CvVtPCKHvG+XNaHfcnEjutsQ==
X-Google-Smtp-Source: AA6agR4AWd3RVjZKD2Gi/fOUvxXLLmz4KmbtKrsxZkSynyYoBuHXOsjx+NdgKbG27R8UID5TqZniiQ==
X-Received: by 2002:a2e:9208:0:b0:26a:6213:3568 with SMTP id k8-20020a2e9208000000b0026a62133568mr2728879ljg.503.1662466620083;
        Tue, 06 Sep 2022 05:17:00 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u17-20020a05651c131100b0025df5f38da8sm1882802lja.119.2022.09.06.05.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 05:16:59 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 01/12] arm64: dts: qcom: sdm630: align APR services node names with dtschema
Date:   Tue,  6 Sep 2022 14:16:44 +0200
Message-Id: <20220906121655.303693-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906121655.303693-1-krzysztof.kozlowski@linaro.org>
References: <20220906121655.303693-1-krzysztof.kozlowski@linaro.org>
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

DT schema expects APR services node names to be "service":

  qcom/sdm850-lenovo-yoga-c630.dtb: remoteproc-adsp: glink-edge:apr: 'apr-service@3', 'apr-service@4', 'apr-service@7', 'apr-service@8', 'qcom,glink-channels', 'qcom,intents' do not match any of the regexes: '^service@[1-9a-d]$', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 1bc9091cad2a..2d4e3d39727c 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -2218,12 +2218,12 @@ apr {
 					#address-cells = <1>;
 					#size-cells = <0>;
 
-					q6core {
+					service@3 {
 						reg = <APR_SVC_ADSP_CORE>;
 						compatible = "qcom,q6core";
 					};
 
-					q6afe: apr-service@4 {
+					q6afe: service@4 {
 						compatible = "qcom,q6afe";
 						reg = <APR_SVC_AFE>;
 						q6afedai: dais {
@@ -2234,7 +2234,7 @@ q6afedai: dais {
 						};
 					};
 
-					q6asm: apr-service@7 {
+					q6asm: service@7 {
 						compatible = "qcom,q6asm";
 						reg = <APR_SVC_ASM>;
 						q6asmdai: dais {
@@ -2246,7 +2246,7 @@ q6asmdai: dais {
 						};
 					};
 
-					q6adm: apr-service@8 {
+					q6adm: service@8 {
 						compatible = "qcom,q6adm";
 						reg = <APR_SVC_ADM>;
 						q6routing: routing {
-- 
2.34.1

