Return-Path: <linux-arm-msm+bounces-89632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 258CBD3A744
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 12:47:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0ED0D3099B19
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 11:43:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87994314A6D;
	Mon, 19 Jan 2026 11:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R/DySbuX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641453148C8;
	Mon, 19 Jan 2026 11:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768822990; cv=none; b=j8xpJwe0DmWne6odTUIp5/695MGJFQU8i/IJ6nyDlXVFi3Wvqs5+ns8Ksb4uX4xZ5PFPVkxbClAZ/ZAgW7P8Cky5x5rh0qzuY8LLCAWDSQnhe6VRVLSPhHcz3D67xVovDeHQveLsCde2tnkfbp484+rwrGyN2QaXZRW4iJaVREg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768822990; c=relaxed/simple;
	bh=30CVy2j/KexHedSZo+5OhPipNm1gzEguKrcScKnwcOs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a8+87a0M1s5ggpJt5gaiG1aHLYNLeqp0rF3M4TJWKTdIHCSXaiFwq5vp/ZWssVkh7DKhudjG4pfUW/gjNv0ydOEoD51uuFmMay5Jpwq6E4oGdtOoAQE0J2JQ6Uz4P7j6LfMNo/BO9mP9W7cWmwaWe6ADhr1TAQcg/aH+ni59IbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R/DySbuX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0FACC19423;
	Mon, 19 Jan 2026 11:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768822990;
	bh=30CVy2j/KexHedSZo+5OhPipNm1gzEguKrcScKnwcOs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=R/DySbuXW6jTSkz9vWRjlN5IHlr/483DgGhC9vVd94pba7Y6dsZGd5Qh63oMfhgfY
	 diLnIkNDmBjuN0mDT80rRa8+NKcBoyFi8Sc6Qm8jyiRE+Vv+fFmlkXi+pPlUgxrTUU
	 LrUy5osO0S9oNVm0NC9PzJFSwvNAAfHpNceWsZNMMUR+WvhXTeSJ0v+edHDg018zab
	 QyG7glwpegOptkwuBgBwgKY24grqHdx2aEBovKyVbeGsQ1o/OIFpUxJyaufUg7xNSq
	 LSHN/6Izg2DYG38PrnOa4UTOoa04sgAZr5rzXPVHIKY4XLYW6chLGqtNYTWlKslDn2
	 U4s8vVf1EpbVw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 19 Jan 2026 12:42:29 +0100
Subject: [PATCH v2 07/10] arm64: dts: qcom: sm8450-hdk: Fix BT RFA supply
 name
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-topic-wcn6855_pmu_dtbdings-v2-7-6d1c75608bbb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768822946; l=859;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=56fEGVg3EtoGifmcV1LY6q/KJAGhM2yU9lpPpEuXszU=;
 b=0e6rUEGmmK84lPNEQphLwoOCtNqn6gUMdc83lpj2q03P3riYy11qmMvHl5GXp8hi7w46hZ14q
 T2QdEzOsVoTAEMSnhUFYy5LbU4WiNQ81Z+8App6H9Z18L9b/p2mtWqf
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Fix up the supply name to align with bindings.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index 268ae0cd642a..b37998cd9a2c 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
@@ -1172,7 +1172,7 @@ bluetooth {
 		vddbtcmx-supply = <&vreg_pmu_btcmx_0p8>;
 		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
 		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
-		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
+		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
 	};
 };
 

-- 
2.52.0


