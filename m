Return-Path: <linux-arm-msm+bounces-94318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBZUClxhoGkRjAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 16:06:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BD11A8396
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 16:06:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E9D7731BCD36
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 14:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F38C3E9F93;
	Thu, 26 Feb 2026 14:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hlhdioX0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A2E3ECBF6
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 14:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772117479; cv=none; b=ii4MnufhlbVCe+K2u0amch6Pte3svD6RwRnlXdjpzOXZEYIIjCVRyHQUQP3JJJ3jY7bc2BUApAOh/nKzqeGh7PBDz2U/SmqTPSX8uGE6UQjEunK/dFBdOAmcQpTlCeHHiBWj1iyexm8yqEkinEhW42LUUl/mRfii0H3BeCtnqEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772117479; c=relaxed/simple;
	bh=S6iJnHFPbJLaLr3h0qEMNZIwUOoiDKNDAFZUs4m9niM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QJqFohtIjKhlsDnNG0RX5NqsA9w37l0cqZ+lzR9T5/D9mM7vgyQTUgN/6pPyzGzOwT26j08iPX1PyScs0HsVF8v82tEMUDx0ZRYgHx8aqlUVeX+0RcqluqLKEtiIG7l34YIeHyCetfShPzBzXXQa2+9ihaSMCsBUk46YpyMo3tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hlhdioX0; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48372efa020so8177415e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 06:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772117476; x=1772722276; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Z6/U7PnUrwuHg9KKOxLA9kV52dFoYuRPPc7c14Ax4g=;
        b=hlhdioX04JEjM/22/nX1MKP48+EbIWMw0f9oag4B8Xrsh+usEfteSIfSNy0EgFNYPf
         JeeyZmrvzPxyYS3pyWo7x16Ap1WtI/kIE8Xxe/mJZWZv96MfYB/Or3IXNDn7q34Hzead
         q7iQ6rVKias9nVK7rfolV5MAiWRv86oWF6Bg7tSY5kpbTr6/e6GxWtQnFy2RHxkm2Pe0
         1sJ9WMk08NKM3RGQVO1zfX3tgE+wwGdpwCdNh9ihr9UdsLm+ZKwZrcqKXKeI0YqhY+8Q
         HtOZT+YYRrNVd1qnQmzzhYbjEPsR5pQYuBe+fVN39muVZwpZI8AfMCOwaMNSCVFJEtY9
         byiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772117476; x=1772722276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/Z6/U7PnUrwuHg9KKOxLA9kV52dFoYuRPPc7c14Ax4g=;
        b=OYdILR+k+Fy7hMoW42/iyLc6NFiZ3/AFIaUEXcHzTvKCwgBJHCiHgEbDmMdziZBG7s
         P0XbT74oZ2Bh92yu0WXSP+6qlX8Hb3KFxw34BpkXs11hI569QJZIn10Lnh9o8ji1ww3D
         Q9LIK/z7J14npBa1wZQMr49GiRGp5RMcKjtJAEIjAnCjaAIH6znPpHLYjpLgHIetrpqL
         1FxuHcB1It38ft6mpU8NrzBHB0/h/3YJbFTdIeSWv3vPBuZZYhBa2cnsepcokMlLXRhw
         jGisKyV7SJLotYb8kd7BFUY6xfhE1OQIl/CXste9BzFGmSmXJVdubEcjyPqZp1QCYHbj
         J38Q==
X-Gm-Message-State: AOJu0YyJn8gmchqO5bP7mpgp5ORrdgBAeqEBaP7ty+Yrn9u9/Tji2UmA
	aDScPhPzE69MAH56YWmyKzN/TG3ft5eQuRSweyXJf8u0OExTdngaf5Bd00mPhuu0XJo=
