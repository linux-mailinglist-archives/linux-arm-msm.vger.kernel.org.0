Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4009436ED02
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Apr 2021 17:07:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234487AbhD2PH7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Apr 2021 11:07:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233420AbhD2PH4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Apr 2021 11:07:56 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B3ACC06138C
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Apr 2021 08:07:09 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id v20so12583024qkv.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Apr 2021 08:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PJriSY/3BoO1fHsVgHab2OGWTgIWKz/XuakYolqJtHg=;
        b=P43IVnbOO1KOh0wwx2LKjHbidBxkD+RQyNaMv1TLiF6K5NcRwSd9UeIE4ozLi05/9r
         mt0LXt3WDcvq3LGkC8/zgqAuFvF3+C3Mrgn/IwXMteNul6/BWKRDrLTozu1aeBROuj43
         lp+cgQvjJSBIuFWdAo7jQbUOxMKR/yXUNabsNZj//ghJ0lyo6actzWuwEOnbFPpvULVb
         mVvn1n3VHcBWRuhDr1AouhWJkNfu3zGSjVmo68gc9T2//tKjxIUJrLK++yo38Z868Sur
         Zo7uhaUXm1bEhnmpepCjYuul3SU4Hj+6W7VKGuVJxBRncm+0xhQHByjqJpT5q6JIxH9j
         1Vlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PJriSY/3BoO1fHsVgHab2OGWTgIWKz/XuakYolqJtHg=;
        b=fq5PtMK34sOBKqNgyuywjJbsMeVSJwJzbqKPYzCXkB6+FzLILBhYZ0NY6/nuF7L5/g
         A64iYg1s3cbB66V/k0R2JAwEpK3AAz3D+aUyrBIyUPmedCBvEveN2V+lMAOyhQIgmlIs
         avwND4vaevTu2Yx96rnFHhY9Ps8aDUqb8oU4agUNq3Wzt404FLRoipvZgEZr0Q1LP6TL
         zGnhoq21ZDH1Ye32t0aGnO+nL0r8PaVMh3E3PWDa9YuO/0vEMtz6By1/btdWID1+NNC6
         JWPhX4u47H2XMY5Ox99qqmJuBiEw61hHkhDxWSXCPvjXXaL1nGMJP9caehhGvmDEaCjH
         UaLA==
X-Gm-Message-State: AOAM533P76pOyiH6C4wBzcIp5qZxpDnaT6TqtWPbQowxY6xi5TTbEwzy
        l+KSzpuWd0GKqOKZXffBUnSidA==
X-Google-Smtp-Source: ABdhPJw6BVL6oIwP9QDnk+MHuqu75/I+KE0MpjMGALVikb4wE3xysyeuazVjIkJ9H4vT8A58dMBXow==
X-Received: by 2002:a37:4c4:: with SMTP id 187mr87385qke.163.1619708828855;
        Thu, 29 Apr 2021 08:07:08 -0700 (PDT)
Received: from pop-os.fios-router.home (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.googlemail.com with ESMTPSA id j191sm2223822qke.131.2021.04.29.08.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 08:07:08 -0700 (PDT)
From:   Thara Gopinath <thara.gopinath@linaro.org>
To:     herbert@gondor.apana.org.au, davem@davemloft.net,
        bjorn.andersson@linaro.org
Cc:     ebiggers@google.com, ardb@kernel.org, sivaprak@codeaurora.org,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [Patch v4 0/7] Add support for AEAD algorithms in Qualcomm Crypto Engine driver
Date:   Thu, 29 Apr 2021 11:07:00 -0400
Message-Id: <20210429150707.3168383-1-thara.gopinath@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable support for AEAD algorithms in Qualcomm CE driver.  The first three
patches in this series are cleanups and add a few missing pieces required
to add support for AEAD algorithms.  Patch 4 introduces supported AEAD
transformations on Qualcomm CE.  Patches 5 and 6 implements the h/w
infrastructure needed to enable and run the AEAD transformations on
Qualcomm CE.  Patch 7 adds support to queue fallback algorithms in case of
unsupported special inputs.

This patch series has been tested with in kernel crypto testing module
tcrypt.ko with fuzz tests enabled as well.

Thara Gopinath (7):
  crypto: qce: common: Add MAC failed error checking
  crypto: qce: common: Make result dump optional
  crypto: qce: Add mode for rfc4309
  crypto: qce: Add support for AEAD algorithms
  crypto: qce: common: Clean up qce_auth_cfg
  crypto: qce: common: Add support for AEAD algorithms
  crypto: qce: aead: Schedule fallback algorithm

 drivers/crypto/Kconfig      |  15 +
 drivers/crypto/qce/Makefile |   1 +
 drivers/crypto/qce/aead.c   | 841 ++++++++++++++++++++++++++++++++++++
 drivers/crypto/qce/aead.h   |  56 +++
 drivers/crypto/qce/common.c | 196 ++++++++-
 drivers/crypto/qce/common.h |   9 +-
 drivers/crypto/qce/core.c   |   4 +
 7 files changed, 1102 insertions(+), 20 deletions(-)
 create mode 100644 drivers/crypto/qce/aead.c
 create mode 100644 drivers/crypto/qce/aead.h

-- 
2.25.1

