Return-Path: <linux-arm-msm+bounces-32583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A43D98755E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 16:22:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51DCE1F21E89
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 14:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8362960DCF;
	Thu, 26 Sep 2024 14:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S3nHKtia"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53884D8CB;
	Thu, 26 Sep 2024 14:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727360539; cv=none; b=V3Tx5al8HPbI+tQbkzPy0H8O1/Tzl7xKYBzORlbRJa6/DJgfWcLhBIQ51z54N4UPfhYgzhiuPhwxQUZOtohQPTwcMs4a81GO9PE4+euvn0HanyIQvr8FtLxC7HHtuEB2CesHc+0CbAcSTABZW35+yYc7BQTiert/U1d3WPLh+t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727360539; c=relaxed/simple;
	bh=/itqqrI17esUdju+hdyYejJ3mMNbnZlGU5JDumt//wg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oMLu9FtU3PYr/ZAPW/sYmUpKoDndC3X7mr0XDBgpmotbUgik5ys4rdij+INrXfzj4ekHobhu6k/AcMhB/YFbK8+xg5FEWBTkOjMDSuYKVBiRZ7JlM/QeJUWyZjCaFptqo5tqAM+LL8LZRooKebj+zOrJp3I+2T1b0GmThxmgAwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S3nHKtia; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5365b71a6bdso1397381e87.2;
        Thu, 26 Sep 2024 07:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727360536; x=1727965336; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uvAIAMx0Bh7L4E+SdJ3jfr7mT5ag73sqIgfDL+muc1o=;
        b=S3nHKtia9JW4g6JLlg3XN+Bx6roa2TtHvw9QpqsHvQaF/f/52miu9vWhYlrXDPQTmd
         SqfSNRcVYW4A6ekWWKO9olQIudr4Atix2/IzSyOlN5oABeY4daTA+gy/RF5AuR9DoE3z
         zr2QntBes1B+LHcm1JP7+L11Er+bExXzG2OKrh41vAL9+UnGsdVitUMzxz868f9tQ1UI
         JT/ob6wOO80PSv218Cap8lHdr4Ic+HqbxXxa5XWMVHfNJY5V5rUnm0fNYklp5YSUVmn/
         G/5waa1GijyYG5urSEZoWXJz6OYkq6G3obwdYPkhHPIqaYwUvG3bybJFajA3mySuAqvX
         RaEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727360536; x=1727965336;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uvAIAMx0Bh7L4E+SdJ3jfr7mT5ag73sqIgfDL+muc1o=;
        b=hDf2LbamiOA9CINsUnUPGpV5jGrBGuah6MGa72zf8qmQhQ0NTwSJ14bn1Rx3A5ZTnf
         1al0LTzA2kgz5AIF7oz/VeDuUiSNw1X6Z0Lddh5L1azC3NMToRQM3bd3ACL1ES2m8j5+
         KdkXDby9fUiVimH1NZ+lLgPceiL/kvNF+5vlfwfpjVEkFyz+2xYoSzFuQy0QD1zxSzSV
         xcaJyJXEKrqbzonUAUy4Ee50tGx3Ksh7KTEgSfZi9lZT9hrdv+1mrbubXhXQd2S7gclg
         vBLXZdpkdwgZylz12hTxeKDKoUaJNovUER9Mqd0k94tZtjfrMs2MYE2VCe/O2WsXk9fC
         U9fQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdPDMCYdl59o89l7jOuhF2hJPxvurX8lLqCw9tD4BFEkodttJPhBNN195Gq7yllvOINwLZIr27wvmoZPRZ@vger.kernel.org, AJvYcCXipg3tEzzvpbIlrK//d2Nr1XcT/Ok7caMkX+FZzUna2fDuh4/ThiDBnREpoAyhl5RxYwfW66n94UKk@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+v9xJK3JIg6TjYTjEvS0q4QjPtpxhd3goSYWE6jQA1QTp7XOL
	fMkK13REHN10Jq2a6d/pceFGSpu7LkUuxpiz+irkLutocdF3ortS
