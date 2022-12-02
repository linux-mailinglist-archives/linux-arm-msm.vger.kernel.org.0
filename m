Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C955664029E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Dec 2022 09:56:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232724AbiLBI43 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Dec 2022 03:56:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232681AbiLBI4H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Dec 2022 03:56:07 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86530BF67C
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Dec 2022 00:56:03 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id c65-20020a1c3544000000b003cfffd00fc0so5995342wma.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Dec 2022 00:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EonL2PwB0Makj2JepNmLczYfWSZatIPogqShuTJezMI=;
        b=oYHsfMhWwfknAvnmTRMSqU/q/3vAa10G9tV9dKVIdu3glvD97Ggh8LCKJcLKJYuMWr
         39gIPP5ACetaVmqK9PSTa8JGh9D+rs0sB0vkXxUEbc9JVLIEahNAo1JI4qVkFsO5X4/q
         ReKJoyZ0NwMRRCxrXAhqHFMufaG/voSwTm5PynZX5x8JWq2c6VHcHyYuMZkcduzzSlAL
         4KH+GH5+QtJtKrHh6ho6GoSd3vEX8spxcUM+Xt0GOjiNaNkqWKOCo1G63T/r5Qy8tAw9
         JreMs3/y+VWhGRRw7CMAxG8cytxUyBtesK5VP2YdtBEFcXKQK6//F68gV8T8z/24Dx4t
         NFqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EonL2PwB0Makj2JepNmLczYfWSZatIPogqShuTJezMI=;
        b=sLVBcPwqiKWn1NQi3RDWBqbLqZzdB2KcfKunTra8yEktaREArSVBqFI42oBeF+Tara
         HBMcZD20Y5W48DbuNJTFZOQyWLH7Q9uOx2P+RTFvXC5x4la8WJardJolvm53tJ1BUQds
         In79uiZpj5CuEM7nj+6tl812N78j2eENZvqndqJUFfCixNZULHi0I1e8UgXTYhc5jVuO
         p9jopIe4jXBYdNVlCaVrIZSln/PcU5U0Azmkwh8hfqpgXzqk79XfZw/A9g5JnjBSADnI
         zPZ+5Ld7WurvVvuyqotsjpBrIShfqR4UvXKalQD0zMLYvURA82Fd9GK6ajEK9qrrWQwL
         4vLg==
X-Gm-Message-State: ANoB5plA44FPY+3AQVVYW+2zGgTL1+1+uEFvxlVKUW7LWqj2hyvNLeip
        l0JizBM9r+Dgi5Ik6xBItzOwDSsphxSpWJb7
X-Google-Smtp-Source: AA0mqf5qrryfLIvfLKURGncF5Wse92/xU0XhkhhVwtxC9tg+138vOjqYQUy19hPNNp9E8SqQgyxAsg==
X-Received: by 2002:a05:600c:43d6:b0:3d0:387d:8eb6 with SMTP id f22-20020a05600c43d600b003d0387d8eb6mr31500939wmn.137.1669971362032;
        Fri, 02 Dec 2022 00:56:02 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:29a4:6f04:ddb1:1ed7])
        by smtp.gmail.com with ESMTPSA id a13-20020adfed0d000000b0024219b1cb1bsm6527517wro.60.2022.12.02.00.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 00:56:01 -0800 (PST)
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
Subject: [PATCH v5 05/14] tty: serial: qcom-geni-serial: remove stray newlines
Date:   Fri,  2 Dec 2022 09:55:45 +0100
Message-Id: <20221202085554.59637-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221202085554.59637-1-brgl@bgdev.pl>
References: <20221202085554.59637-1-brgl@bgdev.pl>
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

