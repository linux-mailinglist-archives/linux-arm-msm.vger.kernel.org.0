Return-Path: <linux-arm-msm+bounces-59154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DECC0AC1796
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 01:20:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93FBB507554
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 23:20:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 458702D322A;
	Thu, 22 May 2025 23:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PeBYAQFx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A38B2D3212;
	Thu, 22 May 2025 23:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747955950; cv=none; b=Jo4xKqAv+HTSWVkjYqVh4rR4pF5UVfe6xNM2B0oAsQe4szbzqqmirNvadzT3d65Ci809iI2/4zeRFy9PW0NWyOTgw5PeO7TiQX1rs8Tfkjx+YGQUz8RgaNbQCQT7VwWL8Fad1YOr2LHQANiuyHMomJzENsGChg+6qVwcdw64q9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747955950; c=relaxed/simple;
	bh=eZ2YQRo4/jmCnAClPE8N3MomM+ccbN+fstlzYq1mWTY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qQk47GWTPUbb+NYdthV+9x0Hd0mmHaDbW0yUykzmfhrcMB5uOaGfkNP2RhrBHj80OhNfDPH//opVF5htd8od/6uHErWcKEbcDxiPgZ80+ixp0UJoynPz1By3IHSMjpPiGM591z8LeieWLu5nUGwg4e/tKwWXDqPkcliMAEDfUWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PeBYAQFx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28FA0C4CEEB;
	Thu, 22 May 2025 23:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747955950;
	bh=eZ2YQRo4/jmCnAClPE8N3MomM+ccbN+fstlzYq1mWTY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PeBYAQFxmwXYIpxj7e0bPJ4U04UTVZi/slZnr3LhwbZ9K7Hx9L9NSxHewDhbnNEKK
	 4l6bMoLA8LO5BPtWSIDagXGx+W53XSzI4HGIGTh5Ad7hBhms8Hr8geTVd22zKahQT8
	 8t2oYHb0kzV7qhsKQBNmK+HQCK7cJjlfst3wU48Mzf3yqTqNqf/D9F3nbiM5oi6D8P
	 l76s/icfh+w3MdItzHrk19LXuqqoMcPjPvochZeKYc/JxIBGjhmOMbbzCY+u5b6fsB
	 WRxcxx/59OSPHukpjOE7B0OfiDqvohKVonVkOXDn3yOiVcj11uTvTdZHZm7kC4zpdV
	 6OCcYokkqaJ1w==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 23 May 2025 01:18:23 +0200
Subject: [PATCH 08/10] arm64: dts: qcom: sm8350: Explicitly describe the
 IPA IMEM slice
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250523-topic-ipa_mem_dts-v1-8-f7aa94fac1ab@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747955915; l=1311;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=aXeXGdqVZZ9mVonnboAk5+g5gFAxE3lSOZZBKKItaD8=;
 b=iA+pq0Fv35Y/ni9epy3cHwL0C3Qb88OUJvOxEl/vpUMEMj1U28YG/RQZDk5QFaJY7Pfb18r4L
 wy3itT+oyN/CPT8f5rqIHjr6xTb3f4Cl+/kywt1XRuWmdrwV0DwZexv
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

As part of stepping away from crazy hardcoding in the driver, move
define the slice explicitly and pass it to the IPA node.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 971c828a7555885aa2f05647634eb7132333fb47..bbe225f339753a03a268b1089b4c35a1a1107cb2 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -1862,6 +1862,8 @@ ipa: ipa@1e40000 {
 			qcom,smem-state-names = "ipa-clock-enabled-valid",
 						"ipa-clock-enabled";
 
+			sram = <&ipa_modem_tables>;
+
 			status = "disabled";
 		};
 
@@ -3432,6 +3434,20 @@ qup_i2c19_default: qup-i2c19-default-state {
 			};
 		};
 
+		sram@14680000 {
+			compatible = "qcom,sm8350-imem", "syscon", "simple-mfd";
+			reg = <0 0x14680000 0 0x40000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ranges = <0 0 0x14680000 0x40000>;
+
+			ipa_modem_tables: modem-tables@3d000 {
+				reg = <0x3d000 0x2000>;
+			};
+		};
+
 		apps_smmu: iommu@15000000 {
 			compatible = "qcom,sm8350-smmu-500", "arm,mmu-500";
 			reg = <0 0x15000000 0 0x100000>;

-- 
2.49.0


