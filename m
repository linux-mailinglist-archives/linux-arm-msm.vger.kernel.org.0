Return-Path: <linux-arm-msm+bounces-50667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EABEA57752
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 02:42:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47D80173639
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 01:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F572839F4;
	Sat,  8 Mar 2025 01:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QJ5pZUKb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5F61F95C;
	Sat,  8 Mar 2025 01:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741398150; cv=none; b=FEl6b/RSJcOCculPV59SDgpvSLwp/BUtkDqb1a6zQ+qOQhFoIEvfBwfJ4G5lJMFXY/8DcNPR8F7TuQfq7AhQ99t8mBWYK8K8jvUiDPFLEL5MMHKfSnpAA4NIjyg8BfsZCeUmSaooXCjtqMQ84nZ2VRY28DAPqRoMN1RtM60oVKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741398150; c=relaxed/simple;
	bh=0xzbMLIyrzOvtrnxOzYygHtiJhTxXWscGZfJynbxvwE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Tks1jU5oF15Io7+MtKrDmWOopbJnouhb91uRpwWTDGG4ZRo4xLyDjvf73o4HnNSts503/XL3KWNR77DPBE7raS+d/TkY5OevGMKU4NE/JuQl/K9yzf1QiXJFB532r92E8AR4YO02VrEEVX80PUp/hAp2f4bRJEBglHcde3eh1dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QJ5pZUKb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E758EC4CED1;
	Sat,  8 Mar 2025 01:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741398150;
	bh=0xzbMLIyrzOvtrnxOzYygHtiJhTxXWscGZfJynbxvwE=;
	h=From:Subject:Date:To:Cc:From;
	b=QJ5pZUKbRsqvbYz/lq9JxpxMM0rzw4BP0U3hvqByTUqqfWq4I7vgoOZlhe6BmDanN
	 bO0P0K5+BXoyPKc+2JlRUgTNIDuhKONbNV2ccbADr+rm3RChmQtaI2xzr6f2LZQUJJ
	 PvjpbED9drEJjfGoYIoJxR+96D8L0vx5jY42PdS5hcb2TxWUyq51daID/23iwWRJr6
	 zSvSx9banYT2m5WKSY70oj/X1hBPPwo+sQ4dQ8gohCwwS0CqCjeDoptJA7l+CTSt7K
	 35MQjJRA3JvzrX/nl3mIG7MQyjdNxaZRHKeK9RxnTIDwvRy61lNZdHYA0DHcdpHVu2
	 WyW1llAYfADaA==
From: Dmitry Baryshkov <lumag@kernel.org>
Subject: [PATCH 00/10] drm/msm: add support for SAR2130P
Date: Sat, 08 Mar 2025 03:42:18 +0200
Message-Id: <20250308-sar2130p-display-v1-0-1d4c30f43822@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHqgy2cC/z2OQW7DIBBFr2KxLurA2GD7KlUWMMw0SLXjAq1SR
 bl7aSJ1+b70nv5NVS6Zq1qHmyr8nWu+7B3My6DoHPZ31jl1VhbsBAizrqFYg3DolOvxEX50BAd
 GSDgiqK4dhSVfH8m305MLf371cnuO6giNzr27DjEIOeJkR2fF2wURxcwilnyC2QVvowE/jo/uv
 +VQfMCpy/0JxdktAinSQuAoTSNGTwEF7Z8VQ2VNl23LbR12vrbXLdTGRZ3u91/lDYi6/QAAAA=
 =
X-Change-ID: 20250308-sar2130p-display-b0601fcfeb30
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Bjorn Andersson <andersson@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2348;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=0xzbMLIyrzOvtrnxOzYygHtiJhTxXWscGZfJynbxvwE=;
 b=owEBbAGT/pANAwAKAYs8ij4CKSjVAcsmYgBny6B+rPiCzDjdVbOKP2y8wSLBqEba+tnYtIVmQ
 /BQyLQBNAqJATIEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8ugfgAKCRCLPIo+Aiko
 1dKsB/jpWhfIyF/tcV2lxgpDgnw8y1WeevEZbOVeV6M6hr/dE0v+HYy5JSfJH0SYh/d4kpmaBgu
 q2lvDQQ6dOLnvyE66RdOK25xRXmKKEhS74IB7vlf9Gdi9ZPUZkIY4aMhApDoME5n9wDQ9nkXYXV
 munhewHGKbi1hb3gSvLdQtc49VswONOmX4bGR56E/mdIOF6HHglpV27/FAisCkJjRdB9V8ou0Zi
 myamgawXe81BJWb5X2RCdz4KOw4ef8Sn23aueGrwrTyTuHSmKVVNVHk8/3xIBdB1SxTivTNvvLZ
 BOYhKeLuhUSkKxH9fvghEFZHjsQDM2pIlopMOAEK/G+I5uM=
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add support for the Mobile Display SubSystem (MDSS) device present on
the Qualcomm SAR2130P platform. The MDSS device is similar to SM8550, it
features two MIPI DSI controllers, two MIPI DSI PHYs and one DisplayPort
controller.

Note, due to the technical limitations DP controller wasn't completely
evaluated.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (10):
      dt-bindings: display/msm: dp-controller: describe SAR2130P
      dt-bindings: display/msm: dsi-controller-main: describe SAR2130P
      dt-bindings: display/msm: dsi-phy-7nm: describe SAR2130P
      dt-bindings: display/msm: qcom,sc7280-dpu: describe SAR2130P
      dt-bindings: display/msm: Add Qualcomm SAR2130P
      drm/msm/mdss: add SAR2130P device configuration
      drm/msm/dsi/phy: add configuration for SAR2130P
      drm/msm/dpu: add catalog entry for SAR2130P
      iommu/arm-smmu-qcom: Add SAR2130P MDSS compatible
      arm64: dts: qcom: sar2130p: add display nodes

 .../bindings/display/msm/dp-controller.yaml        |   1 +
 .../bindings/display/msm/dsi-controller-main.yaml  |   2 +
 .../bindings/display/msm/dsi-phy-7nm.yaml          |   1 +
 .../bindings/display/msm/qcom,sar2130p-mdss.yaml   | 445 +++++++++++++++++++++
 .../bindings/display/msm/qcom,sc7280-dpu.yaml      |   1 +
 arch/arm64/boot/dts/qcom/sar2130p.dtsi             | 394 ++++++++++++++++++
 .../drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h   | 434 ++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          |  23 ++
 drivers/gpu/drm/msm/msm_mdss.c                     |  11 +
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c         |   1 +
 15 files changed, 1319 insertions(+), 1 deletion(-)
---
base-commit: 0a2f889128969dab41861b6e40111aa03dc57014
change-id: 20250308-sar2130p-display-b0601fcfeb30
prerequisite-patch-id: bafc6ced2462f729333f18ff2c7d086a72b10744
prerequisite-patch-id: 63f7a35baf213cb869f0dbc9c06cd543b7ca3f32

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


