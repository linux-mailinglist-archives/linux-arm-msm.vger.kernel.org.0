Return-Path: <linux-arm-msm+bounces-59611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8345BAC5B74
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 22:40:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F9B08A0B71
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 20:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BDFD207E03;
	Tue, 27 May 2025 20:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HXMPLCjw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2D44685;
	Tue, 27 May 2025 20:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748378420; cv=none; b=Wy6moEJ4OAiDHAYNiPvuR5maEfwMjD61YIiOh0MR7GF7Qlss238l/ks1/NZ8W7CUZS53HEn+oQq77Kw3SmMJ7axK/oDkfT+jxmu9HYvqb0cUZw0J55xZmAXvqyIjhBgADM9zK6/IrE0PT3+I4buXjyuxZWkexuOlnCYDjs8Rpwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748378420; c=relaxed/simple;
	bh=o6RTu/fe8SVeQMQKwuTVVvMbJ9Q/EvXIvy75U5TFuUE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oHXz7TGjbhpuZ/khGIVBitRyYJaK1d3rmTVomumiOTr5WFQc+h7VnSDlrATrrewzgBtW+LUirnwNWeTVjcAUyehsQmB/j9Darj420JFTpnAkzUxu3FXUYF+ryhfXyJIajTlTTvjAhKBZUvy1L8ME1uxSM0iABbEGoHdQwe479/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HXMPLCjw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3919BC4CEE9;
	Tue, 27 May 2025 20:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748378420;
	bh=o6RTu/fe8SVeQMQKwuTVVvMbJ9Q/EvXIvy75U5TFuUE=;
	h=From:Subject:Date:To:Cc:From;
	b=HXMPLCjw8C1sN3tCCQJuezNOcsNvNvemhyUI3VRk0aEZ2zMEphroYIA8xwR/TKWvJ
	 CyROHQz8jvb3ByIljJPbiClM3VhfOlhHNZ2WLb2SKiO/9riVzu015TpQ1XvVyi2IQB
	 /FFw9E+mOJGh5pucz156BqAPFet8Js4jTQJEZzSOKjUTO3RHSOQn3TK3BESaEtJykF
	 kez+yi850ACR072K2Dx284FrpUtoI6ITnFfzGhb+CDJFom8OZm3PBIA9dH+Fobhbia
	 gJwC+UWOwVJVfikhwcgy4nir/XJq0ctI+Ggq+LLX+YjEATxLtT/9LRBxCkS7dfo9rG
	 OkG7OgLGMBK+A==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH v3 0/6] arm64: qcom: allow up to 4 lanes for the Type-C
 DisplayPort Altmode
Date: Tue, 27 May 2025 22:40:02 +0200
Message-Id: <20250527-topic-4ln_dp_respin-v3-0-f9a0763ec289@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACMjNmgC/x3MTQqAIBBA4avErBNi0v6uEiFiUw2EiUYE4t2Tl
 t/ivQSRAlOEqUoQ6OHIlyto6wrsYdxOgtdiwAZVo7AX9+XZCnk6vXodKHp2wnYjSjMMqCxBKX2
 gjd//Oi85f56ffJRlAAAA
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
 Krzysztof Kozlowski <krzk@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748378414; l=2944;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=o6RTu/fe8SVeQMQKwuTVVvMbJ9Q/EvXIvy75U5TFuUE=;
 b=3o/7D6VeHfd7PE53Qk34RBYI/8t5seA6Wr6yKb3I6ZxMwU117qb440IPDvwf0Mdkb4DLoIcsa
 V0Xn/6kLhwGDJJ70ug3t2U9P8EjRjNrA3Y2YUDNGIgktoLvnDCFP/SC
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
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 182 +++++++++++++++++++--
 3 files changed, 173 insertions(+), 22 deletions(-)
---
base-commit: 460178e842c7a1e48a06df684c66eb5fd630bcf7
change-id: 20250527-topic-4ln_dp_respin-c6924a8825ce

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


