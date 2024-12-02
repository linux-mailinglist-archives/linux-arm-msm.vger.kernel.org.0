Return-Path: <linux-arm-msm+bounces-39941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CA39E0D26
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 21:40:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CE94AB3D8A4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 19:41:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7047C1DE8AE;
	Mon,  2 Dec 2024 19:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PLIeE0i0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A191DE893;
	Mon,  2 Dec 2024 19:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733168492; cv=none; b=ZdvFQtNePS+fJiWsaPJEls+WDNUXDQaFoNHRh5Qe+ypTVPFSFq7n5k6OVi5t0ftnKbmss62uwaxJFSfc6G/ipCCWV6Afmuqb36kGCyQ+3H1LKR+lucYQ+gafo2SmNQ3UCFZM8F6GFVGD/FYhMEzVzJoZy0nrUn4AZAUrr4ioSxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733168492; c=relaxed/simple;
	bh=rNGn5lYsz515JXXPpEUswF6PhdUyNi1X5qQjQ2VMzQk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rXDgsor8eEHU3ImZuIYBxNInr3J+eDh9h22vWLOmP8+u6z6S/srhw9VB6+am8k/nAhLtdkQ/RX+UP6jErWneZ9WCTl+PgK5oaE+g1wDpnSEjvdnpNjqQii3dXJX+iI3qWyWj2du4p6gu7z/Sb9jYj0QMn8zF25Oo62DivGCnNCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PLIeE0i0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B7C86C4CED9;
	Mon,  2 Dec 2024 19:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733168491;
	bh=rNGn5lYsz515JXXPpEUswF6PhdUyNi1X5qQjQ2VMzQk=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=PLIeE0i0ErxutQaGoJFacKEuuSRwAbTgH9jFEcAK7glsvUzPe8941USzycIGkTC3o
	 bjQGlRb4uUlxkovJCqpsvTb+jKM1Z6w0iBusfMuL8oF9VFpkI6/XPI1jE5Cpawhv+D
	 k4lnAn0J2wvD1m2TopcHtXglXkQ/e7Q7zGUNL5AcF+3YgKwngxCupLYPMdw5cDkMLD
	 q5QxSqyadUiy+91S9qFzCSYSjlKyA6ARnviwsd8x4OhxzNi5BQRWT5KXvfQ6WTHf4/
	 FKXH7RK33UYjUhXiTDSRLJ+QjmoV3gx81WdCOkvUTIW64AOlcXkzJYfnRxFMo6urSH
	 +fRiePjom4Rmg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99484E69E87;
	Mon,  2 Dec 2024 19:41:31 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Subject: [PATCH v3 0/3] arm64: dts: qcom: x1e80100-hp-x14: dt for HP
 Omnibook X Laptop 14
Date: Mon, 02 Dec 2024 20:41:28 +0100
Message-Id: <20241202-hp-omnibook-x14-v3-0-0fcd96483723@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGgNTmcC/3XOwQ6CMAyA4VchOzuzlQHBk+9hPLCxuUWkZMMFJ
 by7g3gwIR7/Jv3amQTtnQ7klM3E6+iCwz5FfsiIsk1/09S1qQkwEJzzktqB4qN3EvFOJy5ozYq
 8No2qeNGStDV4bdy0iZdrauvCiP61HYh8nX4tEDsrcsqoFlCCYVAI05yxa4OyiF3A7jmm38JRu
 jdZ4Qg/WM72GCSsAoBKqlJKI/5iy7J8AN/wCEAIAQAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kalle Valo <kvalo@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733168490; l=3638;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=rNGn5lYsz515JXXPpEUswF6PhdUyNi1X5qQjQ2VMzQk=;
 b=q6EiZmR19/dO+ECqSEVIl03r794vd63LL70/3v3eyh3klS1GlTQmYtsF3aRlp8btfXVaopraW
 ZbEUTQrUfX+DTRw2/qQbUouiTnLyigTeSxgTHfPEXZaslydCLYt7ysy
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
patch proposal [5] has been sent.

For this patchset to work you also need patch [4] in the tree,
otherwise uart14 for BT will be mising.

[1] https://oftc.irclog.whitequark.org/aarch64-laptops
[2] https://discourse.ubuntu.com/t/ubuntu-24-10-concept-snapdragon-x-elite/48800
[3] "bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e108,qmi-chip-id=2,qmi-board-id=255"
[4] https://lore.kernel.org/all/20241007-x1e80100-pwrseq-qcp-v1-0-f7166510ab17@linaro.org/
[5] https://lore.kernel.org/all/f6693075-60ea-4fed-8453-9e124e94203b@oldschoolsolutions.biz/

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

Changes in v3:
- removed patch for the BOE panel from the set, already merged
  c1bae6802ee9 drm/panel-edp: Add unknown BOE panel for HP Omnibook X14
- added link to the WiFi board file patch
- Link to v2: https://lore.kernel.org/r/20241130-hp-omnibook-x14-v2-0-72227bc6bbf4@oldschoolsolutions.biz

Changes in v2:
- amended usb_mp_dwc3 definition to reference both phys that are used,
  as suggested by Krishna Kurapati
- Link to v1: https://lore.kernel.org/r/20241124-hp-omnibook-x14-v1-0-e4262f0254fa@oldschoolsolutions.biz

---
Jens Glathe (3):
      dt-bindings: arm: qcom: Add HP Omnibook X 14
      firmware: qcom: scm: Allow QSEECOM for HP Omnibook X14
      arm64: dts: qcom: x1e80100-hp-x14: dt for HP Omnibook X Laptop 14

 Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 .../boot/dts/qcom/x1e80100-hp-omnibook-x14.dts     | 1693 ++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                   |    1 +
 4 files changed, 1696 insertions(+)
---
base-commit: 02d920be494a5f953319e7589d23a8ba3f00ce05
change-id: 20241116-hp-omnibook-x14-90539fac715d

Best regards,
-- 
Jens Glathe <jens.glathe@oldschoolsolutions.biz>



