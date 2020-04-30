Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F88E1C0596
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2020 21:06:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726478AbgD3TGJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Apr 2020 15:06:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726394AbgD3TGJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Apr 2020 15:06:09 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A52EC035495
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2020 12:06:09 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id s18so3238432pgl.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2020 12:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=tWF0ACowkDBZhWrJSsmW9KsyHz4WMYM16l1xzrffqLw=;
        b=ioDYb/tB4C8gJY7Uq5yK8idLsJoqvKjxFdzAe6i3lEWQtQ911ec5jUz4wfJeAvI2g3
         aAjMTi+FefZH2fh0HJ9R/FGmOWxGJHqlV7IO9SbtqKAaJgwSsFixgWqhFlEiFiPGmD3a
         +Zlrvyt+yZoER9GCqYPmthJmUYL08Q9kSNL6lRnSwPL6O/uHqaIK1TK7IlaV61TMR45f
         WvnwbE6kxHUG1u2NhH5pp9NA4ogwG00ILCIXkYige7DDeODeF/Wtn4bSkWaf15+YZrqd
         9vw5b6tLfv87Ygk5HTyT6DUhgqwPD8hOkXdsi35ojktskpwZXZSmpTLDcRCVrkgymUip
         6xWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=tWF0ACowkDBZhWrJSsmW9KsyHz4WMYM16l1xzrffqLw=;
        b=uYNBZcdK4o/3GKcNZOpY+VsyTVlLainnHRJxDpo9PRT2t6g/5JyIbNY7wr9Raac7bZ
         9QBjwb/JAxpngj0FD2YzNytNVgwdMkK434N9QfpVCkV81TUUc0OELUp3U30GSeCinRGF
         kaRogXlyUWCdPFymWb7erBcwiLeO8pzSI61e24/sshID6XeBLqbedrrXAyp0YhYY0xUy
         I683nKAqzDecnZu5XvDfnQZJ2PM+YMyy/Y+I2EBooyUVfJFo/4b5pk8SD+W16sS3jn4H
         eBPAS4bpKBjmrRQUYRzajYeRwUr8Xo4XAoO2IWigkyjvCjDIfLYBJXG5ov9JN2otYk/S
         2sXA==
X-Gm-Message-State: AGi0PubxNBPkSGGTBk7c8//3nso3ZCBUtwR33NBaeYblT7dflQ/2oBYZ
        YMHAx4nnrF3NbNViYErOvc+/
X-Google-Smtp-Source: APiQypKWzSlljYM4ucsQCL5oQ8wsVbQ8zPf1H5+QhNHLS9WcvdYSbJ1EujXouUJUx6cOYhxm73InPQ==
X-Received: by 2002:a63:fd0c:: with SMTP id d12mr380042pgh.41.1588273568624;
        Thu, 30 Apr 2020 12:06:08 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:6081:946c:419e:a71:7237:1613])
        by smtp.gmail.com with ESMTPSA id l37sm467863pje.12.2020.04.30.12.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 12:06:08 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, jhugo@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/6] MHI fixes for v5.7
Date:   Fri,  1 May 2020 00:35:49 +0530
Message-Id: <20200430190555.32741-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Greg,

Here is the set of MHI bus fixes patches for v5.7. These patches are
reviewed by Hemant and me and also tested with couple of MHI client devices.

There are a couple of changes which affect the controller interface but since
we don't have any controller in mainline, it doesn't hurt doing.

Please consider merging.

Thanks,
Mani

Jeffrey Hugo (5):
  bus: mhi: core: Make sure to powerdown if mhi_sync_power_up fails
  bus: mhi: core: Remove link_status() callback
  bus: mhi: core: Offload register accesses to the controller
  bus: mhi: core: Fix typo in comment
  bus: mhi: core: Fix channel device name conflict

Manivannan Sadhasivam (1):
  bus: mhi: Fix parsing of mhi_flags

 drivers/bus/mhi/core/init.c     |  7 +++----
 drivers/bus/mhi/core/internal.h |  3 ---
 drivers/bus/mhi/core/main.c     | 16 ++++------------
 drivers/bus/mhi/core/pm.c       |  6 +++++-
 include/linux/mhi.h             | 16 ++++++++++------
 5 files changed, 22 insertions(+), 26 deletions(-)

-- 
2.17.1

