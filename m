Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08CB86C78FB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 08:38:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231738AbjCXHi0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Mar 2023 03:38:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231789AbjCXHiX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Mar 2023 03:38:23 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ED4293C2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 00:38:17 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id eg48so4224205edb.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 00:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679643496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SbAf2latoavh3eJGtio+qW5pAyTQGPmQap6Xic0WdfE=;
        b=zekak/ONVgjfkGs+GlAg8GR6owU2/Cc3+zOgWnMNaRiAykx2X4PoKiKOj5kHsWUeeS
         XSH1LEg86fIUf+QT7bSZF8RXXZjwFQT07iW6XkvG9fJUaR3DFMYE7IL03DN19FHLNJP1
         mgNg8SeHiJYLaFkYxJ7nrsnAZqybETbNqpnbgotwcFOQFs/YQyFOfxd+xfhE56UYw687
         rAMoqF3FmLmXpKGiN93dinnBNvM2xB3eDFVqdtikOWHlKZOnRlHRRbTY13XowRyNL8o/
         qFtZ7e2oSIIHVXSwBguWoXRXJFN2yFLy6AwDe6+yo8PMZIAUAzh5nx0LUZUwPhYhpoyJ
         oFKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679643496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SbAf2latoavh3eJGtio+qW5pAyTQGPmQap6Xic0WdfE=;
        b=X212VGTMRBkGkjm+jWYe/7676E+X3Nrtr4SYkmpj+QHIWvbr1UYMWiYzifIIpHBWao
         uCcHC6U/K9hy+mV3iOFbH13TTGzdDpdcMD+T3/UpZheFzp3jTdhsm9LfFYAGbJrkfPy2
         msqcdr8a36qE2AJc4SRD/vK9P0GPItcGFtdlHfZ7RG/QhQGlK0RJq8Bl+NrN9VdpKsUU
         mpwqPHsV01NZIH3BDR5XwVfmOD4TV5yLRm+QnN32B0r9CtzYtFyyO3XyrTzjOJJNf6DO
         rgoj1BIeCt7aLSbwS1UAdXAWp6V4OSGhvS9wA2y9t064N9uNphBeWXI7cDXsaZad6qit
         9Tow==
X-Gm-Message-State: AAQBX9d/+58ydWt+ahso7EnYnpVYiQMZhrdIoO7zNdcobJ4Rej3auIpE
        OUfAhKZt04irE8UwwDyjCyKRyg==
X-Google-Smtp-Source: AKy350bj/GoIHHkOn/JepY1wfzD4wPyF2aGUsowGkH1WVVXUYWoV1A/9nUuW0ZHj4p6xjXeqo3oygQ==
X-Received: by 2002:a17:906:fa0b:b0:8b8:c06e:52d8 with SMTP id lo11-20020a170906fa0b00b008b8c06e52d8mr1500716ejb.36.1679643496002;
        Fri, 24 Mar 2023 00:38:16 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:ce50:243f:54cc:5373])
        by smtp.gmail.com with ESMTPSA id rh26-20020a17090720fa00b00930ba362216sm9970429ejb.176.2023.03.24.00.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 00:38:15 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 1/6] arm64: dts: qcom: sm8250: drop incorrect domain idle states properties
Date:   Fri, 24 Mar 2023 08:38:08 +0100
Message-Id: <20230324073813.22158-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Domain idle states do not use 'idle-state-name' and 'local-timer-stop':

  sm8250-hdk.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name', 'local-timer-stop' do not match any of the regexes: 'pinctrl-[0-9]+'

Reported-by: Neil Armstrong <neil.armstrong@linaro.org>
Link: https://lore.kernel.org/all/20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-4-3ead1e418fe4@linaro.org/
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 79d67b466856..9cf2de87c632 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -354,12 +354,10 @@ BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
 		domain-idle-states {
 			CLUSTER_SLEEP_0: cluster-sleep-0 {
 				compatible = "domain-idle-state";
-				idle-state-name = "cluster-llcc-off";
 				arm,psci-suspend-param = <0x4100c244>;
 				entry-latency-us = <3264>;
 				exit-latency-us = <6562>;
 				min-residency-us = <9987>;
-				local-timer-stop;
 			};
 		};
 	};
-- 
2.34.1

