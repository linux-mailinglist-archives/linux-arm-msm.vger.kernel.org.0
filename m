Return-Path: <linux-arm-msm+bounces-25750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CC81D92C696
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 01:29:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 59807B21E1B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 23:29:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7619418785E;
	Tue,  9 Jul 2024 23:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LySywCaJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086371FA3
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jul 2024 23:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720567775; cv=none; b=aPwFRh7AU9NjjPMZMNSB3BwMxE6KqZdJ2hRbKQ7NJqKKgAmGQ9ulgxEgcbGoo3Yn0zoSFnN5fGhYVd+Mrnn3c4J6Vym2uVmMXDG+0aeHvrDSCWTDEBkXOC5WFQ9IrJj/oeWLVkFF+e85vn4/xp3cw0yXEFx3JMFpsl03ye/Tbw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720567775; c=relaxed/simple;
	bh=/C+m9G5C1oyrifrND44Mt+NNq1kq4xLtpNHvtlTs6Jc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sU3TMYjoGWyMYheeX6IyFTUFR9+l0E3OAi1pkJwm7GeegL2t/upaj4J+TtdAZqNTdGRisiU112Lw9LlbZeCxEhtw1cwuINBCSbBRP7+9xbxSv2WkZq6Fh348izt4k27/oyqd5olnPk8ZPPlNuNqjw4To8aHQEB+DSpHTAiVSDv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LySywCaJ; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1fb05b0be01so34058125ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jul 2024 16:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1720567773; x=1721172573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kRK2aH8EGZeW0Byt2MUaFYsISDnZuj8/DLaqPgMip44=;
        b=LySywCaJjNi+CAZrbHs4Z2z0C3gpnLSHfmsw2oNlw4muNgtV5DmXwnFeXHAOiM99n1
         6WBeLlfhhrvTlz3AmDTt8L4+GU2qJX9iXlG6YKaBWQDd8oo3D40fKT3iaiSidOZdiXey
         su2aC6D7NhvrMQ7xlx/hgnPKXafYL4YM/bw9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720567773; x=1721172573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kRK2aH8EGZeW0Byt2MUaFYsISDnZuj8/DLaqPgMip44=;
        b=J+HE88gOODj6FFROOSsrrlZ5Rnp3V7yBIgvQWzMnI9lKh40raHbZTuQUgSgNQlyHST
         7GlBrG8DZVmM0zQyF8YL54RL4Je3zQmyWw07hEVjVMRNF/EWUQkrzqcSyYg3yvIvF4bn
         1TGcQzPL7V3+w0zVa4epKmIhwDFc0a2aFmbtHYf2U9uE4r/YYguXKDoBiDDs0Wm/DXKi
         SQzMMXVmkvRCVvQh6QXR+qoYxLWfXbY58x2OeJJNP+4+70Feeg1YjFxIA2jRHg5DJBS4
         TEPSMrINNm4hFkXTCrFFpgPruzNi9rmHkyCRZHkMQxAW+ChGrZ5PvDrvtZ2TE7eF7HmF
         1d7g==
X-Forwarded-Encrypted: i=1; AJvYcCUe+WmjjJlS3heQ0aJlNDsGPlS3jaN0MviZTwX291zbZzhoFCciSs7W5DGLiZuOKPMdtuc3zGgT8tGUTrrmL83U5zqY18YxGygrpoZy1w==
X-Gm-Message-State: AOJu0YxKxZr4URj+JcB9Uw5MdIddtU9PX+Q40i6SB95xD0NeYyTMYlfM
	LxN8jb89TjDvDILNgYJHd/9hVGAmDKRKtcd5SZgArZgufO6LDX5eWqnwBuT6VQ==
X-Google-Smtp-Source: AGHT+IG68wqqdkjCg2HTkpkJ73U3cwNCZ1/dIfTvUZgwAXz7p8+hO34uDRg42cFEf3wMNazOD5hbtQ==
X-Received: by 2002:a17:902:d4c7:b0:1f9:a386:2bbd with SMTP id d9443c01a7336-1fbb6d4408fmr31698325ad.22.1720567773289;
        Tue, 09 Jul 2024 16:29:33 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:1c76:f248:3538:85f7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6ac80a2sm21319745ad.236.2024.07.09.16.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 16:29:32 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH] serial: qcom-geni: Show '@' characters if we have a FIFO underrun
Date: Tue,  9 Jul 2024 16:28:45 -0700
Message-ID: <20240709162841.1.I93bf39f29d1887c46c74fbf8d4b937f6497cdfaa@changeid>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As of commit 2ac33975abda ("serial: qcom-geni: do not kill the machine
on fifo underrun") a FIFO underrun will no longer hard lockup the
machine. Instead, a FIFO underrun will cause the UART to output a
bunch of '\0' characters. The '\0' characters don't seem to show up on
most terminal programs and this hides the fact that we had an
underrun. An underrun is aq sign of problems in the driver and
should be obvious / debugged.

Change the driver to put '@' characters in the case of an underrun
which should make it much more obvious.

Adding this extra initialization doesn't add any real overhead. In
fact, this patch reduces code size because the code was calling
memset() to init 4 bytes of data. Disassembling the new code shows
that early in the function w22 is setup to hold the '@@@@' constant:
  mov     w22, #0x40404040

Each time through the loop w22 is simply stored:
  str     w22, [sp, #4]

Cc: Johan Hovold <johan@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/tty/serial/qcom_geni_serial.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 69a632fefc41..332eaa2faa2b 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -872,10 +872,10 @@ static void qcom_geni_serial_send_chunk_fifo(struct uart_port *uport,
 {
 	struct qcom_geni_serial_port *port = to_dev_port(uport);
 	unsigned int tx_bytes, remaining = chunk;
-	u8 buf[BYTES_PER_FIFO_WORD];
 
 	while (remaining) {
-		memset(buf, 0, sizeof(buf));
+		u8 buf[BYTES_PER_FIFO_WORD] = { '@', '@', '@', '@' };
+
 		tx_bytes = min(remaining, BYTES_PER_FIFO_WORD);
 
 		uart_fifo_out(uport, buf, tx_bytes);
-- 
2.45.2.803.g4e1b14247a-goog


