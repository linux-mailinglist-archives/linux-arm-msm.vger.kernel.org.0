Return-Path: <linux-arm-msm+bounces-83198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A963CC83EC6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 09:15:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9C7054E5BA7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 08:15:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B58562FE06E;
	Tue, 25 Nov 2025 08:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="Sz6pnB9w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE95F2FC891
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 08:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764058416; cv=none; b=oKC9WowmkQ17KVYHv1V+ikWSnVE1nll75FNHR3aZOyhIfU89eEeNaBzFFn/R6g/qgdhygV6FrRFbZbH9XNv8My2uO9aBvLv0LURmiAxmGlQz7ab/rIK68GVmP6fLIptnLZeQmBeqUIUiJd0vxBiBRyTV5qO03HTsiQg08i5pras=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764058416; c=relaxed/simple;
	bh=1ymSiATbi1kGIBfDyPf3R3iepCLd8vbHR03RRq/oAws=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bDyHpKnbOAQki/hRm2WjqPhYLXiuQbuoq7uBA8tAcPPfK1l7baaRdYNQLEhH4yMj0fvHmFBukFlC6gpTe8VdRpZSCb12gHqLOAlpW0zzVsykayGgMgNO6ZGpUNCkmUuHQxMsHpyqe0mOkLHcVVgpc9aabKjLVQrR/tvNi37qHho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=Sz6pnB9w; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1764058411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3xatWoWrrdi1lzXq9EYVGOkG7TqQcoMezOWSiFZQ5Ds=;
	b=Sz6pnB9wCJwsGJ0xxP78lbiSaKE2PuQSk+6FS7Y1PLHHXw/RSmDJmRonh/C7kiEnZCJA3t
	bq4Pdw92w3C2zR0J/ygxfLxzK4G2IXBfMsgRuB8B5bquNy5GIg2Vh6/D7+nPb3RMgNMAiw
	7GkSJjNQ/AcoqlBU2e5r+dLK+kU+HPnlhgiMQsqNJtLk3x0LGa9HmLzXZnp0SlaMcduXSR
	DXigb4WDtM3QNtcD2uvJtKWL7npN3CMu9GScLW5v+6ZWFvEEZlpkxOkgsgdWbeqdMF7QYM
	1Vl8rvFU0nrSGCMAt7g1w6JZPbh1nbqIV/njSyG2k4lT6raGS7UUvd0mUZi7oQ==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Tue, 25 Nov 2025 00:12:40 -0800
Subject: [PATCH v4 10/12] arm64: dts: qcom: sdm845-lg-judyln: Add lab/ibb
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-judyln-dts-v4-10-a5a60500b267@postmarketos.org>
References: <20251125-judyln-dts-v4-0-a5a60500b267@postmarketos.org>
In-Reply-To: <20251125-judyln-dts-v4-0-a5a60500b267@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Amir Dahan <system64fumo@protonmail.com>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764058372; l=1050;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=1ymSiATbi1kGIBfDyPf3R3iepCLd8vbHR03RRq/oAws=;
 b=OV4D0nGR45ytsiZL18gal5QKIbtoaWQsjkbcjbC6H1d5ISvSZH6upFwNg9wOfpQkR7pJXETDG
 RQerrma6bgJCasah3Pn95/mW/x1nM+GX4FHGRTsQQXXaqlpggWojEwP
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

These regulators are required for the LCD

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
index a61f7bd65a7a..3188334d269b 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
@@ -56,10 +56,27 @@ zap-shader {
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
2.52.0


