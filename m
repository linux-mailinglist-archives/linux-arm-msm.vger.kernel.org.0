Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02C7563BE7B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Nov 2022 12:01:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232708AbiK2LAy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Nov 2022 06:00:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232563AbiK2LA3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Nov 2022 06:00:29 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17EE860E9F
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Nov 2022 03:00:25 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id v7so10590949wmn.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Nov 2022 03:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zbfRkHz4/aW9Ej0X8Fhaj4Le2T1GhSly/B7XfhIOtq0=;
        b=OVYiI9vgwzzbXVDuWtb9oH4eKxq19zbdJ3oC2h6E6DG4AX1Cbi2z+jxhGyVbTlJi/p
         Cj2P9hygGpAE0BArKfaXrWnZSZsv1SFE+rBV8EBZqKEM7aBGMUC8poeg4yQisIHujZX4
         gQ80Q9YsXgnjZx6b7TvNUussK5QdkfkWS1Dh4WYGXf4QtQRn4zIOGgsi1pR12zoBC1g0
         5IRUIYqatm2xvU6QxZZ++MbhJS6Z4TOJz/XpVezJ4O1CPJuM6B0f/c+8HXDkDG5C86/q
         J3UZn1ZQwLFNLJtqOSrUa5VsUkv9VJ3i1KunUcMTU3a+hoGzV2OYbKbacuGVVCQjAW3u
         rOLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zbfRkHz4/aW9Ej0X8Fhaj4Le2T1GhSly/B7XfhIOtq0=;
        b=63Y3TA1Jtcn/sJEibVR12oMdIHS1ZQA8NS4vVXcFGv08q+tlZVSd9M4P7tRBFIONGS
         3WHbANDMAfcJOT+fCsnZWVxjQ4NMuqGzGNdlhytBYUEQG6oSFkbJIQ5WrdRALjFicu6d
         b+ElEks38NCnxPQTmkqXItDosSn+h21sPs0Po83YhLAVjJQt3SIN9IS09vZ2/MP5c0vv
         cr5OI30/f72eUDVJ5Cxsc1Nx1S0LVPSq8I/cbkgEHfJwwB5m8Yv/BuxjBDvYUtfAuRJk
         X8g9juCjg0fwCSIdNipcK+cWwV9QP2Lc+5Uz50xtmT/B2G0i4XoHh841znmEt0sVJtDc
         KOrg==
X-Gm-Message-State: ANoB5pmQzj6YLqpEVyJhHgF95VJwpGST+iw+4d+T2NMTu7iZ3/SSEJi8
        y+kHm6vYjRwBJOlLGSS54RRcYg==
X-Google-Smtp-Source: AA0mqf5xduGVjsvz2hIFKaOrTriyBG8zItM0KRwQMEGRFHKaZbLHs6BQeD247aJ7RxQkIrjXwTkGKw==
X-Received: by 2002:a1c:c90f:0:b0:3c6:c1cc:e96f with SMTP id f15-20020a1cc90f000000b003c6c1cce96fmr27350110wmb.174.1669719624476;
        Tue, 29 Nov 2022 03:00:24 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:6b19:1d8e:fbca:fd02])
        by smtp.gmail.com with ESMTPSA id q19-20020a1cf313000000b003a3170a7af9sm1617658wmq.4.2022.11.29.03.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 03:00:24 -0800 (PST)
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
Subject: [PATCH v4 07/13] tty: serial: qcom-geni-serial: remove unneeded tabs
Date:   Tue, 29 Nov 2022 12:00:06 +0100
Message-Id: <20221129110012.224685-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221129110012.224685-1-brgl@bgdev.pl>
References: <20221129110012.224685-1-brgl@bgdev.pl>
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

Remove redundant indentation in struct member assignment.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/tty/serial/qcom_geni_serial.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index fba02f71a874..68a1402fbe58 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -141,26 +141,26 @@ static inline struct qcom_geni_serial_port *to_dev_port(struct uart_port *uport)
 static struct qcom_geni_serial_port qcom_geni_uart_ports[GENI_UART_PORTS] = {
 	[0] = {
 		.uport = {
-				.iotype = UPIO_MEM,
-				.ops = &qcom_geni_uart_pops,
-				.flags = UPF_BOOT_AUTOCONF,
-				.line = 0,
+			.iotype = UPIO_MEM,
+			.ops = &qcom_geni_uart_pops,
+			.flags = UPF_BOOT_AUTOCONF,
+			.line = 0,
 		},
 	},
 	[1] = {
 		.uport = {
-				.iotype = UPIO_MEM,
-				.ops = &qcom_geni_uart_pops,
-				.flags = UPF_BOOT_AUTOCONF,
-				.line = 1,
+			.iotype = UPIO_MEM,
+			.ops = &qcom_geni_uart_pops,
+			.flags = UPF_BOOT_AUTOCONF,
+			.line = 1,
 		},
 	},
 	[2] = {
 		.uport = {
-				.iotype = UPIO_MEM,
-				.ops = &qcom_geni_uart_pops,
-				.flags = UPF_BOOT_AUTOCONF,
-				.line = 2,
+			.iotype = UPIO_MEM,
+			.ops = &qcom_geni_uart_pops,
+			.flags = UPF_BOOT_AUTOCONF,
+			.line = 2,
 		},
 	},
 };
-- 
2.37.2

