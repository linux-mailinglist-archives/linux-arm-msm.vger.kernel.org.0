Return-Path: <linux-arm-msm+bounces-40375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AE09E46BC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 22:35:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99EB12838BE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 21:35:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B658B191F9C;
	Wed,  4 Dec 2024 21:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O8v2Bg7x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1078191494;
	Wed,  4 Dec 2024 21:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733348109; cv=none; b=H4wVcGBAs+lH+OqLRC4XuKBeMHDK8HD8utvLf1onXuTsyvvXG5pjTUVyai5KQ8lzGbe5a+BqFMo4nanCc+F5j5v+E4IShsqhPFwzaQ2J2gcKg/DUJJPl4kVPXungHzK4STMcxfO/IPALhmX+cfhnqTJJTwOlfKIEmacUHAltsOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733348109; c=relaxed/simple;
	bh=j11y54dCZCbFkalvbnwQmWmMrPmWnAYOlLynn8WgUAQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YCu1YqvoBaQB4hWcQgxYvWQG3OHZ9DF14PZajqekbifVySGUI+ygZyFmgyc0I01PcSd9f5MsR2RYK8tmtAMzWr/Yy5EQ1kD7KI4kxJ4LCB7X03cZy4vIv+J+52qW+dVopxn+5baJhM4xLX8GakuZY7qqRC/RbltEF88E5p+1J3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O8v2Bg7x; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aa53ebdf3caso33371766b.2;
        Wed, 04 Dec 2024 13:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733348106; x=1733952906; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iuzgzWysi0xQzASXR1mXKdirnIu+N1nfSNmw2B7P4bM=;
        b=O8v2Bg7xWP1ocJl9XklhOnaTske+d8aT+FFt2OOvBEGiWvsCaZHPqc0A2Amh9vTnoT
         NCf7ptsDwPz92opurumtoUQu/a34+J+ihLH78G23iIxmx4vkiZ+dyzH72BhgONjYSljf
         3bZUTd3Kc6PqF6UrMqJJTlN5AQGORMk1+zU2NVWI2OCGi4N4ESC+bHnTso6lFao0t2Db
         +I74YB+3mrcFf+fwWPlUQ1n/+BKCB3127THmnq3m99MJNN/Z61PxKfhCL4ckdxW9ZgPf
         Y/RBnHkCPjpFFdMIgNWDWHDKRs7QNc7+ytBvhBjJ5GLP7K5JRrdUV3vN3VvkksNXckAf
         tqiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733348106; x=1733952906;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iuzgzWysi0xQzASXR1mXKdirnIu+N1nfSNmw2B7P4bM=;
        b=l/sCJW2tbXz//LXHzn8DWXw4Hjhk1RP4igFEM2uY4L7x03d0I/IZawiqOaOX8XAg/q
         TauV+6rjLaGa3e/Pv3iK5XEKBz7dfVVlHw1QfTVGV31DmxSZQ4l+nI607W6yV+1pxSjx
         YfVrvuKOwtTBjzx9J7tp303Jv76TYn7TRlTkNez86oJUT5WvQK2Qs61wwadky1R7nByW
         PhGhYuuB/TQKOj4Lf6leFSs9TPesuqvRWm6iX1aYBksDnPcODF2ZiWvV0kP4b3WW24w+
         Uh3rKLE8yV39W/Af6V1vv+SbmyKTExVQOCWMIeGv+WwrjHSvLDuj/no+NIUCfjJEhyia
         quRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXadKLw+u/fdQsf0ZjGVVFUNOiSnh4a0zPR/7VS4P2y+cJGy+grbgZY6zpSSm+J5cNjOXWXt9XmI+LJ0E=@vger.kernel.org, AJvYcCWR+xm1PDGT6e1o7vsEoT1GDpH+S7xO463RCwTiVyA4gZnW8JJbmzuic8u3VPpRW0l2c30YUKjYIX8r@vger.kernel.org, AJvYcCWyLTtExNym9UN+Dz1Q0+PU23DykYiWevwvPBvix4q00+pocbDh3MRnBoW8JM6Exa9ILGpaoYN2y+iofcBm@vger.kernel.org
