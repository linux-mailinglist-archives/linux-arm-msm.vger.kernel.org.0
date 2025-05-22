Return-Path: <linux-arm-msm+bounces-59152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C220DAC1790
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 01:20:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C03181C043FF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 23:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEEEC2D29CB;
	Thu, 22 May 2025 23:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KDCAhMsc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851FA2BF3C8;
	Thu, 22 May 2025 23:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747955943; cv=none; b=sv4VqGPiAHNiNn8Fkbkkq9Ijcy85LoNlIOELD6qc7ixFXY5UVvGOrZMU3nNvoYKB/g+DBRAFfLCYW+/yuDQK0YIxjshX9gEmGPBE61GVvG3HL6UAhefBwRQntVeThI0HopTaUATW/QepdI0TOe630f4Zwx813SGKVG6H1t+2/Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747955943; c=relaxed/simple;
	bh=GH2ilAbuv44tbnxAfMAtH3OzNfdRwE6axwbJib5XSts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HNeQh1WiHiYLJu7aKx3uxTZDdoMWqdxIbnanU80nVBKHz5UdKvFlFa+behrH4cepOiHKDA/ifzhlGxe3/Vb+aeOQ+lBjQkGXcMU8j9KU1tMHJwqrrFI6wE403gc9Tv+zic85ieZgNpE92atu6Qx+4bEi6y+N+7G/tZyaWDFD5RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KDCAhMsc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F15C1C4CEE4;
	Thu, 22 May 2025 23:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747955943;
	bh=GH2ilAbuv44tbnxAfMAtH3OzNfdRwE6axwbJib5XSts=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KDCAhMscu6V8aWbag/GqqNTEarROVGV+g+TQxSNQ1cfBWb4N16TDAEQLM9Tt4YQMD
	 3UbHezKExB1Qph+VjF9P9pnEFtk80is8EmkK95Dx1mKvWmUYMZJJULUCkX36teC1Fn
	 SBVoax4raL6RFHD06u0dN9aW0Ja7EEwjt9D7O3mnGDclsgJtm4AddiULoP/XrdDTIl
	 XquWPKpXQ6ipYwnXpwqfy17+ca4dIx30ZKCIR/x5JvdXPSXR4THjR5vQ7AdVRxgyqQ
	 FfrH8Uf5unH66F8O0wk1gFvWRDdeZZKvTTTtnXT/DbnFp2rbv6gVwqi8R1oOaNrwnl
	 BvugUHKB7zRxA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 23 May 2025 01:18:21 +0200
Subject: [PATCH 06/10] arm64: dts: qcom: sdm845: Explicitly describe the
 IPA IMEM slice
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250523-topic-ipa_mem_dts-v1-6-f7aa94fac1ab@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747955915; l=1038;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=jLj5IMcILd5ENVITD98B71LGwJoGWvDjHQe+2yrEa9w=;
 b=W0xGqV4fortjk9j9WvmVnNQYp7Q2Ewy/g/DMPASgrQm62gNKVhYV5N3pKCvlMzMGa7wMSyjUf
 f2Ty0Cqed3WCWIFCZ1AollSDYs7rln/pFtMp0wOPZQ1M/VRJLuu4n95
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

As part of stepping away from crazy hardcoding in the driver, move
define the slice explicitly and pass it to the IPA node.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 6ee97cfecc705c317164fbba8df426f6be52e932..eb49e18fba62755d56543b4bf3ecdd643a03a256 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2743,6 +2743,8 @@ ipa: ipa@1e40000 {
 			qcom,smem-state-names = "ipa-clock-enabled-valid",
 						"ipa-clock-enabled";
 
+			sram = <&ipa_modem_tables>;
+
 			status = "disabled";
 		};
 
@@ -5090,6 +5092,10 @@ sram@14680000 {
 
 			ranges = <0 0 0x14680000 0x40000>;
 
+			ipa_modem_tables: modem-tables@3d000 {
+				reg = <0x3d000 0x2000>;
+			};
+
 			pil-reloc@3f94c {
 				compatible = "qcom,pil-reloc-info";
 				reg = <0x3f94c 0xc8>;

-- 
2.49.0


