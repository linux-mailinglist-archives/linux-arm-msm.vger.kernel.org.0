Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 276673CB38E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jul 2021 09:51:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231454AbhGPHyU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Jul 2021 03:54:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236561AbhGPHyU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Jul 2021 03:54:20 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DF79C06175F
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jul 2021 00:51:24 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id b2so357267plx.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jul 2021 00:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t00hg50AhA9AxZsE8fiIoBHCLf+X3f/YgUeVKeuHEQo=;
        b=RSfTY35/m19hG2uKiHqV+l+QRrCRmNOQTNHQ26uNR7wSjKSDdGMppjbWzw65EY3Jvb
         C+OYhQ07Et2hxBgPqAPhwFiCV8RYog8NDWipbvbgqSQhVnC6sS4tqjRDN7+Kq9TYiJ0p
         i/TprrYcHCc1ddii/S/E195pGPPcuY0Wc04kB0/2cgVBxR5dBQ0kinvc3/tJKMBXROVJ
         /aF+U33C77Br9SpehA9Wb/3aKBOUcg/spB5eF73O0mv8+2bsEWm7RqfLxRCdqt16FjuL
         nIE2GE6OeKCEcd3fymY/2483pf4f/lpGWqPUvbY+Jw6Bbo8p/Xsd11xwChpI9NsshlY9
         Vk0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t00hg50AhA9AxZsE8fiIoBHCLf+X3f/YgUeVKeuHEQo=;
        b=XzYmK1hrfqd/5UXuhtxVzVXcPivYk3qhXaydokvtmaUHCTF4lkTyXgu781p5+qP5NZ
         I3fBv/qFlIlzEfWUKvkT+pVRVR3p2FeKobHGYElHlRfxF0Y/01PwRPGBuvIqVFQiXx/t
         xD6ata3wj4J2Cg5KtJ4RLi+gBauqbjwPplSV4kyc6sRELvtos7t9Xf6/hDGeDGiFCMVf
         qGiTc5Rl06FAvaiqK3m73Lk3LOUjOMAZ4mJOBsyHOL+TurNX3r6AIDQ93X8n4KhAzg5u
         h0ZwEIIKveoXvaMNk+fWtUt09v2WttCs9I/XFJjGCybf4CzCOlDRAtlztWeXIpRBeN0J
         lMag==
X-Gm-Message-State: AOAM531j6liN4Oo/5kxB30HN25q8n3R6HB59mN6DLsvMFKB8zuKDw+9C
        kKgoECVlM3+C3d+e5EHj7ffaaMCmea/b4jnI4A==
X-Google-Smtp-Source: ABdhPJxRoRbhguQBagO0k4q9sWj7ccsbzGT19nQOIPfZuxRJmibyjZXyUBZ5IAfhhZRR+fip8a7H/Q==
X-Received: by 2002:a17:90a:ea98:: with SMTP id h24mr14047576pjz.7.1626421884080;
        Fri, 16 Jul 2021 00:51:24 -0700 (PDT)
Received: from localhost.localdomain ([120.138.12.214])
        by smtp.gmail.com with ESMTPSA id 21sm9253357pfp.211.2021.07.16.00.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jul 2021 00:51:23 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/3] MHI fixes for v5.14
Date:   Fri, 16 Jul 2021 13:21:03 +0530
Message-Id: <20210716075106.49938-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Greg,

Here are the MHI fixes for v5.14. 2 of these patches missed the 5.14 merge
window and one has been added recently.

Summary:

1. Fixed the MHI wake routines used for the newer modems such as SDX55 and
SDX65 by using no-op routines only for the older modems and then relying on
the default routines provided by MHI stack for newer ones.

2. Added validation for the channel ID read from event ring. If we get events
from an invalid channel, we throw an error message and skip the event.

3. Fixed the broken QRTR implementation due to the missing auto_queue flag in
the corresponding DL channel declaration.

Please consider merging!

Thanks,
Mani

Bhaumik Bhatt (2):
  bus: mhi: pci_generic: Apply no-op for wake using sideband wake
    boolean
  bus: mhi: core: Validate channel ID when processing command
    completions

Loic Poulain (1):
  bus: mhi: pci_generic: Fix inbound IPCR channel

 drivers/bus/mhi/core/main.c   | 17 +++++++++----
 drivers/bus/mhi/pci_generic.c | 45 ++++++++++++++++++++++++++++-------
 2 files changed, 48 insertions(+), 14 deletions(-)

-- 
2.25.1

