Return-Path: <linux-arm-msm+bounces-109113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHI1K4wnD2paGgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 17:41:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 644A15A8856
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 17:40:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 026B63145E21
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 14:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 123B7363C6B;
	Thu, 21 May 2026 14:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="obldQwLy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F9736492A
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 14:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779374801; cv=none; b=vGkS8zsJSl1NrGRKyc6SFTDAzfZWHBmKYIxBLPY8LLGbpjv/Jvrrs755duoDLnZdR635/F34Zp4Livw3Uaej79kBBzq9tutb0xs09RC5mgnnJYbcBp8eDRae+vABc7GJCS6eme5cJTp3xP8lyO+Qayx1j6Y0rdx/5O4gdVkdo0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779374801; c=relaxed/simple;
	bh=9/4X222Ffhg6qxLQzzfx1T7bWcnktGM6AwovaxbqqjY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=giKBJgjaQveAV8qoVo3hcXgWmQldItF0rTfszoymPh/zkLBcMH24i/kQWreZL8nYg5pUmVwNAD9hgB7x/C7bs8J119hiMmkGItk8hOJAPFGvZFyKKQlKvPoGa6Fm5yrOY92d0QijVXASdZVd5Ynfg9XthqtOJjFuHVsU3yxpwmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=obldQwLy; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-368f25ff4c4so3284220a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 07:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779374799; x=1779979599; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MYcMfa9UmKpbrcq2eKdzXRn9iD3DzK0oC+yU6GOGJbQ=;
        b=obldQwLy9++pGZEkvq9vCp1fG8Kv+fEuZeAc+QCto1FCEUsNh1p/Z3DLcx/usDJeIE
         xQ5cWbuJGU8jgwNXyuzSNlBBfFUwYLSRVbg4k6ZYz1JnIbDOnfZaOko5o1FDIzBwFVmm
         513nvDI4eKKPNerIEs4YCx5OEoQ0yFKiL11Mi6eD0d65yIXgpMPTmSE9JWMlgWRYK0/x
         mmhITp17sDNh64Hl36a9mbjMoqqwrZ90qbblpWjkbMi1Tg6f2gcVwH+lFgx5Wi6nlBKA
         T/urfcUZyLHBUAI9Kb5iqaJ+LBdp2BeyqmcUkXBXjrbqIavp7ksomSdPxl3BcCvfrobZ
         odAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779374799; x=1779979599;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MYcMfa9UmKpbrcq2eKdzXRn9iD3DzK0oC+yU6GOGJbQ=;
        b=HUlWXNBRW3IyaLv3JVVhLlVogQhl6+CL70zIV0Rg4axCETx7YLM0OtSYEwt9d2lq9O
         +d6vivk8tT80EZJOQM5bHf1h5Z0a7IIDzSyGpSPas4AGDC68Euwt591ha5Eb2WDLIGA8
         rIep+ml6d38dvJowxOr1/RsIWHUf/MFmdmW8tgFSWT1aVMuQcrdEaO1GRa/mpAo1k5rp
         RAQo5cPiSQEkeSqDYem5/xsIfiR6KOrdCi+Qbl5pT6yyK31Aog43XOKtAgSrg/b5t+hp
         i8Uh/iVCKifr0PdlCvUqKFuCpnAePXB14bdm48NwWzW2l4LkVJHBftw/ClaWgRJFkLt3
         4vfQ==
X-Gm-Message-State: AOJu0YwRDbnF7f7uhdmTV1QfLw/MIdPWVhTI2ID89DCfmMbrDtKj9lTK
	kVUeGwUFO7LtwLG5Dt9LNgwVoOyWcpe1luTTgrrDlZ2z5aARWy/n4Ea/DFaMzb5mWo8=
X-Gm-Gg: Acq92OGC2nORbnLJRAXzOvr2fud2Cm6GdpQk05eqXc+2bmiKH1HHH9pM3g+4hUw/VXZ
	imXtg1PZZlD0xkiw6Bjj6vooq75VMLYtkEhZD8uXHi32MestTOUqaGp6yyr8ITi9YEV2ZHM/oQz
	bhuRLxXZxUCFjkftGNUPpxdYgDFlXV2bK/BBAxpgd4lM2TOB6Q5xfDbL5NocvPjltVE0Jx7jejx
	vDnY6/tMhwZAsqT4YRMUVPOOTKr1gjI7KWRn/gjrAZfUDxRQrEpzxWe0ImumTlZ9XZDCueS1XqW
	VwKvrQRfyIGpTbwiBdzgq/DdMwJG659KockCiFbhoiEeN/wbybszbPsVrtBsOVuwhbjE1M8j4ja
	9NZZg3w7OFqchDjZCN7iJmLg48bi9moG7Tf+A5vBi/JI9IanM2GwwD8AonPiJSWSMHNaDFmZdcA
	txttLl
