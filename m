Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40C2A6339DA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Nov 2022 11:23:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233557AbiKVKXF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Nov 2022 05:23:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233510AbiKVKWA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Nov 2022 05:22:00 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7845831FA8
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Nov 2022 02:21:47 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id 5so10366224wmo.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Nov 2022 02:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EonL2PwB0Makj2JepNmLczYfWSZatIPogqShuTJezMI=;
        b=R6ndji7+Z7eIGI+xSLKlf1o4GusY5/a6I5ZysX39NUiu7KpKfdXWgeXYc+71C0WmTH
         jVkqWnAB4XPTlrikOJiwnfswZOD1AEVX9BALyKNi0eXQLb2hu++iL6obIRd63rOpi31p
         VysrjF1RhgWa7jfLrPlUUS42wlrvWBD2tqcOKo0U7LI7tqhHJQjx2lF53YbONT9oABvI
         jheecx0OTkOSLhwTATg1kneO3685gDluzpuqQeE6nTD10t0ioc3J3Q3WX7qLCX9HNmow
         H3qB0hyXuw16p0W9EJo4sDEEll4R+J1SeUJxC7y3E9nsZGYedXsgu1TX/C/LYIjyeVI7
         u4iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EonL2PwB0Makj2JepNmLczYfWSZatIPogqShuTJezMI=;
        b=OH7tHOBZo0QgFR3cbF6nn0oD0biGHSJ+GGSy8qwysbywMBj9+LO3ibMD2kFmmLo0Cz
         rrPfTiEzWtDsgLAlJTsw37Y8+RjPC2g/zngHIV/+vG5lAnJqzn0DnKEuwRaMPcCe8Lix
         J00V4cgXCZU+r3iTmGITkSkBKe4OyxTKCy4JYk6rozc/ruAlSexkf+5bX5q6yJBqUa6H
         MKJFc7ILgATEdQAwrv3ClAkIUBfwJlIGyJmLOYxGlPSs0vofuMIMt6zTVmoLCudrbkZ/
         EHE1Qnc0zSqESxIT01hJR2Z2GzKezn5QmzlwogXl3C6LO59oP4/Z8w2RdFJ216lkM0bc
         +/NQ==
X-Gm-Message-State: ANoB5pmwtugqSY3/xRNdX8ZnoaY4qBLb2E9WgXBcWf/GwO/ubMloHDMN
        8JxfXiOUjeL9zfetP5EAtra66w==
X-Google-Smtp-Source: AA0mqf7cRrXhN9arwVRnH24U7LCs3wdGp0G6juccAYxDgpazIFKTojBbdSMahG5er82LNH9gGuxg3Q==
X-Received: by 2002:a05:600c:4e8d:b0:3c7:6e1:b5c9 with SMTP id f13-20020a05600c4e8d00b003c706e1b5c9mr9520274wmq.154.1669112506011;
        Tue, 22 Nov 2022 02:21:46 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:e011:9e81:66f1:3415])
        by smtp.gmail.com with ESMTPSA id o3-20020a5d4083000000b002366e8eee11sm13432873wrp.101.2022.11.22.02.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 02:21:45 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Alex Elder <elder@kernel.org>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v2 05/15] tty: serial: qcom-geni-serial: remove stray newlines
Date:   Tue, 22 Nov 2022 11:21:15 +0100
Message-Id: <20221122102125.142075-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221122102125.142075-1-brgl@bgdev.pl>
References: <20221122102125.142075-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Remove stray newlines around #ifdefs for consistency with the rest
of the driver code.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/tty/serial/qcom_geni_serial.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index e4139718e084..ec2523736e99 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -320,7 +320,6 @@ static void qcom_geni_serial_abort_rx(struct uart_port *uport)
 }
 
 #ifdef CONFIG_CONSOLE_POLL
-
 static int qcom_geni_serial_get_char(struct uart_port *uport)
 {
 	struct qcom_geni_private_data *private_data = uport->private_data;
@@ -545,7 +544,6 @@ static int handle_rx_console(struct uart_port *uport, u32 bytes, bool drop)
 {
 	return -EPERM;
 }
-
 #endif /* CONFIG_SERIAL_QCOM_GENI_CONSOLE */
 
 static int handle_rx_uart(struct uart_port *uport, u32 bytes, bool drop)
-- 
2.37.2

