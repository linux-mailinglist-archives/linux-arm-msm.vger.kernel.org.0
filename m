Return-Path: <linux-arm-msm+bounces-59149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9E7AC1782
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 01:19:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD163A264CC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 23:19:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85C652D1924;
	Thu, 22 May 2025 23:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VyNCwzcq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581092D0274;
	Thu, 22 May 2025 23:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747955932; cv=none; b=bDdnjNyLfyC3vE1dA8ZVQqtFdws4yB2ntUKeLbXmUvQnr24QlL4xOviJfyJSCtviGu/nBM6vC0MZVQPVjT8NtdzOHWiyOLBaWCyC9cGgolbmt6Pbad0zY9ZMFc20UOOTa+p0NcqIwynXYMRu8xw9tHyERc6teXMNOWNFijCldQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747955932; c=relaxed/simple;
	bh=ginZTtIF7VJgwzazMzzhlqOOljqD9F+5OGirjZZLI4M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G0Wq6Iu82XKf31Pt3qquEfqio9XacWRLBqlZTmdy2v1t/ahKRDx6EKrafSmBt08emNDIYrIAAZpWR3rD9jKevtqhWCSaWtPfBNk21qz89MjO1moYVpmOxINcuWSyHvKcGMzdBEQ/U0Dhvv40QXtOsKHW2N2RHHC3z+rmb9ZcEbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VyNCwzcq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 024D2C4CEEB;
	Thu, 22 May 2025 23:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747955931;
	bh=ginZTtIF7VJgwzazMzzhlqOOljqD9F+5OGirjZZLI4M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VyNCwzcqjXOAtsb8nrxGTo1WQaabb+tqqMYn2uOzm8AdB1q05rbuyfe9qJrjszpDS
	 EutjDGwSEO3UxAXWnTZavnCfMLBufi7jwLnNGFyUbTg1Tn2aZ/2htBvjpDnzlNPA+n
	 9mWP2Z3OW6U730GOFPaomJj6W30D1FFqRxUbhLybf4XCZEwKDUSePszxWC2Cq+9xTq
	 CoGg13POkZzR7uEhA9tx8ecXXA4eZcHdwxh02VAvLiskyg+YsMJdOTbjB4wkDqIirA
	 5bz8eW5knkh9UNuDkQJM/2okyjo3G693zaZ0mu9l1koipJLlGdrqmtM9Op2d7QP2yx
	 lslV2w7292zlg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 23 May 2025 01:18:18 +0200
Subject: [PATCH 03/10] arm64: dts: qcom: sc7180: Expand IMEM region
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250523-topic-ipa_mem_dts-v1-3-f7aa94fac1ab@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747955915; l=1202;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=3qbo7vnWbRqxFyv3cNegM3C+eMyJyX5pJjBklNldrIY=;
 b=s446Z4YJIQQmJAOG+2wJF6YrFL8ekbumgjv2w8upNfl9DrkXX9qBR0F9HNmEow1qXeSjXNqku
 42ZQxdXLpRJBHoRG5g0ZKvNSdsZ0dHxGEi28M4Ni7+hJISKXyb3jjiQ
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

We need more than what is currently described, expand the region to its
actual boundaries.

Fixes: ede638c42c82 ("arm64: dts: qcom: sc7180: Add IMEM and pil info regions")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 01e727b021ec587f7b3384f7301620a21ddef281..3afb69921be363bd35a996bc1d6f70ff007c6af8 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -3526,18 +3526,18 @@ spmi_bus: spmi@c440000 {
 			#interrupt-cells = <4>;
 		};
 
-		sram@146aa000 {
+		sram@14680000 {
 			compatible = "qcom,sc7180-imem", "syscon", "simple-mfd";
-			reg = <0 0x146aa000 0 0x2000>;
+			reg = <0 0x14680000 0 0x2e000>;
 
 			#address-cells = <1>;
 			#size-cells = <1>;
 
-			ranges = <0 0 0x146aa000 0x2000>;
+			ranges = <0 0 0x14680000 0x2e000>;
 
-			pil-reloc@94c {
+			pil-reloc@2a94c {
 				compatible = "qcom,pil-reloc-info";
-				reg = <0x94c 0xc8>;
+				reg = <0x2a94c 0xc8>;
 			};
 		};
 

-- 
2.49.0


