Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E5F55970F9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Aug 2022 16:25:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240089AbiHQOXA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Aug 2022 10:23:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240092AbiHQOW6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Aug 2022 10:22:58 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30A528FD74
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Aug 2022 07:22:57 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id z6so19195168lfu.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Aug 2022 07:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=RLFtxKe+OhZckW6UWUlO5nQyi+aAQydRisAUQ2pGnOo=;
        b=xqUTUYdhUtcYoktp6glAcArIaK4BJecsnSG+eYbnh+bBkTvA/igs7Cm3Y+DX06ff34
         dH2MyV38XqULqXLco2U2xv1SzQW4kIGxdd6Yr5ndocQeuOPIdzCOBf+mPnKhaHhJIK7R
         v3C0R2bOJqjJkKxbVO32Fr0CR0uiyiiKpunD9GkSut+dTB8sN0z4eCurCYaFedel0QQJ
         bMAW+47BHd6JipjDY0MEgyU+Jwrpeu13lLdT1dDlYk2OqCyP/ImEgeXKNAxAJ2BCDm+L
         B98+zNRAbeao+uDz/LV3hmSOCH+zyLHlnA2HeDVdvtDl98Z2PCB2i5rqLz2dExWHwN2I
         ua2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=RLFtxKe+OhZckW6UWUlO5nQyi+aAQydRisAUQ2pGnOo=;
        b=uvz5pY+DyiLbJDw+XygDNwC6jAxjRFjsZsuWU6OZoVCquGDPphWLbPzU51/Y8hXT/u
         PoHOBijxO/RzMQtfJlNbYBe2FPNbrYHS5uPa3K+FRVAnbpmBEDpvXpwozMTXl+3u1i5r
         hVyHTFheOh7DlDaCBB5Ig5N0JuaYIq/l3hdZzaz+5bJ6jD3GvSYJL6mQ1kSlkIhNGB6+
         d5Yxf3Wh7JjcU5NEpXb/bpmiO13hSb9/V8vHpWJDhgww609N2QBg0QvstBpJeGzgZeFn
         YPOjACiMQX7ZcbChOtYBfUyhQFPaSWZOUVPGba2Gn09MY1Y6OCskqP/Fc/0t8Ip9m+m6
         sPxg==
X-Gm-Message-State: ACgBeo2wWjlGa4WI655hvQNsvYgm+1lLGze5eZ8agqHlSoSOUWkAwQOW
        YdG2V1i+9OEZSHj6Iag9+ynV6g==
X-Google-Smtp-Source: AA6agR59CBGcXaV0hie1fj1kHHlCqZogn30/K0KtyO73p7KQ0SRzgXOusSqZ3nNin28PDKqXiffn0Q==
X-Received: by 2002:a05:6512:1045:b0:491:f371:ad5d with SMTP id c5-20020a056512104500b00491f371ad5dmr5839628lfb.425.1660746175435;
        Wed, 17 Aug 2022 07:22:55 -0700 (PDT)
Received: from krzk-bin.. (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
        by smtp.gmail.com with ESMTPSA id u1-20020ac258c1000000b0047f7722b73csm1704647lfo.142.2022.08.17.07.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 07:22:55 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Yu Chen <chenyu56@huawei.com>,
        Binghui Wang <wangbinghui@hisilicon.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Carvalho Chehab <mchehab+huawei@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/4] dt-bindings: remoteproc: qcom,pil-info: add missing imem compatible
Date:   Wed, 17 Aug 2022 17:22:45 +0300
Message-Id: <20220817142246.828762-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220817142246.828762-1-krzysztof.kozlowski@linaro.org>
References: <20220817142246.828762-1-krzysztof.kozlowski@linaro.org>
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

syscon and simple-mfd cannot be used without device specific compatible.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml
index 9282837d64ba..a7711e3c998c 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml
@@ -30,7 +30,7 @@ additionalProperties: false
 examples:
   - |
     imem@146bf000 {
-      compatible = "syscon", "simple-mfd";
+      compatible = "qcom,sdm630-imem", "syscon", "simple-mfd";
       reg = <0x146bf000 0x1000>;
 
       #address-cells = <1>;
-- 
2.34.1

