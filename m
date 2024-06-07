Return-Path: <linux-arm-msm+bounces-22037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EB69000D7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 12:32:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 058071F258FF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 10:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1580515D5D0;
	Fri,  7 Jun 2024 10:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wunUnyRc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D4B15ADAF
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jun 2024 10:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717756363; cv=none; b=M/I72Q/HwWCUdMovRkEqEDntTvlO6ozDUGw6GU6nD6XTHF36HOB6sxTXJXSmuek8qX5PPCFT3jjEJ9Qk6/82eb3X5w/G5M66K1zk1FtC5Zloh9o5RVTKXwdS2uvwo9TPJ1muOQT1L5FGUMG2ozsJ8kv6cDBKJN1phE6QKQJpY6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717756363; c=relaxed/simple;
	bh=xvt5m4Jlh1y+ovh7kSIJW1gyiD5eGzqYSOeOJW+BqiA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=grXWPIGah8bEXv4kCNz+qI3ZNM4bsekhyjVmA+XAaczFYlXpOpfq+EMDHIRi+TyA+7G8mWE91d4CpyJ+jty/Mo3KqoLp0LuG8bJIQVZYuvNrU5o+BI/unIICEatcgeuXtWGkTZ48IH5N3zE0F+2YcJg6KRUnv0eAISXG/be0xsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wunUnyRc; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52b992fd796so2070735e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jun 2024 03:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717756360; x=1718361160; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5itY4RhKi9EGd/T0IPjWMpqNRJQ1/SokdqN1IoH3jZk=;
        b=wunUnyRcFqB5j5M5rq4rAtVr1q+IwydzrlOCdmzbU58Xltaxx+R9UiNAQtDpjIeAuU
         L/AD1i/OdrpuJIStPb41pRuVDfC6UECqpZsHIRWJ70AR1eL04fRxPcfVH7UD1VS/7DXh
         3+78ea4VPlHlBWqgKLEhMjZCayNbReM4JDlWaUhoaZuNJLlgbVZoS3pNQLEpDZbhPwsW
         TP4pmgjHuKoLGx08mSewTj6Noc5l/i60uwiy+xfdHGvxx3FDxOpVnKM98yMO+USO7lIe
         1PpMDVylEiXglSkF77e1FKW/JfcDwLH+mlrnKdc6fIVyJWzfUOaahRbW2blCR16pOwR/
         qd0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717756360; x=1718361160;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5itY4RhKi9EGd/T0IPjWMpqNRJQ1/SokdqN1IoH3jZk=;
        b=C4P2Q5eDR4ppm1C2bnHpbvCBTnyxR4De3A9c8ItobI5xGAOI01/vYisyx/QiX/EWbL
         LpvI8x51qU17TV3Hxcmps3B+ByhKlc+Dha2PHUEVfinCa7m+wNaK9mGBqjaNiJaAEj5S
         Rzut524BfekUBn1dOMtDWnHHGO/rRaI/mTILU2TP7XqVX8TPgSEcVdGZilr3TwDpUIpO
         RMje5OYje8uRqUZEFWS8XnwHFKtxIswC4Ir+C2rg5VIqlaDMhQUaA8pEIkiLaw2viIQu
         l8QtQhvbq1UW26FehdvEu7AP5WpyPaBXWOO89MrCJyIKkTY2XkaqjH0pXLsSt2mxysMh
         mZfw==
X-Forwarded-Encrypted: i=1; AJvYcCWuWvJUqBlJjwhmdmyoViKS8HQcKYAOdRismOvC8W9FmT1OfXRqcNGRYy6uJPUL35rM7by0mSJHetBmfKLy9oM9B9mY4JMfloY6BQj5LA==
X-Gm-Message-State: AOJu0Ywiv4kuz7qEZgNHhTblnPFSRua3pZQpLvDJBzePGJpG3nhxnk0X
	CmS6fJaTtI5H9VzD8e6fImQa9+8u19eSoSRll4KkHRCil6xy5zRiSy4DhVjA/Qg=
X-Google-Smtp-Source: AGHT+IHhod+l49aRiiKMj7mDaCpAkinn0yA7FL4cBp5PJtT0eHAkde4rBn/etlB/H1vtvFvVoUJuHg==
X-Received: by 2002:a19:5e4a:0:b0:523:88d8:67cf with SMTP id 2adb3069b0e04-52bb9f81522mr1189290e87.36.1717756360045;
        Fri, 07 Jun 2024 03:32:40 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52bb433ccdbsm483448e87.283.2024.06.07.03.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 03:32:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v5 0/6] power: supply: Lenovo Yoga C630 EC
Date: Fri, 07 Jun 2024 13:32:35 +0300
Message-Id: <20240607-yoga-ec-driver-v5-0-1ac91a0b4326@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMPhYmYC/3WOy2rDMBAAfyXo3DWyHpbSU/+j5LCJVrZoY5WVE
 THB/145UEgpPc5hhrmLQpyoiNfDXTDVVFKeG9iXg7hMOI8EKTQWSiojrXKw5hGBLhA4VWJwQww
 u2hCQvGjSF1NMt0fw/dQ4cr7CMjHhT0ZLJW1vlZfHTimtjR6gh3BNC6/dGXkt00eub59pRs5d5
 nHPTqksmdfHZtV7/N+jqkGCVg6P3vYBg31O7UvVPPv+j2+abyL6EBHJnYdf/rZt38MjJcY0AQA
 A
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Nikita Travkin <nikita@trvn.ru>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4434;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=xvt5m4Jlh1y+ovh7kSIJW1gyiD5eGzqYSOeOJW+BqiA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmYuHG/5FW+we87ynSKCH/7Psskmx4E6tEpczmM
 uz37tA+3DSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZmLhxgAKCRCLPIo+Aiko
 1Y+7B/9XoTuBxr2ReB46vcPQzaeoAQ7xneC9zq117TItcNWQbvHvqqE7rL2/bzOomGmUBRT7315
 LkhdpEfW2pfjw6RkrTnrZOuF8qWq1dtmKT9BhQlELc4JAYlB0kt3n6aCGyzRG8WKwpkCh3bOTr2
 qDuuOF6Ie5RvmM+0xSGyHbxbfuIyu/Ti4xygWE0kVuICgrlX6VMUcI4IfWGYa8MNjUjXBdyKbHy
 TT5l14fuM29YMiaWL13t6VrCc6LfQbXgigZNANTl59BcuBX09lAfhmzDSYc5/Vm0WZjFpVAoVuD
 mTYHgV20Q/avwzNYdXoxppccPFBux3wniJG9vB86O5HbL/fJ
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

