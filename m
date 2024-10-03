Return-Path: <linux-arm-msm+bounces-33051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E90F98F8A4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 23:12:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 467391F2130A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 21:12:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C5B11BBBCC;
	Thu,  3 Oct 2024 21:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H3/i3JVn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33E91AB500;
	Thu,  3 Oct 2024 21:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727989920; cv=none; b=Z9XS8kK1K54scQwPYiOodCP4Yb+KPE4Fc7rsZsQodd0M+H0NLYVeXwo/BHn3PVwcsFbzotW+aIaTu2Zgexdl8531G3OWJIbWzhaBc3L4G39nvUtXqNNrlD5THAuptBhvnmP7JIRhGiOl5DYDjitfdz0kqciI220DWouQev0v91w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727989920; c=relaxed/simple;
	bh=Kbi2i+FL2yoWCMEok+yZKrG01ezY64RKZSHimiFXaig=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZWOblAq7ZC/RujRB6lSOe/zCajUAloyNnFrNBeRGDHnpt5fOwRukYJxClpDZUSZ//McJK+8g++NDLw3GoYAadKp6cHXDH5GuVNIG1YV7sABkyHsMrc49NJinVgsQZ3D/RTEfb7lmhg9r8WGA51Yi7lxSd5M1VIQifqVFfeVxqSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H3/i3JVn; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42cde6b5094so14164735e9.3;
        Thu, 03 Oct 2024 14:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727989917; x=1728594717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VI5or45IbYULVG7QzPxTjxL8zClYzFrs21LWY0ZUn2c=;
        b=H3/i3JVnmbt2LhdVa5jGAOmjeJd7Z7Emw3fAbv49H39EU7lf3xsWXd9nBtnMn32cVq
         LoDsajlCGtuYjuO6lKU3BeGPKXrWEx7spyS1lJcUD8Ieyu8i7o/LcMySHXv/GTrNyf5f
         kQLeVoVpVGphkDyQde3pNSBbY/3fmofXLIeJ7ZPSsYZ4EN67EZ2mvyGUvFatCo/WvaTC
         FuruC5JYk9b3+2SWZ0tBDQC3QjzokfbZmHe3t1qKrBzgZY8EtfuO5N4BROIeoiAKoFpi
         TQAqBydpIZQ5rzQH+mR/saYgnr299KPKyIvvhRZVCEl58kOt4fUCtm5KLvlgl8GWIK7n
         hNYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727989917; x=1728594717;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VI5or45IbYULVG7QzPxTjxL8zClYzFrs21LWY0ZUn2c=;
        b=i47A9LuiSFRvbRp5KTjVN14rmE7jgMVsxpKkq7OBAgKub1jwn9gyNv4PPHNA4hRKBu
         ao/75H/hwWOQSNlMZg03oXwqnGOArU9RPWkf6uLnz76dwPouEgvuDcLMe6SCsB3hp8J2
         Jun4oWl6BN235YSSU5055wEvPDSUTd5u6JHNPj9o9I9ACUqK4zRRT3iO/Xt1XSeMzjtx
         perxK2bjXwd2cJz5PX2uFuvegbcjMccGLbraqW6UovzZa2LXmXKknqcwvZschAtK1GU1
         NoW2oyTqwmAHMREIMsdZfxwSY01uZM5CF9tsDY7O/q2j6+F2xP9RbIZ8pjKHT9relxef
         VLRA==
X-Forwarded-Encrypted: i=1; AJvYcCUUkLC7+NQo+q/JfvtXNiiSGu9XS3dCeEn/hANPLN9UPN0D7eDMBso6oBHQM+8PgqFhnqwaLtYxDqdn6U7BDA==@vger.kernel.org, AJvYcCVPl2KgIwj3B8rztGC8XtpZiPPby8ABUxeMLybVySKL/8AnjnOodx+AW57Q1WbOAV04OaGNfl0ZFuNFbBI7@vger.kernel.org, AJvYcCXIYsw+4eoudrRPgd+JQtI3DSj7XI1PziiWQvBArxRczg67RqBnz2gFQX9RkXjPkbncrO4H35nt+657@vger.kernel.org
X-Gm-Message-State: AOJu0YyDvXXaGZwHCo0AU6mc1BfBKmF/v+SoAaQ98jOi52bwjgwCp0IP
	3Un1Lm7Dyq7/+7YTk9cdSwp0hE4mdHL2X+ytLdDC0BBINABl6g4=
X-Google-Smtp-Source: AGHT+IHYeiprN5HPI7AXxDCl79promqgyksSqA5owbJXCqlh8ySiPYQbrnTEuFUJ+t2jY/R+FoMGrg==
X-Received: by 2002:a05:600c:1e25:b0:42c:b63e:fe91 with SMTP id 5b1f17b1804b1-42f85aea11fmr2689145e9.24.1727989916336;
        Thu, 03 Oct 2024 14:11:56 -0700 (PDT)
Received: from localhost.lan (adsl-178-39-53-103.adslplus.ch. [178.39.53.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d082e6dfesm2002073f8f.117.2024.10.03.14.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 14:11:55 -0700 (PDT)
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
	robdclark@gmail.com,
	peterdekraker@umito.nl,
	Bryan.Kemp@dell.com,
	tudor.laurentiu.oss@gmail.com,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: [PATCH v4 0/3] X1E Dell XPS 9345 support
Date: Thu,  3 Oct 2024 23:10:06 +0200
Message-ID: <20241003211139.9296-1-alex.vinarskis@gmail.com>
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

Successfully tested with Debian 12 and Gnome. Firmware for GPU/aDSP/cDSP was
extracted from Windows, WiFi firmware from upstream linux-firmware.

Quite a few things alraedy work, details in patches, quite a few still in WIP or
TODOs. Since fixing these may take me a while due to lack of documentation,
sending current progress as its very much usable.

[1] https://github.com/aarch64-laptops/build/blob/master/misc/dell-xps-9345/acpi/DSDT.dsl

--------

Changes to V3:
* Rename device from `tributo-13` to `xps13-9345`
* Update commit description - identify EC over i2c, likely camera model
* Update cover letter - no hacks needed when build on top of linux-next
* v3 link: https://lore.kernel.org/all/20240927094544.6966-1-alex.vinarskis@gmail.com/

--------

Changes to V2:
* Fix uart21 missing alias
* Fix redundant mdss_dp3 defines
* Fix touchscreen i2c address
* Update commit description - OLED panel reported working
* Update commit description - touchscreen reported working
* Update commit description - battery info reported working
* Update commit description - add keyboard patches link
* v2 link: https://lore.kernel.org/all/20240921163455.12577-1-alex.vinarskis@gmail.com/

--------

Changes to V1:
* Fix misalignments due to wrong tab/space conversion
* Fix regulator namings
* Fix reasonable warnings from `scripts/checkpatch.pl`
* Restructure all (sub)nodes alphabetically
* v1 link: https://lore.kernel.org/all/20240919170018.13672-1-alex.vinarskis@gmail.com/

Aleksandrs Vinarskis (3):
  dt-bindings: arm: qcom: Add Dell XPS 13 9345
  firmware: qcom: scm: Allow QSEECOM on Dell XPS 13 9345
  arm64: dts: qcom: Add support for X1-based Dell XPS 13 9345

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../dts/qcom/x1e80100-dell-xps13-9345.dts     | 863 ++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c              |   1 +
 4 files changed, 866 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts

-- 
2.43.0


