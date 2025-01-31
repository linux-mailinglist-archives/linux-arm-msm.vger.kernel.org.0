Return-Path: <linux-arm-msm+bounces-46590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 762C1A23B38
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2025 10:22:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9B2C47A14A7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2025 09:21:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBA221865E5;
	Fri, 31 Jan 2025 09:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D0jI3E4Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376E71E885;
	Fri, 31 Jan 2025 09:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738315314; cv=none; b=XMHqR2P8V1Cq39NidZPcCVVwpIKWVcMOqr8YP8FnDjq3+UMBnha2d/KZMx0+RfXV496eiUx/jOEoDyWp/7DvjO/s2TB47BDMxnQTsamPM0lxvUfXgpPS59R6AlceNayvxBvQm78PGZrPc32J/0Q8Gd0evHbVdDTr12Zwdml+EVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738315314; c=relaxed/simple;
	bh=twC3YcyOJMBbuTM9ONY4IglfwfU6HbJbELN5+LXfSV0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ja20FAqzhKZ93cVTmml2TKDEVEe2VURMbK1CrpAqUbNRscib/G0eQTxLCsEXXMcq6W16r/HXXq99mggt0TKUREBFFZVSl9yLBsGIXkT8l/2Vx0vfOjRLD/FbkWnBc8++VAr35JHZdvWUapgvQ1kZav5EbNENrC3nC7lXujBh6Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D0jI3E4Q; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ef6c56032eso2315658a91.2;
        Fri, 31 Jan 2025 01:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738315312; x=1738920112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IeN22OSzEjvt98Q9TD9KISzsf453Gty7d8dO0aAuNd8=;
        b=D0jI3E4Qcta5t6yU+6in/SIPiENcsSQb46YOuEQ0bOcrpC0rhL1uugK/4RAjKI+3HQ
         RmbNoQU+V47+bDl65zmto716Tlx7yBOoiAUj2CBdBxFoJqbc/SOFY7OAg2lZR1+mhrDv
         DJGirXKGZI74AD9hvW9Ng2cDZtCNCpPTR2FXbqy7JhbKUIkTqwkiJaIiE46VNvB8DO0P
         03m3x9B5cA70IACADJL+Mflb3V1x44+OUnsxWP4TRKGRRcOxeqO5Dk/tRSfGO1PpBX9K
         43vVBGJYWkCgFfl9AmVKHQf/YGnlV0VRgUSkTUrvNtUk7XruPVAXGk/wRkxvv/eE+Sdq
         qDhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738315312; x=1738920112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IeN22OSzEjvt98Q9TD9KISzsf453Gty7d8dO0aAuNd8=;
        b=fH6PAkW5M3FrJNq59ZV5hQQttBZhSmgp7g4kgFaPF6cbxgcJeOF4ujyxIWj+wDdHZA
         USRQQvlc1CmRMNAw2IIlxVY6rW7xVBlXLTnI1ukZGgXNvqQxoB86cSphoPHYGctoNGA7
         Wq2eBto0ujEcSrR2QHCSlof52tC4wLH1aTVHjHr01FsVcUj8n2uOLaorECaoZrvN25Bw
         1RbK03W9pVfRhiYy03LVxD2aft54w4NbUEBZy7zjx9A4zV7IT3vdck0XVSVdC+naep/L
         jHurg523QYq1TbumTGYEk7kdIEAH7+UG1jAWdxM7WfTsg6fg8D4doq6J91K1K+eYU07s
         DAww==
X-Forwarded-Encrypted: i=1; AJvYcCW7vAp76usIGr3Zs2+Doac1st/Y2Hw/DtTjeC/HLGvMuy9gtPpEST/G2G14LsTSp9UEsyK6G3TDrD1+3Vw=@vger.kernel.org, AJvYcCW9Fxzy5/19Q3d43r6SWNiKrwm7mSIpQ/O/SJ+/ZpjUQHgdd3AtdGKzxJPa6mhUdabvOO5oWoDMJkreGQ6+@vger.kernel.org, AJvYcCWCGsrPlUWWbZoN+2zGTmuHYANLWn0QxV+MvkncTQHSWk5Plg4od3NIeqhuCPUQ7ZvUO8/RMRTCHGNwMvsh@vger.kernel.org, AJvYcCXWgo4u7y9IxCa5cJhA6K/iiocXCpccsjwlRxJRuGOs791XZ17aa0cqc7dId+kThnqE1FvFgDrbbqppxn0IzphNqZRESA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6KnW2wYNRtzfaAnsKEVtv9pKy6xNFn5eegh8/UVxP6sKXemUO
	MFaTgUv9WTKwhcuByKm2wg608VOiW6sDwYKEZ8WYLd/IsYsbDYg0FfevLC4T
X-Gm-Gg: ASbGnct1WXgO4+w0RdrH1J4thsQxo8K64Cvwo4p+1+ojjYiZYGEo+9taVzYzpRHhaE4
	IIygMwPVUHRtfQTEAE1vr/tEQHhaRd8zq/isSiXHZR1j3n2A8IX0RNiD9LNEnAyUdwC07Tdryh1
	k7fuzgWGAau+hoNrRhvD5NbphXkHMK0WFdLMPXWmDJuv6c2GRI9H78Dnzmr3fhnUglLnEyHkFNC
	m6jzCmGrMAOsVtb4uz6KgOpOFV1lZwRsXji+rNAFYM7AloXVyY5OXt0yacJOLeWKDCj2Jf/srg6
	1SyY8H8o//+w2726
X-Google-Smtp-Source: AGHT+IGioM1AR/uwmWOKqUK4+pcO/uZw1qNjjKt/SsLAHjmfzc5juJtHOP5fQMHUCU2+AXs0hRZwMg==
X-Received: by 2002:a17:90b:2d47:b0:2ee:cdea:ad91 with SMTP id 98e67ed59e1d1-2f83abda2f2mr16207596a91.15.1738315312218;
        Fri, 31 Jan 2025 01:21:52 -0800 (PST)
Received: from SC8280XP.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bf93ef3sm5366629a91.30.2025.01.31.01.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 01:21:51 -0800 (PST)
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
Subject: [PATCH RESEND v6 0/3] platform: arm64: Huawei Matebook E Go embedded controller
Date: Fri, 31 Jan 2025 17:21:36 +0800
Message-ID: <20250131092139.6065-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Changes in v6 RESEND:
- add Reviewed-by tag (Ilpo)
- remove extra line
- rebased on tag next-20250131
- Link to v6: https://lore.kernel.org/linux-arm-msm/20250123152559.52449-1-mitltlatltl@gmail.com

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
 drivers/platform/arm64/Kconfig                |  20 +
 drivers/platform/arm64/Makefile               |   1 +
 drivers/platform/arm64/huawei-gaokun-ec.c     | 825 ++++++++++++++++++
 .../linux/platform_data/huawei-gaokun-ec.h    |  79 ++
 7 files changed, 1219 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/platform/huawei,gaokun-ec.yaml
 create mode 100644 drivers/platform/arm64/huawei-gaokun-ec.c
 create mode 100644 include/linux/platform_data/huawei-gaokun-ec.h

-- 
2.47.1


