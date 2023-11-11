Return-Path: <linux-arm-msm+bounces-488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 873DA7E8A1C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Nov 2023 10:56:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30A361F20F2D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Nov 2023 09:56:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A67B11CA7;
	Sat, 11 Nov 2023 09:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vsenM7kH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3602C11CB9
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Nov 2023 09:56:22 +0000 (UTC)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFF1E3ABF
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Nov 2023 01:56:20 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4083ac51d8aso21986365e9.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Nov 2023 01:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699696579; x=1700301379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RE4gk8qOMI692JXd8T3R7RG4N511es9dGQ0TIFnoh7I=;
        b=vsenM7kHRjNRy2V9xkKx1xxjB06Se6nEFO0wfA2TAUK00QOFiVvksTzB5LdLZMepXt
         nfx/Q+CVOHkaf101WP5cHmLWliODxp0H/efvY4pzpmeABLcjxEBpeueysSxJIaD+Xuuf
         spvPH8KTMw/IocZBCkG0LEltART6sncO2T4mlwU9BKfAg0o7ZpkIgHczJoFhNiiAE0pY
         boiHa1liNjEvto87liwvUEbADqsQHtfFy97vpKgfTVz6YpGWUtDmNXTzyy71q10RFjZ2
         GrJUaEJ/E43jutNeviqRkvvOMYc22QFYvWXK1+uGzkvUSSxZrsajwSxqCoQImR5fRD8K
         YvwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699696579; x=1700301379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RE4gk8qOMI692JXd8T3R7RG4N511es9dGQ0TIFnoh7I=;
        b=eWcTjBlJEzv9Pjk26JQHsHF8d0Vd5C1cFhGIeenEfwW8rKYgzgZtDDJ68l9js/mNZs
         VGqumjNhXSpTgrY59peVqdhtc86kpS4AApiyT1S2rCg3RjNWKkwMh0GN9Mo51amzuYVp
         r/IZmLdlbmlut4SuN1+aokyo0XdSc+KwATZlSvgttwKH/v2dztzfI7JTkSWwhBQ/Wnpo
         1wCPnNHYT5zG/qKy/uaWvN1qNueFVFBKG2To6klmrp86OqsvGYeIVHUTD7P7jAySAT5o
         WgFaDG5marE6/irN05XiMPstkhXXp2yEG8LP1awspfWgI8YdQ+CilXXs+BtDAAtbaqd8
         82ww==
X-Gm-Message-State: AOJu0Yxh2ZjarpS30AkC/ZJ6BRzlabHtO4/OA2oYyWdKqmlj7EpxAtBU
	LGUmxoF3EHVo/9W3tQzUuOSw8w==
X-Google-Smtp-Source: AGHT+IGv7j7NdcOXCDkTnkYToIXJwQDuMI2NozWZOgrcK2f/y6YgXdTK5Q+N7SsLslrLts7lOXqySg==
X-Received: by 2002:a05:600c:45c9:b0:405:40ab:7693 with SMTP id s9-20020a05600c45c900b0040540ab7693mr1309396wmo.31.1699696579243;
        Sat, 11 Nov 2023 01:56:19 -0800 (PST)
Received: from krzk-bin.monzoon.net (46-253-189-43.dynamic.monzoon.net. [46.253.189.43])
        by smtp.gmail.com with ESMTPSA id i7-20020adffc07000000b0032dcb08bf94sm1152867wrr.60.2023.11.11.01.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Nov 2023 01:56:18 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Vivek Gautam <vivek.gautam@codeaurora.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] arm64: dts: qcom: sdm845-db845c: correct LED panic indicator
Date: Sat, 11 Nov 2023 10:56:16 +0100
Message-Id: <20231111095617.16496-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no "panic-indicator" default trigger but a property with that
name:

  sdm845-db845c.dtb: leds: led-0: Unevaluated properties are not allowed ('linux,default-trigger' was unexpected)

Fixes: 3f72e2d3e682 ("arm64: dts: qcom: Add Dragonboard 845c")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index c7eba6c491be..7e7bf3fb3be6 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -67,8 +67,8 @@ led-0 {
 			function = LED_FUNCTION_INDICATOR;
 			color = <LED_COLOR_ID_GREEN>;
 			gpios = <&pm8998_gpios 13 GPIO_ACTIVE_HIGH>;
-			linux,default-trigger = "panic-indicator";
 			default-state = "off";
+			panic-indicator;
 		};
 
 		led-1 {
-- 
2.34.1


