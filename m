Return-Path: <linux-arm-msm+bounces-91073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EK7NI3Bfemkc5gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 20:11:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 213BEA8129
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 20:11:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 81D6C3006139
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 19:11:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70A61372B3B;
	Wed, 28 Jan 2026 19:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CB3f5Fgk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C392DB7B4;
	Wed, 28 Jan 2026 19:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769627502; cv=none; b=V/AR+2KfGeamY08JQgK9aiahp8w/A8N+eh8RUQ7CecBR1rFl63cWYFmWQS63TOJ1pgnhEHRo//c172AjQG/is2JOT4mL1JnpKGijDHJd6dubaS2DyoqQpwPncavOpVSuXiYArDRl+JWiMbm2PD3Kf7zDnvV5EGykUJ51bRJw8Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769627502; c=relaxed/simple;
	bh=NFzQy+b5YE6/ausOxwP9tx97FOkk60AadOvGywhrZLk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=S7GkF/Hw1kVE6G+HKIWImgrkIj/aceT8ATMm1hy1x1ddz+Kh+3hpLYlVTWODnK5Dpyg+O5ukePDQiLvqhoIFfsmKbwOv3udIFruf90lfIJI7lsmNZGYaBz5o4wfuQlGqVfuhyLDNOZG9HjZLb+D6Y/Beo7s+K9TMMd+XcJ7P2eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CB3f5Fgk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D4DB0C4CEF1;
	Wed, 28 Jan 2026 19:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769627501;
	bh=NFzQy+b5YE6/ausOxwP9tx97FOkk60AadOvGywhrZLk=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=CB3f5Fgku52wGhXhqNIhqQ/EwNy6Z7P0QJ/Jes5LIMXvlfqBUZf8rceL5JjGGhPLj
	 hLTynwlX/zQk+lRnDzJC+csTb1tVFxAuNxF01jpVTqD2tNvbxLT5tT+Ms/sjuVV75L
	 XfgRiifPjh0fUPtJyZUs+Gv7jJdwUeuo1O+s/Fl0cZQx0KpgMgQn9NsD3nCUi1bNJR
	 k3ALwdnFWTW5aKDT+8FjnWquwro2zWn0jdqutzfrf/ClG1cQir6fLtWKlp6pP+ppCe
	 E3kgB64HHkBQ5KOaKHLYbUbjs/6GprUAJN4v9e18psXo6D9Xqh4K7AZyr1qdgNCQgd
	 Qd2945kpT7/Hw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5001D46BE9;
	Wed, 28 Jan 2026 19:11:41 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Wed, 28 Jan 2026 13:11:28 -0600
Subject: [PATCH] arm64: dts: qcom: sm8550: Update EAS properties
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-sm8550-eas-v1-1-fb80615bed5c@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyML3eJcC1NTA93UxGLd5JTEtLSURPM0c3NLJaCGgqLUtMwKsGHRsbW
 1AKPAP9lcAAAA
