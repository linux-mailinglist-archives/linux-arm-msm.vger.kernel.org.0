Return-Path: <linux-arm-msm+bounces-41045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE2C9E9356
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 13:09:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3842D287EC6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 12:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EFA121E0AF;
	Mon,  9 Dec 2024 12:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dTKdYhar"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3D71EB2E;
	Mon,  9 Dec 2024 12:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733746179; cv=none; b=bi/Q6MYPGucC/ImPjCZ1appH1Dk3z7Zlt8oEPxbcLg93WjNdnPXY6xTTYffMuuRDRok6Y28bgfJx6enFEo7bB46jr7SfzI5jr8WaXAHu1JPxbo55kV6OsRzWTkL47QxYw8/adCcK2HpXoqTFIHN0SmlYKR4fzh7Zo+uxZDIVmW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733746179; c=relaxed/simple;
	bh=lLHA5agnNJKjcjnn/wA0ZkwS4va8vtSABzdxIKae3Tw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=s/XKhFVvIIyB6WkYjwEXKVvpwwPq7riJ8gjctwZef/HNY8x+C+4magn6rUZSo6kjvR8N9Dn/EupfeZl/CJAIv+dB+e6w+FVuK573CjbxoWnHS0t4pBwj/4IWVlh/5v0BLYnV3tvki6OfJhmGY258haV4YUk5ljvfCUAXU3rbAUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dTKdYhar; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aa560a65fd6so776904966b.0;
        Mon, 09 Dec 2024 04:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733746176; x=1734350976; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YZZgRX91gto3aMdAT5EhPMxWti4jkggrFz4EafseQZM=;
        b=dTKdYharR7neo7pl9FtRCnwauARZqLA53rcGDaz4BVgTkVgiLSVzMxC3f4I+Y53Q/6
         FPlJ7MV2zRtX5do1LTKHyLRxqWWE6VmIb+l+9m4xdNM4QBf7u1yo+5iBFU2MjEIhsCy1
         BucgMFBOJm2tkem398ay5vJzpF4y4ezaWPgq1tI0sqUTt7ej2rsHgjww82hIohZw6A6z
         2VrsSZLKYUaMTB+mR7CETWatBCaj8pY4Xcosb12M20PwcyJcmM/nVA/05Ia1pW6XfABw
         UQ4VuKRhTUWQfOm4avTaq3Xkde1P/zX6gJpTD2U2fLK1q8Qo2qGeCuVsPAiCll5FsP/k
         3kfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733746176; x=1734350976;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YZZgRX91gto3aMdAT5EhPMxWti4jkggrFz4EafseQZM=;
        b=s0tRGHhy+/E/9/Om4wcSc2IkUJhZc2Q41I/8SEILTNDlZqbNZ6IvasdMiMCksElsv8
         REgFu9VaxCcI/SZlKf837HIj1NZvlqp5In1qVptozR833gBN/cb81kAhHyaBQuJ7E3wu
         uwO5uIk12U75FCgXqbiiRg6nbAQlSqjjtt+MSBCyU+NDnAobBaxC7hOL3g+oDl4faEVk
         O8Ms/wfxJJdcvUqFc4cLSmZx7oNEImBmKLbLjGwx5NFk+zJvVkpc9PB+n1tAfU1OpgZj
         RSrN9f8E2Bxy7EhgEhj6Cmi6/wMboZsOBDWzwfI8tpxJClIwJePgLp5evQcn+jqVMYe3
         Ilsg==
X-Forwarded-Encrypted: i=1; AJvYcCVML2s8vt2550t0e5Jh42Zvp+WbLJ6KUBAG6Ef+G1s5zrIe8pBIyYUdIQM3+yH7CJGpvIWr4SxUR9YixRGX@vger.kernel.org, AJvYcCXDaPbK7sGfdRjI49AkTcfpmDwTpZWEGwl4bYG0NQCNGZo4Xfxm1HN+B8rKsIfGyovX6SaCfw+sPedk@vger.kernel.org, AJvYcCXjx5rg1REjiLOs7GM9ftsf7s0g3398In7Ta6A3mnVnz3wFUNEmadunWYNPUwNACNn7go57T3Jwof27/HI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBbMypiP2C7dp4aMw8QgjUwOtrkN1jFUtUgd83zpeRNb83RqG4
	A+WcAtZxpAhuxQX0q2MnoTLxZwtb3+O0hRCzMLPYPai1pbJiJIvurQBP6w==
