Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BADFD13C5A
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 May 2019 01:55:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726957AbfEDXzk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 4 May 2019 19:55:40 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:47048 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726846AbfEDXzk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 4 May 2019 19:55:40 -0400
Received: by mail-wr1-f67.google.com with SMTP id r7so12387911wrr.13
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 May 2019 16:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lisden-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=GDB9rpdI1gIEGcOY6F70S6f/TLmql3cwwMlQb2ILgJ4=;
        b=ZDAaqS+FqEa4RjomX+SAxdiLsfidRBidHiX4r9ApoJQktSV48YuXnv0xklym1RJX1F
         fhU3CdPGqNGT/ShDA0t6NPHwPL8FMeCYjFf8VFTcb7tfxZSKU8umfEfnkZjhOqnxx3+1
         xY2LS+1vJ4iK0jXC5fc2ZsKIlhzOjNW++j0E0tjew148SecRV024zxPH/KeQNZxj0Hk2
         5frVgN8QeUZo2sqGOA9aNe71eetBHhn+xbP6BywWktn3BhqNh+8sskfwGNiNdbA84BTz
         yJ9dmOlL5kLhUDgZJ2+ynzJOPG9+iWP+2QE26PcJ6xuN23al/VxvVTGJzp6BG5T5d1cI
         Q5jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=GDB9rpdI1gIEGcOY6F70S6f/TLmql3cwwMlQb2ILgJ4=;
        b=Zq8XwPjb8MsfrwJFDBB9jY9n3wHHWE+xItSlM4Y9UYdC/wN4gNjTLg5FM8gRzbnAoT
         S5IE33n36QG7R9jyTch7V33SxCvBJhWcc6h+sMGHx+LSxEtzJEXkPBXG21Kas6a8TU7H
         LVUFcosdtoMFzzmmAziG4yusVS5e3csIcsdPU/E93LCHnBTqAMheExsTZ52MqOe6HUMe
         Nu8yc4NXgSFNZDr+jBC51LJzr6uS5CPHgE+u893hpNH+CTcEpCiyKamhdlA/lD4thUyH
         nqEPb9PygmahRW2xggiRwECM4nVSHnIFmgQ5+E5rJ1bAnk4mBFwldQwAqpwI4ncuFMf+
         qpJA==
X-Gm-Message-State: APjAAAVkD30xpq2LZ3zgxy4atmkROVc1dazpzZFCi7mPZkJswX1NmVPO
        Az8aTwyv9v5qZmzx4Y4HUjlBnkBTh1QlgQ==
X-Google-Smtp-Source: APXvYqyhqdnEQ75rjB47BBbbEnrMmPQA5dMiL0rMapMSUnUXEwoE3B2VXSS+ZyelPlCj6Nt3Jnv46A==
X-Received: by 2002:a5d:6886:: with SMTP id h6mr12174166wru.298.1557014138817;
        Sat, 04 May 2019 16:55:38 -0700 (PDT)
Received: from precision5510.lan (dsl-217-155-248-78.zen.co.uk. [217.155.248.78])
        by smtp.gmail.com with ESMTPSA id r2sm15194634wrr.65.2019.05.04.16.55.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sat, 04 May 2019 16:55:38 -0700 (PDT)
From:   Kelvin Lawson <klawson@lisden.com>
To:     linux-arm-msm@vger.kernel.org, todor.tomov@linaro.org
Cc:     Kelvin Lawson <klawson@lisden.com>
Subject: [PATCH] i2c-qcom-cci: Support repeated start mode.
Date:   Sun,  5 May 2019 00:55:33 +0100
Message-Id: <1557014133-24388-1-git-send-email-klawson@lisden.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Support repeated start mode. Don't send a STOP if it's part
of a group of transactions (e.g. write of register address followed by a
register value read).

Signed-off-by: Kelvin Lawson <klawson@lisden.com>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 143e44d..1032e16 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -512,7 +512,8 @@ static int cci_i2c_read(struct cci *cci, u16 addr, u8 *buf, u16 len)
 	return 0;
 }
 
-static int cci_i2c_write(struct cci *cci, u16 addr, u8 *buf, u16 len)
+static int cci_i2c_write(struct cci *cci, u16 addr, u8 *buf, u16 len,
+			 int disable_stop)
 {
 	u8 master = 0;
 	u8 queue = QUEUE_0;
@@ -533,7 +534,8 @@ static int cci_i2c_write(struct cci *cci, u16 addr, u8 *buf, u16 len)
 	writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, queue));
 
 	i = 0;
-	load[i++] = CCI_I2C_WRITE | len << 4;
+	load[i++] = (disable_stop ? CCI_I2C_WRITE_DISABLE_P : CCI_I2C_WRITE)
+		    | len << 4;
 
 	for (j = 0; j < len; j++)
 		load[i++] = buf[j];
@@ -557,6 +559,13 @@ static int cci_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 	struct cci *cci = i2c_get_adapdata(adap);
 	int i;
 	int ret = 0;
+	int disable_stop = 0;
+
+	/*
+	 * Use repeated start (no STOP bit on writes) if this is a group of
+	 * transactions (e.g. write register address followed by read data).
+	 */
+	disable_stop = num > 1;
 
 	for (i = 0; i < num; i++) {
 		if (msgs[i].flags & I2C_M_RD)
-- 
2.7.4

