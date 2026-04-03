Return-Path: <linux-arm-msm+bounces-101637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMFKBHatz2m5zAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 14:07:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB73393EDD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 14:07:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 44078308851B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 12:04:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AB032D9EE7;
	Fri,  3 Apr 2026 12:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ClC5lO+L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06826369213
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 12:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775217864; cv=none; b=F9+DflH44CWOk81vJOB9Z+SFcGVzpfsl7hO+2lxD7eTM1OJshci4kEwzMxUmg8pEoJDtbNizFuMxIhic1M5Z15jgaPoY7gtSWms+LE3phJUzzgt0xI3zy61lgmIeE/h5BehoD7UvOBPHteMG7J76/fUr7ALVn5fj9mleE3jrT74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775217864; c=relaxed/simple;
	bh=++e5FZB0tsvADRX7W3I2ua7//VvtHVnA0IB0LJVNzdk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MvhJLsxkuPb4kwxRkOtiOKuvxwakCeSsm2E3SNNpMn4Vu0rGndMDT3LrlwabBx/n7ITNYvPLTEmTawRwSAeIIRt8cLFDzXQx3fVGndqIsbb8L2cMFyNuSS/kAbEJLvn9PAF2gksWZe+HZ+m5R+WTsJZbH0LPrHJN4EW/bqUEvEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ClC5lO+L; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-486fba7ce4cso19668515e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 05:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775217857; x=1775822657; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JjyHbpSUyn7H1fP6Lf1b6SGYz/5Pq+5nMg5uPxkZH/0=;
        b=ClC5lO+LL61GscOu+clTBtO3Jd3xaQYRiO/p7UBD+4eQXt/0WuFIYsEI/yggZgVPlz
         7a9rwINt3JxoH6UFLxzRTTTHQcRqsFHJdo/ORkQcg7NYnbz5nreeywdObkgY1hNzN8JU
         Ri3B5bQeGfO60vNABMXSqRSatCj4ROGrlqplze7qF+YBVC0sPw/r9qJa8RKA1HzWTbsk
         sqkjVHkzc/oIbecnIlLRt7bcHGlzGDnAuRxBvN6HZVdUMIirOaU+0OiuoT01zDNeRwcs
         S3DjwEItzFKg4n8Onoj7sDZ/0E5PG82e09XSzNvOKnsOsIoh5V7d1Q8oep+kM90OIYfh
         Ofow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775217857; x=1775822657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JjyHbpSUyn7H1fP6Lf1b6SGYz/5Pq+5nMg5uPxkZH/0=;
        b=Ww/6vproXsIii7W4ysNzmLaYmYf2PKpMhT8iJn8L7/D0fuqgvsnwX9qh8x5A66/Kd9
         PSq7mIGVa8C9/6GafLsnyHLvNeinTcMgYckCRP2Y+LEy0v1AybZV+YHy0rMoc3JZ+ZiZ
         wNmSgzwo6zpIoxMsrXOU1RE9CwXG4wS1yd9E8WUYsJzNIz7sSa+WEtAdTmWC272eCF8Z
         KcCjtG80IIZboOzwFI0/PIuLgL6b20yhXh1KynYEYx9WEWf75ck6KOYLFlmpIUP3XKpf
         9t10zhY4NNMUOHzUoVq+ZZB7BAEJdBVwjztJvjapWhQML4KpvpPLj7JCGGhfOIyx+8Uo
         nQiw==
X-Forwarded-Encrypted: i=1; AJvYcCVZgdB67hCTmyrdhrZTsYTJkx9oN/BT4Q5VwaZTtQoQZXVlKf7udnf7m1Fxfg3cj/GLz5Kcmjhxo9RJJcWX@vger.kernel.org
X-Gm-Message-State: AOJu0YwcZRVM/prLX7Zzzi0vyr5rMcuZwH3NDVi47ddkYjYUhU2nxy05
	KP9B0y2T/+c9OdJCPH0udofIJ5A4cgb0Zczg6mnVH5k5ZFYLKrWi1wjP0ffp9QTHYpA=
X-Gm-Gg: ATEYQzz238g3/mczUK/wNHseoR7VPefYwTsKYRSYd5VJxg0mb172XtSCnnyGZtds7rh
	lhWy2hm3YX7uA5ZnAuZqGrNPYxUkO773ahg+d303pWbtqhkcTGTcCOIctNuIb2lbUWRnqFaJYO5
	RsRBvvggOANR7rW4BEsAoryQUteqkz334C7HNGlFPqZpDGacq1aGZtH8WaMMTw/HekfdApQzcU6
	QF+ZC0N+wsV7o2KpOzQUdau/cl6+F2XQMH8X0qDFvzHF+72pjO/CpoHAeJ8oBXtcMH6ZaEIDvpt
	rTDKyMbtHQ5BUOpYDz/SSRT/sIACitd21WnqkVBLU6s8bh4x+OhGZaAL2SPjNQO89Nz+OnCa+yl
	M2jJmSKO+x7rfVkiC9OS72/qHJLJ1dbC/txaTKdhAifFCz90r32EERsAXhe6iu2zfzfHG6faxJz
	zRyQ5iSuwMeG/RQn0X2hrPRc6X35zdCMt1EQ==
X-Received: by 2002:a05:600c:3b18:b0:485:35d3:ce59 with SMTP id 5b1f17b1804b1-4889970dbc6mr38933115e9.10.1775217857503;
        Fri, 03 Apr 2026 05:04:17 -0700 (PDT)
Received: from [10.157.142.139] ([41.66.99.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a567bfasm300193995e9.0.2026.04.03.05.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 05:04:17 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 03 Apr 2026 14:03:48 +0200
Subject: [PATCH v2 3/3] arm64: dts: qcom: milos: Add GX clock controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-milos-gxclkctl-v2-3-95eb94a7d0a4@fairphone.com>
References: <20260403-milos-gxclkctl-v2-0-95eb94a7d0a4@fairphone.com>
In-Reply-To: <20260403-milos-gxclkctl-v2-0-95eb94a7d0a4@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775217850; l=1066;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=++e5FZB0tsvADRX7W3I2ua7//VvtHVnA0IB0LJVNzdk=;
 b=bnsAXx5MnEBVpdQhExbmj5V09OxSu+2XLfAK2X4UgoO2d5cHMVKQ01e3yJrzj0sr4nYMEpqNz
 XwrlaWKUKJFDhodt6a6OQL7sfSb4NWw8SfoTXVYjABt6ohGoGvdxwNb
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101637-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,3d64000:email,fairphone.com:dkim,fairphone.com:email,fairphone.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3AB73393EDD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a node for the GX clock controller, which provides a power domain to
consumers.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 4a64a98a434b..4bd9181ca03e 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -1542,6 +1542,16 @@ lpass_ag_noc: interconnect@3c40000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		gxclkctl: clock-controller@3d64000 {
+			compatible = "qcom,milos-gxclkctl";
+			reg = <0x0 0x03d64000 0x0 0x6000>;
+
+			power-domains = <&rpmhpd RPMHPD_GFX>,
+					<&gpucc GPU_CC_CX_GDSC>;
+
+			#power-domain-cells = <1>;
+		};
+
 		gpucc: clock-controller@3d90000 {
 			compatible = "qcom,milos-gpucc";
 			reg = <0x0 0x03d90000 0x0 0x9800>;

-- 
2.53.0


