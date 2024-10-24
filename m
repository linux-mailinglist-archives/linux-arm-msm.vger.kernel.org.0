Return-Path: <linux-arm-msm+bounces-35683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B98C49AE5C0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 15:11:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70DE3281319
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 13:11:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5DB11D9669;
	Thu, 24 Oct 2024 13:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VBP6F0Aw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84C41D89F8;
	Thu, 24 Oct 2024 13:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729775474; cv=none; b=JbbzdGt/Cd0NuKBKZCyMVTQrfuVB8RyV+Tmok3FJCVYSaEeS9MogesyQn7QLyas3acNnvbAXqgqjqCheRz14IfcLCAmidNlmEp+dkUBScuOdXgKhTTrDfYhuk8Q1jQ74waC1BrU/IqE+zvkcgrWfZf9GcodxR4En2uMUAbRojac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729775474; c=relaxed/simple;
	bh=5teONMyNaSD+W/M9XJf0XVho+JTe5FUhWHmzW6kn334=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L8Ykaba5jlEcd1ig9l1FUTnVqcUJWsmkpCwc//XdaYZiL4MqnkzHM0Zeg6UygYaEf2QuDyTvVWfiUaf01ZCx/OzRFixqFVRG4tTnwTYxqE1IAauIYKLE7/ZmJDuSME3vsR/pTaDfxh9DK/F6/ItfYOgglIFJkUfC9QNl4T0DfZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VBP6F0Aw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BA60C4CEE8;
	Thu, 24 Oct 2024 13:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729775474;
	bh=5teONMyNaSD+W/M9XJf0XVho+JTe5FUhWHmzW6kn334=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VBP6F0AwViQ1uLFZAq7Td6qEtdOtrvMPEzjN0Dq4CkrEe5XTf6dLXosYp46fyJqcE
	 2Jq2An4g5SaPXtoYlBdEY7lj9K/rKOmYqnrGx+CAUtVo4rruBf0acNJlgmRLTzwblK
	 ygdFXFp+YQ8F/b7V6isKbQHAq0ijfCdeGq2FHu1Ho2Vopzw5loW0n4n3p3yTVAyRU0
	 ItdOU2w39Cfvderl0ip3VGGdVrQvClla9VNKoc3em1UGe+UkX4lIZUleEXurA7s+2C
	 sWv1TzGATUsmMG3Tt1zmWcT5WOhdLQPjeBJ2VJMoqpEDWA4ybBvmx+10JRwDKDH1zF
	 kT1ExK97dArGg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1t3xcf-000000003Xs-2xjw;
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
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 2/2] arm64: dts: qcom: x1e80100: fix PCIe5 interconnect
Date: Thu, 24 Oct 2024 15:11:00 +0200
Message-ID: <20241024131101.13587-3-johan+linaro@kernel.org>
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

The fifth PCIe controller is connected to the PCIe North ANoC.

Fix the corresponding interconnect property so that the OS manages the
right path.

Fixes: 62ab23e15508 ("arm64: dts: qcom: x1e80100: add PCIe5 nodes")
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index ee53cd0aeb95..d7b6116578fd 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -3105,7 +3105,7 @@ pcie5: pci@1c00000 {
 			assigned-clocks = <&gcc GCC_PCIE_5_AUX_CLK>;
 			assigned-clock-rates = <19200000>;
 
-			interconnects = <&pcie_south_anoc MASTER_PCIE_5 QCOM_ICC_TAG_ALWAYS
+			interconnects = <&pcie_north_anoc MASTER_PCIE_5 QCOM_ICC_TAG_ALWAYS
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
 					 &cnoc_main SLAVE_PCIE_5 QCOM_ICC_TAG_ALWAYS>;
-- 
2.45.2


