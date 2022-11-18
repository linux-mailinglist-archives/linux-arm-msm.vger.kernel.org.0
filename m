Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B990E62F4A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Nov 2022 13:27:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241817AbiKRM1P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Nov 2022 07:27:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241820AbiKRM0a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Nov 2022 07:26:30 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30A259825A
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Nov 2022 04:26:14 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id t25-20020a1c7719000000b003cfa34ea516so6157069wmi.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Nov 2022 04:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kA0mRGqH1AuIV+a1MO05ETt4x66olQAeBj4vK+Kxqj8=;
        b=hkM7abkKGR4X3yahLkJH73KCQSaV68CGuVTJlrk2TkbNfZYOmVJ7x5d/hmfeRVUw2W
         bMJz3Cd3zkdJzfKbE0IsupzbOrHa9Hf5Vt9tnebhKw8SGEExrrH3ReA9zMoULFmgZhRU
         gID8QLVEX1dQcEB3sEHWFqUNAAEH44wROl1xrg8FyQp6c3uyCsajOuW0ENscAF0EhYbo
         9WLVuTAS0xAzUPIAtt6Ao5E5a2uolP+G9WfZsmcMqoigK+o1Z03FyYBjEpfec8HeLf/i
         pkx4tG/oe1/eipwem9b9l7nV01FDqWtyr+JaEpSAVlyC9BNcWglA7jfYEcxUJ8KAuLPk
         nZ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kA0mRGqH1AuIV+a1MO05ETt4x66olQAeBj4vK+Kxqj8=;
        b=H9Ht4RLmwXiv0n4LgT7ZfyAZRgfxwhdKVkjIplEZ0E3sxY03UTVzR6VjT1F7u3lb8b
         sLojb6/4CJ/iceTx6cWzN8rd29AOWE7w37KrY3hnC5i869cRflKOY8G9CyYwCE/4+Rc7
         dXfstB8JE0A834RkvdZ/lrjSKmy0ttHi5SxLXKODkziAnxN4s//+J1/Y0qWcmIaWwtOU
         iQrgVFdMmdG9Xj08mqyZUmxLTs5VyRG6xNvUtL4eOuG/pNA11M6HGWxdYRBgDjVTwTQg
         K7dvSpNeyfY6c0pXbJRdtIkUHtPARosTYTw2rmDjbzhyj64hdUt8WCDDEVgKANPKMBlI
         2opQ==
X-Gm-Message-State: ANoB5pkU67NFT39xU/59bwGj8cq/4Si7vXwOm+7V6KkIoJwG2MUthfk4
        HmOABGIBws5wpf/a1kDaJeCSOA==
X-Google-Smtp-Source: AA0mqf7/NAKsEaus8X2OQBW7pJQghogKEDuQQk/ij0P0+nagbr8tCVzFcW3Le+NyQbMM5+Zb+69fwQ==
X-Received: by 2002:a05:600c:18a1:b0:3cf:a9d5:36c7 with SMTP id x33-20020a05600c18a100b003cfa9d536c7mr8256862wmp.13.1668774372729;
        Fri, 18 Nov 2022 04:26:12 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:b10c:1279:a704:75d4])
        by smtp.gmail.com with ESMTPSA id f19-20020a05600c155300b003c6f3e5ba42sm9873958wmg.46.2022.11.18.04.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 04:26:12 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Alex Elder <elder@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 11/15] tty: serial: qcom-geni-serial: stop operations in progress at shutdown
Date:   Fri, 18 Nov 2022 13:25:35 +0100
Message-Id: <20221118122539.384993-12-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221118122539.384993-1-brgl@bgdev.pl>
References: <20221118122539.384993-1-brgl@bgdev.pl>
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
---
 drivers/tty/serial/qcom_geni_serial.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 6a9f3f937f29..091b8f277a04 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -868,6 +868,9 @@ static void get_tx_fifo_size(struct qcom_geni_serial_port *port)
 
 static void qcom_geni_serial_shutdown(struct uart_port *uport)
 {
+	qcom_geni_serial_stop_tx(uport);
+	qcom_geni_serial_stop_rx(uport);
+
 	disable_irq(uport->irq);
 }
 
-- 
2.37.2

