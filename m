Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC8DB23E6FF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Aug 2020 07:19:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725845AbgHGFTh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Aug 2020 01:19:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725872AbgHGFTg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Aug 2020 01:19:36 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DF94C061756
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2020 22:19:36 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id h12so341103pgm.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2020 22:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LKoQxM83Uc+FXvx6t5Ymg1IK53B/gKt39Gp0pbNTE/w=;
        b=VyAVOpNiqddmfKMBU5li60da/RuApY8f29CHkpTimPilQ86j/gYbLdXJ1JoEKt6vpD
         d2y9EUvtPB6CzlyDFnlal3mfMmer+GsWBqAAIygnmP1BPWq0yKdn9T5KLNJws9XbR+VJ
         GgtQ18JNlytDCtEX7K8cs1KdMErJEwTQy/v1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LKoQxM83Uc+FXvx6t5Ymg1IK53B/gKt39Gp0pbNTE/w=;
        b=YsQ6ueh5MLUTHp9cO5889PhgqbqcJQD1WdDpORLCYEXrDeqwCTUi4izJkm0EmTQUPi
         /sBIZ+R3ebWHl7FRDDt2tkQDhF3wV5XR2cBdjYixQNBU3z7xNPXlPRizBDOUo8j5KByL
         65k0SpPh2CyovVKM0igbWgZ05bkt0BVV3XcF9OLgktM5FQDPdtggWXnU4xm6o2yUG7fp
         w1Cu31sDLYrAF08KrpwO3lSnnd446ikZlyGY179R1xSLtn0ZPjIy5/k1GlyGo9K6gEU0
         5Kkd7AUvuvTW5s3wYW3deELiyBCJaH/Ws0cmvwiJdjuV8/zkGZ6GH5cQx8yXeS20OFNV
         RNNA==
X-Gm-Message-State: AOAM532t829M7KAPIWh0Hac2IXalnd8dR5R2gOSTPZYldE62PomsAETE
        y+SiV+8Q3VD1QM74PehYhbY9tw==
X-Google-Smtp-Source: ABdhPJyip5WtaSgO5LZF/l7/MXW9QhJe3s0OYmfhC0kSr5YBXvM+tKuZ31k0S09mlDItrxz9IXrAAQ==
X-Received: by 2002:a65:4b85:: with SMTP id t5mr10043682pgq.36.1596777575437;
        Thu, 06 Aug 2020 22:19:35 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id r15sm11381147pfq.189.2020.08.06.22.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2020 22:19:34 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Akash Asthana <akashast@codeaurora.org>,
        kgdb-bugreport@lists.sourceforge.net,
        Mukesh Savaliya <msavaliy@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Evan Green <evgreen@chromium.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: [PATCH] serial: qcom_geni_serial: Fix recent kdb hang
Date:   Thu,  6 Aug 2020 22:19:08 -0700
Message-Id: <20200806221904.1.I4455ff86f0ef5281c2a0cd0a4712db614548a5ca@changeid>
X-Mailer: git-send-email 2.28.0.236.gb10cc79966-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The commit e42d6c3ec0c7 ("serial: qcom_geni_serial: Make kgdb work
even if UART isn't console") worked pretty well and I've been doing a
lot of debugging with it.  However, recently I typed "dmesg" in kdb
and then held the space key down to scroll through the pagination.  My
device hung.  This was repeatable and I found that it was introduced
with the aforementioned commit.

It turns out that there are some strange boundary cases in geni where
in some weird situations it will signal RX_LAST but then will put 0 in
RX_LAST_BYTE.  This means that the entire last FIFO entry is valid.
This weird corner case is handled in qcom_geni_serial_handle_rx()
where you can see that we only honor RX_LAST_BYTE if RX_LAST is set
_and_ RX_LAST_BYTE is non-zero.  If either of these is not true we use
BYTES_PER_FIFO_WORD (4) for the size of the last FIFO word.

Let's fix kgdb.  While at it, also use the proper #define for 4.

Fixes: e42d6c3ec0c7 ("serial: qcom_geni_serial: Make kgdb work even if UART isn't console")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/tty/serial/qcom_geni_serial.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 07b7b6b05b8b..e27077656939 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -361,11 +361,16 @@ static int qcom_geni_serial_get_char(struct uart_port *uport)
 			return NO_POLL_CHAR;
 
 		if (word_cnt == 1 && (status & RX_LAST))
+			/*
+			 * NOTE: If RX_LAST_BYTE_VALID is 0 it needs to be
+			 * treated as if it was BYTES_PER_FIFO_WORD.
+			 */
 			private_data->poll_cached_bytes_cnt =
 				(status & RX_LAST_BYTE_VALID_MSK) >>
 				RX_LAST_BYTE_VALID_SHFT;
-		else
-			private_data->poll_cached_bytes_cnt = 4;
+
+		if (private_data->poll_cached_bytes_cnt == 0)
+			private_data->poll_cached_bytes_cnt = BYTES_PER_FIFO_WORD;
 
 		private_data->poll_cached_bytes =
 			readl(uport->membase + SE_GENI_RX_FIFOn);
-- 
2.28.0.236.gb10cc79966-goog

