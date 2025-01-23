Return-Path: <linux-arm-msm+bounces-45996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5960DA1A6FC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 16:26:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27F2B1888751
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 15:26:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE00B212B3B;
	Thu, 23 Jan 2025 15:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iKrHCT8T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3994020F09D;
	Thu, 23 Jan 2025 15:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737646003; cv=none; b=SQ1dbWYxUEui+WzdjJUWqIZJ+zLkPeiEXleMATmHlAVfLjRXWE8P5CkRwRQ3wWDRPFsSk5Lc6p1vGLx4dGz1SKbHVdZoOCr0Kk8roXfWVIEJplxM235KHkQI0vVGBOSOlK4IsqsYZ7OeYXHzaTlQlwRvhUHAfhjrdt1X7e9ZtTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737646003; c=relaxed/simple;
	bh=ChE4vMMBa9VROMWkt+cfq2CFSIY8G9EPDtgmgY4su8k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EKlYEfCiQexOn2qgRlxMj7gvXQQZAzHeTnc24qIDS5QxNruF9XRndi5pLPGRCtQRclyZF8Fvcno6GfZM3JlnqDH47pj9d1uDWCI4SlQSpW/1xMyjQTQ+Pq5u9u0expOkvIYa3nKOcQw1n4O7zAw1IFTl/tdEMijoxVUQVXa700A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iKrHCT8T; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21628b3fe7dso18323995ad.3;
        Thu, 23 Jan 2025 07:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737645999; x=1738250799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9qcvVtHhcX24S0Ll3AdBgYRiPKI3SYG5yPKhUgX4qPE=;
        b=iKrHCT8TGT0KCgpsaDBiaVY1y1+YP9gqTXLEo2BAAXy7TVEAV4IpHaDCe7q5YBHRf4
         pSgpniotL4QYLjNTsCkep8l/dNZDky3CYWC0xJ5L/jv3UMtAk3R5kabiUXqh+YjYPnAF
         elGZd4sRm7d5s3Be8J6aIYT+JpWI2Wrb1c21INFViW9gsICwlRPGQXQ1o8hgPqzMkw+o
         yNQOn3oi4pwz0cvTF2ACUOLFSmBJ4kd6pO/9QPURnqtC7ZvybHM271a3L5khcQAiVSbz
         Vv1dVjVoRxzEH0mlpwoJ/mfBC5LjfQdyKhiFZjHZNKBe1QPCwiUMVMTZ0+5diz43wn/T
         phcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737645999; x=1738250799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9qcvVtHhcX24S0Ll3AdBgYRiPKI3SYG5yPKhUgX4qPE=;
        b=RceluAB8zG2/EVHzMJno/Jdy6N2M0GFyB61oWpa+/TG83ZBmA4sLr5Bud8/HfrqcoX
         tE06l1xxDYkZ/dY7n+6SrNC0inSDmTYKx2nv54QtJCtfEX+hMmQNINSyE1XNDN+LGWG4
         lNZSBa7J+OTrJkneHrdT8/Oj6stXpCS1y8VQDSRvKNq6SMgLEBSMMxWIJ4BUha4p8vCH
         OlDhQbRPmcUO4xpi8vf/jGjfmjY2Y6BTUeZn8qAv28m/HoMs9f5WYN1gSUly2sl1nrnc
         9hNFfjiBOcWki+UN/zOhv1kzon6z6hRuGrzho5m9pBPJEBSvqzDRm0iAJAlHJASXrCCz
         PnrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUU5XOFZVSFEyHQgrZxvTLXExontbzlAOO2KE1fIoUQQJCjRitESyPdcRX94UrYyt9AKIKicfFenVDXF6VFU3zW7cl2AA==@vger.kernel.org, AJvYcCVnC8r/koXI4D+YW6HpMCvliqrpDBrVaBU2kOBdgDMoY9iazbV/NqWmM2vArhmuCt/Vk+pZ78ZxttShMZo=@vger.kernel.org, AJvYcCX5cRcOqZLX9xU9KxCS3UeUA+2AaSMwIDIKz/nVbwFbnWO0dmlZimHNpV7jHcmXgCAnpY14RqqNL8eLyet3@vger.kernel.org, AJvYcCXUdDrqkf7C9arH06pdKDHaQbxt7vwdtSt4zLbXpapz7EZZYc8zPYgzBggeElNRuqneUlUCFBXr2niYciDt@vger.kernel.org
