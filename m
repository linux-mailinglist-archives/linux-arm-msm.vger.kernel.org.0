Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7B0018F49C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2020 13:31:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727586AbgCWMbN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Mar 2020 08:31:13 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:44347 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727457AbgCWMbM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Mar 2020 08:31:12 -0400
Received: by mail-pg1-f194.google.com with SMTP id 142so1880306pgf.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2020 05:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=1hKoKjYAa83kZKJ+z+0OSvFKkQP5CN6ABLYmW5E76dM=;
        b=HYj9wy3b7npggr4LRib8zleVqiX2+pD1OMRNp/+ItCXUAMV9rdmQVT5H0EB+t6PKJ+
         dzvieYx/+pBrC9PV/2oJlkggVyMW0YVAHcX/hYRWjYgSiGx1IVOEwKysm5Avg6FQ6foL
         pqMKZDcPvdoTe4cFQKulZglRLW7r4MIZyELkpW8++Mwp1uWbaB50zgXwvng1bFh+GCeH
         fQ4jg1ZOtK7vgBz2uSKC0FLX7LEd3OamrrnoMto1i+OX9jQyrS2YAheoaTXO5az8PS/o
         Z7KhdEdUluZX62L05LVYoKvJMXVbr89K21bzDyIDm36Nz8OR/HLsUUcY4ejkb28egyut
         q+0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=1hKoKjYAa83kZKJ+z+0OSvFKkQP5CN6ABLYmW5E76dM=;
        b=pZvjUISg26TmG19FT5edqcyLA9pMPN6sDwlHMZYP9AhddWSZ6/uePSa8FefLwADAXC
         zwf5VFVQ6/92o5uM5doNanvzmudt4uOXqC09r5MhiCZp13+r14nIXufvyCrcVTzrZMRw
         Z1vwZSUD2/zHz8HzlQipPMBhl1gCpnepdKXcoI2SIpBXf8c0WeHso4M96APAXmXSEZFT
         6LYz8hwK8hQz2M0OM/hoDHph6rseIgkBPOSrAVAaPXk1+ZmzW12/va5WtD/OZAwa56W6
         qA9G8uP+iBdXrzjqORV9ThqjaNJeGTQIXkBSizh/OpnYmwF/yX4YKYVX6Qe18Tg+BAOD
         ZjBw==
X-Gm-Message-State: ANhLgQ1hZwYauk58VY88rNLmsZ3pdZkcDGFTTuOmeOl42PccZYzMWY9U
        u5MbFTuv+J42tuNJ7V4gnbQp
X-Google-Smtp-Source: ADFU+vvRoIlKNNcsBxsyQ5LVCw+2vHvo2nMFTgL0roDI8UCPMsKZ9hA+jk8TaE3aDgs29RT/9S4ypQ==
X-Received: by 2002:a63:be0f:: with SMTP id l15mr21502263pgf.451.1584966671650;
        Mon, 23 Mar 2020 05:31:11 -0700 (PDT)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.googlemail.com with ESMTPSA id 144sm3590131pgd.29.2020.03.23.05.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2020 05:31:10 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org, davem@davemloft.net
Cc:     smohanad@codeaurora.org, jhugo@codeaurora.org,
        kvalo@codeaurora.org, bjorn.andersson@linaro.org,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 0/7] Improvements to MHI Bus
Date:   Mon, 23 Mar 2020 18:00:55 +0530
Message-Id: <20200323123102.13992-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Greg,

Here is the patchset for improving the MHI bus support. One of the patch
is suggested by you for adding the driver owner field and rest are additional
improvements and some fixes.

I've also included the remaining networking patches from previous patch series
which needs review from Dave. Dave could you please look into those 2 patches
which falls under net subsystem? Greg can take those 2 if an Ack is provided.

Thanks,
Mani

Changes in v2:

* Fixed some minor comments in mhi.h

Manivannan Sadhasivam (7):
  bus: mhi: core: Pass module owner during client driver registration
  bus: mhi: core: Add support for reading MHI info from device
  bus: mhi: core: Initialize bhie field in mhi_cntrl for RDDM capture
  bus: mhi: core: Drop the references to mhi_dev in mhi_destroy_device()
  bus: mhi: core: Add support for MHI suspend and resume
  net: qrtr: Add MHI transport layer
  net: qrtr: Do not depend on ARCH_QCOM

 drivers/bus/mhi/core/init.c     |  39 +++++-
 drivers/bus/mhi/core/internal.h |  10 ++
 drivers/bus/mhi/core/main.c     |  16 ++-
 drivers/bus/mhi/core/pm.c       | 143 ++++++++++++++++++++++
 include/linux/mhi.h             |  48 +++++++-
 net/qrtr/Kconfig                |   8 +-
 net/qrtr/Makefile               |   2 +
 net/qrtr/mhi.c                  | 208 ++++++++++++++++++++++++++++++++
 8 files changed, 465 insertions(+), 9 deletions(-)
 create mode 100644 net/qrtr/mhi.c

-- 
2.17.1

