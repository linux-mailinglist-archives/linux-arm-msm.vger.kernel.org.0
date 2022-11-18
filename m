Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54D3F62F484
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Nov 2022 13:26:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241487AbiKRM0G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Nov 2022 07:26:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235188AbiKRM0F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Nov 2022 07:26:05 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B602B97362
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Nov 2022 04:26:03 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id j15so8354137wrq.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Nov 2022 04:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ok8L9adaIF0+CzBKoz5waBpeT5nnReMM5+PgzYDBt80=;
        b=f2Cb7dHTJjhqmL4nuB7JcTcfxgkO1h1jDsAs7KhIweoREnbOrExif0SmJwDzeODSOM
         UodP8YI4ODyETCmk/nvSJUzWVG6hN/S4p+MR1IlkoPbQeSnlS5Bmv7LArfXnvs2lhh2m
         MRQ3wNg+PjYnJHiPQ6Dn0JJmBZ3BEJr9YVrdkj13NzVmt7xCTQjkh2pa676vHgpGmqN7
         YwwREFcM29537vlm/SDqIP948Z2zauJzalGMd65UuCUj3fKeLw/sN7Z/06GcKcANntWw
         oiaEwyWx5/W5ycI6vmuZ1lkl5zssbA6nKU0UMHnFURL0BMYv/dUqznIluVc9phNAcfx0
         Shbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ok8L9adaIF0+CzBKoz5waBpeT5nnReMM5+PgzYDBt80=;
        b=tL+e4TrwJftwLlViKRMzH5moWPynMnn6stiuE62Czlw5t6vSxCDgnK/xwrqqxwdD8W
         p4WMA9UZ0aXm3JeFbTPZIH2t+GR1bNoJ/4Ar24xgQZcrP5amZ+mXjrGk6+jlwta1mmsn
         PgONWQyVSxFy0+zmi9lOwPkdkVEbb1Ht6U4TH+291pSPsk4F1g82rv6lQ4BTf4anP4aT
         cyhQOwSdjn46U2FtDL3je4A6NvIXSFpu8EeOFoKM5SL4wcN+iaUJdtXnumbvIabrCJSC
         LsWD+MvJkORSlSa/MBnjPYvMsxBoOlROoiwRRwV0fOABLIPU/nJi7ZVYNeovK2fj7mSS
         4EXw==
X-Gm-Message-State: ANoB5pmWKkNGosI3dth6mSV1uNrkRewyZ4BjgmRC5dSkzCLBztM6Xpp/
        1JIccWhWXIXOIkKurUkbEvNAMA==
X-Google-Smtp-Source: AA0mqf6r/e4h3ksywhJAWCbT8MHmcgbW2hMlFLWlgDP7ngu97nZVBRX+wWYL1Ps0MAi0xJ2u/N11WQ==
X-Received: by 2002:adf:f805:0:b0:236:ef0b:68c5 with SMTP id s5-20020adff805000000b00236ef0b68c5mr4316485wrp.373.1668774362233;
        Fri, 18 Nov 2022 04:26:02 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:b10c:1279:a704:75d4])
        by smtp.gmail.com with ESMTPSA id f19-20020a05600c155300b003c6f3e5ba42sm9873958wmg.46.2022.11.18.04.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 04:26:01 -0800 (PST)
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
Subject: [PATCH 00/15] serial: qcom-geni-serial: implement support for SE DMA
Date:   Fri, 18 Nov 2022 13:25:24 +0100
Message-Id: <20221118122539.384993-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
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

The goal of this series is to update the qcom-geni-serial driver to use
the DMA mode of the QUPv3 serial engine. This is accomplished by the last
patch in the series. The previous ones contain either various tweaks,
reworks and refactoring or prepare the driver for adding DMA support.

More work will follow on the serial engine in order to reduce code
redundancy among its users and add support for SE DMA to the qcom GENI
SPI driver.

Bartosz Golaszewski (15):
  tty: serial: qcom-geni-serial: drop unneeded forward definitions
  tty: serial: qcom-geni-serial: remove unused symbols
  tty: serial: qcom-geni-serial: align #define values
  tty: serial: qcom-geni-serial: simplify the to_dev_port() macro
  tty: serial: qcom-geni-serial: remove stray newlines
  tty: serial: qcom-geni-serial: refactor qcom_geni_serial_isr()
  tty: serial: qcom-geni-serial: remove unneeded tabs
  tty: serial: qcom-geni-serial: split out the FIFO tx code
  tty: serial: qcom-geni-serial: drop the return value from handle_rx
  tty: serial: qcom-geni-serial: use of_device_id data
  tty: serial: qcom-geni-serial: stop operations in progress at shutdown
  tty: serial: provide devm_uart_add_one_port()
  tty: serial: qcom-geni-serial: use devres for uart port management
  soc: qcom-geni-se: add more symbol definitions
  tty: serial: qcom-geni-serial: add support for serial engine DMA

 .../driver-api/driver-model/devres.rst        |   3 +
 drivers/tty/serial/qcom_geni_serial.c         | 616 ++++++++++++------
 drivers/tty/serial/serial_core.c              |  36 +
 include/linux/qcom-geni-se.h                  |   3 +
 include/linux/serial_core.h                   |   6 +
 5 files changed, 457 insertions(+), 207 deletions(-)

-- 
2.37.2

