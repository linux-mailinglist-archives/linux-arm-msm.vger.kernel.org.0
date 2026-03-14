Return-Path: <linux-arm-msm+bounces-97662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GM7DerJtGnRswAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 03:37:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B99328B68A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 03:37:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4ECB03049453
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 02:37:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6995C287259;
	Sat, 14 Mar 2026 02:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="flXjLuKp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0BD52BE7DC
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 02:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773455847; cv=none; b=jCDFpndjnN5CyNZyBWnJEk6O3mcP0BwYvvl/vZAcLeo5H45RKQ8RSh9vcw38eCsG6G2BTjoTeSwUCcDQeRO1K1GPHvGXPLwmpve2vvXx2U5o6cxfyT1CFYohwgWUasthGxEnpzR+YULB0ONUsikhBNnAsWjuSjRpGqPMmLiOlBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773455847; c=relaxed/simple;
	bh=0ScLnVnfEOmbN2X7Q9868OgSGGlBSVIHw9wugAYEo8k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ztn922+HVKaoUMcxBgiBIPbZPK46vDCh3Y0AnAK1MHzZTYul9eQu0jF/6U4lCDvt8DOjHTuxRHZCVA+JUznVLKYzDVIqIVTHaYtZl74qmchgjapKnQpLqt+4Dds5cUqQNwDwRld73MzsgEZm5AvXAJsIGcy4J7pzjpYXq+QSpUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=flXjLuKp; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59e58404f28so432771e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 19:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773455844; x=1774060644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pMtgrVeLM7+dMhDcPcbsb5ExopfHJGQnfIKy1KYUAeY=;
        b=flXjLuKpgvrVqPpkg1H1B8XVS1iKCDsROn0kzlsI2l1fbDEEkh6LQCmrD8lvY6hBEo
         ZueRSkAsSAQbP2n4OxojOVYQGQFzKPtDyNVRwb+DI4JGcwnGVhN9tw6Fn0PBL+IqLB7H
         UwutrHUrL7zdfTU7/sWtt45x8mkdbQlZ9eyROdThcfO4O+7Aln5E2/Y0L2fC46P9ZAfA
         LUlvC2d6Yz5sSnvC18MenzsdwaVZ2KdKwnk2pMtly/Ex/MF8oPNc4/FwUmczd9SAu4Gu
         bRQRnV84TJ9PoQmYdLzt0kCgab8t3ovtLd7sDE/teimu4zUnJQ31SBEnTVd7hJ4rfYxw
         n1tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773455844; x=1774060644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pMtgrVeLM7+dMhDcPcbsb5ExopfHJGQnfIKy1KYUAeY=;
        b=IU2QIlfTLkNg2ZvpmQbIa5TTfB9Gl894F/YXpDwlsMWuyirg1EavBXlfMhec8ANI3q
         8BbKUC5u2ohbWeoBrIFmNuT1hiJw8DskuG+48Ia3zLAb5IbJkzowjZz2lwdwKAgIP5or
         FKDG5z9VkXGpdSbK75gdkF8SF3eDZ0Trtj2CCm9gyOVX1/Z9dO7TjpCXLqTmZS7kQhZo
         zCzR4glwCmEc2VNAFmzKygDy69XYuyyACJRaT3go69sO1GQhycWLHA4Zawf8flruJUAQ
         OrnlKVGt+S5K1uaCIrxlXPfHza4L1DNsk54mkFdcGdUD1BRWZGOG4rqP7MQr/lIRZIm3
         J9vQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZr7TPIGWVXAam17RGU9dQJPUiy53fWY8J5DF8UqYj+QJTg4YfdYkP5Oc8LxiyyRPuqPZ43gT+DDJGHO9t@vger.kernel.org
X-Gm-Message-State: AOJu0YxR8QMyYHgP1lBlX+0dUxvXGrElAnr/Yx1flS9AfthVep1zP7jI
	zNtbsLEzzyFXKEWONiEhFqN9aiR8hERnfk60dcvcL3Hdn6cG7Vb4bamnkfBYSD7MIX4=
X-Gm-Gg: ATEYQzxpp4L6NT9nstx49JjmGYb1jQ3CNB6g6T/ntdGN+qc/wHf9iK13RdPgh89wE0S
	BL9htwOg+7ppluC68lraav6SwGhuYyecy3JOkhgXwZPnRhgusAJKWepfol+f1mSjqEy6xQnfKhy
	f/rnzl+1Qg+X7+Gz7CqVy9qtP8/GOsppsGopjcbQSXkri8p2WAQ5Ejsw7jAeu0x58lFiV8u+Nht
	DThrcEw65rL6yQtmle6HSHdZw641V3GbT8/MShXBGozHdzTeRDoe5XGNvK0bSClQXHL+cNRnmWP
	FmfhgX6EjYAvbg0UH4cTby0JqtIWOLLCIDkID/mCFfupV8PIZGyxqUI0xczIP3/a8F+iaNRGXvH
	TVxbBzBymMnlJTvgS//3gehxaPEjgWtKzDyx3CfbPezclwetfGinvtsiGw53eXW3eeVf0N0kNCE
	ZRCab+7mI2gfjayfQWq5mi7n1VBWdLc1lt0hUU6Y9iiBnDqCuiC0oe//Z4vkGLI4Jd9g==
X-Received: by 2002:a05:6512:61d2:10b0:5a1:1329:5ae5 with SMTP id 2adb3069b0e04-5a16271283dmr697090e87.1.1773455844079;
        Fri, 13 Mar 2026 19:37:24 -0700 (PDT)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15602e692sm1884296e87.30.2026.03.13.19.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 19:37:22 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/6] arm64: dts: qcom: sm8550: Fix xo clock supply of platform SD host controller
Date: Sat, 14 Mar 2026 04:37:10 +0200
Message-ID: <20260314023715.357512-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260314023715.357512-1-vladimir.zapolskiy@linaro.org>
References: <20260314023715.357512-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97662-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.134.86.160:email];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: 9B99328B68A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The expected frequency of SD host controller core supply clock is 19.2MHz,
while RPMH_CXO_CLK clock frequency on SM8650 platform is 38.4MHz.

Apparently the overclocked supply clock could be good enough on some
boards and even with the most of SD cards, however some low-end UHS-I
SD cards in SDR104 mode of the host controller produce I/O errors in
runtime, fortunately this problem is gone, if the "xo" clock frequency
matches the expected 19.2MHz clock rate.

Fixes: ffc50b2d3828 ("arm64: dts: qcom: Add base SM8550 dtsi")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index e3f93f4f412d..03672df25eeb 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3210,7 +3210,7 @@ sdhc_2: mmc@8804000 {
 
 			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
 				 <&gcc GCC_SDCC2_APPS_CLK>,
-				 <&rpmhcc RPMH_CXO_CLK>;
+				 <&bi_tcxo_div2>;
 			clock-names = "iface", "core", "xo";
 			iommus = <&apps_smmu 0x540 0>;
 			qcom,dll-config = <0x0007642c>;
-- 
2.49.0


