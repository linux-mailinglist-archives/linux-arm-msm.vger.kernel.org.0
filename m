Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C98733275E7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 02:44:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231336AbhCABoW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 28 Feb 2021 20:44:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230084AbhCABoW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 28 Feb 2021 20:44:22 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30B35C061756
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Feb 2021 17:43:42 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id t25so10505558pga.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Feb 2021 17:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=aF7j0WJJpO1/nGRHIYUOrG0PcSrwpElNSBQzShtOxAg=;
        b=bT78xFJS6n2mVcxgbK9YAyfzCLv/nSxP+uWW9aDb5nsRgJWIBdhfCJ5fe+PANgjfvF
         ponw9GJMlSsLrDgIdQNrU8KF7yYbhezfuZDYNZrGfOR4OmN586mdN3JVIfqJd1n3DhSi
         DRAtyDU309NALtPdotC+3QXfP+jgooq+o3g/AytgMLW5ulBzv4cLvk/h8+JA1x0ZT/Nf
         +lsoMYpaOkRs61eDNv9R9MP8HyUi4nDxt1FD6Glw8S+G1SFRz2lNWqjmfrmEh3ZZYEoX
         tM48jzWfFzyyFUtXi8VmAN01ivKsAdvoXyClkKJlm9unRZUNfHnb+jvUcz+WgJaDqmqd
         SV0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=aF7j0WJJpO1/nGRHIYUOrG0PcSrwpElNSBQzShtOxAg=;
        b=NPli0bC14f2SN4WWWUYr8Yp7nX6RPmDzF2FAL0lo38N2N2fYA3tOGD0jUKQbFVvlQO
         Mm1q8ohApvkXTzjWts2q3GTnsYHxIS2g/v0ZAHX/fIVy54BYiIMQQvUwBACDbmxmGuhN
         8t8hKZ11RMR+UfgBDhSYqbxjgR+oRTfGdmtVlOyWbgfYbYXU63phih1PCVKKhCwjOux8
         ZBwW32f0uu5uWyUmtMp6xOcgRvHw6VbWzxgvE4v7rcmiD24rIs/H1CkaaaeCQLL2j+ck
         Fh8yywrUsGhtYwyuXK59bbYnzpjZPClCMXaZv/fDaGvNVxiUZNPnbMd+rAwIYOe4pp2Z
         7Gmg==
X-Gm-Message-State: AOAM532UVEjT1lHJyyHHdX7GhPSNDg5L9XaqSjbyD+BOV3gegtQSyQbi
        NoO4W7+wz+XA8zkjeCFjI4KCPQ==
X-Google-Smtp-Source: ABdhPJw3/E6zl8DmW/nnkUG85leryZ2eVLWGElEWlfGFPnwDiv+6AEtx2veUoVjka/WkOw+Q2HHR0A==
X-Received: by 2002:a63:2948:: with SMTP id p69mr11778549pgp.15.1614563021729;
        Sun, 28 Feb 2021 17:43:41 -0800 (PST)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id q95sm5641080pjq.20.2021.02.28.17.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Feb 2021 17:43:40 -0800 (PST)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 0/2] Add ACPI support for SC8180X pinctrl driver
Date:   Mon,  1 Mar 2021 09:43:27 +0800
Message-Id: <20210301014329.30104-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is a couple of patches that enable ACPI probe for SC8180X pinctrl
driver.  The msm core driver needs a bit change to handle tiles mapping
differently between DT and ACPI.

Shawn Guo (2):
  pinctrl: qcom: handle tiles for ACPI boot
  pinctrl: qcom: sc8180x: add ACPI probe support

 drivers/pinctrl/qcom/Kconfig           |  2 +-
 drivers/pinctrl/qcom/pinctrl-msm.c     | 18 +++++++---
 drivers/pinctrl/qcom/pinctrl-msm.h     |  1 +
 drivers/pinctrl/qcom/pinctrl-sc8180x.c | 48 +++++++++++++++++++++++++-
 4 files changed, 63 insertions(+), 6 deletions(-)

-- 
2.17.1

