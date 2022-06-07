Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D79B15404CA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jun 2022 19:19:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345740AbiFGRTN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jun 2022 13:19:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345673AbiFGRTC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jun 2022 13:19:02 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DD4D1053E4
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jun 2022 10:18:58 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id h19so23916113edj.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jun 2022 10:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4SXrpcOsQb5w+nGuHXL7N+H56xsmwCAqK9N0xcoqWRY=;
        b=GNpwt6brx6JPpFqD+gI58jZWL2PiPanNQqDmmN+/UMjAMGaLSZwXAkzLvuJ179XxSK
         xR8vjoB0IapeQ0BOksvIrAvUA5/wmGNmfBAq6b9V1N1ENVNz3EmFaM/kKonbMEVQeCs8
         YgLo6NL4FBX1MPB/aini3m+wisQIxTFihfKSdUR4lszsLBkXKfR1dcvra/W40UBcH74I
         9412/pOzwm93yeLLbG0q6lwfxfyL6j70eTZsoK7R8N/iPfEE/ejtNZLzoKyYu1EUehe1
         HdlKtiFieUd7k2nnXSYSKG2YyOPIq2ji5dvhth6Wc6P8Qc1joedyqWQ5SsKS/m20yG4U
         R7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4SXrpcOsQb5w+nGuHXL7N+H56xsmwCAqK9N0xcoqWRY=;
        b=erqsqddvnXHKyQKb23IXOEYQjAb4xpwiqASSk9KI6Ez449x2UAo0iUN2oQqKhr4PVc
         jsbWBMvnuam2FKHCn6DWBRyolWX40U0M9GwgTjkG6jsvyQ2pgClQSXcOZIvu7MCZ3ysR
         lv/GU4HmF83tIwFpyNjTPywY2m9QgPDwO9X8ZvqlGv2zJEsLg9NEU0X83f8A0hM8bEu8
         xdzA1U3ewSgSlmq55dQQF88FXGZaZsX1wRvt33ndarKeDhfXoLVHWtZIaWzn87m7aw9g
         yvSZFAlScrnkt+CnNFI82xn8Ctjtq2+YBxpXmlHwxdUj/OV57hZaAA+gNyNDtNUjlQCl
         GMRA==
X-Gm-Message-State: AOAM5337P1+WKMfXgxxZ07Y2fGdLNv3E3UAKkZ9TIOQUWTjM+I9Z70lD
        zrmCQOBjwxRu2st4tXV4uLYzcw==
X-Google-Smtp-Source: ABdhPJwKJ+K3x5fnupdryfxy4aVnaPvMf4Qdroe4wjskwsjiQWwx4atRK7tG3ciGOjipRXupJVEexQ==
X-Received: by 2002:a05:6402:11ca:b0:430:8a77:59 with SMTP id j10-20020a05640211ca00b004308a770059mr21186168edw.376.1654622336390;
        Tue, 07 Jun 2022 10:18:56 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id i7-20020a170906444700b0070e238ff66fsm5876540ejp.96.2022.06.07.10.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 10:18:56 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Brian Masney <masneyb@onstation.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 05/14] ARM: dts: qcom: msm8974: add dedicated IMEM compatible
Date:   Tue,  7 Jun 2022 19:18:39 +0200
Message-Id: <20220607171848.535128-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607171848.535128-1-krzysztof.kozlowski@linaro.org>
References: <20220607171848.535128-1-krzysztof.kozlowski@linaro.org>
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

syscon compatible must be preceded with a specific compatible, to
accurately describe the device.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 09b181bb5365..5e6b2ae72e62 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1651,7 +1651,7 @@ smd-edge {
 		};
 
 		imem: sram@fe805000 {
-			compatible = "syscon", "simple-mfd";
+			compatible = "qcom,msm8974-imem", "syscon", "simple-mfd";
 			reg = <0xfe805000 0x1000>;
 
 			reboot-mode {
-- 
2.34.1

