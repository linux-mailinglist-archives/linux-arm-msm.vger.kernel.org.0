Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2B94185083
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2020 21:47:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727210AbgCMUrW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Mar 2020 16:47:22 -0400
Received: from mail-pj1-f66.google.com ([209.85.216.66]:54392 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726926AbgCMUrV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Mar 2020 16:47:21 -0400
Received: by mail-pj1-f66.google.com with SMTP id np16so4739907pjb.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2020 13:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZnKWe5Bitvm6HNCJn4nVCZ5y8dNJJUHTl0yto409qyY=;
        b=OLfls09rQF1wozKG2lePYqatpiYhqrd+Eq4NXV+WaxGp0AwpkZyKs5j5H9Czd89YJu
         Lnkds9VKW8VGN7M2OfoTvQEAy8tP8W+TAbAM3dxbO3XCD0fAg3d6VeyauoU1/ZIWL1pr
         K5CzAYa0jVWTBcascq4e5bUIUdJoyaCCDsJ9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZnKWe5Bitvm6HNCJn4nVCZ5y8dNJJUHTl0yto409qyY=;
        b=UbC8QXTzTVMjmHQcPEjFNqq4ioQ0LVPrZH2xzHczXQeO/51GROorqVvKeum5ECr6FD
         DGboe+INxsc0oawyZyMvFZNeNBLEqiytCvavtjR74wp2GgzKOpS2+mKlEWXN8qjjjiOR
         UhCSfXn2Ky+uZoLotYk3bhSyReUh93wIqUs5/nRMpn2LHQ5tBzFrpxJDuZ9K3VOI7p7k
         Ne3pepzKi087mq+N7fHKZSuiVxW5v+joxWXoLMHkzELfPzchHXDwFt1SKMdqb/WD8xiY
         Bo3XBHzsZIfi/dIY4fxJC4AoJhOF2ZQVNzqfQ2iXAdlaxNWBTzF44xcabtbk99E1/LbY
         X4+g==
X-Gm-Message-State: ANhLgQ3AMpiMKMccqkKSI3AiYhCLUdK0ijKeZJQIgwk+af4W7pIY+jNm
        AMeXOMZwIRpvAsqtQpIj3mlYKg==
X-Google-Smtp-Source: ADFU+vsiBDRZxQvqlXgHWXpfQHmmGpQZZfBg2hu2n/nkhiFxNIU+yUk+rbuPivW6v98RkDC1VvQKZQ==
X-Received: by 2002:a17:90b:3711:: with SMTP id mg17mr10382797pjb.73.1584132440939;
        Fri, 13 Mar 2020 13:47:20 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id a13sm26532278pfc.24.2020.03.13.13.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 13:47:20 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     gregkh@linuxfoundation.org
Cc:     mka@chromium.org, swboyd@chromium.org, ryandcase@chromium.org,
        bjorn.andersson@linaro.org, akashast@codeaurora.org,
        skakit@codeaurora.org, rojay@codeaurora.org,
        mgautam@codeaurora.org, Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Doug Anderson <dianders@google.com>,
        Girish Mahadevan <girishm@codeaurora.org>,
        Jiri Slaby <jslaby@suse.com>,
        Karthikeyan Ramasubramanian <kramasub@codeaurora.org>,
        Sagar Dharia <sdharia@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: [PATCH 1/2] tty: serial: qcom_geni_serial: No need to stop tx/rx on UART shutdown
Date:   Fri, 13 Mar 2020 13:46:51 -0700
Message-Id: <20200313134635.1.Icf54c533065306b02b880c46dfd401d8db34e213@changeid>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On a board using qcom_geni_serial I found that I could no longer
interact with kdb if I got a crash after the "agetty" running on the
same serial port was killed.  This meant that various classes of
crashes that happened at reboot time were undebuggable.

Reading through the code, I couldn't figure out why qcom_geni_serial
felt the need to run so much code at port shutdown time.  All we need
to do is disable the interrupt.

After I make this change then a hardcoded kgdb_breakpoint in some late
shutdown code now allows me to interact with the debugger.  I also
could freely close / re-open the port without problems.

Fixes: c4f528795d1a ("tty: serial: msm_geni_serial: Add serial driver support for GENI based QUP")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/tty/serial/qcom_geni_serial.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 272bae0eebc7..09d8612517aa 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -827,17 +827,11 @@ static void get_tx_fifo_size(struct qcom_geni_serial_port *port)
 
 static void qcom_geni_serial_shutdown(struct uart_port *uport)
 {
-	unsigned long flags;
-
 	/* Stop the console before stopping the current tx */
 	if (uart_console(uport))
 		console_stop(uport->cons);
 
 	disable_irq(uport->irq);
-	spin_lock_irqsave(&uport->lock, flags);
-	qcom_geni_serial_stop_tx(uport);
-	qcom_geni_serial_stop_rx(uport);
-	spin_unlock_irqrestore(&uport->lock, flags);
 }
 
 static int qcom_geni_serial_port_setup(struct uart_port *uport)
-- 
2.25.1.481.gfbce0eb801-goog

