Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D1CA11DAA0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2019 01:09:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731762AbfLMAI7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Dec 2019 19:08:59 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:38556 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731759AbfLMAI6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Dec 2019 19:08:58 -0500
Received: by mail-pl1-f195.google.com with SMTP id a17so387902pls.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2019 16:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=googlenew;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pf5ob1U+UmoKzgDEzAnzQgACPOvLCz33gyddDWcn/3Q=;
        b=gG+e7w/TGyyz+ZaD86YvhLiM8336JsknsKMNUHmpJax11tUtppv6QhFeVOS1Fdwcq2
         d9lq9ZvjabgLZa44cfOBp6ytNjsU9ABE4+6q3kA0Lz6WoGjOJgtEYBfZRX7ms9KVk0uV
         Rb0g/8Km+YNXdbqkjrnByC5oIkZipi1aC73gbqropB+icwL8aCMKTsOnkzMVr1Sr3QuI
         3ULYFXs9p+O8J4XEKCp9lFINfoMiLayVAGcKilgWQPs1W87lNfVV81ZYGQymCUJZeE19
         aBEX469mRgpMsghnIScJnurtL1MYj2Jl3onYn9yOpvLYgdktbB/ds6ew9MYzx6aS28xU
         TXvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pf5ob1U+UmoKzgDEzAnzQgACPOvLCz33gyddDWcn/3Q=;
        b=n0OWdpe//rNbSYVSBkxFBV32LKXS0aDuINtUGnoxHUbi0BwuaG/J6KdjCTj4dnIH8p
         vHAul9GVXYu4MV7sE3g/R4BJtwFsZhLxPRAvVt7nBZApHs1za3HKhZZ43lDwiiFu9V3y
         e7gjUL18YCqSNnCuv7Sn4NMotxVYBd67z3v6U2N996BeRsjulXYVy15L9SMue2FkYPz9
         JdFFUWLJFmwh7udKkuN3em8fUFovzS3W8JOw3QSRQlZHX9nkR8O0U9uQpEoPbU+BH9Rk
         auteVc7YYe4qsvK1P5owKV06xCjUrHZw4AtpHen15CiJuEIC7xVuan4M+EQbkMP+Icx8
         S9wQ==
X-Gm-Message-State: APjAAAVUC4KCtweCL7ysDO5B0XJVa9RNGP+XY3JGVwUTzbalU3cBxozO
        LlbEw0Ea2CGx4Rp2DlchYYlpcA==
X-Google-Smtp-Source: APXvYqyHTbGmqYibkbM8oEcdOzkAtnmMdHELW1D7VRNlqC9GC/KqxwN8jSmAVTbEvEKQQQEfAyNnzA==
X-Received: by 2002:a17:90b:f06:: with SMTP id br6mr13014258pjb.125.1576195737771;
        Thu, 12 Dec 2019 16:08:57 -0800 (PST)
Received: from Mindolluin.ire.aristanetworks.com ([217.173.96.166])
        by smtp.gmail.com with ESMTPSA id j38sm8317647pgj.27.2019.12.12.16.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2019 16:08:57 -0800 (PST)
From:   Dmitry Safonov <dima@arista.com>
To:     linux-kernel@vger.kernel.org
Cc:     Dmitry Safonov <0x7f454c46@gmail.com>,
        Dmitry Safonov <dima@arista.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Vasiliy Khoruzhick <vasilykh@arista.com>,
        linux-serial@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 35/58] tty/serial: Migrate qcom_geni_serial to use has_sysrq
Date:   Fri, 13 Dec 2019 00:06:34 +0000
Message-Id: <20191213000657.931618-36-dima@arista.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191213000657.931618-1-dima@arista.com>
References: <20191213000657.931618-1-dima@arista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The SUPPORT_SYSRQ ifdeffery is not nice as:
- May create misunderstanding about sizeof(struct uart_port) between
  different objects
- Prevents moving functions from serial_core.h
- Reduces readability (well, it's ifdeffery - it's hard to follow)

In order to remove SUPPORT_SYSRQ, has_sysrq variable has been added.
Initialise it in driver's probe and remove ifdeffery.

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Signed-off-by: Dmitry Safonov <dima@arista.com>
---
 drivers/tty/serial/qcom_geni_serial.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index ff63728a95f4..c41c766d6c7c 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1,10 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2017-2018, The Linux foundation. All rights reserved.
 
-#if defined(CONFIG_SERIAL_QCOM_GENI_CONSOLE) && defined(CONFIG_MAGIC_SYSRQ)
-# define SUPPORT_SYSRQ
-#endif
-
 #include <linux/clk.h>
 #include <linux/console.h>
 #include <linux/io.h>
@@ -1308,6 +1304,7 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 	uport->irq = irq;
+	uport->has_sysrq = IS_ENABLED(CONFIG_SERIAL_QCOM_GENI_CONSOLE);
 
 	irq_set_status_flags(uport->irq, IRQ_NOAUTOEN);
 	ret = devm_request_irq(uport->dev, uport->irq, qcom_geni_serial_isr,
-- 
2.24.0

