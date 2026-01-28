Return-Path: <linux-arm-msm+bounces-90944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPjbHAHmeWl60wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 11:33:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD9F9F855
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 11:33:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4092930233F0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 10:33:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8568F3081D2;
	Wed, 28 Jan 2026 10:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t1+XQ1ME"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB272BEC2E
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 10:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769596404; cv=none; b=oAUf0/FQDwQF3RUJoYzfaRJnpYSnhvtAktJg6llu8H/eUezQEMgJ8VpWdWX90FhH4SoCQI0fNlWnT7PGJgHEo9H7LWyIMjsoP8Vec4QuDnlGaMzX9Tw4iUTqu5FrcoIRc96Wy7icL33Djx0nQO1rKrXGbTZJ5OZ5BIMUbikY+G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769596404; c=relaxed/simple;
	bh=+jf37To92deX2h/HSpZ3cBfbrAaB8q7zHpNEuFUPQ2U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WHzsLGN4DlBCZGRhuEZcvcEYyfU2ayaqgF8azs5kce4eh9N51hULOnnA3fI3+2t+CKAw+sFNNXz1cFg4bHBE2lmecefL8j27LXo8hpX4MXFPXBbXKEgo99ERsE+1fsiNCa1nFXOwv8EVQ6x2ihhyS0u9NsEOt8HdOPzQZ3OJPnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t1+XQ1ME; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-432d2c7dd52so6552261f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 02:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769596401; x=1770201201; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wzDb8w4TdLl7KCZAoNHpNxgDvjCsTC5vA7W7EaIdUuY=;
        b=t1+XQ1MEH3wolfK/Hj+i4H8N84oFwJIwlSM1P+pgTBMcMjWhS5mSzb9q7UebLB5fo7
         DSmRgxdFnTexR+/a+sZLKg5KiA9TU+X4OU/mQcko+I2GbDboW0voswtdTsE3DcsHgqri
         D2yRi+6zWY5cCj4pv/V35KJa8PLyZeJZodLeOook/syWnCKkM2OaYbQ2tF9a7dVk2u/A
         aGEij1D41FYOg47Xo7J2OrVACTO/zwTPQOm12sWuUk/Ok+NFyGO44NKowI36zTQZTODn
         4aWvCPN/W2bvQ0NjV9Ys1DfxnGUNv5Cq5COk67HnZMmY4unsfKzU+QrDhZxwfxK66aPi
         huYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769596401; x=1770201201;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wzDb8w4TdLl7KCZAoNHpNxgDvjCsTC5vA7W7EaIdUuY=;
        b=iEd3zot5hGsM1UVi2mVDVQL5jk3fykIxVET+sYu6Kwp7kw0oywm9XQLNYIfOp1UP8o
         X5ZjQarpykE2WXOa1jeGIfpR7J8qvAdWa7ETtIts+doj3sjnLJmB3AZOq2gieCeqOd8w
         ww2nWGYMP61q/35pSV7NLuvBrlEBKdpzZ/XgTO7JLPJewlDrOGUQdRqc88wYsKm4/VAc
         aZ+IRSUqhcZR+zM0bzZIYPIdJSRSTy6c1HTfNnaNALGjvt+xGb+RSf3HtXxj+qBBVXt6
         jePOE9yR25f4OsSEBAbgakZPKl4ahVlIXjBH6FTNZ03rJ3lIZkbgN+7SgXC477/2zd3+
         mzbA==
X-Gm-Message-State: AOJu0Yz21YcsghUpG1BPUpVQWFB3/ekFr6Few7dO3cwZQQGb1MtiC+cq
	gGJ9AVmWaAwF6mB+kwNHojmJvuTvunWr1/sQHqKGP0CDcf+XfzN0VFJ325lxLs4ezxs=
