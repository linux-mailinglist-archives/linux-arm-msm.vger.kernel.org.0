Return-Path: <linux-arm-msm+bounces-90597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FWJI8SYd2n0iwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 17:39:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B658AC94
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 17:39:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 883B6302713A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 16:37:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D29F3370FE;
	Mon, 26 Jan 2026 16:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="kw0aYyCm";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="zm/t5ikj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5B51850A4;
	Mon, 26 Jan 2026 16:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769445470; cv=none; b=JQoWJHA794KS5A7PVtswycnA1/XWLCKPaC9CbDut5/pA/iE33kbI6KOQZRMc4iH4rw6FTcERIbDXTeYEPQRtajdKQ5dG6sa40EwesbctOmGZRSsC5ryNzQR6qdKT0unm/V3/6H71/q5QVR0s1YSKV39LEiZW9PQ7fVj26FoqdS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769445470; c=relaxed/simple;
	bh=vCA/tvm2PSUXSljeeId2Q/qV5A43nwKZn+74WIY1ZU4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GWP8eVuQqKxUm52uiwa69fs687ns/Zevhg6MKNUbOFYTDDTABoMSY7uvsvUXvqgx8xT/SVu5sbCvmcUnv0hJ755+oviJ43hTszz0b+4IkKJpNlLNzMXSKXdUsFi6VWP5C4oEssFCttZZqbi4FVWAqgFUjIY01SKnmLExI6Q2inw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=kw0aYyCm; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=zm/t5ikj; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1769445296; bh=lHBsHyd1RtYztw1gj0pYNns
	R2w23BOuYwoG5koQegG8=; b=kw0aYyCmKHYfWRSkPeH+VAKWmcX/EYffx3R7P5ESHHi+VXdlGv
	v1zLwyWdHPfdk4VpvuzkxqYmRFVCNkl9hXlhlOBbQJ+Kryu0qhVfbrXXUfXFjFORBHwCBL1MKQu
	tsNqxZQdFGmEXVH4pjW3EsWhjf2R9wJHsPtjl+nlKT4jS9IW2G6rwiYicQRGcaohotZmAJdaR9q
	QtUndRmPvqswB+qrcFw0g5pB+PT9E5FhYQoHSaO7y8hyiCPz1F5Of6SVWj0K11cVsu289EP5C9o
	fae27McWICgY9vquvFfskZ0Mdq46gUOJNea8ejoXExpdhPdV/Yf+TX2Sk1vx+kO0Q1A==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1769445296; bh=lHBsHyd1RtYztw1gj0pYNns
	R2w23BOuYwoG5koQegG8=; b=zm/t5ikjN68dSepFGjigFGH1oIrgxTIXvQQnpDoSsIcaejWqa7
	7PdxT/lFjq4x+7tMbH5Q43t9VUO+tedcdCAA==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Mon, 26 Jan 2026 17:34:53 +0100
Subject: [PATCH v3 3/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Set
 memory-region for framebuffer
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260126-xiaomi-willow-v3-3-aad7b106c311@mainlining.org>
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
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769445293; l=1072;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=vCA/tvm2PSUXSljeeId2Q/qV5A43nwKZn+74WIY1ZU4=;
 b=aJ5LE803GhhZClKdkP+yN83+bn0Q9mTiqQJrxj5NKzJkjwOqM8f17lrUA+FTsZv04wyf5he4o
 7E+wIMtDIKeAmRDCiT4mkj2fsRTyBSPHUkJvd1Zqa8pSQ5JSt/wSuFG
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.17 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.83)[subject];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90597-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,disroot.org,intel.com,igalia.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[18];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[5c000000:email,3.109.155.248:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mainlining.org:email,mainlining.org:dkim,mainlining.org:mid]
X-Rspamd-Queue-Id: F2B658AC94
X-Rspamd-Action: no action

Use memory-region property for framebuffer instead of reg.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
index d5e5abdb3b2f..8497f0cbf819 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
@@ -31,9 +31,9 @@ chosen {
 		#size-cells = <2>;
 		ranges;
 
-		framebuffer0: framebuffer@5c000000 {
+		framebuffer {
 			compatible = "simple-framebuffer";
-			reg = <0 0x5c000000 0 (2340 * 1080 * 4)>;
+			memory-region = <&framebuffer_mem>;
 			width = <1080>;
 			height = <2340>;
 			stride = <(1080 * 4)>;
@@ -62,7 +62,7 @@ gpu_mem: gpu_mem@57515000 {
 			no-map;
 		};
 
-		framebuffer@5c000000 {
+		framebuffer_mem: framebuffer@5c000000 {
 			reg = <0x0 0x5c000000 0x0 (2340 * 1080 * 4)>;
 			no-map;
 		};

-- 
2.52.0


