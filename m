Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FFFF2C0CB8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Nov 2020 15:14:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729486AbgKWOET (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 09:04:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729293AbgKWOET (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 09:04:19 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEBEEC0613CF
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2020 06:04:18 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id g14so3508018wrm.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2020 06:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=x8VcIegIRkslNA382JSNnZzBgiq98EbovbVfhX5Iy4c=;
        b=wXHHqGVUbR2ebu6A8hNceO+X3SKLGyCVyUiGGNseKGN/4m6XWqp1/l1D0/M88H3H9R
         E2pBDyaA6lrwfOGd4khl2cUUgmN2ncaGnMh+JGHHc+g0ayBbngfpxWYaiOPAyhaXb2AX
         KEPlqIdIR/rXW9IpRN9Y9ODTYtHpuWjnP0+0zzFzkWNTfiDOSh6N2Sbfd6YSy6+tviod
         HJ2bukhtO6F2dfh4KX88XRRDbNR/gLRm/yhzQeCt6uirMsI1+8JETtiiCC/pU/aS3w1V
         EwyolIN6C0G4QShzssq5Vye3fm0bPygh5E/1V7/tZOzfnD1uJvv6oqY+cggUT+gyH7rr
         Ijqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=x8VcIegIRkslNA382JSNnZzBgiq98EbovbVfhX5Iy4c=;
        b=o3PDaOWRibJyoRBeF9QEX+b7BrTPAoQs+I9UniJ79J1iD1KJRWdlh/arpndMA1RdqO
         IJmqZoWaU6zzK5iYGh7SRZLWDZI+CSIuMAXKPT7uKdYnzwjreg5DF1E8n0MJguAuluXb
         ZeUrrFfJpo4FvBByer5WD+L8bwrTwrVW7025PhJMtYtwJqCifp5xe0FCm/kF1MKUpjpG
         hBrUldikLniZlZ8oSeT2mBIKLZxksdmhScAZcxHxVVIqtz4Qi9oHJhWHpWIMhi0+9BXf
         w6KckcYI+E6SoQygmY+LS0e/GfHJ2OQ2TQGIjsAX/QqqPcnD2hADBEu6S7VtvlvuhVks
         7dBg==
X-Gm-Message-State: AOAM530HvO92IE8BVOABUvU2ifZzZL17A4zsGR9CsoFFD3Fl4GBnZBXi
        CYqHDND+6MS1Y7euPsVhDrTGdQ==
X-Google-Smtp-Source: ABdhPJxYahV22rJM3YFH0esrlPj1zcLUdlOVa2yH2d/rD9+J8M3wYBMNxiN/GWOcfZSDNpsGcXtj5w==
X-Received: by 2002:a05:6000:104b:: with SMTP id c11mr1494843wrx.329.1606140257480;
        Mon, 23 Nov 2020 06:04:17 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:f5cd:e791:e88b:e3b7])
        by smtp.gmail.com with ESMTPSA id m9sm7102727wrx.59.2020.11.23.06.04.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Nov 2020 06:04:16 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v2 0/8] mhi: pci_generic: Misc improvements
Date:   Mon, 23 Nov 2020 15:10:58 +0100
Message-Id: <1606140666-4986-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series adjust some configuration values to ensure stability and
robustness of mhi pci devices (timeout, number of events, burst mode).

It also includes support for system sleep as well as a recovery procedure
that can be triggered when a PCI error is reported, either by PCI AER or by
the new health-check mechanism.

All these changes have been tested with Telit FN980m module.

Loic Poulain (8):
  mhi: pci-generic: Increase number of hardware events
  mhi: pci-generic: Perform hard reset on remove
  mhi: pci_generic: Enable burst mode for hardware channels
  mhi: pci_generic: Add support for reset
  mhi: pci_generic: Add suspend/resume/recovery procedure
  mhi: pci_generic: Add PCI error handlers
  mhi: pci_generic: Add health-check
  mhi: pci_generic: Increase controller timeout value

 drivers/bus/mhi/pci_generic.c | 352 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 335 insertions(+), 17 deletions(-)

-- 
2.7.4

