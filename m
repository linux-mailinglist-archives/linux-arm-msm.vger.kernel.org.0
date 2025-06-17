Return-Path: <linux-arm-msm+bounces-61570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A1AADC681
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 11:32:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4154B18993ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 09:32:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FD392BE7A3;
	Tue, 17 Jun 2025 09:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QJDTttnI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2D52BF016;
	Tue, 17 Jun 2025 09:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750152650; cv=none; b=FQgtOueZ+5Koe6sDruRJj8B+/e6DlpbN7f6OU+RiOC5AKf1gxxHSUqj0F9Bnf2rK6SLfW1mJjK1MxhXgld4laXTsB6+/wWQvGiUKOYPvLVj1s3S626CzoCw0rzEwFVRCtGskRdPECvA+IC3OjtX7U6+X6+o+ExT1jIqsZwgtBJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750152650; c=relaxed/simple;
	bh=/EWcc2kI+dxyruMekg2MP0Db6EAIdBAlf6qd7oNB8v4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dv338SIuraV4exLGsem00ZhDtF0Q8qXZR59iM2y82fvMw8IKO3coFuEed9DEG1FPbA4pmr9D1gCvvVgR9KiDAMQdqTDX95bg45KVL/ggTsK6rbB/Z8qWLMZvrILiN0IAuTNUZ9UU4eIMedUJzeq0fC+DDX47uJf8EWQBjpLNXmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QJDTttnI; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so4157749b3a.0;
        Tue, 17 Jun 2025 02:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750152647; x=1750757447; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FkF5WGvu2NTlsF/qdAxj80+Jsovenn+lrxZ2mb7uLNM=;
        b=QJDTttnIsoXJ9uYdTb0VeNKAz4pnkIXuAGCtsAbUHpk78d5vKZDYCRO++fOcBZ++iN
         zj2fWRANJ6HQMMqgqWSg79Fw80K7rWQQwGB/gJGY8vQWvp/6+WDXuD/Lt/W/BPIWS0ey
         gXFSf+Y1BeOYrdjHfZM8jW+91giV3mBNZl1cOCuW818sJyIEcvnLs/PkVLMiFtHCE5LA
         n62zdB5gwMw+iUE9fPtYn25z3/krYEzZhRqR3hiewCGE3tEv6J5AXQrV+tBPFlPOUuEU
         6oSajTlCiiXqJ17XGzINvcbYSPU43WdHLtiWumVr9DPExZU5l5/aHJigmtMK/8SazNmv
         MSIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750152647; x=1750757447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FkF5WGvu2NTlsF/qdAxj80+Jsovenn+lrxZ2mb7uLNM=;
        b=D3MW/v+rPvZzTJD+w3PnoQlmUHF+JRz5eyLjfLHXs0aNOLc1XdhvOiqkz5lCPnkdU9
         7ZaIhk6Jxwb8yyeq1ZMGsgu3Y3p83zQdzBI8UBckDh9Mp9Qbz5x9UdKkGpCW5oInC/OA
         dmYUPXyR0Aae2KmsyzwknNaUUxJq3eFPFSfIROJ7rkthRcKvyAtPZUG+ZbJ6gZD9eaxJ
         exU8eJSUV0h2ItNy6n8oGZdq/W7l6rIVwtjVmf4RJJ5FvN1EC4FyIBmLnhnT3JWYhAAF
         Vuyg9/mgyAymOrdRh9MlT3DytiH69bqZp/slnpNnFZax392+e+m1WWqJMfXGWAi6C9fv
         AvLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrI2a4wuW1bTCwy3TSbA68JnnjmyKLaB8D/NqPNYCMFtEXpvVnO2SZzFYtNmKV0EjLl7ozXAn2c8ed9h54@vger.kernel.org, AJvYcCXAXj7KvLhhMsevuV+vyxVpmy9PHOBdzb9l1LUoBFi1HW1BD03c0LkrYvlkAUUpnElNM8BoIRqgWicF@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2yBe7/soOhVjf8S9nhJSwFfr3sBbXg/sI1jqeXgXEP8rJGCpd
	+xvpnN/9N+TgXnUZn99JDwW1h3HWcsnnZUqqKhMXHWEL9fWV9Xw2AIsA
X-Gm-Gg: ASbGnculFoGHlE3NnHBG6q8dW5FrPFxL8RoDciBHnLydVYMr+8caHZVKcJ88VrQUfPL
	MwqYH7gSVsCEH2qzcXq2EPpqgz7X17fjzgRM29yptxFYtvMnUKfd/P3OPqhccqAClchOkeF+E8j
	RLgnVyU9mB+DghhmX8+MNDEmmKqF1oq5/5rcZqaHlBDJZ49fhO4e9XuYaPKYrp6Eez33UvYSi4g
	S3jnzDC8IDLluCzUIzgaLuz15AN1xLBRp36lKyMgHEru4s8ps5SBws3Ppms+YYxs+Jndh8G8pdE
	A12yQ59Cm9gvZsbsGwqs02zCKNHadFmipE+nkzo1My06x6wOb6ZIhz/UU407
X-Google-Smtp-Source: AGHT+IHbbh0R62IAzeRFu2jm/KTmNEafYiyaCETrdczdPxbPv41kLmT7Qj4td3h2/AJbDl/tEaF7dw==
X-Received: by 2002:a05:6a00:b8b:b0:747:b043:41e5 with SMTP id d2e1a72fcca58-7489cfc785cmr18771345b3a.16.1750152646422;
        Tue, 17 Jun 2025 02:30:46 -0700 (PDT)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748d8093c63sm714417b3a.57.2025.06.17.02.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 02:30:45 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eric Biggers <ebiggers@google.com>,
	Len Brown <len.brown@intel.com>,
	Benno Lossin <lossin@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Ingo Molnar <mingo@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Joel Granados <joel.granados@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Alice Ryhl <aliceryhl@google.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>,
	Hong Zhu <vanyang@smail.nju.edu.cn>
Subject: [PATCH 3/4] arm64: dts: qcom: sc8280xp: Add initial support for Ntmer TW220
Date: Tue, 17 Jun 2025 17:29:28 +0800
Message-ID: <20250617092929.1492750-4-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617092929.1492750-1-mitltlatltl@gmail.com>
References: <20250617092929.1492750-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Ntmer TW220 is a WOS tablet based on the Qualcomm SC8280XP platform,
also known as the Robo&Kala 2-in-1 Laptop. Thanks to Hong for providing
the unlocked device and early development work. This patch adds an
initial device tree to enable basic functionality.

