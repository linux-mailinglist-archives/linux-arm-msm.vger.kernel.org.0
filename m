Return-Path: <linux-arm-msm+bounces-59151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6341BAC178A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 01:19:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D61CF7ADCED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 23:18:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B471A2D1F73;
	Thu, 22 May 2025 23:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nZUn5JwS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B6D2D1F6C;
	Thu, 22 May 2025 23:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747955939; cv=none; b=t+53c/xr1cOqxd3T0b+x9+PZZ/rinkI6GCqS791Ibq18E/uXoKhMzkyZ6BtXDJde8uSNQN9CnbYRvDTlEcnu0cSf/ejSfToa53ApQqeB+msv0W7oSGd+PTtU+4Z1gibH9lCp3/LQEdvb5QFJE4lXcTPB3JgEtgP0G7qLeL2zOuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747955939; c=relaxed/simple;
	bh=65fvrH1jpuv0PVgKVY1trNZIhia0VFFGf3dohgW+IHs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dK/e0D9kN4/5l/iDqb4mZg1Ku4QAOV4wFFHdQgvL04WdLwvXy9NNscRFv5giRYPIgBq+/5LnP0fQPOoAm9Z5P6+y6t0uh2PNny/6S8ERhFK1WCo9oWnov0/OKVhlY1Sq1F+6B2YKz4pH1s/TGUz/78lcrR5doldPSOWiLXC3K+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nZUn5JwS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 185CAC4CEEB;
	Thu, 22 May 2025 23:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747955939;
	bh=65fvrH1jpuv0PVgKVY1trNZIhia0VFFGf3dohgW+IHs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nZUn5JwSfpdJMLQ2k2UkB2JtK+k4QlvtkY9W7xHR3DhuDlBYGYiQhY8R+PT4+R3bk
	 EG0ZLzVcxGcevYZU45m7StGGK61oVywOY4w7OHZRLSj43weJSKVlhwGmRgzpwsEm1T
	 SIH4CvYUYeuO2XBo7I6kBAiSIOhndUe47tTZB9dWKryaOJnGFkMXw0wtu5JduCWA9W
	 w/P4XR36n5OlPW1dRtgLj7rvhGYtKCfASMBBJ2dy5XEx+eZCSlnkIDNXPqO3CZ9VVQ
	 26EOvPMlKb8KSWOfwDJr8MDmeGwzbe6FUSdLXpM4S9UsF9gBBC2VGYe/4FIXn7YpGF
	 oNMdatIxByzpQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 23 May 2025 01:18:20 +0200
Subject: [PATCH 05/10] arm64: dts: qcom: sc7280: Explicitly describe the
 IPA IMEM slice
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250523-topic-ipa_mem_dts-v1-5-f7aa94fac1ab@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747955915; l=1033;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=DxsOXzqqYNUsUv5sPk1fyCpPgz93x4XkX+izTZm4UTM=;
 b=R++y9pwGi0RdVN50JrXcpuOKnqbkjp5UAoTTnvyF4WeGjGCYkkpKs5cgljNLDcXhQphgEu912
 pXGcVeK9dKBDB4QtFYsZp+qu8gY52HT1tc9kQHCK5zPLm/dR43Qe1j5
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

As part of stepping away from crazy hardcoding in the driver, move
define the slice explicitly and pass it to the IPA node.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index b1cc3bc1aec8b769021cdc25c8d66845e7bebe70..3df93a256a18e5500f3278d96be5ff5ba57c73b9 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2499,6 +2499,8 @@ ipa: ipa@1e40000 {
 			qcom,smem-state-names = "ipa-clock-enabled-valid",
 						"ipa-clock-enabled";
 
+			sram = <&ipa_modem_tables>;
+
 			status = "disabled";
 		};
 
@@ -6022,6 +6024,10 @@ sram@146a5000 {
 
 			ranges = <0 0 0x146a5000 0x6000>;
 
+			ipa_modem_tables: modem-tables@3000 {
+				reg = <0x3000 0x2000>;
+			};
+
 			pil-reloc@594c {
 				compatible = "qcom,pil-reloc-info";
 				reg = <0x594c 0xc8>;

-- 
2.49.0


