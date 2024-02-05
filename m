Return-Path: <linux-arm-msm+bounces-9839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBE484A24B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Feb 2024 19:30:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0EDF1F215D4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Feb 2024 18:30:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3F7C482EC;
	Mon,  5 Feb 2024 18:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Ez39udAw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9CD482F2
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Feb 2024 18:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707157703; cv=none; b=eSsFV2TJf8v5pJb5Eg9c93k1bhHXijHsMMC39FTFik90kDBiwl/s8kF5ZQ1cU3BiLSy810KWVrpPPPV3N7B2fXNN5zle1o+1vA2sP0tUDG7I8RKUnSW2CpaxkRS0lbLsUY+JmTbib/nsLob612rR04fGacrI9v0MWfTpp9TeEZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707157703; c=relaxed/simple;
	bh=FrgXf5u2mQ9+ou9vmhgfkmqkvim0hM5jWrxZiojnQPI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=b9zheL8lK5jlhYKCj5cAoDOapncRmsTMkCRKz2owRzjXyZFTo8gDDHbR7kYN4C7Qx0blqzoiee69cR0ky6V3eAg7jjkqs86Rf78k95+DfGPqFvAJN6n9sv5Xn7pYNoISLws07gpQ7c2GYpaYWWxOB2L3zQ/l7gJ2skPjXhsC578=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Ez39udAw; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-33b402116e5so591943f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Feb 2024 10:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707157700; x=1707762500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L9SYY+qgpvvxUhsi9zVed0l424i9mHr1dF1RqnBUnS8=;
        b=Ez39udAwqru2wBsPkB8vIYm97HafZ536o8ceUAfiJPNAjxMB0RiZWlml0F5AF6hZgI
         kN9965gfQ3ZPvlq/G4Zyoaek0Hh1lKpI+AyyJa1HsbrLbukiSo46yoCEVfPRLDDBAXiO
         8TYGjM0A9luqtZ4W1HkwyKH8mEDDuyec5c+1+dgVwbwSM2hze/kWPMN+8s6dCSwCza/w
         RZEKqHT75L0dGJvaI0XbcLRwLhOzV1VDI4W6x0KEYvigEONMwWKpZ8VCKE8LcoRmlFdP
         W9RYXmBIimLy4RuP7vu7jrwl8cwkQKa75ade1w5skgl4XJKvtIG24DXjYwmfoxQWmF28
         wPcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707157700; x=1707762500;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L9SYY+qgpvvxUhsi9zVed0l424i9mHr1dF1RqnBUnS8=;
        b=qhJRCFLkIl0UuLh9i9DvehP0WLQmwON/lza7+B3FkDtiTIfmsvnSnGWiYPGaPn7w+o
         /6uMY9VsqVBW/GC0LvBDQBb/gvyOLkb25NXbZ1cefdc/2B4oS/terd8l6DKf4+036zvg
         KAdImHPRgrwyQXaa2PslUb5AB7RwZSo4P/qHe7YlIhsm8mSVUwBsgXXunHrBQVhFgyDp
         rqZzx642AKCsOyWfwFpke7faFzH1o7UzCKMk40hdw7L0G0oaF0Q+n8B99BNSL5JCtaLt
         SH7gtkUe6DfjFTqZAkCreXAVbV4b7isfqCvmbBBrVj37e/0aZZKS9n1pLYc71vE9RW0T
         KXlA==
X-Gm-Message-State: AOJu0Yx/8kwnYlz0RPCMt3OlYam7c+ubm4W89yKzNZL9RC5MHQVjV6Ne
	wXk94qRSLVOxM57FM0un3ST3yCZlIsd0o9Ty6R+SqYV03IIqZKnnpxxisyTYpAg=
X-Google-Smtp-Source: AGHT+IFXKTwFzId4HeD48V0GUEepHR/dav3QLileDXFCLu/lm6sGjYLlaU1mBljSkwZfYSQSpyIiXQ==
X-Received: by 2002:a05:6000:248:b0:33b:3c79:9182 with SMTP id m8-20020a056000024800b0033b3c799182mr223826wrz.3.1707157699823;
        Mon, 05 Feb 2024 10:28:19 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUPFThfwYFaIB2slHnICTpsQvB4UcTrsX/f+BFLAnnJdy9c28RIqhda+FuZCwcIlmbcV5/tWKoMvcpm9wRvSqRLQ4v+4ejqRA6DXTQ3X8dPYWedTiM9W+0RToVSi1DLKlvfsPEzHoipmpuyPoXCmC56W0AQyfkbajwY/XkHT4yfXMtQZvQnk6I2IbyweXaN8ap0NEMtHw8sby435OR7ULlT3KE0sGJDpdbpXEXIKj6mcgPv6m6NKkUhfLFiudkduLlzR54wT1tPVG/uQ5QQ8RN4hhMcrpC6LwLQ/3tXFrjyfS9m0TUVU1+2dQa5nKGAviEXyReU5IIOa4aZzBtkJW2mc+n0O2m5mj89mJwe3nxV2Ys7QeCbEQIMcUqiMJIWHWBDCkoX5UhwFapXv1Oxnlfjo9UN2AEFAG4ohn/gNATAAmn54PWeag/r0zg5fWz//Eomq9deTJRzOOC6Hhc1i1/pppRohEYcASGi+vQJox/gu1QAxq2Ye8bC6uYf6UgmGfOspR+v/BdFK8alipI9Nk+186CC/ljtiA==
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d929:10db:5b5c:b49d])
        by smtp.gmail.com with ESMTPSA id v15-20020a5d678f000000b0033b17e18df8sm203229wru.12.2024.02.05.10.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 10:28:19 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Elliot Berman <quic_eberman@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Guru Das Srinagesh <quic_gurus@quicinc.com>,
	Andrew Halaney <ahalaney@redhat.com>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Alex Elder <elder@linaro.org>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@quicinc.com,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v7 00/12] arm64: qcom: add and enable SHM Bridge support
