Return-Path: <linux-arm-msm+bounces-89630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B03D3A73B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 12:46:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 46607309186C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 11:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6775D314A8A;
	Mon, 19 Jan 2026 11:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KHaxZMRx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C6A313551;
	Mon, 19 Jan 2026 11:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768822979; cv=none; b=NfuZM638WcskTH60jteNuuG28yeqHTNJ/wls/t0BeUw3v+fhQRRnUoSvZemEPaJwQ3E+DrlK6jJbdnzH84XEhm2yISXjR/iYjRJ58WW4tVq1aIDauE459h4INx038ywUzE4bcBVDREN+IpDRTF1gqV+SWLO0AOmk2YGAt7C3WIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768822979; c=relaxed/simple;
	bh=a+XnINu1If+1qZZ2ueJpWhvrHaPLUO1jcqezn7ogPNs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K8p+h3d1maQ+WtT2p8quKQNMRyLM8Cv960NsEAzIEiJb+8AWCZvYh5PYsK2e2AF0KKsoXDxMMZnwOyOPgweSFBURLKqqp7v8u1Rlk1TV2ADIv99+11Fv0IVaWWAXgfNBBsi00xDS+t5I2LtCXzrEDaIyaXjWJTvOPPgKl8stE28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KHaxZMRx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63FECC116C6;
	Mon, 19 Jan 2026 11:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768822979;
	bh=a+XnINu1If+1qZZ2ueJpWhvrHaPLUO1jcqezn7ogPNs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KHaxZMRxN4MoOBMU9kUG/no7/B9xn9ztLo6ctF54OeIU5wXxrnS0h9ySb/SQmB3Z2
	 vj7ccVX6AfSgu1438xsSnLxvJA79pXQDHO/0mDVZOiQ11hb53Ul6pkN/4xxHVNWykf
	 yMASR+nWo7VFCK9+69+Z/KxK1TYxKRx/sD61Th3/0aqo/DgdSMy+Oc+eETEA2CwFT3
	 lJLcpIjoXGuSOb4snX3CBXxUwbfAn0NksqEVDQ/RtQn3mquajZjZV5+uVM7KlTqRzV
	 2pdKCx+PfhGxdBGEcf/klgz+SVnUFMFopw5066EYuJvBWcVlLOlxS1QzBYYIKBj1ew
	 mAs3zwKOd2zNQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 19 Jan 2026 12:42:27 +0100
Subject: [PATCH v2 05/10] arm64: dts: qcom: sc8280xp-x13s: Fix BT RFA
 supply name
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-topic-wcn6855_pmu_dtbdings-v2-5-6d1c75608bbb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768822946; l=976;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=9GCz88hUbhXE6xSvyYqCDhxEuOu/NqDetb5F3xkdqKg=;
 b=XZKflV8rJWSzRWkEeHEw2vTgjisFT3LCHYbs/kTCZSWwz6w5fIDlY7kQuMU+c95Bu4+7nKWMQ
 JTC3ANRfB5vCbPEV823FuaeSOBNZgGB4Dq9opXF1uAk6V8LfwHdFFTb
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Fix up the supply name to align with bindings.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index d84ca010ab9d..abd9c5a67b9f 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -1331,7 +1331,7 @@ bluetooth {
 		vddbtcmx-supply = <&vreg_pmu_btcmx_0p8>;
 		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
 		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
-		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
+		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
 
 		max-speed = <3200000>;
 	};

-- 
2.52.0


