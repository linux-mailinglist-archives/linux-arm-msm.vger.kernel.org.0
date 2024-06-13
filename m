Return-Path: <linux-arm-msm+bounces-22594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4E2907661
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 17:17:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D422281CDC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 15:17:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DCE1149C50;
	Thu, 13 Jun 2024 15:16:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ns.iliad.fr (ns.iliad.fr [212.27.33.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84623145B0B;
	Thu, 13 Jun 2024 15:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.33.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718291809; cv=none; b=jJW1L/jJI8Xktiu2wmEGMCMBI4GFXmwraVG6u1htfk6rAWjTQkUOtaRwkV+Ni6VT2XnPVNWPJoGPYRXOwjYlAaE0zxJJPWaYDsKbZt9o3ErZEiGxqCM8kyrSCuI+9seQpueMGyFqyai6c0I4Nkfu7XxXxtyLiL+t2arFPFRpLyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718291809; c=relaxed/simple;
	bh=j8O5bstlHZmTVncUDJdJ+Hstmv0e8r6iPj8hxjYvKrM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dm9dStkfiLXWgIQhM7e5NO0u6tRsaEQyWuFEbWqZqC+I/l4hQ8kSmO5yYGbeYuWxmttV3o4d1OJCLNBIOKYX9419UU5WCNzi92YABhagcwHiOSJjCadn3ioPx59iBjC5TI3+lea3VzrilTZvAzQmfD4Qlldn8ioeOQeCzOnzX/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=srs.iliad.fr; arc=none smtp.client-ip=212.27.33.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=srs.iliad.fr
Received: from ns.iliad.fr (localhost [127.0.0.1])
	by ns.iliad.fr (Postfix) with ESMTP id ED20720A8B;
	Thu, 13 Jun 2024 17:16:36 +0200 (CEST)
Received: from [127.0.1.1] (freebox.vlq16.iliad.fr [213.36.7.13])
	by ns.iliad.fr (Postfix) with ESMTP id D378620356;
	Thu, 13 Jun 2024 17:16:36 +0200 (CEST)
From: Marc Gonzalez <mgonzalez@freebox.fr>
Subject: [PATCH v4 0/4] HDMI TX support in msm8998
Date: Thu, 13 Jun 2024 17:15:49 +0200
Message-Id: <20240613-hdmi-tx-v4-0-4af17e468699@freebox.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACUNa2YC/2XOywrCMBCF4VeRrB3JzdS48j2ki1wmJos2kpRSK
 X13064Elz/MfJyVVCwJK7mfVlJwTjXlsYU8n4iLZnwhJN+acMolVVRB9EOCaQFKEW/YeW+NI+3
 6XTCk5ZCefetQ8gBTLGiOf8OdZVxT0EgZSCYU6Kvm4FAKbRnVyqpHKIg2L5dQdjGmOuXyOabNY
 nf/V8wCGum7gFZ5oWT3a/Tbtn0B30UufuEAAAA=
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
 Marc Gonzalez <mgonzalez@freebox.fr>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0

DT bits required for HDMI TX support in APQ8098 (msm8998 cousin)

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
base-commit: 2c4f4d94dcbf6f500b92fff5600989ea23a207e8
change-id: 20240606-hdmi-tx-00ee8e7ddbac

Best regards,
-- 
Marc Gonzalez <mgonzalez@freebox.fr>


