Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03C993F7AF5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Aug 2021 18:53:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232649AbhHYQyA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Aug 2021 12:54:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230490AbhHYQyA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Aug 2021 12:54:00 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38D80C061757;
        Wed, 25 Aug 2021 09:53:14 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id n13-20020a17090a4e0d00b0017946980d8dso4577443pjh.5;
        Wed, 25 Aug 2021 09:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a1796Hm7LQw6smAYsrKNPJogW0RnP+E+pRLLuJInkfI=;
        b=WHdWBl+l4m1fwzZQ8HT6indM7uORWUDZLUHX77GTT465fUvndZ2v41DO1GNCfSTPlT
         r5XEO1fIj8xBrMPjNOxJ6S/T7/5DvRG1/cJgmP0gerFUWfIe/Q3Z6ow7DsHBNL89wqa6
         hDC647Ww7FwGtpwXNsbdtppEeJ8TcTUWaXEvDOJ2hREWbFQYpr+BrTJqwu91o5N+xQxC
         oJlIXGaTxQHfR2ENpTS23sWSrERT3PxcK0by8PemSuL/kImhfQXffGjyRSozgHV13sF7
         9EtJOeAtTHSh4BCyPMW0rYZH+dC9DSIg8c6njqkxXNiu6ZeS81GwG6gELQT6KXVlWvyz
         mxhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a1796Hm7LQw6smAYsrKNPJogW0RnP+E+pRLLuJInkfI=;
        b=Y4/qnN4zazbGkcs+HZUf7xuKy7Xfwe60cQFtSlAJuegfIL5Pl8o6O9HUuIYVvj+Pw/
         e00clBu3rFusk7kAyGxoazkLg8pz7f8Dh/7phnnWMrjdiXWuDsJ/5wQsLZPG118UBttp
         mrI7+5C6Btxa9mYU8HkFdURb5TRP0DH8pfHX5gg9AS30SCD9kK4jz1qZthdaWXgYLQrN
         y6UHJ+HSLi6yqbGKQBExfiINCQ+jXHa17vKWKhD9MEqHUxNGg2IW/KtBG2iVlDhzofJN
         hfmViZTHIFjl41pZyFTgCzddvUhrOLmw7ITkuDYbWKoL7qJ0u6M1d9UyF1nMrFAxrhpd
         OxvA==
X-Gm-Message-State: AOAM5317tj7RxxFbU/OLFkNMob4XVMbCAgyDcg+nz1bD/hwnmTKrYcXE
        TA5113HTvIAe01RQGAvYtyI=
X-Google-Smtp-Source: ABdhPJzS0aGZ9AoaQaARKQRJDzPQtz8j/qKpE1lP01ti02kyGpX5pV7nSR2TIy+dL2NKtCIfZxiTng==
X-Received: by 2002:a17:90a:d686:: with SMTP id x6mr11676307pju.8.1629910392798;
        Wed, 25 Aug 2021 09:53:12 -0700 (PDT)
Received: from skynet-linux.local ([106.201.63.141])
        by smtp.googlemail.com with ESMTPSA id f10sm496010pgm.77.2021.08.25.09.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 09:53:12 -0700 (PDT)
From:   Sireesh Kodali <sireeshkodali1@gmail.com>
To:     bjorn.andersson@linaro.org, agross@kernel.org, robh+dt@kernel.org,
        rnayak@codeaurora.org
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Sireesh Kodali <sireeshkodali1@gmail.com>
Subject: [PATCH 0/4] Add MSM8953 RPM support
Date:   Wed, 25 Aug 2021 22:22:47 +0530
Message-Id: <20210825165251.18358-1-sireeshkodali1@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series adds support for the RPM SMD regulators and power domains
 as found on the MSM8953 platform (SMD450, SDA450, SDM625, SDM632, APQ8053)

Vladimir Lypak (4):
  dt-bindings: soc: qcom: smd-rpm: Add compatible for MSM8953 SoC
  soc: qcom: smd-rpm: Add compatible for MSM8953 SoC
  dt-bindings: power: rpmpd: Add MSM8953 to rpmpd binding
  soc: qcom: rpmpd: Add power domains for MSM8953

 .../devicetree/bindings/power/qcom,rpmpd.yaml |  1 +
 .../bindings/soc/qcom/qcom,smd-rpm.yaml       |  2 ++
 drivers/soc/qcom/rpmpd.c                      | 24 +++++++++++++++++++
 drivers/soc/qcom/smd-rpm.c                    |  1 +
 include/dt-bindings/power/qcom-rpmpd.h        |  9 +++++++
 5 files changed, 37 insertions(+)

-- 
2.33.0

