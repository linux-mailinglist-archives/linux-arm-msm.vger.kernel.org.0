Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49A95635B4A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Nov 2022 12:11:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237271AbiKWLIp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Nov 2022 06:08:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237311AbiKWLI1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Nov 2022 06:08:27 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A38BC111C
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 03:08:05 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id b12so15044252wrn.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 03:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SxKKQVKQ81FxEODlSEwNHNcnF7Oq8Hf7J8RAhqpkNR0=;
        b=64bqPU1MpACkSz+2b/iR4rFkK2yOkXS6e7vbXAhgpMGWYlA7mOCt2r4qUnm6qD/1ct
         CiM3sI9ZcK1GEM+pGgcfb9GDPmImMhNKB8GMy/ZzCLBkqVdjm4oEPNGk/JI9r1ffWCpp
         gT4cs2j8XzOvGtwgEzfwtfbxP5i9GWYR8Rfztv199TWa7GB8kHm7Pfrez00dzmf3svMK
         TTQlRPFaPc/AZiLpzKVXmP219Cqo/KyHNsWQMnBGE/ZrL9HXUMn4Fz8l+La9SDHV7YSN
         zSC1BeY5aEazKgslBTLUhFZC2UwgHIMkLiUNzx64LYt/5BuaH0EGwGW0s/v+hsYzIopf
         QeDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SxKKQVKQ81FxEODlSEwNHNcnF7Oq8Hf7J8RAhqpkNR0=;
        b=bOeqh32JjugLVlnlAy3YzKRu68JHKmaRS6FZ+3SLayJt7RLnTZ8leX9ral4cXwrGyh
         qXO6xiRajSrA2LzvOhcQLTIsHjnJAsFrRVbt2R9ViMrtvlW8f3cdH45E18gdU2RrzEch
         Ypa41RSLy65bT1QkhQyg7W8I9dZjXdi7AoDCIdDxWTCuA0lBJyWyjiuaccVxOnRWOfdX
         qzhL4zg+Qg/2xfRVNrl0NCMhrx5DpEM90I83GSvfvhmhFGtFrB0kX0lALtA98E7TT63F
         7hLbHuSuIIQXkKUlOL1IjwSdMzsfTXUyS399kJN/RwBQtLirnVQ7hZ9uEOFr8dSZjjTs
         g3mw==
X-Gm-Message-State: ANoB5pmKerm1/ldpbzaeV+atwVTNjHSELNKfmr8i/CLePfA+bRtJp7Ev
        B0EcZ2aCYvWEI+/EnvmncgKItQ==
X-Google-Smtp-Source: AA0mqf7/CLlZBAm0JOsutqH40giJkGNz4w7NX22yD+LfdhiJC6ahf/IjVNxrYowLnpmRtARS/tcxxg==
X-Received: by 2002:adf:dd4c:0:b0:241:c075:30db with SMTP id u12-20020adfdd4c000000b00241c07530dbmr7159238wrm.159.1669201684196;
        Wed, 23 Nov 2022 03:08:04 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ae74:d94f:4677:3378])
        by smtp.gmail.com with ESMTPSA id f13-20020a05600c4e8d00b003c6c182bef9sm2560406wmq.36.2022.11.23.03.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 03:08:03 -0800 (PST)
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
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 00/13] serial: qcom-geni-serial: implement support for SE DMA
Date:   Wed, 23 Nov 2022 12:07:46 +0100
Message-Id: <20221123110759.1836666-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

v2 -> v3:
- drop devres patches from the series

v1 -> v2:
- turn to_dev_uport() macro into a static inline function
- use CIRC_CNT_TO_END() and uart_xmit_advance() where applicable and don't
  handle xmit->tail directly
- drop sizeof() where BYTES_PER_FIFO_WORD can be used
- further refactor qcom_geni_serial_handle_tx_fifo()
- collect review tags

Bartosz Golaszewski (13):
  tty: serial: qcom-geni-serial: drop unneeded forward definitions
  tty: serial: qcom-geni-serial: remove unused symbols
  tty: serial: qcom-geni-serial: align #define values
  tty: serial: qcom-geni-serial: improve the to_dev_port() macro
  tty: serial: qcom-geni-serial: remove stray newlines
  tty: serial: qcom-geni-serial: refactor qcom_geni_serial_isr()
  tty: serial: qcom-geni-serial: remove unneeded tabs
  tty: serial: qcom-geni-serial: refactor qcom_geni_serial_handle_tx()
  tty: serial: qcom-geni-serial: drop the return value from handle_rx
  tty: serial: qcom-geni-serial: use of_device_id data
  tty: serial: qcom-geni-serial: stop operations in progress at shutdown
  soc: qcom-geni-se: add more symbol definitions
  tty: serial: qcom-geni-serial: add support for serial engine DMA

 drivers/tty/serial/qcom_geni_serial.c | 606 +++++++++++++++++---------
 include/linux/qcom-geni-se.h          |   3 +
 2 files changed, 409 insertions(+), 200 deletions(-)

-- 
2.37.2

