Return-Path: <linux-arm-msm+bounces-101677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPrSCz3Yz2n71AYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 17:09:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 250C8395987
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 17:09:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8302E3077503
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 15:01:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90AE53CA485;
	Fri,  3 Apr 2026 15:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="IaqiGgtn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03843C9ED1
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 15:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775228440; cv=none; b=XO8G+en1k3yFbns5DGjXGRxZ9RqTGcZozXJHhDiuPa4MtJ/UgaJxVMCkZmzOZVe1FdlOmr7Tz3VRhgKyD12thMFbXa0ctebaxiBf76h5Ed6zc4iNZBLjYHTGs0YdxaLv5EuUX/Miawuxo0Uqqa1HBrc+R5Cz2DJg9By3yblQtJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775228440; c=relaxed/simple;
	bh=TQbe/biy9htlzVQhWhB2WMPTK2E7zpG9vrUxoUGpEvE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TtQby6qWqwqmtJ9B1qtTDhbUafBU8SVrRMsDPb/sKAEGR6llRLPwRT9Gv6eoKUjB4VQJr/ums9z4LCovalwQ4/rr27bPI+/zX0GlWB7K/dsLTOlfNmBdwciuwXREpgoEADuN/bQKn+HIMBB5d20S+2Bn3/QmKdgS/6j3Au2sH54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=IaqiGgtn; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b9b1ffbb9f5so222684966b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 08:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775228437; x=1775833237; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7gu4S8y7arrlye5B2e+gfyyz199/jWDrWD1f/lej6PM=;
        b=IaqiGgtnD57PD+EZwhTfwVxBsgIdHnI0Hq5hMakuxQzFuGOCuC0YCqgIy+GEHW27IB
         CLTB8dQBlFdzKfsihtllMSkkYV6nwIC23/yR+Wyt54veEYYvMQbyrqAxUvJXUHVb5oIj
         Vb80w4D0C32pW1AYDiN5fg/XVMecKy+3wKvhECw9OiCpRQ5uDC4+0WXziKXd2QtrtFbp
         o0T8wFrLmNp+LKjXXqhiEuJBNEtsZrCN+ICRDRLzN7o/YxTm2IiivX5XNWuhIDN9CpXj
         rO89Ve1jN9WrHJZpjQqiUOp/uO6RViSrha2UAWofPN62883Sjg/YIdX4Bt56+5JYJGB7
         KIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775228437; x=1775833237;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7gu4S8y7arrlye5B2e+gfyyz199/jWDrWD1f/lej6PM=;
        b=bnlH0UB1MQ8FlKech/7L6kuw02qiPi9MfcXMn8oexDkQiW95Lk3ARjBpFLjTvJIh/B
         9aj0pLoACGeDho0evViCpFYs/sU4GHI6DqgoxyRx3YfJmgjkP06Cy+0BmiKk74QjSYpC
         zG5tEdpgVwb4L8XpfwRIVEe6BuMlU10RhBLgFL4LZ7wc3ZZtjoD/Xk8Bi9cvBI/ozedd
         f78UrIGpBdhdnXtdFoJsFNS+Xf2P3nuZ/nQ4NLCVS9AyeeJIKBhhL2zWEIj6tN1bJ68y
         trZLrBSSSw7GSpUZnDI+nJ1sqnAQSqSMhpJfMJLZjHRKxCOLObjojIwiuU5XgcLiTSnH
         kq6g==
X-Forwarded-Encrypted: i=1; AJvYcCWhkIuGIqF3JxMBcevdXAHKjXMT4aJM5rUGbT/Uh0MBbobqV3tTyBu9fm98qhqS+HMY29QRl39hD8TCpD/5@vger.kernel.org
X-Gm-Message-State: AOJu0YyPkeeGXXfsocMrMF/V5jhhAc9+Tn0Y8USaJdrKfl6XrjQKNcmL
	RVX5zHHl7kSEueVlledfbdzVCcSgmEWTliRmosNpZu0hGjoC8ROaWtgY97SWQf4n/UE=
