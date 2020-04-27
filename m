Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24FAC1B9923
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2020 09:58:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726717AbgD0H6s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Apr 2020 03:58:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725785AbgD0H6r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Apr 2020 03:58:47 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0879DC061A0F
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2020 00:58:46 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id n24so6692312plp.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2020 00:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=sS5L/PS46NetQ9lyauwQFXyUrQrbbC+YDoPejAuOTaw=;
        b=k2rCR+/s71AZvcKqgh2SLyQJDbpZPDqRuL1FzAGi90zFNizH9XYLW/Gbppg95HqSFO
         o4HY/GguFiC1bpnemLQQIklcWiVKWCj79ssYrbwE/eq3UgLFMrd83gNSj4XqiPciN1Vh
         /lV/FWtTgVvOu9hSODHku16Kg5fijfchPm0kVbbjKXNZVnTT6DWobDutq5SM1B2McuOG
         5mP9PBeVmZ3Zw8JKr3cSlLyUtpqVqpZfJQOQNV5i+JC3tjpwYXQVIfZ8FnCEpicI4k9Q
         qeL6UI58MTyWgESgYNQcKEQMjXWY06qz+32EovtMr/2/+Trh7spujZC/JhrGbUxGP+Ac
         wqCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=sS5L/PS46NetQ9lyauwQFXyUrQrbbC+YDoPejAuOTaw=;
        b=o3EWIAC5L7gPxB6QIbXkkhjFlSPKDiQBZX3GateEDXbcTl8kuhLJ1E7/hAJvfY8hOZ
         5lBqBxXzc3Xd2u8XiRy1c2jFGx6k7HZ6QyZylCkq3XA1Wbx59DHzZGi7ewOuDbjcdXlY
         /R5JbVOKjJlgC+HxhxhcZtUqGKQ2hp3cilJONc/uAQBacobSwOAbN966ynOieE7nUg/6
         +OHd/otx0EOW1cShTKM13F0uL1Vo5yF67Qncie2Nf2dHKmL/Zb85dLo8mVQs5o+JNT0F
         6GJ5ohbtl4ZkigKbM9K8H2zpRlB5wktjX6cxk1cMAzFGOG3/haF302CWti90e/1DmUgF
         YG2w==
X-Gm-Message-State: AGi0PuYIA3yQ5SbG6JZtJwD0VpiMSGsWQYuH+5Z3NK/k8zn/ECXCYtFN
        5/mfYX4bwXKuhylbQPOkFAqP
X-Google-Smtp-Source: APiQypLJCj5uKfvTcGknUFVxK/qp38wl5tkIm014Dp2o5KhANZyztVua6GnbfQ5qmO+3EpOLa9GbhA==
X-Received: by 2002:a17:90a:9202:: with SMTP id m2mr22905890pjo.109.1587974325485;
        Mon, 27 Apr 2020 00:58:45 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:996:8534:f925:aed4:6e41:e1dd])
        by smtp.gmail.com with ESMTPSA id a12sm11621190pfr.28.2020.04.27.00.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2020 00:58:44 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org, davem@davemloft.net
Cc:     smohanad@codeaurora.org, jhugo@codeaurora.org,
        kvalo@codeaurora.org, bjorn.andersson@linaro.org,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, clew@codeaurora.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 0/3] MHI bus improvements - Part 2
Date:   Mon, 27 Apr 2020 13:28:26 +0530
Message-Id: <20200427075829.9304-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Greg,

Here are the remaining patches left from the pervious series. The QRTR MHI
client driver has gone a bit of refactoring after incorporating comments from
Bjorn and Chris while the MHI suspend/resume patch is unmodified.

Thanks,
Mani

Changes in v3:

* Added Bjorn's reviewed-by tag
* Used goto for common error path as in qrtr/mhi suggested by Markus Elfring

Changes in v2:

* Moved sock_put() before consume_skb() in QRTR MHI client driver

Manivannan Sadhasivam (3):
  bus: mhi: core: Add support for MHI suspend and resume
  net: qrtr: Add MHI transport layer
  net: qrtr: Do not depend on ARCH_QCOM

 drivers/bus/mhi/core/main.c |   3 +-
 drivers/bus/mhi/core/pm.c   | 143 ++++++++++++++++++++++++++++++++++++
 include/linux/mhi.h         |  19 +++++
 net/qrtr/Kconfig            |   8 +-
 net/qrtr/Makefile           |   2 +
 net/qrtr/mhi.c              | 127 ++++++++++++++++++++++++++++++++
 6 files changed, 300 insertions(+), 2 deletions(-)
 create mode 100644 net/qrtr/mhi.c

-- 
2.17.1

