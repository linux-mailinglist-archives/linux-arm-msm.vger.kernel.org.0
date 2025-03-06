Return-Path: <linux-arm-msm+bounces-50548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DA422A55462
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 19:12:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35439189A433
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 18:11:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B19926A1B5;
	Thu,  6 Mar 2025 18:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nbs7AZZC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24757269AE8;
	Thu,  6 Mar 2025 18:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741284689; cv=none; b=uhdTVlYBIbvx26rCSJcdbpds8+coluMK5vFarz16sQLlohgldg0fUD1Fg0wbSurez1iolwUH8ni70MnyBwmH7ieOio1AlKJ+q3yQW+hxp0UzyDBr0B/zzGmwAhjpNxqFmr/2nJCg5iXCE3mmbIEdN5l5KqV7rjvnqrsrwIeozfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741284689; c=relaxed/simple;
	bh=bU5AMb4R/DshyEbA+d2oRecQTp/i83dn8rpMf9Jrb6A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZMiV8SK1Lf2koSe9TGA2JktdwmTlT+8RIrn/DGr8LkJ6yGT77UqFjaXKSP+KJiNsjnDncxuRMFM0luC4CeedFZe4cMBw+aDZqvK4PFNQCbZnK7I+fpvgxAXQaCMvGF2y1r9wlAOAqnnA6aIipoTygljWETMku1bB1db2kL8EoO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nbs7AZZC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E160C4AF09;
	Thu,  6 Mar 2025 18:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741284688;
	bh=bU5AMb4R/DshyEbA+d2oRecQTp/i83dn8rpMf9Jrb6A=;
	h=From:Subject:Date:To:Cc:From;
	b=nbs7AZZCIkCccljjMQDL/BvTJZTZy6Ke5hFijBsumz7BWz7iuuJxLEnp/DFPoo0El
	 onvgGJxI6I0pEhgCx31vb/4yhxmUE3+fYLnMYSxo3UYeaFBHIZEwtpsx3t3ZuSUgbp
	 8CGszMKKT/mTgc0AWFEa4bIoUdM9wKvUg0ovVzSfOVCh2OqUNNcfN/nRVw6NY+2/AC
	 2rRRlPrD1pnfhqNpkv25bXQnW8pZc9Aaw7CCB2xMtYqVJ6jzXqOyO620TQQ5S7DmZh
	 dZX4wVQmnEpFuXJugOoJBHd5Ex/9DBc9S/YyRnwSJd9WNEmhJHJmwZ/8+31oPVB8XA
	 qzVDw6YroewUA==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH 00/11] Various dt-bindings fixes
Date: Thu, 06 Mar 2025 19:11:12 +0100
Message-Id: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEDlyWcC/x2MQQqAIBAAvxJ7TjBNg74SEaWb7cXErQiivycdh
 2HmAcZMyNBXD2S8iGmPBZq6ArfNMaAgXxiUVEZqacWxJ3LCH9NC0VMMPK10n4mFlcq3ndNOWwM
 lTxmL+dfD+L4fgdDHYmoAAAA=
X-Change-ID: 20250306-topic-dt_bindings_fixups-602d47c3c365
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Robert Foss <rfoss@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Rohit Agarwal <quic_rohiagar@quicinc.com>, 
 Kyle Deng <quic_chunkaid@quicinc.com>, Vinod Koul <vkoul@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-usb@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741284679; l=1852;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=bU5AMb4R/DshyEbA+d2oRecQTp/i83dn8rpMf9Jrb6A=;
 b=Rbjc8lynnoqJxMnMySspJrBir6TO0ftRb/hlYhjDyLT0lbuTVzPYrkP9kJkNdvrmrF5sSirOY
 OpJClHeQ7/8BgUFoYoOiD3hVI7w1qyfUua0bCJfHAswnznxd0oDPZ94
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

A set of not quite related bindings warnings fixes.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (11):
      dt-bindings: iommu: qcom,iommu: Add optional TBU clock
      dt-bindings: display: msm: sm8350-mdss: Describe the CPU-CFG icc path
      dt-bindings: power: qcom,kpss-acc-v2: Add MSM8916 compatible
      arm64: dts: qcom: msm8916: Fix KPSS ACC compatible
      arm64: dts: qcom: sdx75: Fix up the USB interrupt description
      arm64: dts: qcom: sdx75: Rename AOSS_QMP to power-management
      arm64: dts: qcom: qcs615: Rename AOSS_QMP to power-management
      arm64: dts: qcom: sc8180x: Rename AOSS_QMP to power-management
      arm64: dts: qcom: x1e80100-dell-xps13-9345: Drop clock-names from PS8830
      arm64: dts: qcom: x1e80100-romulus: Drop clock-names from PS8830
      arm64: dts: qcom: x1e001de-devkit: Drop clock-names from PS8830

 .../bindings/display/msm/qcom,sm8350-mdss.yaml           |  6 +++++-
 Documentation/devicetree/bindings/iommu/qcom,iommu.yaml  |  4 ++++
 .../devicetree/bindings/power/qcom,kpss-acc-v2.yaml      |  4 +++-
 arch/arm64/boot/dts/qcom/msm8916.dtsi                    |  8 ++++----
 arch/arm64/boot/dts/qcom/qcs615.dtsi                     |  2 +-
 arch/arm64/boot/dts/qcom/sc8180x.dtsi                    |  2 +-
 arch/arm64/boot/dts/qcom/sdx75.dtsi                      | 16 +++++++++-------
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts             |  3 ---
 arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts    |  2 --
 arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi |  2 --
 10 files changed, 27 insertions(+), 22 deletions(-)
---
base-commit: 565351ae7e0cee80e9b5ed84452a5b13644ffc4d
change-id: 20250306-topic-dt_bindings_fixups-602d47c3c365

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


