Return-Path: <linux-arm-msm+bounces-20449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4638CF078
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 19:39:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3048E1F21429
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 17:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DC4986AE7;
	Sat, 25 May 2024 17:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eoVOqVz7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E19A3A29F;
	Sat, 25 May 2024 17:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716658764; cv=none; b=gc60ABSZulKKwxdbhmNug4SKKNuzIZwxFcnv8ZhMTpF/3HlSBUso2oBEO7kA2OEuqgcu0+6eS7tjvToMW5vTPG+2H/+CcU7OY67nz21WZVUM8cvkiwFqDobj/KbNKsNH+z2rPrl+QC1KN3BiJYpjyPxJyU4Trpc+/sUsbOr7w6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716658764; c=relaxed/simple;
	bh=cOJAS+lSpANLmIdlcOUWxK83GUMKgG5eurzHyM54Noo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HCA0WRKPrUJjaSc2qx4IvMnf4uBe8rnwlu327QRkhq6mgLyjUkuNVbvhfRdpMDr4jVtjavdIK/UKmPVGyp6cVpsoVkAjANzcsw3HDiwxxRh+jh2KV1iBSyVLILuiQ3qtXp4zHXyrb1MPDGN6TjSgNbhktIJ6YxzaOvk1rh0WxTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eoVOqVz7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D67AC2BD11;
	Sat, 25 May 2024 17:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716658763;
	bh=cOJAS+lSpANLmIdlcOUWxK83GUMKgG5eurzHyM54Noo=;
	h=From:Date:Subject:To:Cc:From;
	b=eoVOqVz7E9v+5euKLm8T2htWuV/1JYuZf7IhDIobQohTWvFnTxYUkxiNGi1vELNbm
	 foJj0E2eiRu4eNlx6L8QTspp78IzDOx6upfAqBW6DBsFWiydGBdnheI0TYMSx/evk8
	 7TC5DbN6iQk9NEsGY9aXTOwIdH//uP6aHfvYFo9YgoKtN6KSzsvF3WJ6NtzcMSD4H9
	 /zFhRMaEwDmwx583ZLJ4IKb0YySBuSOVyaflGdEQG4zcbicGA7+FlPkxNrYaEUONLB
	 2VWccQ2QYZTUwX4Gl1K5hSyLO201S/T+ctp4HBXjns8pt0wVWqbZvLbZl6HGzoefWC
	 dqJEaOYA4mRLg==
From: Bjorn Andersson <andersson@kernel.org>
Date: Sat, 25 May 2024 10:44:11 -0700
Subject: [PATCH] arm64: dts: qcom: sc8180x: Fix LLCC reg property again
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240525-sc8180x-llcc-reg-fixup-v1-1-0c13d4ea94f2@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAGojUmYC/x2M0QpAQBQFf0X32a11s2x+RR60Dm4J7UZb8u82j
 9M081BEUETqiocCbo167BmqsiC/jvsC1ikziZHaWLEcvaucSbxt3nPAwrOm6+S2bURsAwcLyvE
 ZkMU/7of3/QBsI+QuaAAAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1900;
 i=quic_bjorande@quicinc.com; h=from:subject:message-id;
 bh=pdAiPkmwix16zBI9UBTkevZJH1zCUnPSJHmIYiTo5OM=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBmUiNsKYEK5V8wbmb/GOzthe5vzq8ZIVFtkPEc0
 wyedNNY5wKJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZlIjbBUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcUIdhAA3xcTTXugYl5wVFwaGp8MskzlLIc/mfIOgxIVAOS
 z/MnBL1GMsM2x6h5XYErpwVu/fv1GYDz6YiBHwWm45NjjYo48OzUPtDfNhvELs+egs6yNcWj7e4
 a6zn4WZQY9Vb989s0Zug4jJGHBjQ06kWyBiJD6Qdl5SpdnsSpoG73EnmRB31gfEtYlZwCKarNYl
 y4QYaXFt/jDra9ar0wFqRnqrCzuucRBayUVK0Bc39e05dTDe/W5lui2FkztV63f5N3fW2BfU4fU
 eSQClCnRsaRJ/50F0rmH6UgSIqDJLy2Vu54giR9iCakaGt8ytscCVZx9Ol9MUMYmXTxWtxtTPFC
 6kysrgEZTMy2p32gyfCvMEglexQglmz+Tm2ojcpp4WxX/0wtqrp5D4UiCWy8Arew5+Qb0tOpivE
 3vQu7nydYD+XkhNvpFJsmTlVS+5pc357M9bEtz+CKTGd3O/k2N7iM4brrA+bdY3e/7HLH6CGZzx
 0c/5J94Rh7kq2BsJXicQhqfPgaZJJXL8ngG+arvmRIB17RbQ0Dxi0ogp3/+bjhSKbIjthj39Q4+
 bHnSvnEjY8docaXkPhQZdm5w2hSr2wQPIaY8vyuaLmh0duyD8UhmKcn9UaKvfICu9EdMbLq1mvU
 lH3bYtuB7hE1vw/smAvFgMwOAQNiyOpAVJHKVJK4+DZ0=
X-Developer-Key: i=quic_bjorande@quicinc.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5

From: Bjorn Andersson <quic_bjorande@quicinc.com>

Commit '74cf6675c35e ("arm64: dts: qcom: sc8180x: Fix LLCC reg
property")' transitioned the SC8180X LLCC node to describe each memory
region individually, but did not include all the regions.

The result is that Linux fails to find the last regions, so extend the
definition to cover all the blocks.

This also corrects the related DeviceTree validation error.

Fixes: 74cf6675c35e ("arm64: dts: qcom: sc8180x: Fix LLCC reg property")
Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index 067712310560..581a70c34fd2 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -2647,11 +2647,14 @@ usb_sec_dpphy: dp-phy@88ef200 {
 
 		system-cache-controller@9200000 {
 			compatible = "qcom,sc8180x-llcc";
-			reg = <0 0x09200000 0 0x50000>, <0 0x09280000 0 0x50000>,
-			      <0 0x09300000 0 0x50000>, <0 0x09380000 0 0x50000>,
-			      <0 0x09600000 0 0x50000>;
+			reg = <0 0x09200000 0 0x58000>, <0 0x09280000 0 0x58000>,
+			      <0 0x09300000 0 0x58000>, <0 0x09380000 0 0x58000>,
+			      <0 0x09400000 0 0x58000>, <0 0x09480000 0 0x58000>,
+			      <0 0x09500000 0 0x58000>, <0 0x09580000 0 0x58000>,
+			      <0 0x09600000 0 0x58000>;
 			reg-names = "llcc0_base", "llcc1_base", "llcc2_base",
-				    "llcc3_base", "llcc_broadcast_base";
+				    "llcc3_base", "llcc4_base", "llcc5_base",
+				    "llcc6_base", "llcc7_base",  "llcc_broadcast_base";
 			interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
 		};
 

---
base-commit: 3689b0ef08b70e4e03b82ebd37730a03a672853a
change-id: 20240525-sc8180x-llcc-reg-fixup-7762256e8e5e

Best regards,
-- 
Bjorn Andersson <quic_bjorande@quicinc.com>