X-Gm-Gg: ASbGncuuiMp5ZfTdvhVZtnbTaZco4L4VsXNX+nj4z2+jOYbudXbWokr+usMJ1Ihgjuc
	7SJAXTgRfG/xD/mfnpLHeuCuP+pZi2d4IJ70VT1y1kDhnWRFv5ORdb8mB2kzVJl/gI5hx0ZXWiM
	I57v4tjkY/htgxQEXqkqPp6fqlfPnrlX33i4ejfer7wTEZUEHJVfvLo70eqUsHGbRx3zmZ6YpQB
	nm+GcZVSgTUmwqBJI3GBGzuX8aw9iKTaNXtcdLCJjjZQDk+
X-Google-Smtp-Source: AGHT+IEBkgm36FNySjSdnjKFQkf3PAYXTIxWNMKkeLhUFFNzQJrAURRLp4BHaw/CduaSyGiJIHquMg==
X-Received: by 2002:a17:906:2932:b0:aa6:89b9:e9bd with SMTP id a640c23a62f3a-aa689b9fbe1mr293420666b.24.1733746175741;
        Mon, 09 Dec 2024 04:09:35 -0800 (PST)
Received: from [127.0.1.1] ([46.53.242.72])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aa69964876csm37308766b.49.2024.12.09.04.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 04:09:34 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Subject: [PATCH v8 00/14] This is continued work on Samsung S9(SM-9600)
 starqltechn
Date: Mon, 09 Dec 2024 15:09:04 +0300
Message-Id: <20241209-starqltechn_integration_upstream-v8-0-ec604481d691@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAODdVmcC/43Sy27DIBAF0F+JWNcVHp7pqv9RVRHGg43k4ASw1
 Sryv5ekj0Te1Ms7EueChgtJGD0m8rK7kIizT34MJeinHbG9CR1Wvi2ZAAVOZa2qlE08DxltHw4
 +ZOyiyeXMYTqlHNEcq8ZqqQVtwCEjhWlMwqqJJti+QGEahjI8RXT+49b79l5y71Me4+ftGjO7T
 n8b9f+NM6tohcxJKYHWytjX7mj88GzHI7niM7+D+5ptAHkBoQV0rbBCK7UGxQMIcgMoCtgC1Vw
 qcA7cGpR/YE3plifLAgrOBZOiZVTAGlR3EKjYAKoCau72hgmuNGWP4PK9sYjnqXyQ/LO2ZfkCs
 BUtwj4CAAA=
To: cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 Dzmitry Sankouski <dsankouski@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733746173; l=4993;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=lLHA5agnNJKjcjnn/wA0ZkwS4va8vtSABzdxIKae3Tw=;
 b=FI440UB4lTyZOKQM3gy8HdduWFLO7GYQVZz42i+Yp1JuxOV+mTaidKE4tEBamW7B7WiRHeYM1
 7wR7iOeBuSDBdc38/tmwCZt+azhFvxEwsOD/j0nsi+CdaB3CubpsDs9
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Contains starqltechn device tree changes.
Add support for new features:
- sound (headphones and mics only)
- gpu
- panel
- buttons
- MAX77705 MFD:
  - charger
  - fuelgauge
  - haptic
  - led

Binding Dependencies:
- s2dos05: https://lore.kernel.org/r/20241007-starqltechn_integration_upstream-v6-0-264309aa66de@gmail.com
  - This series was applied to krzk/linux.git (for-next)
- max77705: https://lore.kernel.org/r/20241209-starqltechn_integration_upstream-v11-4-dc0598828e01@gmail.com
- s6e3ha8 panel: https://lore.kernel.org/r/20241006-starqltechn_integration_upstream-v6-0-8336b9cd6c34@gmail.com
  - applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

