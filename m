Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CFCC528376
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 May 2022 13:45:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235690AbiEPLpb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 May 2022 07:45:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229931AbiEPLpa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 May 2022 07:45:30 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87C17E085
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 May 2022 04:45:29 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id y19so17772752ljd.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 May 2022 04:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C6/qyJlPZX04CDitoceht1WZy7MBWG2zNDEEwfjbSvU=;
        b=y0qSRfRZf+I83TmFc/UOCgz5ewT85ZXKRm83xZmghYpME1fTvcOj8FlDenIWwhr70S
         vfRg89U7Oe1q3EaObaFBERMQ+YeHDvWxX4N+hYTpLMwTXndgp53zuIOB8hDZOrKu0xaO
         DX39ShEITtrZWjUKO5YeNJH1kHHidUl6+7Cfl5OH86hRttzRVMneeIGO90J5zxuL2X/9
         IPnMagbByGOfOlSd8oEM4RfzW3laY6wdlbCLMMaWpWQOsKSI9EPKDPCy5YRcSDv4VFn2
         uJhm7WsyovQMOw51Xj6K50Q4ludoYEssEboOs3gyT9BvYgDEYUw8WyFI5tDLUFWPxtTc
         pGog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C6/qyJlPZX04CDitoceht1WZy7MBWG2zNDEEwfjbSvU=;
        b=4c6Ov0fAOt4QcjaQGWgadApaMtjkukt8QUPzKJOvBCs9uyaoa8JlsFNBk8D2mCRIv4
         K/4ZAyekIf8pxQoz9LWqKzoqWCjPZeg2DuxyDsdSFD2K8lDXTXqlD4bwaNnN3+f/VEgy
         ocwIlxW9T4xFJ3cLWpAzaCm9XllVnPaQ/JDT7F+SmVBI6yZHGsOcdygFGIm/fxFW/40x
         iPZkQv0awoHVXpGQCsEDaOP8Hy2w40t7pPgX0WEbPeosSjDmKTMPuJI1rihLWN8xRVFP
         Fl01t859ovde31tBQmAL9GtnedIfdB1S/MD605O94ZOIzPHKmwI5px4FRFZSkuPrZfqG
         EK7Q==
X-Gm-Message-State: AOAM532YhDVqSedj3jjHn0upWljVfI/vUmPDQK05vZ43zrj/0butXnh9
        cIUTQ8lJKfNQp6Y0apaGbQvArNUXMPljLw==
X-Google-Smtp-Source: ABdhPJy04K8jAqI5zr9d+MNxE7BBF1Cu/6uBsZ0RRe0UfLAVf38IAsdsbzDkJsHJ3Yf/aNVHACwjfQ==
X-Received: by 2002:a2e:bc19:0:b0:24f:4de2:38ba with SMTP id b25-20020a2ebc19000000b0024f4de238bamr11262517ljf.351.1652701527856;
        Mon, 16 May 2022 04:45:27 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id r18-20020ac24d12000000b0047255d2111csm1286079lfi.75.2022.05.16.04.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 04:45:27 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [RFC PATCH 0/5] phy: qcom-qmp: split the QMP PHY driver
Date:   Mon, 16 May 2022 14:45:20 +0300
Message-Id: <20220516114525.3596196-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

While adding support for the PCIe EP mode support to the QMP driver I
couldn't help but notice that the QMP PHY driver has slowly become the a
beast with tons of conditions and corner cases being inserted here and
there.r

This an RFC for an attempt to to cleanup the QMP driver by splitting the
QMP PHY driver into four smaller drivers, each targeting a particular
family of PHY backends (DP/combo, PCIe, UFS and USB). Yes, this results
in some code duplication, but I hope that the end result is still better
than the current situation.

If the idea looks good, I will continue polishing the drivers. A
feedback regarding the common functions (ones, left in the
phy-qcom-qmp.c file) would be appreciated.

Dmitry Baryshkov (5):
  phy: qcom-qmp: split combo PHY support
  phy: qcom-qmp: split DP data to DP-specific structures
  phy: qcom-qmp: split UFS PHY support
  phy: qcom-qmp: split PCIe PHY support
  phy: qcom-qmp: complete split of the QMP driver

 drivers/phy/qualcomm/Makefile             |    2 +-
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 1362 +++++
 drivers/phy/qualcomm/phy-qcom-qmp-lib.h   |  290 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c  | 1945 +++++++
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c   |  863 +++
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c   | 2104 ++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.c       | 5983 +--------------------
 drivers/phy/qualcomm/phy-qcom-qmp.h       |   43 +
 8 files changed, 6732 insertions(+), 5860 deletions(-)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-combo.c
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-lib.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-usb.c

-- 
2.35.1

