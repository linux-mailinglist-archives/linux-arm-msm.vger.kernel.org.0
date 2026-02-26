Return-Path: <linux-arm-msm+bounces-94322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFLeEnJfoGmmiwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 15:57:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D09321A81CB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 15:57:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D1C1B3047FA4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 14:53:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 417383DA7D6;
	Thu, 26 Feb 2026 14:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hKGu0CKX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2503EF0A8
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 14:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772117484; cv=none; b=sIVoYqpsYr4RN2WFrodTXuqlET9c/tVDPsKf31SqgvoQ4tOvFN69Aa9pumkv9UsVfcBP9AzlOiih0D5l1txut9nTiM25S1NKQcG3uSTcld6bId+l/n8OvCG/artbk/yQEKKIaq9CUx7CWcZFQdWW/rislHu9o6HYqdXU3TboXQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772117484; c=relaxed/simple;
	bh=j6sZETseMN/HjckJorIBcPNP2vyoc6UPvKGxiTKNu48=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sjNuZxhG9Ib7bgh3lQdZXqv7lWTjLK0RMqt9/MdWVen8kadj8wCga/bL0g5KdPoMgxO7npV7344VK2kJeq7v1iKhd57ElJ5HDgmBIF57MhKpq/rAedclrow2HPh9E6Grj+N5ZQvPK8ok4oYHRu67YpfUOF18wsnZWEgbvXbAztI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hKGu0CKX; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4836f4cbe0bso9047155e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 06:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772117481; x=1772722281; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q2WLVd83kJlGdeC9nXMYnekKTRyloV2jqdKhPZeFYwk=;
        b=hKGu0CKXYYDbzFccffFfgdIprFz7NTd/R+rYrtRzs+5OQGzb63fGcFkw4d2bf10aw2
         2vklyMd7n9rn6ifKJ4f/aW1QGGZ20kCjmMezv4soLznnxZMc+hRVed1HyMlHYqnEBHYe
         X5n1XNZHXMfICnaRf7yl+YnECvTvYVkQrn0HnKQrSEPDyhcWfOJHtAOdHllDH/mYOzkz
         doXzsbCYc8kw3L4J22vgMQOLcbAsIc8L1Qq0KSoKqBdyQbJblS4zzXKVYJpcW8T3zjKq
         B5dPWHy70VVOEqYhcpwQ6irVx0kOLRITsEeU90thtwKI9OF9bHPoQHjoe6L6Fc250Wsc
         smPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772117481; x=1772722281;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q2WLVd83kJlGdeC9nXMYnekKTRyloV2jqdKhPZeFYwk=;
        b=a9nVAd4n7ZEMRYRBLO3JujhzRVH+wvJq1RwrL9vluzkQ5x9b3G7S5dPX4KoqL+xx+f
         sn5J69viAhBhiFX9+W0+8GtHlv6VbWaXokpLuJTTpOckg1LUlv/C1pw9nqzgveae4CZG
         v/XVV1tdRF6yO8i8AgtHAI2LtX5b/7MvDzzkqlpXDkfFXNG4SiEl2udTda6jMD4udrNn
         CciSUEo4n2FOyyLIFx53MZWoDCRfZDXaaFqgpG+AH+pJlvPRYkb2dp3AO1yTCUpXmK/W
         pB7HnI/8LAIq+5i1a2HKrcpK3/fDPjPhpeWHlJt7thxmW63quKwUDmbp4HCiToiVO2V1
         rQAQ==
X-Gm-Message-State: AOJu0YzLtTfgTv3zbS4lhWzXwkCaYZK74SIqlA3U68oI6G2xji6Uc/km
	fkGAlvEGNyqdHTgo3F+GP155q5EYAZeOSKCOM101DHGbeylf4hRWRdzWYaBQuBcae5Q=
