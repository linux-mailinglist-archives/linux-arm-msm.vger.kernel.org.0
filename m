Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EE222C5800
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Nov 2020 16:22:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391286AbgKZPWR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Nov 2020 10:22:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391296AbgKZPWR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Nov 2020 10:22:17 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0B05C0613D4
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2020 07:22:15 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id u10so56009wmm.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2020 07:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=c54FFjPu0e0YNMEh5GVJQPMw13jDChISThAKhkQ1MG8=;
        b=QG1MQ1u6HkcqQSvjEvnx6QFxiEtpfl+YqdhmdnMhxr9/VydA57TMEm7BvEhONxGxoC
         /1XL970BMCoTShMlTTIeI22w6znxI2o7Qy23nz/Lj36o897E3xNijxYU3gSHuZbuiKVL
         N+eaGrCrLFFVu8+AFiWUChSNYdRiFXmiTgzzcKoKkeHnMjI3R5BAyf8Kj61LovOa63hG
         XU321wdEbjgnd9zuk5f3CxWj1KFxai8V6Qp80SfvabvHaGvASh92UK5DADDosyMgi8ot
         UaZyy+DB1hWKk+7kwINpFhP50SAMYJreJ8euDfExSiqOsA65VHLlJx5sPRSqSGaze2Ow
         /kPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=c54FFjPu0e0YNMEh5GVJQPMw13jDChISThAKhkQ1MG8=;
        b=MYj7bPnkHWdHpPsO44j76A+KWUQka85rlq3r9WzMvCYHQEPhhgRcTBfZifr2typJAW
         bHVI216n70YVS7x2O3TP6wIxT2MCw++U5W2p1H+Ul4JjprB4u8FvIhEQ1UShfdJzJEuu
         R33nRH2P7dSpGtcA1XS4SduUlIgL1hgS4YJ1zIgvjgT1Vqfbfx7OO3mK7FNnBv68NwAp
         +Z9zudy6K2+C8J//NaUThc/1MRCXquch95UvmtdmcW96hhIzPYsLGvGV8N4iQl1ZHq/C
         Dxv1RHGHWMk3q5mTa9Jm0uCPz0/Lm/59/NT/sIhrhsF497BpXhzRBGXjt/3xG27DKXS6
         tnmw==
X-Gm-Message-State: AOAM532XdL/BhuJr8E36n5FImuTG2EvTHHNlOeZRfsR/jSZowe9V+HgP
        t+24j9xJyDAluRxEU8tl/LZp7rbdnor+6AcP
X-Google-Smtp-Source: ABdhPJyXWYUP20oVbdeedBcYlYOBvR08vvdd9GHuTFwpyrjBh8QUKZplcF74TIk0xdwKsnvev/+uuA==
X-Received: by 2002:a1c:2dc8:: with SMTP id t191mr3975825wmt.73.1606404134298;
        Thu, 26 Nov 2020 07:22:14 -0800 (PST)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id l10sm2756144wme.42.2020.11.26.07.22.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2020 07:22:13 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v3 0/9] mhi: pci_generic: Misc improvements
Date:   Thu, 26 Nov 2020 16:28:58 +0100
Message-Id: <1606404547-10737-1-git-send-email-loic.poulain@linaro.org>
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

Loic Poulain (9):
  mhi: Add mhi_controller_initialize helper
  mhi: pci-generic: Increase number of hardware events
  mhi: pci-generic: Perform hard reset on remove
  mhi: pci_generic: Enable burst mode for hardware channels
  mhi: pci_generic: Add support for reset
  mhi: pci_generic: Add suspend/resume/recovery procedure
  mhi: pci_generic: Add PCI error handlers
  mhi: pci_generic: Add health-check
  mhi: pci_generic: Increase controller timeout value

 drivers/bus/mhi/core/init.c   |   7 +
 drivers/bus/mhi/pci_generic.c | 354 ++++++++++++++++++++++++++++++++++++++++--
 include/linux/mhi.h           |   6 +
 3 files changed, 350 insertions(+), 17 deletions(-)

-- 
2.7.4

