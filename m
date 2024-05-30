Return-Path: <linux-arm-msm+bounces-21158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DD08D55A7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 00:46:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8048F1C23907
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 22:46:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9F9715B0E8;
	Thu, 30 May 2024 22:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UgNhswcj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8874D8CF
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 22:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717109180; cv=none; b=p4ogdvyjlcviERYRLw0k2P08a5YiDXo08pICB5aEiemtEHNicn/IZXhkJ4avw156yu3F62YzvNYftGsIfghiCg8Bh69jK+3m2GWa3RyG5xcgdLVix51xDu1CUVXcfseI1rmX5stNN5A7iO1I2bd3PLQoXjRhmJ0qu5Nb6PNhrYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717109180; c=relaxed/simple;
	bh=JSblW4xKQPWmCTufLZRebniB3Jpf5sbepE4eTR9OjBM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=as99BoecR4+/KltM1HZWCf4BBgaEIn7AqZi8+Y3KWzNt6rTpTSjAUjENRBwp5wH3LDE4m7jicUJUVEivMdsYaxBHm9vMYBJTPxyizkJ8nhF4fEwS8sRlxxcGe8MrW+1BF0VkzCPK8w3U9mVidxlp+AcmO3G4L+px6tYOI9HK69g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UgNhswcj; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-6bfd4b88637so1060197a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 15:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717109179; x=1717713979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pq4RWLiz1he3jfRd8xNC5uP0QIgGNhSaJwNREYP2LeM=;
        b=UgNhswcjsELnRyNBJ2rdtm4CDj1v3NkZCUyPqhZ03blFZuXBdoAtzLjAf0dB7JDVPt
         o76+uFmh7Ozu9I0MluOyyPVxe6WVkPN2qI+GaYvDEYjgbccITmZhG3noCe2GBTclUYrr
         2I5N+uaLFUhYVAnY3RMXIM15Du2wmo6yZ5/6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717109179; x=1717713979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pq4RWLiz1he3jfRd8xNC5uP0QIgGNhSaJwNREYP2LeM=;
        b=I8Jb98Gje+eaiSQhaLGQ2tsUi5Pnu/TuGfTyvRFgSXP5upBeSyzz3JKK0xmme97V1a
         9lF856qyQTB1+IUGHzw2VJPgN+uoNkjpMRHgYD+BnN2eVr1TH00omCZPyK0maOywsZ6n
         0/pXt7HHYVIRJJDPd8YBuWog82vU9goYlny1BLT1kHKHenYSAr86IrmvfY1dZ1Iug340
         qH1EsZz1bVcPxw3A7gg45asKesEIxGyICXQQsbyOLF6xkq6vqmQQGhuQzgcrTObbmUTK
         lVftbeMhpLLn1NovMMcTMNY6nnKzOVdyQdc9pY2kTpYLNlXLvoOHUj6WjOZqka8H6i6Y
         pfew==
X-Gm-Message-State: AOJu0Yxb8DEF9eTNCFHkTyEsgF64HB1LhzNzIuLUXr3YFk0mdD5z6lPS
	293WpHkunYxr/24xz8pdBQOGRXUcQfPsmorUANMtlI5F8Ftja6pmYIW/YlqtDg==
X-Google-Smtp-Source: AGHT+IF3nsfazT0Xha9zRO3J7BNzKwddTMzOcBVLAiQtQVBr1ihR/BaRoxVkTobTsMcgIx7QzjN6Bw==
X-Received: by 2002:a17:903:2285:b0:1f6:2cd2:ab9d with SMTP id d9443c01a7336-1f6370b1254mr1389445ad.55.1717109178630;
        Thu, 30 May 2024 15:46:18 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:564b:72b6:4827:cf6a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f632410b20sm2955795ad.273.2024.05.30.15.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 15:46:18 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	John Ogness <john.ogness@linutronix.de>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Tony Lindgren <tony@atomide.com>,
	Stephen Boyd <swboyd@chromium.org>,
	linux-serial@vger.kernel.org,
	Yicong Yang <yangyicong@hisilicon.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	Rob Herring <robh@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
Subject: [PATCH v2 0/7] serial: qcom-geni: Overhaul TX handling to fix crashes/hangs
Date: Thu, 30 May 2024 15:45:52 -0700
Message-ID: <20240530224603.730042-1-dianders@chromium.org>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
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

Changes in v2:
- soc: qcom: geni-se: Add GP_LENGTH/IRQ_EN_SET/IRQ_EN_CLEAR registers
- serial: qcom-geni: Fix the timeout in qcom_geni_serial_poll_bit()
- serial: qcom-geni: Fix arg types for qcom_geni_serial_poll_bit()
- serial: qcom-geni: Introduce qcom_geni_serial_poll_bitfield()
- serial: qcom-geni: Just set the watermark level once
- Totally rework / rename patch to handle suspend while active xfer
- serial: qcom-geni: Rework TX in FIFO mode to fix hangs/lockups

Douglas Anderson (7):
  soc: qcom: geni-se: Add GP_LENGTH/IRQ_EN_SET/IRQ_EN_CLEAR registers
  serial: qcom-geni: Fix the timeout in qcom_geni_serial_poll_bit()
  serial: qcom-geni: Fix arg types for qcom_geni_serial_poll_bit()
  serial: qcom-geni: Introduce qcom_geni_serial_poll_bitfield()
  serial: qcom-geni: Just set the watermark level once
  serial: qcom-geni: Fix suspend while active UART xfer
  serial: qcom-geni: Rework TX in FIFO mode to fix hangs/lockups

 drivers/tty/serial/qcom_geni_serial.c | 316 ++++++++++++++++----------
 include/linux/soc/qcom/geni-se.h      |   6 +
 2 files changed, 203 insertions(+), 119 deletions(-)

-- 
2.45.1.288.g0e0cd299f1-goog


