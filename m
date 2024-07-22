Return-Path: <linux-arm-msm+bounces-26749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0998938C53
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 11:46:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D5EB1C213D1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 09:46:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 154D216DEAA;
	Mon, 22 Jul 2024 09:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rq7zL5XP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEE916DC37;
	Mon, 22 Jul 2024 09:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721641427; cv=none; b=j0YeWWt6EoSggODkWG6cHO3NiC5FL2XneI+5aIgfd+o4rk6S2UktSDSKIBvRVNnlU9+uQLLZhWS4SZD34mRVbtb1ebTxqKEcxQmEf6cj4Y5UC7+EvzzUG5Qsz5FKDYj1RgxgYxWRTdfrbPriy440oUuptanMxGPRS67aUf2ZeQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721641427; c=relaxed/simple;
	bh=KVd5LJQMkq/MHTfJl/SJvOXz9duIgh/Kzu1vZ1euBWA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IxfsP9bosZL3y4sIJ/o0tTS6qsnyu8vmE++GeBXDpMKc7Avf/Qn8vtWzd5YTME+4aJ3r4W5DkQHR/Cle+jL6Dr5MTR0OxRC2uHTN1Wz1WHEc+loiCPj7xnZ0ST0G95HkAucd8iEdXtNtqb+kAdOMEI7q94oCk1v4/QjBo/DoQaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rq7zL5XP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75E09C4AF13;
	Mon, 22 Jul 2024 09:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721641426;
	bh=KVd5LJQMkq/MHTfJl/SJvOXz9duIgh/Kzu1vZ1euBWA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Rq7zL5XP03avtdkiF33ZewzYEGmYf7jI1ESMbG0vqvxI5sOeE3JQpmywxcyQCvj2W
	 cFjQFQrgs5x9gxZTXedSL5Jfo3K2kKX+JG5ufUHW1iWIxTbENxqrm7TLbtOZ2gqTRO
	 cOLqeLmrY/OtV++M3Qi6QS5AIXYThTCcbHq2BF33J1bWQmgkY2ia7ccO7QbqvVyLDn
	 XORl3Rx0imhVoESh4UGOKUABCpSRd2Y/bSrBQBZNFCj+W/PD7DJkVp6IKVMn7iUUnO
	 yYIyJZy7ayAeAXDPSNWA9VdUyDIlcDRNKkZudGHN7RwoQXr3GUpxogD10eK9O9popq
	 AKkZHgrfYLHgQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sVpa4-000000006uJ-22og;
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
Subject: [PATCH v2 3/8] arm64: dts: qcom: x1e80100: add missing PCIe minimum OPP
Date: Mon, 22 Jul 2024 11:42:44 +0200
Message-ID: <20240722094249.26471-4-johan+linaro@kernel.org>
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

Add the missing PCIe CX performance level votes to avoid relying on
other drivers (e.g. USB) to maintain the nominal performance level
required for Gen3 speeds.

Fixes: 5eb83fc10289 ("arm64: dts: qcom: x1e80100: Add PCIe nodes")
Cc: stable@vger.kernel.org	# 6.9
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 07e00f1d1768..2c10532d4f60 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -2974,6 +2974,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 				      "link_down";
 
 			power-domains = <&gcc GCC_PCIE_6A_GDSC>;
+			required-opps = <&rpmhpd_opp_nom>;
 
 			phys = <&pcie6a_phy>;
 			phy-names = "pciephy";
@@ -3095,6 +3096,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 				      "link_down";
 
 			power-domains = <&gcc GCC_PCIE_4_GDSC>;
+			required-opps = <&rpmhpd_opp_nom>;
 
 			phys = <&pcie4_phy>;
 			phy-names = "pciephy";
-- 
2.44.2


