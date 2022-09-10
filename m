Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05C0C5B4568
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Sep 2022 11:14:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbiIJJOn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Sep 2022 05:14:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbiIJJOl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Sep 2022 05:14:41 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7E3215A2C
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Sep 2022 02:14:39 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id r12so3199525ljg.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Sep 2022 02:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=I+Cj5rW1qPBHDkQI4vuAbqESvVL5430WmrKXOMhCHDY=;
        b=O/Ch6b7hOL+11g7GHWsi9eQQ87OhE38Owe7J26Hf+qJkjI3uMtsWTfnUXWG6dFbfKt
         k9xKNOAejKT4g8aQGXiP2avBx45e6M1pDb/M/+WRVhA5STyn3cjPO1eX08qdvF5FUQna
         lW4TqOuxtZ/0qhjvdXDH52uLoeiv5bPfVOXCJBzTCGffJAdVv6098cbSaxRRs4c2tvRn
         CT4tghY+gpBpHKP9LAdl96Xava53XZloZNsvT8gg+Hw+4w4XxvoEf9yP5XiKIPjLqEex
         1amt3ChYBfnZDM1vPiCz9nCTkMYC03tCnQvD9X9FxLHNuEk29c3svj40W7YbTcQenb7N
         TLNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=I+Cj5rW1qPBHDkQI4vuAbqESvVL5430WmrKXOMhCHDY=;
        b=eOUFRvpFbSTUhdg59xf4NfA5b/JfD/DBlcLXf4x+spN07coNy0yrfM84I9wmZw0A9R
         HqW4Ks3CDhq6r/2N71SJmr39TnUPISgqZ3vW9moj1Cj9Jl5/SqfBRyhlqQ3ul3aYQ18u
         2l2sBlJdky5Biyi/G7kkygPCIfWZnhWhHJXZ2XwatJ8SXVsoP6b6Y0ZxCGXRlkrYg9at
         0qjiAEEjGi0THgZ+quGWtWOhig5VgQcjORtTexI186QMgamPIprzNzMqtlP/0+mQHYyg
         zz4CwThWSz6SjQzEPeW1eLlzLfVzqjCbr9Zj/MI+Kw5qVoh1tZGbpzBL1das4x3CbDuj
         Bnfw==
X-Gm-Message-State: ACgBeo3nRU9eqE+wWP9GL2LTYE9q1WF1CV/AWquAxqSgZM4eN1zE/+MU
        zsdc67HRUMdLyvuxw2VJBCXFvg==
X-Google-Smtp-Source: AA6agR4FCa85+ISTKv3H1d1x6uFzYyQLjUdlJZJ3lzgsxfSiH4+SIbwfwkEuptV+7e+VebV7N1prXA==
X-Received: by 2002:a2e:9e11:0:b0:268:c7d0:9662 with SMTP id e17-20020a2e9e11000000b00268c7d09662mr4830958ljk.309.1662801278102;
        Sat, 10 Sep 2022 02:14:38 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id x22-20020a19e016000000b0048b26d4bb64sm201552lfg.40.2022.09.10.02.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Sep 2022 02:14:37 -0700 (PDT)
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
Subject: [PATCH v4 01/15] arm64: dts: qcom: sdm630: align APR services node names with dtschema
Date:   Sat, 10 Sep 2022 11:14:14 +0200
Message-Id: <20220910091428.50418-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220910091428.50418-1-krzysztof.kozlowski@linaro.org>
References: <20220910091428.50418-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

DT schema expects APR services node names to be "service":

  qcom/sdm850-lenovo-yoga-c630.dtb: remoteproc-adsp: glink-edge:apr: 'apr-service@3', 'apr-service@4', 'apr-service@7', 'apr-service@8', 'qcom,glink-channels', 'qcom,intents' do not match any of the regexes: '^service@[1-9a-d]$', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 9ae6610af93a..3cd1f40b44fb 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -2224,12 +2224,12 @@ apr {
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
@@ -2240,7 +2240,7 @@ q6afedai: dais {
 						};
 					};
 
-					q6asm: apr-service@7 {
+					q6asm: service@7 {
 						compatible = "qcom,q6asm";
 						reg = <APR_SVC_ASM>;
 						q6asmdai: dais {
@@ -2252,7 +2252,7 @@ q6asmdai: dais {
 						};
 					};
 
-					q6adm: apr-service@8 {
+					q6adm: service@8 {
 						compatible = "qcom,q6adm";
 						reg = <APR_SVC_ADM>;
 						q6routing: routing {
-- 
2.34.1

