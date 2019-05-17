Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8C3821BFC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 May 2019 18:48:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727461AbfEQQrw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 May 2019 12:47:52 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:43841 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727302AbfEQQrv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 May 2019 12:47:51 -0400
Received: by mail-pf1-f194.google.com with SMTP id c6so3933962pfa.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 May 2019 09:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZEOBQ+tiRCBCDhxOnqUK3ak9dZiYIaMI5j8XdfHoJPo=;
        b=apNC443IjOu26zOUT73921FGrnZ1n43OPBcwr8RIvJ+ZwA785Xj8ae/wdc1rrNkXDy
         23fQnlF+WLg7ie94sC7Saky9o7IuCQHw5EtDYIwfJ3Hhg5BFCSLEIgSAq/ijzHWjvVtg
         gNLSxE2QaGgEAbJZHjlXf9OVihYSzy2yxrfjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZEOBQ+tiRCBCDhxOnqUK3ak9dZiYIaMI5j8XdfHoJPo=;
        b=KFw6yiagUxiesEuQLVHzJdl9bxwuKNKsHyDIVDpOkEpUT0GP+sAI4i6FFCGN0pvSxV
         YoZrW5kJI/zptOsjCKjHZtHdheWLeelfjWFNbycrZ8XZDX0XTGsddtl7fClQKMR1e+pB
         e4JFf1hOxuVGQaT7dDokIe/b/+WvhyDQoqw3lozVyyvQpOOYV7GRwAU4v3UXHybGKWYd
         BkQMqBpOhbtlYn4Briww3D/h8j4Fxk7nq9ElkhP19mKgw7+C8V6XidnmK46b6xrZRk7y
         rLOvFBwIO6707vgidzVNHGODsnGT1zcrUJ3wt+VYqIkZy0L3iE63ARlEo9mA0+R/YBt9
         EL5A==
X-Gm-Message-State: APjAAAWHEd2Ml+NrhHC9go4w3Tv7mI685hUi4oPDUvAlSYpD0mPNeOCi
        xjm/Mu5ktkPrHxvw73KBhXG0qA==
X-Google-Smtp-Source: APXvYqxzWh7+qSyhy1qYyWLoyY4I2do1NdTj92SZJu+yMhoeS1eAS3iHOrpPbfYELyOXmcFNaUiphA==
X-Received: by 2002:a63:170a:: with SMTP id x10mr56459139pgl.355.1558111671057;
        Fri, 17 May 2019 09:47:51 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id l141sm12229810pfd.24.2019.05.17.09.47.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 May 2019 09:47:50 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Evan Green <evgreen@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Will Deacon <will.deacon@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>
Subject: [RFC/PATCH 0/5] Read-only memremap() proposal
Date:   Fri, 17 May 2019 09:47:41 -0700
Message-Id: <20190517164746.110786-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series implements a read-only version of memremap() via
a new MEMREMAP_RO flag. If this is passed in the mapping call, we'll
try to map the memory region as read-only if it doesn't intersect
with an existing mapping. Otherwise, we'll try to fallback to other
flags to try to map the memory that way.

The main use case I have is to map the command-db memory region on
Qualcomm devices with a read-only mapping. It's already a const marked
pointer and the API returns const pointers as well, so this series makes
sure that even stray writes can't modify the memory. To get there we
introduce a devm version of memremap() for a reserved memory region, add
a memremap() flag, and implement support for that flag on arm64.

Cc: Evan Green <evgreen@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <agross@kernel.org>
Cc: Will Deacon <will.deacon@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>

Stephen Boyd (5):
  reserved_mem: Add a devm_memremap_reserved_mem() API
  soc: qcom: cmd-db: Migrate to devm_memremap_reserved_mem()
  memremap: Add support for read-only memory mappings
  arm64: Add support for arch_memremap_ro()
  soc: qcom: cmd-db: Map with read-only mappings

 arch/arm64/include/asm/io.h     |  1 +
 drivers/of/of_reserved_mem.c    | 45 +++++++++++++++++++++++++++++++++
 drivers/soc/qcom/cmd-db.c       | 14 +++-------
 include/linux/io.h              |  1 +
 include/linux/of_reserved_mem.h |  6 +++++
 kernel/iomem.c                  | 15 +++++++++--
 6 files changed, 70 insertions(+), 12 deletions(-)


base-commit: 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b
prerequisite-patch-id: 62119e27c0c0686e02f0cb55c296b878fb7f5e47
prerequisite-patch-id: bda32cfc1733c245ae3f141d7c27b18e4adcc628
prerequisite-patch-id: b8f8097161bd15e87d54dcfbfa67b9ca1abc7204
-- 
Sent by a computer through tubes