X-Gm-Gg: ATEYQzwm0V75IqyiA/QvcqsZ5PTJ0RfWrllWWLCLWFrlmnaR5qw/pwyyGKYdxAKHmFc
	a/VbBs3E6SO6JUkPHqBhUaaqJJOQbUY4/d0NNyf9LLk7lNtpx+LOK360t1LsyEGBOVOG6x3uApa
	8h5YnbysaAJqgz3K0pUkuK+f5gVbZ9m49kPQx++O6pEgZLGdSlL08w+o1NzRbEjtQuzGAtr0o0Z
	ODplqSdllayd9vaElAFdPF0VhDRfOpbB9qLqe3cBTFT00eGg/hgCKdy+0GQNQxVjmhy7CqpoorY
	UQo/awZCFfsXEgS4PUrtlgDOiuzWdZYXsM9a4g6HcYxhWvUK61VgoY7VARpIqfzpWSS9HS7Yctv
	QBU9v36V4kJoN12s2F5aCC2+toOvRCVxzVwsq6sts+CZSwPQCK98KVPj7d6dfxWjXbtEQkiFgHk
	5qNkWnKUwDdpa0owKU0ZPAx2GaIYvij+mHbFvuRvKZQnIif39Pnd+d+iHMGAiqipDb
X-Received: by 2002:a05:600d:8446:20b0:483:702d:2df with SMTP id 5b1f17b1804b1-483c252de2bmr44083875e9.32.1772117476034;
        Thu, 26 Feb 2026 06:51:16 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfcbf5fbsm36621675e9.18.2026.02.26.06.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 06:51:15 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Feb 2026 14:51:10 +0000
Subject: [PATCH 05/11] arm64: dts: qcom: x1e80100-crd: Add pm8010 CRD
 pmic,id=m regulators
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-x1e-camss-csi2-phy-dtsi-v1-5-f3f7ddfbf849@linaro.org>
References: <20260226-x1e-camss-csi2-phy-dtsi-v1-0-f3f7ddfbf849@linaro.org>
In-Reply-To: <20260226-x1e-camss-csi2-phy-dtsi-v1-0-f3f7ddfbf849@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1548;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=S6iJnHFPbJLaLr3h0qEMNZIwUOoiDKNDAFZUs4m9niM=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpoF3c+PDr0SoK01n7jjSy21sn/LgU7HVEzUTlC
 VS9HtjfpvOJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaaBd3AAKCRAicTuzoY3I
 OqRxEACvCok/I/0c8/OwmjRrgAJJdzjIO++NS6hTzaCN6a+6+DdoH8Fv87NYZJcudvSsvLBolRZ
 UDapaN9QL5vswne+BYB6MxVR7lXgZ3QtDbNqxYJIAIUFxkaQ5B0hI525QcEnQgo194ZXfyuhpvL
 tv48TQ9N9UaNqPVVV1MHKhbCxl4ZRNzs4e1euIuJI2kuz1yD5EQaSNhXsJ0VDZ/G+XQf9+9cEPU
 MVDmuTMAAErtvE67X8QWKMJq/8IdZsmK4ZtLf7nYeyuvbxQPkesHVtsrSRR6+8Go4vtQKuWDFBN
 W/gD9ANHJyG0/zedlxArmhRhbnLQZIZuAFUTXZBvRlFKo/VjYaeWNJgRT7+biWJWe6InAgnTZtV
 YQRNPXebYS9pneD7OZLjgwodGT30e8qIg/SByORi5sKuLC6rRZ8oilXg18k/bsdcGK6IJ8aObLW
 OmCLSC9mBI9tpPuQw/5i0l1kAqnwJcd6wjaMa0qzVgINK5KlGpLF+ZDvcyfcE7ItaTFSnOmNKm0
 MWqKg9aUsOcTUYxZG8BKK8lR59R6E/LigC9uZ2TFihS+M6UDlJSWBF1OAOa6dVtOkx28iDmTTd6
 Pv/JF6lsLFGuAdOfcMgbFBcyu2MG2sNH7o86GP0NYLw2OPG5CLowzZ6CQ+BWW8XfLTc2f5QBgB6
 P36V+H32Q80fMmA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94318-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C3BD11A8396
X-Rspamd-Action: no action

Add pmic,id = m rpmh to regulator definitions. This regulator set provides
vreg_l3m_1p8 the regulator for the ov08x40 RGB sensor on the CRD.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index ded96fb43489b..c89f5ad0aed56 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -865,6 +865,36 @@ vreg_l3j_0p8: ldo3 {
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
+		vreg_l3m_1p8: ldo3 {
+			regulator-name = "vreg_l3m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1808000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4m_1p8: ldo4 {
+			regulator-name = "vreg_l4m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1808000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7m_2p9: ldo7 {
+			regulator-name = "vreg_l7m_2p9";
+			regulator-min-microvolt = <2912000>;
+			regulator-max-microvolt = <2912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
 };
 
 &gpu {

-- 
2.52.0


