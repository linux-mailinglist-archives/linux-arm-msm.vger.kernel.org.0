Return-Path: <linux-arm-msm+bounces-49027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0315DA4088C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Feb 2025 14:01:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D610C424714
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Feb 2025 13:01:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71C1A20B209;
	Sat, 22 Feb 2025 13:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="QKkJKmIM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F556A009;
	Sat, 22 Feb 2025 13:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740229275; cv=none; b=fZiMiB3pZ35dToZ70VUzCFpGuzjR24eWh8SnnvnedtZsOYi0eZqRIzBAzpZlqhElZxcX1ZBRfJ/fwLBQmcS8qFB2TnGp3MFXTGQnizpB1hodWN4KeRmtjzu3+1P5+NUvhOJ8cjTJ7VMRWwonza90KrZhjr0bduDqbIbRA6LdpfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740229275; c=relaxed/simple;
	bh=2LdIXCUaJBQlMB8zwsYYzvORxnVXkneFg7SImqCZ/vs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WDU/EaCWJP8tR99SN6Tg4O38Ov15oXLmX/lOHkr/qo/VrSOPWxzbsi2e7iNGumFDIgB8/VeOFyhbGF0TqaoDEao09H7NFPM9CZxqkZUiu5TEO9JtW67FW8Z/ZTCZ3kejz4QwGREuQREX3/6RqDbA+xx2fkkbYHyISfofJTVVR1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=QKkJKmIM; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1740229265; bh=2LdIXCUaJBQlMB8zwsYYzvORxnVXkneFg7SImqCZ/vs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=QKkJKmIMsV0vuxCqOMqwutWugX3/6UKn0WCTGmn1hUMZ+mbCcGhilXWCFW52dquGH
	 znQyNE9RX3g23Fjgx+OH6A+rTHfbrYh3QUzcPzmEBgtDDn68DF/8ab69HTq1m7s5EP
	 xb4jb9nDc4qwyfkYVyoMp3LbXibegyWVjat4a8a4=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Sat, 22 Feb 2025 14:00:48 +0100
Subject: [PATCH 2/4] arm64: dts: qcom: sdm632-fairphone-fp3: Add newlines
 between regulator nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250222-fp3-remoteprocs-firmware-v1-2-237ed21c334a@lucaweiss.eu>
References: <20250222-fp3-remoteprocs-firmware-v1-0-237ed21c334a@lucaweiss.eu>
In-Reply-To: <20250222-fp3-remoteprocs-firmware-v1-0-237ed21c334a@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2910; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=2LdIXCUaJBQlMB8zwsYYzvORxnVXkneFg7SImqCZ/vs=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBnucqNLNrx3SAeieR3y7rKm8cd1eHlZTOWdiyNL
 GjnYD8xUDeJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ7nKjQAKCRBy2EO4nU3X
 VjmNEADUXoqzW2PUKM99AGp7Ter+Ciyr9kOH6Qlj1cF3kt6F2cV3TZHrtfWm575TiVa9MbrnlZl
 qAhOacwHCnB7PLTe91pPww8/00Y6uSNsOfVwRO4roFiZZJw1l0lCTHlX68aBs5so4r+1atkQHtd
 e+fLvgjO4p2FhP6GxSgkwlrn7NlVu0iflxCuF72MhRQCIbh9IpWD/xXnLVpcHRTPNIpQhPtUlod
 9TYqIl29YUlpgoVA158ROfI0iBjdCHU91ed+BVqiN/x/frM8FM6FQLGCWWhFfiectOsC678EDFV
 Ri6w798vVIhfWy468mIPzRLtM3MavhhQ+I4JwViJ1hiLQ1aaK/R0FKBFx0Ot628x6QyPcAiw2pc
 Gw+YF31XX7ZjwVPADOCEwe8IYJVm3QiIarAeA/WFgCBBMeWyHqJ0Y6Nhz5+M+1015IVhBE0Sckj
 X5YrfCdLg7UWfVWLCGCJQgz7Tl45Uvdk6zmW0Y/o8O6Qfxl9miRYjdw+LCzCoH1GwvUhOkhDAUj
 ajxToiVTTGeTZko3e8CK7uCGR4A1KLpICZhS9QoBfSVhTeWORlLSnATIlP4AxM/hyYwzsjYmr96
 AoX4iDXwdGme0m+UI+WoS6keimwAx3SaVed/7XQTW5MEIViEzxfcfip4DP5gdddG9uv/GtJKeZ6
 jkVlB39nVUWmSKw==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

As is common style nowadays, make sure there's an empty line between
regulator subnodes.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts b/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
index 957288853da2b857af77d9f5fd4de94900ee9b5f..08ffe77d762c3a97f470efbfb5064282fe2090da 100644
--- a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
+++ b/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
@@ -178,10 +178,12 @@ pm8953_s3: s3 {
 			regulator-min-microvolt = <984000>;
 			regulator-max-microvolt = <1240000>;
 		};
+
 		pm8953_s4: s4 {
 			regulator-min-microvolt = <1036000>;
 			regulator-max-microvolt = <2040000>;
 		};
+
 		pm8953_s5: s5 {
 			regulator-min-microvolt = <1036000>;
 			regulator-max-microvolt = <2040000>;
@@ -191,66 +193,82 @@ pm8953_l1: l1 {
 			regulator-min-microvolt = <975000>;
 			regulator-max-microvolt = <1050000>;
 		};
+
 		pm8953_l2: l2 {
 			regulator-min-microvolt = <975000>;
 			regulator-max-microvolt = <1175000>;
 		};
+
 		pm8953_l3: l3 {
 			regulator-min-microvolt = <925000>;
 			regulator-max-microvolt = <925000>;
 		};
+
 		pm8953_l5: l5 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 		};
+
 		pm8953_l6: l6 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 		};
+
 		pm8953_l7: l7 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1900000>;
 		};
+
 		pm8953_l8: l8 {
 			regulator-min-microvolt = <2900000>;
 			regulator-max-microvolt = <2900000>;
 		};
+
 		pm8953_l9: l9 {
 			regulator-min-microvolt = <3000000>;
 			regulator-max-microvolt = <3300000>;
 		};
+
 		pm8953_l10: l10 {
 			regulator-min-microvolt = <2800000>;
 			regulator-max-microvolt = <3000000>;
 		};
+
 		pm8953_l11: l11 {
 			regulator-min-microvolt = <2950000>;
 			regulator-max-microvolt = <2950000>;
 		};
+
 		pm8953_l12: l12 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <2950000>;
 		};
+
 		pm8953_l13: l13 {
 			regulator-min-microvolt = <3125000>;
 			regulator-max-microvolt = <3125000>;
 		};
+
 		pm8953_l16: l16 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 		};
+
 		pm8953_l17: l17 {
 			regulator-min-microvolt = <2850000>;
 			regulator-max-microvolt = <2850000>;
 		};
+
 		pm8953_l19: l19 {
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1350000>;
 		};
+
 		pm8953_l22: l22 {
 			regulator-min-microvolt = <2800000>;
 			regulator-max-microvolt = <2800000>;
 		};
+
 		pm8953_l23: l23 {
 			regulator-min-microvolt = <975000>;
 			regulator-max-microvolt = <1225000>;

-- 
2.48.1