X-Gm-Message-State: AOJu0YxUAazcNvwZiK1xoCSVLV/D9TfcOoYFnX0D56C7lOugnBmhdRHp
	KsXTRcs185JxXmemUJmbQ+tzg8DMXFtGNI5j6WzTWPMbhSPT7r6V
X-Gm-Gg: ASbGnctxfnCTuYIgDpZkLvk4KiKliD/VXvg+3JGca1qHlspHpROisvTDT0ptsLmtZcJ
	yBTJj3f3C+DHUDjN5Fb5B7+T3GeEXUlvfVi88yuXJgLlI34dBwoRL9s+KTccbVOBdTMsjLk5s+Z
	pGoboSU9OLxCTP0j7pImhmFmpSRTzaBNNvU+EPLxwrysiKATl04voMg/OmAm2tTpM8STjfvdFrH
	sCv9rikjhL0pV52e/3JYqSnWU/6cBlHuNoV4Cu+0IcHMnWXxxdWdBY9mxSP0BQ610Tt+8i6Wut2
	T3MmxA==
X-Google-Smtp-Source: AGHT+IG+NZHV39N+Ap12x6ois7zfp6Vc6byclY7ix48+CqPaKmOiKh2sABNQSSIAqeHf+A7kRYpdig==
X-Received: by 2002:a05:6a00:2e24:b0:728:8c17:127d with SMTP id d2e1a72fcca58-72daf948568mr43427173b3a.8.1737645997690;
        Thu, 23 Jan 2025 07:26:37 -0800 (PST)
Received: from SC8280XP.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a9bcdcf707dsm11247915a12.32.2025.01.23.07.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 07:26:37 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=83=C2=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v6 0/3] platform: arm64: Huawei Matebook E Go embedded controller
Date: Thu, 23 Jan 2025 23:25:56 +0800
Message-ID: <20250123152559.52449-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds binding, drivers and the DT support for the Huawei Matebook E Go
(sc8280xp-based) Embedded Controller which is also found in Huawei Matebook
E Go LTE (sc8180x-based), but I don't have the sc8180x one to perform
tests, so this series enable support for sc8280xp variant only, this series
provides the following features:

- battery and charger information report
- charging thresholds control
- FN lock (An alternative method)
- LID switch detection
- Temperature sensors
- USB Type-C altmode
- USB Type-C PD(high power)

Thanks to the work of Bjorn and Dmitry([1]), the work of Nikita([2]),
writing a EC driver won't be suffering. This work refers a lot to their
work, also, many other works. I mentioned them in commit messages.

Depends: https://lore.kernel.org/linux-arm-msm/20241220160530.444864-1-mitltlatltl@gmail.com

[1] https://lore.kernel.org/all/20240614-yoga-ec-driver-v7-0-9f0b9b40ae76@linaro.org/
[2] https://lore.kernel.org/all/20240315-aspire1-ec-v5-0-f93381deff39@trvn.ru/

base-commit: 853d1f41ba73e78d22e7075d9a95670aab187eba

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
Changes in v6:
- refactor one ternary operator expression (Ilpo)
- replace one expression with &= (Ilpo)
- use devm_mutex_init() instead of mutex_init() (Ilpo)
- add Reviewed-by tag for devicetree (Konrad)
- add explicit cast (void *) to fix warnings when compiling
- rebased on tag next-20250123
- Link to v5: https://lore.kernel.org/linux-arm-msm/20250117140348.180681-1-mitltlatltl@gmail.com

Changes in v5 RESEND:
- rebased on tag next-20250120
- Link to v5: https://lore.kernel.org/linux-arm-msm/20250117140348.180681-1-mitltlatltl@gmail.com

Changes in v5:
- handle return code of i2c_transfer() (Bryan)
- rename threshold validatition function (Bryan)
- add enumerates and defines for registers (Bryan)
- drop extra line in header (Heikki)
- add Reviewed-by tag for devicetree (Krzysztof)
- Link to v4: https://lore.kernel.org/linux-arm-msm/20250116111559.83641-1-mitltlatltl@gmail.com

