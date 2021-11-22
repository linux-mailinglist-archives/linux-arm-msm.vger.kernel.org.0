Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 386F3458AC4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Nov 2021 09:51:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232560AbhKVIyl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Nov 2021 03:54:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229806AbhKVIyk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Nov 2021 03:54:40 -0500
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 035F9C061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Nov 2021 00:51:34 -0800 (PST)
Received: by mail-pg1-x536.google.com with SMTP id d4so537814pgc.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Nov 2021 00:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=vN46N1+4oQ0oMJzswL8DTaFRap35wbWPoW8w+rqf+MQ=;
        b=kHjZyfDVjJd+r/iCSVg6WzoW7vmtfsn6ulQrxELauq1RcJMmO60YU0oxsGzhs5cOfz
         ckI52wnBlRYmxjp/rb6zI0yOoPz/426BYuox4D0FoFBdH3eRVASmVMJhYugvwrs2UeBX
         kI3a4/uGUSjw85hanWUhvCLyKQnRUHUhCUoftgAmOSa0EyHx0tRndZDwSQKmG7O7cidp
         yHCGrrnbVPjqKJ7uxq1LXtFQKgONnshfNgt59YhWLgne+HJ9xXQ/JxkE1XDR1BUil25w
         iI4Y9ngCvNFNeREfDVcBtx9xgyGUXFHs4x6KQU3nhqqRCBC6UrJ0EBktW6oBKaQiP4z8
         rmNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=vN46N1+4oQ0oMJzswL8DTaFRap35wbWPoW8w+rqf+MQ=;
        b=nLxhsBjGrTTiatDDUzHMyQpvXZ2howD4tsR1p6kxWSi0gKLL9AxfU4DwTtnNqnLJJ9
         9XUognPlpaEx8LLjktedOSXymiezHJSpikH3+c1t4xsbbqcGLEeQbsMFBBL5W1+jbFwT
         B4Q7CTDO16NuyYpezGgWdIFNGOmauszj1YzsESCOzaQ4wS7IPmtnF0m2nN9atAUT1i7I
         6U1/b9RRJb5rGtKoZ/gl0Js4XNlbpCCCggfZFed7CaX/GzX2JKbIcxpUBL9O5CNfA+xb
         czLMWAhjFN0av9BdGfoUdSZXl7nIFS+ILQpRifAG9sGE93iyEY8tGcbQ8iQx4lPuKdLN
         9xwg==
X-Gm-Message-State: AOAM533LoWXeB+kuHxK4DmGtzBNyAKAAXaYATwOU0lgRoh3VUgCIx7KC
        VS2qyClxDl6S/0Ukd6kih4r+IQ==
X-Google-Smtp-Source: ABdhPJwCjflmLnGpIAwZk/wazQD7KDeEQC25uzRlzJwNzKJxN6YsNC3e+imykdsoDhQvqjD4j7THeA==
X-Received: by 2002:a62:ea10:0:b0:4a2:c7bc:c5ec with SMTP id t16-20020a62ea10000000b004a2c7bcc5ecmr43270685pfh.44.1637571093586;
        Mon, 22 Nov 2021 00:51:33 -0800 (PST)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id f8sm8445582pfv.135.2021.11.22.00.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 00:51:33 -0800 (PST)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Georgi Djakov <djakov@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v2 0/6] Add QCM2290 interconnect support
Date:   Mon, 22 Nov 2021 16:51:17 +0800
Message-Id: <20211122085123.21049-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The series begins with a separate cleanup on icc-rpm, followed by a few
prep changes for QCM2290 support, and then adds bindings and
interconnect driver for QCM2290 platform.

Changes for v2:
- Drop unneeded include of <dt-bindings/clock/qcom,gcc-qcm2290.h> from
  bindings.

Shawn Guo (6):
  interconnect: icc-rpm: Use NOC_QOS_MODE_INVALID for qos_mode check
  interconnect: icc-rpm: Define ICC device type
  interconnect: icc-rpm: Add QNOC type QoS support
  interconnect: icc-rpm: Support child NoC device probe
  dt-bindings: interconnect: Add Qualcomm QCM2290 NoC support
  interconnect: qcom: Add QCM2290 driver support

 .../bindings/interconnect/qcom,qcm2290.yaml   |  116 ++
 drivers/interconnect/qcom/Kconfig             |    9 +
 drivers/interconnect/qcom/Makefile            |    2 +
 drivers/interconnect/qcom/icc-rpm.c           |   56 +-
 drivers/interconnect/qcom/icc-rpm.h           |   14 +-
 drivers/interconnect/qcom/msm8916.c           |    4 +-
 drivers/interconnect/qcom/msm8939.c           |    5 +-
 drivers/interconnect/qcom/qcm2290.c           | 1363 +++++++++++++++++
 drivers/interconnect/qcom/sdm660.c            |    7 +-
 .../dt-bindings/interconnect/qcom,qcm2290.h   |   94 ++
 10 files changed, 1657 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,qcm2290.yaml
 create mode 100644 drivers/interconnect/qcom/qcm2290.c
 create mode 100644 include/dt-bindings/interconnect/qcom,qcm2290.h

-- 
2.17.1

