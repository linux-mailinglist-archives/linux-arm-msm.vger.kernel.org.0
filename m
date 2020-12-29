Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C93672E6EFA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 09:37:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726072AbgL2IhH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 03:37:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726114AbgL2IhH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 03:37:07 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7E81C0613D6
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Dec 2020 00:36:26 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id w1so17175361ejf.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Dec 2020 00:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=0FVrlToZfsZ61Drh2hRXUvUvU2vtuAAba+hrCuwj5WY=;
        b=omZw1mJQb49zHRy/CLbtcRcFj66iyH6Cu4bZYzGQ0jHUVmvzcwe3deBlMLQAmsQvUQ
         EJEkRzPvD2mTO19ypAGwwdsQm8lSWUaAulL04i77Hpd5vcZip48omlfBgbeQF2ySIIRi
         wzfb2adJ21xqgR7wm1TM/TiPlEXmUIOVCGo8XimfMuviUW3QTblPiAxvH0ERXUUnozpg
         NhjSP4vSrCRhDpVRCr95xfeldRwE0JrkvEQ5DnAbGPixNHZfQX/Vh8IjNALAn4RA9nVV
         QO0kIXlMqAzVoVPwBPhNZhj84Li4jhNJSiciaYk0RJHrTfvDOiIE2uJOktZLcsUFqK93
         c1XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=0FVrlToZfsZ61Drh2hRXUvUvU2vtuAAba+hrCuwj5WY=;
        b=cnSUOrrAATJdA51SqsLSM8hV6MgR4+UtLra+86A/4KBBO2cI0HNEE2yRXy1Bl2R0kJ
         l/QtQzpgekiQAUX2QJJtcNvuoQKGInew7rXEM4k74Zrer6qCmB7BBWKHwXbuH1M2CUhu
         /w0iA92E4QhEfbnuDBc0cvFHjuP8H6BfaOPa09ISU2hKZFQTFym+ab6INj5LCh/xUwqi
         PidFIA6XXJhlk6i0PThh3EqUClxZxMxutRfXRDXT2SMst1yEFwmu9AYJJZx2zf3cvWUs
         A4Foa7mQdJgTppVsIsxpIN3iKD475sulIij7kdf5IXuO111panmu4Vno/i+59WgIAHhZ
         BTjg==
X-Gm-Message-State: AOAM5307HFpOF3g25Ph31faCoSNajavTLmnWzILwsObrKntaU5OEjbr5
        0vmhHZqiRMcXT3JcbtdhR7H+6Q==
X-Google-Smtp-Source: ABdhPJwD19M6TWPMoOWMeYsDJiLxKtnKIkmXTfsreu1Vw4DE3ir1sxP8f3Uf9zBJVssA4YrfdOYxtw==
X-Received: by 2002:a17:906:6449:: with SMTP id l9mr40472060ejn.320.1609230985280;
        Tue, 29 Dec 2020 00:36:25 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:6f69:290a:2b46:b9])
        by smtp.gmail.com with ESMTPSA id c23sm37265143eds.88.2020.12.29.00.36.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Dec 2020 00:36:24 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        hemantk@codeaurora.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v6 00/10] mhi: pci_generic: Misc improvements
Date:   Tue, 29 Dec 2020 09:43:41 +0100
Message-Id: <1609231431-10048-1-git-send-email-loic.poulain@linaro.org>
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
v5:
  - Remove useless call to mhi_initialize_controller in alloc_controller (hemant)
  - Add define for post reset timeout (hemant)
  - Fix static misses (hemant)
v6:
  - Add debug print in case of recovery success (Mani)
  - Return error code in case of resume failure (Mani)

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

 drivers/bus/mhi/core/init.c   |   6 +
 drivers/bus/mhi/core/main.c   |   7 +
 drivers/bus/mhi/pci_generic.c | 357 +++++++++++++++++++++++++++++++++++++++---
 include/linux/mhi.h           |  13 ++
 4 files changed, 364 insertions(+), 19 deletions(-)

-- 
2.7.4

