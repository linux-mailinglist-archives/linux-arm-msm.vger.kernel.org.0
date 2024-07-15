Return-Path: <linux-arm-msm+bounces-26169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E435931445
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 14:32:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F9641C2144A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 12:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FB7018C332;
	Mon, 15 Jul 2024 12:32:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ns.iliad.fr (ns.iliad.fr [212.27.33.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C694186E30;
	Mon, 15 Jul 2024 12:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.33.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721046721; cv=none; b=MEKzXhQe49vLcDDfsHQqOjTz9nLGPLaL08GPehlS6UeEn/hch3J4awVcQnoKrNg4yhNp5meTZbUMIz0yf8lBRx0pDm/RQ7AVyoSJdeKAD9KBmxv4QS0ClVcxaD5GX7tp0vyxeNcg3rmkzHNAvwDxNKtnYtPeetnZFZMvsSbRGbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721046721; c=relaxed/simple;
	bh=uExxKmaksB2mFMJAkbUpvSbkLK+5TndD1H/wyDnC+28=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NKD2+Db6Bk14oKEEltuaB0CcQ1kxvcXsCeNe3LJPI8R7IULtnBj2mj0d0++8uqUNGPrM0UTHNvH+Ruq+75LYCekVTOR+jYGApENnr7H/Jfn4WFTwIFJ1QUS8peAcfFQ7mlwE2iHuGESPIAUaRTWbPWtuID0ZNYTDzKctHYt4maI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=srs.iliad.fr; arc=none smtp.client-ip=212.27.33.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=srs.iliad.fr
Received: from ns.iliad.fr (localhost [127.0.0.1])
	by ns.iliad.fr (Postfix) with ESMTP id F0BDF20B8A;
	Mon, 15 Jul 2024 14:22:13 +0200 (CEST)
Received: from [127.0.1.1] (freebox.vlq16.iliad.fr [213.36.7.13])
	by ns.iliad.fr (Postfix) with ESMTP id E804B2021F;
	Mon, 15 Jul 2024 14:22:13 +0200 (CEST)
From: Marc Gonzalez <mgonzalez@freebox.fr>
Subject: [PATCH v6 0/6] HDMI TX support in msm8998
Date: Mon, 15 Jul 2024 14:21:13 +0200
Message-Id: <20240715-hdmi-tx-v6-0-d27f029627ad@freebox.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADkUlWYC/2XOu47CMBCF4VdBrpmVr2NMxXusKHwZExcQ5ERRV
 ijvjpOGrCiPNN+vebGBaqGBnQ8vVmkqQ+kfbeDxwGLnHzeCktpmkkvNkSN06V5gnIFzohPZlIK
 PrF0/K+Uyb6Xfa9u59ncYu0p+817GIKTj4IgL0EIhOOMkRNLKBcEdBrzkShT6+SfXtdiVYezr3
 /bapNbu9xeTgpZMNlPApFDbfWN9Y9I7KNQH6ga1z8KSxhM69wXNDkr7gaZBZUwyUeQQVfwHl2V
 5A9LV6LpTAQAA
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Arnaud Vrac <avrac@freebox.fr>, 
 Pierre-Hugues Husson <phhusson@freebox.fr>, 
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Marc Gonzalez <mgonzalez@freebox.fr>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0

DT bits required for HDMI TX support in qcom APQ8098 (MSM8998 cousin)

---
Changes in v6:
- Fold HDMI PHY driver submission into this series
  => [PATCH v2] drm/msm: add msm8998 hdmi phy/pll support
  => Link to v2: https://lore.kernel.org/all/20240704-hdmi-phy-v2-1-a7f5af202cb5@freebox.fr/
     - Rebase onto v6.10
     - Move drivers/gpu/drm/msm/hdmi/hdmi.xml.h to drivers/gpu/drm/msm/registers/display/hdmi.xml
     - Add copyright attribution
     - Remove all dead/debug/temporary code
  => Link to v1: https://lore.kernel.org/all/63337d63-67ef-4499-8a24-5f6e9285c36b@freebox.fr/
- split HDMI PHY driver patch in 2 parts (PHY & TX)
- Use same regulator names as msm8996 (Dmitry)
- Remove printk statements
- Add Vinod's Ack on patch 1
- Expand commit message on patch 4 = HDMI PHY driver
- Link to v5: https://lore.kernel.org/r/20240627-hdmi-tx-v5-0-355d5c1fbc3c@freebox.fr

Changes in v5:
- Fix property & property-names for TX pinctrl in DTSI (Konrad)
- NOT CHANGED: clock trees for TX & PHY based on Dmitry & Jeffrey's remarks
- Link to v4: https://lore.kernel.org/r/20240613-hdmi-tx-v4-0-4af17e468699@freebox.fr

Changes in v4:
- Collect tags since v3
- Reword patch 1 subject (Vinod)
- Link to v3: https://lore.kernel.org/r/20240606-hdmi-tx-v3-0-9d7feb6d3647@freebox.fr

Changes in v3
- Address Rob's comments on patch 2:
  - 'maxItems: 5' for clocks in the 8996 if/then schema
  - match the order of 8996 for the clock-names in common

---
Arnaud Vrac (2):
      drm/msm: add msm8998 hdmi phy/pll support
      arm64: dts: qcom: add HDMI nodes for msm8998

Marc Gonzalez (4):
      dt-bindings: phy: add qcom,hdmi-phy-8998
      dt-bindings: display/msm: hdmi: add qcom,hdmi-tx-8998
      drm/msm/hdmi: add "qcom,hdmi-tx-8998" compatible
      arm64: dts: qcom: msm8998: add HDMI GPIOs

 .../devicetree/bindings/display/msm/hdmi.yaml      |  28 +-
 .../devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml |   1 +
 arch/arm64/boot/dts/qcom/msm8998.dtsi              | 128 +++-
 drivers/gpu/drm/msm/Makefile                       |   1 +
 drivers/gpu/drm/msm/hdmi/hdmi.c                    |   1 +
 drivers/gpu/drm/msm/hdmi/hdmi.h                    |   8 +
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c                |   5 +
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c           | 779 +++++++++++++++++++++
 drivers/gpu/drm/msm/registers/display/hdmi.xml     |  89 +++
 9 files changed, 1037 insertions(+), 3 deletions(-)
---
base-commit: f832eca10adfb75be6b23d32e0baaf28da034f78
change-id: 20240606-hdmi-tx-00ee8e7ddbac

Best regards,
-- 
Marc Gonzalez <mgonzalez@freebox.fr>


