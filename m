Return-Path: <linux-arm-msm+bounces-79990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D973C27E5C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 01 Nov 2025 13:54:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3630189B16F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Nov 2025 12:55:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 081612C234B;
	Sat,  1 Nov 2025 12:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m2Ja8INm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4FF285CA3;
	Sat,  1 Nov 2025 12:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762001682; cv=none; b=hpAPw/4QWHWr4J2Ga1YiLLjvaWiMZ3pcfw2aBXDGvKux+1F5XYN76VlWg0w2NBSbF2N8yyTv65DFETK2j5OcdzHBcmNzT+kgx4AbnQdFUUsT7z5vCMufL18xzA3awTd7ZUMizTGs4ySlA8+IFRLHjDmQDrcp1R7EnTf+JIFffxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762001682; c=relaxed/simple;
	bh=u8wLUW6Z9fiKj5eOJYtlEh+2BUk0OgRlOVt2xpH117E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Wc9Qm9BGqBGLUIwkfaJ3kNEfeFLJoYC9eX+ZeIOyqCzW0eOlVFczg5dfh9Gm6vKU+MHLPSpTDiZY4F7+aD7tu4mgaoVaApiRDmjGRIrRwNcPOkrTz/mw5c/QgB6IU20y0XvA/pnqY7mTSnKh2E5uQQW8CdKiNlJKfV0vfPfAbrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m2Ja8INm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5798DC4CEF1;
	Sat,  1 Nov 2025 12:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762001682;
	bh=u8wLUW6Z9fiKj5eOJYtlEh+2BUk0OgRlOVt2xpH117E=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=m2Ja8INmdmWC+X9QiZI/7Ju8nffsDc41U90B44Ib7WcVp6vUo4JqlJjoOl1yKT56E
	 7MVzY84TraRsZpgUsoPw6XoRF1fjyeo3GnboQIK+okHNo7n3d8FSVqo2ROoiF5qtiC
	 vVOPO8hqGk/oOyQ91JT35BHZDkVzFmJuogMnFXVffC9ugf12XovXvInne/ZWBNA+yN
	 HeTmy9FXRi+RheaBoqM1YaSFP7yyTOcS8wi6DDalSRYYVL1BGDuP+IyPsXJiJTZbo7
	 9SIFt54sqomIX79v1eu1KCYF5VKHt0pmXePMZBkB8zaD+Pn+CLqbmsSImSi2U2JFd6
	 BKF0dZ7BePKOA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FB1FCCFA00;
	Sat,  1 Nov 2025 12:54:42 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maud_spierings.hotmail.com@kernel.org>
Subject: [PATCH 0/6] arm64: dts: qcom: x1e80100-vivobook-s15: add more
 missing features
Date: Sat, 01 Nov 2025 13:54:11 +0100
Message-Id: <20251101-asus_usbc_dp-v1-0-9fd4eb9935e8@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPMCBmkC/yWN24rCMBRFf6Xk2SO5tDEpg/gfg0iac6IB23SSV
 gTx3yfVx7Vhr/VihXKkwvrmxTI9YolpqiB2DfM3N10JIlZmksuOa9GCK2u5rGXwF5yBS66cbKX
 X1rB6mTOF+Pzofs9fzvS3VuvyHdlIpbiPtW9+NqngQsGS5ujhKchwwTnccIzw0MBBOetNONQ06
 tM9Ti6nfcrX4xYbXCHwaRzj0jfWDGgGoR11BzJBdt522FodPJLCgGikVNgKdn6//wG1sxP+9QA
 AAA==
X-Change-ID: 20250614-asus_usbc_dp-0203a242c698
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Maud Spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762001681; l=1678;
 i=maud_spierings@hotmail.com; s=20241110; h=from:subject:message-id;
 bh=u8wLUW6Z9fiKj5eOJYtlEh+2BUk0OgRlOVt2xpH117E=;
 b=zZCnXRfNh5ObdUMoRA0mRNkebgUnURd3FVRw3ClZhVV36UkJPFZ1zarismFBaXyve+lPr+fvc
 kaeH65WFNenAPU5QkTPWLPNiEoi1BjmzdZOjk+cYd85IxnBzVV8D7Zi
X-Developer-Key: i=maud_spierings@hotmail.com; a=ed25519;
 pk=CeFKVnZvRfX2QjB1DpdiAe2N+MEjwLEB9Yhx/OAcxRc=
X-Endpoint-Received: by B4 Relay for maud_spierings@hotmail.com/20241110
 with auth_id=273
X-Original-From: Maud Spierings <maud_spierings@hotmail.com>
Reply-To: maud_spierings@hotmail.com

There are still many missing features on this machine, add the ps8830
retimers for display over usb-c, the simple bridge/HDMI port and set up
to use IRIS.

Currently IRIS gives a ETIMEDOUT, not sure what that is coming from.

lots of these patches are very strongly based on the work of other
maintainers of these snapdragon machines, like the HDMI part on that of
Neil Armstrong, many thanks to those who laid the baseline for me to
follow.

Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
---
Maud Spierings (6):
      dt-bindings: display: bridge: simple: document the Parade PS185HDM DP-to-HDMI bridge
      drm/bridge: simple: add the Parade PS185HDM DP-to-HDMI bridge
      arm64: dts: qcom: x1e80100-vivobook-s15: enable ps8830 retimers
      arm64: dts: qcom: x1e80100-vivobook-s15: add HDMI port
      arm64: dts: qcom: x1e80100-vivobook-s15: add charge limit nvmem
      arm64: dts: qcom: x1e80100-vivobook-s15: enable IRIS

 .../bindings/display/bridge/simple-bridge.yaml     |   1 +
 .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   | 402 ++++++++++++++++++++-
 drivers/gpu/drm/bridge/simple-bridge.c             |   5 +
 3 files changed, 400 insertions(+), 8 deletions(-)
---
base-commit: 98bd8b16ae57e8f25c95d496fcde3dfdd8223d41
change-id: 20250614-asus_usbc_dp-0203a242c698
prerequisite-message-id: <20251013-topic-x1e80100-hdmi-v6-0-3a9c8f7506d6@linaro.org>
prerequisite-patch-id: 5af0a76cad087e18b0a2f771a78d030f9bf3bd68
prerequisite-patch-id: 5b908c1f0c5a0c52da384a181a75f17c5e2d19b5
prerequisite-patch-id: ed40af8d7e99a3f1bcb33b4c678b5f21b0618612

Best regards,
-- 
Maud Spierings <maud_spierings@hotmail.com>



