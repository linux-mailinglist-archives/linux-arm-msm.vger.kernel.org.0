Return-Path: <linux-arm-msm+bounces-89631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25524D3A73D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 12:46:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 01F03309283A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 11:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB6A6314B64;
	Mon, 19 Jan 2026 11:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZxW9sjdN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A111D5147;
	Mon, 19 Jan 2026 11:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768822984; cv=none; b=FL/epfyWtFrlV8RnTPH3bVSpGF60CuoAj6nSBBvZ6xtQwXfExQfBfgEpKDHSkY3uKDPLjaTgbNIm5vd0mcVJX30/nDSOohAdFfyC+jzMCoNpVPRQaPOY33g1AQ5Y1PvIk4smon1KOnzHPotidLih3CWN+Vuz2iA/U1wHD2K/5WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768822984; c=relaxed/simple;
	bh=JdzZ2so5m1Kp/4uQEOiKTIjKfmWJxzrOcgZXJ7y15CA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M03wqPzh2dJEE1pOG3wVCXAJWhNEJxuigtKKzQg56nW4WPXt2OcRpMP6KW4snZ27mAfmTXT8eX3ylckrdk9mdU4gLzc+N7Dl6v12bBrBpq82hlVWDOuHDdcKx4Z5aMofZ6T3F7ehv49g7jaIQYpOBbeDa4wDdvIl2pcsxSJQZ/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZxW9sjdN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FE55C19423;
	Mon, 19 Jan 2026 11:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768822984;
	bh=JdzZ2so5m1Kp/4uQEOiKTIjKfmWJxzrOcgZXJ7y15CA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZxW9sjdNzorIc6WvBDPDKFF+54IeCqEzGm7oh98IScDqzgKdqrqCWOjm5vTXDe4oS
	 owVBAGVLSHrW+74YiWAEL2kcEx1z+AliUxcxykzgRJk8GNsI3zMAA2TL9536S8R3F3
	 cr/lMlD2+OAmKHQhmOCRlzWJP6P0znhAgSg/g+Yzk+xUWRTKhbVbrVjwpLopMmC+ID
	 k/mFq9AJHNb+uWcUuyqN4vi/bO56tifGV/pduEkBkuarYxAcy/xylLrX88KnCiIW2T
	 OWD8jaBk63f9aM5kqkFwOKNHsnpc6jCVDAFXzLHYrWWlkMbC0PAI+4wvtx02IkXW6f
	 nr524NyagIdmQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 19 Jan 2026 12:42:28 +0100
Subject: [PATCH v2 06/10] arm64: dts: qcom: sc8280xp-blackrock: Fix BT RFA
 supply name
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-topic-wcn6855_pmu_dtbdings-v2-6-6d1c75608bbb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768822946; l=969;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=JZUUmTYRIqhyG9ISflU48nVaIHi5Ct7zrRtTW6pQmX4=;
 b=U9oW0kzJWh5HN38qWcSLmcyb+GaPW5QojC6o8QqnV3bmhEyTls/z92mQkbHCAK498WDKNL51d
 npn7jPokX0xAA8R99ke++L4qDKgUb7dlMxca6VuLYF9LZ3wTjFgTAD0
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Fix up the supply name to align with bindings.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
index 00bbeeef6f14..125af356e24b 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
@@ -976,7 +976,7 @@ bluetooth {
 		vddbtcmx-supply = <&vreg_pmu_btcmx_0p8>;
 		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
 		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
-		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
+		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
 
 		max-speed = <3200000>;
 	};

-- 
2.52.0


