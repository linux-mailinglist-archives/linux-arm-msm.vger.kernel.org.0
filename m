Return-Path: <linux-arm-msm+bounces-73416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BF1B563E2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Sep 2025 01:59:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34E60189DFAE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Sep 2025 00:00:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02E172D3A6F;
	Sat, 13 Sep 2025 23:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="Zn6NK+zy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDAE2C15BA;
	Sat, 13 Sep 2025 23:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757807874; cv=none; b=uD5iShy4pDgL7wF/xpBG/oPu6Icfr+RXL6ZbXlROLGyeOFQmZjbAHVeoc3dhie8YEbmG0ZQ27an3vRshmp1jq18hZ/Nopn1rgU2ItaLdxFy27/551wBsb8jsVJQgQ5U9G6BITkgqTN3uoe2l/PtKHcHjuQZtqc4C3wHDPoIFK0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757807874; c=relaxed/simple;
	bh=HCg+09YE5lJhs5YegCwC4b9WI5HoU61VEmB9SpqZGW8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tq7Z80NS8wST/zeblxV/OBGDIBm5Wp3f79EXdYq6izT7KVcb3s8628VID902K3rRJwmd5npB5VjL6cciybEAxPdWiDiJnbXELb2kbTXyRt1Lb61CoLF0TFLBAZmujnsxoJs9+bE0rSaWKQm/Be3AyeNUtjI0z5x9URCS0lEMdCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=Zn6NK+zy; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1757807871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Aee1JrxbZPxKxw/bzbPfndYlvZZB3yXwS4bEcJO73mI=;
	b=Zn6NK+zyoleNGFUcKqgeJAyXFbi5IfexaGc7B74vOMIcLlY2GKoHxPQHljUiWnfxdV9yID
	z91r0+yza6QwdVIehSJxA6zZRC1+TNwecV+nkWvIF45DebQEW+NZaXip1e2AaCqONxiRn9
	wZ9CkM91xpsJ6yJtgTNt4/IqCEXo56wzzUnyIyJiiaovK2BPyr1Ap0jDe5RxCgk7H7AIO2
	KqnbP207zfFbAbR+bZklPxv9ju/SDwHeU/dvaUSY8ezYsMWuNi9loMwigtfNLtRy+KE5Dc
	v0CA2TXmLRN0toBTDhWTQJQng4yIdINoPPgUh+AIpQCWgtY2azbRZ5TlhR7Gww==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Sat, 13 Sep 2025 16:56:43 -0700
Subject: [PATCH 10/11] arm64: dts: qcom: sdm845-lg-judyln: Sort and cleanup
 nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250913-judyln-dts-v1-10-23b4b7790dce@postmarketos.org>
References: <20250913-judyln-dts-v1-0-23b4b7790dce@postmarketos.org>
In-Reply-To: <20250913-judyln-dts-v1-0-23b4b7790dce@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Amir Dahan <system64fumo@protonmail.com>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757807839; l=1226;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=HCg+09YE5lJhs5YegCwC4b9WI5HoU61VEmB9SpqZGW8=;
 b=3iF7QnHI8rMVPg1FY2N3yULFpi9A7XOPKysf3P4l8WhjJ4Ftp/9AqsDLq9trYECnW8ILBdzOJ
 QtwqH/DJuBjDIwnJdTJMZYTIdEub6kKMO7h7qt1xs7hTI+qndn5bTcw
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

Fix style issues and sort alphabetically

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
index 467aa0fd0ef3938e4a8c08b2240d4dca2f74dbcd..493b8554ad8ef083d836a6664435010ea915f2e8 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
@@ -75,15 +75,6 @@ &ipa {
 	firmware-name = "qcom/sdm845/judyln/ipa_fws.mbn";
 };
 
-&mss_pil {
-	firmware-name = "qcom/sdm845/judyln/mba.mbn", "qcom/sdm845/judyln/modem.mbn";
-};
-
-&pmi8998_charger {
-	status = "okay";
-	monitored-battery = <&battery>;
-};
-
 &ibb {
 	regulator-min-microvolt = <4600000>;
 	regulator-max-microvolt = <6000000>;
@@ -144,6 +135,16 @@ &mdss_dsi0_out {
 	data-lanes = <0 1 2 3>;
 };
 
+&mss_pil {
+	firmware-name = "qcom/sdm845/judyln/mba.mbn", "qcom/sdm845/judyln/modem.mbn";
+};
+
+&pmi8998_charger {
+	monitored-battery = <&battery>;
+
+	status = "okay";
+};
+
 &pmi8998_wled {
 	status = "okay";
 };

-- 
2.51.0


