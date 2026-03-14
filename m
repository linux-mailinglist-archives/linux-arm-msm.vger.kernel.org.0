Return-Path: <linux-arm-msm+bounces-97664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CkeJvDJtGnLswAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 03:37:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 382F728B6AE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 03:37:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 919B8301E964
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 02:37:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71546287259;
	Sat, 14 Mar 2026 02:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LSxMbWao"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115672BEFF6
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 02:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773455852; cv=none; b=K8z+azRhFQo/D5tAfbs7X/iR8qUUqjKh3CV0kIohDZ+sKKTt6JEYiU/8TPTVRB0u53tPa6+HPsD1tjfdbwt7Y/q9jyEpO/KGR2ptg4tKptcnlKPzZis1uoLeK1hhPp8Rhb/RrW1YtCnvsIjL27JkJ9JC2hUv2cKxKrVKuy0b17c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773455852; c=relaxed/simple;
	bh=s/3t98TVFqAubiFusncL0/U38n25Y0oSS0WYw9+QA3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bKsC6N7CaKoT0iyIbbYOGQ6XAYVHcxdYAELt4G+z1YbMbo2eaRlotQ3h6luiUb5VY93eKoWOA8O/3htvt2nf/LRLy8yRvfGnEIDBoDdGBWDO8hF9Ph/09gJom9nXSbWASq8DkJGXCRl8m6YqiRiYO3U4C3Hz1pWTWs03oGJIA54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LSxMbWao; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a1485a7c8fso280003e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 19:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773455849; x=1774060649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7zJSqAoLf8m6YwXwXNsLDaR07GYVsL35nr5h+4nUg0o=;
        b=LSxMbWaoPXVwGYjl8AlIt3crDl+iD17/cH0/IS/ultgxbS7mAeZ4ybsfwjTYSLVyFD
         xAQKt3/sQIk3sXpWRqCJZMukpLWWXfAjOyMJRd7XrYOYsrrU76iNedyB/RdgQyaHkGE2
         BILGjDW1qMprDjUp7GdzPCjOgFpwOhw/RmbnMeNb5HqA0wb5f/iEIY2a+9cebdE/Vp75
         59qUbUtLEp7ijDRepnNfWZ3VlVOw2WDnw4J8gWvv7/L3gqtGab+KyNsjh12F82L7uJsg
         N1KYaIc2JoTOyFUlKwnFA5gdcNnWJpi3NZVp4n3MOXuRrzPtT+yxPJ3mb/7z4l53H7kB
         kibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773455849; x=1774060649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7zJSqAoLf8m6YwXwXNsLDaR07GYVsL35nr5h+4nUg0o=;
        b=kVSRbEcmyQCjVIYxaEW5IcQlk+I39alUSFQZTFZxwIjLMl5fJrr4AtP1taMlf4tn5+
         5XziekHUTzZqeuA3Z6SVhxkvCiAoabuJfvFuQiks0vdVTaYyJbcJ7fkn9LPzZBAJSkB8
         RpM02f6BfmuVwWPu8tR68kaQQOSDmp6S3ye4RWuwGyirXtqljsAvrWclEo0XzxE24wzQ
         fINVQwrHEgoT0ZDr/T0k27uwuyLltY8NSM/c8roKMXIN90AhDrcMhHN890UyJrsn3Tsz
         YHiQH954rqd5RwJcCnu1vs3W+sgG4MeSCRrm0lEqVUBzOwxKbimbfrbmugLQBAmVwE9W
         lcXQ==
X-Forwarded-Encrypted: i=1; AJvYcCW49/woo/zyIG4J2BSEOZgY52QeqH3PKzB00dZzxsWudI78BzUraPC+5egSY7Z/6FWSkwTvrw5KH9bBfGNB@vger.kernel.org
X-Gm-Message-State: AOJu0YwEBYX9Rpm+clk77fZ9fiHyuLbpBeiW4sKdv+icNWf0bt7H8mwL
	FXExh+KZLi0/a1apTChc1XE4ejAY+KyxN6n7KnUObwpNui5dR/Hj2m+DpU4Id+dHM+M=
X-Gm-Gg: ATEYQzwkpZU6sZNtas+GLcL4cNtt6YJL6IpDPHW3DQmWOwNuze84MTYKkKtEAJhX8ny
	rta6DYxbFuJUutVIUZE2wsg6FPldwbZCq2RHH/H/KBsmaJfpdd+za0JuP18P8bdrCyObEyy97Df
	MOZRxRBkE1XEkDIx10DVR+6q2czYEh6QRIuTzNGKKuewzqbXIR0/m3+Gl8IZrd9I3pRGq0SOx1l
	C1wr8yZZILqOIUzEfLn7u6IDW0WV7WZw8SBcp5NV/P0THofZ3pvmFORCJjztpNmfOzoNucUY1QA
	SMtJ17gsuYDycBOw8NqGg35fWxtFQTErJSY3w3gUCK2l7T1NXmn+4R8gufJo7CMxbTo5lxvzJPF
	Rmo5d2iVDU/P6OrBvPKJelp2Cqv77XjIJ/1qrW8vT4CzEABb91ea5i90iuMhf2T+e0b/BPX0kfj
	agpuSYFeThcat4q4Z1CDGlZ2Hb39njRIw6BC+nVjiTxd/pEW7xFms/ZOoofNqKOOOkOg==
X-Received: by 2002:ac2:4f12:0:b0:5a1:f7e:1298 with SMTP id 2adb3069b0e04-5a162b23574mr1116773e87.8.1773455849217;
        Fri, 13 Mar 2026 19:37:29 -0700 (PDT)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15602e692sm1884296e87.30.2026.03.13.19.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 19:37:28 -0700 (PDT)
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
Subject: [PATCH v2 3/6] arm64: dts: qcom: hamoa: Fix xo clock supply of platform SD host controller
Date: Sat, 14 Mar 2026 04:37:12 +0200
Message-ID: <20260314023715.357512-4-vladimir.zapolskiy@linaro.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97664-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.134.242.224:email,0.134.86.160:email];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: 382F728B6AE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The expected frequency of SD host controller core supply clock is 19.2MHz,
while RPMH_CXO_CLK clock frequency on SM8650 platform is 38.4MHz.

Apparently the overclocked supply clock could be good enough on some
boards and even with the most of SD cards, however some low-end UHS-I
SD cards in SDR104 mode of the host controller produce I/O errors in
runtime, fortunately this problem is gone, if the "xo" clock frequency
matches the expected 19.2MHz clock rate.

Fixes: ffb21c1e19b1 ("arm64: dts: qcom: x1e80100: Describe the SDHC controllers")
Reported-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index a3a045732941..140c8f1237da 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -4714,7 +4714,7 @@ sdhc_2: mmc@8804000 {
 
 			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
 				 <&gcc GCC_SDCC2_APPS_CLK>,
-				 <&rpmhcc RPMH_CXO_CLK>;
+				 <&bi_tcxo_div2>;
 			clock-names = "iface", "core", "xo";
 			iommus = <&apps_smmu 0x520 0>;
 			qcom,dll-config = <0x0007642c>;
@@ -4767,7 +4767,7 @@ sdhc_4: mmc@8844000 {
 
 			clocks = <&gcc GCC_SDCC4_AHB_CLK>,
 				 <&gcc GCC_SDCC4_APPS_CLK>,
-				 <&rpmhcc RPMH_CXO_CLK>;
+				 <&bi_tcxo_div2>;
 			clock-names = "iface", "core", "xo";
 			iommus = <&apps_smmu 0x160 0>;
 			qcom,dll-config = <0x0007642c>;
-- 
2.49.0


