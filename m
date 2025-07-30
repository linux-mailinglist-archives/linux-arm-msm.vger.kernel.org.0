Return-Path: <linux-arm-msm+bounces-67157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C02ECB16159
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 15:22:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01D8517B3BC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 13:22:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E6B42989A2;
	Wed, 30 Jul 2025 13:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BdEcX8LU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DA778F4E;
	Wed, 30 Jul 2025 13:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753881773; cv=none; b=X9uuQfVtEUWiZgTecUWWVxBtefWsrmBicA98IVRAXjjzepsXC5KfQOq9x5DxcE0fPGumSy9JWm6yHeF6t0xISW/HbdOPzoYDNa0BxCGFgOQw91jy4+L5KvJiMcEpdBdLDRmTUH+gFF4PWIFxJ/M1UQge/6/75elYlnNCrtBP0lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753881773; c=relaxed/simple;
	bh=Q3iDUAJTSaX8nRsvstx+mgRnQLOX9ppyrxzYW7PWT/g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OXuvjwGuQ579LMayoG99ySffmBA7oiyjTSFkooRLPRR3kuWYXJOgg0mUjUaVZ2kUfX1cKtnQPsCPOBVRwfrCMAVfoC1sX2OwrYIXJr64kEQtjndF3kHq57OFbLgyTlX11SvmRAsCTjYTFusRn7VsQIAMNhblqXdAIv9I2IO5Y6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BdEcX8LU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D124C4CEE7;
	Wed, 30 Jul 2025 13:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753881772;
	bh=Q3iDUAJTSaX8nRsvstx+mgRnQLOX9ppyrxzYW7PWT/g=;
	h=From:To:Cc:Subject:Date:From;
	b=BdEcX8LUiTHF4Q4LdKOAViqMAgHJnhSaWkslyziJOaj9Mj2ZMNQGWroy8p8D1ODP6
	 hoTmk8PV2stFs5YeLqrJ3juPOLFNuKZsfkiMpe7XugAlU5F9itrYolnppDVdB39PxS
	 5Kmdsr+aZD2uLfyVLr5VVjsnzlhnRCNvu0t9GIuxwCfp3C1/0Y1/eF2PWkDwy1dPZB
	 7w+CgAD8lVwK1pooBdkzWZjefL3Jt+rL7F8OJqQJiyskGef6tQA83Pmt/ZItZfZF5D
	 1Mst6f9CJ64ac9RMa6F+BK0k3ifmVPl9ruRqHLFm8BkZmYFjY8jCKN4b5j6GH4OfCW
	 5FwXTCAu84C6g==
From: Sumit Garg <sumit.garg@kernel.org>
To: linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: qcm2290: Add TCSR download mode address
Date: Wed, 30 Jul 2025 18:52:30 +0530
Message-ID: <20250730132230.247727-1-sumit.garg@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sumit Garg <sumit.garg@oss.qualcomm.com>

Allow configuration of download mode via qcom_scm driver via specifying
download mode register address in the TCSR space. It is especially useful
for a clean watchdog reset without entry into download mode.

The problem remained un-noticed until now since error reporting for
missing download mode configuration feature was explicitly suppressed.

Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcm2290.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index f49ac1c1f8a3..08eadec59882 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -154,6 +154,7 @@ scm: scm {
 			compatible = "qcom,scm-qcm2290", "qcom,scm";
 			clocks = <&rpmcc RPM_SMD_CE1_CLK>;
 			clock-names = "core";
+			qcom,dload-mode = <&tcsr_regs 0x13000>;
 			#reset-cells = <1>;
 			interconnects = <&system_noc MASTER_CRYPTO_CORE0 RPM_ALWAYS_TAG
 					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>;
-- 
2.48.1


