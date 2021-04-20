Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1509C3650E7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Apr 2021 05:36:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229579AbhDTDgf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Apr 2021 23:36:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbhDTDge (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Apr 2021 23:36:34 -0400
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 414BAC06138A
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Apr 2021 20:36:04 -0700 (PDT)
Received: by mail-qv1-xf36.google.com with SMTP id dp18so13347717qvb.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Apr 2021 20:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PJriSY/3BoO1fHsVgHab2OGWTgIWKz/XuakYolqJtHg=;
        b=E0hvOm6eMmyEZ2M3MU2QsiHj0zTZy4NxvzMJ4BuGjCki4mRcIXk7NPuyXjMnsPdPAA
         T8mmB/dCDnnKTJo7waaGCoouYsM+rEdpHxjRg624Hrm+KrU319G2jfKtg5Zsn6t+JKUE
         1+p5ccwYfSWxeg05DUjA+Gh9Kiz9CiRLj1/KaNL+sHK5ixXA8oKcbNnZGGOkuN/dD7UA
         yNG89UnljPOlKQwcffDInPUHqBmauqiT1uEU/J7gopgaRVGL+aXAYaB25y0h6rpe4OLF
         j3uEo6c7Cg0EuX8EaUT51G2iok5lnUA0gkTf3S0kDpXlE9nutvI/49+aMCKwcWh+LObV
         a99w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PJriSY/3BoO1fHsVgHab2OGWTgIWKz/XuakYolqJtHg=;
        b=dDPn9M+oSkaj8gVIF8rspY2PEFG+4XwrW7RkolzDgk2Mv8KGb4z81RYvuj/10HWMmm
         x6XDa+E2dBimH9+McqTVxdL3UTQCyK9DPpRkDvZofnNlJlHzq8zQKstZYsOuJycUo5ub
         SzBgAxxBWDqXM0ij2OSeLRW26QU62bsZh32VOCDUcSeu+v6LfZLa5lI1qZTkXfxoxlVN
         fNegMlJwKv5J87t7RI+hnSXC76l39aqkDOELk7//zl+CZhjJm+8gt2uMNG7ufePdUU8s
         bJP3UrFuLXG9vCVYnF/+bmrV+lTLRLph5LIWnTpyiULhlawzXf/06NVjs0u+2GAoeh+7
         EGEQ==
X-Gm-Message-State: AOAM531XNf8YxK+gzX1gJXFcKUugZmSAtVsp/TjDPWDoHX8ixZ56nFx3
        4h+uGRLNDKu3ZXgldohnX7nUbXHpZEY/fA==
X-Google-Smtp-Source: ABdhPJz/76Nl3IXgE34PV0d/wfa80eH3VqGZ0YzVyMqViE0CQo5/nlB7bzYC0R6svVBMv4mFZVfzHw==
X-Received: by 2002:a0c:eb06:: with SMTP id j6mr24696769qvp.10.1618889763374;
        Mon, 19 Apr 2021 20:36:03 -0700 (PDT)
Received: from pop-os.fios-router.home (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.googlemail.com with ESMTPSA id b8sm3562643qka.117.2021.04.19.20.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 20:36:02 -0700 (PDT)
From:   Thara Gopinath <thara.gopinath@linaro.org>
To:     herbert@gondor.apana.org.au, davem@davemloft.net,
        bjorn.andersson@linaro.org
Cc:     ebiggers@google.com, ardb@kernel.org, sivaprak@codeaurora.org,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [Patch v3 0/7] Add support for AEAD algorithms in Qualcomm Crypto Engine driver
Date:   Mon, 19 Apr 2021 23:35:55 -0400
Message-Id: <20210420033602.1729947-1-thara.gopinath@linaro.org>
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

