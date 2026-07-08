Return-Path: <linux-arm-msm+bounces-117452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zjggDTaeTWrf2wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 02:47:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0C7720B23
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 02:47:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=N7roRcG4;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117452-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117452-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E57A30994A1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 00:44:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52127368974;
	Wed,  8 Jul 2026 00:44:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044C7368D42
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 00:44:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783471478; cv=none; b=O+qVT/91YbSGidMeJkiAl3eVXIoJHIsxlvKo+rKS+HYvaT1uQs9+VRK0JnhCOy05xltQapZPxKp36zzsU1kDzvc8y8epVJyyJjbyHyQy+3Pi/HpLD3RGNoTqAlFy3PyTVZeGT5eLmuB0v0TDg8zJDTQx8UU8H8prB5CdeemrtyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783471478; c=relaxed/simple;
	bh=mvMLAzdHB6jsqZsO+74GFyviI8Dwel3IBPxFz1BFrkk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E7v2WWgk2kw6XlMAIoJ6we9YRm8cVf85nOaNxS1b0GU37MZKnQ3l1TDrlQdkdirr2Goiu8LhteQTowoP5jwEEW2NlIg5s0+ZKQpP3j1A6vdifmiJGaiD33FZJLPmkPMOrZIX2sp0ADoMyYeNcRwy9yoms9lGVbLpBr14FydMBBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N7roRcG4; arc=none smtp.client-ip=209.85.128.51
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493b77b150aso580795e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 17:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783471469; x=1784076269; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nthn12NadXrjawh8dDtyD49F69pArpzqcwypys3xj4g=;
        b=N7roRcG4+1jj9FaLlwgk1rTY9+sbeLmroYAiEuXBPvUMTHjJREIuQU7M10PS+E4tM+
         61DEnu1xJpHhvGdfEaTvq6zeiMi+9vQkCVvFGs+orEw/dahgrf8di5JA/mWdbQdlHIn8
         zW9OLrZ+tksi4pnolkNQbRmyrO/RT00J683rGXbi7M5wQSjRSd2KaiwlOF7NlWRo6McG
         7q7SXfBcFc1mK/kA4TP+ayfF7OnTHpTCh0qnnXjDMIRmQlTIY5VOF+ouDqgLXX1ShpQS
         YweiMGD6ytRDW2SKECstt71EOmJgSHHcYiGa1UEKcHftArcdFuqFUlHYk8VeQAKjtB1j
         +ecg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783471469; x=1784076269;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nthn12NadXrjawh8dDtyD49F69pArpzqcwypys3xj4g=;
        b=mead+5AkZIzEd5ejlEE1eN2AhrSnh5Shp4sHdAJdwWVX4rE+CcXJJXuZjRJKttg4Ia
         NtDYAO1JqjWhBuzw8o1BDwdvTgZbEFTi3O+KxQPK20FS2+K5isR7d4G7id/LruRGOd1B
         6emzyPVkjOQgzOx/LYplnD6EAi18BebA633xkjcld+MTpcsSoJgbIpMQxj2VV9GXM+Hc
         u4n8prQkrIvsCBkW/PEjt7VZbHZWnSzJWZuXPZtafuXYrsOt8sC1NbiDoFP0ACasTAM6
         a6wfY+mj+vFAX7Kuuma1SSwMx5/m5c3dplrfAtsdh17fS8TK84F4UO53wkKskgtRQe4O
         Iobg==
X-Gm-Message-State: AOJu0Ywgq6Jd/ralfOiNaRo8qPZhKE3sDlKR2OosEmSK6uGzDWSDOgrZ
	nz7RQB9iY3FUrlF7oMmRqHxcR9YnaN1RKBmyOLWwXzCDi2bcazvQZXq0VkEc8c2DWdc=
X-Gm-Gg: AfdE7clwWAZMGl67n9WWj4BLnxRdm3I6WplIoGg1OjHNQo/oOGqGxHvYqpZ98SkbhY6
	p9PhlbyZ6wbprM2kH3R2+4tlkUcLOCdlVKog9WFDEa0arYM5tVNdXZ1xn7qXra9sJItVOEJ8nWz
	iMQsZ7OliGnmMIXw77SXZsAcd4mFG+sKbKabT8iSdhQSGESpfZb1qKAlO74QjjEO0Ueee+i7fVr
	hYlcXykg4jOLheinZoPlO9bOsJv8W6pEq5rYkaIRmx1RHEpxaWnvbfVfPLg/Htc46peka+J3Qfw
	Y0D2Uz+JxZWHfYXAxPHYftSUyemqlTCNN0tzpbHYcM1WzDDu3eA7Udr6cCkG0HaGHncPi6PVPRY
	qsLs3xDhAXI5B9MUWGKpNkoJoRWV+WAyn+61nFiNAwSjTSbV5GS+ruchir79LXHfbViBBkxjFIJ
	gqfW1SwGbdG/SEYqMKwEgOkw4=
