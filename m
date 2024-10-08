Return-Path: <linux-arm-msm+bounces-33590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 757639954E7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 18:52:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB4201F2348D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 16:52:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0DBA1E0DD0;
	Tue,  8 Oct 2024 16:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HJN+u7Rq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F53F136327;
	Tue,  8 Oct 2024 16:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728406316; cv=none; b=pDoP+EjvEurh5O2oyVOO3SK0t8+B+lyROW6dPKmFAi/Vy4Co/9XcOMCKfZwvXMzgPzPbbI+kKOCBgL8KarXk4AzmpwliBh1tzDnP0E1I/o0fLN94FzfHrbv4/ETwMs3SI/5ahJTOzhRHBIRZX+260oH/6xj/cLcPKqH/GjLZ8Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728406316; c=relaxed/simple;
	bh=CaQmhslInAxZaAv6IpH8jspi+xvU0AgNmeg3g7Xi0Bg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=f49ZStliX/W15zmXjCvssauhYji5k8iHIicBy0kJeg/9e0hp0qUjgRBvGriJoQmj6qkPLRzVnbYastiiL9nbLXY8aqld87XNa2gjvceGgxWZPR1YR3Tx/TwRBiC7bPCHf3M5kA5Z3UqAhJlq2dHJ5G4xZIAcHid4Kdy3XLGpSLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HJN+u7Rq; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5398939d29eso7268877e87.0;
        Tue, 08 Oct 2024 09:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728406313; x=1729011113; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WUTzgSb9fw2gpJhB0MuECRZH/DxBrNbNjk7Y1YbaGPg=;
        b=HJN+u7RqbLGTGbrukSsRFMvwQIgHBUeApHnRJrHzXTQdwzDG9AS3U58Api6BsQbwxM
         b8CGyWj+Jl5ihqvvU4boZXhfiGF3zzk8LtHYmVDcKWicWbpLGyv7fx3TnIJoKU7yi4Lf
         urqtKdnnfk13ZCLlAldD1DJp1RGyryhEL1S5KuHTjKn2db3FwLkyUMnpbygVoOseThOl
         gnHHQZ6J46Cq9viZKDhvQKIuaAyu67gfLDq36/aYhh8ZAzlq02X5moxHiFfSKzWikGXu
         W872yZDRj+8e+AiPDYhBeQKrimRTPp0Ewx1eIen1DfJagaviCXzL3EGAiXHgANi5DwQC
         m5ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728406313; x=1729011113;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WUTzgSb9fw2gpJhB0MuECRZH/DxBrNbNjk7Y1YbaGPg=;
        b=NegdqVkgQxCYpar4f3Dvgba5zkj/5uObCYRq9wLRDoD3XfwARXD3OHSsl8nJKZsxdL
         q1I7+kU3s82fdNgYB+4R2Wh7tmavai7dsV27siQrfVnTTPErXtd2ZrIyOGbuQe5arXO6
         8G2BiVvtNHeSgdqEdo/ZnAZJ0cxNJtw6B0405kF+LQzc5GOQ4LAmjAoCAe2wNP7124Gk
         6MDdt+NEjr62fVahaH5QhashPTgy8pkH7SySmQnyYArs27O8d8S4B5hA0XHQ3x0AXn9M
         0Cre8HNaafCEMcmnuE/h+9L/liJxYJwlCoodiXLlNTHfIs5cGwxIFUSKcD3gbr+DVsWA
         MX5w==
X-Forwarded-Encrypted: i=1; AJvYcCVf4YoMvCSZokYw9zWuvcDVj/ElvOLiXiRkwVJyNKhpIfimosa9Rg3Fthu2VtnOKP4tRnLYIXnmRKnzz4Ox@vger.kernel.org, AJvYcCWzNRpTaMSiJxewbpWSGrTT+Cj6867LfY/VgpGEmpPsdF7AKeSYgtqhpunK4yC8gFbQixTQUCGEniAB@vger.kernel.org
X-Gm-Message-State: AOJu0YylBdpxYNGIM4vOHs5JyZYAxzFho+sgpYAPa3qbHeh4JcLPOr43
	mYX/nPYjNIseIDS1kUh1AF6xCmN7Oo7mgpRJ6mEvuCsIdNcgo8HE
X-Google-Smtp-Source: AGHT+IFTHoePhKyCb4eyN6p0ZYzDWk45doesWg+T//rwb+TDTPclqZG4+4Dqc88Cs6XzrKdgGsnS8A==
X-Received: by 2002:a05:6512:68d:b0:539:9064:9d04 with SMTP id 2adb3069b0e04-539ab873f77mr8102236e87.33.1728406312932;
        Tue, 08 Oct 2024 09:51:52 -0700 (PDT)
Received: from [127.0.1.1] (nat6-minsk-pool-46-53-210-75.telecom.by. [46.53.210.75])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-539aff23e5fsm1260736e87.235.2024.10.08.09.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 09:51:51 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Subject: [PATCH v6 00/12] This is continued work on Samsung S9(SM-9600)
 starqltechn
Date: Tue, 08 Oct 2024 19:51:37 +0300
Message-Id: <20241008-starqltechn_integration_upstream-v6-0-5445365d3052@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABljBWcC/43QQW7DIBAF0KtErEuFBwNuV71HVUUYDzaSjRPAV
 qLId+8kbdWom2b5R+J99C8sYwqY2evuwhKuIYc5UtBPO+YGG3vkoaPMQEAtdGV4LjYdx4JuiPs
 QC/bJFnqzXw65JLQTb12jGyVa8CgZMa3NyNtkoxsIiss40vGQ0IfTrff9g/IQcpnT+faNVV6vP
 43N/42r5IKj9FprEJWx7q2fbBif3TyxK77Wv+BLJR8AawKhA/Sdcqox5i+o7kDQD4CKwA5EU2s
 D3oO/B7evPRIeF5q/fI+ybZ8TWmsmnAEAAA==
To: cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>, 
 Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728406308; l=4072;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=CaQmhslInAxZaAv6IpH8jspi+xvU0AgNmeg3g7Xi0Bg=;
 b=86KyutTPFd8ZMcsHq1K31d59vO9EARp3sh3lVRZfjw1LJoaOFyTxCLMDWlNOzh/oPaHzbB0bN
 4qRQjsYTUypCV2uxUykflRmxDlWYMTHJo0Q++N3Nx1Vkqei0pKtL58Z
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
- max77705: https://lore.kernel.org/r/20241007-starqltechn_integration_upstream-v6-0-0d38b5090c57@gmail.com
- s6e3ha8 panel: https://lore.kernel.org/r/20241006-starqltechn_integration_upstream-v6-0-8336b9cd6c34@gmail.com

Runtime Dependencies:
- gcc845 gp clock: https://lore.kernel.org/r/20241007-starqltechn_integration_upstream-v6-0-dd75c06c708d@gmail.com

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
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

 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi                   |   4 -
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts                   |   4 -
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts                      |   4 -
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi          |   4 -
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts      | 573 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts            |   4 -
 arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi        |   4 -
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi |   4 -
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts           |   4 -
 arch/arm64/boot/dts/qcom/sdm845.dtsi                         |   2 -
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts         |   4 -
 11 files changed, 564 insertions(+), 47 deletions(-)
---
base-commit: 58ca61c1a866bfdaa5e19fb19a2416764f847d75
change-id: 20240617-starqltechn_integration_upstream-bc86850b2fe3

Best regards,
-- 
Dzmitry Sankouski <dsankouski@gmail.com>


