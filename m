Return-Path: <linux-arm-msm+bounces-48065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 121F8A36535
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 19:07:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9838C18948C0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 18:07:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D1DC2686A8;
	Fri, 14 Feb 2025 18:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eiVE32JF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE132641FC;
	Fri, 14 Feb 2025 18:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739556433; cv=none; b=Jz1h2zw4+wB2kORRF7+uXwgTnpdWtL3NWmlE7QCdyGR0iEYCGEmi9aFIZKrX/1WrwSrU1e6CasIoz/lZQMzEX7MxRAUQQc1VACnZtFbZofzM2Qr93+CdBQQgYqd7+eppoUSufEfxzRNnIowv/WCjZfLZjEQJ6cta5QVlMr67ftE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739556433; c=relaxed/simple;
	bh=URbjemwboSMEOUXf1j9jNGkETmv8uXxJZI8xpmIE4yg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NeCLQjLK9mjdV56OWw8JDfp4A4+EnfBVjywuqscKGenjOVa0ERwd/5ZTnKtURFbc1mv/89zXGZYjTD531HTAHh8ovKjzyJxn4EtVDxYdnqOeQdDyJRcRWBS5OuG0qLTRxai/TW1OKyvxMnwIre9qCT5zugyTEBVeqdaG8Mx36N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eiVE32JF; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-220c8f38febso44480555ad.2;
        Fri, 14 Feb 2025 10:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739556431; x=1740161231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8xC+lTwpRgckevjor5+OLJeuzv1ZPmekIjdX8zKKqOY=;
        b=eiVE32JFoKbJcWkHFOc+w4mSzHynrhmKMhjTKS1J7urGh2u5TK+2WIm7QoDCDkErFa
         9uS/5hlsHfBVhlRHD/WaqHlDNRbQOW6+iPwW/VnEx8memKFNL5h4CApn5RVId/8Sq+6Y
         QuuS3+/ZUqoQgLjoLPjnrizCg7hs8l4ZBU+/10l7bkdtdOSGORNcfsjIzqPzP+0mZVcj
         ht7xFQsa1Ao0oEdFJYIJ1eqOWjlYsdupYIbGIb3xjOa4FG/t3yK38qi3BhbGf2H3/ogE
         cIUmpXJHucI+NBJyABwBksfmTTmWk05OSRvg30TpLG/VXNC6X3xr+NWn1MhX4w4YCKA8
         LffA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739556431; x=1740161231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8xC+lTwpRgckevjor5+OLJeuzv1ZPmekIjdX8zKKqOY=;
        b=JzH0w/+5792ml58r41NUglssVb3uyqd+k6j0ox/gsxLmtSpKJHSk+ee6H/MDRnzzzg
         qMIylzd7AaamiTXgxYUFH+xmdDI8inDaXjxfMVnTy+qSKdBz///vg3OAUWb8tlRcHCTk
         BmWktYnGwIuc4cZX1nsv4gg8loK3c96xJlKCOVEa2K+LMYXaARaFZ0lOt1KxO1ltuF0V
         Sh1FmQkuTSkkXuYlj4NqIFiuzloV85kW3vuCjJe07lHzvDpvR69ricxSMaAsYKtGuGi6
         9dTPWn5C9cm8tbvOC1DpL6LtDONi8fTwx0n2X4aykUkCIthV8Th9ONBQn+Gy/uwzjNgL
         9jhA==
X-Forwarded-Encrypted: i=1; AJvYcCUEQjcz5/5L8iQa0FBOwwfs0QRzpkZCllYWJuIT6eWPxBfhWSJPhHVkwbkUp5wVcovh3IhhF0NydenkW2K1@vger.kernel.org, AJvYcCUghcsErP7mYhZ7B2DzDfWVJxNZHoXnNcyLFQUY9R+2TuEPGHsmAazZkAq3+sgNp6a+Li83fJIPSXAk1ULB@vger.kernel.org, AJvYcCWIpCMekko+/O5Vzfxd8wCUvkjIdlekR7YQK7LvSHj/mZByhc21VsST1ZdUmx92jOZs0Q6bmj0+T18STVc=@vger.kernel.org, AJvYcCX2OMZV5NSH3vL7NT8deBJM1P2xqg/sYNgCFqB5Tcjj1v99aSHEQ5B1Xg+mSL+yQop8pYUN7dexcd41PKNihjRwYJUa1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXEB8WpD0RD5cBOCHInFmZcZIdLiOS4G9Ok1X1CL+c8/3IFWnw
	z76Zip0Kalt9cYOA2c7SOGoD3s43TfLP6MwqwzaZUx2pOOHCWkGR
X-Gm-Gg: ASbGnct3DUqdd4xxTzq0WJvbAgNW0kUugkKd7eZTs2NksntOQWyd/3h7OdeHOlr8gmz
	IJCABTnvbsHnSAlquOoOLTLfIeztFSLUhOzvvyohUFEVlslvW5JzFeXtIOLFMpPqaVowUs5Uhy2
	F1Z9Mn0M3wfq3J7zUflSJzIosrgV0vcKSHyQOjv8abo0EtKNLqzPnpnjsdpLhAA0spEcGuvfMqi
	QRO9frhnhW0NkBV4Q4tS6iB8mW37ys2oFE7lc2/JaRTRl3ZHP0NzYz6Q7/2NQf5IRmZPfqUxem4
	B2v6XOAYvlB9t+I0
X-Google-Smtp-Source: AGHT+IFMYs+l12kYZsvpCY3k5e7H959/QGGHvIdUiZGFjoopIGe5S5vKBXDj9pyF+4FIfigKX/0clg==
X-Received: by 2002:a17:902:ce89:b0:21f:71b1:70d8 with SMTP id d9443c01a7336-221040d6f8emr2251505ad.51.1739556430580;
        Fri, 14 Feb 2025 10:07:10 -0800 (PST)
Received: from SC8280XP.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d545d051sm31599105ad.108.2025.02.14.10.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 10:07:10 -0800 (PST)
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
Subject: [PATCH v7 0/3] platform: arm64: Huawei Matebook E Go embedded controller
Date: Sat, 15 Feb 2025 02:06:53 +0800
Message-ID: <20250214180656.28599-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.48.1
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

[1] https://lore.kernel.org/all/20240614-yoga-ec-driver-v7-0-9f0b9b40ae76@linaro.org
[2] https://lore.kernel.org/all/20240315-aspire1-ec-v5-0-f93381deff39@trvn.ru

base-commit: 0ae0fa3bf0b44c8611d114a9f69985bf451010c3

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
Changes in v7:
- rebased on tag next-20250214
- fix Kconfig, this module depends on HWMON (kernel test robot)
- Link to v6: https://lore.kernel.org/linux-arm-msm/20250123152559.52449-1-mitltlatltl@gmail.com

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
 drivers/platform/arm64/Kconfig                |  21 +
 drivers/platform/arm64/Makefile               |   1 +
 drivers/platform/arm64/huawei-gaokun-ec.c     | 825 ++++++++++++++++++
 .../linux/platform_data/huawei-gaokun-ec.h    |  79 ++
 7 files changed, 1220 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/platform/huawei,gaokun-ec.yaml
 create mode 100644 drivers/platform/arm64/huawei-gaokun-ec.c
 create mode 100644 include/linux/platform_data/huawei-gaokun-ec.h

-- 
2.48.1