Date: Mon,  5 Feb 2024 19:27:58 +0100
Message-Id: <20240205182810.58382-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We've established the need for using separate secured memory pools for
SCM and QSEECOM as well as the upcoming scminvoke driver.

It's also become clear that in order to be future-proof, the new
allocator must be an abstraction layer of a higher level as the SHM
Bridge will not be the only memory protection mechanism that we'll see
upstream. Hence the rename to TrustZone Memory rather than SCM Memory
allocator.

Also to that end: the new allocator is its own module now and provides a
Kconfig choice menu for selecting the mode of operation (currently
default and SHM Bridge).

Tested on sm8550 and sa8775p with the Inline Crypto Engine and
remoteproc.

v6 -> v7:
- fix a Kconfig issue: TZMEM must select GENERIC_ALLOCATOR

v5 -> v6:
Fixed two issues reported by autobuilders:
- add a fix for memory leaks in the qseecom driver as the first patch for
  easier backporting to the v6.6.y branch
- explicitly cast the bus address stored in a variable of type dma_addr_t
  to phys_addr_t expected by the genpool API

v4 -> v5:
- fix the return value from qcom_tzmem_init() if SHM Bridge is not supported
- remove a comment that's no longer useful
- collect tags

v3 -> v4:
- include linux/sizes.h for SZ_X macros
- use dedicated RCU APIs to dereference radix tree slots
- fix kerneldocs
- fix the comment in patch 14/15: it's the hypervisor, not the TrustZone
  that creates the SHM bridge

v2 -> v3:
- restore pool management and use separate pools for different users
- don't use the new allocator in qcom_scm_pas_init_image() as the
  TrustZone will create an SHM bridge for us here
- rewrite the entire series again for most part

v1 -> v2:
- too many changes to list, it's a complete rewrite as explained above

Bartosz Golaszewski (12):
  firmware: qcom: add a dedicated TrustZone buffer allocator
  firmware: qcom: scm: enable the TZ mem allocator
  firmware: qcom: scm: smc: switch to using the SCM allocator
  firmware: qcom: scm: make qcom_scm_assign_mem() use the TZ allocator
  firmware: qcom: scm: make qcom_scm_ice_set_key() use the TZ allocator
  firmware: qcom: scm: make qcom_scm_lmh_dcvsh() use the TZ allocator
  firmware: qcom: scm: make qcom_scm_qseecom_app_get_id() use the TZ
    allocator
  firmware: qcom: qseecom: convert to using the TZ allocator
  firmware: qcom: scm: add support for SHM bridge operations
  firmware: qcom: tzmem: enable SHM Bridge support
  firmware: qcom: scm: clarify the comment in qcom_scm_pas_init_image()
  arm64: defconfig: enable SHM Bridge support for the TZ memory
    allocator

 MAINTAINERS                                   |   8 +
 arch/arm64/configs/defconfig                  |   1 +
 drivers/firmware/qcom/Kconfig                 |  31 ++
 drivers/firmware/qcom/Makefile                |   1 +
 .../firmware/qcom/qcom_qseecom_uefisecapp.c   | 281 +++++---------
 drivers/firmware/qcom/qcom_scm-smc.c          |  30 +-
 drivers/firmware/qcom/qcom_scm.c              | 179 +++++----
 drivers/firmware/qcom/qcom_scm.h              |   6 +
 drivers/firmware/qcom/qcom_tzmem.c            | 365 ++++++++++++++++++
 drivers/firmware/qcom/qcom_tzmem.h            |  13 +
 include/linux/firmware/qcom/qcom_qseecom.h    |   4 +-
 include/linux/firmware/qcom/qcom_scm.h        |   6 +
 include/linux/firmware/qcom/qcom_tzmem.h      |  28 ++
 13 files changed, 685 insertions(+), 268 deletions(-)
 create mode 100644 drivers/firmware/qcom/qcom_tzmem.c
 create mode 100644 drivers/firmware/qcom/qcom_tzmem.h
 create mode 100644 include/linux/firmware/qcom/qcom_tzmem.h

-- 
2.40.1


