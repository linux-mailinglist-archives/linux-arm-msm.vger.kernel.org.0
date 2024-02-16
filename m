Return-Path: <linux-arm-msm+bounces-11307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 582C18579FD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Feb 2024 11:11:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DAC412843CE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Feb 2024 10:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12DE61CD27;
	Fri, 16 Feb 2024 10:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="WMtzc6KF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19811CD07
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Feb 2024 10:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708078255; cv=none; b=CaJ0zMXGITWclc6CA2C/mg6pmge76wlM2uMz4LREse4okqxqmrb2a55Mt9k2DPy+L4+u8AuxPzTP/9NmHMRR27HHkK2WzmZovcp+9ylA6lgQ1HOdGqYcgYDGBMBs1mwfsoA+nctnMN9zqfgRTzvwehZAVKjND9BQn6VCWSih28c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708078255; c=relaxed/simple;
	bh=+qmlePUCPEw55YerfIXLhUwFG622mu45eHNIVx7KqrY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QwRMYEO61rYYXUPamjv2h2IB1GqC5u+hUwrXlrWNYAtFA4jZL/Gg3iL91quqsJ55xTXpKHr4jZrpSpb1BJfOTeVJPfvtawjD0yK3NfXFYpikoQkj3amXPLobdpRiE79LX6xCkGzTADKszl2qaqvtEj5QExm2+KeTgHmFYPhQ9yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=WMtzc6KF; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a3de25186fbso46934266b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Feb 2024 02:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1708078251; x=1708683051; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZMRql7L8hsqbp6cXp+TzNFFLmZVefcT65u0H9tbQLBo=;
        b=WMtzc6KFUxTL3bR8yQbxMxvz4nUy/y/Duk4HJAP6KQDOXanlz0dWk5FzAzCoXVHNgU
         GrQOXCzirhXUBV+xiWZsD14fAd1yXPWz96x5MLhm39oOIN+mQ47STwY/fWkfktrrh+E5
         i/zTNT7zOBDPprB5P38C6HC6uFMZfjS5ytgZ/E24T6F5qcjTVg6+yBSEHf/vBqSO5Ttb
         oL9KCkHWL2ctAmYS3X1wEI/WxZDQAwDL30OBqJxVnm/ozw/32ljIy5ZHQ+nyDJiPpc/1
         a85XUaWUcxvD0nKoaU89bfVCVHMoz5l2iY5BfQx8vaCreAXprrpyNS5ReAYSWYRZG9MA
         UTAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708078251; x=1708683051;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZMRql7L8hsqbp6cXp+TzNFFLmZVefcT65u0H9tbQLBo=;
        b=Ox3vQIfOaLqComjZd8o7O8elITLZKQabIJjBDy5LDIDBdHhLmkQ7qPxSrkTl4bcoyv
         uwH7iQiwTsDBD3IxHyFglAxEk6K8Pty9FxRMhyyorxLoLgtZk/1gfY+DL024st1lALSy
         21vu7y9cUZQLVLT8BaIUEvbdJv1zp41GzmADqBt54Xr69MrlYdRaNbWmg0+qFGkVQZHj
         yN2EZEFN5ajpmi7ABQ9KUdGYGedHp7lxsJ3+zYu5fhpyfd6pwthPZrBwYwEujRygSZJ5
         oUlT/is/hCEXLQwDthYuKw9Uz8E5wBqpgQfgvK38nQjFpwJB/qrGR3Rp7LHhSCFtQo4H
         hjZA==
X-Forwarded-Encrypted: i=1; AJvYcCWhVoYFt2XO+tR+TAuE9PH87CQNXXhxhsiijRkwJgC+DnuW5OBjCabUDkp6aBfARScRBMdDeti60Rjc+zXbFjS9BT3A/AYx4jpDQ+I1Qg==
X-Gm-Message-State: AOJu0YwohFthPmcoMs8dNQJlT8b8bVw2NDMaYbN2UanCXT1E1RR3mpLv
	2f/UQ2bsO6iYNVieHCdF1L034YsFhMCpw9E+u6robTR/apnepFduKRdrzboQF1I=
X-Google-Smtp-Source: AGHT+IGrFTfr1Ah+H+VEMxSBiGjCEBAP5CJc6Ef5z0y9q4E2tBIqwXWKDxCN1lwogTQUbwXHelSW8g==
X-Received: by 2002:a17:906:b847:b0:a3d:6f46:ac3a with SMTP id ga7-20020a170906b84700b00a3d6f46ac3amr2958890ejb.11.1708078251164;
        Fri, 16 Feb 2024 02:10:51 -0800 (PST)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id s18-20020a170906169200b00a3d1897ab68sm1398019ejd.113.2024.02.16.02.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 02:10:50 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v3 0/4] Add display support for Fairphone 4
Date: Fri, 16 Feb 2024 11:10:47 +0100
Message-Id: <20240216-fp4-panel-v3-0-a556e4b79640@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKc0z2UC/22MwQ6DIBAFf8VwLs0uipqe/I+mh0WhkrRAoCFtj
 P9e9GSaHuflzSws6Wh1YpdqYVFnm6x3BepTxcaZ3F1zOxVmAkQDCJKb0PBATj+4BFLUy7olIFb
 +IWpj33vreis82/Ty8bOnM27rv0pGDhzJKFKjlKJrB0M2htk7fR79k22lLA42wtEWxe5pQsSuM
 a1Uv/a6rl8cd01w5AAAAA==
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4

Introduce the bindings and panel driver for the LCD panel with the model
number 9A-3R063-1102B from DJN which is using the HX83112A driver IC. It
is used on the Fairphone 4 smartphone.

Then we can add the panel to the device dts and also enable the GPU.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v3:
- Update compatible to djn,9a-3r063-1102b
- Add defines for manufacturer-specific DSI commands
- Pick up tags
- Link to v2: https://lore.kernel.org/r/20240110-fp4-panel-v2-0-8ad11174f65b@fairphone.com

Changes in v2:
- Driver:
  - Drop "bool prepared" from driver (Dmitry)
  - Use drm_connector_helper_get_modes_fixed (Dmitry)
  - Use dev_err_probe in error path (Dmitry)
  - Fix width/height variables (myself)
- Dts:
  - Don't drop simple-framebuffer (Konrad)
  - Drop disablement of gmu in dtsi (Konrad)
  - Set zap shader path (myself)
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20240105-fp4-panel-v1-0-1afbabc55276@fairphone.com

---
Luca Weiss (4):
      dt-bindings: display: panel: Add Himax HX83112A
      drm/panel: Add driver for DJN HX83112A LCD panel
      arm64: dts: qcom: sm6350: Remove "disabled" state of GMU
      arm64: dts: qcom: sm7225-fairphone-fp4: Enable display and GPU

 .../bindings/display/panel/himax,hx83112a.yaml     |  74 ++++
 arch/arm64/boot/dts/qcom/sm6350.dtsi               |   4 +-
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  |  53 +++
 drivers/gpu/drm/panel/Kconfig                      |  10 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-himax-hx83112a.c       | 372 +++++++++++++++++++++
 6 files changed, 511 insertions(+), 3 deletions(-)
---
base-commit: 91f11e5814cfbad83ee22fbcf96b0eb41302d889
change-id: 20240105-fp4-panel-50aba8536a0a

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


