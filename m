Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D22076B8CC2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 09:14:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229901AbjCNIMD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 04:12:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230162AbjCNILJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 04:11:09 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D30249927F
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 01:09:38 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id r11so6826398edd.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 01:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678781372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6YoLcTPZKVXftB08W3NbZhltu16S6sOPa/fbKkQopys=;
        b=XGGH1ywla1Mb5ywLax50yHGGFp2Is1ipAsNgMsIw7BBMYatGf4JGppE04+NR6t5Hez
         8b9x5gh6IRFlcMzQ4QrRuHdOxjJ1sPdnKzxOg7s7h6Gq4JBHJGYJOElK7mo0s8O6aXAX
         mDYIhGOz9cxQyiMEEmBpZSIDkaPFVdABIwgEIgWLlyt6IDpZJSth/MM+HKqCkMf2GrFZ
         DynfJi5gkGRbKEoYsUQyYQ16od8MZ8t5h55ue54T6X4NOAJ4yBO5nwtOIq36kCnqsZ4T
         rZzm9DNGOwtY+vjrFirPzi5C1fkKPWIpQrkRa0IaTBQS+x6oG5wdMBUTdhhIdorMsr7Z
         WXCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678781372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6YoLcTPZKVXftB08W3NbZhltu16S6sOPa/fbKkQopys=;
        b=O9V18BL6zEktTj2wWTlugJmLXIn/8BYlIZSrVt5yj5Blc5Rtr2UXc39aATJwENlMnY
         iXXsxgrV0Rwb7PJ8W4jROTTfcEdGKTit+x0m8ZSuk6F1RUIo2d1sMbz6qjiLr66uIKXL
         X/BjG7ljmsvT6ceouxN0s3R/6JYNXBE9O5k88ksNNLk4HA+3dXJMcNOBo6t2IjAweaEH
         vOwxNkOpLQXNPg1FO6qvJjiHov3L/uRq7jWnD8+yLvxTpXho7oJBWoybcuZi+xK9TwwF
         uxTsHjkngEx1hqvlzlCOR8qenS3o19ISSLrFQv1Zzg1DBELhjH8a5jIUWlmnPGs37L6w
         ZRkQ==
X-Gm-Message-State: AO0yUKUTrzrnUV5qV/4jfQvzRK/Ag1QP02Td7Dy0pMbg4WcVBJerKBaJ
        e/osP85gOPbGVVX7UOMvFsLJBw==
X-Google-Smtp-Source: AK7set+l/fOeBJjsaXe+aijdE92TiVqaCiOwbagUPvNFlwz5aq86fTk4xUeW9Jz5vwtdU3F6Ok17zg==
X-Received: by 2002:a17:906:6945:b0:907:9470:b7ab with SMTP id c5-20020a170906694500b009079470b7abmr1231609ejs.71.1678781371894;
        Tue, 14 Mar 2023 01:09:31 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:6932:5570:6254:9edd])
        by smtp.gmail.com with ESMTPSA id co2-20020a0564020c0200b004fce9ff4830sm584872edb.88.2023.03.14.01.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 01:09:31 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 13/13] arm64: dts: qcom: sm8150: add compatible fallback to mailbox
Date:   Tue, 14 Mar 2023 09:09:17 +0100
Message-Id: <20230314080917.68246-14-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230314080917.68246-1-krzysztof.kozlowski@linaro.org>
References: <20230314080917.68246-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SC8150 mailbox is compatible with SDM845.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 13e0ce828606..fa58ba82faf2 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -4097,7 +4097,8 @@ intc: interrupt-controller@17a00000 {
 		};
 
 		apss_shared: mailbox@17c00000 {
-			compatible = "qcom,sm8150-apss-shared";
+			compatible = "qcom,sm8150-apss-shared",
+				     "qcom,sdm845-apss-shared";
 			reg = <0x0 0x17c00000 0x0 0x1000>;
 			#mbox-cells = <1>;
 		};
-- 
2.34.1

