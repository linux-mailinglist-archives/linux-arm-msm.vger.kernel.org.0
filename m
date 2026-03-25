Return-Path: <linux-arm-msm+bounces-99925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCrzGxIlxGmZwgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 19:10:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AED32A50A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 19:10:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F17EA30A3828
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 18:08:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3450D41B376;
	Wed, 25 Mar 2026 18:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rg3CnNqC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870154218AD
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 18:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774462078; cv=none; b=mljzB6lPtLIw14i/gG9vDm1rEKOmSnh7zGDPfwVyyBTQfMzvStCGAG39cYnHoxh5ED4aFpfpqI5z51WlYAKn0RnPGppkm0uMRHvFmIU+mCNEGh4iQyWAY7+eL3r7Q51bco5aR4+oMQVAIyKEJEvYR9fY6PnO4fGd2Z9oUANTkKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774462078; c=relaxed/simple;
	bh=4jcpeoXLPiOxiHalfAjuvYT2yGFc2c9p3Rs4rW0U/Ds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VOzj6bDiRvlTegQ8Fk1K03eUyupvW4h4a/mJOpgJZ1ivI37OR6zkpSxppV/dvTqpmDWMS+khcBI6Y+zCRuB4UQnUlZFRGqXT6Gs8fBKLF7g6KZtL7qFLoBRmms8xk884onuTClUhmzUFKT1yQoGZHHlxy2t7V9ms1yglj+CyhCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rg3CnNqC; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2aaf43014d0so690285ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774462074; x=1775066874; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A+mOTnwT88rG+TLvmnzsj95Rl2YZE5vhiJFWZaB3EQE=;
        b=rg3CnNqCqo4TbLmH4nqVWi+2sac5TNqWk4+rZBu2G6KqgZOFXDwFbY0X38X3PuYl8T
         CTyM4j6rtsquyshphPvMIyDXjIsSg762Z8dZr7SSYwTtD06o2ioRivA+zqnpHrZxmo2T
         NhEt5JqtxyCVzDppAVYkzjonaBgYZNvW83GFdauYFDiCBSG8veHHscuMbEnN7nun6bcW
         C3iO2bgwZvZKvNAvYdsjc0EJBvXAaB/hlQLl7x1t7dlEBcfg9/tPMuT1qmhKyPIvuDfj
         gBGwB+ph4DgBWaH3nJFS1p5EMoLeZoUsJfanE10D2GhiCUVxgk8PQtJPiQ3YSP/mtnom
         IwZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774462074; x=1775066874;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A+mOTnwT88rG+TLvmnzsj95Rl2YZE5vhiJFWZaB3EQE=;
        b=AOlOw9OVHHh7VJS0l6EqwBwY18KHL+LBVR2GEgbKJN8/YZp6/NnP098gxNX2e3kXlC
         87cV6jJSOER/0HjgHN+cykEjtE9bvgTLnSZvy8p9FNXq9WTUIDgGNHVQYmtwfJZWTyGv
         PrOKMCCWi5ERw4g1tM0Jrs2XH2MzfIOPqc+ZjrvvN4v5TGeii12xcfYrEXc8qUrWqhn+
         CxzaqYMDCtswGNsdkRomNjHIoxB2cG+p59t16AmLHsJ2nJwa8moJuXu/GenxUVnpJDBR
         i4fKFtLPf77bya0/SLF2nbArhGqLe7hWblMHiRpiygigJDW3dqsz/8SzNBM6xB7ViTsK
         jxqA==
X-Gm-Message-State: AOJu0YyaNGTtJcNJAd1jeo0Fp/dt+CceARlISM0CciMT7O4JQJujH5zE
	sOX2V//q44oHFfVNUc7Pib1qOsSqgZ3Xqdkxk2vfEUMaiC5c4xcGQA6r
X-Gm-Gg: ATEYQzwqoDZaOonY/+HKDpZNVyuQLRLX6pGjzGKM1Cjr7PQ470fN3Uz/ZzcgKh/IA0D
	5KT06hxGls4+YRaTb5XJFiMZEevP0+EcyZ4O1HaO/fQ4Y0O9TynGbc2CO+sCNvA+YjAJJNg7wI1
	0ClexI9enFd0CpYjbhjlKquOF5mqVO1qiUIeFuLM3dRWzxogECQ2dMiEmeuLFOgZ6QFnd2x/zCk
	mqfaHqlZwEEk5v7MRUftsES3ocsSsjeIaQFnpjzmql8MJmL5JUhUe+n5zmXP/k8KsOVjwJ5/Qo6
	lVByweGBG+KCTUXK/7KVSSjcWR7mVzsLSWc3NMHgtZ7gmtdN18BRTTTms1yqlj1/dzNIu27d6hL
	qOPJ3XLmp0XYd9RVhqANwFWUCOobc8ZZZAIe7jNo8/ozwqHQ/TqGpvSookb39uOgio4Q9b2sdJl
	88udLG9tRkU27BDEY0FxmEgU8u6wO1
X-Received: by 2002:a17:902:ea0e:b0:2b0:afad:7ab8 with SMTP id d9443c01a7336-2b0b0ad2382mr51898775ad.29.1774462073914;
        Wed, 25 Mar 2026 11:07:53 -0700 (PDT)
Received: from [192.168.0.102] ([43.251.91.187])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2b0bc773b33sm5687805ad.10.2026.03.25.11.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 11:07:53 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Wed, 25 Mar 2026 18:07:26 +0000
Subject: [PATCH 3/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add PMI632
 Type-C property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-ginkgo-add-usb-ir-vib-v1-3-446c6e865ad6@gmail.com>
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Biswapriyo Nath <nathbappai@gmail.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774462047; l=1268;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=4jcpeoXLPiOxiHalfAjuvYT2yGFc2c9p3Rs4rW0U/Ds=;
 b=Rb1tdZWGQx6hFZr4eESwpKU4K5eOaB1lL5/HKB0tRnFVmA0mXAdsiwXnXAu3WdUAlnwWvnqE+
 PNBv5qA8IpBBPJQtzrzD1uIjANQwg3/048MKk8LX+Hya2EFjYmmWf17
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99925-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathbappai@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D6AED32A50A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The USB-C port is used for powering external devices and transfer
data from/to them.

Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
index 88691f1fa3a..f66ff5f7693 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
@@ -116,6 +116,33 @@ &hsusb_phy1 {
 	status = "okay";
 };
 
+&pmi632_typec {
+	status = "okay";
+
+	connector {
+		compatible = "usb-c-connector";
+
+		power-role = "dual";
+		data-role = "dual";
+		self-powered;
+
+		typec-power-opmode = "default";
+		pd-disable;
+
+		port {
+			pmi632_hs_in: endpoint {
+				remote-endpoint = <&usb_dwc3_hs>;
+			};
+		};
+	};
+};
+
+&pmi632_vbus {
+	regulator-min-microamp = <500000>;
+	regulator-max-microamp = <1000000>;
+	status = "okay";
+};
+
 &pmi632_vib {
 	status = "okay";
 };
@@ -316,3 +343,7 @@ &uart4 {
 &usb3 {
 	status = "okay";
 };
+
+&usb_dwc3_hs {
+	remote-endpoint = <&pmi632_hs_in>;
+};

-- 
2.53.0


