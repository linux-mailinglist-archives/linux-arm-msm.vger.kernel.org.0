Return-Path: <linux-arm-msm+bounces-22221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D6A902B86
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 00:25:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC20D1F22802
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 22:25:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A955E150980;
	Mon, 10 Jun 2024 22:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AxH9c3Yj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050C118E2A
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jun 2024 22:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718058336; cv=none; b=VdxOFQHxd/5nuoPYthXQmxwkdC1WWNHDmNzjxewFPhbtrd9x2GucvVgBrcmE4l7mkrTV8F0quBY92AkWm2IVxHibVdGMGpQtBjOhRXLNM6RFbSi+S4pxnDh7ceDxIAbaAyuMck8yW6mDZQ7nZqlaOVbkaRB5jX3RFS/vPq3bwHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718058336; c=relaxed/simple;
	bh=MqviCqfqIHX7u8G/Z6LL7r1CVMo4OBErpJn1/ngl/vE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sm8uT+6nVKctfPC+SMK/wncEGLmYLi5q6ikkR9SUYMP6IoX7SZq1L6NUT+UFkXMpdqHbDoIb0qR+fLVnfMefORJ+lmxwWfwPv7SDK4CCjrEDrnuRIegBxoke4Wpa+4dkc5mAfnsxVEUDSWWbZSl4I0pmfao80GovRViE69Ztkf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AxH9c3Yj; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-6570bd6c3d7so2823817a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jun 2024 15:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718058334; x=1718663134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9f82RCupm/BfuZamDEll+7kz7R1SJFCpY/OHFhONWlY=;
        b=AxH9c3YjBgE/N5qrHRryxAaRU/bmmqI10Zf/btyrsIOMNUlUZa/5WvVyZ6xM7V66jW
         lDeFADB1kScSVeyYs5Xap/Q4ChPEdtKmCT6ZzqDNGlfOLgxO9VYkOg3frnnR6w4qQenQ
         YI/TyJfjPh5wAWCCM8/x/lP67vTJXy/zublf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718058334; x=1718663134;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9f82RCupm/BfuZamDEll+7kz7R1SJFCpY/OHFhONWlY=;
        b=vovF/0DhtOYcWlnar41lC6kjgYwaa6zS0wQ8ZJwQU44Lp5RSvfresJWwVo1ndIGrHg
         Q50XXeh9iHc8QQSdC72ib/davXNWCgTpfXAyMKfspLVhZ0d1WfHZpfgdXz+y3U68EVln
         j0yLjYp+CV3+Nd1DSBTi06X/DdmKjTwtJdvHeiAUd2DNDGCWvN4gWPUzl1q8qipW34zp
         fFy08vDF5UJzgCkPuBk9VEYCZso6OA+XZzFGvT63xocDS9jLyHKGUyp9BL3qp4iHJJ39
         E5rXPBE31P7HT0cw7GcNXtPtd82Y7Gjjnz43tTXy/+0ewXootgperfeOOCZN3LTzBSEZ
         D3iw==
X-Forwarded-Encrypted: i=1; AJvYcCUjRBCm4fqW5ON/vpwyNwlCifSx1h8Qcm46iNgxlw1036wLwnRQeCqRnVxgcSnuHisuPXWiU7DwQp/TYeYHluiPeIDUX9mbGh4dvzeHfA==
X-Gm-Message-State: AOJu0Yyozk6p2Y978D2GbEqjW/IBYgzWcxSQyN+/2iCz1172IVVAVyzf
	aqthlof5JFAM4eZe7eSVra7OEa0aPKedR6wJH4ElYQhRdemfVUiW96ZxZGxgLw==
X-Google-Smtp-Source: AGHT+IE2nKLq+Ptop68Z34+mriVxV3i7t1j3Qzwns8l2vbwaKmyQaRrPowITUmKiCuwMqUaMG2Hlqw==
X-Received: by 2002:a17:902:e808:b0:1f7:1931:7a9c with SMTP id d9443c01a7336-1f719317ef2mr35773995ad.15.1718058334285;
        Mon, 10 Jun 2024 15:25:34 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:bba2:69f4:1b51:d0f5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f71029e223sm29212325ad.170.2024.06.10.15.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 15:25:33 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Yicong Yang <yangyicong@hisilicon.com>,
	Tony Lindgren <tony@atomide.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	John Ogness <john.ogness@linutronix.de>,
	linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Stephen Boyd <swboyd@chromium.org>,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Douglas Anderson <dianders@chromium.org>,
	Rob Herring <robh@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
Subject: [PATCH v4 0/8] serial: qcom-geni: Overhaul TX handling to fix crashes/hangs
Date: Mon, 10 Jun 2024 15:24:18 -0700
Message-ID: <20240610222515.3023730-1-dianders@chromium.org>
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


While trying to reproduce -EBUSY errors that our lab was getting in
suspend/resume testing, I ended up finding a whole pile of problems
with the Qualcomm GENI serial driver. I've posted a fix for the -EBUSY
issue separately [1]. This series is fixing all of the Qualcomm GENI
problems that I found.

As far as I can tell most of the problems have been in the Qualcomm
GENI serial driver since inception, but it can be noted that the
behavior got worse with the new kfifo changes. Previously when the OS
took data out of the circular queue we'd just spit stale data onto the
serial port. Now we'll hard lockup. :-P

I've tried to break this series up as much as possible to make it
easier to understand but the final patch is still a lot of change at
once. Hopefully it's OK.

[1] https://lore.kernel.org/r/20240530084841.v2.1.I2395e66cf70c6e67d774c56943825c289b9c13e4@changeid

Changes in v4:
- Add GP_LENGTH field definition.
- Fix indentation.
- GENMASK(31, 0) -> GP_LENGTH.
- Use uart_fifo_timeout_ms() for timeout.
- tty: serial: Add uart_fifo_timeout_ms()

Changes in v3:
- 0xffffffff => GENMASK(31, 0)
- Reword commit message.
- Use uart_fifo_timeout() for timeout.

Changes in v2:
- Totally rework / rename patch to handle suspend while active xfer
- serial: qcom-geni: Fix arg types for qcom_geni_serial_poll_bit()
- serial: qcom-geni: Fix the timeout in qcom_geni_serial_poll_bit()
- serial: qcom-geni: Introduce qcom_geni_serial_poll_bitfield()
- serial: qcom-geni: Just set the watermark level once
- serial: qcom-geni: Rework TX in FIFO mode to fix hangs/lockups
- soc: qcom: geni-se: Add GP_LENGTH/IRQ_EN_SET/IRQ_EN_CLEAR registers

Douglas Anderson (8):
  soc: qcom: geni-se: Add GP_LENGTH/IRQ_EN_SET/IRQ_EN_CLEAR registers
  tty: serial: Add uart_fifo_timeout_ms()
  serial: qcom-geni: Fix the timeout in qcom_geni_serial_poll_bit()
  serial: qcom-geni: Fix arg types for qcom_geni_serial_poll_bit()
  serial: qcom-geni: Introduce qcom_geni_serial_poll_bitfield()
  serial: qcom-geni: Just set the watermark level once
  serial: qcom-geni: Fix suspend while active UART xfer
  serial: qcom-geni: Rework TX in FIFO mode to fix hangs/lockups

 drivers/tty/serial/qcom_geni_serial.c | 322 +++++++++++++++-----------
 include/linux/serial_core.h           |  15 +-
 include/linux/soc/qcom/geni-se.h      |   9 +
 3 files changed, 206 insertions(+), 140 deletions(-)

-- 
2.45.2.505.gda0bf45e8d-goog


