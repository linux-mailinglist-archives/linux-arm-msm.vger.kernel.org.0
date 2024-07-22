Return-Path: <linux-arm-msm+bounces-26756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BBE938CBA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 11:59:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 474812878A2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 09:59:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C87AE16D4C0;
	Mon, 22 Jul 2024 09:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dw/zsZSJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBB216C846;
	Mon, 22 Jul 2024 09:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721642120; cv=none; b=MN0htUQlyC3M7waVsDjDhCtHRMrnwpx0O2fsPX/r98dSHVIBFHJv2BLh3z4T2e7JERwqDwXSrVQFjytxISlwXRzsXaTNKHTlHO7BqxkZFSAwpP6ALsTvpfDFa3Kgqr4wNw+XjcwUH2/FVNqZnwkEk9DvM+/QG/Up0MxoMqtDvVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721642120; c=relaxed/simple;
	bh=R1YDhQPevrJAfMVJRTnc1q+dNK0ScEuhS/1S2gK4RBM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PRJj2B/s/CyKNIX2vZG7MH7MdItpS9BB34duG8MnBFQ79NpLUUfehz6A1c60JUfMtdDP8POHqmpRyNxi1ZaXxCT/gzfuJYkyzsitSDEO7fEehu2StjcWBJ7FNA7Pl9vNdm7h3gE/kpO1Z5mPir9zpsjQLHMqa7sOJ9VvJBxPHoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dw/zsZSJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42D92C4AF0E;
	Mon, 22 Jul 2024 09:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721642120;
	bh=R1YDhQPevrJAfMVJRTnc1q+dNK0ScEuhS/1S2gK4RBM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dw/zsZSJ7mW10iEDyOP9sHVc+T/4/mpEHR96hPkVSy7A1j8WSIxHAKcw5H+Hv3W+k
	 CTmD8FsS9N6s9d2ZbscdEx74wqEAH8oCDFC+q5EQYa8Kyp1vekQjjQDvP3RkuSBq6W
	 izNwf065RN+25lZc+OOnNC0/0gQH5wkXESKzokSVkQX4HAvLcK25HWeziwFBbhPOIX
	 LfrHq0JR36SEJoV3q5L2EgGZAhFAYqcQBSpscioESfkYRti0YxC9V3XAXW0xWb8dkB
	 fi0CCwoNgY7x7zTej4rq2qBY4bnN8vhY03J/Dn5Kx7+LS2f/q+FrknpnDbLjdRs8oa
	 F1dUhnUT3h3Xw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sVplH-0000000079K-0EnN;
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
	Johan Hovold <johan+linaro@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH 01/12] arm64: dts: qcom: x1e80100-qcp: fix PCIe4 PHY supply
Date: Mon, 22 Jul 2024 11:54:48 +0200
Message-ID: <20240722095459.27437-2-johan+linaro@kernel.org>
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

The PCIe4 PHY is powered by vreg_l3i (not vreg_l3j) on the CRD so assume
the same applies to the QCP.

Fixes: f9a9c11471da ("arm64: dts: qcom: x1e80100-qcp: Enable more support")
Cc: stable@vger.kernel.org      # 6.9
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
index e7758f172d0d..212ed20b3369 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
@@ -576,7 +576,7 @@ &pcie4 {
 };
 
 &pcie4_phy {
-	vdda-phy-supply = <&vreg_l3j_0p8>;
+	vdda-phy-supply = <&vreg_l3i_0p8>;
 	vdda-pll-supply = <&vreg_l3e_1p2>;
 
 	status = "okay";
-- 
2.44.2


