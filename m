Return-Path: <linux-arm-msm+bounces-84462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C58E1CA7A05
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 13:49:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CECC330B75A9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 12:47:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FA243314C1;
	Fri,  5 Dec 2025 12:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sD2XxO3Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F363271FC;
	Fri,  5 Dec 2025 12:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764938870; cv=none; b=I6a29nboLeKquDTYbmesu1oKARO/EfZEW4P7j1WhZBq+TNfnsuuHkZXXoN9p30LaNM36SsqkMyVuvZD5wHi4oBa6GNyimvs0j7WqQTSLteR4q6M8nRHpWjgk93YlXf8NTpKRrUAwYEkfDcuD8Eh07tIDKRfsibI6luxuDYU+hho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764938870; c=relaxed/simple;
	bh=N9prcVJdstpwppjxYqZtr8I8W7bwqdpJNR/xotmTmTQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oxFgyjguX7rTtEafze5QtswlFdHCy/OUGpPmqdaC0t/ezJlTDUdrMvlbl1+vPcUkYwXRQyEyBHsxOSy7hJafmQEDsuPrdq4L6yffSHzqb3V4efiVlC+q3dgaXVyIaba7KyIP6nA1x2rRDL4OnRzPTUI71555aAbF1EIPMTrOZHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sD2XxO3Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E7AAC19421;
	Fri,  5 Dec 2025 12:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764938868;
	bh=N9prcVJdstpwppjxYqZtr8I8W7bwqdpJNR/xotmTmTQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=sD2XxO3Zxvon6toUONzwLxNfewZdEE3yCXINL4DSD+LItmSu205/pCSVqyC8unLzk
	 AvldsiGAio0rE4sGpI3g+LbDuQFI3AMeswjJ3jEBdvShVOz6dKspVbJqTWzyURyZLt
	 KgOJIUlTVvHPBXM5N6qZOzE6zy3EviirO6gyBS7n9i+NAiFOYjXcSW8G5gb/wVgywf
	 WOVyEaNq9NNEEh27vPAEDsB7hQqotSmGw8RTHGrmQ4Bu1VeccGjFYxGfL6veEbZJbV
	 1oxuyEEF7Ig4Jugelsu6szaEnlpUFcvBMZgfLmjEK9sUFn28M124FlmGjJQ1uSaJTd
	 oDVcRqLsd7v/g==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 05 Dec 2025 13:47:22 +0100
Subject: [PATCH 03/10] arm64: dts: qcom: sc8280xp-crd: Fix BT RFA supply
 name
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-topic-wcn6855_pmu_dtbdings-v1-3-165611f687c8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764938851; l=741;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=2sFoz8r66cHr+uyZs5/vAIRbjpluUoQSm8TZKiiJ6Ok=;
 b=yRlLyS45+pdj1PeVmFmD3UecFlfheykkCIISLilRc6xJOnoyA5Kl50yYvzeSNPKgJo0sGFf55
 PakDMJZh3H8DqIFHcfeFmLAKpCdoQetS2Kt/ojMng4xf84J7DYl2GQi
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Fix up the supply name to align with bindings.

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


