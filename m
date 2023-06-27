Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1978173F077
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jun 2023 03:24:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230177AbjF0BYq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jun 2023 21:24:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230211AbjF0BYl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jun 2023 21:24:41 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 811221998
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 18:24:37 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4fb7b2e3dacso1820487e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 18:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687829075; x=1690421075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ENG5Jv6a0TW5PGfcHPFllkQgFWY/YRggXXI6rGy0UPs=;
        b=jVkGZ2YjhSyV7QNuk1HqyZoPcvydkSpmcx0RDnxS/QeQ/MD5OOWBDtEMhMa9xuShtM
         m3mNSyWJFbhE8HrCyzg0HirPkVMx12S/HtCAmu2/1Z011v3YR9ymzaCcTxK7NgvNLn4J
         sf8DjmsTlCdArDpPVA6PqUjOasCMlLu5CjtwXJPVJvXCREYfshlOXdmQOYLdxHQsOyMp
         c/x05qvapG0+P61CFvaKBI9IwDXT36H6fXOww7upC129usx6+6Xjqe3fHBkddmCoR8U5
         c1xhV/FN+8UtLTnqUMHM2PI1f+MoWDRbO4cpqqNA/O+NH3ULKH7iS9OuU0O0cZJNSBVh
         Hrag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687829075; x=1690421075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ENG5Jv6a0TW5PGfcHPFllkQgFWY/YRggXXI6rGy0UPs=;
        b=AbMiAtQkuicKG4I2oEcQVcIqRrwvfFEdLJt+5gKeuzFRA8+Jcvwlw2w/RuxzSga4rX
         lXvmGFNIGal5e8iVOs6cRhHdaUFimkt/ls2VD+n/wiJd4bDZH86Hfs6pNMNMqxRgSYGj
         wipBMFSkT1Rz/Z8iDs1ws4v49P9ieyE1LKNn0U+rhdZxHKMsB4wvvvgw3We1IJesIRBD
         4VlOeNXxFo8G2WsLPebgTEqrQUFbthxEuzgPLsT9D7BGZC/7tkyttyG9YwU/sgmGOk4O
         khDhrCDXqRYAR/kHAPZ4X6UKgjqRLK/N+Z6ekjZCE5qAkhK3U//9kABS6uqLxPtSe7Zj
         jywA==
X-Gm-Message-State: AC+VfDxuNYWhXO1Dp5V3wXZCfHmCQnhxqWmsTGUT5ix5nrnbjzd5su3G
        NTwopl8Snb9lQ1X1MMY7agOEXA==
X-Google-Smtp-Source: ACHHUZ6gNONfmZPb6aBMZHeBZ1VQiZSVo5SGugvi/hKPfT+DS7i2utlykBMbW43mxeTzqERRXx5c1A==
X-Received: by 2002:a19:4351:0:b0:4f8:5c90:f8a4 with SMTP id m17-20020a194351000000b004f85c90f8a4mr14589751lfj.33.1687829075655;
        Mon, 26 Jun 2023 18:24:35 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z7-20020ac24187000000b004cc9042c9cfsm1331301lfh.158.2023.06.26.18.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 18:24:35 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 15/15] ARM: dts: qcom: msm8960: drop useless rpm regulators node
Date:   Tue, 27 Jun 2023 04:24:22 +0300
Message-Id: <20230627012422.206077-16-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230627012422.206077-1-dmitry.baryshkov@linaro.org>
References: <20230627012422.206077-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The set of regulators available over the RPM requests is not a property
of the SoC. The only msm8960 board file (qcom-msm8960-cdp) also defines
this node together with the compatible string. Drop the useless device
node.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index 8157236f249d..b25cd58003e2 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -200,10 +200,6 @@ rpm: rpm@108000 {
 				     <GIC_SPI 21 IRQ_TYPE_EDGE_RISING>,
 				     <GIC_SPI 22 IRQ_TYPE_EDGE_RISING>;
 			interrupt-names = "ack", "err", "wakeup";
-
-			regulators {
-				compatible = "qcom,rpm-pm8921-regulators";
-			};
 		};
 
 		acc0: clock-controller@2088000 {
-- 
2.39.2

