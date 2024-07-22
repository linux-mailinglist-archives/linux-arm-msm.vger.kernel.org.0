Return-Path: <linux-arm-msm+bounces-26746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFEA938C4A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 11:46:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 322CA2824E4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 09:46:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FD8916DC13;
	Mon, 22 Jul 2024 09:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R3glgT7k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1078016D9A5;
	Mon, 22 Jul 2024 09:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721641426; cv=none; b=d7YNnKVzd138koGHgP8ecP0I87ysLzmExm6NYfN1T3NRWBcGmuUMMR0ys1Gs2+pjtsaR2TkzZ60QxptIk35twpwLb9gBfDx/vz2LwynpNJfmPb814j/6r+pius614CdzoRjdaOM9SRyabOtJJrJBxZru+oB2vbRIbJY4ChnU3+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721641426; c=relaxed/simple;
	bh=er2Upk0dY6MDGGuVZ64aChnt3Ks9PNTgqtMxvWEr06I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PYH2GGw+9DxovShGybGkdVjugouOIJuUniHjD4Tg7oNwr+jf+P6r4ZXTHUHMU6gtHpBrns4x5lLHsPWobcYZfz8eqImrpqPFBiD3hw3oD1CsZ3BmdPWGza0rSzcqtpyKEZ3fsaRBf7LZtwlbH6XGBsmFAgp6ijiMjT9FW+w5AUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R3glgT7k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE1DCC4AF62;
	Mon, 22 Jul 2024 09:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721641425;
	bh=er2Upk0dY6MDGGuVZ64aChnt3Ks9PNTgqtMxvWEr06I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R3glgT7ky2zZua+lNoS/Wv5LbjEDECJCxGZvDHAvIn62NAkaBPTD3XIyH4FkBQddj
	 iG4QlSgL7dJ8xaO1Y1lj6ZxG/gL8D78Rv1kS9WGFlHJ/HaKRxgi7oYbZGN6aPixkAO
	 g4TcxCCTRwdodMT0rGpwo5rKiLbcTD3QkMZW2v4N3P4wkyESmVaqag01CWHQkpKyXL
	 Af7FPiRNpo3XivZRtz1fA0llpLDbeIm925T3jghMksqG0YXsw8/ZNqB8HzxmaEO81Z
	 1d6eFHIn9J3Wg1LY86AKwzfm59Pl4EJWtHSKuycTfI6BFcb6wRolIt432Dwj8Kcyim
	 uii24pHyWpi9Q==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sVpa4-000000006uQ-3G38;
	Mon, 22 Jul 2024 11:43:44 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH v2 6/8] arm64: dts: qcom: x1e80100-crd: fix missing PCIe4 gpios
Date: Mon, 22 Jul 2024 11:42:47 +0200
Message-ID: <20240722094249.26471-7-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240722094249.26471-1-johan+linaro@kernel.org>
References: <20240722094249.26471-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the missing PCIe4 perst, wake and clkreq GPIOs and pin config.

Fixes: d7e03cce0400 ("arm64: dts: qcom: x1e80100-crd: Enable more support")
Cc: stable@vger.kernel.org	# 6.9
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 29 +++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
index 7406f1ad9c55..caae0c3d8c7a 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
@@ -784,6 +784,12 @@ &mdss_dp3_phy {
 };
 
 &pcie4 {
+	perst-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
+
+	pinctrl-0 = <&pcie4_default>;
+	pinctrl-names = "default";
+
 	status = "okay";
 };
 
@@ -975,6 +981,29 @@ nvme_reg_en: nvme-reg-en-state {
 		bias-disable;
 	};
 
+	pcie4_default: pcie4-default-state {
+		clkreq-n-pins {
+			pins = "gpio147";
+			function = "pcie4_clk";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio146";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		wake-n-pins {
+			pins = "gpio148";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
 	pcie6a_default: pcie6a-default-state {
 		clkreq-n-pins {
 			pins = "gpio153";
-- 
2.44.2


