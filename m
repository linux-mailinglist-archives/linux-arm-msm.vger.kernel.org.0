Return-Path: <linux-arm-msm+bounces-30314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B67966ADA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 22:51:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E9C71C21C53
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 20:51:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3AE91BF819;
	Fri, 30 Aug 2024 20:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q/JKN6NV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C214015C153;
	Fri, 30 Aug 2024 20:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725051061; cv=none; b=c9vk60XdsCn9TgtGazAs26dEcOrKfc8T3U7To0UhjAOFjAwBq2NL8VtKbrDDd+y1WGW6pvWKTu4qgwGkFG4g8xDAZb+EqMNSWiHM7r7tqzLz2R0cdQVmTKAkaboGDXqUunp5ztgAOADpPN7FCepZ3faqnbiudWVxcKPmOFeBgNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725051061; c=relaxed/simple;
	bh=wlq18c85cf5NFaz/GOdFOn9Y5Nz0ucxWSmCOdXWJFG0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HzitS3tBnbV/MyCE1FDbpLYNtpSkR9Q6XlksfM0x7LBny5jnlYRjMHjEK6iNKEjzQuPFlVUNu/dsXuN7tgFac6O7EUH3tGevdlgo6LU9i5dfbnQ0yyKMek2EMBidqKIHD7ny5lyDZ/OGnFZOGX97E18iv9o4vmHIrB6lrk92+CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q/JKN6NV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8C799C4CEC2;
	Fri, 30 Aug 2024 20:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725051061;
	bh=wlq18c85cf5NFaz/GOdFOn9Y5Nz0ucxWSmCOdXWJFG0=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=q/JKN6NVPr9umuFgSX+B5wSGFWvF2Sgf6I5CYX+JyhUTj4pZ3VSvqR18YGUaoMdBL
	 bhJXQr655OkKZ21Dijepjz52Bbt9/S/wiv+7L05pG/+axUke+w1ocv+ItzWH9cC1/8
	 KxYAWlfMN8ZA6s6aiTW0o6UUN/RqOC+idgV6wdqjRCPR5yKPjCusfT5OhKO75u56Q9
	 eNLlnahhpGnljeH8J2hkhOv2sIiIzeod/IfL2Au7fwlbM+u0DRkGK0dmRpoX2yMVb/
	 jc8+NuGpf2NS1Bc7Ztcfqh8KITj3bf6CJp2lpqiH/gHI3EigIvOal0IZcDI58cbjum
	 hmse3tIIcdrPQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74FDDCA0EF3;
	Fri, 30 Aug 2024 20:51:01 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Fri, 30 Aug 2024 22:49:50 +0200
Subject: [PATCH] Revert "arm64: dts: qcom: msm8939-longcheer-l9100: Add
 rear flash"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240830-revert_flash-v1-1-ad7057ea7e6e@apitzsch.eu>
X-B4-Tracking: v=1; b=H4sIAG0w0mYC/x2MQQqAIBAAvxJ7TlBTsL4SEZJrLoSFRgTi35OOA
 zNTIGMizDB1BRI+lOmMDUTfwRZs3JGRawySS8XNwFmTMN2rP2wOTKEwSo/CWaGhJVdCT++/m5d
 aP60G5wFeAAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725051108; l=1873;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=e8OmqrXh0tbGdO++XiKLMFxfWpEu2DvMhtbt6MUV/A8=;
 b=O92PbyqG9ghtpTVHIrrk4BWY3mb570s0wC+LCtYQgraW1WTvErXUQeUUY4HkEXbOS6+roClHo
 g+t/fpRE8VODfR1hFpZdFkMzkY/5hvmkmQ2j+HXDl50hZD8x03TIlZW
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

Patch "arm64: dts: qcom: msm8939-longcheer-l9100: Add rear flash" has
been applied twice. This reverts the older version of the patch.

Revert the commit f98bdb21cfc9 ("arm64: dts: qcom:
msm8939-longcheer-l9100: Add rear flash")

Fixes: f98bdb21cfc9 ("arm64: dts: qcom: msm8939-longcheer-l9100: Add rear flash")
Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 .../boot/dts/qcom/msm8939-longcheer-l9100.dts      | 26 ----------------------
 1 file changed, 26 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts b/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
index adc992ebc29d..b845da4fa23e 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
@@ -160,25 +160,6 @@ led@2 {
 		};
 	};
 
-	flash-led-controller@53 {
-		compatible = "silergy,sy7802";
-		reg = <0x53>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		enable-gpios = <&tlmm 16 GPIO_ACTIVE_HIGH>;
-
-		pinctrl-0 = <&camera_rear_flash_default>;
-		pinctrl-names = "default";
-
-		led@0 {
-			reg = <0>;
-			function = LED_FUNCTION_FLASH;
-			color = <LED_COLOR_ID_WHITE>;
-			led-sources = <0>, <1>;
-		};
-	};
-
 	flash-led-controller@53 {
 		compatible = "silergy,sy7802";
 		reg = <0x53>;
@@ -364,13 +345,6 @@ camera_rear_flash_default: camera-rear-flash-default-state {
 		bias-disable;
 	};
 
-	camera_rear_flash_default: camera-rear-flash-default-state {
-		pins = "gpio9", "gpio16", "gpio51";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-disable;
-	};
-
 	gpio_hall_sensor_default: gpio-hall-sensor-default-state {
 		pins = "gpio20";
 		function = "gpio";

---
base-commit: d7b69f6e9e1c8b6acdcce3b385779eb046835dd5
change-id: 20240830-revert_flash-4e184591da15

Best regards,
-- 
André Apitzsch <git@apitzsch.eu>