X-Gm-Message-State: AOJu0YzEVG5uoBfHn5bc8072Pc01BN4T21IeTwrw0F2BnJ3b8B7eSSws
	CDX8plEi+ibnRX+lFLv8ieWN348Df80sLvv0m5DZMMczP5yaIb2qz3aceg==
X-Gm-Gg: ASbGncujpaWTcDuIZSVJIdeLlEguKvnxq7q6JbUB1NpzKUdPY73LQEn219o2ufNIC2r
	n5yvZeGl7UN3qznut3+woPB2U9eJcs0dSzR/9zzhCbHqd1Q22A/MEmpB5lzVjr0Utb2kR+UYblH
	6ickEss4bVzBPoDi0hhxxM1reLCeAyT8ON5jlqt1AcK5fIrufdNeenjJYh6ouPVgj4S3HbOMDlF
	F7DBQr7JIjRuID8u2mFO5JaUzLqlJkuzLescUZSbBshLwHu
X-Google-Smtp-Source: AGHT+IH94DTTb6JBzC+xl94joLcq6YqmJKaT/CSiPoOiMfuR5FbCs9GAnQs2fNf2GB6snwIXQeTqUw==
X-Received: by 2002:a17:906:ee88:b0:aa5:199f:2bf2 with SMTP id a640c23a62f3a-aa601819730mr701152466b.29.1733348105711;
        Wed, 04 Dec 2024 13:35:05 -0800 (PST)
Received: from [127.0.1.1] ([46.53.242.72])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aa62601b5ddsm4506966b.118.2024.12.04.13.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 13:35:05 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Subject: [PATCH v7 00/14] This is continued work on Samsung S9(SM-9600)
 starqltechn
Date: Thu, 05 Dec 2024 00:34:47 +0300
Message-Id: <20241205-starqltechn_integration_upstream-v7-0-84f9a3547803@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPfKUGcC/43Ry27DIBAF0F+JWJcK83S76n9UVYTxYCPZOAFsJ
 Yr8752kryibenlH4lwYLiRDCpDJ6+5CEiwhhyliME874nobO6ChxUw445LpytBcbDoOBVwf9yE
 W6JIteGY/H3JJYEfauFrXijXcgyDINDYDbZKNrkcozsOAw0MCH0633vcPzH3IZUrn2zUWcZ3+N
 Nb/Ny6CMgrCa605q4x1b91ow/DsppFc8UX+gS+V2ABKBHnLwbfKqdqYR1DdgVxvABWCLWe11IZ
 7z/0jqH/BirEtT9YIKimV0KoVTPF7cP1acILjjP9Zvre8rp/3GCd97QEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733348104; l=4756;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=j11y54dCZCbFkalvbnwQmWmMrPmWnAYOlLynn8WgUAQ=;
 b=B2NOnTc/DVa3ITWuGbNOhjmSDA/2ebQErwgCaVr0czPJy86l52pPk541dJQu1uV7W85wocSHY
 OhvIGPZSnyBCr4UG5rLZSbOU3xeLio2zwT3YWsAOXWLo/drYgUqP5mY
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
- max77705: https://lore.kernel.org/r/20241204-starqltechn_integration_upstream-v10-0-7de85e48e562@gmail.com
- s6e3ha8 panel: https://lore.kernel.org/r/20241006-starqltechn_integration_upstream-v6-0-8336b9cd6c34@gmail.com
  - applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

Runtime Dependencies:
- gcc845 gp clock: https://lore.kernel.org/r/20241007-starqltechn_integration_upstream-v6-0-dd75c06c708d@gmail.com

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
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
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts      | 596 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts            |   4 -
 arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi        |   4 -
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi |   4 -
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts           |   4 -
 arch/arm64/boot/dts/qcom/sdm845.dtsi                         |   2 -
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts         |   4 -
 include/dt-bindings/sound/qcom,wcd934x.h                     |  17 ++++
 sound/soc/codecs/wcd934x.c                                   |  15 +--
 14 files changed, 607 insertions(+), 60 deletions(-)
---
base-commit: f486c8aa16b8172f63bddc70116a0c897a7f3f02
change-id: 20240617-starqltechn_integration_upstream-bc86850b2fe3

Best regards,
-- 
Dzmitry Sankouski <dsankouski@gmail.com>


