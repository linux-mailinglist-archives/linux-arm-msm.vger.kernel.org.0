Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28E976B8CB4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 09:13:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229482AbjCNILf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 04:11:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229582AbjCNILA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 04:11:00 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BEBD984EE
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 01:09:32 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id r11so6825437edd.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 01:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678781365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=He95HulR5qTSW8eVx84ZNmIqGC4MQP+vdUqUMvy7lbI=;
        b=XSN0zq5mvOFbl05Jf+UEzWRYL4gGB4aWsS859u+hTqqiWf+sqZAKynyFoB80dQqkFp
         AQlnro53G867Js9+2dJWdvo2h1+ksKKn2ZsHQuV6kYnRwAs1++PiJQ9m0HdkqJtpy+Q7
         RhOgTfB2y3gHuGeNkQdNwS23FTlZvZwbxDql2h8BVsxWQbxm7+W0eBsS5kOM6Nqg/UR5
         2XpJFZjBN/jxkteIzi3f+WDUNz0yyBtgHF0qyONe2vDDSZeadXT2b+8nbtTQlNU4NfTZ
         0pHdgGrt+ydLEaux6KD0XMwvmJI4m6z/TFq4JBtQGxgHpkGKouM0x7KTQkgB/Y1Fjm82
         BBwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678781365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=He95HulR5qTSW8eVx84ZNmIqGC4MQP+vdUqUMvy7lbI=;
        b=FaWOP7sqfE9SPzRX5Q2/FNgGoVR9l6MY/1D+z8QJPByD+IcqNf7xJ9jS7yr5wtMitO
         ulghWu9aHdxK4olsk9PT3uZE/kzvfp9IgNZZrm+4jWTCU1ZC9KAXgs9I5qmMGLpYEc8p
         6kSUPzJmopuWHomqUuTjA1MCEvlyI5q9HS12NuyWvfCSEJSfgaeXg8kR2W/dU0ipjCo+
         p0H9gwEwJIVYQhnHBDzcYvkrc3ci8Mac1g710D6wOLr+L9ZcC9EU4SuxDECislOWbhLB
         YLuADBHJszUzCyjrhewh1y1v39FuwgBviM6+RhuClLohNL4dZ8+277fjSWcr7ujYdUxS
         nBvg==
X-Gm-Message-State: AO0yUKXXu/GXBapv0ybYwhpKKgpb83YY3esXHf65LGexRorcqUdzlC8C
        CyA1VF3gBJCs56d+gt1iZozJOA==
X-Google-Smtp-Source: AK7set8l6fseqUu4K/G6Bng1iaHZiiRxcxsgNXBcXAsjH42r0UZ66zKe+c469VyWmpELIl3HCmOXsQ==
X-Received: by 2002:aa7:ca45:0:b0:4fc:3777:f633 with SMTP id j5-20020aa7ca45000000b004fc3777f633mr6305834edt.0.1678781365255;
        Tue, 14 Mar 2023 01:09:25 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:6932:5570:6254:9edd])
        by smtp.gmail.com with ESMTPSA id co2-20020a0564020c0200b004fce9ff4830sm584872edb.88.2023.03.14.01.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 01:09:24 -0700 (PDT)
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
Subject: [PATCH v2 06/13] arm64: dts: qcom: msm8976: add compatible fallback to mailbox
Date:   Tue, 14 Mar 2023 09:09:10 +0100
Message-Id: <20230314080917.68246-7-krzysztof.kozlowski@linaro.org>
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

MSM8976 mailbox is compatible with MSM8994.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8976.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8976.dtsi b/arch/arm64/boot/dts/qcom/msm8976.dtsi
index 2d360d05aa5e..c726d879d6f1 100644
--- a/arch/arm64/boot/dts/qcom/msm8976.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8976.dtsi
@@ -1027,7 +1027,8 @@ intc: interrupt-controller@b000000 {
 		};
 
 		apcs: mailbox@b011000 {
-			compatible = "qcom,msm8976-apcs-kpss-global", "syscon";
+			compatible = "qcom,msm8976-apcs-kpss-global",
+				     "qcom,msm8994-apcs-kpss-global", "syscon";
 			reg = <0x0b011000 0x1000>;
 			#mbox-cells = <1>;
 		};
-- 
2.34.1