This adds binding, driver and the DT support for the Lenovo Yoga C630
Embedded Controller, to provide battery information.

Support for this EC was implemented by Bjorn, who later could not work
on this driver. I've picked this patchset up and updated it following
the pending review comments.

DisplayPort support is still not a part of this patchset. It uses EC
messages to provide AltMode information rather than implementing
corresponding UCSI commands. However to have a cleaner uAPI story, the
AltMode should be handled via the same Type-C port.

Merge strategy: the driver bits depend on the platform/arm64 patch,
which adds interface for the subdrivers. I'd either ask to get that
patch merged to the immutable branch, which then can be picked up by
power/supply and USB trees or, to make life simpler, ack merging all
driver bits e.g. through USB subsystem (I'm biased here since I plan to
send more cleanups for the UCSI subsystem, which would otherwise result
in cross-subsystem conflicts).

---
Changes in v5:
- Added missing article in the commit message (Bryan)
- Changed yoga_c630_ec_ucsi_get_version() to explicitly set the register
  instead of just incrementing it (Bryan)
- Dropped spurious debugging pr_info (Bryan)
- Added missing includes all over the place (Ilpo)
- Switched to scoped_guard() where it's suitable (Ilpo)
- Defined register bits (Ilpo, Bryan)
- Whitespace cleanup (Ilpo, Bryan)
- Reworked yoga_c630_ucsi_notify() to use switch-case (Bryan)
- Use ternary operators instead of if()s (Ilpo)
- Switched power supply driver to use fwnode (Sebastian)
- Fixed handling of the adapter's type vs usb_type (Sebastian)
- Added SCOPE property to the battery (Sebastian)
- Link to v4: https://lore.kernel.org/r/20240528-yoga-ec-driver-v4-0-4fa8dfaae7b6@linaro.org

Changes in v4:
- Moved bindings to platform/ to follow example of other Acer Aspire1 EC
  (Nikita Travkin)
- Fixed dt validation for EC interrupt pin (Rob Herring)
- Dropped separate 'scale' property (Oliver Neukum)
- Link to v3: https://lore.kernel.org/r/20240527-yoga-ec-driver-v3-0-327a9851dad5@linaro.org

Changes in v3:
- Split the driver into core and power supply drivers,
- Added UCSI driver part, handling USB connections,
- Fixed Bjorn's address in DT bindings (Brian Masney)
- Changed power-role for both ports to be "dual" per UCSI
- Link to v2: https://lore.kernel.org/linux-arm-msm/20230205152809.2233436-1-dmitry.baryshkov@linaro.org/

Changes in v2:
- Dropped DP support for now, as the bindings are in process of being
  discussed separately,
- Merged dt patch into the same patchseries,
- Removed the fixed serial number battery property,
- Fixed indentation of dt bindings example,
- Added property: reg and unevaluatedProperties to the connector
  bindings.
- Link to v1: https://lore.kernel.org/linux-arm-msm/20220810035424.2796777-1-bjorn.andersson@linaro.org/

---
Bjorn Andersson (2):
      dt-bindings: platform: Add Lenovo Yoga C630 EC
      arm64: dts: qcom: c630: Add Embedded Controller node

Dmitry Baryshkov (4):
      platform: arm64: add Lenovo Yoga C630 WOS EC driver
      usb: typec: ucsi: add Lenovo Yoga C630 glue driver
      power: supply: lenovo_yoga_c630_battery: add Lenovo C630 driver
      arm64: dts: qcom: sdm845: describe connections of USB/DP port

 .../bindings/platform/lenovo,yoga-c630-ec.yaml     |  83 ++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |  53 ++-
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      |  75 ++++
 drivers/platform/arm64/Kconfig                     |  14 +
 drivers/platform/arm64/Makefile                    |   1 +
 drivers/platform/arm64/lenovo-yoga-c630.c          | 283 ++++++++++++
 drivers/power/supply/Kconfig                       |   9 +
 drivers/power/supply/Makefile                      |   1 +
 drivers/power/supply/lenovo_yoga_c630_battery.c    | 500 +++++++++++++++++++++
 drivers/usb/typec/ucsi/Kconfig                     |   9 +
 drivers/usb/typec/ucsi/Makefile                    |   1 +
 drivers/usb/typec/ucsi/ucsi_yoga_c630.c            | 202 +++++++++
 include/linux/platform_data/lenovo-yoga-c630.h     |  43 ++
 13 files changed, 1273 insertions(+), 1 deletion(-)
---
base-commit: ee78a17615ad0cfdbbc27182b1047cd36c9d4d5f
change-id: 20240527-yoga-ec-driver-76fd7f5ddae8

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