Currently supported components include:
- Bluetooth & Wi-Fi (board file regeneration required)
- Battery charging (up to 15V/3A fixed PDO) and reporting via pmic-glink
- Flash LEDs (front and rear)
- Hall sensor (lid detection)
- Keyboard (via Bluetooth or USB)
- NVMe SSD
- Power and volume keys
- Simple-framebuffer
- Sound (playback and capture; top-left DMIC only, top-right works only
  on Windows)
- Touchscreen and stylus (requires GPI DMA support [1] and stylus support [2])
- USB Type-C ports

The following components are currently non-functional:
- Cameras (GalaxyCore GC5035; only sensor ID is detectable, no frames in libcamera;
  partial driver can be found on LKML archives)
- DSI display (blank screen with `dsi_err_worker: status=4`; primary DSI register
  dump included below)
- Stylus wireless charger (CPS4035)
- UCSI over GLINK

[1]: https://lore.kernel.org/linux-arm-msm/20250617090032.1487382-3-mitltlatltl@gmail.com
[2]: https://lore.kernel.org/linux-input/20250605054855.403487-2-mitltlatltl@gmail.com

Note: This series does **not** include any confidential material. Those
who wish to run Linux on this device should contact Ntmer, as the
bootloader is locked via secure boot.

Co-developed-by: Hong Zhu <vanyang@smail.nju.edu.cn>
Signed-off-by: Hong Zhu <vanyang@smail.nju.edu.cn>
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>

dsi_ctrl, reg = <0 0x0ae94000 0 0x400>;
0xae94000 20050001 000001f3 0000000b dddd1011
0xae94010 00009130 31211101 3e2e1e0e 00001900
0xae94020 00000000 05190019 064c000c 065f0528
0xae94030 00060000 00000000 00040000 14000000
0xae94040 06100006 00003c2c 00001000 00000008
0xae94050 00000000 00000900 00000000 00000000
0xae94060 00000000 00000000 00000000 00000000
0xae94070 00000000 00000000 00000000 22211211
0xae94080 001c1a02 80001004 00000000 00000000
0xae94090 00000001 00000000 00000000 00000000
0xae940a0 00000000 00000000 00001f1f 01000000
0xae940b0 00000000 00088888 ffffffff 0000ffff
0xae940c0 00000000 00001719 010f0f08 00000001
0xae940d0 00000000 00000000 00000000 00000000
0xae940e0 00000000 00000000 00000000 00000000
0xae940f0 00000000 00000000 00000000 00000000
0xae94100 00000000 00000000 00000000 13ff3be0
0xae94110 a920aa00 00000000 00000000 0000023f
0xae94120 008057c3 00000000 00000000 00000000
0xae94130 00000000 ffffffff ffffffff ffffffff
0xae94140 ffffffff 00000000 0000ffff 0000ffff
0xae94150 0000ffff 0000ffff 00000000 00000004
0xae94160 00000000 00000000 00000000 00000000
0xae94170 00000000 00000000 00000000 00000000
0xae94180 00000000 00000000 00000000 00000000
0xae94190 00000000 00000000 00000000 00000000
0xae941a0 00000000 00000001 00ff0000 00400040
0xae941b0 000000ff 00000024 00000006 00000000
0xae941c0 00000000 00000000 ffffffff 00000000
0xae941d0 00290000 00000000 00000000 00000000
0xae941e0 00000000 00000000 00000000 00000000
0xae941f0 00000000 03000104 00000000 00000000
0xae94200 80000000 00000000 00000000 00000000
0xae94210 00000000 00000000 00000000 00000000
0xae94220 00000000 00000000 00000000 00000000
0xae94230 00000000 00000000 00000000 00000000
0xae94240 00000000 00000000 00000000 00000000
0xae94250 00000000 00000000 00000000 00000000
0xae94260 00000000 00000000 00000000 00000000
0xae94270 00000000 00000000 00000000 00000000
0xae94280 00000000 00000000 00000000 00000000
0xae94290 00000000 00000000 00000000 00000000
0xae942a0 00000b00 00000000 39003900 00000000
0xae942b0 00000000 00000000 3e2e0600 0000f000
0xae942c0 00000000 00000000 00000004 00000000
0xae942d0 00000000 00000000 00000000 00000000
0xae942e0 00000000 00000000 00000000 00000000
0xae942f0 00000000 00000000 00000000 00000000
0xae94300 0000ffff 00000000 00000000 00000000
0xae94310 00008421 0033ffff 0002a300 00000043
0xae94320 10ffffff 0000b81f 00000000 000c2c0d
0xae94330 33533000 ffffffff ffffffff ffffffff
0xae94340 00000000 00000000 00000000 00000000
0xae94350 00000000 00000000 00000000 00000000
0xae94360 00000000 01000000 00000000 00000000
0xae94370 00000000 00000000 00000000 00000000
0xae94380 00000000 00000000 00000000 00000000
0xae94390 00000000 00000000 00000000 00000000
0xae943a0 00000000 00000000 00000000 00000000
0xae943b0 00000000 00000000 00000000 00000000
0xae943c0 00000000 00000000 00000000 00000000
0xae943d0 00000000 00000000 00000000 00000000
0xae943e0 00000000 00000000 00000000 00000000
0xae943f0 00000000 00000000 00000000 00000000

dsi_phy, reg = <0 0x0ae94400 0 0x200>;
0xae94400 00000024 00000000 00000000 00000000
0xae94410 00000061 00000030 00000000 00000000
0xae94420 00000053 0000007f 00000000 00000040
0xae94430 00000004 00000021 00000084 00000001
0xae94440 000000b8 00000000 0000007f 0000007f
0xae94450 00000000 000000ff 000000ff 00000000
0xae94460 0000003f 0000003f 0000003e 00000041
0xae94470 00000041 0000007f 00000000 00000000
0xae94480 00000000 00000000 000000ff 000000ff
0xae94490 000000ff 00000010 00000000 00000000
0xae944a0 0000001f 00000000 00000000 00000000
0xae944b0 00000000 00000000 0000001b 00000007
0xae944c0 00000008 00000022 00000021 00000007
0xae944d0 00000007 00000004 00000002 00000004
0xae944e0 00000000 00000019 00000017 00000088
0xae944f0 00000000 0000003c 00000038 00000000
0xae94500 00000055 00000000 00000000 00000000
0xae94510 0000005c 00000004 00000000 00000000
0xae94520 00000000 000000ff 00000000 00000000
0xae94530 00000000 00000000 00000086 0000000a
0xae94540 00000007 00000057 0000001f 0000001f
0xae94550 000000ff 000000ff 000000ff 000000ff
0xae94560 000000ff 000000ff 000000ff 000000ff
0xae94570 00000000 00000000 00000000 00000000
0xae94580 00000000 00000001 000000ff 0000000f
0xae94590 000000f0 00000000 00000000 00000005
0xae945a0 000000ff 00000000 00000000 00000000
0xae945b0 00000001 00000000 00000000 00000000
0xae945c0 00000000 00000000 00000000 00000000
0xae945d0 00000000 00000000 00000000 00000000
0xae945e0 00000000 00000000 00000000 00000000
0xae945f0 00000000 00000000 00000000 00000000

