Return-Path: <linux-arm-msm+bounces-68037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D971B1DBCD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 18:34:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0DDA37E071E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 16:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 933BB273D82;
	Thu,  7 Aug 2025 16:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m+2RoI+c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EDF2701C3;
	Thu,  7 Aug 2025 16:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754584432; cv=none; b=BpGbnYzErZCJ0lV62wh2yIoP7DXvS+oloqsrU+1RbAl9yjlta+JqnRlICYffdi8pS3NhRhuJjvAIrgB3RzU1EVGSP4d+V9yzl1rvZ8j+a/DB8dAUk6qk+ResbnlLmaiBoSxKiFKfJgMSOwRLNKFlP9pmzG6dyTrAjNkRo3lzlkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754584432; c=relaxed/simple;
	bh=Ab/Ah5RUXiTyINsI8I1OGN6wqisIn1u/rAQpJWs7vE0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jI5ZqXJMiYLx6k7UGp2TTKk+/0nO0vfuTlcVMiL3igcUL/Aqk5mHaw9ONbvHjUWt3aFz9uipVUAsK+dhbDYWehZdToqvMgoYv+NraWBEdfVDwDjviZdZKC3VP7uOTfH2/gSJj9TEtuqQ1YqeKGg1YH2KBPKZBsy/TdLOSxiggBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m+2RoI+c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBFCAC4CEF1;
	Thu,  7 Aug 2025 16:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754584431;
	bh=Ab/Ah5RUXiTyINsI8I1OGN6wqisIn1u/rAQpJWs7vE0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=m+2RoI+cFka6dYRS1AJnE/6VrN5i6v4VyoZIVMn/3hMloFoMUsN3dq7tidXoVIQZ5
	 jZux80Ih73hfD2Nt3P97N3NjR+Y2OwLwWZ+K0AjAsepbPERzLMHB0Z5K+jiO6IQ3g8
	 eeAagWCZzrc9p+gGmXEcrsUOsYTld2oQYx0hs1Vu8jNAc381AGGOrT/+F+t9NkpAGQ
	 Xt11NbBFdEuoum64oMh++EGN6LJRrRUIS3aVXuDwxH0/yZvU4Nll/l/tZsx2rqxVYn
	 JHzWPAgSQzhxgZYU9Zlq06tl3oP6d74z7nAalYoNscP1Ckt6CCQiJc40sC5uoYx1Sh
	 oyhW+yFUPV2dA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 07 Aug 2025 18:33:24 +0200
Subject: [PATCH v4 6/6] arm64: dts: qcom: sc8280xp-lenovo-thinkpad-x13: Set
 up 4-lane DP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250807-topic-4ln_dp_respin-v4-6-43272d6eca92@oss.qualcomm.com>
References: <20250807-topic-4ln_dp_respin-v4-0-43272d6eca92@oss.qualcomm.com>
In-Reply-To: <20250807-topic-4ln_dp_respin-v4-0-43272d6eca92@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754584403; l=1518;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=fpPnWdsJhI/IO7HnqnWUuSXUlLyBucXjVncZV83CkyU=;
 b=5ncn1mUnlV92O1tj3/FTe+weymWpPODxEKbJ0u5j7X+ZRUDTt5bd46Y34DmDQ2fEd78FaZLYe
 W2tgmWFbAjBC4v8W3dNvdLHqVqqw3Loj2mJLn7d3sgcmFVSgstbvaEP
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
index cefecb7a23cf579b1f62ef6fccf9a27a6ea92ac4..b298ec1162357f7f273cb603465dab8388d4b38c 100644
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
 
@@ -1360,6 +1360,7 @@ &usb_0_qmpphy {
 	vdda-phy-supply = <&vreg_l9d>;
 	vdda-pll-supply = <&vreg_l4d>;
 
+	mode-switch;
 	orientation-switch;
 
 	status = "okay";
@@ -1397,6 +1398,7 @@ &usb_1_qmpphy {
 	vdda-phy-supply = <&vreg_l4b>;
 	vdda-pll-supply = <&vreg_l3b>;
 
+	mode-switch;
 	orientation-switch;
 
 	status = "okay";

-- 
2.50.1


