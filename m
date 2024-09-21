Return-Path: <linux-arm-msm+bounces-32140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B06B597DDDE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Sep 2024 18:35:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C47671F218BB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Sep 2024 16:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 960BE175D2F;
	Sat, 21 Sep 2024 16:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WKzzU95P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131F41EA91;
	Sat, 21 Sep 2024 16:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726936539; cv=none; b=VOFDxYbSLbkOALo4SK4bSY/FO3hP3o7dY3ppODiVq0dnjKmDQeuAnY6pXUKkorFWzm8ZV52+KzqABjgM7KO1A54rZV8yrEqcJIbq+ZXOIQeXFnI00JjLgMPsbO0qZWMDIyS4QRSi0U+/VWwZrR0S6B0Dr6fx86g2bbY3SBiTbik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726936539; c=relaxed/simple;
	bh=90AnSxGZrfW27syyqcEP2w/mvdQR7pHKGAwgOQsBT9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HF//iAWsfQPuQCwKfPdV9S/w8QMb4APauR/pnOnAed7UoWt3eCBgwmjvL9d3+TmrBA3u1WkmvtnKqZNdMaY32sf+9RYUB3BbpoC6zIUMki2oLguh7GF6rirmkoidUfI6ac2w4q8JLrFNx5homiw9Le25DDNi/3OJ8Xi23BQGGEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WKzzU95P; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-71971d20a95so2111324b3a.3;
        Sat, 21 Sep 2024 09:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726936537; x=1727541337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wct8se0gk0W+FAPlmyr9rg9BKBDj/W+HmOoVOccWFnk=;
        b=WKzzU95P/J3apcRsdAZbNbhjVVQTJcrpkYt7U3TMHSyvYZZxOtbF5iX89B95XShaT7
         ZCryVIwzPCpDCBHDEzpi+jg445wg+fKQox9VzTiTU6wxo3z2GcnLoZaNtzTX+tB0mQ2J
         k7wxGWl60HpmzIpsPmRzmZoiVasuH1EHKn+k8An4iZ20UaChtuFb+G/DSztmZIDshg/0
         FY4B7bikIooDYQJ+cgFCQ77b0x14GDuus1TsWhg8jFJ/Hl5/A/q8fiGEPiSu6PY7tJ+7
         w4CRnVO1cxIDERpYKemFtqG1+sOOxLPHCeYQ4rWnbXAeRPNjN91W5b1kwGk5RI4hU2Vw
         IdWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726936537; x=1727541337;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wct8se0gk0W+FAPlmyr9rg9BKBDj/W+HmOoVOccWFnk=;
        b=r/y+sX+V6fHn6UhrSxOah9rAa1lp3ZT65j565CZN+JHsXb0y7O1g18w1tD2L+f+svE
         fzpyFcUq9UmEHRYgC59iZvTJzw17CnJTuesh8USl0p7HWcdEhU/TrHT0pmEfN+lj6Y3V
         bahrQVJ9P2De+WeFSB2GyuIqWrgIrsmRQ3hI95YsGo1hM+FscJVgkz8fuqshslCDyY9I
         4EYI9WC+GkxnArh0++d3WzaU0EIsJT0r7hlzXy5WgliRmJ2r9yR+nS4HWVM+ff0D9aPj
         cBw+6uyjFMbBd25ZAzhR2vVdXWU/TSEkvJc7A60EIUV3LYb+7eU2Svh3T3gEOUn9nYT6
         xH6g==
X-Forwarded-Encrypted: i=1; AJvYcCUtj10IqsF0VXzsWlMGltxWlpV8FFMj0DeTbbZRaA7cb4s9koB5ptFp0F5/5YEiQO8R3wYCbNn5qS5Z@vger.kernel.org, AJvYcCV+LZLvQlrCp+PdraFgj3L5+pcw0lcWP6EdEgevpYra5b5u9zKziQf7oYCwCSC8teqke7gEEFnvbaT0B7TL/A==@vger.kernel.org, AJvYcCVNaPNIvvHMGVGWyjU0NyiAqvMulQBYPzXKhnWB4HIzQzPm8oNgPdvtzHH9pI+H/zPFit8epyAJuyb4tBwD@vger.kernel.org
X-Gm-Message-State: AOJu0YwgRqkP2WUkdzLtBfcdn0P/VNd3fuUM+FyVXAKgje4V485+RlRW
	K+s2kc2Vb/7/8baf8W/REBVSaEr+XXf8BCZcY2EInWAOEH6uq9Q=
X-Google-Smtp-Source: AGHT+IGBJ1JndDrkUPvvp6fEBiXc08LVCP356CLVISLaF46fI8rGiU1riP+GLp6rMTl14xEwEF4hvQ==
X-Received: by 2002:a05:6a00:88e:b0:717:88b6:6b1e with SMTP id d2e1a72fcca58-7199c9f0be9mr8974242b3a.18.1726936537100;
        Sat, 21 Sep 2024 09:35:37 -0700 (PDT)
Received: from localhost.localdomain ([183.80.189.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944ab4e5fsm11406430b3a.49.2024.09.21.09.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Sep 2024 09:35:36 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Clark <robdclark@gmail.com>,
	Peter de Kraker <peterdekraker@umito.nl>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: [PATCH v2 0/3] X1E Dell XPS 9345 support
Date: Sat, 21 Sep 2024 18:33:30 +0200
Message-ID: <20240921163455.12577-1-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce support for the mentioned laptop.

Very similar to other X1E laptops, device tree was derived by analyzing dtsi of
existing models and ACPI tables of this laptop [1]. Most notable difference were
* TZ protected SPI19.
* Keyboard only working after suspend/resume sequence, will do a follow up patch
to i2c-hid.
* Lots of small deviations in LDOs voltages.

Successfully tested with Debian 12 and Gnome, although this required additional
patches, namely harcode GPU chipid, apply [2] and _revert_ [3] - same as in Abel
Vesa's branches. Without last two the boot process is terminated by TZ. Firmware
for GPU/aDSP/cDSP was extracted from Windows, WiFi firmware from upstream
linux-firmware.

Quite a few things alraedy work, details in patches, quite a few still in WIP or
TODOs. Since fixing these may take me a while due to lack of documentation,
sending current progress as its very much usable.

[1] https://github.com/aarch64-laptops/build/blob/master/misc/dell-xps-9345/acpi/DSDT.dsl
[2] https://lore.kernel.org/all/20240830-x1e80100-bypass-pdc-v1-1-d4c00be0c3e3@linaro.org/
[3] https://lore.kernel.org/all/20240708-x1e80100-pd-mapper-v1-1-854386af4cf5@linaro.org/

--------

Changes to V1:
* Fix misalignments due to wrong tab/space conversion
* Fix regulator namings
* Fix reasonable warnings from `scripts/checkpatch.pl`
* Restructure all (sub)nodes alphabetically


Aleksandrs Vinarskis (3):
  dt-bindings: arm: qcom: Add Dell XPS 13 9345
  firmware: qcom: scm: Allow QSEECOM on Dell XPS 13 9345
  arm64: dts: qcom: Add support for X1-based Dell XPS 13 9345

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../dts/qcom/x1e80100-dell-tributo-13.dts     | 860 ++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c              |   1 +
 4 files changed, 863 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-dell-tributo-13.dts

-- 
2.43.0


