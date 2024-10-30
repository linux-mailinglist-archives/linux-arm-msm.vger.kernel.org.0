Return-Path: <linux-arm-msm+bounces-36411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 662569B60FE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 12:04:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B4211F2427C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 11:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7CF21E5027;
	Wed, 30 Oct 2024 11:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r39WD0Y5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B211E47BD;
	Wed, 30 Oct 2024 11:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730286148; cv=none; b=ele6A25GhDSUEojYDDiBRmCcCeJCo6fSbs6uy89vjelnnf7oTFSTEVPJIuiT6ikfpCUFtk3m87RSUMl1QefV2FazJf20VkQClCnTIZacXXJ+hfM56lYk2uVBNQLv/mERWiaoyTnIDk5bYXW2NFKAd9mdBCnqgaIRJ6ECmjiBU6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730286148; c=relaxed/simple;
	bh=4rUNI+JFXZ5XibbCKmsFyYD6XhVKbqENJ1d3wM8EVj4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M6+tsy+/BHAWd4uDTRlDY+XwzlyfCrYY3qCpRpoX30eM3UR5TMqthEHjqm9XXyLq+ywrelfSrR9+sLRaD5XUoK55vQxizDg/rm18UUjdc6u2REIuXkbiol59MfZ6kUayQVWaK07hbLld7HXX+p5sE+YCgfaTFM32zEh7C8q2XMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r39WD0Y5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 35C6AC4CEE5;
	Wed, 30 Oct 2024 11:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730286148;
	bh=4rUNI+JFXZ5XibbCKmsFyYD6XhVKbqENJ1d3wM8EVj4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=r39WD0Y5yqozNEB5m/P+QtUMXBo6iU2C1uGsV6nYNYiHU09mNlmbjwLvcy6ALc7Yv
	 2NlrvOo13xmMmKL4k0flQUUwsC5iIcFCMmEmlFssm56ngQzM237c7aGy/tKXQJAdE5
	 TCjd1kPn48q7b5OKA+rvjymC8cuW4qTVCHBgJG+FU1K3G5Sv06OVFUmxXlKDmoLfw5
	 6lNmEdQIOKQZqWsADt+DwNF1xJCE6uJ/H3uoQ2A6v77US/Ay50uJGr28Sgd3EeScdM
	 +GOUe6TGyIYysls3UQP65/R51KDsVV8mhYFSC1eGFCTcfV4ofTRAsEVP5icwGiGbmq
	 R2tNj6tf4xJmA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 249C0D5CC93;
	Wed, 30 Oct 2024 11:02:28 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Wed, 30 Oct 2024 12:02:01 +0100
Subject: [PATCH v6 1/3] dt-bindings: arm: qcom: Add Microsoft Windows Dev
 Kit 2023
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241030-jg-blackrock-for-upstream-v6-1-7cd7f7d8d97c@oldschoolsolutions.biz>
References: <20241030-jg-blackrock-for-upstream-v6-0-7cd7f7d8d97c@oldschoolsolutions.biz>
In-Reply-To: <20241030-jg-blackrock-for-upstream-v6-0-7cd7f7d8d97c@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kalle Valo <kvalo@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Merck Hung <merckhung@gmail.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730286146; l=1093;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=DgFc8aQ8HIqN64ClW7BBe1urBd5WcqgKYWYBfBQ5dNU=;
 b=B1ICw3LaH7gCKfi1eSMRcDnT7aSPe97g2v77yqiLSjxzrLVAfGYXsRS7B2N/4xVJJQybT7tIS
 ubl5wB9CCGcBheQ0w5REkTrZu1fBMs1Ug0YHhjGU6vXDgWDnwovWEe3
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



