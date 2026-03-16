Return-Path: <linux-arm-msm+bounces-97767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LhlOqFZt2nwQAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 02:15:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B40293592
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 02:15:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A99E23043FB4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 01:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EDE324E016;
	Mon, 16 Mar 2026 01:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H7MfF2sM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477932459C5
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 01:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773623584; cv=none; b=gctMbVfYGWE0XjdK5raQwESijAU6YcDr7mawRCxz4vEQ8dR5FO80GK4bNBYOsyQPhJn7+7gGHiajbMy3eg7zctuUFWXpGfMxCGRiJ2xrFnZY1Dx+5kHkg7vjWhKDc+TTiOWcTATyQJX9g6IVylo+HAjgEYv/BuA1q+43DFQ+pUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773623584; c=relaxed/simple;
	bh=BLleNWxonxV9tOc0LMwQUQMx91HyaoyTOdZPoCkkiUo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ByoqxXCfp+f2NLN3XKrHp3ha8uT0v3P+E43+nKalcRyqrtVbRZ+2xBQUiW6vM2jSDVfmPZ9VoLUhqhjIm8LyAHXoSlI3FYtI4i3hIJstdIsTToZ3dSSzisSCunptlsJczmfBKbXigixLCcM/ZrMm0hdH9yY2+/wdKEpMOUT/dog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H7MfF2sM; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48534b59cf3so35490425e9.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Mar 2026 18:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773623577; x=1774228377; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qhZXtN5FXNWuWH7Q+3Ir4ViwJXN59VSLO5iJaxwXVMc=;
        b=H7MfF2sMAEM8woKeoH+/FVvDzl0Coalc1auurxNw9DITr2IoSW53tyCj+n9mRkIcg3
         KTxtvP5kwDIozEh6t4q141ZB+eKFK60xPN5z5xlnbvOjD86A1ZIbRTS0CgqmYqQ4rF4+
         dANTwm/zSa241HmxO6GOmilOgtwprx/5BjyuiNF8OS73yZtak9CAWJ/KVzLj0Rr7sMue
         +GELPdiak8/ijO11zSl/NwEcgO08gVNwkhdCmgIYtmYeyMWmr9HJH+TIdP5Wffgj1eG/
         zpKa/Dk4F8L5Lzjhpb1KcVG19Crzrr8A+2bAffyBnAxuWLweCWSZXXZIRisAZqP1fsW3
         wVWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773623577; x=1774228377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qhZXtN5FXNWuWH7Q+3Ir4ViwJXN59VSLO5iJaxwXVMc=;
        b=BjPna2gDyiJ2Hefigv5Jqm4zajsC4Cz2XIFZLErQjXMQZPa2prqd4Fp8hxc1KtptRq
         deObWKrCDD/y5GztWK4chobDT7eF9pt+fytmlSfF+HDtILAZ3F1S0o+ev3opAITJ/aJR
         zZ4l1FNLtAja6mvLPXExFlVCmn97/IORwzjRqIOOdjFkTkvXXSlsEqOiVBevSW6jOsFj
         ojyqRjl69YDjLWS+tl44v3Eb1LCsOELXRZTeZtVAAW7gE1MyD9Pc9IzIsDZ62NF53ed0
         E5XbelTeVt+9WWMY2Yfm53WXvUIXVpHxqlKXNd01+dtud/hUlJ3AhIQ/RkZaTJ7hY1P+
         7Agg==
X-Gm-Message-State: AOJu0Yyqh4cUKR6kao9wL5tN89LBRWPexkSpyqTFrHfo3KjsKREoP+QT
	dETF+RDVh3pMLCD0aqmDFQKqdhpmqh9zBtigXYyc94CjVmjzNCAnPhnVsv7UlX/m+YI=
