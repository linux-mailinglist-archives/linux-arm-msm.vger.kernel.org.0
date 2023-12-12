Return-Path: <linux-arm-msm+bounces-4411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4B480EDA3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 14:31:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 70D0FB20CE5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 13:31:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFF1E61FAF;
	Tue, 12 Dec 2023 13:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l2m4WXGl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6EABF5
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 05:31:47 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-54cc60f3613so7338789a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 05:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702387906; x=1702992706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fzt8RX1Ws07cAJckt2n2AWAh//EFivzd7IWb/0bHK4A=;
        b=l2m4WXGl1jxkqRXU7VZg7Q3r2Wz9H7vGhcwXXDK9Dosq+0TcJB3VcgwOkPdBHByOiD
         rbwnJ5Wr1HhzhudWVIUFX8yY5aoXrzAQAanzBet5LI8KxyJIAkwH8BSEhgZmGMevLUIR
         HFd78EI0aBrwsKl27cBtFsU6P0TrGnG9ahE8iiqmlrInyONcIcX0swmKoszhBVRaiafU
         mzOwcDwQQYaFBuNfd5AEFsEcm/h22fDVl3F8+TU4ETVDrfGFYXoK4ng2DYLZ5EeLqR1r
         z4ZXrbxQJso6ijOedwtN/IaX8e1g/SYM6J6RYaQzjQBY5xbrslbNO4jv/Q+/f22v/Xmt
         mCWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702387906; x=1702992706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fzt8RX1Ws07cAJckt2n2AWAh//EFivzd7IWb/0bHK4A=;
        b=v9fKzjFZt2KkZB0bGBTFZrt6+BTgnZjLEB/IwTC6wd8tVqQEjxz+EurDj5+HBSc3se
         eSEvGStnYL9yfN5yZYReo3YllbegYMSfIOxGy/nsOCx8eFKnd/IpuB3yA4xRV6obwjpr
         Zjf9CWRTr82BfcQ7rJeTvbrCYJFwVFGb7OB5XtG6uv+RHg6E82reieqtb/o+hK+7jOYe
         GBpfHDQR5Fji+mAiiSSGzEhwfncPKq2MKajOGatcqhwtj9j1inFaw7LQjhqAESTmo2N5
         w4cztIk8Li+zX9v+OCeT7BalIfLs8pWoQH+KxKI/7veXT4gxVlIGNcEqf0rtiH+0RDda
         EEBg==
X-Gm-Message-State: AOJu0Yyv2pLA6bnBtsB1X3uOzNaUhzna/bDg9RGn61hyRybz2FQyLjPe
	u6G3qYKqOhmMbqmaKecC1NkWgw==
X-Google-Smtp-Source: AGHT+IEP8WCwq/kmQqr/nuMHsHM2LlMha+dw916naYx13uzD1feAB00wBX3EKf6MLb6o6Yv1E7jOtQ==
X-Received: by 2002:a17:906:1053:b0:a19:a19b:560a with SMTP id j19-20020a170906105300b00a19a19b560amr2496624ejj.154.1702387906137;
        Tue, 12 Dec 2023 05:31:46 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id vw12-20020a170907a70c00b00a1c904675cfsm6228811ejc.29.2023.12.12.05.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 05:31:45 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: qcom: sm8650: drop unneeded assigned-clocks from WSA macro
Date: Tue, 12 Dec 2023 14:31:43 +0100
Message-Id: <20231212133143.100575-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Review of v1 patch resulting in commit 58872a54e4a8 ("arm64: dts: qcom:
sm8650: add ADSP audio codec macros") pointed to remove unneeded
assigned-clock-rates from macro codecs.  One assignment was left in WSA
macro codec, so drop it now as it is redundant: these clocks have fixed
19.2 MHz frequency.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 425e1e50d945..3d55d08649ca 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -2773,9 +2773,6 @@ lpass_wsamacro: codec@6b00000 {
 				      "dcodec",
 				      "fsgen";
 
-			assigned-clocks = <&q6prmcc LPASS_CLK_ID_WSA_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
-			assigned-clock-rates = <19200000>;
-
 			#clock-cells = <0>;
 			clock-output-names = "mclk";
 			#sound-dai-cells = <1>;
-- 
2.34.1


