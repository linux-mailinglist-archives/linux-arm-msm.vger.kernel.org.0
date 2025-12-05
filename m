Return-Path: <linux-arm-msm+bounces-84463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F197FCA7A1D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 13:50:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0FCF930D700D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 12:48:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6121E33122A;
	Fri,  5 Dec 2025 12:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IWU0Xuit"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C2133121E;
	Fri,  5 Dec 2025 12:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764938876; cv=none; b=qFXeyTEbSC7NCyZDzpARZvKEwsYOXQvs2nqKf+rBOzrNiIJM3mEgCTrJCsRyTPKHZ+CHnJJ5GzYybTCRhYcdDyYoDaRz+MQmyjNYFFYey4xn9wGRlx/eduBaqqYx5gDCnhG9ndpk/Os07pf+hY0rP/7/cYU6tqsmer8a5bwVpf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764938876; c=relaxed/simple;
	bh=IX50Uol5VXmJmVEGDMqzvXL6HN4e9W0XS5zbQlbRYwM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bQBvLJ+ICX2ZIMEHxMcbHh2kBuEsCTg5dWnD6W4h2/wUFct8IPylEZbyMwskEc21jL/kfqmHyvjfQHVNrSPqVswbCK46xdKl1qQvzQbHEHVf+USd7etPAL6SLunYHjx8pDWroeBX4vyYZrEF+hu8ljvOxc7+WZ0jyit06rnnRkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IWU0Xuit; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7261BC4CEF1;
	Fri,  5 Dec 2025 12:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764938873;
	bh=IX50Uol5VXmJmVEGDMqzvXL6HN4e9W0XS5zbQlbRYwM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IWU0XuitZ+Ta1uQiI9+/FHCZiVvxeXxr43O7iTAwnpa1kY8T4fnsheVt0q5taVbAQ
	 /YLev0jNHCGHRDf//GuSclAL0aCNPGl27JuivD7xPku2VQnrz5siRlRIw/CGP/Lszx
	 V/Jdm1ybF0+6+SyAE43WNVKHB/B2SsOoKcgpnHXxkLQmz4F/paMAlftR7ppiH3+tEZ
	 TRmtX2huIMMK5f7jhjx4sZ9r9fNzG1xIfyEiJ3ZldncfctTLwZhNuj6rlh/DTqMnrz
	 2v908jlx7v6wTQ34egySu3zJfAFEpaWFleOGoqx6NqXywrPVzbSjOWuC35cHkO9YtQ
	 l3B8FaBlnhMaA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 05 Dec 2025 13:47:23 +0100
Subject: [PATCH 04/10] arm64: dts: qcom: sc8280xp-gaokun3: Fix BT RFA
 supply name
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-topic-wcn6855_pmu_dtbdings-v1-4-165611f687c8@oss.qualcomm.com>
References: <20251205-topic-wcn6855_pmu_dtbdings-v1-0-165611f687c8@oss.qualcomm.com>
In-Reply-To: <20251205-topic-wcn6855_pmu_dtbdings-v1-0-165611f687c8@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, 
 linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764938851; l=820;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=f1L2IQcYsyragIm1+0txFbShzUX0NQpT5HnFIeRLvoA=;
 b=wZCe1CQXIR5dH1wPKpaEwyJl5rD2cF9OhE9Uiux5DipJLfhlJjowzEe5fBFbTUNdGHC4timKz
 Ywoo4Me7nZLDXmHXAGzNyB6GFmCHqwlhcDoYG0COI+KsdWYpV/RS/o8
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Fix up the supply name to align with bindings.

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


