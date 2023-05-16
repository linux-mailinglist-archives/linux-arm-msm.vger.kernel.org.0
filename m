Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F2D0705166
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 May 2023 17:02:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233925AbjEPPCR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 May 2023 11:02:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233727AbjEPPCP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 May 2023 11:02:15 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABEC55B80
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 08:02:13 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-50bd37ca954so8170671a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 08:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684249332; x=1686841332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EW6F/zPBbypHWDTGQl44KAM/klcDgb6LbEcAMdPHpO4=;
        b=CCwVB9hCZ10YwDiFV+bl+/dNzmxglHroRkpL3TygJd9izEuGXi0RX4RMincFf2sKPT
         mVvojcTwe/lq45vzUnY6pW4t7ogLr9nvbU84dwexK40fbmXm4sD/Tl4HsaqB2rBEqx2L
         2XR2kOd24PfkodCgd1BX/s9+4EURL8y54TWn/XA6X+zB8R4BVSJZRE85BfNkyF27jvbb
         /f2oRoP2oxB6yNDC1gueW9+RJIxGDUHIgNd56xL+FdoOKByXSQVcdk4xiFW/ubx8uxX6
         CgFVZy7+XLi0lzYwTYeZ6jnLCvJOV9B/yVCPspOLA9vKV7itAT//TdXFbZ3cqP4gxlIs
         gzYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684249332; x=1686841332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EW6F/zPBbypHWDTGQl44KAM/klcDgb6LbEcAMdPHpO4=;
        b=e8J5bFKzKj3bYxCG557s1ylGYomf/rK98nTXuFrAGHB2TlibJED7xZF4NY0MxyDYIg
         gD4iCq9r2BTeWv5kyVxsgh1Q08vo7kb7yjI8Aclf7O9i2skRtEnCgtSoJGgTIWVTGas8
         4FaiNsIpZmDCLhh983X78fj+VxkpELe86deb9NpvetgA+I0unOxSFgBPjkTxJhiKsHIH
         Zpcl5WwbZc4IzUcnDNuTEDVr5PLx14iFEWrPz3jiehgO/itAldUty7EmQG/9aKS9oJmY
         HnGM3fhbu+aCubjebU7fNrHz2s4Ks6gK7uVYUhuCihNXj/YfbMdG2uGQ7C633zCQsZ02
         Hz0w==
X-Gm-Message-State: AC+VfDxPqdSUxcq+bJ5HhRlLf6N8+yQcuuXLUJsKD20R8ugZARedzGhG
        s2cuhLeIkIkIfwxNSTmwdBUpGw==
X-Google-Smtp-Source: ACHHUZ4RoHylUFACTNPVTpfQwulbKXPzLTkVoGQ4VYmlSdw7riw8YJzFNBNn5v4KK69iknDnLCtojg==
X-Received: by 2002:a17:907:c17:b0:965:ae3a:52c8 with SMTP id ga23-20020a1709070c1700b00965ae3a52c8mr38020261ejc.32.1684249332030;
        Tue, 16 May 2023 08:02:12 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:77d1:16a1:abe1:84fc])
        by smtp.gmail.com with ESMTPSA id q24-20020a170906541800b0096aa7d25a65sm6361810ejo.23.2023.05.16.08.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 08:02:11 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Fenglin Wu <quic_fenglinw@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Neil Armstrong <neil.armstrong@linaro.org>,
        "Signed-off-by : Abel Vesa" <abel.vesa@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/3] arm64: dts: qcom: pm8550: add flash LED controller
Date:   Tue, 16 May 2023 17:02:01 +0200
Message-Id: <20230516150202.188655-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230516150202.188655-1-krzysztof.kozlowski@linaro.org>
References: <20230516150202.188655-1-krzysztof.kozlowski@linaro.org>
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

Add node for PM8550 PMIC flash LED controller.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm8550.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8550.dtsi b/arch/arm64/boot/dts/qcom/pm8550.dtsi
index 46396ec1a330..33f357a80636 100644
--- a/arch/arm64/boot/dts/qcom/pm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8550.dtsi
@@ -55,5 +55,11 @@ pm8550_gpios: gpio@8800 {
 			interrupt-controller;
 			#interrupt-cells = <2>;
 		};
+
+		pm8550_flash: led-controller@ee00 {
+			compatible = "qcom,pm8550-flash-led", "qcom,spmi-flash-led";
+			reg = <0xee00>;
+			status = "disabled";
+		};
 	};
 };
-- 
2.34.1