dsi_phy_lane, reg = <0 0x0ae94600 0 0x280>;
0xae94600 00000000 00000000 0000000a 00000000
0xae94610 00000000 00000003 00000040 00000000
0xae94620 000000ff 00000000 00000000 00000000
0xae94630 00000000 00000000 00000055 000000ff
0xae94640 00000000 00000000 00000000 00000000
0xae94650 00000000 00000000 00000000 00000000
0xae94660 000000ff 000000ff 000000ff 00000000
0xae94670 00000000 00000000 00000000 0000002a
0xae94680 00000000 00000000 0000000a 00000000
0xae94690 00000000 00000000 00000040 00000000
0xae946a0 000000ff 00000000 00000000 00000000
0xae946b0 00000000 00000000 00000055 000000ff
0xae946c0 00000000 00000000 00000000 00000000
0xae946d0 00000000 00000000 00000000 00000000
0xae946e0 000000ff 000000ff 000000ff 00000000
0xae946f0 00000000 00000000 00000000 0000002a
0xae94700 00000000 00000000 0000000a 00000000
0xae94710 00000000 00000000 00000040 00000000
0xae94720 000000ff 00000000 00000000 00000000
0xae94730 00000000 00000000 00000055 000000ff
0xae94740 00000000 00000000 00000000 00000000
0xae94750 00000000 00000000 00000000 00000000
0xae94760 000000ff 000000ff 000000ff 00000000
0xae94770 00000000 00000000 00000000 0000002a
0xae94780 00000000 00000000 0000000a 00000000
0xae94790 00000000 00000000 00000046 00000000
0xae947a0 000000ff 00000000 00000000 00000000
0xae947b0 00000000 00000000 00000055 000000ff
0xae947c0 00000000 00000000 00000000 00000000
0xae947d0 00000000 00000000 00000000 00000000
0xae947e0 000000ff 000000ff 000000ff 00000000
0xae947f0 00000000 00000000 00000000 0000002a
0xae94800 00000000 00000000 0000008a 00000000
0xae94810 00000000 00000000 00000041 00000000
0xae94820 000000ff 00000000 00000000 00000000
0xae94830 00000000 00000000 00000055 000000ff
0xae94840 00000000 00000000 00000000 00000000
0xae94850 00000000 00000000 00000000 00000000
0xae94860 000000ff 000000ff 000000ff 00000000
0xae94870 00000000 00000000 00000000 0000002a

dsi_pll, reg = <0 0x0ae94900 0 0x27c>;
0xae94900 00000000 00000003 0000003f 00000000
0xae94910 00000000 00000000 00000001 00000080
0xae94920 00000000 0000004e 000000c0 00000000
0xae94930 00000010 00000020 00000010 00000002
0xae94940 0000001c 00000040 00000000 00000002
0xae94950 00000020 00000000 000000ff 00000000
0xae94960 0000000a 00000025 000000ba 0000004f
0xae94970 0000000a 00000000 0000000c 00000020
0xae94980 00000000 000000ff 00000010 00000046
0xae94990 0000002f 0000003f 00000054 00000000
0xae949a0 00000000 00000040 00000000 00000004
0xae949b0 00000000 00000000 00000000 00000012
0xae949c0 00000000 00000008 00000008 00000041
0xae949d0 000000ab 0000006a 00000000 00000000
0xae949e0 00000014 00000051 000000d8 00000000
0xae949f0 00000027 00000000 00000040 00000000
0xae94a00 00000003 00000000 00000000 00000000
0xae94a10 00000000 00000000 00000000 00000000
0xae94a20 00000000 00000000 00000000 00000000
0xae94a30 00000000 00000000 00000000 00000000
0xae94a40 00000000 00000000 00000000 00000000
0xae94a50 00000000 00000001 00000040 00000040
0xae94a60 0000000a 0000000a 000000c0 00000000
0xae94a70 00000082 00000054 0000004c 0000004c
0xae94a80 00000003 00000000 00000000 00000000
0xae94a90 00000080 00000006 00000019 00000000
0xae94aa0 00000000 00000040 00000020 00000000
0xae94ab0 00000051 00000008 00000055 00000047
0xae94ac0 000000a1 0000001d 00000004 00000000
0xae94ad0 00000000 00000002 00000011 00000000
0xae94ae0 00000000 00000080 00000000 00000000
0xae94af0 00000000 0000005d 00000003 00000000
0xae94b00 00000000 00000000 00000000 00000000
0xae94b10 00000000 00000000 00000055 00000082
0xae94b20 00000000 00000000 0000001d 0000001c
0xae94b30 000000ff 00000022 00000009 00000000
0xae94b40 00000008 00000000 000000a0 00000000
0xae94b50 00000010 00000010 00000001 00000003
0xae94b60 00000022 00000000 00000000 00000000
0xae94b70 00000000 00000019 00000000 00000022
0xae94b80 00000000 00000000 00000000 00000000
0xae94b90 00000000 00000000 00000000 00000000
0xae94ba0 00000000 00000000 00000000 00000000
0xae94bb0 00000000 00000000 00000000 00000000
0xae94bc0 00000000 00000000 00000000 00000000
0xae94bd0 00000000 00000000 00000000 00000000
0xae94be0 00000000 00000000 00000000 00000000
0xae94bf0 00000000 00000000 00000000 00000000
---
 arch/arm64/boot/dts/qcom/Makefile             |    2 +
 .../boot/dts/qcom/sc8280xp-ntmer-tw220.dts    | 1622 +++++++++++++++++
 2 files changed, 1624 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sc8280xp-ntmer-tw220.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 669b888b2..8fdb16971 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -217,6 +217,8 @@ sc8280xp-microsoft-arcata-el2-dtbs	:= sc8280xp-microsoft-arcata.dtb sc8280xp-el2
 dtb-$(CONFIG_ARCH_QCOM)	+= sc8280xp-microsoft-arcata.dtb sc8280xp-microsoft-arcata-el2.dtb
 sc8280xp-microsoft-blackrock-el2-dtbs	:= sc8280xp-microsoft-blackrock.dtb sc8280xp-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= sc8280xp-microsoft-blackrock.dtb sc8280xp-microsoft-blackrock-el2.dtb
