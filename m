Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEBBB32C1E7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 01:03:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1389557AbhCCVjX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Mar 2021 16:39:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380333AbhCCN3f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Mar 2021 08:29:35 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A225C061224
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Mar 2021 05:26:31 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id jx13so4161556pjb.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Mar 2021 05:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=L6GPr+tPT+/4tcVANy2DgWP8y/cMrSyWJznHIgnnhM0=;
        b=AFWAN08okyrxQhdPLMUpHy6dAp/iyoeGDbJEjwCW8PFLC1VRkKU71EiMvVkR8Bo7zu
         9vatb1kA2bvH9wFFtRgnYA/8zKGV+xCuogESKv3PJ3Yo+yItZEthca5oBKXN3548sSVv
         5SAhzTNL4KNdsOoBHU+ZJw9cNdA3N0w1Xg65kQHriF6cWhV02ftTeuiLn/v896n5s/2C
         TsgfbGxW5TXGiKaQ8tAbNkmenvJ9Xrvf/+Qu4LzOmreZuKRU/WScaoKtdk2/qA5utFJe
         4EGrcRoh9CJKhv9cCHsSbP1WlkNSCHWZ2zdtohy73KAfXNilHxlnaQi7Syv8LdAUfY6n
         A1zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=L6GPr+tPT+/4tcVANy2DgWP8y/cMrSyWJznHIgnnhM0=;
        b=LGdXMQ4yAcy45TWRbE81f3IEcCYGMb6F7JbEpLYmGL4XPCEcfvbwEaIBObIHQsEepG
         qtBjdXSRWbM782Vre+Pwj/YxJTrElMoftAFK03+xyXPsazRjS8m1W3dbEawcjen4yqk2
         XHsvRQ1G6fEU7oG6xwfzE41Uq2/Bbk2DnTLtIqcQi6lajkLu346UTkCmYRPSSm/EaJgc
         igC92LA1rfA2HqvsHqjn3K0Yc1126JmQ6024uMKPzIooCKVrFF1yEjr1MWMI29nc5s7N
         shmhUzsUXkpXzXOyVy8n00AJF5ecXdPuHvVm8sES4o+8rScb4jfnd4d6J5dtBfGcp/Pj
         biQw==
X-Gm-Message-State: AOAM53244N0goCxJi5JnqQlzBYdylr+wxaQP2xx5ef0gs9nXtrBiaK1Y
        d9zHq2xEMTrGTz5Ec6M3yKA7qg==
X-Google-Smtp-Source: ABdhPJx2J0YNTVr7SsOV30gjr/+9A22IXtR8PmoaSXmAqr4QzTELIFrS0nUdn+mPgoE1suCCUPaGig==
X-Received: by 2002:a17:90a:1b4e:: with SMTP id q72mr9408706pjq.113.1614777991047;
        Wed, 03 Mar 2021 05:26:31 -0800 (PST)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id y20sm24425044pfo.210.2021.03.03.05.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 05:26:30 -0800 (PST)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v2 0/2] Add ACPI support for SC8180X pinctrl driver
Date:   Wed,  3 Mar 2021 21:26:20 +0800
Message-Id: <20210303132622.4115-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is a couple of patches that enable ACPI probe for SC8180X pinctrl
driver.  The msm core driver needs a bit change to handle tiles mapping
differently between DT and ACPI.

Changes for v2:
- Pass soc_data pointer via .driver_data.
- Drop use of CONFIG_ACPI and ACPI_PTR().
- Add comment for sc8180x_acpi_reserved_gpios[] terminator.
- Add comments for tiles handling.

Shawn Guo (2):
  pinctrl: qcom: handle tiles for ACPI boot
  pinctrl: qcom: sc8180x: add ACPI probe support

 drivers/pinctrl/qcom/Kconfig           |  2 +-
 drivers/pinctrl/qcom/pinctrl-msm.c     | 27 +++++++++++---
 drivers/pinctrl/qcom/pinctrl-msm.h     |  1 +
 drivers/pinctrl/qcom/pinctrl-sc8180x.c | 49 ++++++++++++++++++++++++--
 4 files changed, 72 insertions(+), 7 deletions(-)

-- 
2.17.1

