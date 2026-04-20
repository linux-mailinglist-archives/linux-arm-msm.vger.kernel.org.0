Return-Path: <linux-arm-msm+bounces-103835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJFLIyN+5mklxQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 21:27:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B511C433498
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 21:27:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 203603006D60
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 19:27:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36DB83C342F;
	Mon, 20 Apr 2026 19:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t/n7rBMn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1473F3C342B
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 19:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776713220; cv=none; b=D5npNdPNUkNfINct3DkGm2cLZjd+VvAcfyt/4xvLwQY+3EHwALORIWOT8cqb5uPVRN0Szz5PhDtGS218GTpYqEu9VwtR6UsR3xrgd/NeLSKRglIZCjDdIJ968CnDBjaeMbP77tSmrFUH0EeVQxjqXBHD2xQ7KZsW8t6oGCeMGrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776713220; c=relaxed/simple;
	bh=WcpHy4m8Hqbku7ILhoBi7bTOojWUPPfpvczwGndi/3Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KYIr5ag5v5qUj/u/0y2HcbGeaoidpAboAhS0P/MWoy0zKOsehhT3dXOwoBdfKRBMJey15rgxSo2SwYlL5QrfxVd3pJLU6ZjUCv1ZYYOzgELzHf+tF+x1SEvVY9ddpRifLFcp/+Ll7ara0IE5a3+M8xdDs/HyM662ycqS/mQkaMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t/n7rBMn; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so49050675e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 12:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776713216; x=1777318016; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yzQLTSNnO0CldrTKhWAPY1a05DYxM3tccsWIwC6cb5M=;
        b=t/n7rBMnAvxaOUgcz/Hcv6vTKCScO4hgbKEk7TGcjJpE4hzTK/FRCIFrHr7ATn+6KY
         ZAGeA0JBxbJmnzcNOoGnR5+w3HRIF5b38PEUBH5vWkz+MddIaS+ViHN/XfEDm3d3Miml
         UwyC+05KEiYtAECP3kEvGm0lot37z9SUFnF116MhbwUTnKGDBnPeAa894EwKa956DN25
         cBGXDBCyNXXV8Xb4Pig/kKgiliy1aQGBlia1tgSDCrndAQsEJKl4inW8JGtCZtq6Cwk8
         12kfnnjbeun/+u2zQEV7hPXjX3h9430RFwLxOQoYK9DfPNqDMkJj0j+T2Z4zB3oyAaa3
         SLtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776713216; x=1777318016;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yzQLTSNnO0CldrTKhWAPY1a05DYxM3tccsWIwC6cb5M=;
        b=FqjL+wdICZUEJPHgVodYRztZwuy10KLdxsZL0Ruuf1rU4sJ1sqMpeua/hQFM7vyPM5
         GUG08bvE6KYyNSGujYG+CV0ojtxqWF12iVw4d8Az6UAUJueJDTKV9x6rLSlhypJygs0F
         /ApY0kF2savYKitlz5zUuGmWi2V2o2vguFmhPPX2kPp7ScPL9fLL8FNgpy3dyZmXKHp1
         STfhdCgABG3IoJdYIHMRhXpmrwZW7JVca09zWAYeqBwAGZGMYIcZruFCzIn5uWGjsxFK
         GDiz2cL4sphWuYbYTkODWApACGkJBFQno7iAiEqH48ztAb5qcjAc92qJWDj0noNHK2cW
         nfMw==
X-Gm-Message-State: AOJu0YwOdw1+xI6RXvB/XmMrSwZncd9T2ElbTiHAMuodxOE0Jn2RU82y
	C3b/Qv6/0d5U4KqTghBaJ++HBZuu/mGSYYRwLSPfCUqWMcLR971xaS2YblyGsSlAtro=
X-Gm-Gg: AeBDietDr2rkqdT+DcnzHiMKn0iCUF64DD5arnnpHTxXVBUGGbs5joc6s6iuzyk6Nlm
	AEw32U5M90+QJCc0low23h9l2wAG2c8RO4uV3ErSyOTG8kbEyd3p6h1Iw6AyF2FrIb0XmNZEHRk
	zA4D8tFQfjGDg/Tj6OIHDos+HtQYX4UPatpdlG89zQkS14d0BanVlLYIQIgqY7w0Ww7UGwnQk4+
	UXzA+iurnjrJ272wAK9IL9YmVnwFrhce4o3BWsOAdiSujVl1ZswN1ytVKiH03k11iVFm4KSqXgP
	4Uy3eAdVUWiJ/nJEkYTWmXen/qEfUPtVjDvzaBDKvLJWkMUFYXl1UnIyvIcjQ3dojbVWuu8APkn
	ggJ6bvnUddxtUNwtcdNjjzLNwf8Ma2Vj9Y1kwcSlL+cGQyS5SxC8av/JkMouymeSuQ4Tp6DHTbt
	2CKb8Kf21thUlxPGHFbvSsBrvH3uth5hqCr1kdH5M1QYZcmnXi5YQEMhJ4e2cqvoEPHw==
