Return-Path: <linux-arm-msm+bounces-56894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 63687AABAFD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 09:32:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DAC57460331
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 07:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B4FD295528;
	Tue,  6 May 2025 05:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qjh7CxFE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C942951DE;
	Tue,  6 May 2025 05:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746510261; cv=none; b=PYJXVAC1uoKDIN70yN8R36dCBkDiXGAQyZiOXCU2m+k+pxrH+RXrD+tQOiIWZn0rvWTy7qEVNWGk0u2+YSgnISVlkygoT7epoFZLofZ7eo3feQLALZDauiWh5SdcTjSnjplOaAa/0GAYRV0qAjd4igeBxJghyau/lPBPuX/p5FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746510261; c=relaxed/simple;
	bh=Qdh7b0oxeGVA4SRLfwk4vHAL//K06YNKGRJLWOShx0E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CBap/lpYdUzYf+4dI6awNh+rJtiOV5OotP4yEe4YnuL0puZm0D6y5uQabcbDsMHk5ypX63qqwgHXU3S5TpDdVEQ312eOU5wwMtZ0elNTwUn/ykUi2WSxD+L+0CmzDjYx0ZMar8aXYG8cl8k9chzGVbo1vtp+sY/PXMdTSbARV0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qjh7CxFE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 03E21C4CEFE;
	Tue,  6 May 2025 05:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746510261;
	bh=Qdh7b0oxeGVA4SRLfwk4vHAL//K06YNKGRJLWOShx0E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Qjh7CxFECa94YXyRlah2mXsFRYQyC5vrPsl8F/75oQEMKe+ZCs5Dd4Xy1+M45nuah
	 /EN2pc5uUngOWJJVRaxSFSCLAvRjJOhcsi18OQiC+mSRVXSRTLOJtRIVryzXJhONZZ
	 ePlbmWcM1+xbEVetlQV/l7L7Xq2Tss5gl5g8TnqzClPCD9lbxYkZGSM+pXdkG2ITWz
	 nth7kGM7le9cESDcskS+q69osWkMveJbib+sdqpSkBOWoAQaQHOzXb7zVsKFu170CD
	 HnxOdppWwRuDA4twG51cS8E8y9iIUQWOiqZllyAZIaj0u57XYXBZuXFhSpZECXZtou
	 hK+jxpq+mwCvQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFE0BC3ABAC;
	Tue,  6 May 2025 05:44:20 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Tue, 06 May 2025 09:43:38 +0400
Subject: [PATCH v2 6/6] arm64: dts: qcom: Update IPQ5018 xo_board_clk to
 use fixed factor clock
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-ipq5018-cmn-pll-v2-6-c0a9fcced114@outlook.com>
References: <20250506-ipq5018-cmn-pll-v2-0-c0a9fcced114@outlook.com>
In-Reply-To: <20250506-ipq5018-cmn-pll-v2-0-c0a9fcced114@outlook.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Luo Jie <quic_luoj@quicinc.com>, 
 Lee Jones <lee@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 George Moussalem <george.moussalem@outlook.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746510258; l=2154;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=rsjsy3sOFV1Bg2dDCftuVKNO8nGOiFRTAbeFFfhHc1c=;
 b=0VkXT8KgrXJiOeVPwOsCMJkL8WBGzu2Ai1tNRz+xQh1NXvS3hxts5NHZIBfMwvp61k+Qjpx3J
 heUx4Dl8ppaAg0cOOwbIYbjtjqBnWwBWKJeS82kY8nYamZ5Ue+0fKKf
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

The xo_board_clk is fixed to 24 MHZ, which is routed from WiFi output
clock 96 MHZ (also being the reference clock of CMN PLL) divided by 4
to the analog block routing channel. Update the xo_board_clk nodes in
the board DTS files to use clock-div/clock-mult accordingly.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts             | 3 ++-
 arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55-v1.dts | 3 ++-
 arch/arm64/boot/dts/qcom/ipq5018.dtsi                      | 3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts b/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
index 8460b538eb6a3e2d6b971bd9637309809e0c0f0c..abb629678c023a2eb387ebf229f6dd1c30133b19 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
@@ -80,5 +80,6 @@ &usbphy0 {
 };
 
 &xo_board_clk {
-	clock-frequency = <24000000>;
+	clock-div = <4>;
+	clock-mult = <1>;
 };
diff --git a/arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55-v1.dts b/arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55-v1.dts
index 5bb021cb29cd39cb95035bfac1bdbc976439838b..7a25af57749c8e8c9a6a185437886b04b0d99e8e 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55-v1.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55-v1.dts
@@ -124,5 +124,6 @@ uart_pins: uart-pins-state {
 };
 
 &xo_board_clk {
-	clock-frequency = <24000000>;
+	clock-div = <4>;
+	clock-mult = <1>;
 };
diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index 6992d164fa965c760ce2738307f6e103d3ff3a20..6cd76155534c9933fb2b2762291519e9355aee2f 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -31,7 +31,8 @@ sleep_clk: sleep-clk {
 		};
 
 		xo_board_clk: xo-board-clk {
-			compatible = "fixed-clock";
+			compatible = "fixed-factor-clock";
+			clocks = <&ref_96mhz_clk>;
 			#clock-cells = <0>;
 		};
 

-- 
2.49.0



