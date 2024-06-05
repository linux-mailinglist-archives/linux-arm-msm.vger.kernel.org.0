Return-Path: <linux-arm-msm+bounces-21746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF858FCE0D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 14:59:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 579771F27FB6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 12:59:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19601197A7D;
	Wed,  5 Jun 2024 12:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="KPzRi4jV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC30197A7E
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jun 2024 12:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717589703; cv=none; b=hgg18WfehWUAK/kWbAOScpe3igS+gbTxtGAQlCIUr/wGg0ePrY9zsOp4rLf3GNxeOygicUVv0Ldv4OuBPgRso7rcBaihxM/AdZv7kj79g2vrx8heX7Ega+VXie2+FOe+R6mrKod7ZEQwZ5rHmKEgXgme8ivib7ZcG0dOLf0PH2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717589703; c=relaxed/simple;
	bh=Tpy/pmpUq6OhMp4Y6owJRx5Zj15wNHp0tVt/aexDCPY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DrrapoSmToBRIu33e7RSsurebfYoihLRlcQgbh5YTmYT+10nrtT0hpUnzgJoFKitDWNSar+tHQOGc5mY78VH+VRXHgJuC+39hDFHJTT1LvuDs6MJyiOmns4G9gsznxBwQ5hxgRPn63zg0GXYEEorTKIhpwZFSLAchKtLBhqlm+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=KPzRi4jV; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-35e4be5bd7fso4078682f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jun 2024 05:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1717589699; x=1718194499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AbnwG/ezRU+U2MTkhsUZhVDafOrU2ggIoLGjcqVnB9U=;
        b=KPzRi4jVxN5P6DcaDTEk8eqDk++Ox5RW60vNymtJ9CBnu29036MjPhasoHYGEWiV/b
         bPd8PIRqzcKkPNCFRr2KzrNw4nvfrm0sGLRb09r8s8bOfwXSgc6YbWqkqN+CzOBJPDz9
         HNkqhoMtkW4DYCFxR309zJnPHhNCRUbBpPW84Xvk10AlrU9qRBOAp54hrFrDwIo/yjrI
         pUMzaZER4xLJ1HNa34iyqNvxWxdeVs1gh9D7Im70JOKLrs56jz6goaYzRKXgXNhoQWvK
         nMKSD5QoS4zZl7Iu0oEQaQ9zxMC/GQLfuYuoFnqv9LqloV93yJz3VhpxToLEYsHGkikw
         XNzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717589699; x=1718194499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AbnwG/ezRU+U2MTkhsUZhVDafOrU2ggIoLGjcqVnB9U=;
        b=TyyNGMLmPH/bVZMnwWSdemQRcfQ0d+m+NEmtt1fUq+Wb7WtF8/HP/+BQtDgr1tGS3C
         1G8tLWNLOaa6JG6VxV9BVUcmYO9of14jUgesSmNWjc5U5+s4+VvPSNFDiccghxrJ0yur
         2KmIyUSB88kQYNIWZ61uxQZ5beN/SpJYhpXYZGj7zcxr0SU+BhWQOkJjAK7dwibMxK6F
         LCMZ/3r72c17Dt9VWSWW9C1Bz2vCms37u2KZ8z3iMmpD5ukM+UkBJV5SmpU56WGnK68x
         V4m2lO/Ojp8thBl6UCoRaIyii88ArDH013pYITQxYJYMddtDg87T4eZk0BJCHBHHZXpu
         22WQ==
X-Gm-Message-State: AOJu0YwR9v8i3gtPRNpXG6A8ywicvIiWq3GsC3WQ2fZP4GZ9UhCpDlPf
	7qvWXgYDGwVOM6swcv0C6C25UcEZbErg5e3wlCIzbYeDehgxCKF2pQ5rPlpm19s=