Runtime Dependencies:
- gcc845 gp clock: https://lore.kernel.org/r/20241007-starqltechn_integration_upstream-v6-0-dd75c06c708d@gmail.com

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Changes in v8:
- add reviewed tags
- minor fixes
- remove 'reg' property in fuel-gauge to comply with v11 max77705 mfd
- Link to v7: https://lore.kernel.org/r/20241205-starqltechn_integration_upstream-v7-0-84f9a3547803@gmail.com

Changes in v7:
- review fixes.
- new patch with dt-binding header for wcd934x
- Link to v6: https://lore.kernel.org/r/20241008-starqltechn_integration_upstream-v6-0-5445365d3052@gmail.com

Changes in v6:
- refactor: no space between tags in commit message
- rename starqltechn to sdm845-starqltechn in commit summaries
- Link to v5: https://lore.kernel.org/r/20240926-starqltechn_integration_upstream-v5-0-d2084672ff2f@gmail.com

Changes in v5:
- Split patchset per subsystem
- Add links to subsystem patchsets in description
- Link to v4: https://lore.kernel.org/r/20240913-starqltechn_integration_upstream-v4-0-2d2efd5c5877@gmail.com

Changes in v4:
- Rewrite max77705, max77705_charger, max77705_fuel_gauge from scratch
- Reorder patches:
  - squash max77705 subdevice bindings in core file because
    no resources there
  - split device tree changes
- Use _ as space for filenames in power/supply like the majority
- Replace gcc-845 freq_tbl frequencies patch with new approach,
  based on automatic m/n/pre_div value generation
- Link to v3: https://lore.kernel.org/r/20240618-starqltechn_integration_upstream-v3-0-e3f6662017ac@gmail.com

Changes in version 3:
- disable crypto patch removed(disabled on distro level)
- dts framebuffer node along with related patches removed,
because panel driver added
- fix 'make O=.output_arm64 CHECK_DTBS=y qcom/sdm845-samsung-starqltechn.dtb'
errors, but it still complains on 'monitored-battery' and
'power-supplies' though I have 'power-supply.yaml' link in charger
and fuel gauge bindings.

---
Dzmitry Sankouski (14):
      ASoC: dt-bindings: Add bindings for WCD934x DAIs
      ASoC: codecs: wcd934x: use wcd934x binding header
      arm64: dts: qcom: sdm845: enable gmu
      arm64: dts: qcom: sdm845-starqltechn: remove wifi
      arm64: dts: qcom: sdm845-starqltechn: fix usb regulator mistake
      arm64: dts: qcom: sdm845-starqltechn: refactor node order
      arm64: dts: qcom: sdm845-starqltechn: remove excess reserved gpios
      arm64: dts: qcom: sdm845-starqltechn: add gpio keys
      arm64: dts: qcom: sdm845-starqltechn: add max77705 PMIC
      arm64: dts: qcom: sdm845-starqltechn: add display PMIC
      arm64: dts: qcom: sdm845-starqltechn: add touchscreen support
      arm64: dts: qcom: sdm845-starqltechn: add initial sound support
      arm64: dts: qcom: sdm845-starqltechn: add graphics support
      arm64: dts: qcom: sdm845-starqltechn: add modem support

 MAINTAINERS                                                  |   1 +
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi                   |   4 -
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts                   |   4 -
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts                      |   4 -
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi          |   4 -
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts      | 595 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts            |   4 -
 arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi        |   4 -
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi |   4 -
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts           |   4 -
 arch/arm64/boot/dts/qcom/sdm845.dtsi                         |   2 -
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts         |   4 -
 include/dt-bindings/sound/qcom,wcd934x.h                     |  16 ++++
 sound/soc/codecs/wcd934x.c                                   |  16 +---
 14 files changed, 606 insertions(+), 60 deletions(-)
---
base-commit: d1486dca38afd08ca279ae94eb3a397f10737824
change-id: 20240617-starqltechn_integration_upstream-bc86850b2fe3

Best regards,
-- 
Dzmitry Sankouski <dsankouski@gmail.com>


