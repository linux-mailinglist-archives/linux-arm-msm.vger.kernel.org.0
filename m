Return-Path: <linux-arm-msm+bounces-90594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MK38DDSYd2n0iwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 17:37:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC2F8ABF5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 17:37:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6527F3024A12
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 16:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE207342CA1;
	Mon, 26 Jan 2026 16:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Tr2Sl0+i";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Yp8Z7ddI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608D123A58F;
	Mon, 26 Jan 2026 16:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769445406; cv=none; b=W7GvGpdh33ogfT9sabaYmS7pVuSjKjxoNRtcEj09X+JSFd2L87tZkwvszI6TIMh6650JAvRuYCB3cdajygcyVdIUVfVDVEe874lsVPZsvqtPAvnuZ2bxsLN2H1RSpQiPdLUODBTajCCVGUAtoqqWKofdAWXuYQti/86unm2KjdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769445406; c=relaxed/simple;
	bh=0xWVmOcjF37rBFAWRMgC4bqIHyBH/tIBXGmQGUtVn4w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pYpzEbSzF/SjpmWnk3H7o51g/5SOJfH624+UJ0F1AmRzY/y5mfvh//uTcbgxuSWPu5if5yQnhCUAQX6wdhxj7+vYgb/n52M1iq5FL2oMQnGlzAv7qDkw3W2cm6BarOhIw2N+BKdonfrEp0G7tUhyN/VnhJS2Zo+DRk52a6qIc3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Tr2Sl0+i; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Yp8Z7ddI; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1769445297; bh=Iks06YVh9H1/3R0Wj6bUu3J
	sg4b/0IzK/VTKur/sG6Q=; b=Tr2Sl0+i4miZDc8f6TDbZ1MId9lcCYsFtMp6dm14/aLf/3VbsC
	ZyTKVlmxtRP7G7V1sIZ1vup8KmK5o6I74PK83zs2TuZyXBhXN57e9tGWdWDTlzYhtnIgBIE5PTO
	v8cQ6Gaz1P7izXTZF7nBcRuBdpRDADudD+oigtkhcGFcWmjWs5LufgQrDVW0c2bNzzwMFWPw4KU
	e2cuAIYqylQ0aCVaybwj43SH/xHU0VnY76V+d3hGK5UZtFFblMiJbf5+o82Kigbd1VqmpU/SmGA
	fH4xHDNzoiNnExze+q/j7eutzc9z0bnj4mlO24uPDuJP7c6ocGZl6wvmGn8xCW4yLgg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1769445297; bh=Iks06YVh9H1/3R0Wj6bUu3J
	sg4b/0IzK/VTKur/sG6Q=; b=Yp8Z7ddILzrqMDzLhLmIMXVMuLxpU+V6LeV/pAUKq3+Zls7B69
	UkE5dmE1FsmGcLs5wRk5D60C7Bz+deqlqmCQ==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Mon, 26 Jan 2026 17:34:54 +0100
Subject: [PATCH v3 4/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Remove
 extcon
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260126-xiaomi-willow-v3-4-aad7b106c311@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769445293; l=1174;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=0xWVmOcjF37rBFAWRMgC4bqIHyBH/tIBXGmQGUtVn4w=;
 b=UntMFzWRcWZvR7Aq4fNf5K8dJaZMhtPZldvbUiQTz1ORZ01MrqmXkx+iiKJ+7tNaJPCQbfwxl
 qyRtortx2fCAQXvL4CIyp/7LH4PEaFdky3mdXqPcOyrF54V2T+HIuuf
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(1.00)[subject];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90594-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,disroot.org,intel.com,igalia.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[3.171.241.0:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[barnabas.czeman@mainlining.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[mainlining.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,mainlining.org:email,mainlining.org:dkim,mainlining.org:mid]
X-Rspamd-Queue-Id: DDC2F8ABF5
X-Rspamd-Action: no action

GPIO pin 102 is related to DisplayPort what is not supported
by this device and it is also disabled at downstream,
remove the unnecessary extcon-usb node.

Fixes: 9b1a6c925c88 ("arm64: dts: qcom: sm6125: Initial support for xiaomi-ginkgo")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
index 8497f0cbf819..caeb7c74873d 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
@@ -77,11 +77,6 @@ ramoops@61600000 {
 		};
 	};
 
-	extcon_usb: extcon-usb {
-		compatible = "linux,extcon-usb-gpio";
-		id-gpios = <&tlmm 102 GPIO_ACTIVE_HIGH>;
-	};
-
 	gpio-keys {
 		compatible = "gpio-keys";
 
@@ -304,7 +299,3 @@ &tlmm {
 &usb3 {
 	status = "okay";
 };
-
-&usb3_dwc3 {
-	extcon = <&extcon_usb>;
-};

-- 
2.52.0


