Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6D72529A15
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 May 2022 09:01:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232050AbiEQHBr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 May 2022 03:01:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240731AbiEQHBd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 May 2022 03:01:33 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B329D33A20
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 May 2022 00:01:31 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id l18so32777460ejc.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 May 2022 00:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LazXu2ADGNpRx7NCnnIVEulufa0K62/IELeSMelv/jU=;
        b=vB4FwIdysdASe6llMH+QnqOEj5eQjfjT0I7FtDmu6ZM0+3b2K1aOeZ9+v9ivZheD11
         /S8aBSY7q3orvfrDksXccAgfRiWvneEXAeRi+pjfvXCAxF2/ZKvrxSOzMck38IlIkPAV
         HKsOkX0u3oWfza3FZxh/3PHc3rjcY62MIHzeuUZQchvX14VKCQF5QyDyb1Qvt4qsZE/N
         tDvL2vE9TQtoWL4nZzEHB+IgDI1KKQ0oeU20MSYNWCRnzPZGG9p6irlPGRBFSudLGLwm
         OtTFBkAWlE4W5kltyabWCIGGmHoONatlPOLd7t5WnhYzQam3DhH7uMEhIRGzcxh8dt2D
         rpDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LazXu2ADGNpRx7NCnnIVEulufa0K62/IELeSMelv/jU=;
        b=d5wtz10LuOqK/WJpljccfxs7AlPM0KO4L0jBmXMEX7wpiZsEV85l7BuQvga4XIgtWT
         bCxkUP8KRXGUQNOibt2L0Pl2Lndj+mUUm7zSmjpRYW4wiiGjhGTmAyh7nB5mN43sernI
         pZZ3qnvocUb3SkRogFiOGlT+H0l6QDNW3VtX30xJHqd2AYm594s1BeScyBjnf4vHJ3lg
         Yfn6oVR8Tjl72j9qdpUV9OfbWoaKlCImWED5E2+ovk8hMUsBKspBENKqCVg5f6viaMdV
         62QUVsDA6KMSqJFuh0U0daZt0dY2suez1deXvrZQwEMnmCzYQqWLqGiyklZ6YEREjJzJ
         NDlA==
X-Gm-Message-State: AOAM531AlefRtphjBU0d+eORwZWwHLIyVu73LJEg2itKEaJbAPAylTvK
        uWO9lhebEGL+l6IbsHjR2iGmOg==
X-Google-Smtp-Source: ABdhPJz3cvQL2isulpmYvKIWq0RrGfWma5QYQTNUNHch7EOBn7IIxI3HBT7zWKUVIDh83HdjyHj10g==
X-Received: by 2002:a17:907:7b89:b0:6f4:9b92:c2ac with SMTP id ne9-20020a1709077b8900b006f49b92c2acmr17831258ejc.409.1652770890896;
        Tue, 17 May 2022 00:01:30 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id b5-20020a056402138500b0042617ba637esm6487016edv.8.2022.05.17.00.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 00:01:30 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 11/12] arm64: dts: qcom: sm8350: remove duplicated glink-edge interrupt
Date:   Tue, 17 May 2022 09:01:12 +0200
Message-Id: <20220517070113.18023-12-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220517070113.18023-1-krzysztof.kozlowski@linaro.org>
References: <20220517070113.18023-1-krzysztof.kozlowski@linaro.org>
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

Specifying interrupts and interrupts-extended is not correct.  Keep only
the extended ones, routed towards IPCC mailbox to fix warnings like:

  sm8350-sony-xperia-sagami-pdx214.dtb: glink-edge: More than one condition true in oneOf schema:
    {'$filename': 'Documentation/devicetree/bindings/remoteproc/qcom,glink-edge.yaml',

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 743cba9b683c..e8c341faa8df 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -1677,7 +1677,6 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 							     IRQ_TYPE_EDGE_RISING>;
 				mboxes = <&ipcc IPCC_CLIENT_MPSS
 						IPCC_MPROC_SIGNAL_GLINK_QMP>;
-				interrupts = <GIC_SPI 449 IRQ_TYPE_EDGE_RISING>;
 				label = "modem";
 				qcom,remote-pid = <1>;
 			};
-- 
2.32.0