X-Gm-Gg: AZuq6aJ8eK3rtGNZ8xMb/xgBUN+xUnJ7fAUANH/BJ1+sUgd3tDA8iTBdXfdBrK1fUrD
	xP7tlYG0LjO9vDw5v9Tq0oTCuSp/C5Stnn7gliZ3xQXant/C6/FP3HAZqaIX/8EXd6Qg1NeW0Qb
	CNbMqrX97AT3CPvbYGCB+l6ah6++YfnMWSXu0s6qIzYr+GgLyQo7m3IpGTPSWqIc1ncTjtbWFlU
	kLKM8EziYLnzRij/PPj2/cnNFveY8edhw+WyGUUVq1mrIhAJr+cKunldQob95IYdvDHzDSw0PKZ
	FXf+c4MRGDll8eihJc+1fra4nCY8QlOFa0GnaTwK+OQdx6U8eMFBK8WOpkp8sxspwCflK4LQc1K
	7aYoQltsqj0N2ZIhhTniHNiPMvmFDZcFJ/GroavPoGxpXfgFzv9LxqZhhyOOZCyqg7QOHo/Q1Vu
	qmfYSvZVsYmxYqFFkiuDQC42p8CtZV0n8=
X-Received: by 2002:a5d:5d13:0:b0:42f:bbc6:eda2 with SMTP id ffacd0b85a97d-435dd1c1307mr7044284f8f.40.1769596400916;
        Wed, 28 Jan 2026 02:33:20 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e132356dsm6241692f8f.33.2026.01.28.02.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 02:33:20 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 28 Jan 2026 11:33:16 +0100
Subject: [PATCH 1/3] arm64: dts: qcom: sm8650: update the cpus
 capacity-dmips-mhz
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-topic-sm8650-upstream-cpu-props-v1-1-9fbb5efe7f07@linaro.org>
References: <20260128-topic-sm8650-upstream-cpu-props-v1-0-9fbb5efe7f07@linaro.org>
In-Reply-To: <20260128-topic-sm8650-upstream-cpu-props-v1-0-9fbb5efe7f07@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2395;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=+jf37To92deX2h/HSpZ3cBfbrAaB8q7zHpNEuFUPQ2U=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpeeXu1uH/j/sSPy8Q6S3vk0E0py92yyl5Av6nnwzE
 ZLUayDeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaXnl7gAKCRB33NvayMhJ0Zk9EA
 DQ6nbGnk/tLctx1opJs1v/Hx60ZO/HcSPQ0O4b4NE82H8f3mw5ehI8bSF/VeZxe8beeTt7uyWhbKDU
 r9JKWRIxUBKTei8dTm1u5BGVwkRZwrzfpxL9EsPBvxIV35sSTP5doDs0uy1cZtbfJE0yKoNGZNTB6I
 dyE/TKMVIcnzXbCUif7jqZu399uI/bd8EP0C989yX59SV/pvjSPHgsF6uj/YNqMnz6RVS1bHFQdMdb
 WPWi7DUo17/Q7O2nsb37eiBQOyD3/IWFkqVN63pbCpCO2xgM6MtG6ebCUf3VCv3vSRmhcbrpmcvweq
 RuC4xUZ2lhGv3T1J1ee0KBP8wflqjVZWMkmVfqgalM9B5KlJ5/CH1+G2slQuOz7ZPShonEj7bEB9Hz
 WbEUmFcn/Bbicv15hUj4uRIt5Ob9h0ltyu/U2FHhsELSNmU5fphbjwyOTYsl988tZqc//VdjkPyvzG
 BNwR16VBvMfFUtzYQ2n5qAL2LvHFa8eog09GZreNvcBh0cUfv3raPsIDwebp/tuqvUsCfxSyRRlH9X
 PDS7chhmV/Ck8iVFTor9KK0e9v32E7E3fdeq3b8EX7Nl3DrNvH0nQnA2ZF77EBuhDD9oldIjr00Vpg
 IbxDZmse2PBPWVCHISa07L+a/x5iG3mFsyKyZWAR+vl5o7mAlatPvhJvBuYA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-90944-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.200:email,0.0.2.188:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.2.88:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.1.244:email,0.0.1.44:email,linaro.org:email,linaro.org:dkim,linaro.org:mid,0.0.1.144:email]
X-Rspamd-Queue-Id: DAD9F9F855
X-Rspamd-Action: no action

After some more advanced benchmarks with Integer, Floaring Point,
Encryption, Compression, NEON, ... on the A520, A720 and X4 cpus,
the median gain with the same frequency range is:
- 281% of A720 over A520
- 126% of X4 over A720

When adjusted with the frequency delta, we get better values
describing the difference in capacity, showing the weakness of
the A520 designed for very small tasks while the A720 and X4
are much more powerful.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index f8e1950a74ac..8671c25dd68f 100644
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


