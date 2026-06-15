Return-Path: <linux-arm-msm+bounces-113230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YEKVFlcuMGpIPgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 18:54:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B594068892E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 18:54:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=H77jf2mD;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113230-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113230-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 640E630F2C85
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 16:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A6DC41166D;
	Mon, 15 Jun 2026 16:49:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB64340FDA0
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 16:49:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781542145; cv=none; b=IfetBBfd+o3YhQTH8QD22PZlCVTpc8Sqthto4pOxmSrUwkpYIUO54d8JsU5VzOwRGC6MG8IqzMbDuSVIvsK8xZLVBxciHZMUXgc24L0Ts8v+grTy3s2W7qaYbHADA63FAbMJ6KEXTB3aza58pZwTuvTMN7UEEYch+2ffkJCJtZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781542145; c=relaxed/simple;
	bh=4HjNMydN5tW67EpwgcKq0bJylrgzUaRgs8yaNRqheFs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XCdSv1GUH9P0gsGA+M4l51z0KOMjnlDWL/QFP+yxxJ/1n3fEdr2zVej7VvlRme0xS9ztyXOpeLU/bnQL+kOMrddnpNhLGhpyZqdv2lucjgMqYOxBNg6vbaWkx3jR6A20Bd0iTsFfDbQDSpVT/8nbI3rmGBgznASfjWos6y3pJPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H77jf2mD; arc=none smtp.client-ip=209.85.128.49
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490ac10e337so24981795e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 09:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781542141; x=1782146941; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OUXv3GxUdJrnvQC/PhSLkI1Hz8IfckJ8inkqhUnweag=;
        b=H77jf2mDtgI2h0xxEazON8CFF+z+v4AamO/Ypo8HSS3qUAbQtOG8p7EZsxOhjnRDm8
         oOXceYVt6t5G7653ZoVTwXg7jnXWi2ZRByyf1ijpvmtRVG9olCGO1TlL8F7aKJnuoMa5
         85nAhGQb2p7Ho9Hy+Lug79k2SeRVIhcGWzCHi48r814ttRpxhlIvxFdgvZNP9DVIF3r0
         zsAVh7ycK6LTrAWgIQq9mwYXtQvHnsi/BnsVPCM/tS/wq7iu0GDdPKY30p7PHQ+cKIwz
         l6ghWmtoXvDz/DC8brqq0UScwxG38Ar4O9ZLo/38iZqptXumupJMwpA9NJsSnC7Sg7kR
         XwzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781542141; x=1782146941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OUXv3GxUdJrnvQC/PhSLkI1Hz8IfckJ8inkqhUnweag=;
        b=cf8JKDP7uma5BcMEaGotWoA6CTYUe0iTHpyiMWzRqdDBgP+jAPDrs12e7C7cuiv26G
         vaPAmMMH5EcpX4VJ38kPx4C7Op8hvCrqvhrzUCR5ZUZsk7xsiFQiI1v4ZcsZezMncgbC
         dXyXz6Dza5natdW6fcUL+cTWb860wXZygElXl9PUMN3uUhBPBp14cim7KNRJljNgGI23
         MRHclKbxn8/CptKwSnaDphTCiaoLwgFo0aCP2+JYXwALYbrkbQNTr9BI0zbScpN5fOZ9
         A8elnoNswSDuP59iMphj+2QLHzIjM4RC/q71bCfzjx4K19WJoeSnYk6iewcjK3wNfxQu
         98rA==
X-Gm-Message-State: AOJu0YwQZYBWpwHGGvmEPPyXr7w08mM4mZFJPq8m/fOCZ5AyQTLrrici
	qcH85f5F26gGhrnOZ2Isr7XjBmxYFjn630vtFZeMOVKxDJiUEb68PH8jb1Z12VYxwbM=
X-Gm-Gg: Acq92OHkyUSuM4kWXu26Fu3DmOZzx5/8pDXzG2ZvzQRaMSHOofxZoskkmwEgYL/wAIs
	5xo4i42qnR4jjtX/qXdKkK+uFsANCNai+dEqr6tbMm3YrcR0y1AoVFlvVFdiUgume4YWt+0vS3/
	i9BahKJ5Z5dsLCxx/ZkqXspd8HhFJEf7R4ycwdqylWy/JJ1xhcmm/lBz5T8VeOaFLkpdEi6Ewr4
	StISxgl7OChZyUP9J91s5DdmqJh7hQJRM52X8csIXgp7MQAd5RVDw+hv2lttyB3L5s1rrJP1TTB
	VCWnORv3Dm+587EpMjW3JCyhwWFuVGDl2pskvSA0WcHVG6HSBSsG2uHtzdnFMnCteCAEKfUmKYX
	V94H1hxEkXPNSDfulCrb2mbPrxRLfxWHj3XsaaJbrZmCJsJcnyQUbNIwBsVDV5hEAqbZNwZQQ8P
	YNAAk5bg84Y0qRpxpzRGxEfhB4HgfOVPTz5eN1XKSfx+fR
X-Received: by 2002:a05:600c:348b:b0:490:e5c1:b89e with SMTP id 5b1f17b1804b1-49220061e38mr147294985e9.10.1781542141226;
        Mon, 15 Jun 2026 09:49:01 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa58f80sm5670735e9.11.2026.06.15.09.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 09:49:00 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 15 Jun 2026 18:48:56 +0200