X-Received: by 2002:a05:600c:4e56:b0:492:3e69:a86f with SMTP id 5b1f17b1804b1-493e688c7aemr1803125e9.1.1783471469103;
        Tue, 07 Jul 2026 17:44:29 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.92.41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0fc1348sm99727985e9.14.2026.07.07.17.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 17:44:28 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 08 Jul 2026 01:44:13 +0100
Subject: [PATCH v4 06/11] arm64: dts: qcom: x1e80100-t14s: Add pm8010
 camera PMIC with voltage levels for IR and RGB camera
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-x1e-camss-csi2-phy-dtsi-v4-6-572348ad1b2a@linaro.org>
References: <20260708-x1e-camss-csi2-phy-dtsi-v4-0-572348ad1b2a@linaro.org>
In-Reply-To: <20260708-x1e-camss-csi2-phy-dtsi-v4-0-572348ad1b2a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Christopher Obbard <christopher.obbard@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2938;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=mvMLAzdHB6jsqZsO+74GFyviI8Dwel3IBPxFz1BFrkk=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqTZ1dYd2B3FgAM9NfvVSJBuo3tS1Y0i+yCkhyH
 w94UBWLc/OJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCak2dXQAKCRAicTuzoY3I
 OlPcEAC8HkwCzDXWTSrhBegwY94DB1HbGGojGzbPPZtN5qV3lS+YGy4vi5uM7VAlADZBWmBVCcI
 1UYpn4bqcgr+FYBiku1mo860V7asC3vmtFlz2/X+XISdn+EeRZybZNwW5d0MnPjxRwrfceg0DZj
 fnGuLQen/Icxf4srFoK8y10r554jM8Or39HCv9htJhFdFtGFeyR4OuGb/GGHYctnOvw5l5AX6G1
 yJMLk0NLSAAS3nUKVFf3XBzCsun/v8GdJvuMx7V+T8UcBD5S0ekHt6RgIur/LgVAA0is1hpWwwE
 eWIkGSpiyJP41mVAkOz/JGcP8CL6+cHckWSXp5PBDvhtacCHgqs5nCN6SJ1YRf1QwujLRZ3TuH+
 K0uEygv2TaZdaQKfxWgLJJvlfX7nYmTy+UDNHB1P75YWtEuwlPj91YvR39l44xQXAN78+b/WYbA
 huxP43Sb0YW+WXOIA3ZQVr2m9dNOArMoVJLTbCuK7IL3GtXXaWcBROTp7zh1nRTM7d7dp4y3riB
 nnO8dP4aackD9sOVKwtPrLO1fy0xyFq1vtTFnmprAi2bGa8fUV7ecpIy4qYO94f4iLlFmQ4J2Oe
 58CP2VQeX6wcXy2CI/nOmbU6vp8eBsotmArfPkYjYWoET3TE58YGFsT7PqHmH2xF75bHhrJAjIq
 aBzzzR5asFtHqyA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117452-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:christopher.obbard@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:from_mime,linaro.org:email,linaro.org:mid,linaro.org:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8F0C7720B23

Add the PM8010 PMIC providing the following voltage rails:

vreg_l1m_r @ 1v2 IR sensor
vreg_l2m_r @ 1v2 RGB sensor
vreg_l3m_r @ 1v8 IR sensor
vreg_l4m_r @ 1v8 RGB sensor
vreg_l5m_r @ 2v8 IR sensor
vreg_l7m_r @ 2v8 RGB sensor

Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 5d49df41be02a..70e50ccf67677 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -562,6 +562,13 @@ vreg_l6b_1p8: ldo6 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
+		vreg_l7b_2p8: ldo7 {
+			regulator-name = "vreg_l7b_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
 		vreg_l8b_3p0: ldo8 {
 			regulator-name = "vreg_l8b_3p0";
 			regulator-min-microvolt = <3072000>;
@@ -805,6 +812,58 @@ vreg_l3j_0p8: ldo3 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 	};
+
+	regulators-8 {
+		compatible = "qcom,pm8010-rpmh-regulators";
+		qcom,pmic-id = "m";
+
+		vdd-l1-l2-supply = <&vreg_s5j_1p2>;
+		vdd-l3-l4-supply = <&vreg_s4c_1p8>;
+		vdd-l7-supply = <&vreg_bob1>;
+
+		vreg_l1m_1p2: ldo1 {
+			regulator-name = "vreg_l1m_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2m_1p2: ldo2 {
+			regulator-name = "vreg_l2m_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3m_1p8: ldo3 {
+			regulator-name = "vreg_l3m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4m_1p8: ldo4 {
+			regulator-name = "vreg_l4m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5m_2p8: ldo5 {
+			regulator-name = "vreg_l5m_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7m_2p8: ldo7 {
+			regulator-name = "vreg_l7m_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
 };
 
 &gpu {

-- 
2.54.0


