Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28AD01AF9E2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2020 14:17:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726012AbgDSMRn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 19 Apr 2020 08:17:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726007AbgDSMRn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 19 Apr 2020 08:17:43 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DB3CC061A0F
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2020 05:17:41 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id f13so8499501wrm.13
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2020 05:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hlkar5Uc6KDEqHbVyGZFb1q21JNkmwLRLeW9v24L2s4=;
        b=os539hsj93Tn2wf/vVjtv/RFE5m87k+1mNe/7o+17+ZPOE7jME37xrNQWnumjS2JBF
         yfxNzVzTqxJ4T38Fn/zNNKi3wcHzLRJJGIeN8Z7q7yy53WvtgKTe65aomnBVoo+OoXz6
         w90xlnE8E95MK9/ZuaBTJK8QbLDBA7SMMoNG8IH6PGYX2rsMNsX61Yze9G3pKfB9ThR7
         Llqn6EhNvgmXSIZCA0whcsiZLtAAPND4bE8khYU9e4kPpjMwVkDXRIx8MbSkfpunnAry
         tRnHOKAKy1eCa9M1yigb92PUz49kBAN0H3KLGytblIY6MlxapQFc7BkOi/lf0XX1Xt3S
         h+IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hlkar5Uc6KDEqHbVyGZFb1q21JNkmwLRLeW9v24L2s4=;
        b=dARTdTQP0OxTU/qY/SRa3rhVxsaaI+RdoOQZkeBDc0XtMsCzCgQQPgTQNyDcDizT2x
         SDg1tQrq4c1cBxkyteUV117sEY+kUP20d6Iuw+fHVouu/pQyy70oRxBJ3AGVSxvdUbaG
         PxiAlIjaffZ7eu6eGQn7SzSADIVjESNeJOz06TvkrJmCbcK9VLobeo6cPlRUHmIbAE3c
         bLPb+wGg+cGpdsiL3zxeR0FkXJ7+Fsg3CLeH1NZmzV4Prj4jXHyB6j+cmlK79BVZsw2/
         KEO3LD5AEfbQwSjbK9P1WHm/mvXR2qSQuY511YIPeZKvnH04kGJP+4F4JvXvpsWlAPMP
         GZJQ==
X-Gm-Message-State: AGi0PuYU77FNGCYgluC+wBfqErtGfPAjVaH+akcogreowndtbxWiQ11P
        5HphyHgCxOtHNfYY0w7YFNot7Q==
X-Google-Smtp-Source: APiQypL1UdAZabDtKReg5DafMWwi4RYiFjI4HCKFhF6rw61m+Lj0xZGGPbB7tUGudf48vbSP6s/zOQ==
X-Received: by 2002:adf:db41:: with SMTP id f1mr12907443wrj.13.1587298660099;
        Sun, 19 Apr 2020 05:17:40 -0700 (PDT)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id h2sm22048193wro.9.2020.04.19.05.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2020 05:17:39 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        shawn.guo@linaro.org, p.zabel@pengutronix.de,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [RESEND PATCH 0/3] Add Qualcomm MSM8939 GCC binding and driver
Date:   Sun, 19 Apr 2020 13:18:05 +0100
Message-Id: <20200419121808.440780-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

These three patches add support for the MSM8939 Global Clock Controller.
The MSM8939 is a derivation of the MSM8916 sharing the large majority of
its clock settings with MSM8916, however, there are enough changes, in some
cases mutually incompatible changes that necessitate a separate driver.

I thought it was both important and useful to show in the git log the
differences between MSM8916 and MSM8939 so, one patch copies the MSM8916
driver while another patch applies the entire gamut of MSM8939 changes,
squashing down from a git log of approximately 31 separate commits.

For reference that log is here:
https://github.com/bryanodonoghue/linux/pull/new/msm8939-clk-next-reference-log

Generally speaking MSM8939 differes from MSM8916 in two key ways.

- New and higher clock frequencies for existing IP blocks.
- New PLLs to drive those higher frequencies

Bryan O'Donoghue (2):
  clk: qcom: Add DT bindings for msm8939 gcc
  clk: qcom: gcc-msm8939: Make silicon specific updates for msm8939

Shawn Guo (1):
  clk: qcom: gcc-msm8939: Add gcc-msm8939 driver by copying gcc-msm8916

 .../devicetree/bindings/clock/qcom,gcc.yaml   |    3 +
 drivers/clk/qcom/Kconfig                      |    9 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/gcc-msm8939.c                | 4004 +++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-msm8939.h  |  215 +
 include/dt-bindings/reset/qcom,gcc-msm8939.h  |  119 +
 6 files changed, 4351 insertions(+)
 create mode 100644 drivers/clk/qcom/gcc-msm8939.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-msm8939.h
 create mode 100644 include/dt-bindings/reset/qcom,gcc-msm8939.h

-- 
2.25.1

