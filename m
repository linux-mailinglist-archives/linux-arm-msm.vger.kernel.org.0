Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAD116402A3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Dec 2022 09:57:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231904AbiLBI5C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Dec 2022 03:57:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232745AbiLBI4I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Dec 2022 03:56:08 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D03EABE4F4
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Dec 2022 00:56:04 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id j5-20020a05600c410500b003cfa9c0ea76so3711218wmi.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Dec 2022 00:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hrodxjE3++JzSf9Q5uxlAVuutjj+cagca/Bct4wXLdY=;
        b=tIuPN7gVpzhf5tzAOu1OwiGIo8Y2MQmTpARnakTsWoSGJ5neM8dBZrSunMVPCJ7q4C
         IIHyD0b4thOp5VkFipRYdtXOUrCbI8TYsFNYGL4XhEIBxHTaNwwHkRb94WFirpaLkMwu
         qHKmGg7Tft980XwnRXwD4wE+IJUHxEqVNRGDemAZRniDFh+j5FNwrLZ39s8vUjNgv/HD
         84tTBYV8nhrii+zA7SdX4Crpr5yJMNqLwajxOfVj73JmeEty1JP9ptohSQUleAUU4pM7
         m5t/qIA78T3UqJNUSbzIhmu+v0IDgJ45d22b/44mx8Sw6B9xc0zrjMopg1kA6v8VDI1X
         3+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hrodxjE3++JzSf9Q5uxlAVuutjj+cagca/Bct4wXLdY=;
        b=2DHieZIPhk7vb0mj4fnSXkpStQKV9zZ00WnNGpw/4TKp5eQyJmzYhz/iZ9jlBlGT8a
         8U26t18BIG1wfsj4qqVwBCEbFIZR8B60v4YsBoug9ziFoOmfpHedlQ9yW6fr4fS/X9Gy
         zlCzcrnfuzK+wi99GbDdTTrq7OZU2PYV2ZdNgwq7J6wMOYnEFdq63tHJEM3YTY7H8naD
         p/6SfEJA38kDm2chaw43czXkttLocD2+OFlLjbOeCH+9OYNOc06Nb2HBculc5ZYDuSKB
         icUKl7tvr8LtTSaTUcF2slHoqlFiBoMjA+cuLBM0k3Gp+BxqzkPZewUyKWq7GPYpxqxE
         Or3w==
X-Gm-Message-State: ANoB5pnK/Obis7dy4DBHjFr/SYVIAawwSofAAm3zkweDm8A92eg+hDhE
        K4oifA6h915CTlHIXPAxSyclvw==
X-Google-Smtp-Source: AA0mqf61ZY7CS7HBSf5vp8aAXkwToX/vU8MNJwLF/dElJBE+4oQl0yyFZBodseqLwlp/q6Qd2NdIUQ==
X-Received: by 2002:a05:600c:1907:b0:3cf:7981:9a7 with SMTP id j7-20020a05600c190700b003cf798109a7mr51178838wmq.87.1669971363351;
        Fri, 02 Dec 2022 00:56:03 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:29a4:6f04:ddb1:1ed7])
        by smtp.gmail.com with ESMTPSA id a13-20020adfed0d000000b0024219b1cb1bsm6527517wro.60.2022.12.02.00.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 00:56:02 -0800 (PST)
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
Subject: [PATCH v5 06/14] tty: serial: qcom-geni-serial: refactor qcom_geni_serial_isr()
Date:   Fri,  2 Dec 2022 09:55:46 +0100
Message-Id: <20221202085554.59637-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221202085554.59637-1-brgl@bgdev.pl>
References: <20221202085554.59637-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Simplify the conditions in qcom_geni_serial_isr() and fix indentation.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/tty/serial/qcom_geni_serial.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index ec2523736e99..fba02f71a874 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -827,20 +827,18 @@ static irqreturn_t qcom_geni_serial_isr(int isr, void *dev)
 
 	if (m_irq_status & m_irq_en & (M_TX_FIFO_WATERMARK_EN | M_CMD_DONE_EN))
 		qcom_geni_serial_handle_tx(uport, m_irq_status & M_CMD_DONE_EN,
-					geni_status & M_GENI_CMD_ACTIVE);
+					   geni_status & M_GENI_CMD_ACTIVE);
 
-	if (s_irq_status & S_GP_IRQ_0_EN || s_irq_status & S_GP_IRQ_1_EN) {
+	if (s_irq_status & (S_GP_IRQ_0_EN | S_GP_IRQ_1_EN)) {
 		if (s_irq_status & S_GP_IRQ_0_EN)
 			uport->icount.parity++;
 		drop_rx = true;
-	} else if (s_irq_status & S_GP_IRQ_2_EN ||
-					s_irq_status & S_GP_IRQ_3_EN) {
+	} else if (s_irq_status & (S_GP_IRQ_2_EN | S_GP_IRQ_3_EN)) {
 		uport->icount.brk++;
 		port->brk = true;
 	}
 
-	if (s_irq_status & S_RX_FIFO_WATERMARK_EN ||
-					s_irq_status & S_RX_FIFO_LAST_EN)
+	if (s_irq_status & (S_RX_FIFO_WATERMARK_EN | S_RX_FIFO_LAST_EN))
 		qcom_geni_serial_handle_rx(uport, drop_rx);
 
 out_unlock:
-- 
2.37.2

