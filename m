Return-Path: <linux-arm-msm+bounces-73376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EE8B554E7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 18:47:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6338D1C26741
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 16:47:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BE66320A07;
	Fri, 12 Sep 2025 16:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IWcGovme"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BF93203B3
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 16:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757695631; cv=none; b=BPgeH//yELS6AlQbOHoOSRYQceh6yJfxMfQYXZfYK5ePrQoDmpE4vvWSSY4wPG/PgTe9ybea8SyhsH72C5tQqpcKR9VYzixu1JyPcEifSpwFE6B5+XDCB5D5y83ZQ339atWvFqFr5PWVWWBf9HMFjdSiD3uOmwfAHsV/c4zLuMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757695631; c=relaxed/simple;
	bh=KndXLY7WffHcRACiJiVZsxlknRg5o76CQRQqqRFrisE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RnY7R1in/tBOkJ9b/pJws0bHgl2qX0R0wmkUSsA59KpQI2iVkJjKTVeLeebLXSWEl1bvP7fs+u5Umdk/RhlZtq8xM0fik1hZD+sR2zk5kni4B0VeRdMRMJu9BBWgv6hwTd82fVjZTTizLUA51fCkcrirmC4pQAcGMdSZKXT7qxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IWcGovme; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b07d4d24d09so79666166b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 09:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757695628; x=1758300428; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bjyn2h7nbsDvxrr3TE4mHpyk+qzxLyA/SJlt+dB+INE=;
        b=IWcGovmeCxnlJlyMM2tet0O2gupgZ5NW0DeRUzarz+qSi+aHW9d6k+peKAW4j3DXM8
         IRzQFJnYg1O5tTXhYEv7iZ0QCYHQ/QPwtN/G3mJ3kEHIi0RKH9DuGqbG5bkbUuZtxIk/
         XoEIrUSx2hrWKA5juEj1MbVpxJX46I+2ryya8tyeW3TtCUMJegmIq3yCbABryl+AFSS6
         GJDzyrd1y8SfliOSeCUuVdajAp7Ad1yWsCZ2HUQhWGFbm1/pypVzcLJD/vhdHFH8tKQC
         T3vjbIdmL2PXBvBcMdjoUx2BNWacgQL5u71sYmWxoVa0j93o0BW6V8WWnCJiuZyQCK3U
         Ca2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757695628; x=1758300428;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bjyn2h7nbsDvxrr3TE4mHpyk+qzxLyA/SJlt+dB+INE=;
        b=FSq4Cj3jF4hYlfUleeRgTIQ2SPTD6sDX07vNQmodZNwIuyDV8iIMR5C4XjWR6qOtaJ
         efgVxpDHLzUdzuSizA7XQ9tL4d4bSs1YplRMDG2/lXWyN+XKQ/hn8As2txWjWSvZH0Kd
         lfQA4o7CrqEudu8JLayQrBoeUWUEhkqwWwXLnbjlW1L7s06RlUzTmkBQmqHQUvkBBPpH
         VdOEqi6CfLQmZ60UL2AATEPW93Szf4Tr+VNrKQYxlvv4Os9f4tQzzOa2NktsPRi4Z06k
         thgFKraFmgJ46zbiV5jourr00HlZmnnOEmJeQOpP5Po2UkAOsD0x4MUhLfGB0rSNGiJ0
         YDJw==
X-Forwarded-Encrypted: i=1; AJvYcCVBJ9/NBMdEM1QGgnHnUtyShXfJ4WqYCgG/CmbAtlkb4ZcyzwXVmiFo6ScNbjGhjCs/Bx1F1JOk0is5JfO9@vger.kernel.org
X-Gm-Message-State: AOJu0YwamESVccvHZK4kmNoM+KeVL4ofeih2BWC8i4c6Q5LT9MNf47Iz
	GT4kSS130W6lYPClQr+wcD2vZG1mxEE5Ytj2N4YatmzmnYU4COy7qjXE
X-Gm-Gg: ASbGnctV3mzgBquYcxerWZy4ju9C7kx9t9pYeZ7EU2mAlR2vPii/5x/8pIcE7I4S8bX
	fN8V7hp7m7SQbAmgK1FmGc1nffcrxM8NFYZ9H5wcej6Mt1qnVdi3AF9V+1PoQDJh0ImJwb0sDhq
	zvZJTJ9qs1DRJ9ZyIK2UVbpz8+p+sSNHkxkl8oKJ5lVsx1vcxv50q+PS2/ySIsNW30zMExKywLS
	qVDGxFTa/uaJHbIcr+Q9os3yMGxbcA7q8mJ/q97euj9Xkl4pgaa0T9sOyfdo6WKwWfLf8SiOT9z
	EE7E9cKJJm/kbMH5owQCdCfjqWdl/5dwfjjaSsaQqiZbW7j6Euqu78pfrb7CBRifR0XTr3HvMXo
	u5Jd2Suu+VVmWyBPcmYXwSaTqCOS9xWU=