X-Received: by 2002:a05:600c:c0c8:b0:487:21c7:2885 with SMTP id 5b1f17b1804b1-488fb73d9ffmr169046275e9.5.1776713216306;
        Mon, 20 Apr 2026 12:26:56 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb78d1bcsm133524515e9.5.2026.04.20.12.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 12:26:56 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 20 Apr 2026 21:26:52 +0200
Subject: [PATCH v2 2/3] arm64: dts: qcom: sm8650: add CPU cache size
 properties
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-topic-sm8650-upstream-cpu-props-v2-2-689e07d8ab8c@linaro.org>
References: <20260420-topic-sm8650-upstream-cpu-props-v2-0-689e07d8ab8c@linaro.org>
In-Reply-To: <20260420-topic-sm8650-upstream-cpu-props-v2-0-689e07d8ab8c@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4680;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=WcpHy4m8Hqbku7ILhoBi7bTOojWUPPfpvczwGndi/3Y=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp5n39cnDqJZgGVU3RWAoSVE2wI9D59KSWEFqaXktr
 Ba5KQLSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaeZ9/QAKCRB33NvayMhJ0WMvD/
 4oP0b9bDT6JOVy0IO9FNMjFwwIdQTFNh6bADJAcZTIxoLMc9i1qjwayXRMMjrO8Fr/2wT1hg4VYvCu
 ISN2utP8oJVCGWz/NhsW2papy3agGbxaM3PNDdzGqlj/KoLaoHpSmAt4fdU+vFguIsMqFANgg/F/hq
 IhSrNpXa5pIIg6+1oMjsoVMzlyIY19qI11H8PzdcwaUtiG+9QwVMnWaUzB2iMmcUK875D0E9BL230z
 EtxeQJSg0ntMzZ9QqFscdqkbvHTzkTrS0O0xIlwKVT79irHtG+TZfgnWxnYV5e2m+BobYELwlngoRb
 /2dDQ9/lWLte/EDoRZ7L055syWBYoeUpEnrMxEXMVDI/+1VRdDmqkLDCvnqoIqlLY9t0PY0UhoZ+sF
 32gu72G247f5aFZvZnLmozOCeVnPBiixlrONs7qTV7tr+Ntq9RmuQ59x5ZCCM1YE1zuHM5HMZNuDnh
 go50ek8hKatDWtO+9ZI/1h1iTCWc7DFFmQGx4EdEg+V8B1kjjW6m8XZJZ5fiq3rxsbFGXGK4t5AHkT
 A8VZblpiXzY6Bk/XjfV9BnxrAb+wyPhBUdEURZEDZX+c2WCz6ifpu2RQLpyutZofBpgxVxSPsDKbsD
 nsg8hp2mdn8cWYhTEEwj+xGoBL8VpT6Y16lj22S+7oWmA/CwfRRQ/E1TvPfg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-103835-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.0:email,0.0.1.244:email,0.0.2.88:email,0.0.0.100:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.1.44:email,linaro.org:email,linaro.org:dkim,linaro.org:mid,0.0.1.144:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,0.0.0.200:email,0.0.2.188:email]
X-Rspamd-Queue-Id: B511C433498
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the L1 cache size and its line size (cache-size and
cache-line-size) with the corresponding L1-I cache and L1-D cache.

L1 cache is unified, but clidr_el1 register (get_cache_type) tells that
L1 cache is separated (CACHE_TYPE_SEPARATE), add i-cache-line-size and
d-cache-line-size and cache-line-size of L3 cache is specified.

All cache line sizes were confirmed by checking ccsidr_el1.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 56 ++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 42977b04346a..c5358894fbb3 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -75,6 +75,11 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a520";
 			reg = <0 0>;
 
+			i-cache-size = <65536>;
+			i-cache-line-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+
 			clocks = <&cpufreq_hw 0>;
 
 			power-domains = <&cpu_pd0>;
