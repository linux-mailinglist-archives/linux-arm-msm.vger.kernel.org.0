Return-Path: <linux-arm-msm+bounces-73840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D2347B7F556
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 15:32:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41C4D3BB373
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 01:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 320DA22B8B6;
	Wed, 17 Sep 2025 01:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="aw2RRCax"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620322C178E
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 01:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758071486; cv=none; b=s/mw5nOrknmqdKOvM1lIlukzK+tU1H3B5PquePND4Jw+LY49SSSzygK5vlwkMY6K3T3ELSOHmccd2pAx2dBaRR/13hpBM4YVVKeKTGDfqx3OnaZnZ6yqYakiRcygXxOI4uV94P0OiRQ12nEgVPw7fvqgx9dq3rOlgWcKMGG9Gc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758071486; c=relaxed/simple;
	bh=4A0pTY/r00iXG0eCKZOKSizZtOQKUJ6iVrZvAnx3Soo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DwYYSUZ1RJEZs6SUhw3aimpHPOeqsSgvFBZYUtMssmgGllNOmiDGnIT+mcIS32Qb+MW/vGwXapg2poaFu7b57Jwx3hBkI2NvhKXMn6dMevtCevCis+Y+LSQ3OG9DLOq9t7wyX1xqQ/UTmY3cS85kZXPsyXFWlSGhE7SYKh0uRjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=aw2RRCax; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1758071483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K5LsA6788TohTMhJyMFVGJXUVKzjVvS4nvp3+t+5CR4=;
	b=aw2RRCaxjd0tn7HYqhtEIG3Ptzo5SqzP5Y15s2g8p9Xnf5hG5XDCZMCsED1aEWUpB9fNtz
	MlCMWMmkEjkApP7a9KUynOJZ3MyWPruNnDAjdET/vz7Kw+N1l6LNYUMzmmmjhfoF3IVOjm
	lJCCO33lEZ06scwFVt3WrVSOt7kFcw73iPODKmHHFh7dbVYDkeYH553523paJq5+pEZD4y
	q65fR4Wr7iRXJ+/e9WY4sZmzaJS2JQwHRSbf8O4t3fKkK7XZiEWQBeBKKYSw3AaQZfRPBu
	PB0oDsCShWDqgS5n/e7NmiVrYCh6JEWDZuCbxgrVYw6rtzmroHfqV8mGKbqAHA==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Tue, 16 Sep 2025 18:09:59 -0700
Subject: [PATCH v2 13/13] arm64: dts: qcom: sdm845-lg-judyln: Add lab/ibb
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250916-judyln-dts-v2-13-5e16e60263af@postmarketos.org>
References: <20250916-judyln-dts-v2-0-5e16e60263af@postmarketos.org>
In-Reply-To: <20250916-judyln-dts-v2-0-5e16e60263af@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Amir Dahan <system64fumo@protonmail.com>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758071415; l=1151;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=4A0pTY/r00iXG0eCKZOKSizZtOQKUJ6iVrZvAnx3Soo=;
 b=zmhOGULntOrTwQvWewxGiOMTDxAebMYCnVHxCWd19YUqDtBTfcJQxax28nZIMokbi8GhPUfAd
 5wPrYZRGB/ICSX+dSlg7rf14j64eVnH/njEKC7ns1eyJ5QG0fF2ibG/
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

`regulator-always-on;` in ibb improves display blanking issue

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
index beb1372dc6c17f5f06c2044412ee1c8165858cd1..44ab98964ffe722144e01efc41e135dc7700fe95 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
@@ -69,10 +69,28 @@ zap-shader {
 	};
 };
 
+&ibb {
+	regulator-min-microvolt = <4600000>;
+	regulator-max-microvolt = <6000000>;
+	regulator-over-current-protection;
+	regulator-pull-down;
+	regulator-soft-start;
+	regulator-always-on;
+	qcom,discharge-resistor-kohms = <300>;
+};
+
 &ipa {
 	firmware-name = "qcom/sdm845/LG/judyln/ipa_fws.mbn";
 };
 
+&lab {
+	regulator-min-microvolt = <4600000>;
+	regulator-max-microvolt = <6000000>;
+	regulator-over-current-protection;
+	regulator-pull-down;
+	regulator-soft-start;
+};
+
 &mdss {
 	status = "okay";
 };

-- 
2.51.0


