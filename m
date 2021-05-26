Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 613A0391204
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 10:10:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232086AbhEZIMU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 04:12:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231871AbhEZIMT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 04:12:19 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86C5BC061756
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 May 2021 01:10:47 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id u5-20020a7bc0450000b02901480e40338bso2852427wmc.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 May 2021 01:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UJg9CGE0giXGSf2E49zfwV6qxHAc7VZeILYMwHitWSk=;
        b=U25/0Z8aTRKIdQSransQLuQbgg/MytPSyikoseoD42jD4WVfHWX6C8rfQ9SG0eK8JK
         bQDFgGSo4QqCj2nhCj/RnmFhNo6jB5e0FSmhjUBqpsawPzXSURDTDvOsmV2mltzjKtZn
         cVqM51PDILda5Yt/Hhgzv84/3VbnqSE6tEcMA47JSvqeNlVMVVrY8tD/70SNDR2PLdeK
         Y7XHDlR4c/DsdrV4n5iEqbN2Pf9YpOtd6pUyMdH55HTO9EKSzIKEm1XTqzrNVYsFuBdA
         P3tmqk5DRStn0BIHyyPNvKTfzNzN05aK2yBLuDEnirSAGl9D9+x7wuEFftqDYP2ebh9J
         kpzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UJg9CGE0giXGSf2E49zfwV6qxHAc7VZeILYMwHitWSk=;
        b=dr4cvTibUIs7mGiMhJzhGY6J5DZ880hVeOoSTdes4ZL/tTxSJWzjS0rhltGGUz8Mvm
         YaCUKZIjMMMyUHevr6JDIiEH2FK4pzUEiV3kYCg4NxFwk4nyXk4TtvMYpgeITpjbSerW
         Raf9CuqVvMcmgDBXPE4YZCYbjNH08YXFoFFmODbd9GUs6SqL3y4ZUx0+Xdu5ifalAKpz
         f4wmIFyTnwuy8mN87tJI7W7CXvlBA/KitScacDaTzqtcPgh+xPz9bd4Di1HrMAtihULs
         JRMS4MqB43ZW4EMNWikevNlW9QhpUDmB/BTjqn96LdRaoPY9PEGIhsOxwChzuI9A76e0
         dlAg==
X-Gm-Message-State: AOAM530kmx8qwlVFERYhHT7EJOQzx6irPzPCYRO/YNNT98r1MJHn9XqK
        i7ivRWF/jZREStTdjafNm9ddJg==
X-Google-Smtp-Source: ABdhPJzHeiHwzrpPIesnuXoCNKDK0E+NEgbljO8flxEoNftTXuDjMo3L2OmRjzb7E2q6lTMU6cIg8g==
X-Received: by 2002:a05:600c:198c:: with SMTP id t12mr8563871wmq.145.1622016646119;
        Wed, 26 May 2021 01:10:46 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
        by smtp.gmail.com with ESMTPSA id v11sm22628319wrs.9.2021.05.26.01.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 01:10:45 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        German Rivera <German.Rivera@freescale.com>,
        Laurentiu Tudor <laurentiu.tudor@nxp.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-omap@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Stuart Yoder <stuyoder@gmail.com>,
        Tony Lindgren <tony@atomide.com>
Subject: [PATCH 00/10] Rid W=1 warnings from Bus
Date:   Wed, 26 May 2021 09:10:28 +0100
Message-Id: <20210526081038.544942-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This set is part of a larger effort attempting to clean-up W=1
kernel builds, which are currently overwhelmingly riddled with
niggly little warnings.

Lee Jones (10):
  bus: fsl-mc: mc-io: Supply function names for 'fsl_create_mc_io()' and
    'fsl_destroy_mc_io()'
  bus: fsl-mc: mc-sys: Supply missing function names in kernel-doc
    headers
  bus: fsl-mc: fsl-mc-bus: Demote a bunch of non-conformant kernel-doc
    headers and help others
  bus: fsl-mc: dprc: Fix a couple of misspelling and formatting issues
  bus: fsl-mc: dprc-driver: Fix some missing/incorrect function
    parameter descriptions
  bus: fsl-mc: fsl-mc-allocator: Fix misspelling of 'new_mc_adev' and
    demote non-kernel-doc headers
  bus: qcom-ebi2: Fix incorrect documentation for '{slow,fast}_cfg'
  bus: fsl-mc-msi: Fix a little doc-rot pertaining to 'np' to 'fwnode'
    conversion
  bus: ti-sysc: Correct misdocumentation of 'sysc_ioremap()'
  bus: fsl-mc: mc-io: Correct misdocumentation of 'dpmcp_dev' param

 drivers/bus/fsl-mc/dprc-driver.c      |  8 +++++---
 drivers/bus/fsl-mc/dprc.c             |  4 ++--
 drivers/bus/fsl-mc/fsl-mc-allocator.c | 10 +++++-----
 drivers/bus/fsl-mc/fsl-mc-bus.c       | 19 ++++++++++---------
 drivers/bus/fsl-mc/fsl-mc-msi.c       |  2 +-
 drivers/bus/fsl-mc/mc-io.c            |  6 +++---
 drivers/bus/fsl-mc/mc-sys.c           | 19 ++++++++++---------
 drivers/bus/qcom-ebi2.c               |  4 ++--
 drivers/bus/ti-sysc.c                 |  2 +-
 9 files changed, 39 insertions(+), 35 deletions(-)

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: German Rivera <German.Rivera@freescale.com>
Cc: Laurentiu Tudor <laurentiu.tudor@nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-omap@vger.kernel.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Stuart Yoder <stuyoder@gmail.com>
Cc: Tony Lindgren <tony@atomide.com>
-- 
2.31.1

