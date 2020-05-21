Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A156A1DD1B2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2020 17:27:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730073AbgEUPZ6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 May 2020 11:25:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:34074 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730047AbgEUPZ6 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 May 2020 11:25:58 -0400
Received: from localhost.localdomain (unknown [157.51.235.56])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3C8EA204EA;
        Thu, 21 May 2020 15:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590074757;
        bh=qRG8lbmluipgAY768NW15223dzdqeUdbfiaiiG1Jky4=;
        h=From:To:Cc:Subject:Date:From;
        b=eEX+c8ULA4bklVxe9vhjkTy5tOkb54z2mq6pGaSGbzm0CPyi7J5Xm5msCsQVevR3I
         EFu4VN+F2Ueurx/NoMfscmXa/vcmpQcwtfvVReafAQJaoMtA9FPECsnHEsaZ8kal0E
         35keX7e1F6FQ38oJahsO3HVWUvI3L4GT9F5d8FOs=
From:   mani@kernel.org
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, jhugo@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 00/14] MHI patches for v5.8
Date:   Thu, 21 May 2020 20:55:26 +0530
Message-Id: <20200521152540.17335-1-mani@kernel.org>
X-Mailer: git-send-email 2.26.GIT
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

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
2.26.GIT