X-Google-Smtp-Source: AGHT+IHeGRGLsNnmIiNGTSqEGBBbb7IgcmWh9ZcLBsp65OOq0gqG1mqSIf4/Uojok7eKMbFfBoRyQA==
X-Received: by 2002:a17:906:f5a6:b0:b04:53cc:441c with SMTP id a640c23a62f3a-b07c35fb726mr373819466b.28.1757695627687;
        Fri, 12 Sep 2025 09:47:07 -0700 (PDT)
Received: from [127.0.1.1] ([46.53.240.27])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b07c337e785sm229786066b.25.2025.09.12.09.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 09:47:07 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Subject: [PATCH v3 0/3] starqltechn: fix max77705 device irqs
Date: Fri, 12 Sep 2025 19:47:00 +0300
Message-Id: <20250912-starqltechn-correct_max77705_nodes-v3-0-4ce9f694ecd9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIROxGgC/42QzW6DMBCEXwX5XLf+ARxzyntUFXLwApZik9gOo
 op4926IRHPMcazxNztzJwmig0Sa4k4izC65KaCQHwXpRhMGoM6iJoKJih0koymbeD1n6MZAuyl
 G6HLrzaKUYlUbJguJcl4L2wmre1AEQZcIvVu2kO+fp45wvWFWfj7+RzXFHrRDldKqbtESB4it8
 5c4zeAhZAqyL7k69cZUdTML8nr0TuI7ieIVrQsZYrxdcotOe3ZhoOxw0B1ArWVtm1k+MCeTAOt
 573JToOm20ABL/vIm4XfyaDG6lKf4uy03863GnvjGSDOnjFa9ML22XFpjj4M37vyJoRse6+xIz
 fRbSIFIwEVKK1XJVPmKXNf1D44PamjtAQAA
To: Chanwoo Choi <cw00.choi@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757695624; l=2072;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=KndXLY7WffHcRACiJiVZsxlknRg5o76CQRQqqRFrisE=;
 b=WENIyShIAGupe6QFOlhYfN9cy2hvRGocFMoZFkekcwKA2a7+niNwNtO6COEVHjfv+l5qJ0v1A
 k7Kv6qfnLXmCCk8x7evGPp9u6DbPwjtCKrnClfSWGvoQ+QH+GwUQvUD
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

For max77705 charger and fuelgauge subdevice, use max77705 interrupt
controller.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Changes in v3:
- fix commit messages to be more clear
- Link to v2: https://lore.kernel.org/r/20250909-starqltechn-correct_max77705_nodes-v2-0-e4174d374074@gmail.com

Changes in v2:
- run dt_binding_check, dtbs_check
- make interrupt-cells 1
- add patch to delete unused address-cells and size-cells
- add binding patch for interrupt-cells
- Link to v1: https://lore.kernel.org/r/20250831-starqltechn-correct_max77705_nodes-v1-0-5f2af9d13dad@gmail.com

---
Dzmitry Sankouski (3):
      dt-bindings: max77705: add interrupt-controller node
      arm64: dts: qcom: sdm845-starqltechn: remove (address|size)-cells
      arch: arm64: dts: qcom: sdm845-starqltechn: fix max77705 interrupts

 Documentation/devicetree/bindings/mfd/maxim,max77705.yaml | 14 ++++++++++++++
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts   | 14 +++++++-------
 2 files changed, 21 insertions(+), 7 deletions(-)
---
base-commit: be5d4872e528796df9d7425f2bd9b3893eb3a42c
change-id: 20250830-starqltechn-correct_max77705_nodes-1162dc2d9fe7
prerequisite-change-id: 20250830-max77705_77976_charger_improvement-e3f417bfaa56:v2
prerequisite-patch-id: 534eff3c30a7b998f90f7be9537ff54c7f68543b
prerequisite-patch-id: 60362587901a812e50ab0e9a2cf25eeea769ef9c
prerequisite-patch-id: 9692af6383d95fca0c8030b9110d4b06aa0631e2
prerequisite-patch-id: e1b7fc49030ad771c3fae33dc59595cbfecfd17b
prerequisite-patch-id: efdf7936ffca1f97fc550118ae9a2a0795828f88
prerequisite-patch-id: bc2ce3683ecab7a91fe2ca00d35798d0f4ea5f80
prerequisite-patch-id: 2547b245dce99798d36835b1d729b21b6d1906e5
prerequisite-patch-id: 30d3ca50e1b09abd360ddf33982223cce24c6859
prerequisite-patch-id: deac1d76b95764903b7b6c937d7d4b43ed9f74ed
prerequisite-change-id: 20250831-max77705-fix_interrupt_handling-0889cee6936d:v3
prerequisite-patch-id: 4c30e8bca26067f7b96f7571086398cc86c6f71d

Best regards,
-- 
Dzmitry Sankouski <dsankouski@gmail.com>


