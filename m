Return-Path: <linux-arm-msm+bounces-51805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F1CA67C12
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 19:36:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC83C19C0C7A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 18:36:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75212213E7B;
	Tue, 18 Mar 2025 18:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WBHELeOD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4748D20B20A;
	Tue, 18 Mar 2025 18:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742322948; cv=none; b=owiXJR0rKuYrHIfJSluXxIxaLsY1ZWb6OVtjHD/i1xiEu/ESPTawhaI1utq32ItRrVFy1eqxd8S3zCHJzSt4xd+G0e/DyIh9Qws0vVhQXUShpY/+Xspbrt02XMxOiBbryqcMdw0lxXWfi7w8HNRfM4ApHDn59OVCC+Zulx6LM2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742322948; c=relaxed/simple;
	bh=7sRPiJ/J2Ihe5HUSgqodT/yr4Ak9+7V+yNpabbBqqb0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hfCT45xAp5iEhlFBaIeJ2vu3Z5DbFM/P6b/N+9APVeoLfAxJo6JJANEuxD4R/zhS4OgEboC0IsRTzf7Hs9KZ0ddZkT4mz0pUsC0KPUtscYg+l5iRWl8e13KPQ7Kg7iC8KrHf24mflSHSrZQz2CjouDkJoWl2QYOWFD+SwIEzuD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WBHELeOD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57C8EC4CEDD;
	Tue, 18 Mar 2025 18:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742322948;
	bh=7sRPiJ/J2Ihe5HUSgqodT/yr4Ak9+7V+yNpabbBqqb0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WBHELeODEdvBdtZketdDaT6y11bwtifJhu7DbHGkfTdOZ2FxuvpHhsVWoQJZ1uXdx
	 zpMOjWcoWYhPC3yuyZ28l0NMT3+LewouTcNa3HniAMiy570DOiHySri//pyiAdYCfW
	 rOUNz2YosIR4JVTuUzx/lEvp3RO0YnYIMaKglF/UhMtOL1UT4G379uogND7FxRFUv+
	 k1groVELY+6Ripta9y4qMICVj/oCbwS3wfYc54kK/hcpPJnJkbdc/g7C3ntUjpR37G
	 1epLLaTs7kBFifZ5p8yVPg4JO3roSqjJWWFOWQ/J6W+FGoKfwyrRgYsbBBjBWk0coy
	 UxjP+nD61qv0Q==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 18 Mar 2025 19:35:17 +0100
Subject: [PATCH 4/8] arm64: dts: qcom: msm8998: Remove mdss_hdmi_phy
 phandle argument
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-topic-more_dt_bindings_fixes-v1-4-cb36882ea9cc@oss.qualcomm.com>
References: <20250318-topic-more_dt_bindings_fixes-v1-0-cb36882ea9cc@oss.qualcomm.com>
In-Reply-To: <20250318-topic-more_dt_bindings_fixes-v1-0-cb36882ea9cc@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Marc Gonzalez <mgonzalez@freebox.fr>, Dmitry Baryshkov <lumag@kernel.org>, 
 Arnaud Vrac <avrac@freebox.fr>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742322925; l=1362;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=O6bUXBzPl0O73yw1eRGpkvnLBKfsLYyPQaLeNwWpFSE=;
 b=f9jwe6KaWHHLnzPo1KliUGimSlmIRdgZHHNEX/vnsv/QIQS3zd4OGqLYu0JME7sqAf/fXoHQQ
 ir6rhgQX4esBiVF29FFGFxJM8jzLfj7IwAKRZOND9pyKLv1ecPSBnLc
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The node has #clock-cells = <0>, as it only provides a single clock
output.

This leads to a turbo sneaky bug, where the dt checker shows that we
have additional clocks in the array:

clock-controller@c8c0000: clocks: [[3, 0], [39, 178], [156, 1],
[156, 0], [157, 1], [157, 0], [158], [0], [0], [0], [39, 184]]
is too long

..which happens due to dtc interpreting <&mdss_hdmi_phy 0> as
<&mdss_hdmi_phy>, <0> after taking cells into account.

Remove the superfluous argument to both silence the warning and fix
the index-based lookup of subsequent entries in "clocks".

Fixes: 2150c87db80c ("arm64: dts: qcom: msm8998: add HDMI nodes")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index c2caad85c668df2ebe900bc560e39480ae03e353..8d5a8a3f2c12ee1bc742c7dad35368f140d81dd2 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -2794,7 +2794,7 @@ mmcc: clock-controller@c8c0000 {
 				 <&mdss_dsi0_phy 0>,
 				 <&mdss_dsi1_phy 1>,
 				 <&mdss_dsi1_phy 0>,
-				 <&mdss_hdmi_phy 0>,
+				 <&mdss_hdmi_phy>,
 				 <0>,
 				 <0>,
 				 <&gcc GCC_MMSS_GPLL0_DIV_CLK>;

-- 
2.48.1


