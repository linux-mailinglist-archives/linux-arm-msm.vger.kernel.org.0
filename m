Return-Path: <linux-arm-msm+bounces-71184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 820A9B3AB9C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 22:26:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CC5C566BA5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 20:26:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A761127A92E;
	Thu, 28 Aug 2025 20:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="utlkZaQQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736071F9F73;
	Thu, 28 Aug 2025 20:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756412795; cv=none; b=R4C5oB9lk/e2Cx6kG2iEJowH5uvmQyh/3Z/V9bqCTg9M648136VeJoMX7lz5y7LCbNjAoq9gAQJ7Fsqs5iaDmkqnCo77pct7mlbX7OiINVvdZRaOzZk6LCH48//wsPqoUBNJzcZXHHN2mVaAd2f+jzEeo/1xOeOpZkdZAtGsr40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756412795; c=relaxed/simple;
	bh=m/nsddc4nPf/B0CgUAyW3H9nyVylmSsD2eP8jYGRCxs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pTkMpzg8Ry+EDqCCWTnQK4hJUDUMcZwSxQdwz/eUVHtgKoI6pWFWoLW7kiAVaw9auaaB2GDsmSLzfP9oGxM0W14tAlqKQrO4+Z0k4SdWdSf66gvGJHkM7B+m7Zf4eWLxlljuyu1p6kZEZ7QI/ghWWMxklBZUz9uyQk8K94pZRmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=utlkZaQQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EAB68C4CEEB;
	Thu, 28 Aug 2025 20:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756412795;
	bh=m/nsddc4nPf/B0CgUAyW3H9nyVylmSsD2eP8jYGRCxs=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=utlkZaQQzU/yLL6yuV6iZekAuvYETsnDxd4qjswtY6g294wMvAEPS46HKPCHRTWOl
	 VOJ58b1K36I19mDxkyFNS/gfjahJiBY9noltWC2ODWP4fbf/c0Zt3YtY/bLgJOCRbw
	 kTH3NwtGlzqOvOrnD9BEE/bS2d33x2aibroW4xHqLRY5vA06QqhX0QvlKSZ9gIHoYe
	 EHaGCFgkwZCDZBE1yLOV9GHKaJPlQ239xoz3c8vCqcU1UE+9XEnXEfQLeSL7pK618S
	 RDE646T3/vihaTis4zMZVdUky97xTTIT4otBj6IlgMLxX5cz1McIMmeqsKdYmesdZz
	 MsYeU4KIZ4DRQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9769CA0FF6;
	Thu, 28 Aug 2025 20:26:34 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Thu, 28 Aug 2025 22:25:50 +0200
Subject: [PATCH] arm64: dts: qcom: msm8976-longcheer-l9360: Add touch keys
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250828-l9360_touch_keys-v1-1-1ce5a279c399@apitzsch.eu>
X-B4-Tracking: v=1; b=H4sIAE27sGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDCyML3RxLYzOD+JL80uSM+OzUymJdC7MUY8uk1KQ0czMjJaC2gqLUtMw
 KsJHRsbW1AHibYtBiAAAA
X-Change-ID: 20250828-l9360_touch_keys-86d39bebf762
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756412793; l=1031;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=vTTtjCb8Z411MNaWmMrf5RO0vPAzikIEIVbV7jqgHjA=;
 b=GQmcnVaxe4XlTIV3hXAuGd8f+NaEBGwQTFW/0HdMjpWDp5q3CDOIExKIPF8y1k3AhkRvvnfpM
 TqM3LRDbUVEA1GeM0Il7ypAMDopRVre7eGirUKhVpETU1iXjVDpEdn0
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

The phone has three capacitive buttons on the screen bezel. Enable them
by adding the keycodes in the dt.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 arch/arm64/boot/dts/qcom/msm8976-longcheer-l9360.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8976-longcheer-l9360.dts b/arch/arm64/boot/dts/qcom/msm8976-longcheer-l9360.dts
index e524d58cf0a4b7693741036e3988700559a507f0..18832a3b9a1c37d1c891bce64d1a9372e5be439e 100644
--- a/arch/arm64/boot/dts/qcom/msm8976-longcheer-l9360.dts
+++ b/arch/arm64/boot/dts/qcom/msm8976-longcheer-l9360.dts
@@ -190,6 +190,12 @@ rmi4-f12@12 {
 			reg = <0x12>;
 			syna,sensor-type = <1>;
 		};
+
+		rmi4-f1a@1a {
+			reg = <0x1a>;
+			/* Keys listed from right to left */
+			linux,keycodes = <KEY_APPSELECT KEY_HOMEPAGE KEY_BACK>;
+		};
 	};
 };
 

---
base-commit: 8cd53fb40a304576fa86ba985f3045d5c55b0ae3
change-id: 20250828-l9360_touch_keys-86d39bebf762

Best regards,
-- 
André Apitzsch <git@apitzsch.eu>



