Return-Path: <linux-arm-msm+bounces-26764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C106B938CD1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 11:59:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C8E21C23D75
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 09:59:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7326E16F288;
	Mon, 22 Jul 2024 09:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G0GOzn+6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE13316EC14;
	Mon, 22 Jul 2024 09:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721642121; cv=none; b=QDwdZRfHWwlfd2VEBBSIZkPCrvk2qSRDOH4ivET1htD+cJoIlASxPd69XxFDIIcoxzRrLS2dM9vSxBP8E4OE8Q/kRz/Hx/2K/W+plUgfcnIBE0LKcJHly6yVBhSvhYqcliQ7CzALhmW0OSln41P6y1mZWA+ufRFQQsjnmIpGF6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721642121; c=relaxed/simple;
	bh=jhL3VV4aeIqa6TdzXTS81c3wbQGgcq03fSMsUUA/984=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rH+OhjgECyPg8uAmlayDi13KdnhHdLikeM5E0QLD3MakwpwLEgP0ArYMtA+4/tnn5pzzUuLOd2F+JIJwooxnBfcL8tRMfKS8SBYhxjV43hkDy4B9UWOtMHAziFAH/WXOp5ml+mIOD82EiOyzENvXJSLXp1tV2AEMio3IfTP6au8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G0GOzn+6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C676FC4AF0A;
	Mon, 22 Jul 2024 09:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721642120;
	bh=jhL3VV4aeIqa6TdzXTS81c3wbQGgcq03fSMsUUA/984=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G0GOzn+6uBg+S++lTx5A7gscmvKf8ae20uQtNPETyLYodjN3rVBgvFSimv/Erl7uV
	 nDLN7/kbtrwDKpg3scrwIV6UmCkFxZrWmrMOSxYOA72VelGEieDvi/qGjr67CQq8MF
	 TeKPTR13EF9DpJll+WPbEmD+d+bkNJoXtEDzEpRI1Fa1AP+HQuYvb+I73KtwqSFILJ
	 Uf11ZaRwKme5hVMJWa1zGnkxy1k0tmEzWjRZZ8sHlufmARLeXADhkFVDYbL0NshbMT
	 9AA0iBSLhAcHE1dAPbuAeCy2u31oAZMBxFhTWxxYKqqLVrokUaZOL+nTYo5QNpONd2
	 r3YfLR/08X77g==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sVplI-0000000079o-0V5J;
	Mon, 22 Jul 2024 11:55:20 +0200
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
Subject: [PATCH 12/12] arm64: dts: qcom: x1e80100-yoga-slim7x: fix missing PCIe4 gpios
Date: Mon, 22 Jul 2024 11:54:59 +0200
Message-ID: <20240722095459.27437-13-johan+linaro@kernel.org>
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

Add the missing PCIe4 perst, wake and clkreq GPIOs and pin config.

Fixes: 45247fe17db2 ("arm64: dts: qcom: x1e80100: add Lenovo Thinkpad Yoga slim 7x devicetree")
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 .../dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index f7534623ff77..79fbc5444312 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -625,6 +625,12 @@ &mdss_dp3_phy {
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
 
@@ -782,6 +788,29 @@ nvme_reg_en: nvme-reg-en-state {
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


