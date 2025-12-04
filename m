Return-Path: <linux-arm-msm+bounces-84287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF38CA24D1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 05:15:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 48E093016EF1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 04:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6794D1917ED;
	Thu,  4 Dec 2025 04:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QbMXwxuz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12E12FBE14
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 04:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764821719; cv=none; b=jNYso/mJGb6fjHhZZ8tUOOuh5eWzCueZfwWft3JaKB9W2CCmzR36cZIxZB4FiM0+8KQNdGu1XNpAZmNdoyZqYQ1Pf26WdaXYPQS4vphPJ+Tuq6smb9R4Mt2TPT+HXYEdSwRApsMunR8QDvL8pEgUfGRSZhF4NHXpDcnK6Ah/tyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764821719; c=relaxed/simple;
	bh=CTCwj+kWkCQFv6u3LHg6oZ9+ij4Cz79FZy5bH6LtKYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iFExOHnHBA9Fh8Y0seUA2Ix9mKoDwAH/4UwDrfnkjGG+FPm4AjIa0d2IJt07/9zNpcIpTXTUUUEYxiXhCrcZc5eJbZ6CeIcLuC2KiBUkHLhuHlAzSjawuVH+njNgm3e4SJAGBgMHwTqZkoZefbnXxsMa3xwx0lDT8jGiJ2VTLmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QbMXwxuz; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5957f5e2755so15621e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 20:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764821715; x=1765426515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bH0yyu+6MPIFmZgxcDlLanirJCCNrsnhYbI6SHuaqtI=;
        b=QbMXwxuzuw43FPkNEoqOt/TvK4n0XCLxylCZHcceHQ+AWSPW+DYRZdj4RA6Brai962
         1G7bBry1vdEg3y/gWpovHYmrfg32q+Zd3awqqXGY+xnuspaVScOo8PZZ8If8yDhsgGsO
         CE8i1BUUVNInX8cTY8lFFILaPXCrGkhbjl+TpkswJLkoOChjZ3zU2ssYzjKTUkfDMU7r
         cpeshKH/S13byA2r5jxuBs1Z/HtTDDRUoF7TuiBtuE4pQJNvAfqXb+hTvoUkbaDgvfhu
         t5a3X9AXN4PvXraGwpDowBh6VE8EWDAJWlfE40yhIWe0mZh852viN4sNYpVsLn2yzhJl
         GM7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764821715; x=1765426515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bH0yyu+6MPIFmZgxcDlLanirJCCNrsnhYbI6SHuaqtI=;
        b=E54hweCWWgMEIlqxOH4xrlqijT7zFnwmMLhbmoYyEIz6nCB6WacT2JwQnmF2ClJ8CP
         A8YOJqt2TetE3zAay14+4hKyG+98JJ9LLwKb1MLXFJKACxNVe0lQvCN+eKhFeEV/t1Iw
         HzFrJU8yO8VJQwTLVg2HgaHrHuRai6p3tixaNBVw76rlicPjRFdXyuPKE7uyZaDi15/L
         IxNocH8LUeokIEodDycBGVZXMHUWVtJdN2etAiOgxGk5zXQJZKLj2rB2XOppiC0mAA/f
         /kIoTKXFjfZ/y0SWnqL6QprxrReWKOfI5Rcc0mAx2ZKzdmbW6nvIO0RMfaSI4g5xEUlo
         JRew==
X-Forwarded-Encrypted: i=1; AJvYcCUfgnR0jnOaiwv5YmKcfVe8QZ/lbbl5QoPcII9V8LvFSVOb27aTSHmZTts8Q9QRMwlPhR97DyitG1aHEa0p@vger.kernel.org
X-Gm-Message-State: AOJu0YySv4Bnkt4SV1qNVmfIyRsFtsFR1jXSL+7FKhym/L5nXnJgi1Bn
	t4mX6GN5judtie69NWY+6emWrgQm3ZAYK2iQTiQioblxaBEOPu01FfwQuYLIeYmt0wg=
