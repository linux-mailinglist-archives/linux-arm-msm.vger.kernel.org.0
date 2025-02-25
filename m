Return-Path: <linux-arm-msm+bounces-49324-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8530CA44667
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 17:41:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20C04189B7AA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 16:39:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DB3518C93C;
	Tue, 25 Feb 2025 16:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gJl3M2sH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593DD4430;
	Tue, 25 Feb 2025 16:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740501561; cv=none; b=KJjvjxWXY1OFQK7nna/vwv0VjDmGTB8kolAHO4rhpjW2EBB30UTZaAAYz9RbCQ6eZWeNEM4euUZgDJQrTyBRqAQVmAAiY0X6jQqn1rYTZBNMgNigwHdE5U2Pqn0o7zdnlzMyb9I9Qrj38vDfWzksLVWh/e9GOquCpqjnvQzXedU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740501561; c=relaxed/simple;
	bh=0ncF/Suw8t5tbvwfNLzo4sbw5QHseLqdhB++Fm6EcO0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UCI3cpFjJieyVZ+/OpdtimwiR/W+rATc7MTsvN+gphhQYxlbNh2ffbER8r+SbkUQcAmWlwkRYv9JBVvJVMjR16MCCoI23NruaAbK79BLS/dBpIpbMRBWIxIe2AmeCU8QOoAUPMdmkxvvDrZgEgrrs/CpWXJOw943GQFQaYhHth8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gJl3M2sH; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aaeec07b705so971575166b.2;
        Tue, 25 Feb 2025 08:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740501557; x=1741106357; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/f0/c9NItxQ84dUWhseX6e9bwXNqG8M3X9k63MirzB4=;
        b=gJl3M2sHQZIbQbkgWYwQjM9qa5IyYunKMpRUPOLz3I73RzGJawsGNH1UCTLO2PgDbN
         tTi4Io5NCpoLraZ4hvgy/9SPDSMVnXO0JIJ94mGyJvlpqXQsiq92uRQgRHAX9gx6rYxh
         ZbQB0HVPU2AafoPtvO2us66Qz4enNumZtFLFqjhOzqWvtNwfrb31pH1qSqhX08kOX2s1
         tLUDg8s2g9e2FjF/N0ESYFY2p5KMTEk5rQdamwZnktqfMlGsAE8i0OMc0DlJ6HDv8kpO
         f0p+jJKmc5Fnq3Z/Ife8g3LjxVIvYtVISj2JFDWd1XKFWJiLdxF4p5XdBze12Q6Od3yB
         mqvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740501557; x=1741106357;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/f0/c9NItxQ84dUWhseX6e9bwXNqG8M3X9k63MirzB4=;
        b=uBJrS12cEao2tTMPQ2xg8T97BaZanRzNIdrmiOB6Qn20afH7hQ/enaC3PBLbpKCWXm
         WkAX/W8iluoyi1FtMxAXSGceC0ugCtFsqvoni5Q9gw6fKHm1ISBUDvDQKv7aDPCS2R1R
         E77ePst4flNGlVj3vqVsiVjRNcwbGNykNq4RqGbJjabTrxKFMWSxGD23dtdnpLMVfvf9
         gwOFIK6RiBu7fQqQCTcqEnIWlSyroyj8C7dNDvvfIl722BD9hsgPlWBwmloRxrDHG3Py
         LpCvsXoEg4urrMI2oqPpK+JEu4iRHdziUH9C2i4V5dQWLfdwIdI0s+ZY1lkv9vlHpglS
         ZMwg==
X-Forwarded-Encrypted: i=1; AJvYcCVdVE2TPntIhXSkhikUNeBEox9yVI/GkNsuP/OljCFzH3cSdfwrLsU1IXO9ZM0Cj1m52S13UKUCbjAD@vger.kernel.org, AJvYcCWi/53mY6LtmA9DEO4ktOUs7tfmEuOvUfkPygyDVALakrT6Nv1SY5+MbrXBWtz3PTMl0BAsbE13omsdbtSi@vger.kernel.org, AJvYcCX4sSB3ZZ+wOi4tAzkXNjDDUovoz+sJDuzZ86+ril9948Hwb+d2guUvP0vQ9oy9Aund8lggLFr6GQLCuX8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaOlWUDXycFgK33+ravEUxpX1FD0nQGzTJQ3SdsChsHPJ9dbHj
	+j5VpftztXVmh/EyxfjiEkI8JuXGPnIeMYu+UNjI/5p3jwyXlcj3OsOm6WaV
