Return-Path: <linux-arm-msm+bounces-38970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B34329D7045
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Nov 2024 14:32:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78D81281C99
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Nov 2024 13:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 746CC1D0B82;
	Sun, 24 Nov 2024 13:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="paVKX0kq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475C31AD3E4;
	Sun, 24 Nov 2024 13:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732454420; cv=none; b=Uv0Njj5z42LMlOb5WVZFV8WQumNMWTCK9CycAKOQ/dUBY+N+fVvx7sLjCYl5jrEt782rPsI0nC9P+aezuBJsPXpjA3RPZWpBOUYFpeb0XfNZmI5p8a6aHebixWE/kngyuPE7gqub6LllS7dVCku6JeBhdYrmgtiJ2lgwtfCtD/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732454420; c=relaxed/simple;
	bh=o3qDnzRB7JA/YNfKWgznRZdQVguoCPuO7AEYr5dX23k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kFCSrYJzAoSZzq+unQApJd6vKQLVNdF4Ut0g0rbFuH2owePS97l3KC03hyawvL3StP/5WKiZpqwhCLwjiYhj9zCZif4rSyvK/qAtaCUnB/gYM8yoNb+YA991GSb89tpl7VMEM5RABiqlSk7iAgTTxIAxIuUsZeM4/5uCVrQ/P4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=paVKX0kq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C9B0CC4CECC;
	Sun, 24 Nov 2024 13:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732454419;
	bh=o3qDnzRB7JA/YNfKWgznRZdQVguoCPuO7AEYr5dX23k=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=paVKX0kqYT2nvdoHufguy5HfyyG9XXp0+VAkZMVGWHodWNczuWccwMIqFtmozVGbF
	 uXx9kB1mZxBH++OlQbCJiGejLAA0VwLhEZqe4RxFsPphFCOp3dX5vi2wTwesX5VSok
	 nfozbmiugYPXqlsss/bbXa113/42znbQhnvvMl2gCZW3r74ilE1s0yvKPsbhWjEp1K
	 mxawjgP7rFj7IGuwF+lYVhDXoDpb9Ow9pBHEOQeJQiLn6ntpBP5YbzF0BxxJUPLKCl
	 cZR8S0bktX+1/Paq+G21XEKgQB6eKsHUTlBW9E945t0DUgDjbEyaSy6UOQE6rmZIBd
	 ibq43Ea5z4GHA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4EE6E66887;
	Sun, 24 Nov 2024 13:20:19 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Subject: [PATCH 0/4] arm64: dts: qcom: x1e80100-hp-x14: dt for HP Omnibook
 X Laptop 14
Date: Sun, 24 Nov 2024 14:20:14 +0100
Message-Id: <20241124-hp-omnibook-x14-v1-0-e4262f0254fa@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA4oQ2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDQ0Mz3YwC3fzcvMyk/Pxs3QpDE11LA1Njy7TEZHND0xQloK6CotS0zAq
 widGxtbUAwF/s9WEAAAA=
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
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732454418; l=2781;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=o3qDnzRB7JA/YNfKWgznRZdQVguoCPuO7AEYr5dX23k=;
 b=xaxMZTW7q82I7KgHQhtF4RH7TZalgHO5X4PZkOpcLhkzbDQJYpj3ZgrgQXc1h31/KM1wPgSat
 IXibu276GryBpYmi/fV6BchNUun2XnxEqk/QkA79MBIZx2z03Tce85A
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
base-commit: b59c450dec42537800be384db7e552042b72f93c
change-id: 20241116-hp-omnibook-x14-90539fac715d

Best regards,
-- 
Jens Glathe <jens.glathe@oldschoolsolutions.biz>



