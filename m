Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A25DE6402B1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Dec 2022 09:57:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233050AbiLBI5g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Dec 2022 03:57:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232881AbiLBI47 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Dec 2022 03:56:59 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AC19C1BFF
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Dec 2022 00:56:09 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id z4so6801940wrr.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Dec 2022 00:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Oo6s6EUUJAHLwqnGgZFQJNt6SIn7i9VCkQpm/Vrbzo=;
        b=kV1V5/gf8m5wqxaEveJyek5uZa0ea5mtXODUbKxzKlTcGhFaB+WjfI13Y0zcfaTHC9
         YQeJbqAkcNvWF+yIkB5sJT81q5wAPbAKZfA0JzizaToD+pe8cyVNtumveJef6nqY9AsL
         Qp9F8dI6KJm+e+UJe5KTHrSkT0GoRNPcqriNW03miil0WG/fqGOTdaR9f7atgurt4el+
         xyQsC+CKE2TXOr0M884NB0w809S0tO8hvSK1NOrcmvconJt5H/4UKWiYO2MgEqMQagwy
         D35/+zHdyZg7J78iORM92uBTWPm0Q6Nw6V/OE0A3KU1G/PC9KPjA2fCIHUHJ08CaxAOh
         8Mow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Oo6s6EUUJAHLwqnGgZFQJNt6SIn7i9VCkQpm/Vrbzo=;
        b=5UbxpPCwbS4PD2cAyt+SQ7ySK4xATTZ7bQGxtZ0q6o74tjbTK/+Iw/SwLya9dPvZIE
         tADKds1QQOJuEdTFBj7L57eMtWVBadrBFso7vPoOyhlWt2dwbkb+xPyBS+9PrAW4Ou8D
         3OqvS0GkURPS7J7tK46divIvnY8cp3DxeoLIUIAYW2OKaR8qaW00SiimRWwuibqD5Cn+
         0Z4nT8VOFeWuaVZrqvIJJHM6mBIYM2Eh3+hLkqhU14i7YbzwqynzxOOl2KTfJpekSxtH
         wBPH4ba2pAumEAvhi+xHyaXgRHUqaDVCNSlLI/CsvF7bMdWZcfanUWvQVJD5MAe3l5ZP
         AlXA==
X-Gm-Message-State: ANoB5plrkr5SW2fP+U5GI5U+JVFpOrS68v58f82luAkOQfVUFuDFs1Ns
        zDSTz1Od6oYkkNhpQ6EqqivPBA==
X-Google-Smtp-Source: AA0mqf4gv7CkQGJ5xzltg8br8MDWvvzUCeW/vPwG10FoEJPgIhv1Nh1/urLMkOjDJULRmqFKI+23PQ==
X-Received: by 2002:a5d:4d51:0:b0:242:1bad:6f79 with SMTP id a17-20020a5d4d51000000b002421bad6f79mr14035680wru.342.1669971369107;
        Fri, 02 Dec 2022 00:56:09 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:29a4:6f04:ddb1:1ed7])
        by smtp.gmail.com with ESMTPSA id a13-20020adfed0d000000b0024219b1cb1bsm6527517wro.60.2022.12.02.00.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 00:56:08 -0800 (PST)
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
Subject: [PATCH v5 12/14] tty: serial: qcom-geni-serial: stop operations in progress at shutdown
Date:   Fri,  2 Dec 2022 09:55:52 +0100
Message-Id: <20221202085554.59637-13-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221202085554.59637-1-brgl@bgdev.pl>
References: <20221202085554.59637-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We don't stop transmissions in progress at shutdown. This is fine with
FIFO SE mode but with DMA it causes trouble so fix it now.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/tty/serial/qcom_geni_serial.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 808b0250d51e..1dfc0122ff53 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -864,6 +864,8 @@ static void get_tx_fifo_size(struct qcom_geni_serial_port *port)
 static void qcom_geni_serial_shutdown(struct uart_port *uport)
 {
 	disable_irq(uport->irq);
+	qcom_geni_serial_stop_tx(uport);
+	qcom_geni_serial_stop_rx(uport);
 }
 
 static int qcom_geni_serial_port_setup(struct uart_port *uport)
-- 
2.37.2

