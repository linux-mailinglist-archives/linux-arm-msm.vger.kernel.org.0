Return-Path: <linux-arm-msm+bounces-52572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C4AA72852
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 02:51:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4432884030E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 01:48:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38B8B188CCA;
	Thu, 27 Mar 2025 01:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KyYB3JqC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED0370825;
	Thu, 27 Mar 2025 01:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743040066; cv=none; b=DjEDCzFAtGemMcIT4eBugecua8aqcLX5KHLseXp6gjK5qhBf6CKKGUY0IWTpt1M87XGueeIQoia4Jwb85MSdMvK8V9Vf/4+BurnDkgq9zN/l8Scijx+cZuObXA+r6h6ZSh4NCDiwJaZHFDDiWGUiHd0x90F5FHw9Qb1Ua7RmikA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743040066; c=relaxed/simple;
	bh=dPrFE5hWZYEv6X7tsf1lHTv46qY5W9IsgImRQpafaYI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DNlKFOvI94s8gP91yEZAN8Re6FlSGpsgwJUV5CNeZfUGPFpzy8HWTfMCE4mbv+Up8mnXc7igSlpkXjoy9t1FW3VenclUJas4Gk8jTMgqq9LEi8PMkJZQx9PrA6NimqA1RFdG5s+JpI/G7FW9gyEFkHRnmz2UfJFRfxH4za2qibk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KyYB3JqC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FB3DC4CEE8;
	Thu, 27 Mar 2025 01:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743040064;
	bh=dPrFE5hWZYEv6X7tsf1lHTv46qY5W9IsgImRQpafaYI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KyYB3JqCR3AoOcwUXFo/s1Ml/u1HPbwA+kAJEquTkyXp0a7t7swO8Rf6s90Hbw0RN
	 l/wMikETXShWeZQGjqhimuQpf4g1y90Ejj12/HzZou9NFd491rrC8la/eRiRoda7xo
	 tTU19esRQWfU3hIdKXROKjkk1ry1CMi8we3y878lV10wDKOHSlKZTlNsCWMPKPOY38
	 SG+/xqS7N8POlzGIqbWhq9GOzg4i+TopjxNrWttYhHYfpZx8/GPi7vJSfyP4RAbYKw
	 uRvZ94MOyizSt7YWymiHWQxNzT8DNyE1g3Xec+emOpy4B4hplST/Oro5FpSv86yNW9
	 F/Z3Yyc3dnqpw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 27 Mar 2025 02:47:08 +0100
Subject: [PATCH v2 06/12] arm64: dts: qcom: msm8998-fxtec: Add QUSB2PHY VDD
 supply
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-topic-more_dt_bindings_fixes-v2-6-b763d958545f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743040027; l=995;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=kVAhX660mADSKQRi2xVdD9uzR4NfE1uATZu/CG9g4QE=;
 b=0PmNl0yMUjnBOo8u3e9J5LgQW7USXoC08rM9SUHpwpDKvJdKF6ujq/CpD88xN7lbRlmQt/6Eh
 SHLpaReT3ioAz0vOwZcJPz0hj5TsifH6lWNsMF5CRBjDOGhuHz1zk+r
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Set the supply as required by bindings, to silence the warning:

'vdd-supply' is a required property

The value is inferred from MTP schematics, but it shouldn't change
between boards due to specific electrical characteristics.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts b/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts
index f1ceaedd9520c13df0f6cf086907b355264ddc80..f5558495cb02e44597591331d5d28a488b120204 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts
+++ b/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts
@@ -372,6 +372,7 @@ &pm8998_resin {
 &qusb2phy {
 	status = "okay";
 
+	vdd-supply = <&vreg_l1a_0p875>;
 	vdda-pll-supply = <&vreg_l12a_1p8>;
 	vdda-phy-dpdm-supply = <&vreg_l24a_3p075>;
 };

-- 
2.49.0


