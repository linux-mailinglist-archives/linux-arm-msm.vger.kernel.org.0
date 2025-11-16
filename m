Return-Path: <linux-arm-msm+bounces-81961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1FBC612B0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 11:52:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7751B4E311D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 10:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0F7429C328;
	Sun, 16 Nov 2025 10:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aawreOUe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801F429ACD7;
	Sun, 16 Nov 2025 10:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763290345; cv=none; b=ukZTWC+etWa3DqkUDGNO5EzsdjjMLc7Ubj+YA7aCicK0Q+z3wZfLw0EzQpRqbSYXIU8woSuk6kFkzhtb4szZcQh4nswlh+o290L+/Xut950EM6qVj551rCB4TiRh3lRoBIGR6oHDy+6QNARMiYEnUgDrxchMpcXE9j5KVy5gzWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763290345; c=relaxed/simple;
	bh=OgNY0TEu2bd8MQFRjXHDBVM6Zf/pc0Mf/wDhXncFk3Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=D0fns0Fh/JJArzO+Qts+ERw2PWqb3ogg7WK2ShGzH6NElaRH7fJgUhJ1oGikp6VusLqIGpG+DzgWZ17F9CfZTVLRSAzGFdNRbZMPqxWNj0vvuuMIzqf37m/20lsOieAoelTGuMOBErBRKCRGsIYi2Dc9VTCQJzQNgjgqHYnaP0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aawreOUe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 05B97C4CEFB;
	Sun, 16 Nov 2025 10:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763290345;
	bh=OgNY0TEu2bd8MQFRjXHDBVM6Zf/pc0Mf/wDhXncFk3Y=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=aawreOUeyzM7eKFoQun7b1q9C3ld0LkwIxvAbQPNDT3i/vp0occ//6ywDyqm4/vUB
	 ChB8SXHzCJZvw+X8DmkMpRgS60SSNo/9owoACmVdjaFQlT3P4qzj2UL4/D9sv5QBPv
	 OL2um0HwD1Ku5ZxPD9b0pyGWNjYnuJhy/pu6VKsi1Hdr6n6Dh8TyY/Bssvxts6VfvL
	 Pg3O2IeBQ8fFevmhVnp5kD5/9/VQIFKkvdmJeUoKLftR9neXWTzTCR7wFJu/MFoGsb
	 F2qq6thKZ07TF0RxGYtfW05Qb8h2EtRhpqZMuTQsf4RGdtoK/t92OceSLyRugMoJgD
	 4R5rLnG8lMy7A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F04F7CEBF8D;
	Sun, 16 Nov 2025 10:52:24 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maud_spierings.hotmail.com@kernel.org>
Subject: [PATCH v2 0/6] arm64: dts: qcom: x1e80100-vivobook-s15: add more
 missing features
Date: Sun, 16 Nov 2025 11:52:05 +0100
Message-Id: <20251116-asus_usbc_dp-v2-0-cc8f51136c9f@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANWsGWkC/1WP3YqDMBCFX0VyvSn50TSRZel7LKXEzKQGqnETl
 S7Fd99or/byDMx3vvMiGVPATNrqRRKuIYc4liA+KuJ6O96RBiiZCCYapnhNbV7ybcmdu8FEmWD
 Silo4ZTQpL1NCH54H7vv6zgl/lkKd30cyYM72oLbV5w7ljEs6xyk4+uSoGWeM9jAEuirKqLTGa
 X8u1aAujzDaFE8x3b/2ss5mpC4OQ5jbyugOdMeVxeaM2ovGmQZqo7wDlOABtBASak52rT7kOab
 fY/TKD69Dpbj837fy4mA81NgZIxvUlz7Ogw2PU+kl123b/gBJHp0pQQEAAA==
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
 Maud Spierings <maud_spierings@hotmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763290343; l=1859;
 i=maud_spierings@hotmail.com; s=20241110; h=from:subject:message-id;
 bh=OgNY0TEu2bd8MQFRjXHDBVM6Zf/pc0Mf/wDhXncFk3Y=;
 b=aVNV0zq9yDJOdukxpIrRcYXhBFzEz0xnrtAB5fTCu5jAkv1ohHWcjSBhY4HwMA/Zkw4exH9e3
 rvF41rFguQnACBrRSLvN6eW5VTgIrknj4VYyUQaKukDrdO2FXtN/YgQ
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
Changes in v2:
- Fix the place of the rtmr regs to maintain alphabetical order
- Link to v1: https://lore.kernel.org/r/20251101-asus_usbc_dp-v1-0-9fd4eb9935e8@hotmail.com

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



