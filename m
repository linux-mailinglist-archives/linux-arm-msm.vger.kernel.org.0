Return-Path: <linux-arm-msm+bounces-26745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 639FE938C42
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 11:45:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F284FB218E7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 09:45:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CCE916D9AA;
	Mon, 22 Jul 2024 09:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k65hLwwj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB03216D4F3;
	Mon, 22 Jul 2024 09:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721641425; cv=none; b=JdpV33aQReP18iGn2l5D4zlqWQJQGbjFHw1cd0yRQB25g7MGDcLFcIJKPkeSSrXjZzeNz0yl+ysBpfb0oNe9qe9myRTMRCxaba7o62xwloGC70CMU82A8xsb7QsH406XtsGxauHDb+t4YUdz6SmsxRjMjl3BqeyVl10IXfqQPBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721641425; c=relaxed/simple;
	bh=0uzVyxrhof8AS7od0ldhgHmxH15tqtHgH1PplGp3Hn4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lYc4EYt4Rkv86g93aBNalIp4APNIf2ku7mvPVmCFDpIdW3Kk2CxHOLCNbvpdchCHlUs7SygFF4FX5HpT6kuBl47DZwTEq3ZtBkZ6xW+dl3/iRQfOE2+Vz00kJksIZRlKi0KSrDYvRJ5kotdQnHVrK2ZOhSGrCBa5Hsb4oxjkozg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k65hLwwj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A5A8C4AF0B;
	Mon, 22 Jul 2024 09:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721641425;
	bh=0uzVyxrhof8AS7od0ldhgHmxH15tqtHgH1PplGp3Hn4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k65hLwwjaKXfYVM7/K8uVXMSt8NkubYvb3D/U/KajWJTen041FIp6904dZL2Voul6
	 /y7clOC1vTNAR9v1TkBKB3CRGkhvqkZOof5Vwhpu6SnsdNN7ZwMYbZvkhAd0z3VBvm
	 0swt+YFtrMo2zaI2NzDEW8Cv8o+DoYbo8ZHas/cNxX3SCCZ+3V7izvd/81hC7AJJ3i
	 n7efcAr7JAv3oo8BHhPcfaykywZpkiUwi7A9vDiDyZWdQXhmpDcjtaWV+tG+ygrGNp
	 2Zp1KRLm88Z6Lnzyzov5GI8T0tDrdtgHcFOpWXLdaL4SzTPRWIB/7dIt9bwBZsZAUX
	 oJlv93WO6vx1w==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sVpa4-000000006uF-1CJ9;
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
Subject: [PATCH v2 1/8] arm64: dts: qcom: x1e80100-crd: fix PCIe4 PHY supply
Date: Mon, 22 Jul 2024 11:42:42 +0200
Message-ID: <20240722094249.26471-2-johan+linaro@kernel.org>
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