+sc8280xp-ntmer-tw220-el2-dtbs	:= sc8280xp-ntmer-tw220.dtb sc8280xp-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= sc8280xp-ntmer-tw220.dtb sc8280xp-ntmer-tw220-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sda660-inforce-ifc6560.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm450-lenovo-tbx605f.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm450-motorola-ali.dtb
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-ntmer-tw220.dts b/arch/arm64/boot/dts/qcom/sc8280xp-ntmer-tw220.dts
new file mode 100644
index 000000000..61ac51da9
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-ntmer-tw220.dts
@@ -0,0 +1,1622 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2021, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2022, Linaro Limited
+ *
+ * Copyright (c) 2025, Hong Zhu <vanyang.smail.nju.edu.cn>
+ * Copyright (c) 2025, Pengyu Luo <mitltlatltl@gmail.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/iio/qcom,spmi-adc7-pm8350.h>
+#include <dt-bindings/input/gpio-keys.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/phy/phy.h>
+
+#include "sc8280xp.dtsi"
+#include "sc8280xp-pmics.dtsi"
+
+/ {
+	model = "Robo & Kala TW220";
+	compatible = "ntmer,tw220", "qcom,sc8280xp";
+	chassis-type = "tablet";
+
+	aliases {
+		serial0 = &uart2;
+		i2c1 = &i2c1;
+	};
+
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		framebuffer0: framebuffer@c6200000 {
+			compatible = "simple-framebuffer";
+			reg = <0x0 0xc6200000 0x0 (2560*1600*4)>;
+			width = <2560>;
+			height = <1600>;
+			stride = <(2560 * 4)>;
+			format = "a8r8g8b8";
+			clocks = <&dispcc0 DISP_CC_MDSS_MDP_CLK>;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&vol_down_n>, <&hall_int_n_default>;
+		pinctrl-names = "default";
+
+		key-vol-down {
+			label = "Volume Down";
+			gpios = <&pmc8280_1_gpios 6 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEDOWN>;
+			debounce-interval = <15>;
+			linux,can-disable;
+			wakeup-source;
+		};
+
+		switch-lid {
+			label = "Lid Switch";
+			gpios = <&tlmm 107 GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_LID>;
+			wakeup-source;
+			wakeup-event-action = <EV_ACT_DEASSERTED>;
+		};
+	};
+
+	gpio-leds {
+		compatible = "gpio-leds";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&camf_indicator_en>, <&camr_indicator_en>;
+
+		flash_camf: led-front-camera-indicator {
+			label = "white:front-camera-indicator";
+			function = LED_FUNCTION_INDICATOR;
+			color = <LED_COLOR_ID_WHITE>;
+			gpios = <&tlmm 44 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "none";
+			default-state = "off";
+			/* Reuse as a panic indicator until we get a "camera on" trigger */
+			panic-indicator;
+		};
+
+		flash_camr: led-rear-camera-indicator {
+			label = "white:rear-camera-indicator";
+			function = LED_FUNCTION_INDICATOR;
+			color = <LED_COLOR_ID_WHITE>;
+			gpios = <&tlmm 43 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "none";
+			default-state = "off";
+			/* Reuse as a panic indicator until we get a "camera on" trigger */
+			panic-indicator;
+		};
+	};
+
+	pmic-glink {
+		compatible = "qcom,sc8280xp-pmic-glink", "qcom,pmic-glink";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+		orientation-gpios = <&tlmm 166 GPIO_ACTIVE_HIGH>,
+				    <&tlmm 49 GPIO_ACTIVE_HIGH>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_con0_hs: endpoint {
+						remote-endpoint = <&usb_0_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_con0_ss: endpoint {
+						remote-endpoint = <&usb_0_qmpphy_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					pmic_glink_con0_sbu: endpoint {
+					};
+				};
+			};
+		};
+
+		connector@1 {
+			compatible = "usb-c-connector";
+			reg = <1>;
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_con1_hs: endpoint {
+						remote-endpoint = <&usb_1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_con1_ss: endpoint {
+						remote-endpoint = <&usb_1_qmpphy_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					pmic_glink_con1_sbu: endpoint {
+					};
+				};
+			};
+		};
+	};
+
+	vreg_wsa: regulator-wsa {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vreg_wsa";
+		gpio = <&tlmm 28 GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <3600000>;
+		regulator-max-microvolt = <3600000>;
+		enable-active-high;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vreg_ts_vddio: regulator-ts-vddio {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vreg_ts_vddio";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		gpio = <&tlmm 90 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&ts_vddio_en>;
+		pinctrl-names = "default";
+	};
+
+	vreg_ts_avdd: regulator-ts-avdd {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vreg_ts_avdd";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 56 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&ts_avdd_en>;
+		pinctrl-names = "default";
+	};
+
+	vreg_misc_3p3: regulator-misc-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VCC3B";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&pmc8280_1_gpios 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&misc_3p3_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vreg_nvme: regulator-nvme {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VCC3_SSD";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 135 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&nvme_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	vreg_vph_pwr: regulator-vph-pwr {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VPH_VCC3R9";
+		regulator-min-microvolt = <3900000>;
+		regulator-max-microvolt = <3900000>;
+
+		regulator-always-on;
+	};
+
+	vreg_wlan: regulator-wlan {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VCC_WLAN_3R9";
+		regulator-min-microvolt = <3900000>;
+		regulator-max-microvolt = <3900000>;
+
+		gpio = <&pmr735a_gpios 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&hastings_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	reserved-memory {
+		gpu_mem: gpu-mem@8bf00000 {
+			reg = <0 0x8bf00000 0 0x2000>;
+			no-map;
+		};
+
+		linux,cma {
+			compatible = "shared-dma-pool";
+			size = <0x0 0x8000000>;
+			reusable;
+			linux,cma-default;
+		};
+	};
+
+	sound {
+		compatible = "qcom,sc8280xp-sndcard";
+		model = "SC8280XP-NTMER-TW220";
+		audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
+				"SpkrRight IN", "WSA_SPK2 OUT";
+
+		wsa-dai-link {
+			link-name = "WSA Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
+			};
+
+			codec {
+				sound-dai = <&left_spkr>, <&right_spkr>, <&swr0 0>, <&wsamacro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		va-dai-link {
+			link-name = "VA Capture";
+			cpu {
+				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
+			};
+
+			codec {
+				sound-dai = <&vamacro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
+
+	thermal-zones {
+		pm8008-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <0>;
+
+			thermal-sensors = <&pm8008>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		skin-temp-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&pmk8280_adc_tm 5>;
+
+			trips {
+				skin_temp_alert0: trip-point0 {
+					temperature = <55000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				skin_temp_alert1: trip-point1 {
+					temperature = <58000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				skin-temp-crit {
+					temperature = <73000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&skin_temp_alert0>;
+					cooling-device = <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+
+				map1 {
+					trip = <&skin_temp_alert1>;
+					cooling-device = <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+	};
+
+	wcn6855-pmu {
+		compatible = "qcom,wcn6855-pmu";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&bt_default>, <&wlan_en>;
+
+		wlan-enable-gpios = <&tlmm 134 GPIO_ACTIVE_HIGH>;
+		bt-enable-gpios = <&tlmm 133 GPIO_ACTIVE_HIGH>;
+		swctrl-gpios = <&tlmm 132 GPIO_ACTIVE_HIGH>;
+
+		vddio-supply = <&vreg_s10b>;
+		vddaon-supply = <&vreg_s12b>;
+		vddpmu-supply = <&vreg_s12b>;
+		vddpmumx-supply = <&vreg_s12b>;
+		vddpmucx-supply = <&vreg_s12b>;
+		vddrfa0p95-supply = <&vreg_s12b>;
+		vddrfa1p3-supply = <&vreg_s11b>;
+		vddrfa1p9-supply = <&vreg_s1c>;
+		vddpcie1p3-supply = <&vreg_s11b>;
+		vddpcie1p9-supply = <&vreg_s1c>;
+
+		regulators {
+			vreg_pmu_rfa_cmn_0p8: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn_0p8";
+			};
+
+			vreg_pmu_aon_0p8: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p8";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p8: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p8";
+			};
+
+			vreg_pmu_btcmx_0p8: ldo4 {
+				regulator-name = "vreg_pmu_btcmx_0p8";
+			};
+
+			vreg_pmu_pcie_1p8: ldo5 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+
+			vreg_pmu_pcie_0p9: ldo6 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_rfa_0p8: ldo7 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo8 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p7: ldo9 {
+				regulator-name = "vreg_pmu_rfa_1p7";
+			};
+		};
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pm8350-rpmh-regulators";
+		qcom,pmic-id = "b";
+
+		vdd-l1-l4-supply = <&vreg_s12b>;
+		vdd-l2-l7-supply = <&vreg_bob>;
+		vdd-l3-l5-supply = <&vreg_s11b>;
+		vdd-l6-l9-l10-supply = <&vreg_s12b>;
+		vdd-l8-supply = <&vreg_s12b>;
+
+		vreg_s10b: smps10 {
+			regulator-name = "vreg_s10b";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+		};
+
+		vreg_s11b: smps11 {
+			regulator-name = "vreg_s11b";
+			regulator-min-microvolt = <1272000>;
+			regulator-max-microvolt = <1272000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s12b: smps12 {
+			regulator-name = "vreg_s12b";
+			regulator-min-microvolt = <984000>;
+			regulator-max-microvolt = <984000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1b: ldo1 {
+			regulator-name = "vreg_l1b";
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+			RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3b: ldo3 {
+			regulator-name = "vreg_l3b";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-boot-on;
+		};
+
+		vreg_l4b: ldo4 {
+			regulator-name = "vreg_l4b";
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+			RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6b: ldo6 {
+			regulator-name = "vreg_l6b";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-boot-on;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pm8350c-rpmh-regulators";
+		qcom,pmic-id = "c";
+
+		vdd-bob-supply = <&vreg_vph_pwr>;
+		vdd-l1-l12-supply = <&vreg_s1c>;
+		vdd-l2-l8-supply = <&vreg_s1c>;
+		vdd-l3-l4-l5-l7-l13-supply = <&vreg_bob>;
+		vdd-l6-l9-l11-supply = <&vreg_bob>;
+		vdd-l10-supply = <&vreg_s11b>;
+
+		vreg_s1c: smps1 {
+			regulator-name = "vreg_s1c";
+			regulator-min-microvolt = <1880000>;
+			regulator-max-microvolt = <1900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+		};
+
+		vreg_l1c: ldo1 {
+			regulator-name = "vreg_l1c";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2c: ldo2 {
+			regulator-name = "vreg_l2c";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+
+		vreg_l8c: ldo8 {
+			regulator-name = "vreg_l8c";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l12c: ldo12 {
+			regulator-name = "vreg_l12c";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l13c: ldo13 {
+			regulator-name = "vreg_l13c";
+			regulator-min-microvolt = <3072000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_bob: bob {
+			regulator-name = "vreg_bob";
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <3960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-always-on;
+		};
+	};
+
+	regulators-2 {
+		compatible = "qcom,pm8350-rpmh-regulators";
+		qcom,pmic-id = "d";
+
+		vdd-l1-l4-supply = <&vreg_s11b>;
+		vdd-l2-l7-supply = <&vreg_bob>;
+		vdd-l3-l5-supply = <&vreg_s11b>;
+		vdd-l6-l9-l10-supply = <&vreg_s12b>;
+		vdd-l8-supply = <&vreg_s12b>;
+
+		vreg_l2d: ldo2 {
+			regulator-name = "vreg_l2d";
+			regulator-min-microvolt = <3072000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4d: ldo4 {
+			regulator-name = "vreg_l4d";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6d: ldo6 {
+			regulator-name = "vreg_l6d";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7d: ldo7 {
+			regulator-name = "vreg_l7d";
+			regulator-min-microvolt = <3072000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8d: ldo8 {
+			regulator-name = "vreg_l8d";
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9d: ldo9 {
+			regulator-name = "vreg_l9d";
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l10d: ldo10 {
+			regulator-name = "vreg_l10d";
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-boot-on;
+			regulator-always-on;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+/*
+ * cci0_i2c1
+ * sda: gpio115, scl: gpio116
+ *
+ * CAMI ov9234 @36 @48
+ *
+ * power on sequence
+ * gpio7 out low
+ * l3q 1p8
+ * l6q 2p8
+ * l2q 1p2
+ * gpio7 out high
+ * msleep 5
+ * cam_cc_mclk4_clk 2.4MHz (gpio6)
+ */
+
+/*
+ * cci2_i2c1
+ * sda: gpio12, scl: gpio13
+ *
+ * CAMF gc5035 @37
+ *
+ * power on sequence
+ * gpio15 out low
+ * l3q 1p8
+ * msleep 1
+ * l2q 1p2
+ * msleep 1
+ * l5q 2p8
+ * gpio15 out high
+ * gpio67 out high
+ * msleep 10
+ * cam_cc_mclk3_clk 2.4MHz (gpio17)
+ */
+
+/*
+ * cci1_i2c0
+ * sda: gpio10, scl: gpio11
+ *
+ * CAMR ov13b10 @0c
+ *
+ * power on sequence
+ * gpio66 out low
+ * l1q 1p2
+ * l7q 2p8
+ * l3q 1p8
+ * gpio59 out high
+ * gpio66 out high
+ * msleep 5
+ * cam_cc_mclk2_clk 2.4MHz (gpio16/gpio119/gpio120?)
+ */
+
+&dispcc0 {
+	status = "okay";
+};
+
+&gpi_dma0 {
+	status = "okay";
+};
+
+&gpi_dma1 {
+	status = "okay";
+};
+
+&gpi_dma2 {
+	status = "okay";
+};
+
+&gpu {
+	status = "okay";
+
+	zap-shader {
+		memory-region = <&gpu_mem>;
+		firmware-name = "qcom/sc8280xp/Ntmer/tw220/qcdxkmsuc8280.mbn";
+	};
+};
+
+&i2c1 {
+	clock-frequency = <400000>;
+
+	pinctrl-0 = <&i2c1_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	/*
+	 * cps4035 @30 @31
+	 * gpio73, 87, 154
+	 */
+};
+
+&i2c11 {
+	clock-frequency = <400000>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c11_default>;
+
+	status = "okay";
+
+	pm8008: pmic@c {
+		compatible = "qcom,pm8008";
+		reg = <0xc>;
+
+		interrupts-extended = <&tlmm 41 IRQ_TYPE_EDGE_RISING>;
+		reset-gpios = <&tlmm 42 GPIO_ACTIVE_LOW>;
+
+		vdd-l1-l2-supply = <&vreg_s11b>;
+		vdd-l3-l4-supply = <&vreg_bob>;
+		vdd-l5-supply = <&vreg_bob>;
+		vdd-l6-supply = <&vreg_bob>;
+		vdd-l7-supply = <&vreg_bob>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&pm8008_default>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-ranges = <&pm8008 0 0 2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		#thermal-sensor-cells = <0>;
+
+		regulators {
+			vreg_l1q: ldo1 {
+				regulator-name = "vreg_l1q";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+			};
+
+			vreg_l2q: ldo2 {
+				regulator-name = "vreg_l2q";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+			};
+
+			vreg_l3q: ldo3 {
+				regulator-name = "vreg_l3q";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			vreg_l4q: ldo4 {
+				regulator-name = "vreg_l4q";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			vreg_l5q: ldo5 {
+				regulator-name = "vreg_l5q";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+			};
+
+			vreg_l6q: ldo6 {
+				regulator-name = "vreg_l6q";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+			};
+
+			vreg_l7q: ldo7 {
+				regulator-name = "vreg_l7q";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+			};
+		};
+	};
+};
+
+&spi22 {
+	status = "okay";
+	pinctrl-0 = <&spi22_default>;
+	pinctrl-names = "default";
+
+	touchscreen@0 {
+		/*
+		 * The ACPI device ID is GXTS7986, its exact suffix is unknown.
+		 * The Windows driver suggests it is a GTBerlinB variant and
+		 * communicates via HID over SPI, which aligns with the Linux
+		 * driver `drivers/hid/hid-goodix-spi.c`.
+		 *
+		 * However, the HID descriptor read from the device appears
+		 * garbled, preventing proper probe with the HID driver. In
+		 * contrast, the driver at
+		 * `drivers/input/touchscreen/goodix_berlin_spi.c` shares many
+		 * similarities and functions correctly with this hardware.
+		 *
+		 * Therefore, we choose to use the goodix_berlin_spi driver
+		 * instead.
+		 */
+		compatible = "goodix,gt9916";
+		reg = <0>;
+
+		interrupts-extended = <&tlmm 175 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
+		vddio-supply = <&vreg_ts_vddio>;
+		avdd-supply = <&vreg_ts_avdd>;
+
+		spi-max-frequency = <3000000>;
+
+		touchscreen-size-x = <2560>;
+		touchscreen-size-y = <1600>;
+
+		pinctrl-0 = <&ts0_default>;
+		pinctrl-names = "default";
+	};
+};
+
+/*
+ * mdss0_dsi display:
+ *
+ * reset gpio109
+ *
+ * power on seq:
+ * ldo 3b: 1.2v dsi
+ * ldo 6b: 0.88v dsi_phy
+ *
+ * panel:
+ * ldo 2b: 1.8v vddio
+ * gpio55 out high
+ * msleep 15
+ * gpio25 out high
+ * msleep 5
+ *
+ * backlight:
+ * dsi_bl_reg_en: gpio9
+ * msleep 5
+ * dsi_bl_en: gpio8
+ *
+ * power off sequence
+ * dis_off:
+ * ldo 3b
+ * ldo 6b
+ * ldo 2b
+ *
+ * bl_off:
+ * dsi_bl_en: gpio8
+ * msleep 5
+ * dsi_bl_reg_en: gpio9
+ * msleep 5
+ *
+ * panel_off:
+ * gpio25: out low
+ * msleep 5
+ * gpio55: out low
+ * msleep 5
+ */
+
+&pcie2a {
+	perst-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
+
+	vddpe-3v3-supply = <&vreg_nvme>;
+
+	pinctrl-0 = <&pcie2a_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie2a_phy {
+	vdda-phy-supply = <&vreg_l6d>;
+	vdda-pll-supply = <&vreg_l4d>;
+
+	status = "okay";
+};
+
+&pcie4 {
+	max-link-speed = <2>;
+
+	perst-gpios = <&tlmm 141 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 139 GPIO_ACTIVE_LOW>;
+
+	vddpe-3v3-supply = <&vreg_wlan>;
+
+	pinctrl-0 = <&pcie4_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie4_port0 {
+	wifi@0 {
+		compatible = "pci17cb,1103";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn_0p8>;
+		vddaon-supply = <&vreg_pmu_aon_0p8>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p8>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
+
+		/*
+		 * bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,
+		 * subsystem-device=0108,qmi-chip-id=18,qmi-board-id=255
+		 *
+		 * Regenerate board file, x13s one works well
+		 */
+	};
+};
+
+&pcie4_phy {
+	vdda-phy-supply = <&vreg_l6d>;
+	vdda-pll-supply = <&vreg_l4d>;
+
+	status = "okay";
+};
+
+&pmk8280_adc_tm {
+	status = "okay";
+
+	sys-therm@0 {
+		reg = <0>;
+		io-channels = <&pmk8280_vadc PM8350_ADC7_AMUX_THM1_100K_PU(1)>;
+		qcom,hw-settle-time-us = <200>;
+		qcom,avg-samples = <2>;
+		qcom,ratiometric;
+	};
+
+	sys-therm@1 {
+		reg = <1>;
+		io-channels = <&pmk8280_vadc PM8350_ADC7_AMUX_THM2_100K_PU(1)>;
+		qcom,hw-settle-time-us = <200>;
+		qcom,avg-samples = <2>;
+		qcom,ratiometric;
+	};
+
+	sys-therm@2 {
+		reg = <2>;
+		io-channels = <&pmk8280_vadc PM8350_ADC7_AMUX_THM3_100K_PU(1)>;
+		qcom,hw-settle-time-us = <200>;
+		qcom,avg-samples = <2>;
+		qcom,ratiometric;
+	};
+
+	sys-therm@3 {
+		reg = <3>;
+		io-channels = <&pmk8280_vadc PM8350_ADC7_AMUX_THM4_100K_PU(1)>;
+		qcom,hw-settle-time-us = <200>;
+		qcom,avg-samples = <2>;
+		qcom,ratiometric;
+	};
+
+	sys-therm@4 {
+		reg = <4>;
+		io-channels = <&pmk8280_vadc PM8350_ADC7_AMUX_THM1_100K_PU(3)>;
+		qcom,hw-settle-time-us = <200>;
+		qcom,avg-samples = <2>;
+		qcom,ratiometric;
+	};
+
+	sys-therm@5 {
+		reg = <5>;
+		io-channels = <&pmk8280_vadc PM8350_ADC7_AMUX_THM2_100K_PU(3)>;
+		qcom,hw-settle-time-us = <200>;
+		qcom,avg-samples = <2>;
+		qcom,ratiometric;
+	};
+
+	sys-therm@6 {
+		reg = <6>;
+		io-channels = <&pmk8280_vadc PM8350_ADC7_AMUX_THM3_100K_PU(3)>;
+		qcom,hw-settle-time-us = <200>;
+		qcom,avg-samples = <2>;
+		qcom,ratiometric;
+	};
+
+	sys-therm@7 {
+		reg = <7>;
+		io-channels = <&pmk8280_vadc PM8350_ADC7_AMUX_THM4_100K_PU(3)>;
+		qcom,hw-settle-time-us = <200>;
+		qcom,avg-samples = <2>;
+		qcom,ratiometric;
+	};
+};
+
+&pmk8280_pon_pwrkey {
+	status = "okay";
+};
+
+&pmk8280_pon_resin {
+	status = "okay";
+	linux,code = <KEY_VOLUMEUP>;
+};
+
+&pmk8280_rtc {
+	status = "okay";
+};
+
+&pmk8280_vadc {
+	channel@144 {
+		reg = <PM8350_ADC7_AMUX_THM1_100K_PU(1)>;
+		qcom,hw-settle-time = <200>;
+		qcom,ratiometric;
+		label = "sys_therm1";
+	};
+
+	channel@145 {
+		reg = <PM8350_ADC7_AMUX_THM2_100K_PU(1)>;
+		qcom,hw-settle-time = <200>;
+		qcom,ratiometric;
+		label = "sys_therm2";
+	};
+
+	channel@146 {
+		reg = <PM8350_ADC7_AMUX_THM3_100K_PU(1)>;
+		qcom,hw-settle-time = <200>;
+		qcom,ratiometric;
+		label = "sys_therm3";
+	};
+
+	channel@147 {
+		reg = <PM8350_ADC7_AMUX_THM4_100K_PU(1)>;
+		qcom,hw-settle-time = <200>;
+		qcom,ratiometric;
+		label = "sys_therm4";
+	};
+
+	channel@344 {
+		reg = <PM8350_ADC7_AMUX_THM1_100K_PU(3)>;
+		qcom,hw-settle-time = <200>;
+		qcom,ratiometric;
+		label = "sys_therm5";
+	};
+
+	channel@345 {
+		reg = <PM8350_ADC7_AMUX_THM2_100K_PU(3)>;
+		qcom,hw-settle-time = <200>;
+		qcom,ratiometric;
+		label = "sys_therm6";
+	};
+
+	channel@346 {
+		reg = <PM8350_ADC7_AMUX_THM3_100K_PU(3)>;
+		qcom,hw-settle-time = <200>;
+		qcom,ratiometric;
+		label = "sys_therm7";
+	};
+
+	channel@347 {
+		reg = <PM8350_ADC7_AMUX_THM4_100K_PU(3)>;
+		qcom,hw-settle-time = <200>;
+		qcom,ratiometric;
+		label = "sys_therm8";
+	};
+};
+
+&qup0 {
+	status = "okay";
+};
+
+&qup1 {
+	status = "okay";
+};
+
+&qup2 {
+	status = "okay";
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/sc8280xp/Ntmer/tw220/qcadsp8280.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_nsp0 {
+	firmware-name = "qcom/sc8280xp/Ntmer/tw220/qccdsp8280.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_slpi {
+	firmware-name = "qcom/sc8280xp/Ntmer/tw220/qcslpi8280.mbn";
+	status = "okay";
+};
+
+&swr0 {
+	status = "okay";
+
+	left_spkr: wsa8830-left@0,1 {
+		compatible = "sdw10217020200";
+		reg = <0 1>;
+		pinctrl-0 = <&spkr_1_sd_n_default>;
+		pinctrl-names = "default";
+		powerdown-gpios = <&tlmm 178 GPIO_ACTIVE_LOW>;
+		#thermal-sensor-cells = <0>;
+		sound-name-prefix = "SpkrLeft";
+		#sound-dai-cells = <0>;
+		vdd-supply = <&vreg_s10b>;
+	};
+
+	right_spkr: wsa8830-right@0,2 {
+		compatible = "sdw10217020200";
+		reg = <0 2>;
+		pinctrl-0 = <&spkr_2_sd_n_default>;
+		pinctrl-names = "default";
+		powerdown-gpios = <&tlmm 179 GPIO_ACTIVE_LOW>;
+		#thermal-sensor-cells = <0>;
+		sound-name-prefix = "SpkrRight";
+		#sound-dai-cells = <0>;
+		vdd-supply = <&vreg_s10b>;
+	};
+};
+
+&uart2 {
+	pinctrl-0 = <&uart2_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn6855-bt";
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn_0p8>;
+		vddaon-supply = <&vreg_pmu_aon_0p8>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p8>;
+		vddbtcmx-supply = <&vreg_pmu_btcmx_0p8>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
+
+		local-bd-address = [ 00 11 22 33 44 55 ];
+		max-speed = <3200000>;
+	};
+};
+
+&usb_0 {
+	status = "okay";
+};
+
+&usb_0_dwc3 {
+	dr_mode = "host";
+};
+
+&usb_0_dwc3_hs {
+	remote-endpoint = <&pmic_glink_con0_hs>;
+};
+
+&usb_0_hsphy {
+	vdda-pll-supply = <&vreg_l6d>;
+	vdda18-supply = <&vreg_l1c>;
+	vdda33-supply = <&vreg_l7d>;
+
+	status = "okay";
+};
+
+&usb_0_qmpphy {
+	vdda-phy-supply = <&vreg_l4d>;
+	vdda-pll-supply = <&vreg_l9d>;
+
+	orientation-switch;
+
+	status = "okay";
+};
+
+&usb_0_qmpphy_out {
+	remote-endpoint = <&pmic_glink_con0_ss>;
+};
+
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_dwc3 {
+	dr_mode = "host";
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&pmic_glink_con1_hs>;
+};
+
+&usb_1_hsphy {
+	vdda-pll-supply = <&vreg_l6b>;
+	vdda18-supply = <&vreg_l1c>;
+	vdda33-supply = <&vreg_l13c>;
+
+	status = "okay";
+};
+
+&usb_1_qmpphy {
+	vdda-phy-supply = <&vreg_l3b>;
+	vdda-pll-supply = <&vreg_l4b>;
+
+	orientation-switch;
+
+	status = "okay";
+};
+
+&usb_1_qmpphy_out {
+	remote-endpoint = <&pmic_glink_con1_ss>;
+};
+
+&usb_2 {
+	status = "okay";
+};
+
+&usb_2_hsphy0 {
+	vdda-pll-supply = <&vreg_l6d>;
+	vdda18-supply = <&vreg_l1c>;
+	vdda33-supply = <&vreg_l7d>;
+
+	status = "okay";
+};
+
+&usb_2_hsphy1 {
+	vdda-pll-supply = <&vreg_l6d>;
+	vdda18-supply = <&vreg_l1c>;
+	vdda33-supply = <&vreg_l7d>;
+
+	status = "okay";
+};
+
+&usb_2_hsphy2 {
+	vdda-pll-supply = <&vreg_l6d>;
+	vdda18-supply = <&vreg_l8c>;
+	vdda33-supply = <&vreg_l2d>;
+
+	status = "okay";
+};
+
+&usb_2_hsphy3 {
+	vdda-pll-supply = <&vreg_l6d>;
+	vdda18-supply = <&vreg_l8c>;
+	vdda33-supply = <&vreg_l2d>;
+
+	status = "okay";
+};
+
+&usb_2_qmpphy0 {
+	vdda-phy-supply = <&vreg_l4d>;
+	vdda-pll-supply = <&vreg_l1b>;
+
+	status = "okay";
+};
+
+&usb_2_qmpphy1 {
+	vdda-phy-supply = <&vreg_l4d>;
+	vdda-pll-supply = <&vreg_l8d>;
+
+	status = "okay";
+};
+
+&vamacro {
+	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
+	pinctrl-names = "default";
+
+	vdd-micb-supply = <&vreg_s10b>;
+
+	qcom,dmic-sample-rate = <4800000>;
+
+	status = "okay";
+};
+
+&wsamacro {
+	status = "okay";
+};
+
+&xo_board_clk {
+	clock-frequency = <38400000>;
+};
+
+/* PINCTRL */
+
+&lpass_tlmm {
+	status = "okay";
+};
+
+&pmc8280_1_gpios {
+	misc_3p3_reg_en: misc-3p3-reg-en-state {
+		pins = "gpio1";
+		function = "normal";
+	};
+
+	dsi_bl_en: dsi-bl-en-state {
+		pins = "gpio8";
+		function = "normal";
+	};
+
+	dsi_bl_reg_en: dsi-bl-reg-en-state {
+		pins = "gpio9";
+		function = "normal";
+	};
+
+	vol_down_n: vol-up-n-state {
+		pins = "gpio6";
+		function = "normal";
+		power-source = <1>;
+		input-enable;
+		bias-pull-up;
+	};
+};
+
+&pmr735a_gpios {
+	hastings_reg_en: hastings-reg-en-state {
+		pins = "gpio1";
+		function = "normal";
+	};
+};
+
+&tlmm {
+	gpio-reserved-ranges = <70 2>, <74 6>, <125 2>, <128 2>;
+
+	bt_default: bt-default-state {
+		hstp-bt-en-pins {
+			pins = "gpio133";
+			function = "gpio";
+			drive-strength = <16>;
+			bias-disable;
+		};
+
+		hstp-sw-ctrl-pins {
+			pins = "gpio132";
+			function = "gpio";
+			bias-pull-down;
+		};
+	};
+
+	camf_indicator_en: camf-indicator-en-state {
+		pins = "gpio44";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	camr_indicator_en: camr-indicator-en-state {
+		pins = "gpio43";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	hall_int_n_default: hall-int-n-state {
+		pins = "gpio107";
+		function = "gpio";
+		bias-disable;
+	};
+
+	i2c1_default: i2c1-default-state {
+		pins = "gpio158", "gpio159";
+		function = "qup1";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	i2c11_default: i2c11-default-state {
+		pins = "gpio18", "gpio19";
+		function = "qup11";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	nvme_reg_en: nvme-reg-en-state {
+		pins = "gpio135";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	pcie2a_default: pcie2a-default-state {
+		clkreq-n-pins {
+			pins = "gpio142";
+			function = "pcie2a_clkreq";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio143";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		wake-n-pins {
+			pins = "gpio145";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	pcie4_default: pcie4-default-state {
+		clkreq-n-pins {
+			pins = "gpio140";
+			function = "pcie4_clkreq";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio141";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		wake-n-pins {
+			pins = "gpio139";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	pm8008_default: pm8008-default-state {
+		int-pins {
+			pins = "gpio41";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+
+		reset-n-pins {
+			pins = "gpio42";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	spi22_default: spi22-default-state {
+		cs-pins {
+			pins = "gpio86";
+			function = "qup22";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+
+		data-clk-pins {
+			/* MISO, MOSI, CLK */
+			pins = "gpio83", "gpio84", "gpio85";
+			function = "qup22";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+	};
+
+	spkr_1_sd_n_default: spkr-1-sd-n-default-state {
+		perst-n-pins {
+			pins = "gpio178";
+			function = "gpio";
+			drive-strength = <16>;
+			bias-disable;
+			output-high;
+		};
+	};
+
+	spkr_2_sd_n_default: spkr-2-sd-n-default-state {
+		perst-n-pins {
+			pins = "gpio179";
+			function = "gpio";
+			drive-strength = <16>;
+			bias-disable;
+			output-high;
+		};
+	};
+
+	ts0_default: ts0-default-state {
+		int-n-pins {
+			pins = "gpio175";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		reset-n-pins {
+			pins = "gpio99";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	ts_avdd_en: ts-avdd-state {
+		pins = "gpio56";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	ts_vddio_en: ts-vddio-state {
+		pins = "gpio90";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	uart2_default: uart2-default-state {
+		cts-pins {
+			pins = "gpio121";
+			function = "qup2";
+			bias-bus-hold;
+		};
+
+		rts-pins {
+			pins = "gpio122";
+			function = "qup2";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		rx-pins {
+			pins = "gpio124";
+			function = "qup2";
+			bias-pull-up;
+		};
+
+		tx-pins {
+			pins = "gpio123";
+			function = "qup2";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	wlan_en: wlan-en-state {
+		pins = "gpio134";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-down;
+	};
+};
-- 
2.49.0