@@ -103,11 +108,15 @@ l2_0: l2-cache {
 				cache-level = <2>;
 				cache-unified;
 				next-level-cache = <&l3_0>;
+				cache-size = <524288>;
+				cache-line-size = <64>;
 
 				l3_0: l3-cache {
 					compatible = "cache";
 					cache-level = <3>;
 					cache-unified;
+					cache-size = <12582912>;
+					cache-line-size = <64>;
 				};
 			};
 		};
@@ -117,6 +126,11 @@ cpu1: cpu@100 {
 			compatible = "arm,cortex-a520";
 			reg = <0 0x100>;
 
+			i-cache-size = <65536>;
+			i-cache-line-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+
 			clocks = <&cpufreq_hw 0>;
 
 			power-domains = <&cpu_pd1>;
@@ -146,6 +160,11 @@ cpu2: cpu@200 {
 			compatible = "arm,cortex-a720";
 			reg = <0 0x200>;
 
+			i-cache-size = <65536>;
+			i-cache-line-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+
 			clocks = <&cpufreq_hw 3>;
 
 			power-domains = <&cpu_pd2>;
@@ -174,6 +193,8 @@ l2_200: l2-cache {
 				cache-level = <2>;
 				cache-unified;
 				next-level-cache = <&l3_0>;
+				cache-size = <524288>;
+				cache-line-size = <64>;
 			};
 		};
 
@@ -182,6 +203,11 @@ cpu3: cpu@300 {
 			compatible = "arm,cortex-a720";
 			reg = <0 0x300>;
 
+			i-cache-size = <65536>;
+			i-cache-line-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+
 			clocks = <&cpufreq_hw 3>;
 
 			power-domains = <&cpu_pd3>;
@@ -210,6 +236,8 @@ l2_300: l2-cache {
 				cache-level = <2>;
 				cache-unified;
 				next-level-cache = <&l3_0>;
+				cache-size = <524288>;
+				cache-line-size = <64>;
 			};
 		};
 
@@ -218,6 +246,11 @@ cpu4: cpu@400 {
 			compatible = "arm,cortex-a720";
 			reg = <0 0x400>;
 
+			i-cache-size = <65536>;
+			i-cache-line-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+
 			clocks = <&cpufreq_hw 3>;
 
 			power-domains = <&cpu_pd4>;
@@ -246,6 +279,8 @@ l2_400: l2-cache {
 				cache-level = <2>;
 				cache-unified;
 				next-level-cache = <&l3_0>;
+				cache-size = <524288>;
+				cache-line-size = <64>;
 			};
 		};
 
@@ -254,6 +289,11 @@ cpu5: cpu@500 {
 			compatible = "arm,cortex-a720";
 			reg = <0 0x500>;
 
+			i-cache-size = <65536>;
+			i-cache-line-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+
 			clocks = <&cpufreq_hw 1>;
 
 			power-domains = <&cpu_pd5>;
@@ -282,6 +322,8 @@ l2_500: l2-cache {
 				cache-level = <2>;
 				cache-unified;
 				next-level-cache = <&l3_0>;
+				cache-size = <524288>;
+				cache-line-size = <64>;
 			};
 		};
 
@@ -290,6 +332,11 @@ cpu6: cpu@600 {
 			compatible = "arm,cortex-a720";
 			reg = <0 0x600>;
 
+			i-cache-size = <65536>;
+			i-cache-line-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+
 			clocks = <&cpufreq_hw 1>;
 
 			power-domains = <&cpu_pd6>;
@@ -318,6 +365,8 @@ l2_600: l2-cache {
 				cache-level = <2>;
 				cache-unified;
 				next-level-cache = <&l3_0>;
+				cache-size = <524288>;
+				cache-line-size = <64>;
 			};
 		};
 
@@ -326,6 +375,11 @@ cpu7: cpu@700 {
 			compatible = "arm,cortex-x4";
 			reg = <0 0x700>;
 
+			i-cache-size = <65536>;
+			i-cache-line-size = <64>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+
 			clocks = <&cpufreq_hw 2>;
 
 			power-domains = <&cpu_pd7>;
@@ -354,6 +408,8 @@ l2_700: l2-cache {
 				cache-level = <2>;
 				cache-unified;
 				next-level-cache = <&l3_0>;
+				cache-size = <2097152>;
+				cache-line-size = <64>;
 			};
 		};
 

-- 
2.34.1


