Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46AAD5B456A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Sep 2022 11:14:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbiIJJOp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Sep 2022 05:14:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbiIJJOn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Sep 2022 05:14:43 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3A9118B0F
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Sep 2022 02:14:40 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id r12so3199550ljg.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Sep 2022 02:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=8QkNF8EHcAEMbV0p0CldmJdisF79bfeyCTRVHy2ZadQ=;
        b=yyBttUYuH4tygXW9qJQM11T+7T0n/4wrSezsTZBpgSmRMRNGIA1xoEodyTIncSJJLV
         GmIGoZnDkFYAkb6S7I7Sc3NJdyFWoU+RJiyPmMLQUOvJhPbgef/PwaPDKOjftN4PqwVB
         8wsZEMpQf8rx77PeUwc+Dxe8Bfc3vdDuvPqqnLG4Jy5ETuKR/y7ffILB/Z9itZmgnnpD
         d3SWYysVCP629T/Pj8f87jqkM47+FM4DhdkD2uCR9I/YzzRnpfvQ7DPudQoPenp6/Vo/
         Wy2hjQNtX3xjMNv3n/h2xG1H4JgHKtc//MkclS6ejBswuNJXAzPBXlksKkPlw7bK1XmE
         7Eiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=8QkNF8EHcAEMbV0p0CldmJdisF79bfeyCTRVHy2ZadQ=;
        b=n+WQlyECszkrZb9z6Lqf/gWnL4eDAKEpYFo1pDRcjdqBEhlmEXWoWr/rLFKB0qC5lW
         7nzCK/UhWOWd/1IiQSl9USLvHEoTK3vzqOJiz5WMegDWsz7CRTQzmjycmxHnagl7UNYp
         MXkolkLAGWcc2Z8LO/8ikWuU523lgz8tD8xR5IjAQW3ftQgJfppVLUp1bOJ0DlSd63T9
         Jig1lLB9ih3ejQ8ywsrursydS2Sb6zUE7RHxc0BmLrcI0Zd0XeCwmhT0ZFabF5PAW1Tb
         4DSpPvLDSBDAP5j2otCksMGkJBytVye0AYx0zFV4GF1BEAMvznXjAJ0FXhrIPm6u/aHZ
         Zkeg==
X-Gm-Message-State: ACgBeo3zu8fAD2MSITdcAkBsssNSHSwWIEla1zNFwXkJZE06quDVXH5w
        deaez/kgIQeDREYuP7IGD4w5tA==
X-Google-Smtp-Source: AA6agR7v11ee1WBu70O5QlG0YOmv4myZzh9DgvTOA74X3aEZRne8qOWVCMTlTMzzFtsUC/6E2bJRdQ==
X-Received: by 2002:a2e:8ed9:0:b0:26b:e22c:5e71 with SMTP id e25-20020a2e8ed9000000b0026be22c5e71mr2189554ljl.15.1662801279171;
        Sat, 10 Sep 2022 02:14:39 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id x22-20020a19e016000000b0048b26d4bb64sm201552lfg.40.2022.09.10.02.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Sep 2022 02:14:38 -0700 (PDT)
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
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Steev Klimaszewski <steev@kali.org>
Subject: [PATCH v4 02/15] arm64: dts: qcom: sdm845: align APR services node names with dtschema
Date:   Sat, 10 Sep 2022 11:14:15 +0200
Message-Id: <20220910091428.50418-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220910091428.50418-1-krzysztof.kozlowski@linaro.org>
References: <20220910091428.50418-1-krzysztof.kozlowski@linaro.org>
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

  qcom/sdm630-sony-xperia-nile-voyager.dtb: remoteproc@15700000: glink-edge:apr:service@4: 'dais' does not match any of the regexes: '^.*@[0-9a-f]+$', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Tested-by: Steev Klimaszewski <steev@kali.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 347c3abc117b..627e32515d29 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -767,13 +767,13 @@ apr {
 				#size-cells = <0>;
 				qcom,intents = <512 20>;
 
-				apr-service@3 {
+				service@3 {
 					reg = <APR_SVC_ADSP_CORE>;
 					compatible = "qcom,q6core";
 					qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
 				};
 
-				q6afe: apr-service@4 {
+				q6afe: service@4 {
 					compatible = "qcom,q6afe";
 					reg = <APR_SVC_AFE>;
 					qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
@@ -785,7 +785,7 @@ q6afedai: dais {
 					};
 				};
 
-				q6asm: apr-service@7 {
+				q6asm: service@7 {
 					compatible = "qcom,q6asm";
 					reg = <APR_SVC_ASM>;
 					qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
@@ -798,7 +798,7 @@ q6asmdai: dais {
 					};
 				};
 
-				q6adm: apr-service@8 {
+				q6adm: service@8 {
 					compatible = "qcom,q6adm";
 					reg = <APR_SVC_ADM>;
 					qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
-- 
2.34.1

