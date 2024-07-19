Return-Path: <linux-arm-msm+bounces-26632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB92093784A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 15:18:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC8961C216E5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 13:18:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDCDF14535A;
	Fri, 19 Jul 2024 13:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mH86T5at"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E54213F458;
	Fri, 19 Jul 2024 13:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721395049; cv=none; b=IfpUPphheSKmvOFZFNZLIwymlKbPzfJQ6WDuNPfx2cbBn1AoFsdY/oqTdivv27qCy5SfLJIW+tF9ysptq5PPT6R60A5lxC2nIqNxJeUroolpuwholiyWlJn5ggtby6DK5jZIkOPkCYvshgVMf/r4trGjWflBcgTwyjzchfc0t9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721395049; c=relaxed/simple;
	bh=0uzVyxrhof8AS7od0ldhgHmxH15tqtHgH1PplGp3Hn4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X4TGP7HAs4v3dIyt0Hh60jGM6KZ5yIosuBrvE5fpRXGNBFDF6QvdX3MNUsK+JxySgbJKDMYHydd5Jto+A7XFvmcnViiMHtuPwhp9Q+G8FAtzjooNv1A8vRMGO/ozrcbp2N0FpRQRDVqzWVsF+TpnmypN9hA752QxyLz+rCj6upQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mH86T5at; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D63FCC4AF0F;
	Fri, 19 Jul 2024 13:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721395048;
	bh=0uzVyxrhof8AS7od0ldhgHmxH15tqtHgH1PplGp3Hn4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mH86T5atwjuUVwYxkQSC/ljKH+cKpml7YUP0dtLcYaEJfDaIm8EubyYClx7ns0rAV
	 gurf48Lz6wSmCsKab2K8JePeFVSlegdEootBUEFSsQSuGHz6gGjSI+4NwnpfW11D7h
	 tDb31Ol7RWk3GZVQc61LlNlCHoN/OUC4qnUXDD4KfcxYHn1HpFUWsc5sX+xEE5RYIJ
	 bUwQUEdlW8T1Be4u1S8Rp0MDNFMKvguckDjXBx4ZfKq+ahyPi91XbBkm/++FyFU4e8
	 600x4EQ28vn0K6v99qtJ65ZBXaSOuOS8RtFJwTaGO1+zzsIYSZOwK8nYXdK44tO7Yx
	 /Utu24VZeNbbg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sUnUO-000000002BC-1qGj;
	Fri, 19 Jul 2024 15:17:36 +0200
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
Subject: [PATCH 1/7] arm64: dts: qcom: x1e80100-crd: fix PCIe4 PHY supply
Date: Fri, 19 Jul 2024 15:17:16 +0200
Message-ID: <20240719131722.8343-2-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240719131722.8343-1-johan+linaro@kernel.org>
References: <20240719131722.8343-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PCIe4 PHY is powered by vreg_l3i (not vreg_l3j).

Fixes: d7e03cce0400 ("arm64: dts: qcom: x1e80100-crd: Enable more support")
Cc: stable@vger.kernel.org	# 6.9
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
index f97c80b4077c..6aa2ec1e7919 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
@@ -788,7 +788,7 @@ &pcie4 {
 };
 
 &pcie4_phy {
-	vdda-phy-supply = <&vreg_l3j_0p8>;
+	vdda-phy-supply = <&vreg_l3i_0p8>;
 	vdda-pll-supply = <&vreg_l3e_1p2>;
 
 	status = "okay";
-- 
2.44.2


