Return-Path: <linux-arm-msm+bounces-97741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LlkDYYAt2mKLQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 19:55:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D488F29220F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 19:55:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C058B305F4D1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 18:53:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6965637CD32;
	Sun, 15 Mar 2026 18:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OAeXjpl+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A4B37C924;
	Sun, 15 Mar 2026 18:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773600774; cv=none; b=ci62mDWcFurLutOEdF5yiPF45cUdi3YR6NQKIoGneuh2zuXOrt2fNp5vQyS/+wrYZdJmj32C1ON8lOAwxVlxLCM9qwkOAKcVGOxkXWWdidKZG9ONYt7GVH/thYJacmzBkQxMgwev05/js7FCZKC40ImJ/UHzsuSKn9A18PHnSx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773600774; c=relaxed/simple;
	bh=DRN8Y2azyPABZr+mUTsY8ADaTpvTOyUxWI2eOU/dWp0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iHzx3XIgcU9q+w2Wu+dDfZdzhP8i2PZTqr9Wpo5y4w9Qk50o7kHu+qTmiTkZgUxPcEEaTbDBxKxO5PLCGWVbO6zX0NczPS1HKyaqAh700nyrcqsqGwpQXioIeyL9Gz7ZOmeyK+ZRNNZTTSB0qmXii0RTc9czNnvIwvQrQrzjINw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OAeXjpl+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D600EC2BCFA;
	Sun, 15 Mar 2026 18:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773600774;
	bh=DRN8Y2azyPABZr+mUTsY8ADaTpvTOyUxWI2eOU/dWp0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OAeXjpl+VhkelY+3qCifOb7WHdtRSrnVmMkjj2LOJIvj23739HrT0R5pLuubtxWro
	 nxJRoN+orRQTNanig4BZJRTpXvYGrNeR5k1UIJ/y6HTSGgwiN++0+4R6AMrzLUs4OO
	 KGKBZpjV+wfMScHLKwiWp2MugwoN3KxnMxHc9rM1NC2hlsN0P/VSqedJlJpqElBkUa
	 DGCL4yrw2aoTHlL27dtpH5mXMsInCogpBvjKz9iYgBLQurJpppz2rjfe2BsDSZtul8
	 8QS7zI6rkq5X06ji/XjOpXjXmCgWgAVUyOyOOGxtVKeYTUMs4L5sa5nXx/bvOK2EqT
	 MIrjlWubT30uw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBDDDF30282;
	Sun, 15 Mar 2026 18:52:53 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 15 Mar 2026 19:52:47 +0100
Subject: [PATCH WIP v2 11/11] arm64: dts: qcom: sdm845-google: Add STM FTS
 touchscreen support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260315-stmfts5-v2-11-70bc83ee9591@ixit.cz>
References: <20260315-stmfts5-v2-0-70bc83ee9591@ixit.cz>
In-Reply-To: <20260315-stmfts5-v2-0-70bc83ee9591@ixit.cz>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>, linux-input@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1222; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=GLiD2nULc18ENMziPB9JyYEPA1R8XKpCMXaNSc0DKdU=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBptv/6OhC8SocPmih7wGnZLPlUoktbgC3LKcDkk
 rb7jDcfKtuJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCabb/+gAKCRBgAj/E00kg
 cjyAEACecNgd/QeeVImpnVd0/qO9+NmYGuaGVLUdkOlwiR1azyYsPURJ0BoyOPVPUtW2SARrkbp
 /8y+IyIkP6AfVP++jl5EJ6Yb7RANAZofa7WRVNE7EPvM+AinjYj7tk5DCxmS+XbjjG+2fsOZL4n
 Dl0gV1yktFmywT+QT8MjjBZDsgbfZpLBjqJxQmtL4QLcK4bgb78wF0XiWrL4LRdHzKAU6OlpJaI
 LLZhvv4S1aZDfByji/VpDBP7wd78ADZmLqgk1qJrkzJGUpvMdkBWuNNy0ShAPwPQ/6qBCLxBMfi
 KGv68gmommlUQfPd6LWmEX9MRo8aVQloJoeJsr59cRpxKhqYzVENlAF0F2K02rH+CYwz+L1mrER
 z0r96/B3M1MbE3+C2x0pQaXCgiROmD9uWKcQdaURbtuTU7ZPh8a2o/HyfGotrhpkp7dpHd+gaW6
 nWbiiAQACYEfnCaawvKmRL5nX4eUXAN95YFnE9twgQpyQDKJjRMmpAmPpjqF97P3p7LTMpuutth
 cGBOEnjMVoyfpjhAt1qL3bw8zlbnbds2TzfEgRV7jZTAC5o+q6oR4UwDc7HpU3jorAULWVBzD+h
 T88D7ApzdQs8qIaVXoxc9Tf55Dwv6W/74Eed+xnAqYOhVLlW1Knj7K8nSzP+kO6QAFxtb8DY0I4
 yXJg9gbgW+l2ccw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97741-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,foss.st.com,kernel.org,bitmath.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[protonmail.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,kernel.org,ixit.cz];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[david@ixit.cz]
X-Rspamd-Queue-Id: D488F29220F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Petr Hodina <petr.hodina@protonmail.com>

Basic touchscreen connected to second i2c bus.

Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
Co-developed-by: David Heidelberg <david@ixit.cz>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts b/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
index fa89be500fb85..48d7e7f83c285 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
@@ -26,7 +26,25 @@ &i2c2 {
 
 	status = "okay";
 
-	/* ST,FTS @ 49 */
+	touchscreen@49 {
+		compatible = "st,stmfts5";
+		reg = <0x49>;
+
+		pinctrl-0 = <&touchscreen_pins &touchscreen_reset>;
+		pinctrl-names = "default";
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <125 IRQ_TYPE_LEVEL_LOW>;
+
+		switch-gpios = <&tlmm 136 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
+
+		avdd-supply = <&vreg_l14a_1p8>;
+		vdd-supply = <&vreg_l19a_3p3>;
+
+		touchscreen-size-x = <1080>;
+		touchscreen-size-y = <2160>;
+	};
 };
 
 &mdss_dsi0 {

-- 
2.53.0



