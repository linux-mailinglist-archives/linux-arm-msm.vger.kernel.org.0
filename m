Return-Path: <linux-arm-msm+bounces-53580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BA8A81372
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 19:23:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3284F7ACC5E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 17:21:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C796232364;
	Tue,  8 Apr 2025 17:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lQ3+Ivw0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5780235BF8
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Apr 2025 17:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744132979; cv=none; b=Z7yvnMBD6GeCL8MDN3HaoG3Qv/powrORZ1LdhvmDQLkPVG0WZJGquaCLpVBjrq2D+RYgjirAxgF/CZj5Sh2y4sLSlCfAXwPt3a0vK1GHWWLLblILnBU/x+flUwTMDA4ItIMERA6S+riPoLPwi1PJ9on59fVczoMS9lhfDwyuVSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744132979; c=relaxed/simple;
	bh=5NywFW6xB8UuMiL4LDix2VQ+qNqYRyX7EU811zrQEik=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QCvO8238Elpc/vv7lb6C2f3oBTa5ywlAHPBz3JSBvAX3c9plFQUIzb8G3RBH1lQm7ct5asZJpNCvR+CMcqtTeMzPCB1C4WK1V6hcsO1r/xphB9ja4pZ2WNBrjdnHGN3ZDr/R6YxN2bMKsWtK0SjN96Vd62+AXziBKLCRqQhJYiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lQ3+Ivw0; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43ed8d32a95so34947885e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Apr 2025 10:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744132976; x=1744737776; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O8eZErsxXbk4Ltj+VHtcUHscTNPH20Yo7M4Qa6P1ICk=;
        b=lQ3+Ivw0k++Ov2S8O0vmHqJ6bRDVkAfrQC9Lr2T2dx28yMRFPjltario5iQUavsnXh
         vPC+LkAvAasO3QPCrx89/XMGdgIUY83zzdAYRJaXYGjW16bEpT7NAI0PVq6U5vgSPv63
         nRFc97qW9Q913YXb146xCPEx/7vewSg8xLpPgiwBJ8OSaEqW3QtZApIWMzQxEdjPEhsb
         h4zdEqprp4gENl99/OMPZ65dm9jr+h0Uy7BvgyS3ASljOoXr31XWO124XZq+7ha6F/pd
         a+PxhepJYh0R3pQfVsgml+t77YLtjkgaJJrNLe5aMMyKWGa0rOdMHeb39gPi3gVL4B7L
         jtOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744132976; x=1744737776;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O8eZErsxXbk4Ltj+VHtcUHscTNPH20Yo7M4Qa6P1ICk=;
        b=MWxaJ5hGo+TqLeswv+vjwA+zTJzVCr2fGn2JX3BRb1srhkk9nGTRzL4fQXo5RReNzV
         TS8MpibrEjGrw5Blqd1LFSb3/U2l1n2H8GrNI2b9W4a/MfG6aqA6aOG8O+HzRx8ziAwm
         JtESLBf6BhnwAj1wHmzYptgbJYZMA9lPXb5NBZc626rZysC5w8KCAw5diNVrepjLx9T9
         U8t3BoXqLXyl/lMT3yWfzn/mYz/nm6RrNv+eFA99aNOPDUZlnc5NFB9g26e4tNF8QfPS
         AVhHGrY3AtDcyQ71FYkhumtUA6U4cmUBepifhkcjQeGzg8cIVoCwf/zURIyLaGYr0qN0
         TpXw==
X-Forwarded-Encrypted: i=1; AJvYcCXE3T8reYTnoYP0ST1Rn8FNGPW/kOokzYyTxf3jVrTkn7/XGNSkbjE80eKCuetxIMu6+snbR12B3iarxLPS@vger.kernel.org
X-Gm-Message-State: AOJu0YyLA9DFglBySoTI61ntcwoChxYJOsoTyU5GLszm8kIw22LloQow
	5K/KzvPwAgPga7dkmWlMzJMs6PQPrr7lhV+KbCINjTK9b8ShLlXWJpTPjsLUWvA=
