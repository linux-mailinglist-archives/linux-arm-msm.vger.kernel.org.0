Return-Path: <linux-arm-msm+bounces-21634-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E3B8FB8DA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 18:26:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 001CEB21944
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 16:01:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98EE4145B09;
	Tue,  4 Jun 2024 16:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cvHM+O4z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C9038396
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jun 2024 16:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717516904; cv=none; b=lAJs7Ut535tetyeZym/tZzPY3VPDu1KcL1WBJwaVUMXVwebkTm+sNETrTiuZ8tT7QQ9U0e6cnLGCz8WsOdObjDpqU3ncX+CNJQPQNEGHWlOfNJqGuS7KBFxwbGXCTa+r1uI6O7mDgwGQC0U0BpOzwmBEZ+5IaEWAQz3ka2VzI/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717516904; c=relaxed/simple;
	bh=UHzZ5C64QokgB0Nf9YRDLoY3TcwruMFoCd+RWF3Ex3w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cgcK+RWdwrIj/0Zju0F0t23tC8C4B0P+HCElqUSa9wwOaicJwbSDermZkHvDuO6agbUUl2jx+SPCY5F5tRRu+IAhEsczUwXGJ5hH5n9tvtLAGd+vkbA4YfpzfytBAc3KVmKJ7qojcuyJuGYbX/Kptz9Fm36IrZxnuVqW287GSV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cvHM+O4z; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1f44b441b08so43779315ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jun 2024 09:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717516902; x=1718121702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VrvFgnb5K8RErqVb3j7BOiSXQIj7zAENvVNIAFSR1AI=;
        b=cvHM+O4zfQRQ4C4xy1woVvgozOLvjfdO4PEMPL2Q8wdbxUaPyA8qWVFB43hW5UJM07
         5Bv2nxZZDmQpy42sWSbH4oRthcljo8AJuTcr4ZLNQPCqeQ29estF3PzS3tgvWY5KVP1Y
         L28QX4VlEXpcfhSub22lqAmGHTlmK3Gg8Xnfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717516902; x=1718121702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VrvFgnb5K8RErqVb3j7BOiSXQIj7zAENvVNIAFSR1AI=;
        b=b1GLCFw+uOlNOp8a2Bu/VF+RJtdhbZ0vr3wmWN7uT9+t0avnnwmnTdnpiYvY+q6X/C
         uGVx5V5Jx1Wf7S+vSt1xj42WWi5XgOl7qVYwodTKVzWz7W42jPe77y9npBklBavc/oPM
         D43zmeC02dBDlcjrheqMl2PxktDUoa6X/TRBWv6K/S4nV4fUb1TCVeINAEU13EobGgz5
         n4iSWhQnE1jjOAyU+1XGxKWLtL6HU1Px34IIDkMIF66i6mjgzBCaJn1LYtpVjgfrRzrH
         8iVX71ryDt1KtvUWGu3xsis8fJ51FCEEVTgcoBW2Jf9NYbI1sqch5sX8rdWkFenkh9R+
         PxAA==
X-Forwarded-Encrypted: i=1; AJvYcCVELKK4hVxLlZjBxsimZp7Y8oVg3m2WyPKnGBvzzVlMBaC6txuMgzAyJPvffNOAYuohoCDHSALiBVhOS0F2/mbP1gWnzi0BeoGQmrSqRQ==
X-Gm-Message-State: AOJu0YyZgCs6HiXuJDNnJQFHtkjbumWk3S5zzodL4bVWhzxdEv/wW7gm
	e4wkc8+naDtpHqnvqQZOXlFShJwntmr30n7ESeSygAeTYH4vjBNDSR2wBxgm7A==
X-Google-Smtp-Source: AGHT+IFFgX0sKYkAtcpvw1itN+1f9pVmaj2lYmIXlASKInlnOGaz93g0ZHqpT9u6xEaXRgFFJjMsCg==
X-Received: by 2002:a17:902:e805:b0:1f6:6f45:81f0 with SMTP id d9443c01a7336-1f66f4583e9mr86089725ad.57.1717516901863;
        Tue, 04 Jun 2024 09:01:41 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:3609:ff79:4625:8a71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f632358519sm86118385ad.82.2024.06.04.09.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 09:01:41 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-arm-msm@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	John Ogness <john.ogness@linutronix.de>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Tony Lindgren <tony@atomide.com>,
	Stephen Boyd <swboyd@chromium.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Rob Herring <robh@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
Subject: [PATCH v3 0/7] serial: qcom-geni: Overhaul TX handling to fix crashes/hangs
Date: Tue,  4 Jun 2024 09:00:26 -0700
Message-ID: <20240604160123.2029413-1-dianders@chromium.org>
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

Douglas Anderson (7):
  soc: qcom: geni-se: Add GP_LENGTH/IRQ_EN_SET/IRQ_EN_CLEAR registers
  serial: qcom-geni: Fix the timeout in qcom_geni_serial_poll_bit()
  serial: qcom-geni: Fix arg types for qcom_geni_serial_poll_bit()
  serial: qcom-geni: Introduce qcom_geni_serial_poll_bitfield()
  serial: qcom-geni: Just set the watermark level once
  serial: qcom-geni: Fix suspend while active UART xfer
  serial: qcom-geni: Rework TX in FIFO mode to fix hangs/lockups

 drivers/tty/serial/qcom_geni_serial.c | 321 +++++++++++++++-----------
 include/linux/soc/qcom/geni-se.h      |   6 +
 2 files changed, 192 insertions(+), 135 deletions(-)

-- 
2.45.1.288.g0e0cd299f1-goog


