Return-Path: <linux-arm-msm+bounces-53813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A86E4A84040
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 12:13:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4E5B1BA0E0F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 10:10:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D39526B95F;
	Thu, 10 Apr 2025 10:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fIDnKzJ3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60539267722;
	Thu, 10 Apr 2025 10:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744279683; cv=none; b=JjeRdbxMuhs3rnSPBnNwPVf3d0W7W2d7O2G2zI/m9RUsJ78M0X3zMuaLry0h06anTzy97AshVr70weCTmE0D13FXi1SMV5cp0rby4lSZjqbMC3AwA1dSvUHUGirQy1NzrU5i+5Nej9WAgVP+UbZX9hCqSIlXzFPjLYbb6AH8v2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744279683; c=relaxed/simple;
	bh=63Q2CP1BjWPMJIsb/dxHjtnUbcBupGKBm9IiQVKWr7o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=adWq9SMhpwd9cACOzBR8Q5avMWK4demVmZOFlPU042EWzhAxd7316p6321A5SE8gJrQRSD5PWo4GRnhV2ksc7foTkqWZk4Od+aa+SrXw+DHZrOy75IX9wbvD2anNRQBnNOawHt7ElN3zGTrWIBvFQbRYE9MCVyvtBxuLSjyKR7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fIDnKzJ3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D038EC4CEDD;
	Thu, 10 Apr 2025 10:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744279682;
	bh=63Q2CP1BjWPMJIsb/dxHjtnUbcBupGKBm9IiQVKWr7o=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=fIDnKzJ3wWuyN+D28ZX3a75/K6ZAmTj7z1ReQ73W4dFXNVSjospzUtCngaaXJ+m45
	 gT7rFPGKpoDlNeAbuZsdl9S04vKYEuU7pApb6K4+ebRxSCDRKOKWvyDA4hoHPnBepJ
	 s4ZL65se4D/y1L1DwIgSu3+IKvZTlR2n0KP1DrM0lRjkcGwScJ5qQjZEedfTbxrr1W
	 GP3X2/W+lqiyhUMDkqCe9MM7TsPYZa+wbMf1D+bwfLXUu9BUKuBgO+00ORsisocloY
	 iXoemd8h2fY/vsDOXVfFBCsZY/o6BaT6pPw7Z+/dn+YedK5LvTJB8LGjCMUIF8egeN
	 UwBFJQ/Rl5nTQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B578BC3601E;
	Thu, 10 Apr 2025 10:08:02 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Subject: [PATCH v2 0/3] arm64: dts: qcom: x1e80100-hp-x14: add
 usb-1-ss1-sbu-mux
Date: Thu, 10 Apr 2025 12:07:27 +0200
Message-Id: <20250410-hp-x14-v2-0-d36414704a0a@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF+Y92cC/zXOQQ6CMBCF4auQWVvTViDWFfcwLGgZ7CSEkg4Sl
 PTuVqLL/2XyZXZgjIQMt2KHiCsxhSmHPhXgfDc9UFCfG7TUlSylEX4WmyqFHFR/ra2ztTGQj+e
 IA20HdG9ze+IlxNfhruq7/ggl/8SqhBS2xMp1urqgM00Ye3Y+hJHD+FzyJ3y29IY2pfQBG99Ut
 6kAAAA=
X-Change-ID: 20250409-hp-x14-0f1d86bcb699
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744279681; l=1464;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=63Q2CP1BjWPMJIsb/dxHjtnUbcBupGKBm9IiQVKWr7o=;
 b=tuqFUauzJa7LaauxOGCboKN4tSuMaOgeQubZN0kK0oeSGsOJFIel2tA1kTb4gywWqDDSUfRFw
 V4xOSZ+9scmDW5Od13VRx9SUYjG3VbroHfZ+7DLgFiIsCimIbrouG90
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

The usb_1_1 port doesn't have the PS8830 repeater, but apparently some
MUX for DP altmode control. After a suggestion from sgerhold on
'#aarch64-laptops' I added gpio-sbu-mux nodes from the x1e80100-QCP
tree, and this appears to work well. It is still guesswork, but
working guesswork.

Added and rewired for usb_1_1

Also, did some more changes as tested here:

- remove unused i2c buses
- amend order of nodes.

The series is based on [1] from Johan.

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
Changes in v2:
- removed overlapping patches with [1] and [2] - thanks Johan
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://lore.kernel.org/r/20250410-hp-x14-v1-0-b4e5ca253ec9@oldschoolsolutions.biz

[1] https://lore.kernel.org/lkml/20250328084154.16759-1-johan+linaro@kernel.org/
[2] https://lore.kernel.org/r/20250319160509.1812805-1-juerg.haefliger@canonical.com

---
Jens Glathe (3):
      arm64: dts: qcom: x1e80100-hp-x14: add usb-1-ss1-sbu-mux
      arm64: dts: qcom: x1e80100-hp-x14: remove unused i2c buses
      arm64: dts: qcom: x1e80100-hp-x14: amend order of nodes

 .../boot/dts/qcom/x1e80100-hp-omnibook-x14.dts     | 98 ++++++++++++++--------
 1 file changed, 62 insertions(+), 36 deletions(-)
---
base-commit: 2791023c72489c91f59cfe818776fc6cd164ddad
change-id: 20250409-hp-x14-0f1d86bcb699

Best regards,
-- 
Jens Glathe <jens.glathe@oldschoolsolutions.biz>