X-Gm-Gg: ASbGncvoSvncI0dHvQgZwccWbjbUSQbpkxIif77PIE/n3IUhHhYfGrrpx+JkUb8Wvb2
	rIARRnn4ZqOElRwTAQld9wF1B6mJYiA7Y5uvMgNIFiInasUmcxSOaZM1LT+rizF3HXT7OmNUWCY
	VQ7nwxpfhBN/3dw2yCMRolP/3yB8WzEPG5RU9rWO5evFCwKc2yNXcIIVOkz7MhrFJPUkp5M8QEH
	XlJTEJfB7/fU4tVyE9EWkzX/VywfuCNCphWZdSjReJO8q7DMiZu4V5gSuq9Y+FukZxRka2ar/Gj
	QOqYU8KJi4A4nMdhFVeKj13VKZOPpjYDR4DRylZWa9D4mOfIZL5cki4QCkI=
X-Google-Smtp-Source: AGHT+IHDzigQwi0DXKNTTvrI6dAzuy0/qVH6eDt2z96EgR9kgCoEGE68Cpd3v2u2Rol8moLYYzeeWw==
X-Received: by 2002:a05:600c:34ca:b0:43c:f4b3:b094 with SMTP id 5b1f17b1804b1-43ecf81c1damr153863255e9.6.1744132975526;
        Tue, 08 Apr 2025 10:22:55 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:b839:1d6e:de05:bd7f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b8ad6sm15834160f8f.56.2025.04.08.10.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 10:22:55 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 08 Apr 2025 19:22:47 +0200
Subject: [PATCH] serial: msm: Configure correct working mode before
 starting earlycon
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-msm-serial-earlycon-v1-1-429080127530@linaro.org>
X-B4-Tracking: v=1; b=H4sIAGZb9WcC/x3MTQqAIBBA4avErBswsd+rRAvRqQZKQyEK6e5Zy
 7f4XoJIgSnCUCQIdHJk73JUZQFm1W4hZJsbpJC1UKLDPe74Gb0h6bDdxjtUprazbjup+gayPAL
 NfP3XcXqeF9Wj3NVlAAAA
X-Change-ID: 20250408-msm-serial-earlycon-4c5dfa782496
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 Sam Day <me@samcday.com>
X-Mailer: b4 0.14.2

The MSM UART DM controller supports different working modes, e.g. DMA or
the "single-character mode", where all reads/writes operate on a single
character rather than 4 chars (32-bit) at once. When using earlycon,
__msm_console_write() always writes 4 characters at a time, but we don't
know which mode the bootloader was using and we don't set the mode either.

This causes garbled output if the bootloader was using the single-character
mode, because only every 4th character appears in the serial console, e.g.

  "[ 00oni pi  000xf0[ 00i s 5rm9(l)l s 1  1 SPMTA 7:C 5[ 00A ade k d[
   00ano:ameoi .Q1B[ 00ac _idaM00080oo'"

If the bootloader was using the DMA ("DM") mode, output would likely fail
entirely. Later, when the full serial driver probes, the port is
re-initialized and output works as expected.

Fix this also for earlycon by clearing the DMEN register and
reset+re-enable the transmitter to apply the change. This ensures the
transmitter is in the expected state before writing any output.

Cc: stable@vger.kernel.org
Fixes: 0efe72963409 ("tty: serial: msm: Add earlycon support")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/tty/serial/msm_serial.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/tty/serial/msm_serial.c b/drivers/tty/serial/msm_serial.c
index 1b137e06844425584afe5d3f647e9537c6e2d658..3449945493ceb42369d2acafca925350fccc4f82 100644
--- a/drivers/tty/serial/msm_serial.c
+++ b/drivers/tty/serial/msm_serial.c
@@ -1746,6 +1746,12 @@ msm_serial_early_console_setup_dm(struct earlycon_device *device,
 	if (!device->port.membase)
 		return -ENODEV;
 
+	/* Disable DM / single-character modes */
+	msm_write(&device->port, 0, UARTDM_DMEN);
+	msm_write(&device->port, MSM_UART_CR_CMD_RESET_RX, MSM_UART_CR);
+	msm_write(&device->port, MSM_UART_CR_CMD_RESET_TX, MSM_UART_CR);
+	msm_write(&device->port, MSM_UART_CR_TX_ENABLE, MSM_UART_CR);
+
 	device->con->write = msm_serial_early_write_dm;
 	return 0;
 }

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250408-msm-serial-earlycon-4c5dfa782496

Best regards,
-- 
Stephan Gerhold <stephan.gerhold@linaro.org>


