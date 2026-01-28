Return-Path: <linux-arm-msm+bounces-91012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCpdFCEBemnq1QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 13:29:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E8AA13FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 13:29:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4623A303E2DA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:27:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57F4235028E;
	Wed, 28 Jan 2026 12:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="uvxQFD7G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8961F9ECB
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 12:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769603223; cv=none; b=pp5zMJWxJ2k1066WMzz/S8HOpasKmiyyAwRgLdBAuiq+sHEYl0AVAf2doV5Wg6Z/qMopZJGYcEtkkqg/v30IGVsJIQMIlq8u2JB9V/DLVe2P3ESLruqWK4gRj7D/SXZ8BHyUzDRlevoz7x+mTgIDKjQGsAzndbaSLjWK3YtFi3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769603223; c=relaxed/simple;
	bh=DAIXJZLgc99QDCiZ1C54DNaCXxm8xbhdrA2aDX9YeRs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qbZmie7GDOSQ/naa3TqpkDl5isVFfNmVXbpBwo+hsPLY+f8g2r4kjrfOdl3j+MeYSRU0D77+VkTg9Q15lychC1Ewt5TflnruZ7wCjx80eX5uQV4uFHfnT+MTz4k2Tedy8jfTwJv2MPYuaGReB2FUlCwx/ShK63gve6hKq3JEFeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=uvxQFD7G; arc=none smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-b8715a4d9fdso811582266b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 04:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1769603216; x=1770208016; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1J4Wgi9FdaGcRkgWW/fDa8if5n5CEMCZLtNv7Iii2Go=;
        b=uvxQFD7GYMxwquNMYkebdeSxCcYu27gMk+DnT/EhaanRubF1qYTscu2fNq1ZHHpYDX
         kZhUiFPCEvsz/Ysavx3bx1dCyhm9c/Eaa1YsHlW4KC+vaVmhxRe70cH55DuKkUfjkVhc
         2CfAuHfvkKnmsBawZc8Qhb1D3OmnnpJGfL7xD2ahHzMxv3/bxQ6BsoqC8r6n5mwm/Azo
         68C1AZmZiOYrcoEPZZErlOglpyyf4NBYmx7qQjEYranIgzjjWmbERx29aeByU6YRgPSx
         quGdMX6J9RbGAtvMtuXERw0t42VZQFKbrDzoe4/P4WqGCrbexuAnkgXlFNkXaLmT7YVv
         xW8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769603216; x=1770208016;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1J4Wgi9FdaGcRkgWW/fDa8if5n5CEMCZLtNv7Iii2Go=;
        b=dysYPU30Hv0RnXwQqE1Fy9BxYsv5wr8LR5A4KBOhc4pHswIrk7K1aiL29AsAciu6yz
         v/HhUt+/WIg89lbnchSDnR6hsCfEZvrI/OwuCczusbQ7eNW5WSQ1fHS2jWZ8j13JvYm8
         RhYErcYfVy3B2MXZ71QHy6aYO/P7jDONZBUsXRyNckgiHIsI/Xh8ufhPCgIfnFj1SpAF
         orkolTPXKdTQ5JJOS9hT6WH4A3yy8uwoMlvQrF6VVs/gIwVnzUmElHYgGXsahX48ZsC6
         Mvulbgzw0fTvaob59p5cSech8hnDJuA5/XpJoExsJK/H8vKhs7Z158UOktjXleUW5mSv
         kiSw==
X-Forwarded-Encrypted: i=1; AJvYcCX/ns3+Nc7PHcnjqeUQ/J+Oqcs4Q+4xPLqmZ1h+XRlnkyUi2SgBpECI3tTzzxQ3hjKnBTjHdrnspeBjVjd8@vger.kernel.org
X-Gm-Message-State: AOJu0YytwNM9q/xZOL+cixow5J0icK9oqpZi/74o/Tn6gVkjVk2WFDqn
	/bVUYyRL5nQflCBagKpSSyDVM1W55temcFDv9Hp+Cml8RFDBlXfnrFP9YedlGhwrZ3Aeclxh+RN
	M7D6S9y7LYg==
