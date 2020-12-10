Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEF522D57AD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Dec 2020 10:58:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728497AbgLJJ4q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Dec 2020 04:56:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729296AbgLJJ4p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Dec 2020 04:56:45 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA924C0613D6
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 01:55:56 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id a3so4624671wmb.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 01:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=bvOimCXCbY9GIqlTFGMFXTMO/fLjRn23SZPPHyck9vw=;
        b=HaJi6/0eDFXC1nryWI93xGyBGYtDcZmibP4WuBCUaO2GfHroieDuD0DzbhZc3QrBAL
         zaT2YfoueEB03O2pfGOJSxcqicLqQE7G5h7yX59Bk/HKH/R7Xp1Ho02/Rq/v1WpUVBre
         vhrHo7vOrBcP8k9AhdIMVT+b5TARfhskTITtLHm4j7tyBl33fQiOa9rUlM/T1tZecvUD
         gigrj2G75QnU30DIgp7qopIU387CO8gpYrie3hV+NJs70SgBqwdV2JXTCdOSV7ZCAunT
         C0ffnHaUI+y3e5Lvg9lgMz8YZe52FsZAneEmlf9q2eHcSt4EFuz2UVMwoq6uqbsyKXBQ
         xRxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=bvOimCXCbY9GIqlTFGMFXTMO/fLjRn23SZPPHyck9vw=;
        b=HLotNqMm+JKVZEKNtvYiicNAKQalMI73otF00m26i8OefkGMqC5zF5jGMsMVbOpVAZ
         yL3ltIqDUEshOIkmOQvBKNV+YrRoJ3+0tc1kBN6sAcNwbnmJwGbSwb2JSIt/8J91TDvT
         ox1nMarDNbXHB4lUDWKYNXBWZQZ/cBPNzBUivAXXq5mDWdQGZeV9+Oxw4yNFnQfqbubf
         +Ue6joKcso1YIxtefqx3PuTwEjInalfB2enzq9nGJvBAbEUZXMN2BSvW46IKMx3nwi4l
         MQYDiMnPgYqxL5/pXeXF5gc7r9fzd2JOr4curbJSzzYSF9GcvDETRMXWuYO0gwBCN2nL
         IVwQ==
X-Gm-Message-State: AOAM530w/Zpqf2YM5S3dtZPK6aXDIwmsP5zTwrax3qjKTcGiE3K0an4h
        GAwi+yOVnFlTpZj2YgYcYqK5YQ==
X-Google-Smtp-Source: ABdhPJw8+jopzLnkg4BJCWEWbCn2wigq4m7cnca97BfHzip21MTI45OBDJLphsFx9l5HxZgRjL9HsQ==
X-Received: by 2002:a1c:2e16:: with SMTP id u22mr7336086wmu.149.1607594154812;
        Thu, 10 Dec 2020 01:55:54 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:4468:1cc2:be0c:233f])
        by smtp.gmail.com with ESMTPSA id l16sm9043721wrx.5.2020.12.10.01.55.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Dec 2020 01:55:54 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        bbhatt@codeaurora.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v4 00/10] mhi: pci_generic: Misc improvements
Date:   Thu, 10 Dec 2020 11:02:45 +0100
Message-Id: <1607594575-31590-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series adjust some configuration values to ensure stability and
robustness of mhi pci devices (timeout, number of events, burst mode).

It also includes support for system sleep as well as a recovery procedure
that can be triggered when a PCI error is reported, either by PCI AER or by
the new health-check mechanism.

All these changes have been tested with Telit FN980m module

v2:
  - Cancel recovery work on suspend
v3:
  - enable doorbell_mode_switch for burst channel (HW)
  - Add mhi_initialize_controller helper patch
v4:
  - Delete hard reset on module unload, MHI reset is enough (Jeffrey)
  - Move soc reset support in MHI core (Jeffrey)
  - burst mode: enable doorbell_mode_switch for HW channels (Bhaumik)
  - Add diag channels

Loic Poulain (10):
  mhi: Add mhi_controller_initialize helper
  bus: mhi: core: Add device hardware reset support
  mhi: pci-generic: Increase number of hardware events
  mhi: pci_generic: Enable burst mode for hardware channels
  mhi: pci_generic: Add support for reset
  mhi: pci_generic: Add suspend/resume/recovery procedure
  mhi: pci_generic: Add PCI error handlers
  mhi: pci_generic: Add health-check
  mhi: pci_generic: Increase controller timeout value
  mhi: pci_generic: Add diag channels

 drivers/bus/mhi/core/init.c   |   7 +
 drivers/bus/mhi/core/main.c   |   7 +
 drivers/bus/mhi/pci_generic.c | 352 +++++++++++++++++++++++++++++++++++++++---
 include/linux/mhi.h           |  13 ++
 4 files changed, 360 insertions(+), 19 deletions(-)

-- 
2.7.4

