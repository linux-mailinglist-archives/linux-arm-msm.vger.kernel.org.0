Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0D511DADE5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2020 10:49:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbgETItF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 May 2020 04:49:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726224AbgETItF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 May 2020 04:49:05 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33CBEC061A0E
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2020 01:49:05 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id d10so1124650pgn.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2020 01:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mUXoHCk9YjTWtIe6lbZRmuzsCBfcD819p2whO3KZzec=;
        b=V5P8TwdKayVbTIZwm1h3TmhwoplB3ufnXPirbcvqxIZEaxZVWo0JRlVQXvn8r/K9gs
         4RCoyH9TJpBmE8kcM8SF1Pri5yYNd/oHodStSUbHGHkVSz6HoibzfFJ1V8C6qAr2rdlA
         gF1hsua1hK1WBDyQjqDBj3rPex1e8ZH7Wtt1XGHM76n13q9hSyWaiCsdTMRjFGTIGeOL
         q6bTFWs4FODgiQLavsdRlt2teB+gCiMl+V58t7MsCN2HkyJMn17q9jhBEgB/BZHNsDed
         wN5elR8SYIg3OOyqNlmAHfTXdA8I6mGY0s+tSsP0WDOHVScKLX87TVdsjjA82uKJqzrQ
         ItTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mUXoHCk9YjTWtIe6lbZRmuzsCBfcD819p2whO3KZzec=;
        b=HOb6tgIbFwCUyPvWp4JL/LfEFYfK+3O7xJNoNDBdaWwIdaXhP+12o+BFzzaM4AZLfr
         D8btOrFTSQB9mtbBG3CfERL8KONHg0LDeEXczdV2nqPSS1c1x+Kcisk4VCgQuMW67tky
         w6hds5oZmStX/3qE05ukEmwdHR99k/eZIIblHnu/CDrKX45uuPXPgNrKvNlpgNW0S+uq
         c5Wae/UAAYEggVim3BPR/keDQ5WxIvsy4rk5BzLMl0Hkvqkwc+SN5CLZFNdd7dZyGUbd
         KIy62WGRp6CQYZ6+7b/IvZBr0zrK8EtWnvG62bSqa3BM/Rau7s8/VVEkn+8Gm47XCy/w
         Z0Qw==
X-Gm-Message-State: AOAM5315wzIADzmPLFr8KCGLsqb2tE+r76VIS1c2L6Oli5qHAs/7tTke
        klH1MV7xyHD1AijQ6wyd5Xd8
X-Google-Smtp-Source: ABdhPJyq90ZITiiPWo8tMvFxVbmDXvkTW65XmUrhBPoNPkXK2t+uMDsUzjGi4u3kCRRn4t6FSPQIhQ==
X-Received: by 2002:aa7:9e92:: with SMTP id p18mr3257038pfq.195.1589964544634;
        Wed, 20 May 2020 01:49:04 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:91e:dd0a:7c30:1f7e:ebdb:aa2a])
        by smtp.gmail.com with ESMTPSA id a5sm1629332pfk.210.2020.05.20.01.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 01:49:03 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     jassisinghbrar@gmail.com, robh+dt@kernel.org
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 0/3] Add Qualcomm IPCC driver support
Date:   Wed, 20 May 2020 14:18:51 +0530
Message-Id: <20200520084854.19729-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.26.GIT
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

This series adds mailbox driver support for Qualcomm Inter Processor
Communications Controller (IPCC) block found in MSM chipsets. This block
is used to route interrupts between modems, DSPs and APSS (Application
Processor Subsystem).

The driver is modeled as a mailbox+irqchip driver. The irqchip part helps
in receiving the interrupts from the IPCC clients such as modems, DSPs,
PCI-E etc... and forwards them to respective entities in APSS.
    
On the other hand, the mailbox part is used to send interrupts to the IPCC
clients from the entities of APSS.

This series is tested on SM8250-MTP board.

Thanks,
Mani

Changes in v3:

* Added Bjorn's review tags
* Few changes to DT binding as suggested by Rob

Changes in v2:

* Moved from soc/ to mailbox/
* Switched to static mbox channels
* Some misc cleanups

Manivannan Sadhasivam (3):
  dt-bindings: mailbox: Add devicetree binding for Qcom IPCC
  mailbox: Add support for Qualcomm IPCC
  MAINTAINERS: Add entry for Qualcomm IPCC driver

 .../bindings/mailbox/qcom-ipcc.yaml           |  80 +++++
 MAINTAINERS                                   |   8 +
 drivers/mailbox/Kconfig                       |  10 +
 drivers/mailbox/Makefile                      |   2 +
 drivers/mailbox/qcom-ipcc.c                   | 286 ++++++++++++++++++
 include/dt-bindings/mailbox/qcom-ipcc.h       |  33 ++
 6 files changed, 419 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
 create mode 100644 drivers/mailbox/qcom-ipcc.c
 create mode 100644 include/dt-bindings/mailbox/qcom-ipcc.h

-- 
2.26.GIT

