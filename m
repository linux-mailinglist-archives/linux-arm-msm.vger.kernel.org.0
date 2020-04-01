Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65CB319A588
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2020 08:45:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730426AbgDAGpJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Apr 2020 02:45:09 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:36855 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731683AbgDAGpH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Apr 2020 02:45:07 -0400
Received: by mail-pg1-f196.google.com with SMTP id c23so3270805pgj.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2020 23:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=csVYTYfjTqbGWMeGQR9zKoMblf3SbVsagJxZkrL+InA=;
        b=hpVU1R962Piv0K4jnO+Nr/AyCJsL8pX+aUH0/uLvf4naOP4yDk1SgEF8dtifL2TAaV
         XoO+3j2sy8c0oETI4zi/3jNj8EUNWpO2LdssXmUC7IRFuV5hWlBXG5rN382pnIQL0lw9
         hS8wN0zoAGAOG4AEP2nswH0qpG61io4jKa3tAx1IRvzJca22F2O8FE3p/jW3tRU66pFC
         4kb/WLXY9v+WNRoi4SPjMDGZWmS3LQP6OfnB8oPqTMsWeAGB+GYa7/TyvaCBdf5ouAWX
         CsQx2Dyav84QOSNvJiUiOvc0A89+28m2ZGHf9xcLdaW88VDrCD+DuCo/zyt0OdgvRsWC
         Md+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=csVYTYfjTqbGWMeGQR9zKoMblf3SbVsagJxZkrL+InA=;
        b=J8/fmmJfc3BIIkzzDHAPrfbqIgbN1StbK9og9KeGjLCDsdg+c7a9B9EraZspM/+N8D
         qCbB5RYnPA+13rbqf0my5ZxJce9WVpqezvHmLR5CsuNudROc/HQkdoUeevI22x/nBRRd
         wSr7fwQPl8oXByp4FM+UE8R6DURhgWg2y89xcvtrIk4vtCk4jTUAi0l9GXu0168gNlRf
         ISc4+XLS9A7nni4h1DzXbx++/FLDDGMczUM8Ol4Op4QTZZ9xUVZJG1Pst2kC0FJs91rP
         howuTC7DYGjol1UlFyAB5Lj+ZsC+k/7tIsmXU432yG0S4SbaRDRNpUJtGR7ymnXsVbFm
         C+Ww==
X-Gm-Message-State: ANhLgQ0ZMfyPUBkjB+Aa7s7YpjlBTgEWdkZUipqlkDIsCehgwSEGDAP9
        LA9ybt7hIOJHRqQ4y0gALnQfj0BEd4Oe
X-Google-Smtp-Source: ADFU+vvgzMtlpPO2xjjNC3QCrYxppVjHEzjMoYTmj9+Uw43brLLRXBvEMJHpSB+LOOogC10+wWjAVg==
X-Received: by 2002:a63:f95c:: with SMTP id q28mr20973084pgk.321.1585723505866;
        Tue, 31 Mar 2020 23:45:05 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:648c:592d:60f5:6f58:e46:db78])
        by smtp.gmail.com with ESMTPSA id w24sm831962pjn.14.2020.03.31.23.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 23:45:05 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org, davem@davemloft.net
Cc:     smohanad@codeaurora.org, jhugo@codeaurora.org,
        kvalo@codeaurora.org, bjorn.andersson@linaro.org,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/3] MHI bus improvements - Part 2
Date:   Wed,  1 Apr 2020 12:14:32 +0530
Message-Id: <20200401064435.12676-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Greg,

Here are the remaining patches left from the pervious series. The QRTR MHI
client driver has gone a bit of refactoring after incorporating comments from
Bjorn and Chris while the MHI suspend/resume patch is unmodified.

Dave, can you please look into the QRTR MHI driver and provide some review?

Thanks,
Mani

Manivannan Sadhasivam (3):
  bus: mhi: core: Add support for MHI suspend and resume
  net: qrtr: Add MHI transport layer
  net: qrtr: Do not depend on ARCH_QCOM

 drivers/bus/mhi/core/main.c |   3 +-
 drivers/bus/mhi/core/pm.c   | 143 ++++++++++++++++++++++++++++++++++++
 include/linux/mhi.h         |  19 +++++
 net/qrtr/Kconfig            |   8 +-
 net/qrtr/Makefile           |   2 +
 net/qrtr/mhi.c              | 126 +++++++++++++++++++++++++++++++
 6 files changed, 299 insertions(+), 2 deletions(-)
 create mode 100644 net/qrtr/mhi.c

-- 
2.17.1

