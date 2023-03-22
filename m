Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D6A56C54FD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Mar 2023 20:31:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231276AbjCVTbQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Mar 2023 15:31:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231270AbjCVTbG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Mar 2023 15:31:06 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A66A86771C
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 12:30:59 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id i5so30484650eda.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 12:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679513458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tyc2FHZOXLbHwT0yWbSibCrRBIuGGkS3+1l5iNkUxjw=;
        b=L6ilkvyQY65KncyHVyHMQXfuN38I/vJjrJ0hCvkqXZaTi1NACcdxXR90taPKUtO8xl
         AW6thm90ixaDvpXUE2yrYkgC2wtYVXUxbmTvYFpEMlpm9JjvJrEiLxB1BViRUc0Pn65U
         uu2ee/YcQmCzsAQF/FxvPIsdqjnZ8kfqIt6oZyBP7al+Qfiqi9N4wbq1p874T4lfHoa+
         ksF2zmy9BYwVk2MBoX5WZSOsdJni3Q5p6RGD8WZ+yuqd0ngjKzX0yEjPAylsTO5R/cqk
         7BrsaxR9vuLf9kD4x8MJeFZtfvTZ6qCbN8RV8+Ch35omqRGa29CokOurkUXYRTmY2NEg
         i8Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679513458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tyc2FHZOXLbHwT0yWbSibCrRBIuGGkS3+1l5iNkUxjw=;
        b=PJQpvZ2628t5A0WOVL2vG4y3q8dLU724+WoBSMe29ZvJ7Myo68kvBoyp5CNm8fBWuP
         O5ztBYDx5GbSRLSsdnfROq/WBgsLWkJx/Rgk4OAV8WFOgEnUtiLOxd7uxmGaEs9JM0OL
         guvEuLo3HeAcOsZyopp3aO6aqrkHeaZjfnGkPDt3mkIy2pbgbly8ocuuViTR0SkTeEVD
         5TCizCUAzKCND9hPmerPdwAZAKW5/73sDNAh0Ut2s05xoCIlmMfAFOsQ/677f3d25ZRH
         S9JdNEow7NGQfb+jMw5bUGyBIj/hoRShdKpMxdJ+RtvAciDBlQLMYHP82WskPlJA3q+t
         Q3cg==
X-Gm-Message-State: AO0yUKWLcG5ylfhKuVo8ZFUyMdQju9iGmnRBgEy7aE8Ywxc3Y46uApBC
        wredLeyr5ctdBqxQevqikV9wmw==
X-Google-Smtp-Source: AK7set/eW0rdvBeVi9Hi0Hka7G6IeJLmtaGQZyKOoOYaYghy0poJvQUsZqmqX171mx/lB14u7aYFrg==
X-Received: by 2002:a17:907:a090:b0:93b:68a8:a0e0 with SMTP id hu16-20020a170907a09000b0093b68a8a0e0mr3943794ejc.16.1679513457840;
        Wed, 22 Mar 2023 12:30:57 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:5050:151b:e755:1c6])
        by smtp.gmail.com with ESMTPSA id n25-20020a1709061d1900b008e9c79ff14csm7660309ejh.96.2023.03.22.12.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 12:30:57 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RESEND PATCH 4/4] arm64: dts: qcom: qrb5165-rb5: Use proper WSA881x shutdown GPIO polarity
Date:   Wed, 22 Mar 2023 20:30:51 +0100
Message-Id: <20230322193051.826167-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230322193051.826167-1-krzysztof.kozlowski@linaro.org>
References: <20230322193051.826167-1-krzysztof.kozlowski@linaro.org>
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

The WSA881x shutdown GPIO is active low (SD_N), but Linux driver assumed
DTS always comes with active high.  Since Linux drivers were updated to
handle proper flag, correct the DTS.

The change is not backwards compatible with older Linux kernel.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index aa0a7bd7307c..dd924331b0ee 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -1012,7 +1012,7 @@ &swr0 {
 	left_spkr: speaker@0,3 {
 		compatible = "sdw10217211000";
 		reg = <0 3>;
-		powerdown-gpios = <&tlmm 130 GPIO_ACTIVE_HIGH>;
+		powerdown-gpios = <&tlmm 130 GPIO_ACTIVE_LOW>;
 		#thermal-sensor-cells = <0>;
 		sound-name-prefix = "SpkrLeft";
 		#sound-dai-cells = <0>;
@@ -1021,7 +1021,7 @@ left_spkr: speaker@0,3 {
 	right_spkr: speaker@0,4 {
 		compatible = "sdw10217211000";
 		reg = <0 4>;
-		powerdown-gpios = <&tlmm 130 GPIO_ACTIVE_HIGH>;
+		powerdown-gpios = <&tlmm 130 GPIO_ACTIVE_LOW>;
 		#thermal-sensor-cells = <0>;
 		sound-name-prefix = "SpkrRight";
 		#sound-dai-cells = <0>;
-- 
2.34.1

