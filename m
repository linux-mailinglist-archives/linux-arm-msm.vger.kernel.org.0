Return-Path: <linux-arm-msm+bounces-21969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F415F8FF20D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 18:16:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 917ED1F2672A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 16:16:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C5C3199382;
	Thu,  6 Jun 2024 16:13:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ns.iliad.fr (ns.iliad.fr [212.27.33.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8EF199250;
	Thu,  6 Jun 2024 16:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.33.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717690385; cv=none; b=i0uJ2V8kq9rd6Mhn4hst09HRLC4hiq0XYK5agcW5w6yJZjPuVVHEGn7tAf0oqcZrNUejQs1m9/I/j73VbhnNf1BUPwMwZykURVtjKgUpJYveEqEPs2qQyrjKBuSMXFKq6pM7+b68tmyVVsAHtBfNckasI/5CZcYqHM9b/wrfE2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717690385; c=relaxed/simple;
	bh=nS3LfwI6o9UI8YMreTgsmFEN6x/Aw9kVWB5cObcFXBk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=N7MfsG7U5CVvC0LsiM3bwAwKby7W2/bIxrlncj2FQjfBAVHj+vcowM+YI3B/8gUZPdXThD+aqsiaC2NfyU+ej4yH7HpMe964hK//N92u8FMRyk4qlF+PMs3bfKbQUNArNwV00jKwGHj7ytpipti0/SWX0ogj7cVdSJrrOllWp8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=srs.iliad.fr; arc=none smtp.client-ip=212.27.33.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=srs.iliad.fr
Received: from ns.iliad.fr (localhost [127.0.0.1])
	by ns.iliad.fr (Postfix) with ESMTP id BF87720787;
	Thu,  6 Jun 2024 18:07:49 +0200 (CEST)
Received: from [127.0.1.1] (freebox.vlq16.iliad.fr [213.36.7.13])
	by ns.iliad.fr (Postfix) with ESMTP id A76D6200AA;
	Thu,  6 Jun 2024 18:07:49 +0200 (CEST)
From: Marc Gonzalez <mgonzalez@freebox.fr>
Subject: [PATCH v3 0/4] HDMI TX support in msm8998
Date: Thu, 06 Jun 2024 18:07:46 +0200
Message-Id: <20240606-hdmi-tx-v3-0-9d7feb6d3647@freebox.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANLeYWYC/x3MywrCMBCF4Vcps3ZkcjEaV76HuMhlYrPohWmRQ
 um7G7r84D9nh4Wl8gLPbgfhX13qNDaYSwepD+OXseZm0KQtOXLY56HiuiER84PvOceQoNWzcKn
 b+fT+NBeZBlx74XDug05RaU/omRRaZRz6m9eY2BofFXkX3asIc5y2axE4jj9aSdsmmwAAAA==
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
 Marc Gonzalez <mgonzalez@freebox.fr>
X-Mailer: b4 0.13.0

DT bits required for HDMI TX support in APQ8098 (msm8998 cousin)

Supersedes <a2cb1290-9e01-4136-9592-ce439b1096b6@freebox.fr>

Changes in v3
- Address Rob's comments on patch 2:
  - 'maxItems: 5' for clocks in the 8996 if/then schema
  - match the order of 8996 for the clock-names in common

---
Arnaud Vrac (1):
      arm64: dts: qcom: add HDMI nodes for msm8998

Marc Gonzalez (3):
      dt-bindings: display/msm: hdmi: add qcom,hdmi-phy-8998
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


