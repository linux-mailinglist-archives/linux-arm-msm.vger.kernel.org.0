Return-Path: <linux-arm-msm+bounces-59617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 786DDAC5B86
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 22:41:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B70133AC231
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 20:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBEA0214A79;
	Tue, 27 May 2025 20:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fRO4fevT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF69620D51D;
	Tue, 27 May 2025 20:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748378448; cv=none; b=upPggRQfGPY1dZGcAMXA69rSUS3la9k7We4B1nk+kfljm9/k7e7yz5QL1HLJ98uJOEkyyBoNlLH/CVLH94smMUv3Nqu6oN6oPqEE382tvn+66B1ipcuJZfQlen392l95Zkj0x+tItBesIWls5P87JfB2yfmP82Ibf4IeYE5Ehgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748378448; c=relaxed/simple;
	bh=RVazM5ZtiGWCT+v8DRQoiisLlKYFeeVIeRZlRvqZqDg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RFRG10LShQVKNW+FPfPGIJzKYaNaEwWFwyW4Pn7y0sVCx8qx9aXsTYNOUyiGOcGoUtBmqkveodJ0BH3NCEVC9gBUAaEFNP3DPXUlnbZVETyfLaCs2EhKfFXKEFczJreiLS9MYvxsLe5hHXV77OvpPL3l2bZ6PIeTXKs1igJSQXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fRO4fevT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86AB0C4CEEB;
	Tue, 27 May 2025 20:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748378448;
	bh=RVazM5ZtiGWCT+v8DRQoiisLlKYFeeVIeRZlRvqZqDg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fRO4fevTyyA62iyayKIH0sMFandXs774MO8JFXftoyD1qAkx3qkiAQ5CkCF7UVodP
	 HXnMGvVWX6s+wp6cxUC2WN5dv8OeS9/cM/uJUGYa8CHRlLXq/rMo1poimtyXE8E/9n
	 seA3vdvizNji73PlhEMwpXhOMlcmCVFm4i8vCd7TaQf3PzMNe3eRyQCeLU8R35YE6P
	 rSmFcQvAkMrldRaqyJV1IoKiqY7qRxmjkWJW2ZiZ7kAMOxeAaid/Ju2J5BIeCB7afq
	 Sb5ycg9Xnh1duZVd953E9aorKmFTMeyQmeGNknmDlVUbviqA1O1w3frCfrO0IkqT6j
	 gBqIFzXhZMy1w==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 27 May 2025 22:40:08 +0200
Subject: [PATCH v3 6/6] arm64: dts: qcom: sc8280xp-lenovo-thinkpad-x13: Set
 up 4-lane DP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-topic-4ln_dp_respin-v3-6-f9a0763ec289@oss.qualcomm.com>
References: <20250527-topic-4ln_dp_respin-v3-0-f9a0763ec289@oss.qualcomm.com>
In-Reply-To: <20250527-topic-4ln_dp_respin-v3-0-f9a0763ec289@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748378414; l=1518;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=dS87KXTh0HxELr2bjO6fgUYK0yoQHdoxs9VWcCRgRHM=;
 b=ijTqtJXk3zoLfEpe5EaAa8pNz/m3Ca2XRRwiXvfAsXRJeq978apZRm5fRDWdC2mcZ9mYuuUjl
 Rxo3GZA8wfgD8xmlSS5YGylOxzZcRLC78JdmkLgIB1uGNz1pLQyJG3p
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Neil Armstrong <neil.armstrong@linaro.org>

Allow up to 4 lanes for the DisplayPort link from the PHYs to the
controllers and allow mode-switch events to reach the QMP Combo PHYs.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
[konrad: reword]
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index ae7a275fd2236a2c71808b003fbcb66687e6e45e..336704e2a806e74c98a8dd483d8da0311df95389 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -726,7 +726,7 @@ &mdss0_dp0 {
 };
 
 &mdss0_dp0_out {
-	data-lanes = <0 1>;
+	data-lanes = <0 1 2 3>;
 	remote-endpoint = <&usb_0_qmpphy_dp_in>;
 };
 
@@ -735,7 +735,7 @@ &mdss0_dp1 {
 };
 
 &mdss0_dp1_out {
-	data-lanes = <0 1>;
+	data-lanes = <0 1 2 3>;
 	remote-endpoint = <&usb_1_qmpphy_dp_in>;
 };
 
@@ -1358,6 +1358,7 @@ &usb_0_qmpphy {
 	vdda-phy-supply = <&vreg_l9d>;
 	vdda-pll-supply = <&vreg_l4d>;
 
+	mode-switch;
 	orientation-switch;
 
 	status = "okay";
@@ -1395,6 +1396,7 @@ &usb_1_qmpphy {
 	vdda-phy-supply = <&vreg_l4b>;
 	vdda-pll-supply = <&vreg_l3b>;
 
+	mode-switch;
 	orientation-switch;
 
 	status = "okay";

-- 
2.49.0


