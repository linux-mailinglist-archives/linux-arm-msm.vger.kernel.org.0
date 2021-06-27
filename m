Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 175723B531B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Jun 2021 13:46:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230206AbhF0LtA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Jun 2021 07:49:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230193AbhF0Ls7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Jun 2021 07:48:59 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7534C061767
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jun 2021 04:46:35 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d12so3913106pfj.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jun 2021 04:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1APTTMV9Lifc+OwM91+HWP/syKCs1M6tgCrtH/oY5DM=;
        b=OxFsle3TPnqpQrkKRfr6FIlIdft5npSSQVoSGZ9th5qDVwluDAs2xE3711qFgX5Vwb
         3pDpi7HnXstmu0b07bzYN+juGc5BGdV5R3jpiI3Vgrk/tVa1h6A2zLPb+I5BN0evQIoH
         DTaHh44mnVcM/TWMBTPTyO6SaMDWN258s2Yny7ylo64U+h7nY8Y9i9K8pIf3/gn/9NkI
         MWdo8/Y5byyNO2yg3j03V91SXQoLQP0NKK7tg5eyfmAJBzgr57gud4OQ2d+OzyZ4uZXQ
         xrTgy7+p4Qrv8LCZBhjFTBjFsfqHpaM8l9NJCKqmO6k1W7Nd38/R1lgU/MVhA27JKzQg
         o+gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1APTTMV9Lifc+OwM91+HWP/syKCs1M6tgCrtH/oY5DM=;
        b=T1f5N3TTXjIBeRSPo5sLtSXitkJihHcvfguo4wnW8QUiaw0oDK5fDqJAqoLfyE7e8D
         2wZQlVMPrXiG47NCuSE9kKhNsB+eUK+akJhWftFj6Ssh4q7psYJwC4mWPonxR5W7ri35
         JfE0ES3ZARTybXiWAkkKw3B191BtIMoRgwA04uhMkZrvBsOySp0/C8kTXy101jT75jXv
         eTO5I2rZlS7RH90XSfZspm14H6O66jd11D2G/4vRgpcDco9k2wfi0uC++jHGAnCWqMXp
         pCx8aFoJvRpW60Ih4qOWQFMdNyFnen0r+g8e+qNiu3NayvqV0GszPkPa7JGHPzRVfrao
         vu6A==
X-Gm-Message-State: AOAM531aa64gKHom8Nm0uMmgyDxBgXYfOIskfGuWvLh+eo3H76batKoj
        /aCMWuIwQTv4iNmdAwquJZDugfvESgMUWQ==
X-Google-Smtp-Source: ABdhPJwyGByc7wC4Sa8JpqOsVsN2rWIfXzFKknOfGa/yhwP91iSZ/b+QSaTvmv8LVAlexXW/s/Bu6Q==
X-Received: by 2002:aa7:920d:0:b029:2d9:2ead:70dd with SMTP id 13-20020aa7920d0000b02902d92ead70ddmr19547335pfo.67.1624794394969;
        Sun, 27 Jun 2021 04:46:34 -0700 (PDT)
Received: from localhost.localdomain.name ([182.69.217.12])
        by smtp.gmail.com with ESMTPSA id x21sm10768762pfu.211.2021.06.27.04.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jun 2021 04:46:34 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        balbi@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org, agross@kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2 0/3] arm64: dts: qcom: Fix usb entries for SA8155p-adp board
Date:   Sun, 27 Jun 2021 17:16:13 +0530
Message-Id: <20210627114616.717101-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes since v1:
----------------
- v1 can be seen here: https://lore.kernel.org/linux-arm-msm/20210625220311.527549-1-bhupesh.sharma@linaro.org/T/#mc49710316c9b527c2ee6562f4b91a05a2d15ca8b
- Addressed review comments from Bjorn.

This series enables the support for two USB ports (named portB and
portC) found on the SA8155p-adp board which are connected to USB Type A
connectors.

It also contains two minor cleanups:
- naming related fix for dwc3 usb nodes found in qcom arm64 dts files.
- arrange usb nodes together in sm8150 dts.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>

Bhupesh Sharma (3):
  arm64: dts: qcom: Use correct naming for dwc3 usb nodes in dts files
  arm64: dts: qcom: Cosmetic changes - arrange USB nodes together in
    sm8150 dts
  arm64: dts: qcom: Fix usb entries for SA8155p adp board

 arch/arm64/boot/dts/qcom/msm8994.dtsi    |  2 +-
 arch/arm64/boot/dts/qcom/sa8155p-adp.dts | 60 ++++++++++++++++++++----
 arch/arm64/boot/dts/qcom/sm8150.dtsi     | 30 ++++++------
 arch/arm64/boot/dts/qcom/sm8250.dtsi     |  4 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi     |  4 +-
 5 files changed, 71 insertions(+), 29 deletions(-)

-- 
2.31.1

