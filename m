Return-Path: <linux-arm-msm+bounces-37286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B9A9C10C5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 22:14:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 053B11F2189E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 21:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC8ED21791B;
	Thu,  7 Nov 2024 21:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tNi0fj2U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3041EC015;
	Thu,  7 Nov 2024 21:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731014068; cv=none; b=J4pRqhQyg7it6k627g1QsHekjrr6y6VAjNKuURZEXR3/N8Ko47o28v8ki2usDnawCLRtisoXTw+iapY1RBG+z0cZwFUseWIHfjN0Py25sW2DloAr7o4pWBvo1mXjVNW4x19m5LkYbSoYbGnS8AfC8aMZ7gkMnRih1gOUuFxMWG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731014068; c=relaxed/simple;
	bh=ZFf0oKUD2+C7jjnMzBMYtfku4VcDgPlKl/yJVrNDWZg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TRDDYis6qC1uN6iyWZGmMj4EZTb7461LaHCBzkC12jfeFC4vfP3u+PaxQ2/6hTyp7bcvlhG7jLEU9r2oKD+VF48f8mEFbWSD+ORntJg/m+ZxfzQVAujy2JsVg+2Q2mqTt4XCdqT/boLYSHTEShWcZtkEOpdYryvL78teAFECSrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tNi0fj2U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32EF2C4CECC;
	Thu,  7 Nov 2024 21:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731014068;
	bh=ZFf0oKUD2+C7jjnMzBMYtfku4VcDgPlKl/yJVrNDWZg=;
	h=From:Date:Subject:To:Cc:From;
	b=tNi0fj2UjokHys1e6cdlzyCWXWyUOumjpH6GrQvquCd8r8HKn2ZF8o6PELgn/+1QM
	 ENaSkKwnCZuesR+OJZvEDLJP6zIqdnHzbxsvvUE9jr685SOMilrkgIC49VRYBCHstW
	 MUX8eY2cepbSoZOERpEhYMIAVEvGHzSiDU7ojBjoN/84Ep6rzBo/dxzw5/DXnnN409
	 JZwxM0mWu188a9qz81Pdd8QDQvAQkDGs2Qpfw1iaYHpr9ZfIsrD4/W1RidGK37xc6N
	 nuqi5Ydl1Lmln/SqU2fK4QPJhq/k5vIT9wwHwFI2dTYmnwusjhEoA5QT58JeIjUo7k
	 3N9kTO2Sr/o3w==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 07 Nov 2024 22:14:23 +0100
Subject: [PATCH] arm64: dts: qcom: sa8775p: Use valid node names for GPI
 DMAs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241107-topic-sa8775_dma-v1-1-eb633e07b007@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAK4tLWcC/x3MQQqAIBBA0avErBNUFKWrRITZVLNIRSMC6e5Jy
 7f4v0LBTFhg6CpkvKlQDA2i78AfLuzIaG0GyaUSght2xUSeFWeN0fN6OuYVas2VNWJx0LKUcaP
 nX47T+342FwzSYgAAAA==
X-Change-ID: 20241107-topic-sa8775_dma-c4e5504871ba
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Viken Dadhaniya <quic_vdadhani@quicinc.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731014064; l=2133;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=t8sIaao5aUmofXx5nPK/DWLzkESSVbxj4nYd8Ou7MZI=;
 b=rQS3rSte/kOJhXjV/04uRW0S5Wo8X6jvPFgRr9/o7I3n0hP7aeOd8mXDPnCuqomhZ0njDUm7s
 TjJjLSlQTFAC1ZFsAHBOO3jAAUcGo998p+X3zw/HY+1ncxPrf0l2zuv
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

As pointed out by Intel's robot, the node name doesn't adhere to
dt-bindings.

Fix errors like this one:

qcs9100-ride.dtb: qcom,gpi-dma@800000: $nodename:0: 'qcom,gpi-dma@800000' does not match '^dma-controller(@.*)?$'

Fixes: 34d17ccb5db8 ("arm64: dts: qcom: sa8775p: Add GPI configuration")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202411080206.vFLRjIBZ-lkp@intel.com/
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 9f315a51a7c14cd4116ec5a66a60285361d343f1..ebfa049515c63a0f1a333315dd370e6f78501129 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -854,7 +854,7 @@ ipcc: mailbox@408000 {
 			#mbox-cells = <2>;
 		};
 
-		gpi_dma2: qcom,gpi-dma@800000  {
+		gpi_dma2: dma-controller@800000  {
 			compatible = "qcom,sm6350-gpi-dma";
 			reg = <0x0 0x00800000 0x0 0x60000>;
 			#dma-cells = <3>;
@@ -1345,7 +1345,7 @@ &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
 
 		};
 
-		gpi_dma0: qcom,gpi-dma@900000  {
+		gpi_dma0: dma-controller@900000  {
 			compatible = "qcom,sm6350-gpi-dma";
 			reg = <0x0 0x00900000 0x0 0x60000>;
 			#dma-cells = <3>;
@@ -1770,7 +1770,7 @@ &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
 			};
 		};
 
-		gpi_dma1: qcom,gpi-dma@a00000  {
+		gpi_dma1: dma-controller@a00000  {
 			compatible = "qcom,sm6350-gpi-dma";
 			reg = <0x0 0x00a00000 0x0 0x60000>;
 			#dma-cells = <3>;
@@ -2225,7 +2225,7 @@ &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
 			};
 		};
 
-		gpi_dma3: qcom,gpi-dma@b00000  {
+		gpi_dma3: dma-controller@b00000  {
 			compatible = "qcom,sm6350-gpi-dma";
 			reg = <0x0 0x00b00000 0x0 0x58000>;
 			#dma-cells = <3>;

---
base-commit: 74741a050b79d31d8d2eeee12c77736596d0a6b2
change-id: 20241107-topic-sa8775_dma-c4e5504871ba

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