X-Received: by 2002:a17:90b:578e:b0:368:6a6e:94dd with SMTP id 98e67ed59e1d1-36a4577cf96mr3442038a91.24.1779374798897;
        Thu, 21 May 2026 07:46:38 -0700 (PDT)
Received: from [127.0.1.1] ([2a11:3:200::109e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a5bff3ef3sm476527a91.4.2026.05.21.07.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 07:46:38 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Subject: [PATCH v4 0/5] Add support to 2 panels in bonded-DSI mode
Date: Thu, 21 May 2026 22:46:02 +0800
Message-Id: <20260521-sm8650-7-1-bonded-dsi-v4-0-a4dd5e0850f1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKoaD2oC/x3MQQqEMAxA0atI1gZqmTYyVxEXOknHLKxDAyIU7
 26Z5Vv8X8GkqBi8uwpFTjU9csOr7+CzLfkrqNwM3vnogh/Q9jEGh4QDrkdmYWRTpIU4rORSHAl
 a+yuS9Pp/p/m+HxErmS1nAAAA
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Jun Nie <jun.nie@linaro.org>, 
 Jonathan Marek <jonathan@marek.ca>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779374785; l=2436;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=9/4X222Ffhg6qxLQzzfx1T7bWcnktGM6AwovaxbqqjY=;
 b=/WKxz3iXOXS5uf1GNcLWawLpDSfY6swFLXN24AUeDm+crBP+skomIhxxoU8jLwoiGj3q7hP1k
 OgvdCnEyzLnB6puoNidZaS2wb/hzD24i+mXd4X9wALv1DEvag78eMwX
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109113-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jun.nie@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,linaro.org:email,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Queue-Id: 644A15A8856
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The 2 DSI interfaces may be connected to 2 independent panels in bonded-DSI
mode. Horizontal timing and DSC configuration are adjusted per individual
panel in DSI host side. Support to multiple slice per packet is added for
the device setup to test the usage case. A panel driver is included as an
use case example.

Changes vs v3:
- A panel driver is added as an use case example.
- Move dsc_slice_per_pkt to struct drm_dsc_config.
- Polish commit messages.
- Link to v3: https://lore.kernel.org/all/20250924-dsi-dual-panel-upstream-v3-0-6927284f1098@linaro.org

Changes vs v2:
- Polish commit message to describe usage case and requirements to
  panel driver.
- Remove changes in device tree and add dual_panel flag in mipi_dsi_device
  to pass information from panel to dsi host.
- Drop the register programming to DSI_VBIF_CTRL, as no issue is seen
  in latest test.
- Link to v2: https://lore.kernel.org/r/20250220-dual-dsi-v2-0-6c0038d5a2ef@linaro.org

Change vs v1:
- Add device tree binding for dual panel case in handling frame width for
  DSC to avoid breaking existing dual-DSI case.
- Leverage Marijn's patch to configure proper slice per interface in
  dsi_update_dsc_timing().
- Polish commit comments.
- Link to v1: https://lore.kernel.org/all/20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org/

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
Jun Nie (5):
      drm/msm/dsi: support DSC configurations with slice_per_pkt > 1
      drm/mipi-dsi: Add flag to support dual-panel configurations
      drm/msm/dsi: Support dual panel use case with single CRTC
      dt-bindings: display: Add Synaptics R63455 panel support
      drm/panel: Add driver for Synaptics R63455 DSI panel

 .../bindings/display/panel/synaptics,r63455.yaml   | 125 ++++
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |  33 +-
 drivers/gpu/drm/panel/Kconfig                      |   9 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-synaptics-r63455.c     | 631 +++++++++++++++++++++
 include/drm/display/drm_dsc.h                      |   7 +
 include/drm/drm_mipi_dsi.h                         |   2 +
 7 files changed, 792 insertions(+), 16 deletions(-)
---
base-commit: 6654f8f33aa6229a90d4401519a62a2bf96cb851
change-id: 20260521-sm8650-7-1-bonded-dsi-7a7d5b70f687

Best regards,
-- 
Jun Nie <jun.nie@linaro.org>


