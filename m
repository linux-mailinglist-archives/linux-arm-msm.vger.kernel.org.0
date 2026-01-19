Return-Path: <linux-arm-msm+bounces-89627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA28D3A729
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 12:43:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 16514307EC4E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 11:42:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44AF0314A6D;
	Mon, 19 Jan 2026 11:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FEEaTiat"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210483148C9;
	Mon, 19 Jan 2026 11:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768822965; cv=none; b=MRKV9rbREuASYkQB+vZ4US14EM6ewfR4AI62MQYb+9QtbMd62NRv3dZMe0xzxGWdQ1aNPUpDk4kkgZctDNWU/iSGvLJnnpKtEUOTdwkl0Hk3LepWjjG7kRUy7DrwE5y1Ib4+K/hkQoAHmsXPuFvyzf2nLz92QPenf4/O6IIVdJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768822965; c=relaxed/simple;
	bh=0WqmN8JXKpp77gbIogDDuIDT8CMQDVU9Rl3kOBjPqMc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ze0Ql8djL9t4mrU03O2kHwp/UQc8hctbLCRpINlfsfR+6pLIAGbv7nZ6U7opnUM4fpXSuWDVoNGHDbx4THMeY1BXvVvmmUZ6HmM6yCqD8l2cs4LMxP9dm8Oz0Q5h+qZy7+kqeHBSrg0PhEnUH1RrABNj1g1UdZOkpfKxZEYLQJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FEEaTiat; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BB6EC116C6;
	Mon, 19 Jan 2026 11:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768822962;
	bh=0WqmN8JXKpp77gbIogDDuIDT8CMQDVU9Rl3kOBjPqMc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FEEaTiatzKpAEooBc88YCLtAwOEfFv+77Mh9FFlkbwZfj4LRg0NPmJQ12VBFnHDRk
	 2y26VgXCeUZ1rEEeo4kg/qc+zu1BMjRrMZNhXtL3aV8ecmUeReRJ8li6GsB16t/iq0
	 Ie6nFtAwTD3/dfk85vW6LM6p82uT4+2QJgFZc8YTXFeJO+ebyhQ2Vtpz2Ryav9CggM
	 2XTwt5Pzgc4rD7dQW+cz4OhQDcGQb7Brl59WlIN7wljF/hfJ52BebT7UVDNRF5JxnX
	 rWiqbb9QK4fJpSX4WGl3t5nZGXxeyzft6c4RqFRw4KM3bE31Df+7zqrL67vOwKo3Kn
	 gp+A1SR8PPGVA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 19 Jan 2026 12:42:24 +0100
Subject: [PATCH v2 02/10] arm64: dts: qcom: qcs615-ride: Fix BT RFA supply
 name
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-topic-wcn6855_pmu_dtbdings-v2-2-6d1c75608bbb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768822946; l=863;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=tfzwWG3L2JfGD0ZoqXQRMBmnJt2T7qtwxau7HUk6IBk=;
 b=SrOvNP3wNH7x4Qm8xL1QNlhJqHyfyMfCPHrMVHKHikAoEozeKFFrruovvkedRsBFdUVF0NdrD
 qNM4XKL2HbQB5mX8fb48cRcOkk1zlUswENr03EEkP0k3PfwnVgcF2hS
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Fix up the supply name to align with bindings.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 5a24c19c415e..3c204ccba052 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -628,7 +628,7 @@ bluetooth {
 		vddbtcmx-supply = <&vreg_pmu_btcmx_0p85>;
 		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
 		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
-		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
+		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
 	};
 };
 

-- 
2.52.0


