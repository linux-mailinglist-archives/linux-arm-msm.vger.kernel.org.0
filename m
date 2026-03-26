Return-Path: <linux-arm-msm+bounces-100088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FVAHwcNxWkI6AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 11:40:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E4421333994
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 11:40:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 83FAD3125F7C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 10:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA2753CEB8E;
	Thu, 26 Mar 2026 10:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NPiZBNEr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A313C2767
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 10:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774520838; cv=none; b=g1d4PngkAiyEaDBz00aLOZ09ZXzdkBVt3sSlg6MsDIJXVb5bl3IUbWu5D20TcO6iFwsDqXR9Noti3wCMw656srMPgfdxsJb7zFerXW/ZcrSBf2rSo6syRa3f/MQ6PjjDqYWrMMKN/bOS2IwwGHv28WCGMz8O2+xNpDDztHa/rB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774520838; c=relaxed/simple;
	bh=S6iJnHFPbJLaLr3h0qEMNZIwUOoiDKNDAFZUs4m9niM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qm1lOQWMluWPRtknhA8dzDwNdwY8SXvQ/iwlLPFOMBniU4z9bBkFmObbi8gpQAwYX2T6MgJhj2mAVNP25WuAowffX8th/vZTgX8ajc97DFmL86JYMM3DBQFtRYiwwQZAbSle95C9TS82RYdrgXO1hwIEo6LXbm5RY7uuZbEFMT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NPiZBNEr; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43b5bded412so526767f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 03:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774520836; x=1775125636; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Z6/U7PnUrwuHg9KKOxLA9kV52dFoYuRPPc7c14Ax4g=;
        b=NPiZBNErtUcqqqfPlRUmL4aWtkbEx4uKkBCism7abZRqYfKujW/Gp6TyQEJ86bUBYU
         iABYSh46VFaTDf9GG1eqBZTWZAmgJ5Ienf3fRIMpmadDVNFd9n8rpNBGyD1r/38BgJ0p
         dUuHF4/tj5Gq6fe3V3FVI/xqRUKL44tNA09JuxEUSlbAnL9PDu4ENE/URzNh92RgMcUp
         2gFqIwsTZ/nF9Vv7rysWIIgvR6mQCetR5vzrX9AGp5z1iavwREqOdXcFUNVssgY/D1Vd
         BEvN5B52aZISQgN8T+xEHPEOPhxCua41jLtsIGrdLsxJmOxeSgsYkjFRfKk4FCG1o25p
         kmsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774520836; x=1775125636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/Z6/U7PnUrwuHg9KKOxLA9kV52dFoYuRPPc7c14Ax4g=;
        b=EFytw77SzkKAojTV33CSIceJ6OQ462LB9wE0Vem+U2+tiztB5wUyrI3iHfA/QnB3xy
         48fB0O0iFlYd39qTh7ocQWB5qq7UBqYKrFuyXXUZaa2zxe2MZ4fzS/Q//HAzOXSVikqv
         lDzgqpVvx4PiWqD+m0jiQIJRoy+trlOFWhkwM4UYtmRSCFaASiHegGK/AGkNE0JbjIZR
         iIjODzjyFP7XCUzTvSAVmYNTowSZU6lHTduyUC9sySEqdjRiXjvubDHD7fNehjGLq92O
         OQ/um0Il+2YK0hY922OkeXj4QQLqSh+qbevEQ8pXRnEscfZ23VQRjcJ7gP9KmFLwCWRh
         MFaw==
X-Gm-Message-State: AOJu0YxsDoWWqg/Z9/dz2Suchx4Nmg3q/plaHnE3WI8O9x/J9PMOku2u
	1LHai/koXmovJWVM838+I9lOTFmBEDLd0IFQvIA4BC8EcjSPYDPMjcEF100K4Af8iJk=
X-Gm-Gg: ATEYQzwtECME2N4c/I4wrNiWcA9bKk9lubVLvywc5ufdOk541sfB/7/DEBsRBXSjs/2
	LaU/MhqquyMvaRiD4owteo9hm1VnuN9vMtEtk7TrDekbJ76L67WR+UcIxshjyRRzdHWwcixlrnv
	R5tpuOeFoTNY7zheg7uhwPlTgKnmn279S9N9qbvyYxUNNqm0s0raDm7v8PRV79kIG4HwQVYlSjl
	atjgq6CNR8PggXTmwo8g79VNBLRwfj/FWj59nVu/eXhJ5M9pYXIO0ztXeHWr6NZiX8lbMN9aP2g
	up25qP6rt3mYns6RBWRL2+SIIZ4Cu35keOD0FJv9AnmzKOorvsqAv8J8xMg4FPf5mqY4zIYuZSu
	WM5El/MxgIj8BpVxRWsra1uzZxqBc7i0LEu8Pg00qZRDabznJHuJH6ahrxtN8gjJUDgSkROMAju
	mmE/wmgws6ywj4LIQosTGtuafOuo7bUH101w==
X-Received: by 2002:a05:6000:2401:b0:439:b6ae:5d5f with SMTP id ffacd0b85a97d-43b88a1a8f4mr10698867f8f.36.1774520835535;
        Thu, 26 Mar 2026 03:27:15 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.111.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf2d3sm6912278f8f.19.2026.03.26.03.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 03:27:15 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Mar 2026 10:27:41 +0000
Subject: [PATCH v3 04/11] arm64: dts: qcom: x1e80100-crd: Add pm8010 CRD
 pmic,id=m regulators
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-x1e-camss-csi2-phy-dtsi-v3-4-1d5a9306116a@linaro.org>
References: <20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org>
In-Reply-To: <20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org>
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
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpxQocL7WX0ILwE4o9t5edmRHZq5yHt+ZwPbf1F
 JuyU0dS/leJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCacUKHAAKCRAicTuzoY3I
 Oiz8D/9NoDUCWE93GsBxaOElM3I8EXo2xHmu9htpkI8jFobBMr9IrnKtOZz2whY7epWMFgGCmaX
 PqvDgQnh8mT3NOA7gWNTvRegub3hZIDsxX/XA6DBEp68RzUgtdv5G8m1BvTJAYe7IwuYznICsCD
 heSWjtv9jYZG76GkFcWaI3JCynTgS8CYPeuV538jcOYZF885SD8Vz1TFEiWaHG9S0indx32mNkX
 A1rze+EhaMGrBswPhYkDDoN0gqjxinzj2xr3sPVdeKx7Rg/bOxaMdxFmB97ajQdT6iSQNnMVVJH
 IuaD+H4j6ov5EsW520r/rcxXDmfGhu8SRY0Vjb00mlB9pHPTfKV58Di/FCYs51fS/NQO1gB8O8+
 oOergWnIYSi9rnE5NRdEK9UNhJh2h2+kf+6E3l4cLrda+xYhInofLVN0exgOLA/vAb7YCQAE8P6
 7cGVqT4tRAhz52fgZ8beOOAOIeXyyDjOplIFD6MPF3y5Q5hTPGeCFtpPYztcfSoGc88WVOcol2B
 gMRuZQWFqD9OvaK9p3sebmMLABJ0IBWXkWvQpqSmCTKAUJn6Y+1K6W2ktGoJeZSogfgjpx8fJoK
 kIpDd/9PkDVNePmYnOQAYNBJsS4AspxiO55OaIAeQuTirTJfSzboDcaGadqmG4NVvtiZka6E3BK
 GemnIapUeur0Hng==
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
	TAGGED_FROM(0.00)[bounces-100088-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E4421333994
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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


