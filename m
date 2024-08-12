Return-Path: <linux-arm-msm+bounces-28326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B05094F129
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 17:02:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1CD7928242E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 15:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCF72183CD7;
	Mon, 12 Aug 2024 15:01:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ns.iliad.fr (ns.iliad.fr [212.27.33.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E53187340;
	Mon, 12 Aug 2024 15:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.33.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723474878; cv=none; b=rfWl0DFW7ZW1vAW0mX0jntAPqmMp9OYNfmprF3BFyis06G2r6aoddOpGTXVAOsyFzRkZRTkm80xsuHAwwKROUhLK0dTu7WbAlbluIizQ41XTRBEwDcLdUiP5GS26uVtURCn6Lf/mIl7CLYpQwJgmpfcJIpd2tN2nQ8sRu+vx9wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723474878; c=relaxed/simple;
	bh=TayYbsyzVLGiDKZvxeVxzrQ0Xg+iZi5h6ISADEv+Ynw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=drte8O3XiIAN9t2muUzylkhWPlPhDD6hMiLWTRyP1DAOgavmVGQOFQpxLY1bGAX9q6x0LykSS1E5gdvZsK3QakvGgj/P2mRUW04QWlXqTwXHdKWBg5T08+VHi8y+C/3kVuWQ+Vtr8PxrHrGN9DbQBptPX1yrjs71iZS7ppd+p/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=srs.iliad.fr; arc=none smtp.client-ip=212.27.33.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=srs.iliad.fr
Received: from ns.iliad.fr (localhost [127.0.0.1])
	by ns.iliad.fr (Postfix) with ESMTP id E856E20621;
	Mon, 12 Aug 2024 16:51:07 +0200 (CEST)
Received: from [127.0.1.1] (freebox.vlq16.iliad.fr [213.36.7.13])
	by ns.iliad.fr (Postfix) with ESMTP id D6E1C2060B;
	Mon, 12 Aug 2024 16:51:07 +0200 (CEST)
From: Marc Gonzalez <mgonzalez@freebox.fr>
Subject: [PATCH v5 0/2] Basic support for TI TDP158
Date: Mon, 12 Aug 2024 16:51:00 +0200
Message-Id: <20240812-tdp158-v5-0-78684a84ec23@freebox.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFQhumYC/2XOyw6CMBAF0F8xXVszfdAWV/6HcdHHVLoRUgzRE
 P7dwgIwLO9kzp0ZSY85YU+up5FkHFKf2lcJ1flEfGNfT6QplEw4cAmKafoOHasMlcxwgKC8B0f
 Kcpcxps9SdH+U3KT+3ebv0juweXqoGBgFGmJtMOqAXoVbzIiu/VxiJnPHwHeOV6vjxVnhhJQad
 LT64MTebfdEcdHx6LwBI6Q6OLk5LWB1cv7TqhqAuYCW/7lpmn47OIqARQEAAA==
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Arnaud Vrac <avrac@freebox.fr>, 
 Pierre-Hugues Husson <phhusson@freebox.fr>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Marc Gonzalez <mgonzalez@freebox.fr>
X-Mailer: b4 0.13.0

TDP158 is an AC-coupled DVI / HDMI to TMDS level shifting Redriver.

Like the TFP410, the TDP158 can be set up in 2 different ways:
1) hard-coding its configuration settings using pin-strapping resistors
2) placing it on an I2C bus, and defer set-up until run-time

The mode is selected by pin 8 = I2C_EN
I2C_EN = 1 ==> I2C Control Mode
I2C_EN = 0 ==> Pin Strap Mode

On our board, I2C_EN is pulled high (hard-wired).

---
Changes in v5:
- Add BSD-2-Clause option in YAML binding (Rob) + add Rob's tag
- Link to v4: https://lore.kernel.org/r/20240730-tdp158-v4-0-da69001bdea2@freebox.fr

Changes in v4:
- Rebase series on top of v6.11-rc1
- Add blurb about I2C vs pin strap mode in cover letter
- Add blurb about I2C vs pin strap mode in binding commit message
- Add blurb about I2C mode in driver commit message
- Add comment in binding explaining when reg is required
- Add comment in binding describing Operation Enable / Reset Pin
- Link to v3: https://lore.kernel.org/r/20240627-tdp158-v3-0-fb2fbc808346@freebox.fr

Changes in v3:
- Add 'select DRM_PANEL_BRIDGE' in driver Kconfig
- Fix checkpatch errors
- log errors using dev_err (so save dev pointer)
- expand a few error messages
- expand commit messages with info from the datasheet
- mark regulators as required in the DT binding
- Link to v2: https://lore.kernel.org/r/20240625-tdp158-v2-0-a3b344707fa7@freebox.fr

Changes in v2:
- Don't overload simple-bridge, spin new minimal driver
- New driver, new binding
- Default device settings work fine for us, so we don't tweak registers
- Link to v1: https://lore.kernel.org/r/20240617-tdp158-v1-0-df98ef7dec6d@freebox.fr

- Link to v0b: https://lore.kernel.org/r/b41f2f86-0d99-4199-92a9-42cbb9d6a6d5@freebox.fr/

- Link to v0a: https://lore.kernel.org/r/d3de652f-ce89-4f57-b900-07b11f8bf8f9@free.fr/

---
Marc Gonzalez (2):
      dt-bindings: display: bridge: add TI TDP158
      drm/bridge: add support for TI TDP158

 .../bindings/display/bridge/ti,tdp158.yaml         |  57 +++++++++++
 drivers/gpu/drm/bridge/Kconfig                     |   7 ++
 drivers/gpu/drm/bridge/Makefile                    |   1 +
 drivers/gpu/drm/bridge/ti-tdp158.c                 | 108 +++++++++++++++++++++
 4 files changed, 173 insertions(+)
---
base-commit: c6072668fcfb13295b600747dbd89f00da1a4ed9
change-id: 20240617-tdp158-418200d6cc0b

Best regards,
-- 
Marc Gonzalez <mgonzalez@freebox.fr>


