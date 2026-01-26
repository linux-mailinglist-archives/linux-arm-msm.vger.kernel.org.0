Return-Path: <linux-arm-msm+bounces-90593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wA+KABiYd2n0iwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 17:36:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FAD8ABCE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 17:36:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 55714301AA8A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 16:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 639AD3431F5;
	Mon, 26 Jan 2026 16:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="ai1zGaT6";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="mgC+phku"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A81D343D6D;
	Mon, 26 Jan 2026 16:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769445390; cv=none; b=RaYyuSGZj1ZBomErD1c+oHJJU3lyYBGptmzYfDcp1RUs6lCq9C9CioMkg3r/Lzal6ICAiRVCja40N4jMGJNFGyVLKgbCO0IsaaCgo/BYek9jE4j0fJIwA1SiyKa/2wWTf64uYe+8IGc8K/O0nTfS8749IV7T/Zze9P8KrAVVzu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769445390; c=relaxed/simple;
	bh=KmSGZAPOA/EmLr4+XusNqLJfnRxNxjmUq0BkrQWKJl8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h5BupiDGaSw5Xs8jjW1wjjgMV0XBKW5j3QYA1NFv8tqBgZEEqrYJADFdLK9myaLI3IxwLSSvuDX9Rx5CzIFPQ+SAHkQFLrgUkzbpNdo+JlOwJu2txS20D9diV476TDtCJn9FzdT6/trc5yqfSkug9SFSE3VQFcRuexM7EyLaHkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=ai1zGaT6; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=mgC+phku; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1769445295; bh=Mve4+ZS70I8fnOLJmWTrmWC
	2UftHU3YU4RPNj6SKMZo=; b=ai1zGaT63k+eaLojSRgZwG+2v73isKXmIpR69SsQkJiD/nlRKu
	cCmpKXkmPn85SI+AFQ87VZfdvn5R3++89aYIIGWZNJAfx6ubKP1IAKWTndexI43hv/0XwVuHl4W
	NLQv5RS1B5e7wafTs8GJewtnHZqFCEx1sqBLQbzY4P05qG708iFztDzJlIhJ3qI1GsZky1xw2x0
	nD4z9xaSZov4ceFpI+c9yuWmxDGi9sCuL4XNsMLyxgKk2RMVsRN/zUKU+MhkJFr5Fspv6LABdDH
	xg8HEUVPptOhFu+yQ479uZsMeps8cJpl8C7bTsNB83RuhYN7Q8rCZkUItCxEiGMy8ew==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1769445295; bh=Mve4+ZS70I8fnOLJmWTrmWC
	2UftHU3YU4RPNj6SKMZo=; b=mgC+phkuNcozGun6cXcNN6NLGwa9bFPwjG/E6cVNZxbgCTi1fb
	eXSCKBqh7DP0zfQ75JTBQz6d77Yv2Q6PSoDw==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Mon, 26 Jan 2026 17:34:51 +0100
Subject: [PATCH v3 1/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Remove
 board-id
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260126-xiaomi-willow-v3-1-aad7b106c311@mainlining.org>
References: <20260126-xiaomi-willow-v3-0-aad7b106c311@mainlining.org>
In-Reply-To: <20260126-xiaomi-willow-v3-0-aad7b106c311@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Gabriel Gonzales <semfault@disroot.org>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Biswapriyo Nath <nathbappai@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux@mainlining.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769445293; l=996;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=KmSGZAPOA/EmLr4+XusNqLJfnRxNxjmUq0BkrQWKJl8=;
 b=yl5jia+B7vkiBkSvu4l5ixdqfhe7iqXaHyGYvva6W2gyJHhduS9v/HDbtDq49awOHihM/DHZv
 GrkKgBUcMMZCAlUhkvGBWhHO2ADK8ip2wvMB0aTHbuVmKilQWb7i6r5
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.28 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.94)[subject];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90593-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,disroot.org,intel.com,igalia.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[barnabas.czeman@mainlining.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[mainlining.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mainlining.org:email,mainlining.org:dkim,mainlining.org:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: 51FAD8ABCE
X-Rspamd-Action: no action

Remove board-id it is not necessary for the bootloader.

Fixes: 9b1a6c925c88 ("arm64: dts: qcom: sm6125: Initial support for xiaomi-ginkgo")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
index 6b68e391cf3e..bf03226a6f85 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
@@ -18,9 +18,7 @@ / {
 	compatible = "xiaomi,ginkgo", "qcom,sm6125";
 	chassis-type = "handset";
 
-	/* required for bootloader to select correct board */
 	qcom,msm-id = <QCOM_ID_SM6125 0x10000>;
-	qcom,board-id = <22 0>;
 
 	chosen {
 		#address-cells = <2>;

-- 
2.52.0


