Return-Path: <linux-arm-msm+bounces-45260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE50A138A9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 12:17:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B4511882C26
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 11:17:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFAAE1DE2BA;
	Thu, 16 Jan 2025 11:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CTKg5bXm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B44E1DE2B1;
	Thu, 16 Jan 2025 11:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737026250; cv=none; b=NNDv2+FkQ/As1f74ynNP8C/ak/r/X6TUCtmSVhN+MyIzwXpnzBSaaizq+OzlqIuGAcR5MbaIW4LQ+ar/lMmxuLg/W3nYkPVMJJKW0t/TEPyFmkdzgP6krsscXVvv6Q6oEPtqfLOlMbKeXFjImpkcV58+02bccix/R315ksevESw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737026250; c=relaxed/simple;
	bh=XLy98T3G7aaHUazf/I3k8yow1rORS1A6VBHNTNAnD/8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cNKlkKRssMUuCtmH0I3c6mxGlX9IPhQdXxvJOVOnhkxVF1k4L0wPF1tFrRWvGjpoA0wFy3UnKBDIMiiJaGN/KVUeLMSHj0l/Q1Skf0uyEPRLs+yXTwAHU2IzXIa+I345j4QCAGYFNqQfqH5U2Ib1eGxISD7LEVNffDFMhkg6Rxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CTKg5bXm; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ee989553c1so1408899a91.3;
        Thu, 16 Jan 2025 03:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737026246; x=1737631046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ibENVorTsdIcxiTKKqGNwy3tpuz0Ee5R9mJSeZpEN6s=;
        b=CTKg5bXm7zuzYQPSzUMx2Tvs8C/Yv16dS3fesRwrE+67HsdnqBumIFfHrHw8Hx5wcF
         Q4A5/qCMxQV7T9bbx162rPus4qzRHGn3YGsWRfv35aot8zAbkVT3nQeCJnSxil74ZnDd
         oSAHHZzEnAOhpzLXPdDsgbs1YxMYEtudNkRyO25mAu3CcVA5Cql6NcJNqCY1wAkhrpw/
         qoskzw1mvmpc5dI2gKNcbssS5SjqFjZjpfgQoCXIZhfcEYq1byu0nbxkg9FRhetHoeGC
         nSjPW7kvZaQo3ohAovycUqwlLXeZYpeXLE4SXmiVHC6gc1uDJHQLpLVuh6OmijvxOz/e
         ZuRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737026246; x=1737631046;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ibENVorTsdIcxiTKKqGNwy3tpuz0Ee5R9mJSeZpEN6s=;
        b=w8vefuY/4bGjfwkwMZjZdZ/Gu24YgGsNP2wZ0FNSgAxofDYo95p5f1cuZdyVdHuBKF
         H1PLQbhOIDSVwWkyhdXNsTB6Aa0aGaml+mMtapyOeUKf2ZYaai3+j7zXlx5szSs14KT1
         6N/hmOV5v9woXaTJoGXjUX0bgRNsVDUrPChJzl/DVUBX4e5dvhButJ0bKpeD7IlnyR5x
         URK+D0wHCvonUXsADm3B0uuvjM/SQBaTGfbTKqnOLUBt8RP/NvxCsjmQyUD8LSydyq+d
         sUHY5Dvz86M3rdAeQuhrwpcsBwbyuwDe+4SYW2vHVD1ibSybWKblE+jQtvHN1O6qfwWd
         NFIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKY8mPbA8jrtxmSyAWc+1/c+Kriz6ypHBzOPVcnyZNtB5mspt0U/1vSab6wvieA6SadVUHK6b6uba2NArKhZaNS1P+mg==@vger.kernel.org, AJvYcCUkvDzgpq9OVpLP8HOP29hyByyU/NWpM2y9bEdC418N1hwFWP2EyxknaTi2YUIjCj8abaIeMoJejO/4dAE=@vger.kernel.org, AJvYcCVNfTMw+zfBW9b01BdQblL8LHXUAb2WBzq8U27qs9JQR8K+u+O0uwrPVGIUz1OcF6jkBdA5fjrt6eDq9oI8@vger.kernel.org, AJvYcCX0bUeSzJbJwBggssiZ668EaCCm7/peLTSALdhywNg0fp7ED571w9dpsk+tuBomwbfofgCpdZ+TJoAbyCqn@vger.kernel.org
X-Gm-Message-State: AOJu0YxHXBKORBQyLAEMT+NJs2/gyjwd7dsjf26ROjkw2cXI6Obm8aQs
	SP+4+w1c9EQM3kCpWVuuhp5ihPxm66unWp8yb8ZSiIEonjFn6MwD
X-Gm-Gg: ASbGnct7hJE9snnmyg2NdqcvNOZhve04TvwGZu17Hh6AnbyCWGeh529Ke8aDWnFcoco
	6YrV1LXUpH52U9gQoIzbz31Jgi0nCR6p3mqz+DRLFTmrFAHXhj/YlUjn3rMJuL8XAVyut4GD8RN
	cMbRzHor1BWk2FJHO9iHyBj/bagYDF5kArG4C/SGO8WvOzMv7pPQowUBSlYhkGjA2UF1AckJHIp
	YUCX4uhfTnsoTbg8cvFW6Ygt38UV+flZ0oJ+Jvwh7za7fErVuG5X6Y=
X-Google-Smtp-Source: AGHT+IFq4TfgnexQoZ1YdF491tO+hq1yYyRQQrk6++56ccDZw+y5TiE+X6Sjfz6DoQjTtJT5C8hmHg==
X-Received: by 2002:a17:90b:514d:b0:2ee:d024:e4fc with SMTP id 98e67ed59e1d1-2f5490dd195mr51754483a91.33.1737026246304;
        Thu, 16 Jan 2025 03:17:26 -0800 (PST)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f72c156b9esm3091585a91.4.2025.01.16.03.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 03:17:25 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v4 0/3] platform: arm64: Huawei Matebook E Go embedded controller
Date: Thu, 16 Jan 2025 19:15:56 +0800
Message-ID: <20250116111559.83641-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.48.1
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

base-commit: b323d8e7bc03d27dec646bfdccb7d1a92411f189

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
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
 drivers/platform/arm64/huawei-gaokun-ec.c     | 787 ++++++++++++++++++
 .../linux/platform_data/huawei-gaokun-ec.h    |  80 ++
 7 files changed, 1183 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/platform/huawei,gaokun-ec.yaml
 create mode 100644 drivers/platform/arm64/huawei-gaokun-ec.c
 create mode 100644 include/linux/platform_data/huawei-gaokun-ec.h

-- 
2.48.1


