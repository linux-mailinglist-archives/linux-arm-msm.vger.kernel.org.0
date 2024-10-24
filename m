Return-Path: <linux-arm-msm+bounces-35681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D96E9AE5BC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 15:11:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C56FD1F237FE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 13:11:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 736261D63F3;
	Thu, 24 Oct 2024 13:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zakz2Op7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426C71BBBEB;
	Thu, 24 Oct 2024 13:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729775474; cv=none; b=uftz+rB5dypcN0V5389M/5UUTfw3lrmldb+gCU8PnJ6Ajh6+ScEj1w87XY5gAtYGFLjrqamoGL54UMtQHHgG1+mH28trged4aTuCRzKnBsV8PMi05V9K8bTLxSa5g/XI5SbW48kDOki8mC6WCQTuEOI2vumRiNK0CTGY2HCyAls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729775474; c=relaxed/simple;
	bh=/FxvH4MR+grW/AE7muGNVZV8ZPyfHNmhdBaSYWUZgzI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hzbJduBX5SXd/69DG68xc3uhU7JA7f5ucNQnJNoUf39Ii+4dAYwWJcb1LqhAwt76ekb2M86OQltrWI7YB6E4qzcQoxhnk/7QyUyJxGQgQOCakCIKttwReBJpVS1tZABOPm6idxipDKklFT0Ha5bE6O+SXxDuI1Cq91bzeqSFo8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zakz2Op7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18B26C4CEE4;
	Thu, 24 Oct 2024 13:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729775474;
	bh=/FxvH4MR+grW/AE7muGNVZV8ZPyfHNmhdBaSYWUZgzI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Zakz2Op7TsS4HdYR1hDOEknftQeaETxzrtu97BcCTJ6U/ipCi/uWhosRSUn4uwlxn
	 siTOk0l3gtT2325trpkK5hxgPlBp+vCFQJXjcJ/eaDlFtXfbM6sb2uA7xWwNA27trq
	 poEdsK+y0yvVPxJIC/5AzwrrI4UDDXD9U/SL+vj37lOVLYSnYrNJ3z7482QpwEkPDi
	 G9Lf7Qe8h1uJ0kE1I4XOdraGVnKOw3InzryjjbGwwaQoyscQOGnsz0w3ZHtUHW9iMp
	 KqR8/sDtIRJ9YvTVyj6q/whlud8VK8dZerZ1efkCUoejWXwU8uADVdwxEcxnpLvubY
	 eivTAXpRPLCAA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1t3xcf-000000003Xq-2URJ;
	Thu, 24 Oct 2024 15:11:29 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	stable@vger.kernel.org,
	Sibi Sankar <quic_sibis@quicinc.com>
Subject: [PATCH 1/2] arm64: dts: qcom: x1e80100: fix PCIe4 interconnect
Date: Thu, 24 Oct 2024 15:10:59 +0200
Message-ID: <20241024131101.13587-2-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241024131101.13587-1-johan+linaro@kernel.org>
References: <20241024131101.13587-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fourth PCIe controller is connected to the PCIe North ANoC.

Fix the corresponding interconnect property so that the OS manages the
right path.

Fixes: 5eb83fc10289 ("arm64: dts: qcom: x1e80100: Add PCIe nodes")
Cc: stable@vger.kernel.org	# 6.9
Cc: Abel Vesa <abel.vesa@linaro.org>
Cc: Sibi Sankar <quic_sibis@quicinc.com>
Cc: Rajendra Nayak <quic_rjendra@quicinc.com>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index b577c4b640dc..ee53cd0aeb95 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -3229,7 +3229,7 @@ pcie4: pci@1c08000 {
 			assigned-clocks = <&gcc GCC_PCIE_4_AUX_CLK>;
 			assigned-clock-rates = <19200000>;
 
-			interconnects = <&pcie_south_anoc MASTER_PCIE_4 QCOM_ICC_TAG_ALWAYS
+			interconnects = <&pcie_north_anoc MASTER_PCIE_4 QCOM_ICC_TAG_ALWAYS
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
 					 &cnoc_main SLAVE_PCIE_4 QCOM_ICC_TAG_ALWAYS>;
-- 
2.45.2