X-Gm-Gg: AZuq6aKcwimKTcv005PBHsGdt6St7nTroJ5tJwDVUkGDNbzxt6MOZHGEjxnHzFKrWpJ
	emvn3r9mG+AK7Ag+Svkc5e9AewqjfKqVEbKlHty3TpWkv8iwhdDQu8fh+6JbFweDNQuMEzHQ+NA
	6xZNbGHEJ4pm7JbJxYxNYH6/YKDe7dkY4LyVKEJd5oLuq6bTRrEpFUJmKVqUrrDx4G+r7+74qAh
	sXbPbz5OKPF6XYvGvIqmd46ytXmbSSyJT98wax39GLvKpwC0vzsGXOtJ8jbrqHKnx8fu5bY4Ec7
	L1JfxwTo45WngzICPxtKGRpbnzH2sIZKVj6DuWJk5aWvDd+pxmL4V8fd5z0ggpt4Knrqzhb7d2Y
	VBBQZkEV9PBvFy17fYynM+7TULiJL9wXUKv/2CL8OLdfvujovPMJ4fYqNnw+nj1pEpO5TQpkhfI
	JAhm1c6CXh+/Bnev+EqvF1ubjU19AZNyrNb3UKefb9oWA3mQ+RqtgbLNd8OxKZq4YRZw==
X-Received: by 2002:a17:906:d54a:b0:b88:7431:3942 with SMTP id a640c23a62f3a-b8dab331b78mr418073866b.33.1769603216171;
        Wed, 28 Jan 2026 04:26:56 -0800 (PST)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1baa42sm119536866b.46.2026.01.28.04.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 04:26:55 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 28 Jan 2026 13:26:52 +0100
Subject: [PATCH 4/5] arm64: dts: qcom: sm6350: add LPASS LPI pin controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-sm6350-lpi-tlmm-v1-4-36583f2a2a2a@fairphone.com>
References: <20260128-sm6350-lpi-tlmm-v1-0-36583f2a2a2a@fairphone.com>
In-Reply-To: <20260128-sm6350-lpi-tlmm-v1-0-36583f2a2a2a@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769603212; l=2150;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=DAIXJZLgc99QDCiZ1C54DNaCXxm8xbhdrA2aDX9YeRs=;
 b=D91UBY5cJfLVMutL2lsGmg1v4mvGKWsRzbXpEV4eu/U4K9lh0e5fm7C+ouiiz0kgmE3NtTPM0
 6L9OFAXNAvxDq12KGz1dCTCCPaJ3gME7iJyvbMthwVmtBDUV92lcK72
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Server: lfdr
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
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91012-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:email,fairphone.com:dkim,fairphone.com:mid,33c0000:email,3d00000:email,0.0.0.5:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E0E8AA13FA
X-Rspamd-Action: no action

Add LPASS LPI pinctrl node required for audio functionality on SM6350.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 66 ++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 9f9b9f9af0da..b1fb6c812da7 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1448,6 +1448,72 @@ compute-cb@5 {
 			};
 		};
 
+		lpass_tlmm: pinctrl@33c0000 {
+			compatible = "qcom,sm6350-lpass-lpi-pinctrl";
+			reg = <0x0 0x033c0000 0x0 0x20000>,
+			      <0x0 0x03550000 0x0 0x10000>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&lpass_tlmm 0 0 15>;
+
+			clocks = <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "core",
+				      "audio";
+
+			i2s1_active: i2s1-active-state {
+				clk-pins {
+					pins = "gpio6";
+					function = "i2s1_clk";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+
+				ws-pins {
+					pins = "gpio7";
+					function = "i2s1_ws";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+
+				data-pins {
+					pins = "gpio8", "gpio9";
+					function = "i2s1_data";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+			};
+
+			i2s1_sleep: i2s1-sleep-state {
+				clk-pins {
+					pins = "gpio6";
+					function = "i2s1_clk";
+					drive-strength = <2>;
+					bias-pull-down;
+					input-enable;
+				};
+
+				ws-pins {
+					pins = "gpio7";
+					function = "i2s1_ws";
+					drive-strength = <2>;
+					bias-pull-down;
+					input-enable;
+				};
+
+				data-pins {
+					pins = "gpio8", "gpio9";
+					function = "i2s1_data";
+					drive-strength = <2>;
+					bias-pull-down;
+					input-enable;
+				};
+			};
+		};
+
 		gpu: gpu@3d00000 {
 			compatible = "qcom,adreno-619.0", "qcom,adreno";
 			reg = <0x0 0x03d00000 0x0 0x40000>,

-- 
2.52.0