X-Gm-Gg: AeBDiesf934uAgUjA2KgwlClUM1WMbFMH/p5IzODcJcOmmq3EQ8PWyK+xd2C4QqHEwB
	pWFlBDNwwgGfWbcYhvXn9I7e9XW6ZMsAKcPwzO9gmNXOdkaSwNSV4SAXFs38MOvp9ZmGh29YIjc
	nFoc6IOPdLkpQlPURR2d7lNZSm0Yx2waP2Ko+WbA0Lgb7cDhvLY3VAWg9XmKqJFar2lRoOEDGcD
	kDHsPiblN4+nFFVN4yMxuvKdMtTlhXQtIQj1graBrBhI/DgHNnnT+C4B4yInNwrGMX68c0X2iHX
	w18wYwtNMh3Jud/jl+gw+f8OvAEmkcQWMivdB7LDPEJ5nS0b1qN/mP/3+KPrnXeu5dT6NG65uab
	THF6SVQPjIQUZQcgt7RHKxtRufyR3gJJlAZ7HAZ0aImZrv6VutSIyeBp2cOHpTvFc+OCq0zsobm
	ugcZytuplgBViUeCXPaDW3yCLSiValas4ZZ52kPWK3oWgo/hp23ZW3diEsx0nqogoEnR0hp1fy1
	tUMmmPqECPUnGx5QSBD6+awo4ZDxGtqRGg0EA==
X-Received: by 2002:a17:907:c819:b0:b9c:5357:15e1 with SMTP id a640c23a62f3a-b9c679a5e68mr178381466b.38.1775228437171;
        Fri, 03 Apr 2026 08:00:37 -0700 (PDT)
Received: from otso.local (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e02f389absm1724648a12.13.2026.04.03.08.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 08:00:36 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 03 Apr 2026 17:00:24 +0200
Subject: [PATCH 2/2] arm64: dts: qcom: milos: Add IMEM node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-milos-imem-v1-2-4244ebb47017@fairphone.com>
References: <20260403-milos-imem-v1-0-4244ebb47017@fairphone.com>
In-Reply-To: <20260403-milos-imem-v1-0-4244ebb47017@fairphone.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775228434; l=1119;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=TQbe/biy9htlzVQhWhB2WMPTK2E7zpG9vrUxoUGpEvE=;
 b=wtds/FesU61DwOgHwI2IZtmUWUdtpEuRWDzS9r/ek2UT/3mzDGVqZwNz+x12BgknKrrzIUS5u
 PFjJEXku1ERAo1kOHDG2e6tY2RmIyv/Bvk5C0tdY22r67Uh34eoFDlx
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101677-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.228.225.192:email,0.223.255.192:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.11.184:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,fairphone.com:dkim,fairphone.com:email,fairphone.com:mid]
X-Rspamd-Queue-Id: 250C8395987
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a node for the IMEM found on Milos, which contains pil-reloc-info
and the modem tables for IPA, among others.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 4a64a98a434b..1c045743ef77 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -2289,6 +2289,25 @@ scl-pins {
 			};
 		};
 
+		sram@14680000 {
+			compatible = "qcom,milos-imem", "syscon", "simple-mfd";
+			reg = <0x0 0x14680000 0x0 0x2c000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ranges = <0 0 0x14680000 0x2c000>;
+
+			pil-reloc@94c {
+				compatible = "qcom,pil-reloc-info";
+				reg = <0x94c 0xc8>;
+			};
+
+			ipa_modem_tables: modem-tables@3000 {
+				reg = <0x3000 0x2000>;
+			};
+		};
+
 		apps_smmu: iommu@15000000 {
 			compatible = "qcom,milos-smmu-500", "qcom,smmu-500", "arm,mmu-500";
 			reg = <0x0 0x15000000 0x0 0x100000>;

-- 
2.53.0


