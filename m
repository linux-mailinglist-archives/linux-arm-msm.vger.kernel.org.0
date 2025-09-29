Return-Path: <linux-arm-msm+bounces-75459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 940A2BA7F8F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 07:07:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 028F917EDC8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 05:07:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE0E624166C;
	Mon, 29 Sep 2025 05:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="IHImWiqs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4DA238D3A;
	Mon, 29 Sep 2025 05:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759122366; cv=none; b=N1zWjPWLfeIUEfIcqyD73lAEQopUGT+VcrQd7gjiW4bs8nWKswqYa8MMCNSdj4eAO3fQZ7gorbse6Zw2Zv8a7jYrigySQURfwy5KO71ISllBZSRUg4JDeYdZNdSgT6rBhrHad2RW0wCzgEnmMSISykSPBKkIiWn0e0uxkLQJTso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759122366; c=relaxed/simple;
	bh=DH6b0F3wYf/MOOXHaxUJcWf5kKrraWYhciZwl9UKsFk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RmB/7RTX/mA7Kt0M8B4P+53nUdueEY5EsOZTVunIH2EO7+72SpBybFS+93thiRYFXluTeXeElVv4KO0HCfdu3AI6EhYMk7YE/DdmHdeKaNPVFHIqZMTRU4NtfeZIYeLiIR6EFf6PhJZ5E1Sjb9pFGak0z0/CUdlkFCF1LkpyTxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=IHImWiqs; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1759122363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2RDuHkT66XtIbodcDmp3dvJ0Z2+GaGWFLOIec/OeM4g=;
	b=IHImWiqsbspZ1sfi4Vq1I5feT/hIQ/frtkPgfxCsa5WHxsZbqaSphspL5YimUCbGdXhjCv
	ptkE1p0UtCWYL3gJlPBqleg6MX2GjJDYdJDyUGIRjN5qOMZmIehFo4RKTsF26gnq0SQqvv
	+WOkh+pJ1RnUuz5A3CNmROl2ATGWDiUGn6aFlv6EG7O5KTvpUEDaI2zUMkMuVNJbLopjXs
	ATQU4IDKyp8Y/RIkL5FeC0OEK87WZPXyPXRu8wU8pNrOdkh9unfaCjQWDnFX2Z+84FQWfc
	po4ie4t4xSm9lAZL4EdsSA3C5huwKzo+vCjZ1v5X809y5NYLG1gW0mvmloSAww==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Sun, 28 Sep 2025 22:05:33 -0700
Subject: [PATCH v3 10/11] arm64: dts: qcom: sdm845-lg-judyln: Add lab/ibb
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250928-judyln-dts-v3-10-b14cf9e9a928@postmarketos.org>
References: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
In-Reply-To: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Amir Dahan <system64fumo@protonmail.com>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759122330; l=1119;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=DH6b0F3wYf/MOOXHaxUJcWf5kKrraWYhciZwl9UKsFk=;
 b=Hq7ZtfIijO36KCueNHlbWcqr1RhkRdXApYggDXykRxpIe3th3Q8+r0zfryZ+5lKH0xQ2x/l2B
 S9gYkWjCc7sAXWokuWhuCi0weAEGW+psIZCAJS4hGgWuB4BcRE1rgpH
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

These regulators seemingly help the lcd to work better

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
index 3106fdc9b679bc6a43a1a490c61b73a63003f7e1..9c3662a3d93e124667474753e0f11d0e98698aa0 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
@@ -48,10 +48,27 @@ zap-shader {
 	};
 };
 
+&ibb {
+	regulator-min-microvolt = <4600000>;
+	regulator-max-microvolt = <6000000>;
+	regulator-over-current-protection;
+	regulator-pull-down;
+	regulator-soft-start;
+	qcom,discharge-resistor-kohms = <300>;
+};
+
 &ipa {
 	firmware-name = "qcom/sdm845/lg/judyln/ipa_fws.mbn";
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


