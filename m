Return-Path: <linux-arm-msm+bounces-45406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0944A15122
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 15:05:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 886BC7A0362
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 14:05:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2B3486346;
	Fri, 17 Jan 2025 14:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XV5fh2Ri"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EAFAD530;
	Fri, 17 Jan 2025 14:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737122726; cv=none; b=uRxZKVI1ukwYoxkxpLfULmv4RXGMA4yWI2slWstluwDTVC7SH3cWk12wswQzaOZLhxC2iji2NqZJOhndj5Vgp3/vlud9wD5xCe91e6wNotLE9Dj81d8mAyJut+3ytj2Ya0N9ez/ZCVDI7rAG2Vr/iCWssz6mtxBCij3BlTbOriM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737122726; c=relaxed/simple;
	bh=cJ2QQvNapeWnkM3coW0Y91AhBoQfL99ghLCxfrWnxGY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BC0Yr7L1wIVzFNa0Y8yQVr5PIX701tix2q4VLEajfA+Tm+kPzrxxconiswRCLkF+z8vdDDYKJ4xy7CUpG5U0NfB9Ox011Ra5pJqILUOM6Bv0Ck8KVnXhI2aw0s4zk8+n5xFdSxy/Finr1ltD1+gSzPJ4ETduSlKN5dRXwXslRxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XV5fh2Ri; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2156e078563so28806755ad.2;
        Fri, 17 Jan 2025 06:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737122724; x=1737727524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CZm1WWO9tuz3W9ZW4eX9bugKQgGG1JuCOuFT43zWrD8=;
        b=XV5fh2RiGcYCvqVgwgdsnx4yYhKjvZDiuD8z6oKPdr+LifjB0e65DAR07SRHcjJM33
         QXy6AOYgHmyqNcwF0S+CZ3z7r1f04FlDkC/0+rtSNNsEF35n5ITzpFhN82N9HqseIcti
         wpi5/EJjrvqykRLUKp54PSnbPIYteUkZTs4VHHtePMJ4UMzPaCfo5GfPHN5rDjSEZWkY
         ArsFaEgyE5M3keaYE16Pj0C2cAA0YDTupuY+YZknT/R/0AelMP6z32n1By1fpYoxNHqz
         +vcapfTZggH7H8kka7j28YfnWZjfQg4rokqEpI0xoRZfHzn7W4AqjSNHaEG9BqaHW2qt
         Ac0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737122724; x=1737727524;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CZm1WWO9tuz3W9ZW4eX9bugKQgGG1JuCOuFT43zWrD8=;
        b=IDAGBuugES2alzGSjCirHHY+41LQVlISvsrEvtwi3iJ+kZFAetLeQnkAIQD0HgLHIM
         80RKCstyRC2L6v9yOlzrKQ9bg+r4m+j9iBolfhfnxKVwwC0K0nyM50VievW7QQK0hBIb
         4MEmSSS4By6e9I3M2wOZIyEvsMaiDFHaofaUB4Wt3IXuSARkeRvWDT0l1suMse1tArU3
         IT+WKwYhqN6YQ68Cqii4iK9dQcuhXPzHPrJrY8F3BvZnvZeJAOl3qyGQF6V5RCsihTwQ
         ZLvnQXst2sCmoTvpN1dvJuLpdqaWZJpwf08nSntct3EveVRFcELVD5WHvSrB85HxblZF
         G0Mg==
X-Forwarded-Encrypted: i=1; AJvYcCUDHRAE0ZJacLFMmJ7t4I3B0BUrC778d0OEfvMWOfpq0ax22Cw9JWgG3/5VwDJohdXagR2e5R5MJ2bg++4=@vger.kernel.org, AJvYcCUdOrl+UNl5lseELBfpAZht/VpxbBLCMNCKTUPKI1/HpFiwlZIYzkmK5K8PykVET4ekmtBy0VSUHhYX8UKl@vger.kernel.org, AJvYcCWSaRUveVDtKS3bmqnm70MmiyqnUm2OJRZUD1AaAu3Pt2ckqE1zufg518hPHnPe4Ejp1jD+8XXnt0AZV0BS@vger.kernel.org, AJvYcCWzJ1+xzSxdhFxfDDJTA0+OGjEM67K+PM/Ah8oLwHBsp3z+0vmV44PL7ue5rODohEOFSw48cN+02tuZgi4j7jfOJDD3nA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXqqBPBwa/GcMGBarc+/P1IL3mGisRR7cRQO5dk3/RTaOtzJs6
	WCCowv/Slp//DJHQiKQFFiYV8h+1BDDMaZ30me7i+3L+iUtJQcgO
X-Gm-Gg: ASbGncvFoThfeDS6hUYAfF65sOX0cNVXEfmNR6HXi1bklInzjGUDZDbubCC6ifTqaZk
	Ulp6C7GyNvMBrIx3neraAsBvSf1pkMd3bF4nK5/myI/gz1G/ytEvK3xC3s5Cc06AJUWn/K4fYcq
	dSiuLSmpAQ8l28tV1D166Iwo2sK8rNl+AbkqpvcaLPnrXuY5yTrBxxX62bWh6FZLoVDXeF7NVmk
	Vb8t+z7/2YT745mc0SjZKRxIiTErqcboc8o8oof71dV+D/48xIi/+8=
X-Google-Smtp-Source: AGHT+IG1T5zxH5g1w0bxtzv8xuK3Ycf9gnShshDV0CjnMfOIDxYHAh8zC76iUnok2+Q6HyZ33tL2IQ==
X-Received: by 2002:a17:902:c943:b0:215:5bd8:9f92 with SMTP id d9443c01a7336-21c351d328amr51715355ad.5.1737122724390;
        Fri, 17 Jan 2025 06:05:24 -0800 (PST)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3a8822sm16178375ad.140.2025.01.17.06.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 06:05:23 -0800 (PST)
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
Subject: [PATCH v5 0/3] platform: arm64: Huawei Matebook E Go embedded controller
Date: Fri, 17 Jan 2025 22:03:45 +0800
Message-ID: <20250117140348.180681-1-mitltlatltl@gmail.com>
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

base-commit: 0907e7fb35756464aa34c35d6abb02998418164b

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
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