X-Google-Smtp-Source: AGHT+IG0d6Lfpejt7NfMU6xe9pBcN3H8fy9mUrC3fQLtKdfK6/00nvRhCq07e5EUgUuYxzvHNm9d5A==
X-Received: by 2002:a05:6512:3d29:b0:536:a5ee:ac01 with SMTP id 2adb3069b0e04-5387048ab2bmr4224364e87.4.1727360535433;
        Thu, 26 Sep 2024 07:22:15 -0700 (PDT)
Received: from [127.0.1.1] (mm-20-1-84-93.mgts.dynamic.pppoe.byfly.by. [93.84.1.20])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-537a864db1bsm815803e87.267.2024.09.26.07.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 07:22:15 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Subject: [PATCH v5 00/12] This is continued work on Samsung S9(SM-9600)
 starqltechn
Date: Thu, 26 Sep 2024 17:22:00 +0300
Message-Id: <20240926-starqltechn_integration_upstream-v5-0-d2084672ff2f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAhu9WYC/42QzQ6CMBCEX8X0bE1poaAn38MYU8oCTaDothCN4
 d1d/6I3Pc4k+83sXFkAdBDYZnFlCJMLbvAksuWC2db4BrirSDMpZCp0kvMQDZ66CLb1B+cjNGg
 i3RzGY4gIpuelLXSRiVLWoBhhShOAl2i8bQnkx64j84hQu/Mjd7cn3boQB7w8akzq7r4Ti9+Jk
 +KCg6q11lIkubHbpjeuW9mhZ3f4lH6A60T9AUwJKCsJdZXZrMjzb+D8rI9wGmmt+Pphnm9UTWm
 ZSwEAAA==
To: cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>, 
 Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727360533; l=3712;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=/itqqrI17esUdju+hdyYejJ3mMNbnZlGU5JDumt//wg=;
 b=faDb7sJYIbKeCOi8tbo6yKKE2MzD8fBi4Pix9ol5kw6+SVYGvMqIBYcFpPPtYA3cwfZ2OCvoP
 QSfpFPwC4hzCdsci4wrf+VWplSUIV3LfyXrIEK1lwM8Y1EEgNwLqC1y
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
- s2dos05: https://lore.kernel.org/r/20240617-starqltechn_integration_upstream-v5-0-ea1109029ba5@gmail.com
- max77705: https://lore.kernel.org/r/20240617-starqltechn_integration_upstream-v5-0-e0033f141d17@gmail.com
- s6e3ha8 panel: https://lore.kernel.org/r/20240926-starqltechn_integration_upstream-v5-0-1cb0e43e623f@gmail.com

Runtime Dependencies:
- gcc845 gp clock: https://lore.kernel.org/r/20240617-starqltechn_integration_upstream-v5-0-761795ea5084@gmail.com

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
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
      arm64: dts: qcom: starqltechn: remove wifi
      arm64: dts: qcom: starqltechn: fix usb regulator mistake
      arm64: dts: qcom: starqltechn: refactor node order
      arm64: dts: qcom: starqltechn: remove excess reserved gpios
      arm64: dts: qcom: starqltechn: add gpio keys
      arm64: dts: qcom: starqltechn: add max77705 PMIC
      arm64: dts: qcom: starqltechn: add display PMIC
      arm64: dts: qcom: starqltechn: add touchscreen support
      arm64: dts: qcom: starqltechn: add initial sound support
      arm64: dts: qcom: starqltechn: add graphics support
      arm64: dts: qcom: starqltechn: add modem support

 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi                   |   4 -
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts                   |   4 -
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts                      |   4 -
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi          |   4 -
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts      | 573 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts            |   4 -
 arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi        |   4 -
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi |   4 -
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts           |   4 -
 arch/arm64/boot/dts/qcom/sdm845.dtsi                         |   2 -
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts         |   4 -
 11 files changed, 564 insertions(+), 47 deletions(-)
---
base-commit: 92fc9636d1471b7f68bfee70c776f7f77e747b97
change-id: 20240617-starqltechn_integration_upstream-bc86850b2fe3

Best regards,
-- 
Dzmitry Sankouski <dsankouski@gmail.com>


