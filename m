Return-Path: <linux-arm-msm+bounces-55815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B81A9DADC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Apr 2025 15:02:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86E70465476
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Apr 2025 13:02:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2607164A98;
	Sat, 26 Apr 2025 13:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NM6BgfME"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF82A55;
	Sat, 26 Apr 2025 13:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745672531; cv=none; b=gjnF8r/aEN0mZn9+n/55E5sFlDNfPGigceloYpqpGA+DGlrl9O6BZaZYmust1Ha8aa0MEfzdcD+V5mQgrOy++Jg9HleJg7UObGAZIjFW6HdcifyrxCZgqaqcR11Nrta7XUvgYz2JlrxA1yJqwBq00tajuurI/3KlUXXP6IhBozM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745672531; c=relaxed/simple;
	bh=OKE665Bl2Yy8MukRJPxgjLpludfwT5ohBBeio0C4TTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hd4sTuaHB5T7VkScECLMBuOwe4lWOhYFN7eEbPgBXPG6BUX/SxvI9mWKJKVuKSlh3rNAEvqsAt5t/E2YLjaPdjrIOsxXknmEiMUcfnzyY0734s6PgTYSkRuDBSShQf2yjqzbCqBrUKrEl4TkK8cNwy/5gq3/QXrkV7AbJr0nGoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NM6BgfME; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5f4ca707e31so5135435a12.2;
        Sat, 26 Apr 2025 06:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745672527; x=1746277327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9+DYeZqYBcR9JQccEFP/h/dHS2RjGn5FPfmXbvBGKsU=;
        b=NM6BgfME7hhDSve+4s3U8FfjjelTzHcOmkHZWPfXFhFMKBfNv0xRwSMrLCYbkKmL6H
         sYBfVoTsbiEzZQ+6dDCXuFqjfjOOGB0A6gRhc/lXXAm+y9KXN9WVmy4stG13tfO6fV9Y
         1Wh2DA+gkqjM8xAreZfGwGpTQhFDYEolLt0q0HnE+0klyaw9412l9Ur6Yf5fLVrolLww
         Lbi8Iy8XWDlt73uJbhsWV6//LYXDPTX/4v8ZlhL9yq3s2xnmc9W+I5NVMZU1Olo+VDiB
         Ft59HFRuvak3bqEwamR/DH8/FYLcqPaFUgm3TvWp56dbxbd94arwBgZxhcxCdR+9H3gu
         mB3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745672527; x=1746277327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9+DYeZqYBcR9JQccEFP/h/dHS2RjGn5FPfmXbvBGKsU=;
        b=oQe5OlMTeiTXbM67+zE+iiHd5OOjDLZGrLJ9DfBp/NSjfWI8Ma3o1lwh5XiCVvwHz6
         eDMRa1Nal8lXleehwUywXc0G3O1ApyKDFRKPZYs/1v8KLeStfMP97QakxsMLg9A6Tg3O
         8KFh+okjm5phXp5hTY5e4DGc7/tr07bagnhc+wVL8XP+vq6QyngwvhY8YCn/FJ6nvF7R
         phlpMVU7cwYnqMb1ObbjZLXqaqL66FchZXGCbWjVFFjAFZeNnsgH7sot27FD2P2dvAIG
         4VUY/XbqfS+0NwLCAiXqv57aqKZ5mH8BzbGQgsL+t3RfM5a84ABGFZiCmU9L63Cwvbcb
         iitw==
X-Forwarded-Encrypted: i=1; AJvYcCVaXRD+ZxlCLAcoZxmW8dYMadjNfouq/PnupTVd9ru6+GzYzmBbNxX97KEr0yNWDqk/Mp7CW3bGP+TwCyDJ@vger.kernel.org, AJvYcCVp+IKCsZGlclw1K7BEGGJVFpJANyM+O8jKYwsF5WMbHouO8mcx3CJmCXfwusxX1jbxpd1P0R1FoTSezJH+aA==@vger.kernel.org, AJvYcCWlbrkO5eoEcm7A2oBAy3MCB34CFaVg1fTvhwTpQcpt2gt6+qrNjzkHxZR0OyRsOi6+cza/viJHASk4@vger.kernel.org, AJvYcCXBEfC6/s05/9uMMHVW7lOYIYFTxkBS15AGTtvBzvVI2TUCsgj2x/1rv8GBT/CyPECwLki+UDyHFcOc@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3wVq9Ei5gqqm6O2NSNk0ZL9Vctay+um64N9TCatKWxfmR0ctw
	BlXeZuHtAM1AkGAK4SQKCmqF622JPt182O00wgx6MTtPSyzoUvU=
X-Gm-Gg: ASbGncvPMZXN530AkRol1587JAHJO0yvc2bBxO+r/GbkLVrYZ3NJj3HV1SkeDxzN6lo
	L7qbbZYQQG6YhrUhRA9e+ncSN495FnND4FAtLSajRlFzf0i6VXdkjFKppL9foxlGM+z8A6uk0xT
	yiz+YFuWfkgNS9PboeTupBA+hVdMwXTmoFVU0LuVktCIeeAobIGolt4zp28V7ajxozdcNOJBK7C
	4KSTtq8JEmCtbY05BMndtzrIBd1fQ7bzzyj0nx32NL2g8IJAXrBJjKpETAMWLfjq0UBkl6nR9Zb
	a2AQD75TgooPVob2Z62BFfZnEB25IvreQixLJFcmzAGtQQ==
