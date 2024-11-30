Return-Path: <linux-arm-msm+bounces-39737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BBA9DF2C1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 20:09:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4F58162D6D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 19:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78EDE1AA1F4;
	Sat, 30 Nov 2024 19:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VWVUB/8G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B711A08C1;
	Sat, 30 Nov 2024 19:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732993738; cv=none; b=gMK02j8Vbi6siGfnLTma2HdSILZtkCI8qJD9w1e9GbyA4TqKbSMc8R8qCQDI6m9rPu3tzZ5ycVTYGK01/wd2SWunFPAl7uj0Y2c/h6hOOFmSlpsL5BZC4bHLmFOAoSSS1FtgdRUGpAkrI1xBxL1hhQeWerRDOhu35K5i5LXGl9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732993738; c=relaxed/simple;
	bh=hqAKmns3GJfToP3zAXRQaDGsgbUUADfXFp5gbTXfOJY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=k6eOKIKsKAS9JCD/FzuEUbiDgAGfmP6C2ZYO7slPrjDtVPdnggkD+1JUyXDAtSa7dVg5dnimiTXi+1XroTFjLWgi5w+LJ1OIbJdwKmSFByz9pfA9+hw5PQLYHXJwGm0Bpota6tBXObIrXZmx+dezpY4SsKri70BTz3f+XMAWPck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VWVUB/8G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BB82FC4CECC;
	Sat, 30 Nov 2024 19:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732993737;
	bh=hqAKmns3GJfToP3zAXRQaDGsgbUUADfXFp5gbTXfOJY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=VWVUB/8GESqTBU7id9i4jq3YWmrDhf3kX9p1BuDBxt+vAdmo0nfVEfKNHPk5qxjnh
	 2rdE7jLt1LI2LheNMlFv3eY+Xx6K6H0g7G20aUkKy4a992Fd3Y67wCgmPObTl0tK1p
	 9taTVXtoQRBEJLLGMuOv4Rg1tuRT/cYoJ2URkYAyrsfenVDUsouyxJu71eb3kXToHV
	 S5fmPSFh+uo1GUW3nro65f9it3u6Pv4OstQjRisf4lMI1IwUgXZONbBTJNz7XOZrNV
	 F1MaAQxgadaiP02JR5+44oL9MRteweDExyZD6QqnofgjNpv950oKzGrHqgjr7d+BXc
	 VI0f9jFljqp7g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C565D7360A;
	Sat, 30 Nov 2024 19:08:57 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Subject: [PATCH v2 0/4] arm64: dts: qcom: x1e80100-hp-x14: dt for HP
 Omnibook X Laptop 14
Date: Sat, 30 Nov 2024 20:08:51 +0100
Message-Id: <20241130-hp-omnibook-x14-v2-0-72227bc6bbf4@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMNiS2cC/2WOzQ6CMBCEX8Xs2ZpuLRg8+R6GAz+t3Ygs6SJBC
 e9uJd48fpPMN7OAuEhO4LxbILqJhLhPYPY7aELV35yiNjEYbSwi5ioMih891cx3NaNVhc6Oha+
 aE2YtpNYQnad5M17LxIFk5PjaBib8pj+XsX+uCZVWzprceG0y66sLd600gbkT7p5j+iaHmt5Qr
 uv6ATUhK2u7AAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Kalle Valo <kvalo@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732993736; l=3019;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=hqAKmns3GJfToP3zAXRQaDGsgbUUADfXFp5gbTXfOJY=;
 b=pu3b5VwGlHRyNkzkQoKDekoTp+dNcxUAkccnJSuHeKGE41aXN0iRC+QxT0xLXdzhlBZsutEOn
 hD4VfeEnzI6CkKI3ZvGMB2yXAwIWVQQacQxDpn8Mf6OLj4VVbm6aFkr
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

Introduce device tree for the HP Omnibook X Laptop 14-fe0750ng
(hp-omnibook-x14). It is a Laptop based on the Qualcomm Snapdragon
X Elite SoC. There seem to be other SKUs, some with Wifi-7 (WCN7850)
instead of Wifi-6E (WCN6855). This dt explicitly supports WCN6855,
I haven't found a good way yet to describe both.
    
PDF link: https://www8.hp.com/h20195/V2/GetPDF.aspx/c08989140

Supported features:
    
- Keyboard (no function keys though)
- Display (IPS 2240x1400, 300nits)
- PWM brightness control (works via brightnessctl)
- Touchpad
- Touchscreen
- PCIe ports (pcie4, pcie6a)
- USB type-c, type-a
- WCN6855 Wifi-6E
- WCN6855 Bluetooth
- ADSP and CDSP
- X1 GPU
- GPIO Keys (Lid switch)
- Audio definition (works via USB)
- prepared for DP Altmode

Bringup work has started with the Asus Vivobook S15 as initial template,
worked from there by comparing and copying from the CRD, QCP, 
Yoga Slim 7, Thinkpad T14s. Special thanks to all the people that helped
on #aarch64-laptops [1] with comments and suggestions.
I tested on my laptop, mostly. Since the dt is also in Ubuntu-Concept X1E
[2] there is also test exposure there, with some feedback.

For WiFi to work you need a board file matching the board string [3]. By 
experiment and pure guess I found the already existing calibration for
HP_G8_LANCIA_14 to be quite nice, it gives 866MB/s link speed here. A 
patch proposal is on its way.

For this patchset to work you also need patch [4] in the tree,
otherwise uart14 for BT will be mising.

[1] https://oftc.irclog.whitequark.org/aarch64-laptops
[2] https://discourse.ubuntu.com/t/ubuntu-24-10-concept-snapdragon-x-elite/48800
[3] "bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e108,qmi-chip-id=2,qmi-board-id=255"
[4] https://lore.kernel.org/all/20241007-x1e80100-pwrseq-qcp-v1-0-f7166510ab17@linaro.org/

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
Changes in v2:
- amended usb_mp_dwc3 definition to reference both phys that are used,
  as suggested by Krishna Kurapati
- Link to v1: https://lore.kernel.org/r/20241124-hp-omnibook-x14-v1-0-e4262f0254fa@oldschoolsolutions.biz

---
Jens Glathe (4):
      dt-bindings: arm: qcom: Add HP Omnibook X 14
      firmware: qcom: scm: Allow QSEECOM for HP Omnibook X14
      drm/panel-edp: Add unknown BOE panel for HP Omnibook X14
      arm64: dts: qcom: x1e80100-hp-x14: dt for HP Omnibook X Laptop 14

 Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 .../boot/dts/qcom/x1e80100-hp-omnibook-x14.dts     | 1693 ++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                   |    1 +
 drivers/gpu/drm/panel/panel-edp.c                  |    1 +
 5 files changed, 1697 insertions(+)
---
base-commit: 02d920be494a5f953319e7589d23a8ba3f00ce05
change-id: 20241116-hp-omnibook-x14-90539fac715d

Best regards,
-- 
Jens Glathe <jens.glathe@oldschoolsolutions.biz>