X-Gm-Gg: ASbGncvyA/2UlW02tVCGu0tGF+YNqzKR4VneDL4LDBG26U/GyCDGd2qz+xuxKOgyarG
	TzDe+QgEi1LodkzpDMmtZn097eSjnkbE4FEjQtkmSzw0mnBiXRsc/8wbhu2xkEjM9AIBoefV9FV
	7+xmeE+fc6DmklP0c9BPe/H1FxciD2oHNxlCt9vsXXmKyy1KmYqMBb1jMS4B8MkoMY6S/yryUoD
	J5sn6ymliw+mnHji3oGGORVSl9WucoST/G+LRaGwmHmywGiCmffAckhrPr7AnXVx6E/On2ssbQc
	a42JWlIYkLKg36/w3Mo8HLZnPZq20T1722NxY2oXHBJI5IEDdNC7mdBbo2X0wl5ncHjLpMEt3lL
	KP6vT9R3kDJMjCZrSy0wiKRMDa56XWTM+6JPLF3/ywhj26d/30r7SP3Lk6tSBjlrTYMpdqK1UvU
	YjYMoYt3VsY0+DfqRj3afJQkS+5XUKLLe9kI7i3N/f5VhcjbVE+uX3bw==
X-Google-Smtp-Source: AGHT+IHLHxWb+cMl822nvDHBwKT8kCohM75PKWs7UuU0sfQWgknCTL9kTCHKfCdI19mhvrDxrBxrFg==
X-Received: by 2002:a05:6512:3d18:b0:592:f7b4:e5fb with SMTP id 2adb3069b0e04-597d4b40ff7mr786778e87.3.1764821714609;
        Wed, 03 Dec 2025 20:15:14 -0800 (PST)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c1e2a1sm67649e87.64.2025.12.03.20.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 20:15:13 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/4] arm64: dts: qcom: sm8650: Add description of MCLK pins
Date: Thu,  4 Dec 2025 06:15:03 +0200
Message-ID: <20251204041505.131891-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251204041505.131891-1-vladimir.zapolskiy@linaro.org>
References: <20251204041505.131891-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add fixed MCLK pin descriptions for all pins with such supported
function.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 112 +++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 06eedd2cd782..e528e9948faf 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -6109,6 +6109,118 @@ tlmm: pinctrl@f100000 {
 
 			wakeup-parent = <&pdc>;
 
+			cam0_default: cam0-default-state {
+				pins = "gpio100";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam0_sleep: cam0-sleep-state {
+				pins = "gpio100";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cam1_default: cam1-default-state {
+				pins = "gpio101";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam1_sleep: cam1-sleep-state {
+				pins = "gpio101";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cam2_default: cam2-default-state {
+				pins = "gpio102";
+				function = "cam_aon_mclk2";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam2_sleep: cam2-sleep-state {
+				pins = "gpio102";
+				function = "cam_aon_mclk2";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cam3_default: cam3-default-state {
+				pins = "gpio103";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam3_sleep: cam3-sleep-state {
+				pins = "gpio103";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cam4_default: cam4-default-state {
+				pins = "gpio104";
+				function = "cam_aon_mclk4";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam4_sleep: cam4-sleep-state {
+				pins = "gpio104";
+				function = "cam_aon_mclk4";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cam5_default: cam5-default-state {
+				pins = "gpio105";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam5_sleep: cam5-sleep-state {
+				pins = "gpio105";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cam6_default: cam6-default-state {
+				pins = "gpio108";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam6_sleep: cam6-sleep-state {
+				pins = "gpio108";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cam7_default: cam7-default-state {
+				pins = "gpio106";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam7_sleep: cam7-sleep-state {
+				pins = "gpio106";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
 			cci0_0_default: cci0-0-default-state {
 				sda-pins {
 					pins = "gpio113";
-- 
2.49.0


