Return-Path: <linux-arm-msm+bounces-84465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 70224CA79E4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 13:49:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C9601302CB79
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 12:48:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 047A133122E;
	Fri,  5 Dec 2025 12:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LfvmvXmF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359253321C9;
	Fri,  5 Dec 2025 12:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764938884; cv=none; b=KDGqAZBtgpyJkblOO7j2csJZthxBH6Gz6/9fk4H/vDMQVL0xbXAXDHaPbjmJsYOq60C6PgWjDEjTYQe5KEAmi3mn5owueFbPrExAi/5MVNrb41hyUGMOxFu0lCXJ1bVvF+Z0JDyZQ9YW3UfHw380haM3L8ltHjl86Sf4vJmLP8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764938884; c=relaxed/simple;
	bh=fxsBu0gQ0KEHKKZSo0R383ZsNm69Wtj8IDkew7gvDeM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d6tsELfLdTWomg2/XGEhRPF25GAxnZeu2dklv3+VKH+AYAfe8v9NPDaTe8zGptrqcDJv6gn+Ef2kB8wYoKYdZk2KLt+CzCks1dCoid1kVV5wo/WTJfLQcYsP5xt3/e+5XEWq2+a7R1E+vCVeavpEajdlC9syJO4ISwfwpwiw20M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LfvmvXmF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E182C4CEF1;
	Fri,  5 Dec 2025 12:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764938882;
	bh=fxsBu0gQ0KEHKKZSo0R383ZsNm69Wtj8IDkew7gvDeM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LfvmvXmFomBIaJc8acHKuxLj9hfyuznEK7UvmXblkGBw/hOsovRCMOAFWfBbDe2dy
	 D15dzq7sZejUYMwpq+QcCCrEYKiG4CP3xY0knVWBe4bCfQSbDGq3wS9/EWUMkD0jF2
	 dxaPePamUT6W0Gf6R06mtLHg14IExrVhgExsk0AL3HYZdDcwroM3FZYLdRsD0Ucu4p
	 7IW9x01rb17zngUhmKF3IcDARNJxOQ/n38E+IoDoAUc9+nr5hip50uS06/71RiOOI4
	 7hayznAQp6QW3ntQKWfQZfUh/vUVh6KtoH7PaIF1yTadRJssi7NBhUfTw0uAPtHV52
	 oL+/1umz9dPlg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 05 Dec 2025 13:47:25 +0100
Subject: [PATCH 06/10] arm64: dts: qcom: sc8280xp-blackrock: Fix BT RFA
 supply name
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-topic-wcn6855_pmu_dtbdings-v1-6-165611f687c8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764938851; l=843;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=w1eebzzrm8TxliIlDK5DqGsrVbqPUUAk6VjZcPhSHuU=;
 b=0XTsscQml6uYLTQ8xC6mht7IMfGwClUb/6vddviysjMkT+HzIY/zKHfvroE2hkaGeK2PVjQAm
 0PozJZtnDZACRaFxtE76c8qcxWrBm9ZTtEMh75Z2d1SK4lu1t9pbMe1
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Fix up the supply name to align with bindings.

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


