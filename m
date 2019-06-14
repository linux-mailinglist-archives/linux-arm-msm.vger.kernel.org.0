Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43FBA46A96
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2019 22:38:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727174AbfFNUiO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Jun 2019 16:38:14 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:37382 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727335AbfFNUhT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Jun 2019 16:37:19 -0400
Received: by mail-pf1-f194.google.com with SMTP id 19so2100184pfa.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jun 2019 13:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6vrmhhZaEzM19h9Zlx4Mo9l21Q8Z/1tpB8JbdgO/6Q0=;
        b=Wx04VyZXSi7uEkn+qcquHj3EoBnN4m9FX9vJIgJ6cgeChrc10QLuaKpp7+rGSiDvGN
         Sk53gojxneIiAZ8hn+pPpC6+ljGcvOasLCV6lMxQw1+3d6Tp7bsi0XiXzlyoQRZ2r0b1
         rCNafT3ZKZUrDMLDEKZq4H1mERd0VafFAJUpw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6vrmhhZaEzM19h9Zlx4Mo9l21Q8Z/1tpB8JbdgO/6Q0=;
        b=qR50dJygpYKnqneUQIjfv9/2SIM+rvfsn1XCO9hhy0gP9PAoS3JW92fWsQoEnNzB6l
         zivoeXEzMVh+t/H55BsmZTxpCwz0e3oVhMcGnzSMbv+pVo/BHB1j+RiQlHyQXsv/AVDC
         oy9hWPHKWamnQewX3dXfeL2kA9zP3VL+XLlB48JNngFdLV4M52HWgbrmSfPWsSkCc1zi
         D8QIJhi9wbPKc9VKNaYtEwRHVCMJaU8wn6EhkqJG0hc86kdkyLqNRRtlc7hflxH36Gw+
         GFxAUvjBCyNM4+D5j9cx8NbfHDrlz/XmAds3XwrptQlJ530mIHPTcup0DYYTDwkj6pSb
         UMPg==
X-Gm-Message-State: APjAAAXvQjOfC2rbxseST2HPIr/ExbZbsTf4LKjxTPH/4jDofHpx4Jen
        Bn4Z24yse3Uj/BxSA8TPalS/6g==
X-Google-Smtp-Source: APXvYqzfpvXhgutGtT3dFx0GfX5kTtc8h04BE0rk7Qac+K8Ljsdx6ZzVsIxdzlj/CBTPmUiseBZrxw==
X-Received: by 2002:a63:6005:: with SMTP id u5mr28274041pgb.123.1560544639097;
        Fri, 14 Jun 2019 13:37:19 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id x5sm3673187pjp.21.2019.06.14.13.37.18
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 13:37:18 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Dan Williams <dan.j.williams@intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Evan Green <evgreen@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Will Deacon <will.deacon@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH v2 0/5] Read-only memremap()
Date:   Fri, 14 Jun 2019 13:37:12 -0700
Message-Id: <20190614203717.75479-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
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

Changes from v1:
 * Picked up tags and rebased to v5.2-rc3

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


base-commit: f2c7c76c5d0a443053e94adb9f0918fa2fb85c3a
-- 
Sent by a computer through tubes

