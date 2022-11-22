Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D4846339DB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Nov 2022 11:23:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233512AbiKVKXG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Nov 2022 05:23:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233523AbiKVKWB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Nov 2022 05:22:01 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 747301FF9B
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Nov 2022 02:21:48 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id z4so9385296wrr.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Nov 2022 02:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hrodxjE3++JzSf9Q5uxlAVuutjj+cagca/Bct4wXLdY=;
        b=ndwSmtL+kAnfwuKf91FC6UZir/RZb1ZDDCnNFXt0T4Lq8cS85ReAD+6SX5v0lqE++L
         0445vCIfJJSnQYou686J4MPxo4mqcXUpWrqHwqPlb2QfhZ5KVxoWZujCf1AUG9lJo2EW
         Tc+j/Vk3YdG2GdTGHKQM/rEFn3XFE1fFnYs4fUwBQC8Rkf5RbUA5xNDQzaTFDKFboDNR
         jo7kngEVk8S3VnBahuzZPCvBhBY2mHiuJkOpv2PYV/ykJjhq/sPhw7jR4gQUYudXVJ8H
         odrTvG+8/1snCWxy6gR9x9FEMaFWyt/53O0Vm2lZkBqm5SaP4G2D4pnG0xnaWab09IMi
         CSKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hrodxjE3++JzSf9Q5uxlAVuutjj+cagca/Bct4wXLdY=;
        b=ITQxsQvyLlyilN3v4kLrjevOvXmX0KYFQIr0JrhEWy2vbq+4P4Ur/ipJU/ADc7DpIJ
         yLerCfC9ciD2KtD6Jj97f3s50ipPlZpBKeRifZ6ojofmpAW/VYB45Xapg3fQbU05T2yN
         olTlt88vbUK21KTI+UpgUYf9OTtr1Em4cnFDrZ24uSoaLhOPFEIT72VKLIRofzyY64GS
         AdQaW8lwAN5pA8XvZWtpVZQTW0uhapGGf3nWaOd+MHCruj317PgPRoZ/mNC4b5bEqD0v
         3robB8bAxIA+8O05bKvEykC9C3wCp++WNmuj7OK8b3RhwiHoenjNk9N/s1A2K9HHOtVF
         42TA==
X-Gm-Message-State: ANoB5pkzjf5tCxdHThrlXx0gTPwieXKvRWLuzngeGq5sBoi9QfGfq+NT
        ksZIbZNp1krQ+XCDpIsm14bOyg==
X-Google-Smtp-Source: AA0mqf5xuv1AmUgpzLsqRaOMYIcXA6pTY60wDLqH7jl0HFNAeGjtRx0Gzxn3UOiKZEKaAZwH4k713g==
X-Received: by 2002:a05:6000:16c2:b0:241:c56c:b485 with SMTP id h2-20020a05600016c200b00241c56cb485mr10018000wrf.566.1669112507036;
        Tue, 22 Nov 2022 02:21:47 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:e011:9e81:66f1:3415])
        by smtp.gmail.com with ESMTPSA id o3-20020a5d4083000000b002366e8eee11sm13432873wrp.101.2022.11.22.02.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 02:21:46 -0800 (PST)
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
Subject: [PATCH v2 06/15] tty: serial: qcom-geni-serial: refactor qcom_geni_serial_isr()
Date:   Tue, 22 Nov 2022 11:21:16 +0100
Message-Id: <20221122102125.142075-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221122102125.142075-1-brgl@bgdev.pl>
References: <20221122102125.142075-1-brgl@bgdev.pl>
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

