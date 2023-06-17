Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2069573427B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jun 2023 19:16:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346262AbjFQRQO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Jun 2023 13:16:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243106AbjFQRQD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Jun 2023 13:16:03 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A8E61BC9
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jun 2023 10:16:00 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-51a2c60c529so2407307a12.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jun 2023 10:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687022159; x=1689614159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gdEr0QXfQOOVLl/2L8091g5Hi2eNOE2Xs9that42Tmo=;
        b=JpW/EbMXhfLgsLDM/c6xVzzQKO5ba6il/KphPUE3b1nKTUTW9iJ3xYJ8ElCW4y6LqB
         4MjjKVV6teWI/D/FSvP0KexCa3iCe3iFumfdLp7IoUcVKQuk4yWpX9Kecv6JpdpgiwSj
         BSdAWOstmpmCUHl1cbOGTMZeFwkEIFEFcVzK9NCDE8VicXZvzNGtK+09wOthPpVaarYg
         4wDMjQx5NwA52DoahTPg+SW2Nd9KH2Z7Iz/FIAKrErVrnWkYn3FVhGzhKkIMRy0bu4Sz
         FYd+cvdYAwICOyLxfHIkIYUHwOMW/zvZyMTxvq7zGoQXyUT9E/Sguwm5EnYv6Wy0d/1m
         fo9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687022159; x=1689614159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gdEr0QXfQOOVLl/2L8091g5Hi2eNOE2Xs9that42Tmo=;
        b=VnY9pC1WkEKk717mgWDyw1bWR2gtdSZDI0Y+C3cNxY8V0lQqwIKGT4Aicudgjsvqyv
         d756a5Bx3bXiBb6lU0sLbmPSRH95k7RYcBuzX47yxODMtJVk/t8eyvkHXswqYZ9SpwLv
         jvqpBVacLK7hf7vwvPtOHRYBaQcPMzxvqIgyGs6Mv2QO3M6EYGhNiheTvSg2J9CXfced
         aM6ADl0iPawglp8JaJv5JJe2HEdXm5vvyXDXOPpSAtjn/wUqGBea8Yq0kx6Nwgt/QxFY
         KzdtQaWwVUvr410+FHPYyueVCrYbB7TcSB8ponYqMVxtIR16KHxtZpvNyZbQbbJS8R3b
         iD6Q==
X-Gm-Message-State: AC+VfDzzDbYEJVS3fVs+3F7xCWrpeZZyMRcx/gnYDAtlj/X0lcuag1/s
        6Maaz44gq7Yzrso673n1yw2Zlw==
X-Google-Smtp-Source: ACHHUZ6X8S63O428ROGyuLuPISZ5SLHrzhr3enWuQVfl3TKVcnyGOt5a98Hhwuk6uRzM50HqSmRajg==
X-Received: by 2002:a17:907:3f17:b0:978:8f29:8c85 with SMTP id hq23-20020a1709073f1700b009788f298c85mr4791015ejc.32.1687022158988;
        Sat, 17 Jun 2023 10:15:58 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id os5-20020a170906af6500b009829dc0f2a0sm3841897ejb.111.2023.06.17.10.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jun 2023 10:15:58 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Nikita Travkin <nikita@trvn.ru>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 11/15] arm64: dts: qcom: sc8180x: align thermal node name with bindings
Date:   Sat, 17 Jun 2023 19:15:37 +0200
Message-Id: <20230617171541.286957-11-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230617171541.286957-1-krzysztof.kozlowski@linaro.org>
References: <20230617171541.286957-1-krzysztof.kozlowski@linaro.org>
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

Bindings expect thermal node names to end with 'thermal':

  sc8180x-lenovo-flex-5g.dtb: thermal-zones: 'gpu-thermal-bottom', 'gpu-thermal-top' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index d3ae18535636..576180451491 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -3856,7 +3856,7 @@ cluster-crit {
 			};
 		};
 
-		gpu-thermal-top {
+		gpu-top-thermal {
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 
@@ -4006,7 +4006,7 @@ trip-point0 {
 			};
 		};
 
-		gpu-thermal-bottom {
+		gpu-bottom-thermal {
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 
-- 
2.34.1

