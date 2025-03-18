Return-Path: <linux-arm-msm+bounces-51803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 266D9A67C06
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 19:36:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BD6919C0AB4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 18:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23E32212D6A;
	Tue, 18 Mar 2025 18:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iYBo+vZ+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEE9211A0D;
	Tue, 18 Mar 2025 18:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742322940; cv=none; b=To2jmlxXyxI07DkFSJqWm5IG0HoVLYMMFRyMnNk3YR/J935bMu4S+xNA7xJIHkSbI+Xx8eqFU6ogx6vgIlQE/0yoZ/8Cf76laEBdUkRnqNf45wVYfRkZDTNXKtd5fldJiKr7CDjxhfYGPoZPLmtNGFT/1OJQiaMASzmQAjZ4eKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742322940; c=relaxed/simple;
	bh=+b0yuDFHz69He1kOfQI5TNcdl46OIVisZwYJCESxvL8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oiKExG1qnw2++H+sWekXDF/tvqH08AUDz1IPWY3C7L/HDrhXGkQK0llOap6S4ry6j32xplQUKKyqlTkY6sP0RhXgoyrcvnJKFikeNTTgTPyYxG9hzzPhgQHciUPcOonyG3ia7OJECF3csCY++lke1FmPtEmujMCr7zfGzDJtwKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iYBo+vZ+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62A4CC4CEDD;
	Tue, 18 Mar 2025 18:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742322939;
	bh=+b0yuDFHz69He1kOfQI5TNcdl46OIVisZwYJCESxvL8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iYBo+vZ+8Hqgie57OEeP1nPtKgmd3FYE7AQg3JSpj6QSeVYgCYGlx6EMNkTQHwzFq
	 glKt4u+szo/KlDGn5y5le+oLWNM7iKmL4ynz02ZJ0bG4MSjrGab28VEmqH3QZzJS9A
	 LTXb3PlaA66UET0pW1YyzFdYpYgxuEPRkJLEB/Zcvdqcqux2Zl74iUSksVr2kBw0Pt
	 W6ww8g35m2xkVQ8FXtBdK075Q2rFqms0Bj1rVWj6xh1QYGC032TImj+RA77uvykEPS
	 ybYynOsYcrZuxptPMTUtYItLrcX8Z+On/T4AkbAeXLcZUtvEzz2bAH+gFFh682OC6K
	 uMMdCdGyiF3Ag==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 18 Mar 2025 19:35:15 +0100
Subject: [PATCH 2/8] arm64: dts: qcom: sc7180: Add specific APPS RSC
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-topic-more_dt_bindings_fixes-v1-2-cb36882ea9cc@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742322925; l=1019;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=CNR2xxR45pjeW+SupQT4b3ugM4PkZnjzJcE0uP0U/gs=;
 b=B/9IxDMc3jc07+2eN6RJh2ZylrW3WJOK51XJUPqNefNOmQ3DkYvw+5IsXe9EMul7ygMdvYo6D
 5qlVV1ePIJyD/RRCv8b/PvKipqA36CKdX23+e+x2xDOBaIx6p6QZniH
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

SC7180 comes in a couple firmware flavors, some of which don't support
PSCI in OSI mode. That prevents the power domain exepcted by the RSC
node from providing useful information on system power collapse.

Use the platform-specific compatible to allow not passing one.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 87c432c12a240f8035753ad10ce8662584a3f1f3..c79b256690fee8a20853e1662503e1f4250611af 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -3720,7 +3720,7 @@ frame@17c2d000 {
 		};
 
 		apps_rsc: rsc@18200000 {
-			compatible = "qcom,rpmh-rsc";
+			compatible = "qcom,sc7180-rpmh-apps-rsc", "qcom,rpmh-rsc";
 			reg = <0 0x18200000 0 0x10000>,
 			      <0 0x18210000 0 0x10000>,
 			      <0 0x18220000 0 0x10000>;

-- 
2.48.1


