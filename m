Return-Path: <linux-arm-msm+bounces-39946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFD19E0CA9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 20:59:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B7C916594A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 19:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0710B1DED4E;
	Mon,  2 Dec 2024 19:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CFUBq/6A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DB11DE8AF;
	Mon,  2 Dec 2024 19:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733169589; cv=none; b=GPuaHvRH0wJ/Lqw8TWLbzkoHXfk2GS3yZ2fWDdYF09gRrabFYPgooZpSXDbvn9/Tnm4C2YZRTwxS5ZbwL04Rt+6tt9TxwD5Ij7lHUxepFq8uGR/3XOzO4esMCM+qxaWG8kRek4dwicdZdGDthvR6IFMh54Jl3Ii3vvGH/Wp7yzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733169589; c=relaxed/simple;
	bh=hIal4ZihGtP1VxeLDdZnRSPntLVjWJEsWalJEhAC94g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WyY0rRcAngUN5BMT5KoIAp84TPiQzDUAbmrR0PYIRzYLsGX0cTz113PvF/nWLKKVdVIIho6Vo0HHj0vXhHLzPr/FEwvtMUj2h+uNmx3Bei8ERSgKJ3pUUWx1IwaGHshKADKiNNSlfpTIzxBxLxQ8BZxpRKMKgT/s4NMa0BEi62E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CFUBq/6A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5FC67C4CED6;
	Mon,  2 Dec 2024 19:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733169589;
	bh=hIal4ZihGtP1VxeLDdZnRSPntLVjWJEsWalJEhAC94g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=CFUBq/6A5zMMfVZS9O32LjKNZbOCB8z8Cnw2QIOWverH5F2XDkErDcO+59/UojJg+
	 L3CfqdzPkda8gaEe4I8pnAmzb6c+1ubni8BCSowyxYhYA6Jo5EwFGGf9hRkoc1g6/r
	 n/hIsKjakHsfNcgkdW7q7VdVNOXGP1rDYMPMJpQKN4Q8DgRvImD2I5BWM1Xs+YnwtW
	 8RBdzdkt5lDwwMj8tAj3KooFxuby9CbtjzPpulDPbLLOtikduF7tcyBm09wOfkcc2L
	 OnTn6PIEDdcxewILEYN4517C0JK743M5r/t/YKONf3WSC8MiT7WHHa8hS0wxjPtwp1
	 iLdACbe5iO3tQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44E39E69E8E;
	Mon,  2 Dec 2024 19:59:49 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Mon, 02 Dec 2024 20:59:45 +0100
Subject: [PATCH v9 1/3] dt-bindings: arm: qcom: Add Microsoft Windows Dev
 Kit 2023
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-jg-blackrock-for-upstream-v9-1-385bb46ca122@oldschoolsolutions.biz>
References: <20241202-jg-blackrock-for-upstream-v9-0-385bb46ca122@oldschoolsolutions.biz>
In-Reply-To: <20241202-jg-blackrock-for-upstream-v9-0-385bb46ca122@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kalle Valo <kvalo@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Merck Hung <merckhung@gmail.com>, 
 xlazom00@gmail.com, Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733169587; l=1093;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=LX8WC+UUa8VGzxldCLaN3GVYclZRv+gbn4J/xV7+3Rk=;
 b=B/RDkHtlN6DCV6DpCDzuXTOnGJTULIogSBHrOBcq+uXGJYaahzuWC1dZDYTRllZpQ3V6CfUPH
 swBLnOQR34YDgO32r4rgQgdURzwQuXIty90kQ8FQH/pQxywbG+DZoaM
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
index ca39903935104..d59ebc3ed3c3d 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -847,6 +847,7 @@ properties:
           - enum:
               - lenovo,thinkpad-x13s
               - microsoft,arcata
+              - microsoft,blackrock
               - qcom,sc8280xp-crd
               - qcom,sc8280xp-qrd
           - const: qcom,sc8280xp

-- 
2.43.0