X-Google-Smtp-Source: AGHT+IGqr0lvrcpl6TuiVabgrcL04bTpP2on4P6isYpjsk7p+9fVD7HOSA4ODagyOwexvut7iubt0A==
X-Received: by 2002:a17:907:6ea0:b0:ac1:791c:1532 with SMTP id a640c23a62f3a-ace84af5697mr227475866b.51.1745672526836;
        Sat, 26 Apr 2025 06:02:06 -0700 (PDT)
Received: from alex-x1.lan ([84.226.118.249])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6eda7affsm286452566b.170.2025.04.26.06.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 06:02:06 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	maud_spierings@hotmail.com,
	dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v4 0/4] X1E Asus Zenbook A14 support
Date: Sat, 26 Apr 2025 14:57:56 +0200
Message-ID: <20250426130203.37659-1-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce support for the mentioned laptop.

Particular device exists in two model numbers:
* UX3407QA: X1P-42-100 or X1-26-100 (as tested)
* UX3407RA: X1E-78-100

Mostly similar to other X1-based laptops. Notable differences are:
* Wifi/Bluetooth combo being Qualcomm FastConnect 6900 on UX3407QA
  and Qualcomm FastConnect 7800 on UX3407RA
* USB Type-C retimers are Parade PS8833, appear to behave identical
  to Parade PS8830
* gpio90 is TZ protected

When comparing device firmware between UX3407QA, UX3407RA, it seems
that only ADSP firmware is different, CDSP and GPU firmware appears to
be the same. (At least assuming the GPU firmware name in both cases is
`qcdxkmsuc8380.mbn`). Since at least some blobs are different betweeen
X1E and X1/X1P, define new firmware directory for `qcom/x1p42100`. This
also makes it easier for distros to automatically extract firmware from
Windows and place all blobs for the model under the same path. If/When
firmware blobs make it to linux-firmware, same blobs can be easily
symlinked between `qcom/x1e80100` and `qcom/x1p42100`.

NVMe SSD depends on [1]. USB Type-A over USB MP controller  depends on
[2], or equivalent proposed solution.

Qualcomm FastConnect 6900 on UX3407QA did not work out of the box, and
additionally required both newer firmware and patches to `board-2.bin`.
I added a short how-to [3], as it is not exactly trivial.

ACPI dumps can be found on aarch64-laptops' github [4]. HWids on
dtbloader's github [5].

[1] https://lore.kernel.org/linux-arm-msm/20250319094544.3980357-1-quic_wenbyao@quicinc.com/
[2] https://lore.kernel.org/all/20250318-xps13-fingerprint-v1-1-fbb02d5a34a7@oss.qualcomm.com/
[3] https://github.com/alexVinarskis/linux-x1e80100-zenbook-a14?tab=readme-ov-file#wcn688x-wifi
[4] https://github.com/aarch64-laptops/build/pull/134/files
[5] https://github.com/TravMurav/dtbloader/pull/4/files

Changes to v3:
* Drop redundant comments
* Drop incomplete wcn7850 as it is causing dt errors
* Picked a-by
Link to v3: https://lore.kernel.org/all/20250416232345.5240-1-alex.vinarskis@gmail.com/

Changes to v2:
* Fix/re-add PS8833 as fallback
* Add EC's i2c address
* Add pwrseq for wcn6855, placeholder for wcn7850 until its tested
* Rename x1-zenbook.dtsi to x1-asus-zenbook.dtsi
Link to v2: https://lore.kernel.org/all/20250402084646.10098-1-alex.vinarskis@gmail.com/

Changes to v1:
* Drop PS8833 variant, fallback to PS8830 as they behave the same
* Drop wrong pcie6a_phy compatible revert
* Drop redundant comments, fix order of properties in the device-tree
* Fix device name bindings, express in model names instead of the soc
* Fix GPU firmware name for UX3407QA
* Fix model string, enclose variant in parenthesis
* Added missing new lines before 'status = "okay";'
* Updated cover letter to reflect some of the above changes
* Left SPI10 disabled as it is unknown how/what for to use it as of now
Link to v1: https://lore.kernel.org/all/20250331215720.19692-1-alex.vinarskis@gmail.com/

Aleksandrs Vinarskis (4):
  dt-bindings: usb: Add Parade PS8833 Type-C retimer variant
  dt-bindings: arm: qcom: Add Asus Zenbook A14
  firmware: qcom: scm: Allow QSEECOM on Asus Zenbook A14
  arm64: dts: qcom: Add support for X1-based Asus Zenbook A14

 .../devicetree/bindings/arm/qcom.yaml         |    2 +
 .../bindings/usb/parade,ps8830.yaml           |    7 +-
 arch/arm64/boot/dts/qcom/Makefile             |    2 +
 .../boot/dts/qcom/x1-asus-zenbook-a14.dtsi    | 1307 +++++++++++++++++
 .../dts/qcom/x1e80100-asus-zenbook-a14.dts    |   33 +
 .../dts/qcom/x1p42100-asus-zenbook-a14.dts    |  137 ++
 drivers/firmware/qcom/qcom_scm.c              |    2 +
 7 files changed, 1488 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dts
 create mode 100644 arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dts

-- 
2.45.2