X-Gm-Gg: ATEYQzyvfWHg9G7YBFn6gj6rK0d8i417Yp7vKMAz9lH3e6NuvFOG1/0Y6hWZfJidOXd
	QHhNHkRutcDFm5LV8JCy5KtQa4Go/lbhJsYOe+50fErzn+MTDWVBbsZr+1XYstFtKu47t2CA9rS
	1T0v+kxacYApM7ctUk3F96DJ1peGBRe4/7ud7MikaQITdEqJjhyFAcCVZjZHDlGBCkM7sU7g0cP
	My1n9iw9zDMXY1CkIdAikN5PYsqHe4vCky5kRZJ4MkhFDQtuIe+oqjI/43+R/9wobHGPPrUOAwI
	p5pXfhsyem88Kwzxnb1xTB5a3D9T5decy6pQ2ZiXFHkNyoK3nIOGgCIcIGPnOK/QyQamsHJ8KRD
	q+jy0xm1nwCLgoTUQYupdB2UxJ48RSclIAcJ8M+mckTgK0b0d8wCz3jrKDWY/lLlPGyhvtnF1GH
	a5BFI/XLp073qQOqV14WXX9D8NKtvVID8J/Wk=
X-Received: by 2002:a05:600c:8b45:b0:485:30d4:6b9e with SMTP id 5b1f17b1804b1-48556702853mr183555525e9.21.1773623576702;
        Sun, 15 Mar 2026 18:12:56 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.190.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541aba60esm560918225e9.5.2026.03.15.18.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 18:12:56 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 16 Mar 2026 01:12:48 +0000
Subject: [PATCH v2 06/11] arm64: dts: qcom: x1e80100-t14s: Add pm8010
 camera PMIC with voltage levels for IR and RGB camera
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-x1e-camss-csi2-phy-dtsi-v2-6-859f3fa55790@linaro.org>
References: <20260316-x1e-camss-csi2-phy-dtsi-v2-0-859f3fa55790@linaro.org>
In-Reply-To: <20260316-x1e-camss-csi2-phy-dtsi-v2-0-859f3fa55790@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2810;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=BLleNWxonxV9tOc0LMwQUQMx91HyaoyTOdZPoCkkiUo=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpt1kZNAUyjRd3SoPjfAtodDugVbMKtBCifPdiH
 2CM4UlnTMGJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCabdZGQAKCRAicTuzoY3I
 Oj+uD/9+lp3U1xE5Ezx+z8a3WEKuGq6JxqhMBVaJ74CwVDGRZO956jAIr/UYe1OunTeU5vbsmsL
 ip1YNRHeELffWySdooat+nA1oG5kojaU3cwflL65at6hOfQUMC3B5V43ZXaXTVpWNO6sACbWgEA
 W75ssUzATksNhVOyWeBCD1fHfdqwGGuculpXMsfIhKmhnoScdL8rcJfbAliD6YpoLZzE/y7Rogi
 kVZ/JNcTtUcZxmpKFGeWMkil6J+CkHf3Fwq/58VUEx/DM0Qr8STsiSTftvWstNObIYvf1CeHLcs
 pr9YqPcWAlLX9VE57FOkovOsez+gOu8fcAwMnUCQcCGkhJ+FpUXxZ4R+aoHy1ENCFK54CsUUrIS
 sfjy9II8+tnE05+N6nFpHn4Z+I19R3SNBSlNoQIzFrX2vDRa9FhXMjQWmDjhq0yFO3JQS3qqHA/
 VfpZQKAtjHYpIfBVMalz0sTxKkt2RrGjf/BSsY+hjx2wpWb7YWX8bwpkrWi9QppzzMHt2UpCJUN
 KY9HTC72iRUlDbeNUb1XpMYuR5K5oL4wmDmIeWtQpnfWyOasY5LhwtM8xL7vgLNcUaVEiXaSlbU
 wY9Hb2hvkCF18rmwase27MwvDee6CKRwCaHAa7Zvuligm4rVD6oI0XW93kAxKWMByxdYhe+ZAWW
 bY6YX7eob1PLHDw==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97767-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: 98B40293592
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the PM8010 PMIC providing the following voltage rails:

vreg_l1m_r @ 1v2 IR sensor
vreg_l2m_r @ 1v2 RGB sensor
vreg_l3m_r @ 1v8 IR sensor
vreg_l4m_r @ 1v8 RGB sensor
vreg_l5m_r @ 2v8 IR sensor
vreg_l7m_r @ 2v8 RGB sensor

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 4d7fd51f370b7..ee49785c9d005 100644
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
2.52.0


