Return-Path: <linux-arm-msm+bounces-81135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C009EC48E93
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 20:11:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1B5B42335A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 19:04:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 515B23396FE;
	Mon, 10 Nov 2025 18:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="bKj5VvpT";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="fhyeLeEn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11243396F2;
	Mon, 10 Nov 2025 18:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762800915; cv=none; b=tr3BbTsHfQ23feXG8ze6WEfjdcULZe6SFLc4oTJzvCJ98b5XhJ0j7hm0i2nkBxkeG5No1L2axEEpk4ZQSOHAGWnjMSHwej8G8y6C6ZK3DbWCu+0VVgNAI0oQxWUG/6m1RvGotIb8Pa4AN6nlChw1d6rhEWFc8iZFbPu7iiOnMD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762800915; c=relaxed/simple;
	bh=0O6roTJVZf9NDxUu54FldHv7deAy7idU52GZoKcusFk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KkgUX8ERIskYeECsfJnxfaj/rgCxKD4z8En5FmAjk/jHv0tL4zdWHZuY/t3VdKdPWLzUKcLLUCwQJa++/TMYsWns9TNx1ilUpiSm+rYs/fxAb0b78NaPJ6cYj8Qz/ea18gWgsf5ZpL3GZY9AmGJd9seoWSRdxSqmcfbJQOp5zZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=bKj5VvpT; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=fhyeLeEn; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1762800911; bh=cM8U8uuTzdlKA7Xhq7Pjgvy
	4K1WQA1TseyC25fxE+Rc=; b=bKj5VvpTP8xQxtLyVSPGyuBl7gXTYsh5YHXN6tWXftFHeXzjgN
	QmSGH7YWzbJBRqGx6DLXGOy34u0m/PqjkPtR+1knq/CWQ0hcLkHmRVADacguVy1WgSNgpwzldeL
	gjPJ5lgEqf3iYelBvR4gd8Z1KKgzKK0Ty5jasO0goGF/XUfLk63UmP9hTha4QbtUx0pkq7km2fm
	00eGet13LWqAQoe18K4H1qPhujfpshXeWeoEYV9lgwdOw6GYcb1KS4MX+j7cId7K2mvxotngnY4
	dGHfIVIIc4V09tbE17m6NU4egJKIPmP/ckiE5N3hDKU3QOrXGsZ1EwA9oyMAlQP4Fbw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1762800911; bh=cM8U8uuTzdlKA7Xhq7Pjgvy
	4K1WQA1TseyC25fxE+Rc=; b=fhyeLeEnHeC2sBv0jmbF9fS6YL6E4LUSDTZUyaO1OhDeReqOO6
	14m6xKhbYJZodWecLFaqOrw8pY9DdluutXCg==;
From: Nickolay Goppen <setotau@mainlining.org>
Date: Mon, 10 Nov 2025 21:55:07 +0300
Subject: [PATCH v3 2/3] arm64: dts: qcom: sdm630: Add missing vote clock
 and GDSC to lpass_smmu
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-qcom-sdm660-cdsp-adsp-dts-v3-2-d1f1c86e2e6d@mainlining.org>
References: <20251110-qcom-sdm660-cdsp-adsp-dts-v3-0-d1f1c86e2e6d@mainlining.org>
In-Reply-To: <20251110-qcom-sdm660-cdsp-adsp-dts-v3-0-d1f1c86e2e6d@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux@mainlining.org, Nickolay Goppen <setotau@mainlining.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762800909; l=935;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=0O6roTJVZf9NDxUu54FldHv7deAy7idU52GZoKcusFk=;
 b=vgPDoqbK2oqyg3O2L0sVBWj0qLVT4hGW4l621T0Vbwv+qiqra5dEUC9dPJ6dYH08DTlDLuDJV
 UtRzaNfWO1gDowvsE4MtqlyyYstYjqG8FOT83C9NLRcBZbaLhysL6VY
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=

Add missing vote clock and GDSC to lpass_smmu node to make sure the
required resources are enabled before attempting to access the hardware.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index a6a1933229b9..f4906ee3f0c3 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1217,6 +1217,11 @@ lpass_smmu: iommu@5100000 {
 			reg = <0x05100000 0x40000>;
 			#iommu-cells = <1>;
 
+			clocks = <&gcc GCC_HLOS1_VOTE_LPASS_ADSP_SMMU_CLK>;
+			clock-names = "bus";
+
+			power-domains = <&gcc HLOS1_VOTE_LPASS_ADSP_GDSC>;
+
 			#global-interrupts = <2>;
 			interrupts =
 				<GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>,

-- 
2.51.2


