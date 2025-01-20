Return-Path: <linux-arm-msm+bounces-45627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CB2A170A1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 17:47:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FFB83A06B6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 16:47:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD8521E9B2F;
	Mon, 20 Jan 2025 16:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eDloANTR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374D31B87DB;
	Mon, 20 Jan 2025 16:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737391644; cv=none; b=KgxBE9apB9c0Gz54I5y4xbQelYgFoJYM0FIcArFeI7dbGGhRfaA/QCPSSxm0RFNbHJygYFeoGPQ+nK7/MVmpGhC9dF9V8tLHYWZNPrhaWIhiNPt3dmHCZgNt+v70VGoFkhLl8R+rD1ed8lyCNDnKtVHdqnfzr9gDqpDCtlnPlUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737391644; c=relaxed/simple;
	bh=/BRqQQRQVKG6vw0CPMQDoo5DHvOmcsihcx8/9lseyYE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rnA+KbQajMpFSLZn6hw7cApb4y6BLCahTKU16CIgNFp0vsZFEQ0PLlmipkZZeLelSl1TS2Buvs2fuK5v7aPQh8pV0DRUOihezHxSJ8mYcEEB3qPs0KL2c6c/6OGTcVxMNeGsw+DK4htDH9Zn0AHLq02s/+uQey68hcQPQMXDIkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eDloANTR; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2164b662090so84328395ad.1;
        Mon, 20 Jan 2025 08:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737391642; x=1737996442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r/xe7VYeW/MlUkO2Ilz+rV7mCFB6lDVm5giwjRxBd3w=;
        b=eDloANTRiFYSBqQbRhkEdbz05T/NiUc7qlvDxStOdJVCvWx1lRy2LIGNwWBzntNB7S
         fBsmGs5l6CZPueCFfoMFdOe28IO4OA7Mc9euPByjXozHUOtpxmNCuhekMDX7HO2IWEWS
         KTWb9ilLE9GES59+Y2gCiYt7ufyFBjCktppx7bD6hePVdkv1KIVNa2lzNS4i7W511AlT
         AQnIy9lKoAXowirNWuT9d6oPVNi/PDlNztVDr5rSwRgzh0T9gQbRHFI0qFRzcxEU01Qi
         U1LtGpye5KqMGLjuvNnxXNGnOXQ82V01odSATbwK+XeYRsKTcEy5SOuYhzKUPHZXWYNs
         /nuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737391642; x=1737996442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r/xe7VYeW/MlUkO2Ilz+rV7mCFB6lDVm5giwjRxBd3w=;
        b=jvTbhsWVty9nkuXyXFXOYo50mVSbR6Lv2AC7YBQNPeG/xjD27UYeHQdy2XqXPlfy2v
         n7rEQgZ6GDEy5qKAonIXMyFwsw88fSFT/zZRK1vstnlFLWAtkubt73RIU2un++5MA8BS
         BBQ087FrRp6DydsDQcOP8HKT08Z6Osix8OWIoQO1HnJZqB93lPAjWawxyToLu2x21Jll
         TE6nFSUH1W1JYma/7h2WtctbhHzAwbwm8fHzyuW5Z2hKoE9G/G8HioobDgCjqWLNMf7Q
         nnfVIgtzFTe4rMwlWvOp1AVLiDJOtv9OZmFyBDmYSZ7jj8hdyekOt2z45QbpqtZKHxIk
         e02w==
X-Forwarded-Encrypted: i=1; AJvYcCUhax+sB6A6p6ltcUTLrB82i/hbRxNO6t0RbLoBaJuOAmo5UCSw+J63lL5bu8MaIGiQRTGp2HGrEM/2slNWt0LzyisT5Q==@vger.kernel.org, AJvYcCUxvQjVOkTnCutcj+ZRSnjNpcmoZ3LIivWFyhkDp9ADlP3ogQDb0/YXbeGeg5oVYFV/HgKy4/Ld/SjDiYs=@vger.kernel.org, AJvYcCVrZyYWWLUqx0oL4XQfUZUE5GdXxj/IFf9uCn/vXqDFJEIXSBFjE1n93Cc505nXB1JrH/B0u+Wo2mxZa1xh@vger.kernel.org, AJvYcCXT5lg6Pv5+sHYEXNEsXISSOCpJEzTTwcjD/igI8VJfhqKkF2zz+/deKp7P3+Sls2O9G4IkvgzmchTjjsv4@vger.kernel.org
X-Gm-Message-State: AOJu0YxUubhb3+EZocp3Uy6sResM/7Xl14WbF4zjY1fAEYPO3qa8dN5q
	8fvrrmRYJdehhDSSx845DsPogVP05yjEResmQHaWfCMcnqqsBllH
X-Gm-Gg: ASbGncvxpWozEUFraDll/wMo5ipHNGXWDt+StdC0Qwq6ghp/9nqddMfDe/lL0r//8//
	vsueSDCGUE0O+H7pgKoFC+sYCBkRjeKhjdE6s6VzBueSxdTNNzD26y1mF6/Caa1RUWpAhvcxWSy
	r6lYzeXmAB2U6Lnp/rVLQCrcJjXKBUAw3gPh7XXjeqVkll7c7jD/JjXrngLdCj29csB9ZbwvaPc
	U2R4yuUYMNBmzBwx8Nmsphp/t44sTGBM07xir2U58l3iUKgzZ24QiRrIE4NdOPGBVQ7VTc=
X-Google-Smtp-Source: AGHT+IFDWawL2sk9cWU6NwA9ckJBDcTLFpiPCr7KNj5da17y7tOkvdi2a1rHKe4eMVASRy5sq8K7MQ==
X-Received: by 2002:a05:6a20:9149:b0:1e5:ddac:1ed7 with SMTP id adf61e73a8af0-1eb2147ea8dmr20536491637.12.1737391642402;
        Mon, 20 Jan 2025 08:47:22 -0800 (PST)
Received: from SC8280XP.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a9bcaa3a97dsm6017266a12.9.2025.01.20.08.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 08:47:21 -0800 (PST)
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
Subject: [PATCH RESEND v5 0/3] platform: arm64: Huawei Matebook E Go embedded controller
Date: Tue, 21 Jan 2025 00:46:58 +0800
Message-ID: <20250120164701.7918-1-mitltlatltl@gmail.com>
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

base-commit: 1573c8d4cb206a2d1454ff711e79f8df2353290b

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
Changes in v5 RESEND:
- Rebased on tag next-20250120
- Link to v5: https://lore.kernel.org/linux-arm-msm/20250117140348.180681-1-mitltlatltl@gmail.com

Changes in v5:
- handle return code of i2c_transfer() (Bryan)
- rename threshold validatition function (Bryan)
- add enumerates and defines for registers (Bryan)
- drop extra line in header (Heikki)
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
 drivers/platform/arm64/huawei-gaokun-ec.c     | 822 ++++++++++++++++++
 .../linux/platform_data/huawei-gaokun-ec.h    |  79 ++
 7 files changed, 1217 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/platform/huawei,gaokun-ec.yaml
 create mode 100644 drivers/platform/arm64/huawei-gaokun-ec.c
 create mode 100644 include/linux/platform_data/huawei-gaokun-ec.h

-- 
2.48.1


