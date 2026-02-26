Return-Path: <linux-arm-msm+bounces-94323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLqpH3xfoGmmiwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 15:58:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A20F1A81D3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 15:58:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BBF443054AF1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 14:53:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69AB23D905B;
	Thu, 26 Feb 2026 14:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wyjZE/0+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317743EDAA3
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 14:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772117485; cv=none; b=LKyBLBHFnVqMfYBiRDlHfsNIxZ+TfEN1ytwnG4XRj4E1kC4bwJmPy1pCdJKVrlX0+8Iq4T90yp8ehPm+MXgW3wMjTQMwRB1d9ejWsPQ/PG8RmQkGpqYtTzu4VUPcYIMUcF0jNYEA/7tlGH8SSKB4QfrnpIxxMnYhOx1E4TUzYgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772117485; c=relaxed/simple;
	bh=BLleNWxonxV9tOc0LMwQUQMx91HyaoyTOdZPoCkkiUo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cQ4+ctueQyrCNi4jLj6ecAqYV2AZlLL3UqdnkpbEmsR13zUWmGxyRARKYgvPyQsElvrr36GyYunw5hyoHOZaJv73vWy5QTmG2DvywcZpEwxvCZfBFIImaaD5P3dY++jyl+xUbc77Z+PiuoO1gvX2lClXp+h7wiLT8TJXu+F64S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wyjZE/0+; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48375f1defeso7120625e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 06:51:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772117479; x=1772722279; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qhZXtN5FXNWuWH7Q+3Ir4ViwJXN59VSLO5iJaxwXVMc=;
        b=wyjZE/0+HJND2ftR2uXsR+eed5p9zlEFusxVWcUGEPMuA2xTgSPql0gowHQe0027zd
         z/h9bWSJnQtZc2gFtoLwGbt5WoYlHtz8ak+tbnNp+gBzGP8fwZY5YveZDDQP3eUF6749
         7wQQJY7cwdA9px1Rx05hcoWZp8K0V+dHcvQYYCudOwUJp55a/R8wKt1iDREXE5JM3/Kx
         GIUsh7u6+38HnqzBydYhMSnW09mPb1e5bQwY7KgfqWUnpNTq6QV9PxKfBMjpRz+1+60P
         os8Ek/faA2BuEHw3dwMQggoUI0cGMTQI5J4H6vccELF3NKA2+dQizm/MDAFemj/utfrS
         gYng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772117479; x=1772722279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qhZXtN5FXNWuWH7Q+3Ir4ViwJXN59VSLO5iJaxwXVMc=;
        b=hwbiAXu9JhDydqYpaUsDNXBy/+Y00Lu743fR+xh2om/6OkaDtYFnsaZu33e4ZGtifA
         7GLYFPUnjyaUdDB++nT8F8aX90Mjiaex1qZyw6PDCXsdagYAfhMGrCcNiBjkDCIR8SvA
         QangbzZ/pEFTCtAOyWrT55NilRQJkvy/TEWvT3OyRuH9WM/fSbqyi1RESNvfrqTH4W2z
         aTYj18EZPRj7CQovmAACEJ+a7yGP9pInkHqe6abw00zlpiZ6xzPFunJ7MjKwU0v6wMXw
         mUsc/aQm6FIV1fwPrKhZ5eniMuYCiCs53K2FZHisaqJBWCJbbzfxLopSHd6n61+LmM2t
         vSfQ==
X-Gm-Message-State: AOJu0YzyczmxM4UTip07I9Y0TFDN1jOFNDvipa6QQBTDJOFahAWc0za5
	4zQOpGCTUymPG/ObG0Jw6cz698W58PvwvBODLyWb3hDfBGHw3ZUNIB5aEmthfTEc7WY=
