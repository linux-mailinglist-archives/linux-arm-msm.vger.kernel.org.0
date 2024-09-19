Return-Path: <linux-arm-msm+bounces-32026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1850697CCCB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2024 19:01:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB75D2831DE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2024 17:01:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DF651A01C1;
	Thu, 19 Sep 2024 17:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aur6OaMl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C823D199E81;
	Thu, 19 Sep 2024 17:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726765257; cv=none; b=hPEI84PhvB3Av14508tCt+t9qxKSNmbxiMt8ACxkykt6lVSI/EhCdVe5t5mTLM0A9tlvZAK49Gnrs+Sk9cQshCQUoDnG6YEtdYMUYOuMO3mEJbEtjtoIeH3Ow+p5py+bJVEQD5V6XaKVkMNWMxh6EcfP0QvBbNDKFNpeup+xkF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726765257; c=relaxed/simple;
	bh=U9cl2GNp1eJj9m08wqeznqeBXqnj2IsCqlahwNX19mc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=okukCgg6YNNfv5G0qWTEoY2Bi66WGCjPyx/Ze9WqmL9pXQ0agCx216OuxJ6kWsnYj1k7zPJDcZLDfPye4ZH7i1W+J4ZD+esBT/G1eqRK+B7w62Cbh7pQCBCDNavbcXoAbQ09b4Qd4nF8yEfMJiDmbJ0sL/5Jw/4M3yij/h/9IGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aur6OaMl; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42cb2191107so8839955e9.1;
        Thu, 19 Sep 2024 10:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726765254; x=1727370054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cL7LKzcUwwX8eW07vWj1AErIDhW1T1GovZFQEfH7vVg=;
        b=aur6OaMlEtN+RkbK1JCD2kNTdYYAQSdUzc1VR6DZn9NCU61vtDPiBkGJECkCreve3Q
         lVZK3IxhzNFmXfZtKLDgLvPMCsingz/inzKNOqO5OVVyZz1Q3BLBUg5XQ0LhawWn5+w4
         Y/ZonpbGc0233KoiqR2baKPPb3UvZPpcMOfoAk8gS8llDmLstmp0SgGwjsKs8EUN7o3k
         uMQJuomih3kQYD1a8z1d2EpiOjn0cT2SKVX7LvnnT7OyLx3kQH28/S5lX73NYhpT1Vgg
         KiSF0LZaRy/Mwcbhv3lFpNKeyJe+QRSefRg6wG3lyru16RvsmX1md3Kix0pDEzbLkimk
         SpRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726765254; x=1727370054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cL7LKzcUwwX8eW07vWj1AErIDhW1T1GovZFQEfH7vVg=;
        b=Vsg0vKypNCFq5wfI87dDC6oD9c1cQ6YURQq/D+Uq/0QnbzJ/12vxSYrz6ZMHgPpOcs
         SD90VbBgm6AFiS7Huc20Ov7YGiT84OYpEVh1KI7J00fnraNjTnN4TIYy/bVN4BtUkTXk
         /MTYafgG364/piRjHT3dZW5gGqv2OrokWskNdB17UmCFVHo0gPEOdtKe7vOjrXcgsNsz
         H5tO8UZhHJdCfWn6GByw98/to9k9ThdjMl/Jj2xdY7PuK5UZ0HRFaJ3hkzvX7iDw2YJz
         bPSFGLxUMhWcmXoFIXbesIpxWvKfZgSH0ngHA4hHjXgRnBEJlh0p18OpruwJkB6osCZV
         i01Q==
X-Forwarded-Encrypted: i=1; AJvYcCVVwGdljLC9fO06GKygIdyPC3NNiFYc6UW8DJ1+wN6ryPKc+KOrrU2DYgzpRmeSWmq5HHP7CqAhaUBt@vger.kernel.org, AJvYcCVqBnev67IobaTmrtvXYUo3vSy0/NUB7vcJLdIE942X/HUKstBXX1eMfvEeFGD7xQ3KKZINFHW5nEAjlnLT@vger.kernel.org, AJvYcCW87NFYdTeuIdjl229VdG+aGb08yX0cGIMHDkjLPfgksSobEPFAMIlhmG87K6VnW98F36rUjWUrj3iivVCfGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKjZzY63gx1Y4XKG9s5NG887VY0W7Dwiv6AkErwpkiG1tkiHdB
	Iwv7MOscGzCodgSAHYbXeW0sfAoIYe/24yEgqKasx30Gv1CYLpF0Jl1MWTEX+RkdwO0=
X-Google-Smtp-Source: AGHT+IFd7BnomeLTALMHc8pe7QfxhYLc8KguM6PoewL8eRwtbjTQgw1F3+F3H2KFRjwg0OqNJQD8bA==
X-Received: by 2002:a5d:4f12:0:b0:376:27b7:da81 with SMTP id ffacd0b85a97d-378c2cfbb00mr17008400f8f.22.1726765253668;
        Thu, 19 Sep 2024 10:00:53 -0700 (PDT)
Received: from localhost.localdomain (adsl-178-39-53-103.adslplus.ch. [178.39.53.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e780dcf1sm15469282f8f.114.2024.09.19.10.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 10:00:53 -0700 (PDT)
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
Subject: [PATCH v1 0/3] X1E Dell XPS 9345 support
Date: Thu, 19 Sep 2024 18:59:31 +0200
Message-ID: <20240919170018.13672-1-alex.vinarskis@gmail.com>
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

Aleksandrs Vinarskis (3):
  dt-bindings: arm: qcom: Add Dell XPS 13 9345
  firmware: qcom: scm: Allow QSEECOM on Dell XPS 13 9345
  arm64: dts: qcom: Add support for X1-based Dell XPS 13 9345

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../dts/qcom/x1e80100-dell-tributo-13.dts     | 860 ++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c              |   1 +
 4 files changed, 863 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-dell-tributo-13.dts

-- 
2.43.0


