Return-Path: <linux-arm-msm+bounces-60863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D73DAD41FA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 20:36:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D162F16CD8E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 18:36:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2DEC24729D;
	Tue, 10 Jun 2025 18:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="mzfqWz+Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570BA224AE1;
	Tue, 10 Jun 2025 18:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749580555; cv=none; b=OCTA1rnB1DJ9NfHYlGulD+4bEh9olYWNG/ersiK2ZZSRspsBPNfosda4AcZprml+FpNWPqJSNg5+uoveoIx1WapAAnPiSc73DcWvpcPiiKQs53gLIFhrIxAjPtoP0LOL9rMKx4FoTLH+PbARNRoWy5XZb3nttBKOO8j4k2pTNX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749580555; c=relaxed/simple;
	bh=vLPzOnYDbV5TcDieyYUThcX1ba/niVvIygAJjfS2oko=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n8RZkb/2kJbPSnltA+iWT8Yk/BZ018T+EzTPOL1Uz0RcTrE8bDwKrAxIeZm6XSFLv7D9q7zkEpLS/x2QNoQSE2vizN6Ke73ulNbDbrwPlqthS7VxPaYOEmJtRZ8dHmg8md7nCTkfyntrbmZ8SDRKtsahH/NSx4bR7rIq5XiOfnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=mzfqWz+Z; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1749580552; bh=vLPzOnYDbV5TcDieyYUThcX1ba/niVvIygAJjfS2oko=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=mzfqWz+ZFFDSGMtxWAzL6wu04w5vBcHle+8tXflMqvrrs+0peCdfibVSQGOIxxilA
	 e2ay9d4Md+1BgkyEBFhU3xvikjwaNWqqJMAQLKwx3zPCIr4tG7PuUD7ouc/XAviPvy
	 mU8a+Pz8Nk35YgqAj5FbFQjuE+Vdk9yfauwNRKBw=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Tue, 10 Jun 2025 20:34:52 +0200
Subject: [PATCH v2 1/4] ARM: dts: qcom: msm8974-sony-xperia-rhine: Enable
 USB charging
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-togari-v2-1-10e7b53b87c1@lucaweiss.eu>
References: <20250610-togari-v2-0-10e7b53b87c1@lucaweiss.eu>
In-Reply-To: <20250610-togari-v2-0-10e7b53b87c1@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Kevin Widjaja <kevin.widjaja21@gmail.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=905; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=YcrIf8m3ri6wnc6ndgRonsQAOKZgeFC+qw2xZEyzKKI=;
 b=owEBbQKS/ZANAwAKAXLYQ7idTddWAcsmYgBoSHsEcCmjojh7dVGiElxIktUv2zWoXr2f7R0fX
 mfEVuFKAt6JAjMEAAEKAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaEh7BAAKCRBy2EO4nU3X
 VutNEACBW7W0aazL1ak3BzAOMs/ygiqKY526jlFs639oFGoff3L93VaFis4Iq9onv994RrLTHDx
 G6pJDHu+cLNF4Hjg4jm5W6B1cJxJgsYMH5ZJlmsYjjdZaJv75NaVeKcxbXGkm3EKnTcvVCC2Oim
 e4Qu3l5P9mICrzK/ep3N4TFoNgcHcykFSzwNrwbKZ++OPHOmYW1cuTnHnPBYeBHy7mLBSroLyoo
 osxgC/JHEP6iVzP8W3VVHfeQ9AhBZIaSPi4qgVpWwYAk3zG4a3etA2zoZlWXVBtt8A2uOTP+zy4
 MCdgRRML2VEawKXLA3EN1/F/FEb7yks9wKMKXZmGmuLz/WiplwS4EbjzJE/kfV222YGb93eSDDd
 v6VBtByD9BJ3czy5EQrkuECm77f0K5c4Lr8OeGZRpCpW967wDEpnjZwk1TmQ/qInFLpBKKK/qIy
 J1W5qhfxsmBos+1N8OjOTHH1gKDIJn/dgflfF9ARzJWEusEfG78Y1xsKcmC5Vb9bqt5TGaRjG4p
 Ct/uJZEI3Cr2qO4VsQF/KXS2ETLFQAfb+QtoOSfKfstvj1xVs6PIu7z2vUI90K7vT4LBnerRmlF
 D1C9Eowua5rr0Z7nmiB9d5sYgCXcNJr6fvOf+QvbjP9tREYcbqZbiPRUwsRY1cGJ3kzVbWEzydP
 s31GgDf/09OvqDw==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

From: Kevin Widjaja <kevin.widjaja21@gmail.com>

Set usb-charge-current-limit to enable charging over USB for all
sony-rhine devices.

Signed-off-by: Kevin Widjaja <kevin.widjaja21@gmail.com>
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi
index d34659ebac22e65a511994ef201fe04f12089781..1dc9fa7f3ca00a13f4a33989cbdfc715176e3307 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi
@@ -446,6 +446,8 @@ &sdhc_2 {
 };
 
 &smbb {
+	usb-charge-current-limit = <1800000>;
+
 	qcom,fast-charge-safe-current = <1500000>;
 	qcom,fast-charge-current-limit = <1500000>;
 	qcom,dc-current-limit = <1800000>;

-- 
2.49.0


