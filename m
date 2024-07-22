Return-Path: <linux-arm-msm+bounces-26757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E08938CBD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 11:59:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5F3C1C2220D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 09:59:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D097216EBE2;
	Mon, 22 Jul 2024 09:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RDYGRkQM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBED16C849;
	Mon, 22 Jul 2024 09:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721642120; cv=none; b=F0gGcMZP14x0lFU+AssRevQEr1Ant1amZMd5yysVmO15Eju5pP03AnttJN02TI/V24WBPI3pN43n/l/0LqI+49NuZfSqgWX24R4QTzHKn3zdW7vMmygbNKgnDOvjxJeHKqzJiG75oOayFGN3L8KCndmq+/zwwx2yfuJZnOFBf1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721642120; c=relaxed/simple;
	bh=XfNPKoKwFqulsmLTeDJmLTnpyfRhin3h/BnbahlTTDE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XA63MKcrk+sPAI2/k5C1yoNQWjIPgpk+3Q6zNqgY7S5Ke87sA1XrBanv5MFAMzBVTbmfCRZu63OqFERzigg/0VGG1E28HU672Pk4dAIiqk4ZJFtk4EAIHvqZ1c5g8dvkV1dqquPB6rmsRY5lYabvcDoX3DWVZDXRsVXEWMd8ppo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RDYGRkQM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31F0CC116B1;
	Mon, 22 Jul 2024 09:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721642120;
	bh=XfNPKoKwFqulsmLTeDJmLTnpyfRhin3h/BnbahlTTDE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RDYGRkQMV3gIUh3NNFaxT3iNOcys+oinCjjE8NqK/XJyFXI+IpD6eSowLfeMwl0yg
	 v8TO/pvGZfO0s+RQWnqU42THkEWNgVH3dXOEdFkiEaZwZVtDPTJvnRkXBab6PiFhKJ
	 YW8HdiGJVCI/wQP116mwwyx6KhD5ap5x2Tgmi4rcCBZt9gsa4s7Tzx77/Qu86mS/k6
	 O2cPmwWhlz6/L9P7R3cHYqT1SodX8G7lN8tcR5OKJpqfUw/32cl/mDAaV5vAOLhK6K
	 fWNTlpMloBYQy6S3dwlA2h4zLsnBulHBMRvKlyVWKnWFj1tAIcGJM6J/X/MPxzXWwn
	 z+3qDrCHbipxQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sVplH-0000000079S-1vbq;
	Mon, 22 Jul 2024 11:55:19 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Xilin Wu <wuxilin123@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 05/12] arm64: dts: qcom: x1e80100-vivobook-s15: fix PCIe4 PHY supply
Date: Mon, 22 Jul 2024 11:54:52 +0200
Message-ID: <20240722095459.27437-6-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240722095459.27437-1-johan+linaro@kernel.org>
References: <20240722095459.27437-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PCIe4 PHY is powered by vreg_l3i (not vreg_l3j) on the CRD reference
design so assume the same applies to the Asus Vivobook S15.

Fixes: d0e2f8f62dff ("arm64: dts: qcom: Add device tree for ASUS Vivobook S 15")
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
index 7fb980fcb307..f7337251349b 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
@@ -278,6 +278,13 @@ regulators-6 {
 		vdd-l3-supply = <&vreg_s1f_0p7>;
 		vdd-s1-supply = <&vph_pwr>;
 		vdd-s2-supply = <&vph_pwr>;
+
+		vreg_l3i_0p8: ldo3 {
+			regulator-name = "vreg_l3i_0p8";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
 	};
 
 	regulators-7 {
@@ -427,7 +434,7 @@ &pcie4 {
 };
 
 &pcie4_phy {
-	vdda-phy-supply = <&vreg_l3j_0p8>;
+	vdda-phy-supply = <&vreg_l3i_0p8>;
 	vdda-pll-supply = <&vreg_l3e_1p2>;
 
 	status = "okay";
-- 
2.44.2


