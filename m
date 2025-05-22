Return-Path: <linux-arm-msm+bounces-59148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FA4AC177F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 01:19:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 015E03BB5C9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 23:18:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14B3C2D1907;
	Thu, 22 May 2025 23:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KYKRsGHQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE21B2D0274;
	Thu, 22 May 2025 23:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747955928; cv=none; b=LrjYLKX9K/hHGNS8LfVMkmHARJZzmMmwedpVXjl7zZQOaqLO4ahxdDayyMmJFY+u2WGLE++BI/2O9981KdtHLKBxnKSG7KMZhFTCzS2oRSNk5LUasf22Gj8THQYVucN5ZxpByfzVtEbbdMl0Sess8acJijoBTPzMACs2iuKfrWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747955928; c=relaxed/simple;
	bh=cljpzgrUAphxWUQd8wvpZ5v86B6plZSwwrDh0I2VmOk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i+ygbTZjvZt+zQncH84Xq2xcAa2Ot/iUIkbL1quJjugwr/XS+h6QDVITxV8DIpRN0c2evezJb40X4rYalH2PVEcaoVLP9pzaSGTtuMoXJFCYzmzW60Eh9/VZkTQw3p5hCB/m+h9bUhbVMywv5vWnRPXQrAODYVyYq8qImtokn2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KYKRsGHQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04070C4CEE4;
	Thu, 22 May 2025 23:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747955927;
	bh=cljpzgrUAphxWUQd8wvpZ5v86B6plZSwwrDh0I2VmOk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KYKRsGHQXgcph4iK/AUTibVTVEzzn6q2iX6OsRDnK5o4jNISgMFafBA6n2jONLJlX
	 dfVOzpHJhikoQEQguk9Jbys3AvidBErMrA9AcMha3UPrGkiYyoMNGdDEVe7EJy050+
	 Vm+S0WWp+FWSVPZ2iK0RxrtjPcQWBFFA6ggDF8fycDZbyUjIpPKjSIpXlC34inp+NP
	 3arD7B/fUGYcOLYhFGs2TKFPycHmJUsf+xLwYs+sTZAbOAQ69ZimXOC/5Ac28/1BOz
	 kxxGZ9ubOQfeUPlRzbKXZFOHbQiGiah1tnd7/Ilg2Qr3Kb1UXz8SR2IIRaBFuMbNjh
	 tMjxctthOTamQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 23 May 2025 01:18:17 +0200
Subject: [PATCH 02/10] arm64: dts: qcom: sdm845: Expand IMEM region
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250523-topic-ipa_mem_dts-v1-2-f7aa94fac1ab@oss.qualcomm.com>
References: <20250523-topic-ipa_mem_dts-v1-0-f7aa94fac1ab@oss.qualcomm.com>
In-Reply-To: <20250523-topic-ipa_mem_dts-v1-0-f7aa94fac1ab@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747955915; l=1121;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=Pca0h17rj28kTvQfVXm8W+/7T+7P9D1aXb9Xp5hxauA=;
 b=WhWy+zRuNwts3fc5aCxT6Qcw2RFCGeCBMSyznCJ1SUlL8p5VhNwJmogHL68t04xNKnxJrxwvn
 OVsaHB8NjVuCc2nVLPA9VcafCcwhZ3k9Xjl04sjAX8NnqPELTM42Y7N
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

We need more than what is currently described, expand the region to its
actual boundaries.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 3bc8471c658bda987d6fcff3359d63b367148e89..6ee97cfecc705c317164fbba8df426f6be52e932 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -5081,18 +5081,18 @@ spmi_bus: spmi@c440000 {
 			#interrupt-cells = <4>;
 		};
 
-		sram@146bf000 {
+		sram@14680000 {
 			compatible = "qcom,sdm845-imem", "syscon", "simple-mfd";
-			reg = <0 0x146bf000 0 0x1000>;
+			reg = <0 0x14680000 0 0x40000>;
 
 			#address-cells = <1>;
 			#size-cells = <1>;
 
-			ranges = <0 0 0x146bf000 0x1000>;
+			ranges = <0 0 0x14680000 0x40000>;
 
-			pil-reloc@94c {
+			pil-reloc@3f94c {
 				compatible = "qcom,pil-reloc-info";
-				reg = <0x94c 0xc8>;
+				reg = <0x3f94c 0xc8>;
 			};
 		};
 

-- 
2.49.0


