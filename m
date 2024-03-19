Return-Path: <linux-arm-msm+bounces-14528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8347988007A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 16:24:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D5123B2105F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 15:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F15B651B6;
	Tue, 19 Mar 2024 15:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lW5XdMLI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D21381746
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 15:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710861821; cv=none; b=Y8mNr3u/6lgv/aM+marAD2P8SfvwpGew/17I6F+VkruLnvjMh+LmZUrwgMm4jFDe50GoQ2IToKtqm+M5UjlTSEMO8LIZOHNtdeeknKKOmqJb3swoG0+irhzDCJ8XWD0HUYO+BGUyTb310jO3Q1pVNTj0NpAOHxZ7mxn3exsP+wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710861821; c=relaxed/simple;
	bh=uKpCtzI7ahl9I9jgSngSsWE8FtJ/DlXwSzfDNoaAdXk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=cRHQKlUwYUCfwU6aKesbZ0ddlPlx1qRsJPr58Wbo+YUQt3A8wNws9xi7C9tIn8JE4JxcVkX/a/lMu4GkjDfZtUFezg3ES1Tb8Lg37f6b6k99qlB9sx1EAzPQU3X6LxgcJ7rx0Dl5whj4+iRzjDHImIzeDGbCMACEBa0Hhy3MMFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lW5XdMLI; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-513d247e3c4so4810089e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 08:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710861817; x=1711466617; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=amnhH4kpz12iAR2SQLC2D4EUn09rR2EQgE5Pf8UZGSM=;
        b=lW5XdMLIt0ZEXHBQScnrqMkn4ecZSuuVYoz7AjJEgUTm2OQ/Fa4nt0uaTmSoJHKpHC
         ArvMV5h44b27DLKgddzj3yOU2Y0Az23V8SP5PlWTrvUxLaP9N9VsJgGFxzCl4FS9WA9h
         NHG2FGaV+l+ET8DfMod+qcSsEGo0aOSY85Dfmt9S4opKLi3kcQhB7m40vEpgCt1iRors
         zLznJjkpknP++sb8qc87P2o3OyuWU8NBnirX7QU2Qfl//EZ7nN9SOnBjMAZrtw34wT02
         lNEy3jmhYvZJHOotUPG3E0IBWWEVqE6dYl3qs8fD37nyKClesSbRadkGskIVg48bk5/Y
         fbKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710861817; x=1711466617;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=amnhH4kpz12iAR2SQLC2D4EUn09rR2EQgE5Pf8UZGSM=;
        b=qehaVECqaKxyNLc3CCCQoYNsZ8A/CZ01C6eK+MY9YBGob5Njn7nMtImaPkwIKIL42i
         0wq/6gsPAUgWmWTYsCEtNaGvYsbiXizWUfdLW93RQ5+MRW4qkm1UrUVfdi6J/liZsZwV
         xirqWhaxxKM7sx/8Zl46XQaLMEYSQ+CvXD42pK9vAY9U+g0jYlblV/suFrxUYsoAET/8
         M31pJ628asn0+u7ViBKlmSoKgd44Itg4rWeiNOJD3P0xWCTe/I1Gr9gd6e1HJp3RXN69
         w4z1Lld2QtsuVgG3T+DREAH/Ss45AgFXNqJJ0lw9UG+XfAFy9kU9V3oxvEmirqhqQ6DE
         XRkA==
X-Gm-Message-State: AOJu0Yyb1T9ODd4UIu+H+6j+zqSrME8ZKQwkveA0yGdxYknjtJaiLmtQ
	xnsces6vWRgTQIhr5I0EhBG+Z9t0rLQqwrdKOBvkqqDiLZYgsnx+7a1o5AW2bm8=
X-Google-Smtp-Source: AGHT+IHNKZXXb0WGyiU27Hy8xDgczoyJrNT7B3NaoHDAafOz1Fu3nJIdy8Ovb6ij7uxlm43KssFkHA==
X-Received: by 2002:a19:e04c:0:b0:513:5862:a525 with SMTP id g12-20020a19e04c000000b005135862a525mr1132825lfj.9.1710861817427;
        Tue, 19 Mar 2024 08:23:37 -0700 (PDT)
Received: from [127.0.1.1] (netpanel-87-246-222-29.pol.akademiki.lublin.pl. [87.246.222.29])
        by smtp.gmail.com with ESMTPSA id t28-20020a192d5c000000b005135170ed0bsm2028198lft.22.2024.03.19.08.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 08:23:36 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 19 Mar 2024 16:23:33 +0100
Subject: [PATCH] arm64: dts: qcom: sc8280xp: Fill in EAS properties
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240319-topic-8280_eas-v1-1-c605b4ea063d@linaro.org>
X-B4-Tracking: v=1; b=H4sIAPSt+WUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDY0NL3ZL8gsxkXQsjC4P41MRi3RQDoyQLY1NzSwvjVCWgpoKi1LTMCrC
 B0bG1tQBy7j1HYAAAAA==
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.13-dev-0438c

Replace the bogus capacity-dmips-mhz values and add the measured
dynamic-power-coefficient values.

The power numbers were measured by matters much more precise than the
laggy and cache-y pmic_glink battery data, though the reported values
were only accurate to 10mA. But that shouldn't be an issue, especially
for the fat and power-hungry X1Cs and given that *each SoC unit* has
somewhat different frequency-voltage maps.