X-Change-ID: 20260128-sm8550-eas-cdaffda7f779
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xilin Wu <wuxilin123@gmail.com>, 
 Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769627501; l=7171;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=dr/gb4h1i+fv/Qf0FGJkkB3yJSjHPlPUZdd42Eh6dqs=;
 b=uJKU+Oj3cW/4F1uMKZA6IfGz52NMD0C81hG/yhhZpEL+iceCBY3bwka+rwmYKFQHNNZ0zgRtB
 yYFVHgIaejFAhD45rGc25xFuChj8h6ocrRnFIhza9v6IS3YyVYiWpHo
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91073-lists,linux-arm-msm=lfdr.de,webgeek1234.gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_PROHIBIT(0.00)[0.0.1.44:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	HAS_REPLYTO(0.00)[webgeek1234@gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.100:email,0.0.2.188:email,0.0.0.0:email,0.0.0.200:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,0.0.1.244:email,0.0.1.144:email,0.0.2.88:email]
X-Rspamd-Queue-Id: 213BEA8129
X-Rspamd-Action: no action

From: Xilin Wu <wuxilin123@gmail.com>

The original values provided by Qualcomm appear to be quite
inaccurate. Specifically, some heavy gaming tasks could be
improperly assigned to the A510 cores by the scheduler, resulting
in a CPU bottleneck. This update to the EAS properties aims to
enhance the user experience across various scenarios.

The power numbers were obtained using a Type-C power meter, which
was directly connected to the battery connector on the AYN Odin 2
motherboard, acting as a fake battery.

It should be noted that the A715 cores seem less efficient than the
A710 cores. Therefore, an average value has been assigned to them,
considering that the A715 and A710 cores share a single cpufreq
domain.

Cortex-A510 cores:
441 kHz, 564 mV, 43 mW, 350 Cx
556 kHz, 580 mV, 59 mW, 346 Cx
672 kHz, 592 mV, 71 mW, 312 Cx
787 kHz, 604 mV, 83 mW, 290 Cx
902 kHz, 608 mV, 96 mW, 288 Cx
1017 kHz, 624 mV, 107 mW, 264 Cx
1113 kHz, 636 mV, 117 mW, 252 Cx
1228 kHz, 652 mV, 130 mW, 240 Cx
1344 kHz, 668 mV, 146 mW, 235 Cx
1459 kHz, 688 mV, 155 mW, 214 Cx
1555 kHz, 704 mV, 166 mW, 205 Cx
1670 kHz, 724 mV, 178 mW, 192 Cx
1785 kHz, 744 mV, 197 mW, 189 Cx
1900 kHz, 764 mV, 221 mW, 190 Cx
2016 kHz, 784 mV, 243 mW, 188 Cx
Your dynamic-power-coefficient for cpu 1: 251

Cortex-A715 cores:
614 kHz, 572 mV, 97 mW, 470 Cx
729 kHz, 592 mV, 123 mW, 473 Cx
844 kHz, 608 mV, 152 mW, 486 Cx
940 kHz, 624 mV, 178 mW, 485 Cx
1056 kHz, 644 mV, 207 mW, 465 Cx
1171 kHz, 656 mV, 243 mW, 480 Cx
1286 kHz, 672 mV, 271 mW, 459 Cx
1401 kHz, 692 mV, 310 mW, 454 Cx
1536 kHz, 716 mV, 368 mW, 462 Cx
1651 kHz, 740 mV, 416 mW, 454 Cx
1785 kHz, 760 mV, 492 mW, 475 Cx
1920 kHz, 784 mV, 544 mW, 457 Cx
2054 kHz, 804 mV, 613 mW, 458 Cx
2188 kHz, 828 mV, 702 mW, 465 Cx
2323 kHz, 852 mV, 782 mW, 461 Cx
2457 kHz, 876 mV, 895 mW, 473 Cx
2592 kHz, 896 mV, 1020 mW, 490 Cx
2707 kHz, 920 mV, 1140 mW, 498 Cx
2803 kHz, 940 mV, 1215 mW, 490 Cx
Your dynamic-power-coefficient for cpu 3: 472

Cortex-A710 cores:
614 kHz, 572 mV, 91 mW, 388 Cx
729 kHz, 592 mV, 116 mW, 424 Cx
844 kHz, 608 mV, 143 mW, 443 Cx
940 kHz, 624 mV, 165 mW, 434 Cx
1056 kHz, 644 mV, 195 mW, 430 Cx
1171 kHz, 656 mV, 218 mW, 414 Cx
1286 kHz, 672 mV, 250 mW, 415 Cx
1401 kHz, 692 mV, 286 mW, 412 Cx
1536 kHz, 716 mV, 331 mW, 407 Cx
1651 kHz, 740 mV, 374 mW, 401 Cx
1785 kHz, 760 mV, 439 mW, 417 Cx
1920 kHz, 784 mV, 495 mW, 411 Cx
2054 kHz, 804 mV, 557 mW, 412 Cx
2188 kHz, 828 mV, 632 mW, 415 Cx
2323 kHz, 852 mV, 721 mW, 422 Cx
2457 kHz, 876 mV, 813 mW, 427 Cx
2592 kHz, 896 mV, 912 mW, 435 Cx
2707 kHz, 920 mV, 1019 mW, 442 Cx
2803 kHz, 940 mV, 1087 mW, 436 Cx
Your dynamic-power-coefficient for cpu 5: 421

Cortex-X3 core:
729 kHz, 568 mV, 252 mW, 1110 Cx
864 kHz, 580 mV, 312 mW, 1097 Cx
998 kHz, 592 mV, 379 mW, 1109 Cx
1132 kHz, 608 mV, 453 mW, 1099 Cx
1248 kHz, 624 mV, 517 mW, 1067 Cx
1363 kHz, 636 mV, 587 mW, 1067 Cx
1478 kHz, 648 mV, 657 mW, 1058 Cx
1593 kHz, 664 mV, 739 mW, 1049 Cx
1708 kHz, 680 mV, 813 mW, 1020 Cx
1843 kHz, 704 mV, 940 mW, 1021 Cx
1977 kHz, 724 mV, 1054 mW, 1007 Cx
2092 kHz, 740 mV, 1201 mW, 1045 Cx
2227 kHz, 768 mV, 1358 mW, 1029 Cx
2342 kHz, 788 mV, 1486 mW, 1016 Cx
2476 kHz, 812 mV, 1711 mW, 1046 Cx
2592 kHz, 836 mV, 1846 mW, 1014 Cx
2726 kHz, 856 mV, 2046 mW, 1020 Cx
2841 kHz, 880 mV, 2266 mW, 1027 Cx
2956 kHz, 908 mV, 2616 mW, 1074 Cx
3187 kHz, 956 mV, 3326 mW, 1147 Cx
Your dynamic-power-coefficient for cpu 7: 1057

7-zip benchmark single-core MIPS:
2128   4416   4632   6686

Signed-off-by: Xilin Wu <wuxilin123@gmail.com>
Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index e3f93f4f412ded9583a6bc9215185a0daf5f1b57..7bbbf3109bc2c6e2e6445207cc86c401be482a73 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -76,8 +76,8 @@ cpu0: cpu@0 {
 			power-domains = <&cpu_pd0>;
 			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 0>;
-			capacity-dmips-mhz = <1024>;
-			dynamic-power-coefficient = <100>;
+			capacity-dmips-mhz = <326>;
+			dynamic-power-coefficient = <251>;
 			#cooling-cells = <2>;
 			l2_0: l2-cache {
 				compatible = "cache";
@@ -102,8 +102,8 @@ cpu1: cpu@100 {
 			power-domains = <&cpu_pd1>;
 			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 0>;
-			capacity-dmips-mhz = <1024>;
-			dynamic-power-coefficient = <100>;
+			capacity-dmips-mhz = <326>;
+			dynamic-power-coefficient = <251>;
 			#cooling-cells = <2>;
 			l2_100: l2-cache {
 				compatible = "cache";
@@ -123,8 +123,8 @@ cpu2: cpu@200 {
 			power-domains = <&cpu_pd2>;
 			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 0>;
-			capacity-dmips-mhz = <1024>;
-			dynamic-power-coefficient = <100>;
+			capacity-dmips-mhz = <326>;
+			dynamic-power-coefficient = <251>;
 			#cooling-cells = <2>;
 			l2_200: l2-cache {
 				compatible = "cache";
@@ -144,8 +144,8 @@ cpu3: cpu@300 {
 			power-domains = <&cpu_pd3>;
 			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 1>;
-			capacity-dmips-mhz = <1792>;
-			dynamic-power-coefficient = <270>;
+			capacity-dmips-mhz = <693>;
+			dynamic-power-coefficient = <447>;
 			#cooling-cells = <2>;
 			l2_300: l2-cache {
 				compatible = "cache";
@@ -165,8 +165,8 @@ cpu4: cpu@400 {
 			power-domains = <&cpu_pd4>;
 			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 1>;
-			capacity-dmips-mhz = <1792>;
-			dynamic-power-coefficient = <270>;
+			capacity-dmips-mhz = <693>;
+			dynamic-power-coefficient = <447>;
 			#cooling-cells = <2>;
 			l2_400: l2-cache {
 				compatible = "cache";
@@ -186,8 +186,8 @@ cpu5: cpu@500 {
 			power-domains = <&cpu_pd5>;
 			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 1>;
-			capacity-dmips-mhz = <1792>;
-			dynamic-power-coefficient = <270>;
+			capacity-dmips-mhz = <693>;
+			dynamic-power-coefficient = <447>;
 			#cooling-cells = <2>;
 			l2_500: l2-cache {
 				compatible = "cache";
@@ -207,8 +207,8 @@ cpu6: cpu@600 {
 			power-domains = <&cpu_pd6>;
 			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 1>;
-			capacity-dmips-mhz = <1792>;
-			dynamic-power-coefficient = <270>;
+			capacity-dmips-mhz = <693>;
+			dynamic-power-coefficient = <447>;
 			#cooling-cells = <2>;
 			l2_600: l2-cache {
 				compatible = "cache";
@@ -228,8 +228,8 @@ cpu7: cpu@700 {
 			power-domains = <&cpu_pd7>;
 			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 2>;
-			capacity-dmips-mhz = <1894>;
-			dynamic-power-coefficient = <588>;
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <1057>;
 			#cooling-cells = <2>;
 			l2_700: l2-cache {
 				compatible = "cache";

---
base-commit: 3f24e4edcd1b8981c6b448ea2680726dedd87279
change-id: 20260128-sm8550-eas-cdaffda7f779

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>



