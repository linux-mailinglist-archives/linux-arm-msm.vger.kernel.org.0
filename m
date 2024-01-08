Return-Path: <linux-arm-msm+bounces-6631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 548C4826F63
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jan 2024 14:12:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 667D71C226B4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jan 2024 13:12:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E2BD44C82;
	Mon,  8 Jan 2024 13:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zP8fbkr0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2024174E
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jan 2024 13:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5572a9b3420so4738202a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jan 2024 05:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704719548; x=1705324348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yVkKTIqStHFTwGpwmS+Jdy3rK5bTK00s0dvgImmb2O4=;
        b=zP8fbkr0zaO/bC3rs6JhSCE2JE9S1G50t6K2/W7aU+iFeJSm4RCT6iQjchA0Zb+FfW
         NTRYKDvPAbYkOCrF+viY1wy4Hi+keHeTOQxEG/4ivGME70WFsR6yFDx2svFhlKjpj8wV
         SqD60p2rTnf3OOsyeGcaYjlQIV6H83JRo56GxZM/RFQwflByiYgwP3NNM/CoEk7dPPC+
         slRn/Pfyqrv5nU5/kLGjXydnDE8JGEl8DxfKviTPBAstzTuJxb3feYVwoDgZdU7V4Z9F
         KWqOyaXIWcxQns9Sh/0r+FCplnMxtCsopCnstGO0LHdoOp4iUen5F3f/IIBPaOiQZri2
         duGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704719548; x=1705324348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yVkKTIqStHFTwGpwmS+Jdy3rK5bTK00s0dvgImmb2O4=;
        b=sM/YuoCPXI+HyqowQsxNkX/2jcAaUe9FGaCh7YbnIPtP4mzjeAZEZ6XuaimQYb3n1+
         m0k0CXr64Q04TjImO+kvwPfXBJpfSiZJcyeUSyn48z9iehO5lQjujJLxYvOwYLt6y7c/
         KUa8fQT0GpVJ61L9ennVgTLW4cI1tj36PVq4w/eHz1k0cKFF9pMKngyomBytKcv+nxBO
         0fHFpAx3LJNvdtfISIzIMe9+cOdM2ixOOQeJkjV/iE02IV8RVAPMJrBXLYeewqKwQr2k
         zCCet9pyzQFXdt5rWE/877c+UamQARtHTAhDi2n5sWWlkue+8a5s38EUhI+3eauL5iru
         43rg==
X-Gm-Message-State: AOJu0Yy7LSLfwzmZd69dhiJ5wkTxP9DD9h0tqUmjDQQh8WlyKr+wcpzS
	Ku/teYhOZ8cPUB01tC1UcHkacDyo4r5WcA==
X-Google-Smtp-Source: AGHT+IFYc6MLm2BXfwX1jzoRdUB9X78S1l56ivNW4khbAmxmaw6oBpV4M32TNWwTe0IEklRuWEJs4A==
X-Received: by 2002:a17:907:948f:b0:a23:4998:7e6e with SMTP id dm15-20020a170907948f00b00a2349987e6emr7293941ejc.5.1704719548533;
        Mon, 08 Jan 2024 05:12:28 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.112])
        by smtp.gmail.com with ESMTPSA id w23-20020a1709062f9700b009fc576e26e6sm3902828eji.80.2024.01.08.05.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 05:12:28 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] arm64: dts: qcom: sm8150: correct PCIe wake-gpios
Date: Mon,  8 Jan 2024 14:12:16 +0100
Message-Id: <20240108131216.53867-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240108131216.53867-1-krzysztof.kozlowski@linaro.org>
References: <20240108131216.53867-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Bindings allow a "wake", not "enable", GPIO.  Schematics also use WAKE
name for the pin:

  sa8155p-adp.dtb: pcie@1c00000: Unevaluated properties are not allowed ('enable-gpio' was unexpected)

Fixes: a1c86c680533 ("arm64: dts: qcom: sm8150: Add PCIe nodes")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 031acef259e9..53c78c126ded 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -1881,7 +1881,7 @@ pcie0: pcie@1c00000 {
 			phy-names = "pciephy";
 
 			perst-gpios = <&tlmm 35 GPIO_ACTIVE_HIGH>;
-			enable-gpio = <&tlmm 37 GPIO_ACTIVE_HIGH>;
+			wake-gpios = <&tlmm 37 GPIO_ACTIVE_HIGH>;
 
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie0_default_state>;
-- 
2.34.1


