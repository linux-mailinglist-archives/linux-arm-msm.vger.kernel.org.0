Return-Path: <linux-arm-msm+bounces-52568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CCEA7283D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 02:47:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 02B1A189A33D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 01:47:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEF6761FF2;
	Thu, 27 Mar 2025 01:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CMTkY5kF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10D52E3392;
	Thu, 27 Mar 2025 01:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743040044; cv=none; b=WhDj+HE/HRxxVi+t/rT2y9vQEk8Weenq7LhU3VPiaZyZ9x6lfW6JW3h3FTjQmH9ei2b+luFHaMqMOZJPdZBILeDzug1CjLsJQuW9Ffo0/wStXdDlkvDlWaHQn85qDqCC71v0xO8A1A8NNG8nrjsEj/cHOJXJekoQXT99Ua+gMNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743040044; c=relaxed/simple;
	bh=UxLUcaGCclLWZ9szhs02Tjyzxd6/F5pbbSROIayuHDY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jw1r/N/wp/z6WtZoovN/Bgqrq4w7P/gPPKuCYqGW7dCh5dEucWiKBocAHEY77IXhAP2uTRR4Ku3G3zzd9ZLicWE1VxEXTakQTrjUReGr+Kd0sZJL+GqLYQsVGIu3XI7tVjjP7iWi/ci/ps6NO7ttK+HYruXI1U2k1/iBB//VdUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CMTkY5kF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A318BC4CEE8;
	Thu, 27 Mar 2025 01:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743040044;
	bh=UxLUcaGCclLWZ9szhs02Tjyzxd6/F5pbbSROIayuHDY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CMTkY5kFwIr/hOBRFrbqksyazGslvNgMPtACJNqtYn6BuP4i6u5vzwU0sdS/ArqVn
	 FG0t3upB7Sv6j5m8jmQOejFLOhrhLh8TrCAf9WiAQbsOojE9pjtVCcaRJXZ8J8/zg3
	 7fX1kOjk6Cp5Nfm+B0TUN388q35++ojdmHQI0x5JIuYR7l3mEYI3uGXis56HqC9O6t
	 nOAKOY9GPfbHDD379xgWdRpxNyIOpFEVK0QfZKshcNDj0Qprld7TWNmST+wpc/U/n9
	 DCGy0snfaoJomNxZx41UtD/DEF9p0R9iMXw+e+s90aHHd/HG+U4TSB2+R8wyp+rFAj
	 LZduC/2YaVoTw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 27 Mar 2025 02:47:04 +0100
Subject: [PATCH v2 02/12] arm64: dts: qcom: sc7180: Add specific APPS RSC
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-topic-more_dt_bindings_fixes-v2-2-b763d958545f@oss.qualcomm.com>
References: <20250327-topic-more_dt_bindings_fixes-v2-0-b763d958545f@oss.qualcomm.com>
In-Reply-To: <20250327-topic-more_dt_bindings_fixes-v2-0-b763d958545f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Marc Gonzalez <mgonzalez@freebox.fr>, Dmitry Baryshkov <lumag@kernel.org>, 
 Arnaud Vrac <avrac@freebox.fr>, Sayali Lokhande <quic_sayalil@quicinc.com>, 
 Xin Liu <quic_liuxin@quicinc.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743040027; l=1086;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=98JRbZTQlUUQeYgs3hYLkDJRFRniq2MiDxw5JXkkKH8=;
 b=nkmIFKznUbXRMEjje+111XP0sU8DIhcGfgcaPI7G7IViuMqMaJy9GhG4vIGvRtvEek2ZUErhn
 3claLnKx9/ADJ8Sw6RMAvMBgYzS2D/+j3eQRHWQy7nZtp+3lBxt7QDC
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

SC7180 comes in a couple firmware flavors, some of which don't support
PSCI in OSI mode. That prevents the power domain exepcted by the RSC
node from providing useful information on system power collapse.

Use the platform-specific compatible to allow not passing one.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
2.49.0


