Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AEC4635B19
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Nov 2022 12:11:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237494AbiKWLJP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Nov 2022 06:09:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237528AbiKWLIb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Nov 2022 06:08:31 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E53BB8DA65
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 03:08:10 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id i12so24982539wrb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 03:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EonL2PwB0Makj2JepNmLczYfWSZatIPogqShuTJezMI=;
        b=y+h8KSTlvJEDdoUPd4LwiIlAz/2krzVRVWUIA2XxuS+VYYpNHMGi3UVCblbh0TcuAa
         ZIlRRcdXqugHD1hgmV1Qfc1y5TGepgh9rUQM8rJ6g7ApdKGFAxym87H/urDdRayYvWXf
         2IrXxRq+bXsjg8MnjI6AFK7QW9bhav0ftKbu+jC1cYzRnHn8e5k1ofFdBSkg/AB2YpZ2
         DoPGElPz9rigwi7f1opVlTz82twOy1YL+56i2TKsOEMt/k1QGSwwqzv1PGdgUsGLNRit
         4izPXRymbCFuFiSw9xCLsTZXgC7c8/vHMjYZ9FcRNxbQkvTidKnlOXUKJuPfRDQxkaSc
         2opA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EonL2PwB0Makj2JepNmLczYfWSZatIPogqShuTJezMI=;
        b=id4q9xO95k4EnUdn/+vHaIVlqCeUKwH+0UP+8Rh+ml9mlPlhARaQvU+5GNDuQBce74
         WF75Z76OkyZ/6fkC13HFuGa7G6AXvTzbrcrFdYM48yN9Q69w7KuNMcEnVDNgljgmtGkl
         3vb+LxbUrTdxwVCP6VlSx2cS3kxNigeh9+/4nI5cNYC1REQTdm8Ls9nMaw1PDBzbJrI/
         jX52DvONnZFNyR+KwopBIo59jRLMrDU1Tc0e1FKVi6RjATkXovmk6uB9dqldpUCE0WyZ
         pt7snxH6BTWTuPwWTDCE/lXJ9xNGYpVXKjpWBvGKHdvl3Eigs2Tw2CSccdKNdej3507D
         VXUA==
X-Gm-Message-State: ANoB5plGvw3eBLgt48Zwwj9K1Iux+TfJkH2sMauH5HkZvMY5toEfoL4r
        7sGvoqUWpG2iHJ1ModEVmgvHtw==
X-Google-Smtp-Source: AA0mqf70XElT3Cg/4ZdsjWeevIRaFCwEhBcVKoekCLcXAE4C9SQ7IcQXOJqAfJnL1Zd1BQp03FNijg==
X-Received: by 2002:adf:ff83:0:b0:236:6824:c227 with SMTP id j3-20020adfff83000000b002366824c227mr17330446wrr.510.1669201689497;
        Wed, 23 Nov 2022 03:08:09 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ae74:d94f:4677:3378])
        by smtp.gmail.com with ESMTPSA id f13-20020a05600c4e8d00b003c6c182bef9sm2560406wmq.36.2022.11.23.03.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 03:08:09 -0800 (PST)
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
Subject: [PATCH v3 05/13] tty: serial: qcom-geni-serial: remove stray newlines
Date:   Wed, 23 Nov 2022 12:07:51 +0100
Message-Id: <20221123110759.1836666-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221123110759.1836666-1-brgl@bgdev.pl>
References: <20221123110759.1836666-1-brgl@bgdev.pl>
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

