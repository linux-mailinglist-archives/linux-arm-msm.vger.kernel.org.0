Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 479566C52C5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Mar 2023 18:42:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230241AbjCVRmA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Mar 2023 13:42:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230207AbjCVRl6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Mar 2023 13:41:58 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4CAC60A90
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 10:41:56 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id x3so76091801edb.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 10:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679506915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ueNaJ0XTotz6J2p6MR7byzx7hLWRSeF4YWSXmbAw8M=;
        b=jiZ6P5LnC7C4MZlZsNgzv2dWj5Z56h8sQ6sNNIyhHRQOzkMysG4f9wQBTrqnzZ6bMI
         2LE5N4Eh2VXU5eJktzcQ5tMsZqyMI1lt5R9C6Er5flWOKeFmGdSrUwsTzLX5kVU9hKfm
         UTCMkR5+NTLw/4G9iMBVNOtUoHFKyIRcSLEgSV2dFFBvB1sxbPp7Tg5zeqnh1t3KKS82
         dUQQ3KTZs6BydJcRycawFuH41JKdJR3XGtXBvRmjInQISH8kr9LUVJjwEl9OiNvXFJXC
         UrsK+nygmEe+meS2u11W4nQa1Or6TJmiOY0ff3Tq/VhjF2Sr3n8oFXVjQ7an4u2foe4W
         cHdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679506915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ueNaJ0XTotz6J2p6MR7byzx7hLWRSeF4YWSXmbAw8M=;
        b=TSaCmlgguJHQQV3dsdxwbgOqVXI+Ny1gokg4a07SWFJXrClNT30vsL7FfQkhGR/h8e
         D5933T/PBAZXJ+sb518Hhk18rYTPZzQbaL17I0ZOpgU4eTDSgSjIQKccKs+jIkJ84dr4
         osFnMd1u/yX10D/KLtcXKvSvV+7mI14kbF7bCuXBEW7YXsketk6lRphFe5xnE2T0Oc7j
         hnPkzZiW4tkjoe68MExJpRqSKDfJ2LoxSgoF9fRod33yDmNt7JJKyLHMbIAJx4lupL0P
         JRpHUhEye0+5gG3/YUKGGhwMBIXSJ2TzlRysIKF3bUqoIUYlaxZX6biV0P83PCETuWfW
         GehQ==
X-Gm-Message-State: AO0yUKVUdI5lQLbCpmPvq+xp/DzQQY+Hde6abaUNB6YFQWq5FI+SZuUd
        OMhSIBVc6yyvoI712OQu+Wy4Bw==
X-Google-Smtp-Source: AK7set/O8KZV4rr/hGWOtmiKWk/vWl+r7ERZr7Iewa85nlPec8QfOQMMOvb9x95mJstxe4VNMEUIvw==
X-Received: by 2002:a05:6402:788:b0:4fd:2aaf:f401 with SMTP id d8-20020a056402078800b004fd2aaff401mr7816341edy.5.1679506915223;
        Wed, 22 Mar 2023 10:41:55 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:5050:151b:e755:1c6])
        by smtp.gmail.com with ESMTPSA id jx3-20020a170907760300b00930876176e2sm7548088ejc.29.2023.03.22.10.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 10:41:54 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 03/11] arm64: dts: qcom: ipq8074: add compatible fallback to mailbox
Date:   Wed, 22 Mar 2023 18:41:40 +0100
Message-Id: <20230322174148.810938-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230322174148.810938-1-krzysztof.kozlowski@linaro.org>
References: <20230322174148.810938-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

IPQ8074 mailbox is compatible with IPQ6018.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/ipq8074.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index 62d05d740646..3fa7a63db74e 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -687,7 +687,8 @@ watchdog: watchdog@b017000 {
 		};
 
 		apcs_glb: mailbox@b111000 {
-			compatible = "qcom,ipq8074-apcs-apps-global";
+			compatible = "qcom,ipq8074-apcs-apps-global",
+				     "qcom,ipq6018-apcs-apps-global";
 			reg = <0x0b111000 0x1000>;
 			clocks = <&a53pll>, <&xo>;
 			clock-names = "pll", "xo";
-- 
2.34.1

