Return-Path: <linux-arm-msm+bounces-82347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CCDC6A27F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 15:58:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EA0254F913C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 14:52:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FF3F35E544;
	Tue, 18 Nov 2025 14:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="op4/i13X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E9035E525;
	Tue, 18 Nov 2025 14:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763477549; cv=none; b=rEgJ1FXSjsh0SIVNu/+iHavDIWEXD/gHtdrgAUBHmu1n1F8ArxRQasP1GlzOR5RdkKWt1ZcPgsyNqbIS4H0gzEpD7nN2Cqu7LUXjCvwVmF3aNI1TQwr6Ec/UTklvwTBxIljSE9ecYxktb9oIY7eqRDwdBD91AIO5Pr2EGs119rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763477549; c=relaxed/simple;
	bh=14l2r80BaQACkPX1EphTCGXkdbIzDs3FbN8nmQRvG+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XeGvImOYqClUhguVW0iECwo4kQrCvECT9ozwE24Ax9d3zpy+JCb4+dlKRZTwHIc6M/u5DwjkG8PTbxpcBXquUXoV4W/qDVzvA0Qq8V1DPK6Eoz0/Euly9xo61c9Wuon0iKDUXwtcePuL/uwlvBb+AXgjXoo7wWoeZr6eMRLvQHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=op4/i13X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5104BC19422;
	Tue, 18 Nov 2025 14:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763477548;
	bh=14l2r80BaQACkPX1EphTCGXkdbIzDs3FbN8nmQRvG+4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=op4/i13XVSIOxyHyJVA1adF1DyLjPRpxKxqSb+v2Fna5lPZZzr00c0U7B2EnL9jN0
	 N/fSU90Bvh3g9AuUEfMRw9YMuirBMRL/tGeGIzHhNuVZgipraqe9tN1MSXqXB/twSG
	 9KfYMuRi0lcj5GVCVfOd8BFb2UthPw+J/FaqrbzEuvSjG96970QoTvYJ/K5mfjQeHZ
	 jbm3q65r5t0YTdIVQ8PuGE2A3bW1GdQesZ9B7OqVl4vR9HOximP7LWlWwr0iFNj4Rg
	 BmaD1RMLU5z3Jmuy2xZtRz9BMyKtYOtGYfCTe1NRavqt+JEqSWVVrPePeTanGX02T9
	 ClB0cqm9LrLtA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46A19CEDDA1;
	Tue, 18 Nov 2025 14:52:28 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 18 Nov 2025 15:52:25 +0100
Subject: [PATCH v2 1/3] arm64: dts: qcom: sdm845-oneplus: Don't mark ts
 supply boot-on
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-dts-oneplus-regulators-v2-1-3e67cea1e4e7@ixit.cz>
References: <20251118-dts-oneplus-regulators-v2-0-3e67cea1e4e7@ixit.cz>
In-Reply-To: <20251118-dts-oneplus-regulators-v2-0-3e67cea1e4e7@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=917; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=5nZsCxOzB3he9zSNaWx8v74jKqawneAxQrXzh0tXKDk=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpHIgrjEg0fkQCIqBkfcdSiULSwWHumyZ3X+NeL
 V0pqrwy1OWJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaRyIKwAKCRBgAj/E00kg
 cpFQD/9FyhkhMowgn9e/ffxXz2s86xru0feIB0BULHfQk+mnbgeLADdl7zU+s/NAi/MS7rD6jbO
 /jQXwLEXI6F8JBidtMJxfDArLLZFQ7D0hZIDSPOR1fXdzpmxZAaLolh/ZWLhb6PFl5zGVfXfWGd
 vK3QizYky0X0gJv0R70+hYtkgi7pKnr+BSqXPhi23v4vUO91QuB70rW4zeMlNniNCC51AXFwWDV
 8wPsuBgslc7Rh3FZ46hXt/1kj3a7Jn1FnDFdMjQ13gDy+Blp4Ar67HSmo3ezxB7SRUfraoYf4cy
 2p02i4r9kVTshhvDX6izTmXXt7EPiO02vk3C10TnOn12yRGJ4G9wLseZEpOUTiP8gINl6iz3tnP
 9kd83iy7PJ0oI5rL4lQMOLaH6kF67DtaAK3KH/ZJ9YQwNxmJeCTa0l8ShbVs7k0zJPMjXWNennj
 667Gae4+/Hjay0oFXdzzpQtFo+vY+nkHSlMiIQvGh9ki3cULGdFX4yc5PgQ7aoFFmUsq4D8jsVE
 Psvr//Wxqp42JqB3Fg0w41z0bArLhwSYE5PGktl39kCLMb59dfZ5eFTC6g8p55PM3SSmxv6IGVq
 FxvIHp2BdwU6uZUI5bNOpkPF/i8BSY2NuD1TlqCpezolHoXrsugTp9sm65bDJn0MpOx6J6U9ePk
 mUcsrXVYZZC0dGw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: Casey Connolly <casey.connolly@linaro.org>

The touchscreen isn't enabled by bootloader and doesn't need to be
enabled at boot, only when the driver probes, thus remove the
regulator-boot-on property.

Fixes: 288ef8a42612 ("arm64: dts: sdm845: add oneplus6/6t devices")
Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index db6dd04c51bb5..ee62adfa6af0b 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -148,7 +148,6 @@ ts_1p8_supply: ts-1p8-regulator {
 
 		gpio = <&tlmm 88 0>;
 		enable-active-high;
-		regulator-boot-on;
 	};
 
 	panel_vci_3v3: panel-vci-3v3-regulator {

-- 
2.51.0



