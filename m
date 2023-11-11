Return-Path: <linux-arm-msm+bounces-501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C34E7E8BA6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Nov 2023 17:42:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 954271C20873
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Nov 2023 16:42:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67CE812B6F;
	Sat, 11 Nov 2023 16:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZjbZDaM8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C19154A6
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Nov 2023 16:42:36 +0000 (UTC)
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41AA93A9B
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Nov 2023 08:42:34 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5437269a661so8359627a12.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Nov 2023 08:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699720952; x=1700325752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M3dLnnrtnCRPaf3PcG0X+1LuRdRy0oyYETAOWAbZ9EE=;
        b=ZjbZDaM8HR8PDVucdTZvHSFRL9VDD1C7HRquF2Qj+FhZuXBgIsL4cKvrMAdSLra+vh
         7ARNwnZ8rPpuGA6NDssBlzxZBITmKlU0G4NE4NZsawyxqIYU2xCGJrpNCwb+HmXK9EtM
         gQizzm270HJNF8IewSs9Ru0T8DAQ2KBCGCKeXs127ynfoIn0XawWZtiuKOYDKlBM10GY
         AQbwFzFbQME0sZnkQTq93tb/bvgvHeYQl5rIY37e7EvgZTxoeti+RMTG3+KN12ropa+s
         xclm+zHZXQyJ7A80KBA4OAUnbG0l3wNJSRwIT/4A+vA6PYC03Cic1R4DYPa7QBR6gYZp
         8XbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699720952; x=1700325752;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M3dLnnrtnCRPaf3PcG0X+1LuRdRy0oyYETAOWAbZ9EE=;
        b=HfUYgwexJV9RsoWJA92BpJAkh/piJ/RXmTvS3p6nY8sx6ruek9Vqp+2yZBAG6vJOJM
         LpeBabLFQ6ZfRFmIlnazKebQAyDv7Qypw1Wm4+liYWiwLOfq/T6pDTU5Gd41RfaaiMSh
         ymLhwA8QG+ejpU9tOFqTAw9Su32FM6KPfNhEwup9pZUih8g/aZOaCsbz/hHcz+fbFZt0
         C+XhcLBgtLI4A/2qxXPSRY7Xgzj+O0KNN1CuO6ZsoReL3OI9BUHXPwNlpou/1agqGbg4
         D9kjE+iv7tUyyn2tSGevtdkeORbUhUOX/+HiD/jjTGACQFxm1sTp4auoamWCyqZcOhkJ
         lvlQ==
X-Gm-Message-State: AOJu0YwopPHQWGyAHqmsX6Uho5FG3izyqqYBiqon2OrwBjsUji9N2nQD
	fq5qliK2NU5hmrmSIvm/qTVRkA==
X-Google-Smtp-Source: AGHT+IF1jpsrjM3UtSpzuw6TRcBT2uCV+U/eErKJq07Q/dmAe0neXPiNoW/uDvwD3AvZA3KvBK3goA==
X-Received: by 2002:a05:6402:430f:b0:544:4a91:a30b with SMTP id m15-20020a056402430f00b005444a91a30bmr2299104edc.21.1699720952500;
        Sat, 11 Nov 2023 08:42:32 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id k25-20020aa7c059000000b0053dd8898f75sm1161917edo.81.2023.11.11.08.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Nov 2023 08:42:32 -0800 (PST)
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
Subject: [PATCH 1/6] arm64: dts: qcom: sc8180x-flex-5g: use 'gpios' suffix for PCI GPIOs
Date: Sat, 11 Nov 2023 17:42:24 +0100
Message-Id: <20231111164229.63803-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linux handles both versions, but bindings expect GPIO properties to
have 'gpios' suffix instead of 'gpio':

  sc8180x-lenovo-flex-5g.dtb: pci@1c08000: Unevaluated properties are not allowed ('perst-gpio', 'wake-gpio' were unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
index 3ea07d094b60..0c22f3efec20 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
+++ b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
@@ -452,8 +452,8 @@ mdss_edp_out: endpoint {
 };
 
 &pcie3 {
-	perst-gpio = <&tlmm 178 GPIO_ACTIVE_LOW>;
-	wake-gpio = <&tlmm 180 GPIO_ACTIVE_HIGH>;
+	perst-gpios = <&tlmm 178 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 180 GPIO_ACTIVE_HIGH>;
 	pinctrl-0 = <&pcie3_default_state>;
 	pinctrl-names = "default";
 
-- 
2.34.1


