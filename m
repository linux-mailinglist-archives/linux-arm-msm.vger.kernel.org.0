Return-Path: <linux-arm-msm+bounces-68031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C95B1DBB8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 18:33:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB9B91894352
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 16:33:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49F9B269CF0;
	Thu,  7 Aug 2025 16:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pcsVTv95"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF4A22332E;
	Thu,  7 Aug 2025 16:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754584408; cv=none; b=RUU7tPPbaFDPD1n3Tssy2UMdG9nY9Kwn4KnktsI78gv0so4F8XhqcBgd0OFgbTgw7zJoQK3jiuipmSLRIn96LAKMNrP5diqdwm5TqpSGzJSR/zSII9exJ5RAwmPwF+aZ97byMSYzQ5OrlDlqT74txyOcecKC8Y+2vC65/fjQ7Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754584408; c=relaxed/simple;
	bh=ntY80xGs44MCWDEx+rS2FTKDH2ewj/KkXkqdRUEQtzA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sNx8eQjMckOMxy/jrVIG2C4mKG1rTS/t2JPWM/wsbxQrU8z/Odop3UllYn52xPT4kQtyFS1yBaaKyIiSehu15dXM9hYEL5grlJTR8FsE5yAqen5y7YhIwUxeQc7pVTh/97yLZQ5wzE+WVE9eN07SsXaAaUsUZ9KfDuIWw1rmBuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pcsVTv95; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D9ABC4CEEB;
	Thu,  7 Aug 2025 16:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754584407;
	bh=ntY80xGs44MCWDEx+rS2FTKDH2ewj/KkXkqdRUEQtzA=;
	h=From:Subject:Date:To:Cc:From;
	b=pcsVTv95AOk4GT3TZuN4VwAiJqk79yawyISf+hInmdCSlZHO5/sKwxv78Xz8bQ2QT
	 evUt12uO/XPjIO/NGeA3xFrwP6Ut+GB4PL7Gg++cAfozdY+2MTrm1ZPGD3jgvsilR8
	 r6P8KpKWB+edaYXIuOuvKgdP6mczOmeP0/fFw+niCjPfw8XviQ+vTVAi3kX5FTaZ70
	 WMyPDaBryo/Nc+xBIKY039ZKwzsxbRaoBbTp8bcV2IBL/qlPtc6QoGiGgMVrFyWdeq
	 cZkg1/1p+jqkiMpJCFrB/JsELnTrTo+eftqONC0OxiuoOOn1mOnGMhZFOBxkmorpJO
	 8Db5yFy9/aiTw==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH v4 0/6] arm64: qcom: allow up to 4 lanes for the Type-C
 DisplayPort Altmode
Date: Thu, 07 Aug 2025 18:33:18 +0200
Message-Id: <20250807-topic-4ln_dp_respin-v4-0-43272d6eca92@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE7VlGgC/32NXQqDMBCEryL73EhI/O1T71FEQlzrgiZp1kqLe
 PemHqAvA9/AfLMDYyRkuGY7RNyIybsExSUDOxn3QEFDYlBSlbJUtVh9ICuK2fVD6CNyICds1ar
 CNI0qLUJahogjvU/rvUs8Ea8+fs6TTf/a/75NCynG1si60mhV0948c/58mdn6ZclTQHccxxdnu
 9LGvQAAAA==
X-Change-ID: 20250527-topic-4ln_dp_respin-c6924a8825ce
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754584403; l=3376;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=ntY80xGs44MCWDEx+rS2FTKDH2ewj/KkXkqdRUEQtzA=;
 b=4Mu66jGvNs15b1lFXrxpIhZlawB5x17VH9OKrXMcilTSwqjhazeYSPsduJrAIASFh8lZZltay
 RU2DVsVtXF6DNT4J5qp1XgIgxhYsY+axrqiauvthRbjKrpU0zM5hHIR
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Register a typec mux in order to change the PHY mode on the Type-C
mux events depending on the mode and the svid when in Altmode setup.

The DisplayPort phy should be left enabled if is still powered on
by the DRM DisplayPort controller, so bail out until the DisplayPort
PHY is not powered off.

The Type-C Mode/SVID only changes on plug/unplug, and USB SAFE states
will be set in between of USB-Only, Combo and DisplayPort Only so
this will leave enough time to the DRM DisplayPort controller to
turn of the DisplayPort PHY.

The patchset also includes bindings changes and DT changes.

This has been successfully tested on an SM8550 board, but the
Thinkpad X13s deserved testing between non-PD USB, non-PD DisplayPort,
PD USB Hubs and PD Altmode Dongles to make sure the switch works
as expected.

The DisplayPort 4 lanes setup can be check with:
$ cat /sys/kernel/debug/dri/ae01000.display-controller/DP-1/dp_debug
	name = msm_dp
	drm_dp_link
		rate = 540000
		num_lanes = 4
...

This patchset depends on [1] to allow broadcasting the type-c mode
to the PHY, otherwise the PHY will keep the combo state while the
retimer would setup the 4 lanes in DP mode.

[1] https://lore.kernel.org/all/20240527-topic-sm8x50-upstream-retimer-broadcast-mode-v1-0-79ec91381aba@linaro.org/

Changes in v4:
- Default to USB3_ONLY if there's no DP SVID (Dmitry)
- Pick up tags, dropped T-bys due to the above change
- Add missing submitter's sign-off on some patches
- The odd 4-lane-DP + USB2 case remains unhandled for now, but it's
  not a huge deal, see:
  <c2f2ba36-1a25-450e-99b9-79aa4fd4913d@linaro.org>
- Link to v3: https://lore.kernel.org/r/20250527-topic-4ln_dp_respin-v3-0-f9a0763ec289@oss.qualcomm.com
Changes in v3:
- Take the series from Neil
- Rebase
- Rename many variables
- Test on X1E & X13s
- Apply a number of small cosmetic/codestyle changes
- Remove some unused variables
- Some smaller bugfixes
- Link to v2: https://lore.kernel.org/lkml/20240527-topic-sm8x50-upstream-phy-combo-typec-mux-v2-0-a03e68d7b8fc@linaro.org/
Changes in v2:
- Reference usb-switch.yaml in bindings patch
- Fix switch/case indenting
- Check svid for USB_TYPEC_DP_SID
- Fix X13s patch subject
- Update SM8650 patch to enable 4 lanes on HDK aswell
- Link to v1: https://lore.kernel.org/r/20240229-topic-sm8x50-upstream-phy-combo-typec-mux-v1-0-07e24a231840@linaro.org

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (1):
      phy: qcom: qmp-combo: Rename 'mode' to 'phy_mode'

Neil Armstrong (5):
      dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp: Reference usb-switch.yaml to allow mode-switch
      phy: qcom: qmp-combo: store DP phy power state
      phy: qcom: qmp-combo: introduce QMPPHY_MODE
      phy: qcom: qmp-combo: register a typec mux to change the QMPPHY_MODE
      arm64: dts: qcom: sc8280xp-lenovo-thinkpad-x13: Set up 4-lane DP

 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         |   7 +-
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |   6 +-
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 179 +++++++++++++++++++--
 3 files changed, 170 insertions(+), 22 deletions(-)
---
base-commit: 442d93313caebc8ccd6d53f4572c50732a95bc48
change-id: 20250527-topic-4ln_dp_respin-c6924a8825ce

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


