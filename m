Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C05E74300B0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Oct 2021 08:57:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236519AbhJPHAB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Oct 2021 03:00:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234473AbhJPHAA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Oct 2021 03:00:00 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35A62C061570
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Oct 2021 23:57:53 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id c4so3598117pgv.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Oct 2021 23:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Yo4Wqb6VoTR0Zqbgv4qNbxaNAKZMu5PTucXP4Fkz5Xw=;
        b=wiCWwrstEMOa3ky455f7bzsx96QVi6p+Sxiq2WJJp4DnqG0sYM7q3/ZFz5/2nOXRAY
         139PNuKWpqNrkk0kie2xsWImiszGYp+QSWgwLINbWdbrNAczDd5gQ6bstpMC2pp5Axzd
         kJFTBTWY/fn6r96zFMeyJhyUR/BZLMOF2HDvul24hE5T9UBXhGfcD/v1imYT0wGAjh5v
         M/i8GyPZ1cNGSj2toAHidia8W2yfsFylHGNsrdwq35E5qNNTatFB05hVQLpakTGS+hRT
         I7Ll5fqPGvheWbsHIqB18wltDjdjis2WFj6oNHy31/hWG358e+aE96JifGJ++EIflkON
         KItw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Yo4Wqb6VoTR0Zqbgv4qNbxaNAKZMu5PTucXP4Fkz5Xw=;
        b=k9OINZ7Aj1XCr3C48PgF3V7KCqhz6QHXh7922Y9dAnJ2NF38GRAhISAvvarHVT5DNs
         ALwru4MUQhpdLePf1+vlrk19cfhljIdwOUfCCxGtGaxHJZ9IVn6BVqe0D75Flb4PasWX
         wMWveitW0IeAu2gq1kMpMxfbvvpfI0atYpVNq0et9eLhMoksPJuVh8xGB0B88298I813
         hiPOfP8Mz9OSohhCVWH9tjd26xRW1bJhgfZT5tw0wScV6qINohIsnLysHLYsKCDA8BUc
         6NTgxyL/A0+3IJiwQlxIj7XS0CbSW66I/0dec923qR/7elU9OPIIBIsTMn9ihDprzn1g
         KtuA==
X-Gm-Message-State: AOAM533ag/bHcfC66ywHG5VaZua2fTzD/Zq/+Gaxx/pTIf8sg/1DlcCH
        GWxpjFJhYis2V6/ttOuUYT/k
X-Google-Smtp-Source: ABdhPJwF6CIMG/7f/lK6ddQqBMRLsEU5RdJkeWvzgnlwhyyqyrgkvog5VeZ1p2Of/iKPVLAex10l5g==
X-Received: by 2002:a05:6a00:1354:b0:44c:eb65:8570 with SMTP id k20-20020a056a00135400b0044ceb658570mr16208917pfu.34.1634367472448;
        Fri, 15 Oct 2021 23:57:52 -0700 (PDT)
Received: from localhost.localdomain ([117.202.185.237])
        by smtp.gmail.com with ESMTPSA id a17sm7024253pfd.54.2021.10.15.23.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 23:57:51 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        loic.poulain@linaro.org, wangqing@vivo.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/3] MHI patches for v5.16
Date:   Sat, 16 Oct 2021 12:27:31 +0530
Message-Id: <20211016065734.28802-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Greg,

Here is the small series of MHI patches for v5.16 with summary below:

1. MHI got a dedicated mailing list in subspace server. Hence, updated the
MAINTAINERS entry adding it as the primary list.

2. A leftover patch from 5.15 PR that adds a dedicated flag to the MHI client
transfer APIs for inbound buffer allocation by the MHI stack. This is required
for some downlink channels like QRTR that depends on pre-allocated buffers.
Since the patch modifies the MHI client drivers under "net/", Ack has been
collected from the netdev maintainer.

3. Fixed up the coccicheck warning by using sysfs_emit instead of snprintf.

Please consider merging!

Thanks,
Mani

Loic Poulain (1):
  bus: mhi: Add inbound buffers allocation flag

Manivannan Sadhasivam (1):
  MAINTAINERS: Update the entry for MHI bus

Qing Wang (1):
  bus: mhi: replace snprintf in show functions with sysfs_emit

 MAINTAINERS                      | 3 ++-
 drivers/bus/mhi/core/init.c      | 2 +-
 drivers/bus/mhi/core/internal.h  | 2 +-
 drivers/bus/mhi/core/main.c      | 9 ++++++---
 drivers/net/mhi_net.c            | 2 +-
 drivers/net/wwan/mhi_wwan_ctrl.c | 2 +-
 include/linux/mhi.h              | 7 ++++++-
 net/qrtr/mhi.c                   | 2 +-
 8 files changed, 19 insertions(+), 10 deletions(-)

-- 
2.25.1