X-Google-Smtp-Source: AGHT+IES6qC4a3qioA9JW15P243/0NCYchDf+qjvfvOSPnuKsUEkfe6Zs6THEZStcpMKzzdb62I5vw==
X-Received: by 2002:a5d:4bcb:0:b0:354:faf4:fa87 with SMTP id ffacd0b85a97d-35e84057d18mr1733789f8f.3.1717589698650;
        Wed, 05 Jun 2024 05:14:58 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:d3dd:423:e1eb:d88b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd04d94e6sm14415794f8f.51.2024.06.05.05.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 05:14:58 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v9 0/2] dt-bindings: describe the PMU modules of QCom BT/WLAN packages
Date: Wed,  5 Jun 2024 14:14:47 +0200
Message-ID: <20240605121450.23697-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Hi Mark!

Here are the two dt-binding patches from the power-sequencing series
targeting the regulator subsystem. To keep the cover-letter short, I
won't repeat all the details, they can be found in the cover-letter for
v8. Please consider picking them up into your tree, they were reviewed
by Krzysztof and already acked by you earlier.

Changelog:

Since v8:
- fix typos in bindings
- Link to v8: https://lore.kernel.org/r/20240528-pwrseq-v8-0-d354d52b763c@linaro.org

Since v7:
- added DTS changes for sm8650-hdk
- added circular dependency detection for pwrseq units
- fixed a KASAN reported use-after-free error in remove path
- improve Kconfig descriptions
- fix typos in bindings and Kconfig
- fixed issues reported by smatch
- fix the unbind path in PCI pwrctl
- lots of minor improvements to the pwrseq core

Since v6:
- kernel doc fixes
- drop myself from the DT bindings maintainers list for ath12k
- wait until the PCI bridge device is fully added before creating the
  PCI pwrctl platform devices for its sub-nodes, otherwise we may see
  sysfs and procfs attribute failures (due to duplication, we're
  basically trying to probe the same device twice at the same time)
- I kept the regulators for QCA6390's ath11k as required as they only
  apply to this specific Qualcomm package

Since v5:
- unify the approach to modelling the WCN WLAN/BT chips by always exposing
  the PMU node on the device tree and making the WLAN and BT nodes become
  consumers of its power outputs; this includes a major rework of the DT
  sources, bindings and driver code; there's no more a separate PCI
  pwrctl driver for WCN7850, instead its power-up sequence was moved
  into the pwrseq driver common for all WCN chips
- don't set load_uA from new regulator consumers
- fix reported kerneldoc issues
- drop voltage ranges for PMU outputs from DT
- many minor tweaks and reworks

v1: Original RFC:

https://lore.kernel.org/lkml/20240104130123.37115-1-brgl@bgdev.pl/T/

v2: First real patch series (should have been PATCH v2) adding what I
    referred to back then as PCI power sequencing:

https://lore.kernel.org/linux-arm-kernel/2024021413-grumbling-unlivable-c145@gregkh/T/

v3: RFC for the DT representation of the PMU supplying the WLAN and BT
    modules inside the QCA6391 package (was largely separate from the
    series but probably should have been called PATCH or RFC v3):

https://lore.kernel.org/all/CAMRc=Mc+GNoi57eTQg71DXkQKjdaoAmCpB=h2ndEpGnmdhVV-Q@mail.gmail.com/T/

v4: Second attempt at the full series with changed scope (introduction of
    the pwrseq subsystem, should have been RFC v4)

https://lore.kernel.org/lkml/20240201155532.49707-1-brgl@bgdev.pl/T/

v5: Two different ways of handling QCA6390 and WCN7850:

https://lore.kernel.org/lkml/20240216203215.40870-1-brgl@bgdev.pl/

Bartosz Golaszewski (2):
  regulator: dt-bindings: describe the PMU module of the QCA6390 package
  regulator: dt-bindings: describe the PMU module of the WCN7850 package

 .../bindings/regulator/qcom,qca6390-pmu.yaml  | 185 ++++++++++++++++++
 1 file changed, 185 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml

-- 
2.40.1


