Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11A551DD3B5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2020 19:03:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729862AbgEURDA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 May 2020 13:03:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728659AbgEURDA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 May 2020 13:03:00 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B6FDC061A0E
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2020 10:02:59 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id n11so3441546pgl.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2020 10:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=BDvi9M+xkQ8DYDy6nISbQv1xlb2xgpuqiWFCmxXzSnQ=;
        b=IXj1Cz7fg2904ihcRCJj+tpLbjYRMtyoJZxACGsyja88zytdmFRa5HkdXXnn05/MiF
         2z1A9CxSgZSWcDLfrcqdyJeLKugbd0Iw1BoMR7fCkHkMFX+FSbh+P4IWgnXccVIcYDMe
         PVKZLaPdzUSGZlZWKOVK1dbdvLCAfoPadqU5a9s/OcFtLyYqwzEm8NPW1QJcyi7jreTP
         mXkz/tG41cS340rdV6+36En2NpTLDjgu2DvvqFSgC0pggCPqkhNLWa1mSO8RbLap7dOK
         6PzEuKWzJ9cxENEfij+++eh7Wwg9810S4Nes8g2j9YWRGBHE2TKyjoJtnIemwbdwVzWo
         0X3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=BDvi9M+xkQ8DYDy6nISbQv1xlb2xgpuqiWFCmxXzSnQ=;
        b=gmTKMPU3W4uPmhbojhug6k5woxCQANIztCsC5yTjgpCDYSkKdMf81N1zP+b64VgxM/
         DdWXZO27tT24nU4B93nGgQEiUqgJXDQJUFrU71AtOpjbmoDn5lF0vGs4N82z/orfhslX
         GFLnlek4UK7z5tBXSMOZU9UjxZl2Zu5zx3DGwrm1dSMk6bBE0GbsXBo29zggkNqKkN1p
         j3OB3RjfayFRMFh63AegdpmH0lWzEvxVaKjaCPZAIpum6sCTqnkHctV4dqXo6YNcJDrz
         THB+XUQUH7SG5VjSrty83x0yEtfJf9/5NWAXCIwVKfda1QZ01d5aqK/uejSGmkd7mbMP
         8ZUg==
X-Gm-Message-State: AOAM532gNe9bmxAuKiaRGgCM/vP6jLLLhZTwowzm7leEJ2k0sjMm5LY0
        orcZE7rU6kTuDLO1Plw1ryhS
X-Google-Smtp-Source: ABdhPJyj0/gL7DlhGRvvKNNZf5mGxvQX6V4tdcFV+EDyVUfbTIpBCURU/CExIKXYSQX5OFX5B22XSA==
X-Received: by 2002:a63:3ec4:: with SMTP id l187mr9765112pga.358.1590080578582;
        Thu, 21 May 2020 10:02:58 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:69f:45f2:3d8d:3719:f568:7ee9])
        by smtp.gmail.com with ESMTPSA id e26sm4874693pff.137.2020.05.21.10.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 10:02:57 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, jhugo@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [RESEND PATCH 00/14] MHI patches for v5.8
Date:   Thu, 21 May 2020 22:32:35 +0530
Message-Id: <20200521170249.21795-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Greg,

Here is the set of MHI patches for v5.8. Most of the patches are cleanup and
refactoring ones. All of them are reviewed by myself and Jeff and also
verified on x86 and ARM64 architectures for functionality.

Here is the short summary:
-------------------------------------------------------------

- The firmware download was handled by a worker thread which gets scheduled
when the device powers up. But this thread waits until the device gets into
PBL state (notified using PM state worker). Sometimes, there might be delay for
the device to enter PBL state and due to that the firmware worker thread will
timeout. So in order to handle this situation effectively, the firmware load
is now directly called by PM state worker instead of scheduling the thread.

- Return proper error codes incase of error while loading the AMSS firmware
through BHIE protocol

- The MHI register space of the device accepts only non-zero values for the
sequence identifier. But there is a possibility that the host might write zero
(due to the use of prandom_u32() API). Hence, a macro is introduced which
provides non-zero sequence identifiers and used them in all places.

- Moved all common TRE generation code to mhi_gen_tre() function

- The MHI host reads channel ID from the event ring element of the client
device. This ID can be of any value between 0 to 255 but the host may not
support all those IDs. So reject the event ring elements whose channel IDs
are not within the limits of the controller.

- Limit the transfer length read from the client device. This value should
be within the size of the MHI host buffer but there are chances this can
be larger.

- Remove the system worker thread for processing the SYS_ERR condition and
instead call the function directly from EE worker. This is done to avoid
any possible race while MHI shutting down.

- Handle MHI power off in the state worker thread as like MISSION_MODE. This
helps in preventing a possible race condition where a power off is issued by
the controller while processing mission mode.

- Skip the handling of BHI interrupt when the register access is not allowed
due to the device in wrong PM state.

- The write_lock of 'mhi_chan->lock' should only protect 'db_mode'. Hence, use
it properly in places where it is protecting other unwanted regions.

- Reset the client device if it is in SYS_ERR state during power up.

-------------------------------------------------------------

Please consider merging!

Thanks,
Mani

Bhaumik Bhatt (4):
  bus: mhi: core: Handle firmware load using state worker
  bus: mhi: core: Return appropriate error codes for AMSS load failure
  bus: mhi: core: Improve debug logs for loading firmware
  bus: mhi: core: Ensure non-zero session or sequence ID values are used

Hemant Kumar (9):
  bus: mhi: core: Refactor mhi queue APIs
  bus: mhi: core: Cache intmod from mhi event to mhi channel
  bus: mhi: core: Add range check for channel id received in event ring
  bus: mhi: core: Read transfer length from an event properly
  bus: mhi: core: Remove the system error worker thread
  bus: mhi: core: Handle disable transitions in state worker
  bus: mhi: core: Skip handling BHI irq if MHI reg access is not allowed
  bus: mhi: core: Do not process SYS_ERROR if RDDM is supported
  bus: mhi: core: Handle write lock properly in mhi_pm_m0_transition

Jeffrey Hugo (1):
  bus: mhi: core: Handle syserr during power_up

 drivers/bus/mhi/core/boot.c     |  75 ++++++------
 drivers/bus/mhi/core/init.c     |   8 +-
 drivers/bus/mhi/core/internal.h |   9 +-
 drivers/bus/mhi/core/main.c     | 194 ++++++++++++++++++--------------
 drivers/bus/mhi/core/pm.c       |  86 +++++++++-----
 include/linux/mhi.h             |   4 -
 6 files changed, 217 insertions(+), 159 deletions(-)

-- 
2.17.1

