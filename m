Return-Path: <linux-arm-msm+bounces-31975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A1997C1FD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2024 00:57:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B2D77B21A4C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2024 22:57:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B94F31CB333;
	Wed, 18 Sep 2024 22:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uMHD3WpF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5EF135417;
	Wed, 18 Sep 2024 22:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726700271; cv=none; b=PKwRG/LPDLMQf3YaWoZU0XYRKGDi8Xsehv7QtchXFDx/qzL4g3MX7msuWg1Nc3/ZgA7lf+2dhasAjMGonYXQ/Q396n2OObE4ISJb7N7QokFn/N1s3quMPIxlDd1xIuNe/zhBcp8oAzJhiJolVrnaIV9Thc3uWJtQPYahJCLp3jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726700271; c=relaxed/simple;
	bh=PQJ0fnTaoCP3RrUPV2On94uyJzX0Ft0/kqfYjNPnNQY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gdrP7j/8wb2bKGNEiPywFrLrpksnzYDHl13KH/eHZQTxeGvQ7iUVhYVkG46InBHNMuISwniIjmFpC9LDE2/XOkhZwcF9qVpbCpCexnipQir4Fpe/6H4fa+44JkHjYUW1h2pKZ8+CIP8ghxDcBaRGxpNqPyy+WAcYDbvZCdOqRvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uMHD3WpF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F399C4CEC2;
	Wed, 18 Sep 2024 22:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726700271;
	bh=PQJ0fnTaoCP3RrUPV2On94uyJzX0Ft0/kqfYjNPnNQY=;
	h=From:Subject:Date:To:Cc:From;
	b=uMHD3WpF85brH028BwHm9/R+x7fMB4nksZsbQTttLr3JZH+xzAVhErk9dFo4kqweF
	 QB28xog74k6Ki+BZtPB/rfXFSXEHEt80RucKPZSou+ltheNtfjVBylysz2IyOo3IlA
	 h4uTOHa92VyGimpNo7QFxRwWyqFslQ//ohUvJ+HYUGcuYuJhbDg7TuFfgqeINSIW3l
	 5tbS8ppXZwYG8d69xrSO2cU5fTQ1YV9HRzu6brAlRnzluojLpapibYaQtq6UusaIyZ
	 DplamrqPj0s2RwkIfMtnKmS+nxJTeACZCt0qXEjMLvVro9uGNSi9bKNgw+fdZIiXLh
	 aQpIJQfLC84kQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [RFC PATCH 00/11] Affirm SMMU coherent pagetable walker capability
 on RPMh SoCs
Date: Thu, 19 Sep 2024 00:57:13 +0200
Message-Id: <20240919-topic-apps_smmu_coherent-v1-0-5b3a8662403d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMla62YC/x3MTQqAIBBA4avErBMmC/q5SoSITTWLVJyKILp70
 vJbvPeAUGISGIoHEl0sHHxGVRbgNutXUjxng0bdYF/16giRnbIxipF9P40LGyXyh8IWl7qz2ml
 sIecx0cL3vx6n9/0A5QnCqGoAAAA=
X-Change-ID: 20240919-topic-apps_smmu_coherent-070f38a2c207
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <quic_kdybcio@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726700267; l=1794;
 i=quic_kdybcio@quicinc.com; s=20230215; h=from:subject:message-id;
 bh=PQJ0fnTaoCP3RrUPV2On94uyJzX0Ft0/kqfYjNPnNQY=;
 b=P3mbzr2DiFVwV9kQBSz/0dNPcoZ1ufgTeGArEdBKKyLP/d5rHs4N+8dVpSPNDhxdn8TIgX06E
 eq9ro0vj4WZDJoZlxhaEcC2BKt9HEHER+miHTHObzi34XTP5OwRsGrf
X-Developer-Key: i=quic_kdybcio@quicinc.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

I only read back the SMMU config on X1E & 7280, but I have it on good
authority that this concerns all RPMh SoCs. Sending as RFC just in case.

Lacking coherency can hurt performance, but claiming coherency where it's
absent would lead to a kaboom.

Signed-off-by: Konrad Dybcio <quic_kdybcio@quicinc.com>
---
Konrad Dybcio (11):
      arm64: dts: qcom: qdu1000: Affirm IDR0.CCTW on apps_smmu
      arm64: dts: qcom: sc7180: Affirm IDR0.CCTW on apps_smmu
      arm64: dts: qcom: sc8180x: Affirm IDR0.CCTW on apps_smmu
      arm64: dts: qcom: sc8280xp: Affirm IDR0.CCTW on apps_smmu
      arm64: dts: qcom: sdm670: Affirm IDR0.CCTW on apps_smmu
      arm64: dts: qcom: sdm845: Affirm IDR0.CCTW on apps_smmu
      arm64: dts: qcom: sm6350: Affirm IDR0.CCTW on apps_smmu
      arm64: dts: qcom: sm8150: Affirm IDR0.CCTW on apps_smmu
      arm64: dts: qcom: sm8350: Affirm IDR0.CCTW on apps_smmu
      arm64: dts: qcom: sm8450: Affirm IDR0.CCTW on apps_smmu
      arm64: dts: qcom: x1e80100: Affirm IDR0.CCTW on apps_smmu

 arch/arm64/boot/dts/qcom/qdu1000.dtsi  | 1 +
 arch/arm64/boot/dts/qcom/sc7180.dtsi   | 1 +
 arch/arm64/boot/dts/qcom/sc8180x.dtsi  | 2 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 1 +
 arch/arm64/boot/dts/qcom/sdm670.dtsi   | 1 +
 arch/arm64/boot/dts/qcom/sdm845.dtsi   | 1 +
 arch/arm64/boot/dts/qcom/sm6350.dtsi   | 1 +
 arch/arm64/boot/dts/qcom/sm8150.dtsi   | 1 +
 arch/arm64/boot/dts/qcom/sm8350.dtsi   | 1 +
 arch/arm64/boot/dts/qcom/sm8450.dtsi   | 1 +
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 2 ++
 11 files changed, 12 insertions(+), 1 deletion(-)
---
base-commit: 55bcd2e0d04c1171d382badef1def1fd04ef66c5
change-id: 20240919-topic-apps_smmu_coherent-070f38a2c207

Best regards,
-- 
Konrad Dybcio <quic_kdybcio@quicinc.com>


