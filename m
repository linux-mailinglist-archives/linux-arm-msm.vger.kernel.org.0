Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CE4D62F4A0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Nov 2022 13:27:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241793AbiKRM0o (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Nov 2022 07:26:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241595AbiKRM01 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Nov 2022 07:26:27 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DE38976DB
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Nov 2022 04:26:09 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id v1so8963356wrt.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Nov 2022 04:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vMYlxBECUyROeU2qoZzKEqhzlBfoiS2AeDouftWiN14=;
        b=h3ylSwylTpt/gTd5gxjRVlnohrLzxyaHkKxHSNdsMOgFdjULJkYTK9ag3H5B7bZGNF
         xpg0lzKa/Kdgi+wwNxNugBCVUxhRzAeEO0K9bZo5r+rixRV2dZT8E1XYBNEu5gFMBPMk
         u3QrTixzNo2+yRMl1tCa5RS9oH4RsO/lSqL1j8ZDZ+J1rahMob66xdS+/rt/GuPB8Fa0
         /MnLjQYgrfLogwNpXSQwcE4A3zNxtyujkrgVt9k5TS5qYNyuHkGAJQeOPW+XFCv5Erio
         Cw+8ATnanhtooLYJuYJCabSEaLbnbmt3/ey5xxHhjF+06VG3BizN8UcivtyLeLRJEKaH
         BL9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vMYlxBECUyROeU2qoZzKEqhzlBfoiS2AeDouftWiN14=;
        b=r1ZEybUrfAiQ/yc8Inuj1qh0TJRm4KwMJYHoJ+KzPg/RIuzhp0gDbqRx+Ux5FSJJhX
         KxnsD9WVaEZ5Odtm6tydl0lYjYLSdswlY6L/fyGcRkpUNi4d5yUveZHmnhR1RLXsvy5B
         B2nL1lBkFTnjXrRVvC/IsiSTbza6pvL2yXIUY1dZxR53XF1RQOhCpft0U43OGCAwBgwb
         WUKCzyHxI8oBubUXAygIhclySTF/CXMQ9D+dCbXwCh24DsXwvpinpGxYe7dTVgfpyvzw
         5R+6cYpXVe3bnjYrEEFImwYwvobVNV2NdBDKn4ajrdkh1gMP/v/VgibM5ziG5WjsrJn8
         m9BA==
X-Gm-Message-State: ANoB5pnNRg1RRd6ixsvY7kt3hqtu65I/owBk4fIvgPZmc+Kp9VyO3+Mv
        foZXP0MNoSuBzK/IW6J5Y6N64g==
X-Google-Smtp-Source: AA0mqf6XQpZNIv4JSPh2Iy9S4x4cMT6r1bE9lJXiqxSKL5yWDvqbOxuNaKATf/tjq89JAK0wQcExfA==
X-Received: by 2002:a5d:408b:0:b0:236:53d2:1668 with SMTP id o11-20020a5d408b000000b0023653d21668mr4185721wrp.694.1668774369037;
        Fri, 18 Nov 2022 04:26:09 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:b10c:1279:a704:75d4])
        by smtp.gmail.com with ESMTPSA id f19-20020a05600c155300b003c6f3e5ba42sm9873958wmg.46.2022.11.18.04.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 04:26:08 -0800 (PST)
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
Subject: [PATCH 07/15] tty: serial: qcom-geni-serial: remove unneeded tabs
Date:   Fri, 18 Nov 2022 13:25:31 +0100
Message-Id: <20221118122539.384993-8-brgl@bgdev.pl>
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

Remove redundant indentation in struct member assignment.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/tty/serial/qcom_geni_serial.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 22c1869c60f4..39041538e5d2 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -138,26 +138,26 @@ static struct uart_driver qcom_geni_uart_driver;
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

