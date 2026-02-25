Return-Path: <linux-arm-msm+bounces-94158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBqiIsESn2nWYwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 16:18:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EEF1996B9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 16:18:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9B3C33087B0C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 15:13:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04EF53ECBC5;
	Wed, 25 Feb 2026 15:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FNMmFbA8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A47B3E9F6F
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 15:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772032312; cv=none; b=GYahoqlNMUD8Mh8Vxi644s+SrozOaJ9vRGJfkmyf0vdHpYQsP92HqmkG8Ne3FIcAnDAmNRMqrvY6CCCWGJKze3ti4nK5GiY3JDL0t+4gD0P+o48sxqXJGK1BD25rMe/XK/n8qgW4NFEv6OE/iKQ1Sv8Q6tBLAYrgFiDtoh0mGfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772032312; c=relaxed/simple;
	bh=BLleNWxonxV9tOc0LMwQUQMx91HyaoyTOdZPoCkkiUo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LVYDNrjKOiBi3MTXQWWCKcVIgiN+Al3d0Za272JwjbT52Bbhg3mb8KN7wcwDrix0VhWbo2S7H5Ewl8Sr9FsIjYlh59UT+CH136AwuSaSFJPhBNWokrITMV+xFiLAP6Qcc+Rm3v67LIZtgNj59auS13l2CIo0s2lelENIA45E8uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FNMmFbA8; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-483bd7354efso15243775e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 07:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772032309; x=1772637109; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qhZXtN5FXNWuWH7Q+3Ir4ViwJXN59VSLO5iJaxwXVMc=;
        b=FNMmFbA8J+aa8BXYxyPyC4DGsCg7f7AnjRpqdnLLGZUbb2BT70/88ET4iHTa/o3bCs
         fUylwvWUBfryOrXtKDoswQafDtrkk3xLSpdB2Wlihuww5ZWpfF0+honvGluGAJ27qLF2
         tlRU99nrlAdcxadaIQqUMRzj761dvArqD4jSToklrWkMrFz/UY0Yd0Rm0WZJpNUCDlV5
         cDFHg3W2Or3dv3uVAXqVO2Jpvm1rzFnjo0vDYZb6HPxJxqN5cnPDhyNVmHkRJk6N8fSZ
         FJnVnpxD+301GzBlXhmSBY1HSWWLsj78bUubmHMTtvlF2xg8IVkqv3Rh9VqYUJHBu4EE
         aqWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772032309; x=1772637109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qhZXtN5FXNWuWH7Q+3Ir4ViwJXN59VSLO5iJaxwXVMc=;
        b=KQdrAKOrdwE4rPCAyqG5RGb5Q+A7ztkdp6XTgKJllrIF/2okKMcGcmb8/mzJUIF9Pf
         MfW4NGYE2nMqZGBAEkWo7xqioTO2awwHoC6fW1pcqK/xfm0ieYk2n6aT/YBJhTI0V+j+
         MbpOvimWcMvPGx0YO8e7LEfEes61zokL04N4VcKDHytinhfEirF7ua9//JLXoK4ee1Zy
         Ij1IxQVi6x70daTIDcizFHmeeJKexPOGBeYeo+dAHv/twMAz+COA33q2uZzyDAROczIZ
         Q38Q+NoYMTl6vO6AWs1i+7FcD+E1b7VVe9Sy1VNkyh5OdAIZzRO8LTWYaCm477LSlOeC
         u3Sg==
X-Gm-Message-State: AOJu0YwiNTYUs5yJdtrfxbPbE8Wt+saTsb8IjpQzAwtXp2fnK7ssh7Vq
	L+hHA8DqTx8SGmYmYAstEl3b9wBr14ZtBEKSoU9NfodQ1J2RtJiR4D76fPtKeWx+CaM=
