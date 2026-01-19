Return-Path: <linux-arm-msm+bounces-89629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 034F8D3A732
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 12:44:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 93CFF30F2CEA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 11:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63AE0314A8A;
	Mon, 19 Jan 2026 11:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="muErzuUG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4055F3148B3;
	Mon, 19 Jan 2026 11:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768822974; cv=none; b=mXOds3JxhwlQPX+dpv5GmgpM8/sgAa3cnrSovEj83n7FaAamTXyxz/sPj77f0o0XqewkjM8+W6INW1TLm2cjKF1WV9bZvyyc3mFWQwGJOYDZ5RgjWcSl4bTf5ZuvR8eV0GMbiRn3dX6vtpdPIJcD+sfQ5Kv5Pz8P88/sYHGXNn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768822974; c=relaxed/simple;
	bh=msjjeVVEXCIo7tX7DIw0WATS3piJKc8rVSrsxD3EY2U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lRYcIVIYfEDgozieFXDCRpkaah2Ka1cillHOyqzZxWK/DrxB5eAGFEIlNZscoBI+uO+U9Z0KPQPihdoNZbnNxEXtirysenhmvNKMTIIKSl4UQsBV0zR71A4X9bEEXsSDysXmJU1WOj6EN0++6pbU9ZxeDySQmGxZNCQ/2EP78yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=muErzuUG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47B7CC116C6;
	Mon, 19 Jan 2026 11:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768822973;
	bh=msjjeVVEXCIo7tX7DIw0WATS3piJKc8rVSrsxD3EY2U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=muErzuUGpHE2LxCgCfVlUx6L9etfZ38i4hSaPFLfXFayMo3AA1GxxDn/whSUCtlGV
	 6yfAT/z8CDt4YYObAJCz9r1uznbI1YQpyHsHZS26ogmnDD2hp8EOurtkfhm2oro1ak
	 bnxUJLxoO2zWpcqj7FCTN/8GtFEIvmixJOvtBrd3kWmAUCkLReqcqM7BgeMgKHXz5v
	 v8ilFsOj1gz+RsQYFkcPGwB/Ml3hw6vRNLz3DQla/KnVWnMJp2PefBJDUuAP8kEMjf
	 qkWsltrJsHBkWPQ58yu1PtBhUKjsl9EEQlRLzD+0S12y0wlbIE/C8z7JEPCeg8W9wI
	 pVv0X+5GYNMFw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 19 Jan 2026 12:42:26 +0100
Subject: [PATCH v2 04/10] arm64: dts: qcom: sc8280xp-gaokun3: Fix BT RFA
 supply name
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-topic-wcn6855_pmu_dtbdings-v2-4-6d1c75608bbb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768822946; l=946;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=72yub5UTSzLWMlyttbET2viSXeyaZzXB/odSIl/Fje4=;
 b=3/4wzGaEoN6gKN/czRtqqOjc2CERvlR0pfsDLpTT/kNsGNhF6yyCWaNmXfLrn6uCapXXUkxLu
 /lya0pPo1JzCvoZajUMJWkqczFg2QLRhCJeUdwNOnYwE6DDGjIiHle2
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Fix up the supply name to align with bindings.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
index 9819454abe13..f3c00be67081 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
@@ -1122,7 +1122,7 @@ bluetooth {
 		vddbtcmx-supply = <&vreg_pmu_btcmx_0p8>;
 		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
 		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
-		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
+		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
 
 		max-speed = <3200000>;
 	};

-- 
2.52.0


