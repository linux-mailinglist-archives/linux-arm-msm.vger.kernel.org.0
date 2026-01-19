Return-Path: <linux-arm-msm+bounces-89628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BE9D3A72E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 12:44:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 70BBC30D0327
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 11:42:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6233314A8A;
	Mon, 19 Jan 2026 11:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VD+Q/qBu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B193148C9;
	Mon, 19 Jan 2026 11:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768822970; cv=none; b=bcAKV3/YcCKU8givjKqaxlP0yEnQtGoPADDs+IU8riH1kb7Ya2cpUZ0vuYifpj9CZZAFT4mRV5UAp8Mw+C+GkhLxsFSQqDEjQmfvhbOaHpw62PUVFwVcXMYpau8ePCAc2VhpPoSx9PxlJ3kyMq5glV0hBThhjQUbByIMv2SbBSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768822970; c=relaxed/simple;
	bh=4ziTrv0BhCf/ZaQhqAksHS49BH++pnpUVfS9E3/VrOs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NX6ZVsrLXKRKNWQovBHR+gCHRusLNNFclUcch5sbiNu9cL0glAGS8PiDmlkq+3i33unxiR7RLKOi/HGwrLYN+ZjLRj792Pg3b+L0sxF4yPB6cgchzlG5WPEve9C/QzK69sGUXfPINW7b9amgeZF+5rRPG19yfKuS92fiwB1F7Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VD+Q/qBu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C8D1C19423;
	Mon, 19 Jan 2026 11:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768822968;
	bh=4ziTrv0BhCf/ZaQhqAksHS49BH++pnpUVfS9E3/VrOs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VD+Q/qBujyPoFv2EkZdMFi12wCo7RT/CVsYupgjp0ff+KmWTEvWRjd3XwapYkCmUU
	 C0SYO14ivtcStELLnqBtHiWkIIB7eoS8ps53dhM84MW7daZqKG/VjI8PTO2kRiUH76
	 jcnzr3FH1dHVLhRV9R0PICzMeDeBvicF/7fiIH/Nn4TvyXv56XTHtUHAIxfmXAdIQr
	 ofmGWvjy5VW8ZNQkTZp+X9T9WQiGu+PiBBjmJIMPos4EGWCYCBg0umx9ZWQWOTNG5N
	 UKPeWIRgoQVHhyO8uxPeau9pcYR6DioyKgGBjMJGJY32Sqw5Q1htpVG8S60mHNTzhv
	 SObMv14OWFGjw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 19 Jan 2026 12:42:25 +0100
Subject: [PATCH v2 03/10] arm64: dts: qcom: sc8280xp-crd: Fix BT RFA supply
 name
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-topic-wcn6855_pmu_dtbdings-v2-3-6d1c75608bbb@oss.qualcomm.com>
References: <20260119-topic-wcn6855_pmu_dtbdings-v2-0-6d1c75608bbb@oss.qualcomm.com>
In-Reply-To: <20260119-topic-wcn6855_pmu_dtbdings-v2-0-6d1c75608bbb@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, 
 linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768822946; l=867;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=9pVGXf2/LzRYZqj57GMH8y8IxyPm4lbiOV1foCfTrjc=;
 b=cX6NKlSZgZ5vaB9aWv+tVBF74O0PfchER8dU7vBtcGOjiJoSspAbx4kox9JBm6X9Rbr8VTnSb
 /HehgAYaAe2D8SY8HaEgxrVEFOHhHH8qUfHCxrFpTnWkKvl2Knr5rqj
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Fix up the supply name to align with bindings.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
index c53e00cae465..dcdeefd28728 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
@@ -787,7 +787,7 @@ bluetooth {
 		vddbtcmx-supply = <&vreg_pmu_btcmx_0p8>;
 		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
 		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
-		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
+		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
 	};
 };
 

-- 
2.52.0