X-Gm-Gg: ATEYQzxduTj9rePxmLWS37GlNQA63OcwJvTT14U/oSzmLENN9FNAQTJ+UM1ncBdVNsz
	GIHvMQ+AuQOoN5VgwNdoKwjWqs2UCEPZXEhmH0xTrnIyzxfq6xCzwxJARJDlxz2OTpIfu6ZxUrT
	XFd6EI+Y+TgCyDdvvYV0QNHCHiiapg/5uJQ2hPyFzW3kUMPg1lz0b1s4iDZcdkErIXpG08qKnn5
	JSiCDEvaZVPiWCbI8lRMePBmlDg5Sl7rzWomg633COCR0k5nKHWookkp407ICl5To3fjElEn+wn
	UL2e9eEQZpGd0KvLJHf6vUeFc7hknynBbbK6FMTwOJvNppBu82y6a5/v9uaPd3WTAzMJEu4MD+3
	Nryx+938Z3Pgv5NvReYmBMwcUP20j0M68j8Vo1jD3NVS2qFwzkBFjkiCOXibc9Rioh5xfihc14r
	gWoLqDK+MH4yfTtSJvqEOdP1Iqvmvc1moXKkE87M7C4g/cl+XFDLY1dPVquf+qhj6H
X-Received: by 2002:a05:600c:8b68:b0:483:2c98:435e with SMTP id 5b1f17b1804b1-483c3df9886mr36773205e9.34.1772117481096;
        Thu, 26 Feb 2026 06:51:21 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfcbf5fbsm36621675e9.18.2026.02.26.06.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 06:51:20 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Feb 2026 14:51:14 +0000
Subject: [PATCH 09/11] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add
 pm8010 camera PMIC with voltage levels for IR and RGB camera
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-x1e-camss-csi2-phy-dtsi-v1-9-f3f7ddfbf849@linaro.org>
References: <20260226-x1e-camss-csi2-phy-dtsi-v1-0-f3f7ddfbf849@linaro.org>
In-Reply-To: <20260226-x1e-camss-csi2-phy-dtsi-v1-0-f3f7ddfbf849@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2241;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=j6sZETseMN/HjckJorIBcPNP2vyoc6UPvKGxiTKNu48=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpoF3dwxUd68JBf799LexF/+FjIWhau5rrxoL3E
 vLqLswFyL2JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaaBd3QAKCRAicTuzoY3I
 OhILD/0VSlAW+1HDB34YK1WJjxoNF7AkR0hKsRysLcoufB1fQH2Oigb0ePIw6nuhxzlJOKN4927
 haFRQ92pGX4AGKL7WSWfM79H9b7+A9ECRdod+jknJDaxsMB3VCNNBCwMO+MpasIGa6xLpNJj9R8
 65VU+ic11xlBJkX8rpkpACKE/7tJ/9wh2iAwGCn3A9DfKvCUQDkLzpWT65xweeKl8rkEtn1zAvc
 W3EHKXsG9VkhbjOjjoGfa3CrtxBJhjN/5e7PBI/ovlKn7o0m51Efc5t/6LWR0wRwQf3w++sSoLc
 dOSlIHxcUIZ8pt3qzT21EpBq+xv0jVxwxmBHVmaYOdM2LxoZjQAgoRVnWJ1zSvy6viocF1QuwPs
 wGwAw3fQ6vdOw4xSBRSst4zlmbveKyGLz4NsoeBKRayDm6gybJYuhW79/pkHvlSu16AGXB3P2hD
 6Epn8kvgMC40t205ewf7QN2Uar96T/1A7MkN8w8mItG8a2GEtH/GOpChTcld0Pd1nsIEUlj6E38
 iKg4wJUFyaMr7cTFSuRnmb+ev08zM9VCGu4ZhU4DgnT+HH0pIvL146tOc0haDFNwwPhlP1/oYnj
 1nItb8qr4NKFqYWoDHEtaVyI+45j3V6ug/xtnKJouPx/6L4rkvsfPYaMFjksquCCPrqH1c4ZCLX
 APLfM/FKK2aMIQA==
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
	TAGGED_FROM(0.00)[bounces-94322-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: D09321A81CB
X-Rspamd-Action: no action

Add voltage regulators-8 for Camera on slim7x including:

- vreg_l7m_2p8
- vreg_l2m_1p2
- vreg_l4m_1p8

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index d6472e5a3f9fa..f10dff1da7f8e 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -795,6 +795,57 @@ vreg_l3j_0p8: ldo3 {
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
 };
 
 &gpu {

-- 
2.52.0


