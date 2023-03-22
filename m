Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C9276C52DE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Mar 2023 18:42:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230397AbjCVRmd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Mar 2023 13:42:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230395AbjCVRmZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Mar 2023 13:42:25 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D4CC5F6FA
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 10:42:03 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id i5so29253535eda.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 10:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679506923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6YoLcTPZKVXftB08W3NbZhltu16S6sOPa/fbKkQopys=;
        b=vMVXU6qF5uPfQiK/Bc1B8XgsIycIm1jQadimPluLm8K/wyM+u6Jq+WuCIp6l/UeeIl
         5fUo9N4N3gXmvtfnuDzZtXdY8WGZZ7I+hTrbqYXAD7PmkhZ21ADyNI5i+mNEwszMiedu
         16WHiQyqBCHRMW+Doq2vIcDSsNI6SXiG+wcDdMzaA05GdaKecF5ASEmIDfJ58UdcphE+
         ouI3tNSdD0z6gQx86Y8G4MY1nlShqIwm4e9cNJ9uqqaHM6KRfzkSw3ZjmMP8eTDhA7pP
         iejEfiClGQMAKO9O6sHtQB2Rz1bUoL0110piP2tX2Ye0djAfh9H5rk3n2UsgJ6eVfLTq
         2d5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679506923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6YoLcTPZKVXftB08W3NbZhltu16S6sOPa/fbKkQopys=;
        b=beiTref8KclJz0dfwjQYppHYwaUfW+n31jHitC/V/khPCKoCGQOEw2WLCm4s5/Wu5C
         2cpU2p+kZIiZPxktPSlrQc5iHJQwCXbs522LsaIHeOCfKPYJfWAM7L63H2p5r7U4mGpo
         ezCzeXwXGnnA9nd3c/Gyc9ExdwL9He0Jt6muwjdkFg13IrJCZnv3JU2fHrsJRvmB7vKj
         GDywACl/QQTB1mHQbQ55cE3ASN2R7qGWEXqNl92YEBy/oLuqJG8jshZMHZ2ceH0N+oMV
         Aos+fccTQd+ttL9/WNGcxkIWuO5re9vxQDffsGus7r4jCMcbxmGhBga5gfq/YLYggEsh
         ebZg==
X-Gm-Message-State: AO0yUKXHGCOkcfQ+wQRHnX+dR3Dgu0v7xrZBy+O2zIp6kXn807LmcJWP
        1/+FXoCKD1KVkQIQNPHEuyKDuA==
X-Google-Smtp-Source: AK7set/v9ipzz/xYSRnzptLmxbRDC64HFad+TI9TbjE/FaBQk7BUWyLRrnSLoktbtcJ68Uu+gbki3g==
X-Received: by 2002:a17:906:d045:b0:922:78e2:7680 with SMTP id bo5-20020a170906d04500b0092278e27680mr7524862ejb.52.1679506923028;
        Wed, 22 Mar 2023 10:42:03 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:5050:151b:e755:1c6])
        by smtp.gmail.com with ESMTPSA id jx3-20020a170907760300b00930876176e2sm7548088ejc.29.2023.03.22.10.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 10:42:02 -0700 (PDT)
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
Subject: [PATCH v3 11/11] arm64: dts: qcom: sm8150: add compatible fallback to mailbox
Date:   Wed, 22 Mar 2023 18:41:48 +0100
Message-Id: <20230322174148.810938-12-krzysztof.kozlowski@linaro.org>
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

