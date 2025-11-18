Return-Path: <linux-arm-msm+bounces-82328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FC9C69E43
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 15:19:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 91B474EE09C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 14:12:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A754235A94F;
	Tue, 18 Nov 2025 14:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rxxrhzxa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53FA63590BA;
	Tue, 18 Nov 2025 14:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763475098; cv=none; b=m6zn48H3Ye3FyAuGqjW1+OMrDFNQ10KxfSczMDb2EUAbIbRUjLM1ddzrgst3UJ0zb8zzDaNN+XIShgEdAjrZjFUsCewC7G1JiIPZI948MYiIwZ00uxTc2f56dZINVR1bemfeh7q4acgx2dn4fJVDdciC6AlFK/4b/DZr2Z5FBRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763475098; c=relaxed/simple;
	bh=Y+O338cjSPRWn8rHveQRQyUuoXCvcdx7NC8N+SHJWaQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G+Bh34lZBydCxKLxVsRi/djmGzPsr39IeCzy4FU4Uotn/GGWejzTttdGvV2MQ60T8pvl6nxiFR1ZYXNobCv5+0X1LtMs2/iwdnzvUOZoEiqogzy2LaPp2B1R9dzMwZLS60uA+DNXhEB1xtjPhJBTahalF47liaeilH+Q8qo3wrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rxxrhzxa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CD458C2BC87;
	Tue, 18 Nov 2025 14:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763475097;
	bh=Y+O338cjSPRWn8rHveQRQyUuoXCvcdx7NC8N+SHJWaQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rxxrhzxawBndcEEQ+yyYgheyDtu8FNa3Y6OBm+CujEOUvi5YOjN3EfsZotX0HLbbh
	 ajnvox7ooW5vlMf5b3G55X74LcFhbhmyAFtjRjFQZwLPmuyrgtcf657LqrelbZbcCa
	 ec5byGlc5/j5i317LKxcwRlQLHCBrv+S14AOX1OmpCOiucrNBqSEcww1IMbkF07TP6
	 qUEhVfOcR9xctE/a7093ocU8V5hO5/WQtNLTMAkZjGo6ZqGpx1N0dbL6yrJ0eHo2sD
	 iD2SQ+Apl0Mm72igW5i4xpdZqaCFnJQBNnU/76Bn0HgW+gYSt41XicKV5wA+ctvTXE
	 7sOHZMo/P/lcg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B73F5CEDD8C;
	Tue, 18 Nov 2025 14:11:37 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 18 Nov 2025 15:11:37 +0100
Subject: [PATCH 3/3] arm64: dts: qcom: sdm845-oneplus: Mark l14a regulator
 as boot-on
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-dts-oneplus-regulators-v1-3-79fb2f0f253b@ixit.cz>
References: <20251118-dts-oneplus-regulators-v1-0-79fb2f0f253b@ixit.cz>
In-Reply-To: <20251118-dts-oneplus-regulators-v1-0-79fb2f0f253b@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, 
 Casey Connolly <casey.connolly@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=887; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=Ta5X0H3ltp/2yAQWkY/Fdyk+Qj+G9KOs3FeZkTC/U5s=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpHH6YcfF51/xBAeogwUNzgphE1Yy20ZD2ET90k
 +1NWhhPMP6JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaRx+mAAKCRBgAj/E00kg
 ctXXD/9LEYvaE0K1FzUiwLuIWfYcw/VTW8WR/cKXOVllao1s06aXjdtuWREjaBnxrLx3LpHGnEw
 RAuSD9z6+R32xWd0UWHPs7J2SrZfpfVZG9/FzeSHy3plaYZw/0InpNwIoEXZaWBBOzk/ZMJnzBA
 aj230OscC2bv4nDI0kQGRWa1WLD6l1UKpJX3SNrAADEUJxczRhZFBCJdqfvxStCqSkzACSgYrne
 9DgG2CqpV5INxVD8A1tEUBBPl5Msfa1nAFb0TU8TQhaJoZnT8E88KpWeKi3vyrJpUB9L5EMymT3
 6ozX0ynZct0Krvf0/TQ/suNxlhDoikJvkUJmSQ2rcVXNN1UroYp3oV22ifsSfT6vOgtin+vPOpk
 9uPWaWccwwkbh0/H/3yWO2Nzxu5G/XUbr9tfN/nCw+qaoQDtYpBKIPgBvt86Zn1Rdh6TlFSUrBY
 1p/MOYo6cW7nFL6HX1L8d6ILaJ1xhoYS18W+6TGmAdYGQEnci+dbvmDS6DtMK6WEeMWJzFyhpBh
 hmhzCxybtK93MpogboBoRjFAo6TErEU24Lc8j/Vn2JtiZtNdt4ZC8Rbwsl3If7CVLYB6U2MfaUn
 DbZm1Pg6yLFb2U3bRt4qNIhxi72nR46xT+9tcWL2579iLjxJuHRfJfOyZCgpJm6qUFOTYGjQKts
 oM31uLMCPU+Q1Ow==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: Casey Connolly <casey.connolly@linaro.org>

This regulator is used only for the display, which is enabled by the
bootloader and left on for continuous splash. Mark it as such.

Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 5845bc3bb80b2..8251f5a2f9475 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -272,6 +272,7 @@ vreg_l14a_1p88: ldo14 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-boot-on;
 		};
 
 		vreg_l17a_1p3: ldo17 {

-- 
2.51.0