X1C cluster:
940 kHz, 596 mV, 434 mW, 663 Cx
1056 kHz, 612 mV, 463 mW, 565 Cx
1171 kHz, 628 mV, 502 mW, 574 Cx
1286 kHz, 644 mV, 534 mW, 540 Cx
1401 kHz, 660 mV, 580 mW, 550 Cx
1516 kHz, 688 mV, 630 mW, 529 Cx
1632 kHz, 712 mV, 690 mW, 533 Cx
1747 kHz, 728 mV, 722 mW, 503 Cx
1862 kHz, 752 mV, 787 mW, 504 Cx
1977 kHz, 776 mV, 855 mW, 503 Cx
2073 kHz, 792 mV, 913 mW, 504 Cx
2169 kHz, 812 mV, 989 mW, 514 Cx
2284 kHz, 856 mV, 1250 mW, 611 Cx
2400 kHz, 900 mV, 1441 mW, 626 Cx
2496 kHz, 932 mV, 1600 mW, 636 Cx
2592 kHz, 964 mV, 1790 mW, 653 Cx
2688 kHz, 1000 mV, 2020 mW, 673 Cx
2803 kHz, 1040 mV, 2292 mW, 687 Cx
2899 kHz, 1076 mV, 2572 mW, 706 Cx
2995 kHz, 1108 mV, 2850 mW, 721 Cx

A78C cluster:
403 kHz, 576 mV, 180 mW, 584 Cx
499 kHz, 576 mV, 200 mW, 605 Cx
595 kHz, 576 mV, 220 mW, 612 Cx
691 kHz, 576 mV, 230 mW, 541 Cx
806 kHz, 600 mV, 250 mW, 471 Cx
902 kHz, 620 mV, 270 mW, 444 Cx
1017 kHz, 640 mV, 290 mW, 409 Cx
1113 kHz, 652 mV, 310 mW, 401 Cx
1209 kHz, 668 mV, 320 mW, 363 Cx
1324 kHz, 700 mV, 490 mW, 600 Cx
1440 kHz, 724 mV, 523 mW, 554 Cx
1555 kHz, 800 mV, 660 mW, 558 Cx
1670 kHz, 800 mV, 780 mW, 639 Cx
1785 kHz, 804 mV, 910 mW, 711 Cx
1881 kHz, 824 mV, 941 mW, 663 Cx
1996 kHz, 856 mV, 980 mW, 601 Cx
2112 kHz, 880 mV, 1020 mW, 559 Cx
2227 kHz, 908 mV, 1090 mW, 535 Cx
2342 kHz, 932 mV, 1230 mW, 552 Cx
2438 kHz, 956 mV, 1351 mW, 559 Cx

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index a5b194813079..8d17d8e718ae 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -50,7 +50,8 @@ CPU0: cpu@0 {
 			reg = <0x0 0x0>;
 			clocks = <&cpufreq_hw 0>;
 			enable-method = "psci";
-			capacity-dmips-mhz = <602>;
+			capacity-dmips-mhz = <981>;
+			dynamic-power-coefficient = <549>;
 			next-level-cache = <&L2_0>;
 			power-domains = <&CPU_PD0>;
 			power-domain-names = "psci";
@@ -77,7 +78,8 @@ CPU1: cpu@100 {
 			reg = <0x0 0x100>;
 			clocks = <&cpufreq_hw 0>;
 			enable-method = "psci";
-			capacity-dmips-mhz = <602>;
+			capacity-dmips-mhz = <981>;
+			dynamic-power-coefficient = <549>;
 			next-level-cache = <&L2_100>;
 			power-domains = <&CPU_PD1>;
 			power-domain-names = "psci";
@@ -99,7 +101,8 @@ CPU2: cpu@200 {
 			reg = <0x0 0x200>;
 			clocks = <&cpufreq_hw 0>;
 			enable-method = "psci";
-			capacity-dmips-mhz = <602>;
+			capacity-dmips-mhz = <981>;
+			dynamic-power-coefficient = <549>;
 			next-level-cache = <&L2_200>;
 			power-domains = <&CPU_PD2>;
 			power-domain-names = "psci";
@@ -121,7 +124,8 @@ CPU3: cpu@300 {
 			reg = <0x0 0x300>;
 			clocks = <&cpufreq_hw 0>;
 			enable-method = "psci";
-			capacity-dmips-mhz = <602>;
+			capacity-dmips-mhz = <981>;
+			dynamic-power-coefficient = <549>;
 			next-level-cache = <&L2_300>;
 			power-domains = <&CPU_PD3>;
 			power-domain-names = "psci";
@@ -144,6 +148,7 @@ CPU4: cpu@400 {
 			clocks = <&cpufreq_hw 1>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <590>;
 			next-level-cache = <&L2_400>;
 			power-domains = <&CPU_PD4>;
 			power-domain-names = "psci";
@@ -166,6 +171,7 @@ CPU5: cpu@500 {
 			clocks = <&cpufreq_hw 1>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <590>;
 			next-level-cache = <&L2_500>;
 			power-domains = <&CPU_PD5>;
 			power-domain-names = "psci";
@@ -188,6 +194,7 @@ CPU6: cpu@600 {
 			clocks = <&cpufreq_hw 1>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <590>;
 			next-level-cache = <&L2_600>;
 			power-domains = <&CPU_PD6>;
 			power-domain-names = "psci";
@@ -210,6 +217,7 @@ CPU7: cpu@700 {
 			clocks = <&cpufreq_hw 1>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <590>;
 			next-level-cache = <&L2_700>;
 			power-domains = <&CPU_PD7>;
 			power-domain-names = "psci";

---
base-commit: 226d3c72fcde130a99d760895ebdd20e78e02cb5
change-id: 20240319-topic-8280_eas-d02b8357983e

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>