Subject: [PATCH v3 1/3] arm64: dts: qcom: sm8650: update the cpus
 capacity-dmips-mhz
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-topic-sm8650-upstream-cpu-props-v3-1-eeb6e9fa7581@linaro.org>
References: <20260615-topic-sm8650-upstream-cpu-props-v3-0-eeb6e9fa7581@linaro.org>
In-Reply-To: <20260615-topic-sm8650-upstream-cpu-props-v3-0-eeb6e9fa7581@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2456;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=4HjNMydN5tW67EpwgcKq0bJylrgzUaRgs8yaNRqheFs=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqMCz5xS9GJqTCNHkog1BlkPNcz1FAPC6mkpwqRzjO
 SS2fs+KJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCajAs+QAKCRB33NvayMhJ0Y9GEA
 DChGYTSaDf5U8w0dI2k7yC8hoHsAkMGdLqQlhnx/40V6ikap6mA5qj9l3SegHMt3Q1XryIF9Sbc7c0
 ziFWACnoDYJj4j8FlLrLaj/d/WeZsDoQWI099es7xdBoOcPcbjDTD7h9U1i9+zBNw8+fYhG1ySDFNq
 jTyNT4wD2VS/75ShHWyLGWFvS1uH7qHUdeiAEQSnA6ksjcjSiVajOkyhcecnEggQEEba9CLm0pFpYl
 hxY3nCtvn8LR+MyQ7yp+CNGv3Z6AkdWwYHjieu2DAEtKxqJs7QjFcjwTuwPfSC/8bsWpPTxP6rp+d3
 eq6o1gHvc1u62OQxDPnlcpmsvAVEVsUvxzaAzt/RTTXlStYfBsvbWpFXpFsYOZJb7vsxBvkwxNMvt0
 kjrI7zSQyVHQ1e3vJ0DqowUbPfJJOQFSzgNuUU9pNDau14/Y3r3XwfFGhzMl8y3/LPdfNFHkIfSBCi
 niukuQp/9vJnp6aDJS3vSh80ictjhU0suyjjo66lmVG2juj4SbdUJwcBqlBlBHQw6uGN4of7AV5CgH
 PtQcnotmZNFYn7Mcqc3wgerhuR7yhFKqTkm4Y1ZgcB+THxxvGe468gQcTeq+oPnRPM2G4T9uCwXYYh
 rK1rWRGKnUCQgWtN+jbbJGfgDRsqSTLhzP+YGgfCJo3jtP9taaq6qjJL5XVw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113230-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:neil.armstrong@linaro.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:email,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B594068892E

After some more advanced benchmarks with Integer, Floaring Point,
Encryption, Compression, NEON, ... on the A520, A720 and X4 cpus,
the median gain with the same frequency range is:
- 281% of A720 over A520
- 126% of X4 over A720

When adjusted with the frequency delta, we get better values
describing the difference in capacity, showing the weakness of
the A520 designed for very small tasks while the A720 and X4
are much more powerful.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 160ead25ecf7..e8e43ddc3032 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -153,7 +153,7 @@ cpu2: cpu@200 {
 
 			enable-method = "psci";
 			next-level-cache = <&l2_200>;
-			capacity-dmips-mhz = <1792>;
+			capacity-dmips-mhz = <2909>;
 			dynamic-power-coefficient = <238>;
 
 			qcom,freq-domain = <&cpufreq_hw 3>;
@@ -189,7 +189,7 @@ cpu3: cpu@300 {
 
 			enable-method = "psci";
 			next-level-cache = <&l2_300>;
-			capacity-dmips-mhz = <1792>;
+			capacity-dmips-mhz = <2909>;
 			dynamic-power-coefficient = <238>;
 
 			qcom,freq-domain = <&cpufreq_hw 3>;
@@ -225,7 +225,7 @@ cpu4: cpu@400 {
 
 			enable-method = "psci";
 			next-level-cache = <&l2_400>;
-			capacity-dmips-mhz = <1792>;
+			capacity-dmips-mhz = <2909>;
 			dynamic-power-coefficient = <238>;
 
 			qcom,freq-domain = <&cpufreq_hw 3>;
@@ -261,7 +261,7 @@ cpu5: cpu@500 {
 
 			enable-method = "psci";
 			next-level-cache = <&l2_500>;
-			capacity-dmips-mhz = <1792>;
+			capacity-dmips-mhz = <2909>;
 			dynamic-power-coefficient = <238>;
 
 			qcom,freq-domain = <&cpufreq_hw 1>;
@@ -297,7 +297,7 @@ cpu6: cpu@600 {
 
 			enable-method = "psci";
 			next-level-cache = <&l2_600>;
-			capacity-dmips-mhz = <1792>;
+			capacity-dmips-mhz = <2909>;
 			dynamic-power-coefficient = <238>;
 
 			qcom,freq-domain = <&cpufreq_hw 1>;
@@ -333,7 +333,7 @@ cpu7: cpu@700 {
 
 			enable-method = "psci";
 			next-level-cache = <&l2_700>;
-			capacity-dmips-mhz = <1894>;
+			capacity-dmips-mhz = <3591>;
 			dynamic-power-coefficient = <588>;
 
 			qcom,freq-domain = <&cpufreq_hw 2>;

-- 
2.34.1


