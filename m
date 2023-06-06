Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A912724223
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jun 2023 14:31:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232466AbjFFMb2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jun 2023 08:31:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231320AbjFFMb2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jun 2023 08:31:28 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 290D610C6
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jun 2023 05:31:27 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2566e60cc5aso4949890a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jun 2023 05:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686054686; x=1688646686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tnSMPv17DxTIc0EApfFv62sMiPCzQPBGurL8DNcMIjg=;
        b=ED5wHJmn8ZLA4iS49IErYUL2x+RV79G+ND9qTHeNJbgfhZx7HbbumKO2Om+e9nia4V
         yLaa3ju2IQyNwjbRagoYWRS8/l4YVdjaaw6ihstAhHGdELxqy6r+TLRL2ywnhZciz3KV
         GnAEUMWUEEL21U3AJweaap5Ejp07h7T8TlbdcFl6CRQX7Wm+mscilpdpQLlPOBqMlPo2
         MriRTlfdFH7X8ZHh1SrhCrNNIG5XlOO7DgaBK4BKLkHnI6MIfD5pNEhzYAvNO3ANhGE6
         DtvXj5S0QGMn1naH/1ZH9yW9pz5Ug+gFXZ/hzfvymwHBZWUwoCGvIUxnaDAe+7MtLYqL
         JSAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686054686; x=1688646686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tnSMPv17DxTIc0EApfFv62sMiPCzQPBGurL8DNcMIjg=;
        b=aFxfQw0zs38SZBxQHyBr6Ln4lkJXX7Ag2A+qM0i7KMj6YrGy+S8V9t0wAAceYJX0CM
         /+qr+yq8XPaT6+mORnUo81d1IOzSwikkAEaIkBrA8OqbRTbcA+UzckiW8p+yotCv6+8H
         E2+4tLNGuN8pqjMiGbXS7PdOQaLQPiSJXve1pdSoUscgbz/gheGM/PU+qiyVr9yUs6ZA
         Ub7MqJVvjQQ2p9YhHQOgTzNIrkDvqOH2Xu11uN06v0RLpfvxwvGzcoLnRSW26b0KMNJq
         BuEeWAt1x1a45uwYg5qOfafvgid0IB0L6jBp/bBVfqJh6eoOopi+2H2MUx4A4KCQLjZ9
         lH/g==
X-Gm-Message-State: AC+VfDzqIRjyzdeqyK2Scgq95pvWR5misfP8JZg9pVLFfVnPJ7tNgwBu
        VX2JX2ZjzBa9J3KlTj9aD1xa
X-Google-Smtp-Source: ACHHUZ5LRdxhkL8Kk+RGl8CqeDCwiNOHqL0Cxwey/pXI4lj1u2B/gUi3CJwfcNE/jc4Z0yeasnVUKw==
X-Received: by 2002:a17:903:22c3:b0:1b0:3df1:c293 with SMTP id y3-20020a17090322c300b001b03df1c293mr2206016plg.45.1686054686649;
        Tue, 06 Jun 2023 05:31:26 -0700 (PDT)
Received: from localhost.localdomain ([117.202.186.178])
        by smtp.gmail.com with ESMTPSA id q5-20020a170902c74500b001ae59169f05sm8446431plq.182.2023.06.06.05.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 05:31:26 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/3] Add MHI Endpoint network driver
Date:   Tue,  6 Jun 2023 18:01:16 +0530
Message-Id: <20230606123119.57499-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

This series adds a network driver for the Modem Host Interface (MHI) endpoint
devices that provides network interfaces to the PCIe based Qualcomm endpoint
devices supporting MHI bus (like Modems). This driver allows the MHI endpoint
devices to establish IP communication with the host machines (x86, ARM64) over
MHI bus.

On the host side, the existing mhi_net driver provides the network connectivity
to the host.

- Mani

Manivannan Sadhasivam (3):
  net: Add MHI Endpoint network driver
  MAINTAINERS: Add entry for MHI networking drivers under MHI bus
  net: mhi: Increase the default MTU from 16K to 32K

 MAINTAINERS              |   1 +
 drivers/net/Kconfig      |   9 ++
 drivers/net/Makefile     |   1 +
 drivers/net/mhi_ep_net.c | 331 +++++++++++++++++++++++++++++++++++++++
 drivers/net/mhi_net.c    |   2 +-
 5 files changed, 343 insertions(+), 1 deletion(-)
 create mode 100644 drivers/net/mhi_ep_net.c


base-commit: ae91f7e436f8b631c47e244b892ecac62a4d9430
-- 
2.25.1