X-Gm-Gg: ASbGncu4Ac05oqdSlx3SvX3bS32A8YAJZfNPeqEylDcncJdlQxOdlWDipBpzdSq959N
	VlCu5Gd5h9qE6ruxFddg+yiJ5K0GrXAxJ/H8ROILYtIeyvmn50PvUYuWGPYtQGdl3D0Uh6B7GL5
	5wG8q+QnM0FuYcz201ivxJx1seqYVZ5+OZORXIwXsyUUUiQwJxrvVcz1GEi2a2EOJT3q6bHQi7g
	qIv4TUFDeY1lTHjqqbnkXutToiQa7a+8ncCnP377SSRC+pYnYWPJXlJQ7NamWsgpKgUnL1eNcNG
	D7f3xzxEaaT4rlLf8MtHq8CN
X-Google-Smtp-Source: AGHT+IEJQXDO6bE471CYaGsZ8DY6GWmlh2mA9SI6FSdZDKoSbV9lCTuvhc3Li2czoa0ROl6jJqQCOg==
X-Received: by 2002:a17:906:3088:b0:ab7:9bea:4e04 with SMTP id a640c23a62f3a-abc0d9d99e9mr1504207766b.15.1740501557221;
        Tue, 25 Feb 2025 08:39:17 -0800 (PST)
Received: from [127.0.1.1] ([46.53.242.22])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-abed2055011sm163999866b.156.2025.02.25.08.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 08:39:16 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Subject: [PATCH v9 00/12] This is continued work on Samsung S9(SM-9600)
 starqltechn
Date: Tue, 25 Feb 2025 19:38:51 +0300
Message-Id: <20250225-starqltechn_integration_upstream-v9-0-a5d80375cb66@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABvyvWcC/43Sy26EIBQG4FeZsK4NcrervkfTTBAPSqI4A2jaT
 Hz34vQyxk1d/ifh+yGcG4oQHET0crqhALOLbvQ5VE8nZDrtWyhckzMimDAsSlnEpMO1T2A6f3Y
 +QRt0ymfO0yWmAHooaqOE4rgmFijKTK0jFHXQ3nQZ8lPf5+ElgHUf996395w7F9MYPu/XmOk6/
 W1U/zfOtMAFUCuEILiU2ry2g3b9sxkHtOIze4BVSQ+ALIOkIWAbbriScg/yDUjEAZBnsCFYMSG
 JtcTuQfEHlhgfebLIIGeMU8EbijnZg/IBEswPgDKDitlKU86kwnQPqi1YHQDV+ilGYMZU2Yiq3
 ILL9woEuE5549LPHizLF93SVIyPAgAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740501555; l=5151;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=0ncF/Suw8t5tbvwfNLzo4sbw5QHseLqdhB++Fm6EcO0=;
 b=ak0XAyErIzXbkDqP2m2cvKT/MBUAshlb7/OBKJGTr9D1iiDsK1ARCehEv2jPfpjhvqZ8Psdgj
 jqoWWQz9rxcC8IdnQswWSR7KqpXFslWK+cLokNUEw1gLos9w1eJTi+n
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
  - applied to
    git@gitolite.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git

- s6e3ha8 panel: https://lore.kernel.org/r/20241006-starqltechn_integration_upstream-v6-0-8336b9cd6c34@gmail.com
  - applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

Runtime Dependencies:
- gcc845 gp clock: https://lore.kernel.org/r/20241007-starqltechn_integration_upstream-v6-0-dd75c06c708d@gmail.com
  - applied to clk-next

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Changes in v9:
- update applied dependency patchsets
- Link to v8: https://lore.kernel.org/r/20241209-starqltechn_integration_upstream-v8-0-ec604481d691@gmail.com

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
Dzmitry Sankouski (12):
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

 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi                   |   4 ---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts                   |   4 ---
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts                      |   4 ---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi          |   4 ---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts      | 600 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts            |   4 ---
 arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi        |   4 ---
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi |   4 ---
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts           |   4 ---
 arch/arm64/boot/dts/qcom/sdm845.dtsi                         |   2 --
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts         |   4 ---
 11 files changed, 591 insertions(+), 47 deletions(-)
---
base-commit: d4b0fd87ff0d4338b259dc79b2b3c6f7e70e8afa
change-id: 20240617-starqltechn_integration_upstream-bc86850b2fe3

Best regards,
-- 
Dzmitry Sankouski <dsankouski@gmail.com>


