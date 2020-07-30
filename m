Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B51DB232B55
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jul 2020 07:22:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728195AbgG3FWV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jul 2020 01:22:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727838AbgG3FWV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jul 2020 01:22:21 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60556C061794
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2020 22:22:21 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id m8so7511689pfh.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2020 22:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9eLz0BWx8S96G1qfWUgXbjO4lxX1Lc7rRHHWAD1aY5A=;
        b=X95D/MuqDzqrROZkE8p5eqhur+GmU1ev/+SoZH/Lkuoy7WM0dCs2RK3/o+pfYhNSYR
         VZKueJQMeuEnLhTJHGVIJWHDRix7yKZywVH9Z+oDQjy0xxpUZjY5bk0D+Rk4NI41zMp7
         kYRY7twmw0V6+bTX1uX2XjLBdffciQ7+KVbmdM5IWvn3pthD0IalPyPivrT2waTk0811
         qf9/2hdoAAIQO2zlcETcA7EihXsM1b5Fsu4QARuC5Dx3jef/3QRNhUttxiEjzTcaWGob
         ozdXIQ2mUE0l3tu5Ydx1gYYezmn/uHXXWSIkStGp/YOHB3DEJ6XLN7x6S6eAYgSr9cNV
         +YOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9eLz0BWx8S96G1qfWUgXbjO4lxX1Lc7rRHHWAD1aY5A=;
        b=PmRBi3GEzF31qQzwWNmlJ6LNHIiAB7pC5XIvSDirhbVQ7daSMmdliLO1QQm/Kzo/hJ
         0GPrOP4WSw3KxDv9qNe7cAFKqLaa05HBi4B7Gkn53ar2Kamk2xV1KKZBc11RmZOi0ZiH
         hKIDa5zHEqe9Tl1pchrV4eZiy0qf2eAlh8oKevDokMNTZriCC7Mi4+qQzfbDCXFy763o
         R4a7R5r4gnFrNxoJS/NSAU1HVqs24nl1eeMFDvadzXEGKxvEEhOMbkwGTya5GlYBVlbE
         eOzlW03x8HDWNjRtTsJTH4MVSRACVeQDiYYaqMosMBrZn+DbT+kjf8E85YA74zdFGyeE
         oyJQ==
X-Gm-Message-State: AOAM532ZRYkXe+x9+/WU2QDFAZA1cTkwh8MgxHs7vcfLVjMrM7ncGcHC
        vdUBXSn9MvFS2rV4/Q8/t2+0TA==
X-Google-Smtp-Source: ABdhPJwC7jzQ1E8qMJAE0Bgvymc9fOdgq7Q3V3fZDqtxeggES0wmFri+m8+caLVo0O71iWQsLNo1SQ==
X-Received: by 2002:a63:1d4:: with SMTP id 203mr31957417pgb.356.1596086540752;
        Wed, 29 Jul 2020 22:22:20 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id n124sm2268808pfn.53.2020.07.29.22.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 22:22:20 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Kathiravan T <kathirav@codeaurora.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: [GIT PULL] Qualcomm driver additional updates for 5.9
Date:   Wed, 29 Jul 2020 22:18:52 -0700
Message-Id: <20200730051852.649761-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit 03c900b3be116003ccd0e798431f6d0c25ff6729:

  soc: qcom: geni: Fix NULL pointer dereference (2020-07-20 13:11:15 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-5.9-2

for you to fetch changes up to 0fec8617a1df7b676b8a1d7afea2c4af1f4f963e:

  soc: qcom: geni: Fix unused label warning (2020-07-29 22:10:30 -0700)

----------------------------------------------------------------
Qualcomm driver additional updates for 5.9

This fixes a potential race condition with remoteprocs by not sending
acknowledgements until after registered drivers has processed the event.
It adds IPQ6018 support to the SMD RPM driver, fixes kerneldoc in the
same and converts the related DT binding to YAML.
Finally it fixes a compilation warning in the geni serial engine driver
when compiled without CONFIG_SERIAL_EARLYCON.

----------------------------------------------------------------
Kathiravan T (3):
      dt-bindings: soc: qcom: smd-rpm: Add IPQ6018 compatible
      soc: qcom: smd-rpm: Add IPQ6018 compatible
      dt-bindings: soc: qcom: smd-rpm: Convert binding to YAML schema

Krzysztof Kozlowski (1):
      soc: qcom: smd-rpm: Fix kerneldoc

Sibi Sankar (1):
      soc: qcom: pdr: Reorder the PD state indication ack

YueHaibing (1):
      soc: qcom: geni: Fix unused label warning

 .../devicetree/bindings/soc/qcom/qcom,smd-rpm.txt  | 64 ----------------
 .../devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml | 87 ++++++++++++++++++++++
 drivers/soc/qcom/pdr_interface.c                   |  4 +-
 drivers/soc/qcom/qcom-geni-se.c                    |  2 +-
 drivers/soc/qcom/smd-rpm.c                         |  3 +
 5 files changed, 94 insertions(+), 66 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
