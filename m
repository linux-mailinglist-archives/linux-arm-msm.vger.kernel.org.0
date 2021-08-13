Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99E443EBD17
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Aug 2021 22:12:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233743AbhHMUMa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Aug 2021 16:12:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233983AbhHMUM3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Aug 2021 16:12:29 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E7CBC061756;
        Fri, 13 Aug 2021 13:12:02 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id k29so14775289wrd.7;
        Fri, 13 Aug 2021 13:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qnqsJL5RG/oRlU8TcmHp5/K/uq0HSR5XN4HSC4RRnJk=;
        b=fmotEx4sLKTW9aYn3QpHhxgW1/vvjnaM9CsPVULTOd8EMKtZnCjGMzaoFUrIZEt1CY
         Rd82/4Oh5VzxyH64bIPNaNq0Y/0xFCHzbwON+4fIEoZ2lk3LfhAwdEb9l6cwAsNTzcrs
         3ZaPA1AVvHb/OqDUUuoNpFEzeSra2oulTAZNb058UWZqe/JaTISorgHzTa4SksLCHFrh
         BcO14vzqBpf78VSgckw/uH/jTR+X7Um/oXnEoOltxc+DiXYfaWgOqNRc2gFmDabpK1cY
         TMSVakbtSZs6befOpjN4LBL+bmDSuxYQMDYc1ho8lgJNslngKNX2V/2anhZboxTYIoqc
         /SsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qnqsJL5RG/oRlU8TcmHp5/K/uq0HSR5XN4HSC4RRnJk=;
        b=D21Udc60RKDPkpHG+DkIaUMNsIGY4hErMe4aEKovOiLn32LBh1yuxKymxmwwFg7W6Q
         T1M1WSsjYnx4qu+3S1n9h0LSur+r3dCnFgs7WrUpp2c3t7WZwCshdqoxEOmZtTwauE0I
         tfoZwP1EQfQLH7N5qpT+GKaNNvDtekJePsS6Nsnemfck/FiLrbCQvif0zb9EIAHArASN
         9dfEqLiUm9jIWoWPxX5CYK9bUMfxPD8FH1fL+Cuzhdnq2NCxSD5Dq+6VdwH7e50UZ/88
         v+pEuz4kz5fltClLH60N6M3EXlhHqvSw0ulVU4XMUjmar9foUVkR5qHiQXHCeSYibAaW
         Bv+Q==
X-Gm-Message-State: AOAM531gPd32VrWZr065Vliv3SZmHxzoIu+d8kOPhgJfU6ibZhkJlzNk
        cGKoU97eNR5BEiJZ54c4hjY=
X-Google-Smtp-Source: ABdhPJy2zOj7c5caqJCNnlMGon9MOewZDAv5ABt5Swl4kamuQwtXU9Nc6Vg2Bam4XUxV29KFn6dORg==
X-Received: by 2002:a5d:6d03:: with SMTP id e3mr5030064wrq.153.1628885521123;
        Fri, 13 Aug 2021 13:12:01 -0700 (PDT)
Received: from localhost ([91.92.14.102])
        by smtp.gmail.com with ESMTPSA id h2sm2354990wmm.33.2021.08.13.13.11.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Aug 2021 13:12:00 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH v2 0/2] Add UFS PHY support for SM6115/4250
Date:   Fri, 13 Aug 2021 23:11:49 +0300
Message-Id: <20210813201151.974512-1-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The UFS PHY found on SM6115/4250 is named v3-660, found on cheaper qcom devices
(possibly starting with sdm660), but up until recently wasn't used much due to
prevalence of sdhc port for internal storage/sdcard.

The name is a bit misleading, because most of the registers found on v3-660
don't share much in common with v3.

The register values/sequences are taken from OnePlus repo [1].

[1] https://github.com/OnePlusOSS/android_kernel_oneplus_sm4250

v1: https://lkml.org/lkml/2021/8/5/235

Changes from v1:
- Suggested by Vinod
  - removed v3-660 constants for regs with same name and value as v3 regs

Iskren Chernev (2):
  dt-bindings: phy: qcom,qmp: Add SM6115 UFS PHY bindings
  phy: qcom-qmp: Add support for SM6115 UFS phy

 .../devicetree/bindings/phy/qcom,qmp-phy.yaml |   1 +
 drivers/phy/qualcomm/phy-qcom-qmp.c           | 124 ++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h           | 134 ++++++++++++++++++
 3 files changed, 259 insertions(+)


base-commit: 8d4b477da1a807199ca60e0829357ce7aa6758d5
-- 
2.32.0

