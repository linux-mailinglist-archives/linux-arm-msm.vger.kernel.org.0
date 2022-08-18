Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C01F0599031
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Aug 2022 00:09:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243146AbiHRWI6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Aug 2022 18:08:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244178AbiHRWI5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Aug 2022 18:08:57 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF8B410FE9;
        Thu, 18 Aug 2022 15:08:55 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a7so5728268ejp.2;
        Thu, 18 Aug 2022 15:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=ZIJeFXxpXvhra3Imr6kp9MXtkhBnprCLsQHefLWwGpM=;
        b=f5YuzZmLUFfxsTxaI9fSfqx7E3tJU1HbL4utvcA3T6UdYCdrAwwxq5hIUgY6iwiq3N
         VdK+vZvaNmFh49kFB+RfE2R/VPoJOkI3PKbQzEGI3/+5oEw5tKzKaORheHhUyyZnZdff
         c2D0Huniyfkqb1LWUhQbvLKko4JjmGbL7BM9dcDTF7xvDPKQAdJjdHgMj9LuJWQTq8K3
         CD4pq5JSkU33h1ALjlRCBClAXMhFllBwC2q0Yzlde/s6vR8vF3JpiFILG1eZl4l2wz6w
         xDIGtyCEp2sw1ivHacSjDMTZaCGDVHlGXmVaqklJ/x246A8PG/lVuFBE+O/4PPHCA1DZ
         E4yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=ZIJeFXxpXvhra3Imr6kp9MXtkhBnprCLsQHefLWwGpM=;
        b=2iHKTc6azBmpnXLzrjy1R88XGj/ppDq2M/YTzc/jw1Ta81UnQXafacj53YFMKu2vNL
         ewzWlTR8lo25SIeVN4Go+VCGVRbWnARWMcHi8hgDN10m7gkBXTBcKAekjhEF2/75vE3e
         Dnq+ERAdq03BHYir7STIOQZFNQH/sLMFySMc9K5xW+63WTUNA96mG45JM4PEB5efz84m
         BvgLELHd1XCUx+kTkyaFFgo5GXrujQFzUlwvt02bk46dpzXqSUVhkhO391yZe/PlBUYU
         Ifueoj0Zrq2EvJzDcr+gBoZcXV6muFKAkGa113my6rn4wV5gqcig48r6kQfjh/PgahLy
         gM7w==
X-Gm-Message-State: ACgBeo1wGZ9UYwxbLD5iK/Hrl2NWOnvhjPDbrVQ8QHZjZ/2dkXjIAY0d
        ZM+UIDA500S5Aw9xH5IgO50=
X-Google-Smtp-Source: AA6agR4jXYts5DjO6aD6gjTRki35xZjl1p1gkwyuq41ait55RMTJVuUbEh4oMKU1D7mQ3wZNmLigUw==
X-Received: by 2002:a17:906:4fc3:b0:72e:eab4:d9d7 with SMTP id i3-20020a1709064fc300b0072eeab4d9d7mr2939775ejw.599.1660860534383;
        Thu, 18 Aug 2022 15:08:54 -0700 (PDT)
Received: from fedora.robimarko.hr (cpe-94-253-165-74.zg.cable.xnet.hr. [94.253.165.74])
        by smtp.googlemail.com with ESMTPSA id j9-20020a17090643c900b00730b61d8a5esm1385022ejn.61.2022.08.18.15.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 15:08:54 -0700 (PDT)
From:   Robert Marko <robimarko@gmail.com>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        konrad.dybcio@somainline.org, jassisinghbrar@gmail.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@linaro.org
Cc:     Robert Marko <robimarko@gmail.com>
Subject: [PATCH v9 4/4] arm64: dts: qcom: ipq8074: add clocks to APCS
Date:   Fri, 19 Aug 2022 00:08:49 +0200
Message-Id: <20220818220849.339732-4-robimarko@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220818220849.339732-1-robimarko@gmail.com>
References: <20220818220849.339732-1-robimarko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

APCS now has support for providing the APSS clocks as the child device
for IPQ8074.

So, add the A53 PLL and XO clocks in order to use APCS as the CPU
clocksource for APSS scaling.

Signed-off-by: Robert Marko <robimarko@gmail.com>
---
 arch/arm64/boot/dts/qcom/ipq8074.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index bace14b742a1..7d4ff7d8a239 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -704,8 +704,9 @@ watchdog: watchdog@b017000 {
 		apcs_glb: mailbox@b111000 {
 			compatible = "qcom,ipq8074-apcs-apps-global";
 			reg = <0x0b111000 0x1000>;
-
 			#clock-cells = <1>;
+			clocks = <&a53pll>, <&xo>;
+			clock-names = "pll", "xo";
 			#mbox-cells = <1>;
 		};
 
-- 
2.37.2

