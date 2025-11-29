Return-Path: <linux-arm-msm+bounces-83883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B28BC948E0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Nov 2025 00:22:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A3A1534608B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 23:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B372726E6F7;
	Sat, 29 Nov 2025 23:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pLf3Fvd3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845A51946DF;
	Sat, 29 Nov 2025 23:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764458564; cv=none; b=P7B5i4iCOJ/o/wPK5tJOaNSuenCb7+0Q0rnXtM7MHmcc2mT0PSm5s37+5P6kzYPUb87xIp3iRgnvMwISiUicx+v1ZdbqnN64I14m6+d8cZAc4T0kxnQEa5i5wFtNE8YL1JVslE0CEb9DUNQVvGb27FYXWH7l3l0KxItr8DJjzHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764458564; c=relaxed/simple;
	bh=pzgpggSffjmu4LyW+d6SIZrFFzwDKwKno0dUJdce0W8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=keMxl5vyi9KGHB8swPzNSqzvAByYzdcVVgsnH0bNaVejTmkv2jdIyDaF1NZOtBrvaFMXjuV8qmgDfSpx/b3R6Nbtasc14E7YO5hl0OarPBosQTZ4PxueDOVohIA89B9JsWHF0hRE8ZJTC+ec84XK1JOyDmt7GwsBNr8sJ0ndJJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pLf3Fvd3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 49BBDC4CEF7;
	Sat, 29 Nov 2025 23:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764458564;
	bh=pzgpggSffjmu4LyW+d6SIZrFFzwDKwKno0dUJdce0W8=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=pLf3Fvd3QpWHBhiXXEJcRqkC5teWhyGlQQwynQxpKUG41zNZ47KUWSH37w03GyTBQ
	 M3lqIGqAVWc/q+Qqc1sdO775YR0jPdkLttATyCpt9YcFx0h+aJ8FH7ejlRB6tqkI1O
	 OdFBZCRHJGY5rETK4jTqGExlWqAe0LjuPpFlj0yuogcJYtQBadeAHnsTq8yguRU8Jo
	 8hyrx/Wvjxd5ZL3Lntq9ZxYRjkSWK6+QWWUmOwE6s2agi+CI0/lEn+PD3/O7yxEOTf
	 oOMUQnfefK/VJcI01AizZbxEAQ399XFrLwPCOk33OX5DZuQgtV1QrzyO44lDVyPQlA
	 qEGGIcUsOBH5A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32248D116E2;
	Sat, 29 Nov 2025 23:22:44 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 30 Nov 2025 00:22:39 +0100
Subject: [PATCH] arm64: dts: qcom: oneplus-enchilada: Specify i2c4 clock
 frequency
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251130-enchilada-i2c-freq-v1-1-2932480a0261@ixit.cz>
X-B4-Tracking: v=1; b=H4sIAD6AK2kC/x3MQQqAIBBA0avErBtQI4SuEi2GccyBsFKIILp70
 vIt/n+gSlGpMHUPFLm06p4bbN8BJ8qroIZmcMaN1g4GJXPSjQKhOsZY5ERi8pHEsjcRWngUiXr
 /03l53w+3sAF1ZAAAAA==
X-Change-ID: 20251130-enchilada-i2c-freq-aca7fae1c70f
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1148; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=ReqOoZR6+itmM36ehLoW61mYST+VhDMpNFMsVslQ+Q8=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpK4BDigd2kU+6OyzeCvnrAaf/24n9+rMDNj4yM
 EIfKKjAipuJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaSuAQwAKCRBgAj/E00kg
 chrKEACQtzXZBAt0JWqvwythGdzHmGcWesX03W8+6/rbLK0qc9qrDoKF6YKVQDXGC6yCrH6TCzM
 9qcxM78oEc0x0uC5ek6JgiPzNy7qJM31jtNXCu5nGuddY4wSRADDYdcTnI29jMAu0Rl2Tn3725b
 VFoPCq6bp5azKKDkzZxo+/TH6SJNTdUDbAFCjLg3yYlb1G1AMPgbUOevnIXLoCiJkj0SF3g4A9N
 1OLnLa1TKzq7Kpt2tA96wsROR2PeRUBHgGP1YmgjC2Jmvu1eO/7Bx0hu9lPT24HAZwZSKjQtcmw
 G5ps5lIdFBofr90xPTVPCbGB9755Iag/VzPb2ZlPfw1Tcfenbvq8NWrqKKqNO/6xXYB8L/16mR+
 HDrJksP3AfNPri6Kj6i8JzfvEdquknF9tmNYTTeR5ny85D04iRiYOpHhvym8BLFlZ7OLedPTO6j
 lb43z/VGmZCsyOlO2bXez0GQ0NhQBeVo2I+8oQ4seQrZu3qU7cZijoEDaYP03p4D3zh9deWyeua
 /TL7KfpsRnkoTBF+8rCyNi2NXs66CYLrg+HgheYQfXv5qskKa+ZpROjzqqtCtk64qD7UdZSWEAE
 VvVrZTTWWzC52KLY3Bgfl+lJ3M5X1klODvZEfjCBTOIZYIBSE4L4dDf3NeMxQQkMq8XxazX67Su
 cQ7P3FrnZmtgZEA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Per the binding, omitting the clock frequency from a Geni I2C controller
node defaults the bus to 100 kHz. But at least in Linux, a friendly info
print highlights the lack of explicitly defined frequency in the
DeviceTree.

Specify the frequency, to give it an explicit value, and to silence the
log print in Linux.

Downstream doesn't define any frequency, thus also using 100 kHz.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
index a259eb9d45ae0..881d0f3ebca31 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
@@ -41,6 +41,8 @@ &bq27441_fg {
 };
 
 &i2c4 {
+	clock-frequency = <100000>;
+
 	status = "okay";
 
 	max98927_codec: max98927@3a {

---
base-commit: 7d31f578f3230f3b7b33b0930b08f9afd8429817
change-id: 20251130-enchilada-i2c-freq-aca7fae1c70f

Best regards,
-- 
David Heidelberg <david@ixit.cz>



