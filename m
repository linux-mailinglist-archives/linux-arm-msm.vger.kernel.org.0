Return-Path: <linux-arm-msm+bounces-32650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C789881B1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2024 11:47:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5291B1F2256C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2024 09:47:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF4101B9831;
	Fri, 27 Sep 2024 09:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kikG9Ycy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C82715ADAB;
	Fri, 27 Sep 2024 09:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727430364; cv=none; b=pbHRv21NYD2cZwmfOMVTLNr+P3Z8dwBgnjDl98asX+M2kVdCfc3QYpeU6wlRDDdtFsFU1HCr+x1uyBxEu+8cL28I2Jy6Q0QlpoM02N3BeXg3ra2AE0iOBMP5jhz8hTgXTgN9D8rEv5g7bv763CPaVdc/ZN3nH2a+TCInCkGuols=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727430364; c=relaxed/simple;
	bh=dHFIqzDSAcs/LJ9D4ZKQcgGwC3lxFR5LYOie6vevEAs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a9kFltCixPfReYdqVpICaruVLGZ4Z40bgWfVa1T5/RU4yWjBLHUuxAo8puS6ke9YakjCgFkfhzy+VWPPwCvVC6nY7ESL0AcyZJJIH3S/WHXtGNgf7SY9i8O3C63p9KFB7gBuSN5NRU0WfeChReJwXiF6eVEissXCdzGRVtVBt6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kikG9Ycy; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-206aee40676so16499655ad.0;
        Fri, 27 Sep 2024 02:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727430363; x=1728035163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dg8Cm5qu3yzUVKUg5XLjDCIXUrVKekLRBfh6xFK8yD0=;
        b=kikG9Ycy3Oxdm6ymoalEEWeuJ8bJserQDfjj7C1RnrMMaZhc9RF1CwWdlQECxntfEY
         t5j0InYuFgfvqICqjKJ6bHU+HGeFpsEJC9iUCLo2s5ojBFtBFvo6z9h2GRMMSZS852sa
         TjgjY6/n5MZPHkQt2e+T11HA2kOkNeNT7jcHHjMaEwpuMK3/ozyIvmsjuyWbNTH/gBOF
         OnBv2BJBHKu/znThcQ1YWakgHswPn+aBvlOa/C9Cbexgw7Q1ErXvGLxWzHoiW8LkWUxQ
         k9GVn/Ri08hU0Tm6Iv9YKl3bmZmwMUWKBUacggFSSlVd6DFjiihQDpfHOG6FrOyETX+g
         rXcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727430363; x=1728035163;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dg8Cm5qu3yzUVKUg5XLjDCIXUrVKekLRBfh6xFK8yD0=;
        b=Xs9Vc7U6n5XHkyyp/Zj9ZFPvLzJOqGnayg6ipYjS4kypaaiVW7tTUal7t7958s6LqU
         xlxA+99W23BXd1I+xQQQwODSPdWk/xcHKfc/Kc3kz1pNUfx5CnyQVPXe7fm5J5Mjx5pl
         9rsF84UNIuQKxcJt3Qcowy3ShHOdVn6LF/kkI0rmrzogB2+gBvYdRnDhWh3eAx240bNC
         9Zyv1GadmbD6vF2weIWJqN2eod+fisRAs5X/QBoHbAqfQ/nVXzRjqTzziruLRTbdDrQ5
         If2Z/S2fsZTU63IO6E9zZPVorxLelCBB/sMQRpUcmUr4mTawvywWSVMZygsaDBYtdDbU
         QQ5g==
X-Forwarded-Encrypted: i=1; AJvYcCWgTvtrKn8wFe7asECEHYCILev/AR6A+1UwxoxOrLlHdpJQVMwGdSPRRfvlMRkBvwG1zCaB6JeSHAlA@vger.kernel.org, AJvYcCX0rthzXPo1y3wjcXrusCwifp9JKOIrVwicYlyPUbtA26otCqhmfNUHjSIlV0NURRno6kFYvxSpxzDhX64JCQ==@vger.kernel.org, AJvYcCXJ0rsDqqkOIfNbl82enB5Hlgl6L0ToYH7SVtRJTRAZBmMmSv2+9PAkEbaifJUpHBb4kUVA/Ss4o4kSq2L+@vger.kernel.org
X-Gm-Message-State: AOJu0YwJxlAg3raXxGtJOf7d0C+JCZd0ZpzgM16IFOcEwTjiHuVJI0Co
	zD2qZhmHUuOHqAcqBL/Ns2ITIWxm097KGtL73bChV+aYrRfPF30=
X-Google-Smtp-Source: AGHT+IHZcCivTIFJllgFWqRP7trmJT7BjcpvHl0dD420q1qxmyXZbp3opHtYulSJ0AEhAtroKhSK0Q==
X-Received: by 2002:a17:902:f601:b0:207:457f:b8a6 with SMTP id d9443c01a7336-20b367d0285mr38679045ad.12.1727430362501;
        Fri, 27 Sep 2024 02:46:02 -0700 (PDT)
Received: from localhost.. ([42.116.8.116])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37e4e61csm10533895ad.237.2024.09.27.02.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 02:46:01 -0700 (PDT)
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
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: [PATCH v3 0/3] X1E Dell XPS 9345 support
Date: Fri, 27 Sep 2024 11:44:17 +0200
Message-ID: <20240927094544.6966-1-alex.vinarskis@gmail.com>
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

Changes to V2:
* Fix uart21 missing alias
* Fix redundant mdss_dp3 defines
* Fix touchscreen i2c address
* Update commit description - OLED panel reported working
* Update commit description - touchscreen reported working
* Update commit description - battery info reported working
* Update commit description - add keyboard patches link

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
 .../dts/qcom/x1e80100-dell-tributo-13.dts     | 863 ++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c              |   1 +
 4 files changed, 866 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-dell-tributo-13.dts

-- 
2.43.0


