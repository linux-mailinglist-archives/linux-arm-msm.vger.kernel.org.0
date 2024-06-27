Return-Path: <linux-arm-msm+bounces-24507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 445E091ABF0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 17:54:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ED801B2189B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 15:54:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C17C1991BE;
	Thu, 27 Jun 2024 15:54:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ns.iliad.fr (ns.iliad.fr [212.27.33.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97580198E69;
	Thu, 27 Jun 2024 15:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.33.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719503654; cv=none; b=Cf8NObjHW29WcdX+wc2rAXXjyb254jbPzsp4AK/Q45zYcfJSg2bu2UR1sjOneOtEC52wBaBnVuc24vP4xQWzeO1fy3ASNyg6s0Ghw2mDKX7NM6Vp6deZ65iZBYVTPO7WrpGlfmXD4R/xwhm9bxQmuIInJpjhPaytBNIlJnGvAAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719503654; c=relaxed/simple;
	bh=edLA1x05gzWZiSye+nZLCGaJq9BZZHT2KZN4I60BwBA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hfj4kUPDJGKo5YrT1/79l7L4+rkpGv6BcEslvm9MDDYDTx+I+yaAYF2uFQvZIlZnG3aGePQ1Xqwz4eUU/wZoBu8xHxkvYyf2RaYh69IU/1orl9UHB4J+jLapTjqBCVL/bVo6fg9EkE49/qRAloiGe/tHbd3KZp7/slh7zQ0upOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=srs.iliad.fr; arc=none smtp.client-ip=212.27.33.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=srs.iliad.fr
Received: from ns.iliad.fr (localhost [127.0.0.1])
	by ns.iliad.fr (Postfix) with ESMTP id 9B647208AC;
	Thu, 27 Jun 2024 17:54:08 +0200 (CEST)
Received: from [127.0.1.1] (freebox.vlq16.iliad.fr [213.36.7.13])
	by ns.iliad.fr (Postfix) with ESMTP id 80972205DE;
	Thu, 27 Jun 2024 17:54:08 +0200 (CEST)
From: Marc Gonzalez <mgonzalez@freebox.fr>
Subject: [PATCH v5 0/4] HDMI TX support in msm8998
Date: Thu, 27 Jun 2024 17:53:58 +0200
Message-Id: <20240627-hdmi-tx-v5-0-355d5c1fbc3c@freebox.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABeLfWYC/2WOyw6CMBBFf4V07Zi+GKgr/8O4aOlUukBMIQRD+
 HcLGzEuT3LPyV3YQCnSwC7FwhJNcYj9M0N5KljT2ueDIPrMTHKpOXKE1ncRxhk4J6qp8t7ZhuX
 1K1GI81663TOH1Hcwtons7lvZOCENB0NcgBYKwZRGQkNaGSe4QYfXkIhcP59D2optHMY+vfdrk
 9q6/y8mBTnpq0AOvUJdHRvbjUkfRKG+os6itkFUpLFGY37EdV0/CDwMKxoBAAA=
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

DT bits required for HDMI TX support in APQ8098 (msm8998 cousin)

---
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
Arnaud Vrac (1):
      arm64: dts: qcom: add HDMI nodes for msm8998

Marc Gonzalez (3):
      dt-bindings: phy: add qcom,hdmi-phy-8998
      dt-bindings: display/msm: hdmi: add qcom,hdmi-tx-8998
      arm64: dts: qcom: msm8998: add HDMI GPIOs

 .../devicetree/bindings/display/msm/hdmi.yaml      |  28 ++++-
 .../devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml |   1 +
 arch/arm64/boot/dts/qcom/msm8998.dtsi              | 128 ++++++++++++++++++++-
 3 files changed, 154 insertions(+), 3 deletions(-)
---
base-commit: 0169018354b9a9a2ef5d4972da3c4644ab2a73b2
change-id: 20240606-hdmi-tx-00ee8e7ddbac

Best regards,
-- 
Marc Gonzalez <mgonzalez@freebox.fr>


