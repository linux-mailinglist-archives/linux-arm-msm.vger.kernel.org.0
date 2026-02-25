Return-Path: <linux-arm-msm+bounces-94159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KC+XJasSn2nWYwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 16:18:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E25819969C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 16:18:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EF3303087477
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 15:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 013C03ECBF9;
	Wed, 25 Feb 2026 15:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JDUmUon+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E95B3ECBD5
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 15:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772032315; cv=none; b=l8p9H880V5RhH2ZibMNNDxdqvviqlHlHK52TllrTNdcA7fKKYWrGm2uV6nDuJXINTgWo8IvDfef9++Lh0GKTrjx6yG3P0Cwpdos0gWJpBBHsLt+7groVgXG4pxk7O02LcUFmN4e1QmZgAWrZKXH0DoBYY11Hl39KlW8pV1NPy4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772032315; c=relaxed/simple;
	bh=j6sZETseMN/HjckJorIBcPNP2vyoc6UPvKGxiTKNu48=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HCzVOAit00mTd6geenp12CkFZ+HSq9Q0P3trgKHHPtozw58irf2ln4KEE6cVzx06S+MRM2ySb2hm69lnv4KT9dftK5vOYTmun+5F+dFnMwGtOAB18d/ud0B3g2f8403oDBqv2gTq24IT12PBjSPb6qZyapaMLf/0lZG8HiuzHiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JDUmUon+; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48371119eacso79742425e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 07:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772032313; x=1772637113; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q2WLVd83kJlGdeC9nXMYnekKTRyloV2jqdKhPZeFYwk=;
        b=JDUmUon+++4UcIjtyulxs0/tct/N2IreWv+XnKKe8JTibOpRRO5wDrFbXB9wuqg3QZ
         xwVnS4Qe3Jmj8GDDP88sqxQ0fvUF0cGjG4/3NdaGzsNL9eVljcFEDrmfAxpCZeXUA/6D
         ADwR/OZ5PyE0YhL3n0iIK8AncjVLH63vj5Cg0tm0aN5GTT4v4cGrnBwpM1Ttf9wHU8W0
         HtU9kDAQfgVHpH81QCV/vyEulXq9GwfdedX9jq+w3y3K3bZMyjkdksQDtv2L0BvNJHdD
         jb6oU2XdxQ3J1JYpbT8S35973S8euqPsGhZFx/BhJKmrT70H0RXV0Hi7jfu3ddFwhVaR
         z33A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772032313; x=1772637113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q2WLVd83kJlGdeC9nXMYnekKTRyloV2jqdKhPZeFYwk=;
        b=jk8oOIN1E0Ot/aYeA9x7KhlOE/c0w64qXOl+/3Qg0/h+w2Rp0tnkmAyy6u6vyUrwcb
         AFYlGmaySm5EZQ85RRnUm4wt0T4blq3LCAFok5eSZBT3EQmckBl4buZVclYblzbprs2q
         1UZfvDC/3nXke3yn6J2yo+EG3gyoA29O5tfYa4Kpt2HGDZ8yHE7lvp4jc0hUgd14033C
         9NT5dMR+7YtMeHTOeNqu7azjwwLLE0DYMIMDoxp3WN+wgmN0e6Lip3ytAJPZ+HfSmO9n
         rNscNt1cBsKnjiZ+N8+bq1/rlLtCzSsMXeiSRLpH0zlhSH1ifoRm19v/s+BQI/GXSy+B
         mPLQ==
X-Gm-Message-State: AOJu0Yze3Db/dqGBaNepaYzBfBJlOdPudztg6M9fTnoxRxFTsdck97T3
	kFeay5pzSRngpXJtQWJjKUc7DSUeumNR3O5Hqm1NtINrdd7XbepSq9vNjpG7fCixGLg=
X-Gm-Gg: ATEYQzzKt4ly9tCD/ynIOG6A1f/DffaGVR5SLRR6TCrLCyKFl9NRvsWKQQwBSxW/0g4
	kMxNexXcQ1xiwpTH6cENw9x3AcHyUzpQMyVwwKETLhmEFTNI2aHAv69G1pVL4pHbd5JTinX2S9Z
	af4c1IAHb/NIovuxQMz3t5RFKubvmwMmOwoPNpCXGKg20Fn3AH3YG7EfIRNerrK5CvLM/TbKhAX
	eZmLFQLG9xMiwy7SXJkW6dQ0MQols03FhFcdrJ+9JJtj+C/AcIAJEw8+0vgx2gq7qYlVqYhrXjm
	w6NzC60i+4pGYApKSEjp3tPFKfPDIM2e3ucCtejzYnoz9ZBhhjLiZeKWNgSGc0ApdP8M9mNWC94
	B1XbG2p91k3hVCvEU405rUMi4s0ijcxV6RT+qvHDTGYiuUIwxaV8ilw6KAzGEDTJFtnZYuyksNV
	JT5B1VkuOa/mwMtsIrxK900Y3fz2CW0nw832sw/RBePntQShKxqfwtbq0B2lg6Xctx
X-Received: by 2002:a05:600c:64ce:b0:47f:b737:5ce0 with SMTP id 5b1f17b1804b1-483a96378f0mr254970275e9.23.1772032312854;
        Wed, 25 Feb 2026 07:11:52 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfba9a5esm33950695e9.4.2026.02.25.07.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 07:11:52 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 25 Feb 2026 15:11:33 +0000
Subject: [PATCH v8 16/18] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x:
 Add pm8010 camera PMIC with voltage levels for IR and RGB camera
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-16-95517393bcb2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2241;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=j6sZETseMN/HjckJorIBcPNP2vyoc6UPvKGxiTKNu48=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpnxEcj6Z2Tptyk3dXGDm4ytGQWB3RGUhMVI6TT
 vaymiQG5GuJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaZ8RHAAKCRAicTuzoY3I
 Ojp0D/46vMLxdNq1k6N+H4nL+XPI+bC3nMN+DdJmlokpqnT277P9/FF+q6mAO50ra7IAWdNGyKi
 /WaUlDe1Hv7nlVtMAwuUvTfkLQ6/bDj2SI2ocf+1op1wN+ene4hTTZi/vNRMzeAqKHBMgo0H3uc
 7Kr1yhRq33h8A6BCPLjQY/Sev+tmG0ov4ulTajz+ecXErvHRNUMge64AR5yLYb2rtBh61oR8tEN
 OLYBkuUmNwdM8q8K/Cn2DlKYn+6ZnIUACfjwBQ2wQbT1WQPEZy1Bz42+RPLeVl19CUficqgVJ0x
 PmpnCFqozJr4uEKVyqwMlYwxZET8zAR4iBz1zDr/YHcF1ehW+IrajvIhh3/DsSZw+6WZU4wWA0r
 UWhGyhi1OKZNDoxuMSTfpuAdJLHi1MmVZuZZdwkI83KCD4OUS8WPjL93KSyPYTQf0SSocJlHabm
 A7tZJZH2v2jzSBDQ1xsIaQk+k6SgBzYY56KQ9aXO1JBSeEAvLp2yH8MZ4zQDLnEA2w0nfvo1Ju3
 HN0W76SuBZzdEPRJIkjpT/H04ATo9Iebreo8yxf2mUlZKx52l9dlCes2CfLpyrT3Qb/cFcGSoPO
 ASAt/g45FYKP5+kABKuX99yUVbjyoLG6GBRz6WdsC2yNTnui4dBAt1rHXr0AesOV8Bq72TbWCZM
 sCpA8PPdrVg5FWg==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94159-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim,linaro.org:email]
X-Rspamd-Queue-Id: 5E25819969C
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