X-Gm-Gg: ATEYQzw8GI44SH9jqbHdwUycMylPn5a7bFqjzChLHBDSSDeN5GCvYurdgwPDlefyFMw
	OhjZaH5rz0XwOSoE7oD9JeP6i1zqMgSZlSkDmJbPpmC1A7IMOz4cyYgX5WAnwuI5XDM5+snwryG
	yR10rjZhVHp8bIXgaIC3vzinJ5kOwZe+jjsUPZRdgmuj+E2/UxqaGKBClbVHyvWad1R3mJQqs+X
	jKHr8YSsGcM3XK6MxJrcHYdZqcZmnOOx8g7J1872TZi98eHqnPCGnOH+RDW7LsUFmmSmSQ81Cs4
	jksR3ztX2Lei3VtUnkTwV+P7PoII6vGp+pGtcZRm94zhMN+OfRBq7Upapq8vvO0WLwAU00q8VbB
	oxihDTZyQk21fJDnE1H29oYTt6gxWz+I1T//N9TvPTXTYkeH+FHp6Phmj6xGW/n6Uq1MAJbA+Vn
	pSyFrtjK9UksSIXYJVpNVf1kElL3QLljwSAxV0JGPx8MM9bKPn6jqNZkoO6oAEcyDmnRNuherd7
	aQ=
X-Received: by 2002:a05:600c:8b11:b0:483:6d42:25c6 with SMTP id 5b1f17b1804b1-483c21a105fmr14251445e9.23.1772032309482;
        Wed, 25 Feb 2026 07:11:49 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfba9a5esm33950695e9.4.2026.02.25.07.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 07:11:48 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 25 Feb 2026 15:11:31 +0000
Subject: [PATCH v8 14/18] arm64: dts: qcom: x1e80100-t14s: Add pm8010
 camera PMIC with voltage levels for IR and RGB camera
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-14-95517393bcb2@linaro.org>
References: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
In-Reply-To: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2810;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=BLleNWxonxV9tOc0LMwQUQMx91HyaoyTOdZPoCkkiUo=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpnxEbypSY7gQZZrQMbqcWn8NesQ70gzgmL6Cyd
 Gb3AnBBqliJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaZ8RGwAKCRAicTuzoY3I
 OlA/D/wPqQ2ruTl9hmNW5HP+yVRYKk5lORR5HSS3jlYHHPr3hklIFEpx1kD1wc2JXv+F+YW8nQJ
 gXvNk66N/U6wGWvHx3JL4upH3aqrkg1r4vissfTWqLxIur0Vx+7u+He+GktNpKAbjOkMwg52lR0
 NSCORdIDYBI2WN6tnBjE3/mYRigIbNJ0ZUR8l158vdW2MNq7Muz1/OK+GEC7yvdodNT6A1zY8E7
 gjh0lkSy7iJzO+kZ3ZLt6y0vZxj/oQBx08bKg76zw94J+diV7/EbvWfFA4AxetI1Mk6J6X6CFr9
 1snuyw173QBRlUL1ivZu/xFOiuQqJzzLozniOQH8alv2OHslMftGxyuolikOFp7mB4xbOF3JKbk
 P2AO7JK7BQSACYamfWO88dtEvhdOGQPEZT59fvkxLtgyBQo8iAVBzSKPIJ3W8dJkbEIxp2WhVdr
 cgYpmcFjJEhYaCQ0MH9lwSdupHVDgPTU+1StMcPfYHN82cPmdetOPrB4FMTdq/RcfQiZvigEkpk
 lOo3B5/zSUd44gvU62ePZ3Zg0P1AbaUgkeBMjMI3FACzJyU0PINN6JvE7vUnRgfjKNtsyX60Nur
 tFYJsfNZV3Jnbc9s3pHVzEZyvgztuMUTWh+S47CsbUgJgyeha2jlfdMF5S7NtnovH7ZppYibS65
 F8NCKKrwnv3uuUw==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94158-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim,linaro.org:email]
X-Rspamd-Queue-Id: C0EEF1996B9
X-Rspamd-Action: no action

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