Changes in v4:
- use new API to register hwmon device instead of the deprecated one. (Guenter)
- add Reviewed-by tag for dt-binding (Krzysztof)
- drop unnecessary header (Ilpo)
- use guard mutex (Ilpo)
- improve comments and naming (Ilpo)
- add a shallow copy version of extr_resp() (Ilpo)
- add functions to handle resp and req whose size is 1
- drop PSY and UCSI subdrivers, commit them once the base driver is upstreamed
- Link to v3: https://lore.kernel.org/linux-arm-msm/20250113175049.590511-1-mitltlatltl@gmail.com

Changes in v3:
- Link to v2: https://lore.kernel.org/linux-arm-msm/20250105174159.227831-1-mitltlatltl@gmail.com

dt-binding:
- drop generic compatibles. (Krzysztof)
- remove '+' to use literal block style. (Krzysztof)

ec:
- take struct gaokun_ucsi_reg as parameter (Heikki)
- add almost all kernel doc comments (Krzysztof, Heikki)

ucsi:
- drop unnecessary ucsi quirks (Dmitry)
- add UCSI v1.0 to ucsi.h (Heikki)
- use gaokun_ucsi_read_cci() to read cci directly (Heikki)
- drop unnecessary gaokun_ucsi_get_port_num (Heikki)
- rename member port_num => num_ports (Heikki)
- fix completion, forgot to signal threads in previous version

dt:
- fix indentation (Konrad)
- add a link between role switch and connector

Changes in v2:
- Link to v1: https://lore.kernel.org/linux-arm-msm/20241227171353.404432-1-mitltlatltl@gmail.com

global:
- drop qcom's products(i.e. sc8180x, sx8280xp) everywhere, use 'product'-based instead(Krzysztof, Bryan)
- drop Cc Nikita Travkin, we had discussed the device in PM.
- add myself to MAINTAINERS

dt-binding:
- fix building (Rob Herring (Arm))
- remove unnecessary code (Krzysztof)
- add bugzilla documentation, insights of gaokun(see [1] or patch[1/5]) (Krzysztof, Aiqun(Maria))
- explain the difference between PMIC GLink and gaokun EC (Aiqun(Maria))

ec:
- use Linux style comments (Krzysztof)
- add a comment for mutex lock (Krzysztof)
- add more kerneldoc for exported functions (Krzysztof)
- eliminate unnecessary conditions (Bryan)
- add a macro for check thresholds (Bryan)
- improve English (Bryan)
- use existing sysfs interface(hwmon, psy) whenever possible (Krzysztof)
- use __le16 and related endianess conversion function for temp data (Ilpo)
- drop alias for packet headers (Ilpo)
- avoid hardcoding i2c msgs size (Aiqun(Maria))
- add a comment for the sleep in critial region (Bryan, Aiqun(Maria))
- use macro to construct packet (Bryan, Aiqun(Maria))

wmi:
- dropped

ucsi:
- reorder headers (Bryan)
- a comment for the orientation map macro (Bryan)
- make mux mode map more explicit(minus six is very clear now) (Bryan, Dmitry)
- handle port update exceptions return (Bryan)
- a comment for the UCSI quirks (Dmitry)
- use the inline hint for the short register function (Dmitry)
- use the API with delay to handle register instead of a direct sleep (Bryan)
- handle unfinished initialization early

psy:
- add charging related sysfs to here (Krzysztof, Dmitry)
- document ABI for power_supply sysfs (Krzysztof)
- drop charging threshold, use smart charging instead

dts:
- correct indentation, properties' order. (Konrad)

Pengyu Luo (3):
  dt-bindings: platform: Add Huawei Matebook E Go EC
  platform: arm64: add Huawei Matebook E Go EC driver
  arm64: dts: qcom: gaokun3: Add Embedded Controller node

 .../bindings/platform/huawei,gaokun-ec.yaml   | 124 +++
 MAINTAINERS                                   |   7 +
 .../boot/dts/qcom/sc8280xp-huawei-gaokun3.dts | 163 ++++
 drivers/platform/arm64/Kconfig                |  21 +
 drivers/platform/arm64/Makefile               |   1 +
 drivers/platform/arm64/huawei-gaokun-ec.c     | 825 ++++++++++++++++++
 .../linux/platform_data/huawei-gaokun-ec.h    |  79 ++
 7 files changed, 1220 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/platform/huawei,gaokun-ec.yaml
 create mode 100644 drivers/platform/arm64/huawei-gaokun-ec.c
 create mode 100644 include/linux/platform_data/huawei-gaokun-ec.h

-- 
2.47.1