X-Gm-Gg: ATEYQzwLy71FSbUckEA6+n8GaIfcdT/ocv8w/UQwIiNlQqYzuToNjlD5oEGSzmtQcvk
	jd4oaJ9WsBSDyal6Vph5p7lu3UCehrJwnQTFCegIyYwTJ6l4qnNcUMLqnFt+ndpkNHTp2OeWABP
	dQPnlbPhuj4W/BoGMRUPInQxpKj5ZhBcbUyVMPiX9n+MZ7H1j9cV0g1jsbRIz8cHEN1DDC8kRpS
	LKSqJiHi70F+zDoWiBKAl+3r1hgxy6mxq1rh23j+FivscvOyXw4ZbPaZ/Md/MsaUXl12Ku94Pmv
	mdUUb976jw36vIsHpv89q17b9HPUGOT3IVvXeSNhgPnhTLkHz0s/Rma0K26B7cpj9UAxXlxZ2JO
	AbdQoaT4Ki5R/tqK3Hjx9HGZRxrcFVpS/bcKwklsUSZfNaZEHRGiH1AxjRsoiNSpgsUVRvsVbgK
	dSdlgvDGgQAP5Bbd+Ds+hPojyUjorAj/iRA3AzZcKqZQqgICAFcagjoK+zixqgG+2I
X-Received: by 2002:a05:600c:3b14:b0:483:c35d:3662 with SMTP id 5b1f17b1804b1-483c3dd6fc6mr42885895e9.18.1772117478582;
        Thu, 26 Feb 2026 06:51:18 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfcbf5fbsm36621675e9.18.2026.02.26.06.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 06:51:17 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Feb 2026 14:51:12 +0000
Subject: [PATCH 07/11] arm64: dts: qcom: x1e80100-t14s: Add pm8010 camera
 PMIC with voltage levels for IR and RGB camera
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-x1e-camss-csi2-phy-dtsi-v1-7-f3f7ddfbf849@linaro.org>
References: <20260226-x1e-camss-csi2-phy-dtsi-v1-0-f3f7ddfbf849@linaro.org>
In-Reply-To: <20260226-x1e-camss-csi2-phy-dtsi-v1-0-f3f7ddfbf849@linaro.org>
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
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpoF3dXFccD5CEJjuX5Bgap0ZhKcAe+ZXgBv/+S
 c5TWsNqvLGJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaaBd3QAKCRAicTuzoY3I
 OrP9D/9eL80ReX1e+pf250OZvosAQauVqMwTTYqfJh7YS8Vcn09YW6HCmM1JGMTrn9eyVxBvtwM
 nG6hvnrFPnysIdZ4P4toHfqEILemYUs7DWxg0/H9XmHHf+c4LkXTQbiBfTuBWuSmPyMGxGx4WJF
 CD33ZicoFoLD/PsEAZfvyElKx+lqC/QJ045MkfJDXdiiwkX97wLsXJXm93r+Q/zqVBuX7d/QYSs
 sqZwFGwEZW4LBzRZcKVGpNo7RUGF9DFwMfGLG0hvcHtQeuJfZMvibvKWu3JMjhojVDInkZbH5n2
 f8dgyFuX4PA/2TR7son2xCZMPb0bbzf2awXRF5il2a1fDzfbw6kc8fHVNFoT8kJNhYVlD7i75Dp
 m+mvHHjo91487rHKXKZYxCwEhUOa1lVI8B8L/+jaoWl38CISmWWN2sBSa8PH1eFdNlsyPPWKPnq
 5zBsvlvI0WBWqiwJ1c1nK14XbASaLwXf6Zt60q2Lr71LQdf4r1eIf3yLvhUtRpEtsth81AIkbF1
 769SxQTWlALuII9lJZ450pz77YRNLSq6UUJ6kLaUFYHGI87njpwOfsnQE1lmxIHDWvoVH4mi1y+
 pd6jVgFRaw+l7KFA3ukPGYrUklcAQ3oLlyiCCarzKyExx44YPueGrYotOF/cN2o9EoKyY6WpcOn
 rqj03/eZA+4uTaQ==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94323-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim,linaro.org:email]
X-Rspamd-Queue-Id: 6A20F1A81D3
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


