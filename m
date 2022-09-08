Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00E525B1846
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Sep 2022 11:20:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231409AbiIHJT4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Sep 2022 05:19:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230456AbiIHJTy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Sep 2022 05:19:54 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8609331357
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Sep 2022 02:19:53 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id w8so26636994lft.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Sep 2022 02:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=I+Cj5rW1qPBHDkQI4vuAbqESvVL5430WmrKXOMhCHDY=;
        b=mz1nOyoP37jh56mySK5T5ZNqYhB2Ic/IVtSuKQEKhErsxKpm4x7/moKKo8zi8GhN3n
         khCGL/+PmEQOxTGKfkwnNTr05Nrl/6tgeIdNGgRxL66BjwSjslLse4Wk/k7heQx1xNo9
         s6ck/qfuQJJFjegy7QlFYNkhKz2a19gnb+FJCXn8hkddT+iXDLMaqYN6mvimnzozPo07
         NSHNBTteDHNdErJNbJumjbNT+SJLFxes0XpM5Kj0v6KHvwMmpXfaJtyKXeBDpHuvYqqc
         btPvj0RGYBtheOCQdaMKxrvHdnV4U9JZw9p6ThTO460Nlr1aQJ+pQrFon6lXqPT7b7NT
         LUJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=I+Cj5rW1qPBHDkQI4vuAbqESvVL5430WmrKXOMhCHDY=;
        b=CSVwPMmOTj5lKMk21FkN7WDDnEKCl6mFvekQZH4dy5XNMeQgUoEujfKE9rOcGhouN7
         n2tsN4JHlXkiFYAZBO2WybB7gYWF0CEWzwE0M8C8WrDNfjZMeToRx+5FFjfyAPElz3Gd
         X+QbsyO8wI7QRCn3XBfI3G+uvIbM5ShKRSp36mP7dSYsMaufMhAk5dgzbAGj4cs5dKOU
         yhiqGY8wzb/+L+9SOB3T6cvg/dQ0C0VqPiGnmEOAG+fhIyOoY9ybu8tDFJmKmKNSx7vd
         ncYBiCFrP9XiPQTFK8tdT0Ly8CW9yNQBypf4zcqhRZrqx3ftJAaY/oy7f598VKFiQzEC
         om4g==
X-Gm-Message-State: ACgBeo1nyToQiJBG7TWmgDFIN1haNan39XQq31z7vUyZ2HkTd8tiHKIw
        j5Z+6fCLis1fFSj1dXkLSszVfxpMtUvBjw==
X-Google-Smtp-Source: AA6agR7ANpjBLhgqWrVldq72JM9kG4HVM9XczR/1gYtZOchyJWU4P/uTQWBQ4FtMnyOArTx6n32D7g==
X-Received: by 2002:a19:911c:0:b0:497:9d9e:c2a2 with SMTP id t28-20020a19911c000000b004979d9ec2a2mr2479005lfd.458.1662628791911;
        Thu, 08 Sep 2022 02:19:51 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q17-20020a056512211100b004946a758d21sm218219lfr.161.2022.09.08.02.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 02:19:51 -0700 (PDT)
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
Subject: [PATCH v3 01/14] arm64: dts: qcom: sdm630: align APR services node names with dtschema
Date:   Thu,  8 Sep 2022 11:19:33 +0200
Message-Id: <20220908091946.44800-2-krzysztof.kozlowski@linaro.org>
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

