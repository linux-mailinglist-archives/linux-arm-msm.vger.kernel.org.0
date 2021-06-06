Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAAB939D145
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Jun 2021 22:17:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230147AbhFFUTG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 6 Jun 2021 16:19:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230178AbhFFUTD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 6 Jun 2021 16:19:03 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EEEDC061767
        for <linux-arm-msm@vger.kernel.org>; Sun,  6 Jun 2021 13:16:58 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id c10so23013898eja.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Jun 2021 13:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snejp.pl; s=gmail;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F1ajWql4CT7GltN44BZTpVtySeGp7feO6w70KJ9rPkg=;
        b=RSQniDAoVRqMoghYU76L8KvO+kpaBmuJ0IyLxNOcC05uulL0ykNFvwFpE62Ajcesu1
         ++8fleIvOHUyZlSG4b2pztMMTgPaKDQ9KUDKn2Ai6SIE88EuuzQjb0EZZfpgzeBoBxMV
         B6YU6gcyNmHWZr6Rxc1uHo2GY/7XM3kpnHtKJpedLupvioSEjAHflveOJUxh864EYPIA
         naFkfUAVP73xlrRiZMjtuDIv8TxJaXFlCU7iHChlRckJHsb67ZJKw1LGgi1FpgKmy4e4
         accDbyKRa+Vl8Z6beJPTeMcoWOvcts/dzcPokTZPqz39np//qanftk33WhWrP0VsLico
         Q4QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F1ajWql4CT7GltN44BZTpVtySeGp7feO6w70KJ9rPkg=;
        b=B4wra9NHVxu+NJn1XAqfJgyJplVN8N7pjdgBl615xyoBk077nbxC1069eFXZ/z+fPl
         vCfb9Cmum6eQL79YTVqpt/bTygeVJH5m1IJ/SSIMsOpV3chh/x4tpoNJx6B63H1RWwxx
         FWhwPEreVEu943/BGJSUxLXgMncnWWjvVVm7yk+gg6+aJA1QXxscBGeM5XQ5MTpW2+jX
         rjpwpXl1Ks4GHky9qFae2iHdOjJbaTmPqd2WARqmdne/mn0vc1ibdYRKF95ij1c4N5Fz
         GSVUHRVwhWkKhbg7X2wn7h9+3y/pHkGojvrFg0WDFiz9Ax2sL7gDnZ4iBOJTkI3doPk/
         QNJw==
X-Gm-Message-State: AOAM530UBhBTzT0pLzhzJfZPPGZBGvog0wIpRKJp/Xl6UHWsoAllck3L
        sn3UEzqOmkBUmACT4CHrDFsqCg==
X-Google-Smtp-Source: ABdhPJxq0IZ7g1T5qzpJ2e+h4gV5GQ4EpZL7g50B0RLHsXDkE7grAADFdIhNZQAXK1XTh+zRQwC/pQ==
X-Received: by 2002:a17:907:9721:: with SMTP id jg33mr5128411ejc.64.1623010616286;
        Sun, 06 Jun 2021 13:16:56 -0700 (PDT)
Received: from PackardBell (192038129059.mbb.telenor.dk. [192.38.129.59])
        by smtp.googlemail.com with ESMTPSA id v8sm2211623edc.59.2021.06.06.13.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jun 2021 13:16:55 -0700 (PDT)
Received: from localhost (PackardBell [local])
        by PackardBell (OpenSMTPD) with ESMTPA id b1b38337;
        Sun, 6 Jun 2021 20:16:53 +0000 (UTC)
From:   Bartosz Dudziak <bartosz.dudziak@snejp.pl>
To:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Russell King <linux@armlinux.org.uk>,
        David Sterba <dsterba@suse.com>, Jens Axboe <axboe@kernel.dk>,
        Bartosz Dudziak <bartosz.dudziak@snejp.pl>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/2] arm: qcom: Add SMP support for MSM8226
Date:   Sun,  6 Jun 2021 22:16:10 +0200
Message-Id: <20210606201612.100752-1-bartosz.dudziak@snejp.pl>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add SMP support for a Cortex-A7 CPU in Qualcomm MSM8226 SoC.

Changes in v2:
  - Patches are now MSM8226 SoC specific
  - Properly unmap IO memory with iounmap() after using of_iomap() 

Bartosz Dudziak (2):
  dt-bindings: arm: Add SMP enable-method for MSM8226
  arm: qcom: Add SMP support for MSM8226

 .../devicetree/bindings/arm/cpus.yaml         |  3 +-
 arch/arm/mach-qcom/platsmp.c                  | 71 +++++++++++++++++++
 2 files changed, 73 insertions(+), 1 deletion(-)

-- 
2.25.1

