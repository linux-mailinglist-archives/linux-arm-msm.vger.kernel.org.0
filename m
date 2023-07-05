Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9888F748693
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jul 2023 16:42:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232501AbjGEOme (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Jul 2023 10:42:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232573AbjGEOmd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Jul 2023 10:42:33 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BC751700
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jul 2023 07:42:32 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b6f52e1c5cso29841381fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jul 2023 07:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688568150; x=1691160150;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LvfxYoatLPY+EEK3fZXAaMdZCVIQwiRsXvqBzlQnUio=;
        b=zrmknDbWs4pXA2BEO+ZZbVS1/Vg3LDziRqcQZVHwrspolpztZ9aKw8dsbUeyoL8GnA
         dM0/Dhc5+Q7lRSv/a/VL22dNGx7MwcVPNGkmtpX9SMCOS2pmWiPIsLNnVnIx9WNd7tM0
         ZR86oIFUmaICXXSTI30wkW7hRNvkywplXSXjhqfjOdvt4yMkWcLpKTjNKon4wGbRS/6l
         PYYYu19Oa0fWNGbPl7ycT0ssWvXEQxdvQ3reESoP9KryJF8Y67EAQMTVC0ht3rKtBdbN
         eFAd1WgoiuiHIx9lDFPKfSvJIU8lSLjumJwIX2rlsPWOsve6twEcqwH7z2tODLoNwR8K
         WIVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688568150; x=1691160150;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LvfxYoatLPY+EEK3fZXAaMdZCVIQwiRsXvqBzlQnUio=;
        b=cw4TIvfmUtUbJ0csYAafZ57uWukPlFJWx6wWH3okIClP7LfkLSiO6IJUdoUfp3tQYX
         f94JBYNw5CvPppo/h268i3ncqicOMPke2wFMz7RpoRbMAFXnNavIcS73rKP5Ca/c2JyH
         OnGWtNT/FD1lpUom+qCJsZqXw7DsoVMr5p1byt5y5LBq6OFYQnnFZdpBNX9E8WR6bb8q
         UOMX8tF0YwaeWoPsKxoVOT4mKcGT0+mO5LKGtnADH1mdDMIfybUypy2o+GUsnz3+WHSJ
         vHFwarx/7r0OTD1U2hAm7yp1q4Q2NVNUb8vBJ3NkQ7dfz6ao60WwzfSlkEl2+3E200GL
         MkjA==
X-Gm-Message-State: ABy/qLaYvX6l1yA1ENqij6RamlTeBvNMZl/4TmAMsFmfrlXgDTlKQZi7
        VeBAS1LhNm9VuvJg6Q+1q+wapwlHTJJ13cbNGd0=
X-Google-Smtp-Source: APBJJlGYhYhict3tVNgScjd7KiEg9N8T63CfQkYGiQDMubJFxYUP7RMS0Z5BovY5eCZ+8GTsDCAgyQ==
X-Received: by 2002:a2e:8e89:0:b0:2b6:e536:a2a3 with SMTP id z9-20020a2e8e89000000b002b6e536a2a3mr9007351ljk.19.1688568150187;
        Wed, 05 Jul 2023 07:42:30 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id xa10-20020a170907b9ca00b00988955f7b5esm14727581ejc.157.2023.07.05.07.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 07:42:29 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: qcom: add missing space before {
Date:   Wed,  5 Jul 2023 16:42:26 +0200
Message-Id: <20230705144226.280490-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add missing whitespace between node name/label and opening {.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi                    | 2 +-
 arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index 3c1314e12d08..fe8534538618 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -3429,7 +3429,7 @@ timer@17c20000 {
 			#size-cells = <1>;
 			ranges = <0 0 0 0x20000000>;
 
-			frame@17c21000{
+			frame@17c21000 {
 				reg = <0x17c21000 0x1000>,
 				      <0x17c22000 0x1000>;
 				frame-number = <0>;
diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
index b841ea9192ae..85e5cf3dc91e 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
@@ -565,7 +565,7 @@ panel_in_0: endpoint {
 				};
 			};
 
-			port@1{
+			port@1 {
 				reg = <1>;
 
 				panel_in_1: endpoint {
-- 
2.34.1

