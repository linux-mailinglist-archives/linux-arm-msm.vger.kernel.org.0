Return-Path: <linux-arm-msm+bounces-26765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 50379938CCD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 11:59:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 063191F2517F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 09:59:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FA6916F282;
	Mon, 22 Jul 2024 09:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DCTLosKD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB5716EC02;
	Mon, 22 Jul 2024 09:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721642121; cv=none; b=u5wW10SzFT1aOnTnj9hfkh5VNPhIYKgPK1/tcls2b65oU3uO9yn3LFHUJ3ca5Cb6FZQkW3d3FwGJSCklRBKSpfBVRSkjjHfwv+9dZCuRs2oZ099h8iVy3Xou3BxG15Yvrkd67T5xkUC9VWmz+eOjVdcgudaWt01dsQExUR4riHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721642121; c=relaxed/simple;
	bh=0KVtuwSKKTm46nCfkrLIFBxo5vlLrbZ/OXa6EScXleM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=li2Sdos+OMDtXB8cqbvxC9TIfpoE3qOK9uDeitDePyKTgAMdyMXHjA1WaUPMB7uTSn3CV0dqtMUFDBAEP1zaHSMYPV2Jg9hhWR2pqEMcToKTHx1REsrSdnkVNvxq1Ak2Z1BvjE33ZLmPiK8xsRdq2MtQuRwu8Wr8hrbqEdNiFtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DCTLosKD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BA87C4AF61;
	Mon, 22 Jul 2024 09:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721642120;
	bh=0KVtuwSKKTm46nCfkrLIFBxo5vlLrbZ/OXa6EScXleM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DCTLosKDhedDq3l5sIQywsN46x36+rrWod1vnGQs8sCOSncNewGj3mV8OH4JadVkf
	 KBkougVhiSGOcQnrcmeUhG7VPOhZktLnhI8qMGUggwmLc7CyeSJDNzMvEKCVdNSWVr
	 uoCqFdOt8wxPKLsfLOL66wNr979TTL2hfq7WVXo9QqhQwuecIU3MJR8zC6738w3bp/
	 58Svdu3ctrKY6SubzMGZUbQdMvM+FRPWY8+IDT437XINxxWbSvE8A/Xyd8kdEIoavV
	 jNFeFz2X4wjCb/6G0k85BA6g2wwOPO7xpfX+U2Fm+uKW81dI7RvOAjxmO0wn/7P1HI
	 p8Wqlewq3HjXQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sVplH-0000000079g-3VeK;
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
Subject: [PATCH 09/12] arm64: dts: qcom: x1e80100-yoga-slim7x: fix PCIe4 PHY supply
Date: Mon, 22 Jul 2024 11:54:56 +0200
Message-ID: <20240722095459.27437-10-johan+linaro@kernel.org>
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
design so assume the same applies to the Lenovo Yoga Slim 7x.

Fixes: 45247fe17db2 ("arm64: dts: qcom: x1e80100: add Lenovo Thinkpad Yoga slim 7x devicetree")
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index fbff558f5b07..0aeead5658ec 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -629,7 +629,7 @@ &pcie4 {
 };
 
 &pcie4_phy {
-	vdda-phy-supply = <&vreg_l3j_0p8>;
+	vdda-phy-supply = <&vreg_l3i_0p8>;
 	vdda-pll-supply = <&vreg_l3e_1p2>;
 
 	status = "okay";
-- 
2.44.2


