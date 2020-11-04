Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B64492A733C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Nov 2020 00:54:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387631AbgKDXw7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Nov 2020 18:52:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387548AbgKDXvn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Nov 2020 18:51:43 -0500
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97150C0613CF;
        Wed,  4 Nov 2020 15:51:42 -0800 (PST)
Received: by mail-lj1-x241.google.com with SMTP id p15so310112ljj.8;
        Wed, 04 Nov 2020 15:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=036o7Gwi84M0Z4FunrHSfNJICQ3sZhXNjVSeaAv5Ias=;
        b=aS3QSfBGy3b0UHi2bGJmW9bgRnhj4QCXyj8tXs/SXrXX5xfyEFir9lNKrlNu6t5A0C
         3BPzMrMIqzhNYdPSaRdfL6bgw9uLSjpw7RvYk20XwPrA43FdNbe5G9blGDnIB163AyOV
         rLPSXhSms9AXI6poVCO4uZySysiVUFXCsgzcCt0B/Et2pCDcQuGeXu+H1MMGgKz3DnyP
         RXvJGSQ8YYobfHfFDDcwZOeXDp0HDBXpXFpVPz7eSAdyxgXa3nJK65axe0juqQ6QSnmm
         BI5gR6XdQ+Fw6fba52GCqzpS/x9rEJcInNEN9gDFXoV0xyQvEqTOUZtPG13cVgdekQna
         WJuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=036o7Gwi84M0Z4FunrHSfNJICQ3sZhXNjVSeaAv5Ias=;
        b=lVQAvOnPmY8LczFrWUo/fHpkuhKGhFRcv/vG80XXyjeC0e7ZiFuxLKTuCLpjrS1r8L
         qYdkxpQZSqQect+5kjmVarG2DIZt3WxkbwwiIZkxn+KRDvZWr4UdkCrsKlNl4PuckKCa
         xhuoIxH6qRQ8mRItSeS4T4gJ2lLa2CwzbqqwF9L2DuTvBiNU/kRIqkQfelKEKeL6tb22
         +0qZN/EegZptAT9XoolaCnPjJF9hlXpv5Nn0xqzcUf8rzrH9KJtuaXQbfKJ2akyTfsMc
         B0EdQ9r6ZtoReF/qBQax3XkpysnWk4Kl09hnPCSYFl7vFq3Clz4oho3ZCznQAy3wXAOP
         4YUw==
X-Gm-Message-State: AOAM5335XnAPeVRhtZcT86y7nmaS3HOMMPihXymC9R5fgPtdjFbZXsBj
        9iQ6YjbJ/ynh9OT2XQBGK3c=
X-Google-Smtp-Source: ABdhPJy0vPhoLasuJDPnL4K153tfvEZGMvyQUN4ZYrjAir0MLYG4+9CxVYCwnjTKbRbQLQ44sSnJOw==
X-Received: by 2002:a05:651c:cc:: with SMTP id 12mr143422ljr.191.1604533901162;
        Wed, 04 Nov 2020 15:51:41 -0800 (PST)
Received: from localhost.localdomain (h-155-4-221-112.NA.cust.bahnhof.se. [155.4.221.112])
        by smtp.gmail.com with ESMTPSA id 65sm540782lfe.96.2020.11.04.15.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 15:51:40 -0800 (PST)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jiri Slaby <jirislaby@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH] tty: serial: msm_serial: Constify msm_uart_pops
Date:   Thu,  5 Nov 2020 00:51:34 +0100
Message-Id: <20201104235134.17793-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The only usage of msm_uart_pops is to assign its address to the ops
field in the uart_port struct, which is a pointer to const. Make it
const to allow the compiler to put it in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/tty/serial/msm_serial.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/msm_serial.c b/drivers/tty/serial/msm_serial.c
index 87f005e5d2af..18e16159aabb 100644
--- a/drivers/tty/serial/msm_serial.c
+++ b/drivers/tty/serial/msm_serial.c
@@ -1525,7 +1525,7 @@ static void msm_poll_put_char(struct uart_port *port, unsigned char c)
 }
 #endif
 
-static struct uart_ops msm_uart_pops = {
+static const struct uart_ops msm_uart_pops = {
 	.tx_empty = msm_tx_empty,
 	.set_mctrl = msm_set_mctrl,
 	.get_mctrl = msm_get_mctrl,
-- 
2.29.2

