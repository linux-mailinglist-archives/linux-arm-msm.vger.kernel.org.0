Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD7BD3D905E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jul 2021 16:25:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236694AbhG1OZM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Jul 2021 10:25:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235466AbhG1OYy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Jul 2021 10:24:54 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EA91C0613C1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jul 2021 07:24:52 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id y34so4304478lfa.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jul 2021 07:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xUxyuUpAzGtx/RioOCJoivmaYXnb4C+vrnKsIL1DHAw=;
        b=PxzYQZcLaU1zSXsJ6lVXBja/2GtDB13jiNJrAD8UJBUFlW1JfyWiNMtDJ/CLwiBNWM
         ywKav7AzihGTjK8ruc+s4jCAI7XwvMUnEa1+Y1fz2y0CCD4FAOeu0aMQs4dRYITdmeEY
         hBduZctUHCPbWmzv02lfqnryQw/H23Fu9G4xtsKEm3yFaVmh+Adu2N49s5aVNJXQnRnz
         yXLxil5rtKGyIQkVFP4z6CyUJh0TdWBA+nobd/J/vz3FFRLEyPBOobXOk/mjUc/+MFfR
         h5G6SRQYLinMKPnObS1jB3M9ibJNkrqECY8i7H7johpt2cRSHN/69r0ddwj9Tu2vnlh/
         106w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xUxyuUpAzGtx/RioOCJoivmaYXnb4C+vrnKsIL1DHAw=;
        b=uAQcNWUEFBQUz3m7SaHOCz0NBZ+nByLPgsXApTO11Mq0P/yj8LvaCKhSrSom+9SmK5
         yJ+G2ZjZH8zVZd9FjLVPNavWLZ/B/OBKHPXv2ripmZsv4fQsbUa6S6YP1BCSAcLuYM5G
         31+UFJRo1SvrnydwuXt/gadvAym5diHUFAFRsfybDPdyGdUVcKAQniIIg1HIj9Nfwf21
         fjhJs9FWz2ZvKhFVXNdM/8Vx92YC67w0bVbGvR+LuvD0OK3Xtq9Ud9e8WZQoFyzX9IMx
         nve6y+3f7cgLE5unTMtQC1RhGHak+RnZVRekAW5dOiUWZYOQlQ+rHxaaoVIdzHM/xCjs
         oYXA==
X-Gm-Message-State: AOAM531TQ7L0r1FYgZBpBViLuBJTzAIinGUutGa/SJLJCoXVrJ7A7ApA
        s4L149NTLuPWbwVySTJvtJLb9w==
X-Google-Smtp-Source: ABdhPJwA/ZK36+alcmFKQQIYE+YXlPER8b2QVo/BQ7dEpH72qj/dhS3lmJyQ670rMkfIazbGbuclfg==
X-Received: by 2002:a19:4893:: with SMTP id v141mr15974595lfa.199.1627482290559;
        Wed, 28 Jul 2021 07:24:50 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h4sm15610lft.184.2021.07.28.07.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 07:24:50 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Pavel Machek <pavel@ucw.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 0/5] PM: add two devres helpers and use them in qcom cc
Date:   Wed, 28 Jul 2021 17:24:40 +0300
Message-Id: <20210728142445.774158-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Qualcomm clock controller code (and most probably other drivers) would
benefit from having devres helpers for pm_runtime_enable() and
pm_clk_create(). Add those two helpers.

Modify Qualcomm clock controller code to use new helpers and separate
common pm code into common.c.

----------------------------------------------------------------
Dmitry Baryshkov (5):
      PM: runtime: add devm_pm_runtime_enable helper
      PM: clk: add devm_pm_clk_create helper
      clk: qcom: use devm_pm_runtime_enable and devm_pm_clk_create
      clk: qcom: use common code for qcom_cc_probe_by_index
      clk: qcom: move pm_clk functionality into common code

 drivers/base/power/clock_ops.c        | 17 +++++++++++
 drivers/base/power/runtime.c          | 17 +++++++++++
 drivers/clk/qcom/camcc-sc7180.c       | 39 +++++++++----------------
 drivers/clk/qcom/common.c             | 55 ++++++++++++++++++++++++++++-------
 drivers/clk/qcom/common.h             | 17 +++++++++++
 drivers/clk/qcom/lpass-gfm-sm8250.c   | 21 ++++++-------
 drivers/clk/qcom/lpasscorecc-sc7180.c | 55 +++++++++--------------------------
 drivers/clk/qcom/mss-sc7180.c         | 45 ++++++----------------------
 drivers/clk/qcom/q6sstop-qcs404.c     | 40 +++++++------------------
 drivers/clk/qcom/turingcc-qcs404.c    | 45 ++++++----------------------
 include/linux/pm_clock.h              |  5 ++++
 include/linux/pm_runtime.h            |  4 +++
 12 files changed, 169 insertions(+), 191 deletions(-)


