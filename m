Return-Path: <linux-arm-msm+bounces-36791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C979B976A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 19:26:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F3EFF1C20B80
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 18:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AAE71CEAA8;
	Fri,  1 Nov 2024 18:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lnbESxmX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E16F196D80;
	Fri,  1 Nov 2024 18:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730485564; cv=none; b=rQWZTLDS53992w+l8zIEbMlntuvupGyfoEhNssVL/Rf/LdUlPmzd9G965RvPBzktaKElDp2++Q2nP8Mpteab4ovPDfETH///doaxwq3vPkziqNMg5jqCoXBtfGbWMyDkBEUDy2sm2x8EmO88BQ2TvkY64G1D4Q29RjejO8I6Ob4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730485564; c=relaxed/simple;
	bh=4rUNI+JFXZ5XibbCKmsFyYD6XhVKbqENJ1d3wM8EVj4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mMmfjUpT1ZpvSNB7KAI1BUOwz5uD2VydKCUkyHIf2OxlWyETYtcCyQ/lz2ov3u47k060obI3totBX9OLIaVZ0T8NgL3M6G0IYjJV206gHg60Y2vmsVlvlAtJ2wS/3jvEX5iPOEBKkbwHrK48rUt7obMwJOUbUdVHasliKYoV8H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lnbESxmX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CD123C4CED1;
	Fri,  1 Nov 2024 18:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730485563;
	bh=4rUNI+JFXZ5XibbCKmsFyYD6XhVKbqENJ1d3wM8EVj4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lnbESxmXEA5A5mdN5BHJMBoNPFXgkYZTMmlXQMnam0Auumqp3XzeAD5SG9rkC5kBL
	 hFYJwLX5QOVSNENnt06cUg2Y/FMun5AmgjGK9AcdDejf8U8XOEy0B1seERmdPc4pLq
	 m+cgFbqr0jbQ8SgmT34kdCO+RZJzl7ofzRdxJe+SLAVulJiZivQrHKlv4OuxWpMFn4
	 I6dJfdRVXl/qXkqlVTIDvvCImi5ZKEjVMqTInC3lv6SPtfFBoiZV7pebCqj8cBZ3kQ
	 BFIJAKJrFOq48E/F8M8kgnr0/Y+ealPwtEHLTUzUr91uMIGn4MfV9kRXpQp2dqqKUw
	 58ds4yAfNi54g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7072E6F07E;
	Fri,  1 Nov 2024 18:26:03 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Fri, 01 Nov 2024 19:26:01 +0100
Subject: [PATCH v7 1/3] dt-bindings: arm: qcom: Add Microsoft Windows Dev
 Kit 2023
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241101-jg-blackrock-for-upstream-v7-1-8295e9f545d9@oldschoolsolutions.biz>
References: <20241101-jg-blackrock-for-upstream-v7-0-8295e9f545d9@oldschoolsolutions.biz>
In-Reply-To: <20241101-jg-blackrock-for-upstream-v7-0-8295e9f545d9@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kalle Valo <kvalo@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Merck Hung <merckhung@gmail.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730485562; l=1093;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=DgFc8aQ8HIqN64ClW7BBe1urBd5WcqgKYWYBfBQ5dNU=;
 b=P1LOtl1VGU0pI6yB6ow3hUa8ZFkMLxMnta0eOtZVimZbjYCOif/1VthjIE7fr5kWYQo7EP/gw
 Wv2MmiVIQjlAS3QQAykrNzbz2fB++qsfGm6JF8AzxBRoteHal3Gya6t
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

Add compatible values for the Microsoft Windows Dev Kit (WDK2023)
with its codename "blackrock". The Dev kit is a small desktop box
based on the mainboard of the Surface pro 9 5G, intended for
developers to test/build arm64-based Windows software.
Link: https://learn.microsoft.com/en-us/windows/arm/dev-kit/

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 0f18cb35c774a..32381638b6f9e 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -823,6 +823,7 @@ properties:
           - enum:
               - lenovo,thinkpad-x13s
               - microsoft,arcata
+              - microsoft,blackrock
               - qcom,sc8280xp-crd
               - qcom,sc8280xp-qrd
           - const: qcom,sc8280xp

-- 
2.43.0



