Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AD9A2C812D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Nov 2020 10:40:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727621AbgK3JkR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Nov 2020 04:40:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726578AbgK3JkQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Nov 2020 04:40:16 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E6A2C0613CF
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 01:39:36 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id t3so9734010pgi.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 01:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vm5uQPUk3L7cdmJQMxhhUDgS4/sel2FhAHppNqlg4pM=;
        b=tRN9gN2w30SkkW/JnYtoDTAPKBrHN36OtLqIn65PYxlSexuGD0r/nwz4e10ZATQZpX
         nO4VqHlJTGzuvYIIDMEqMGHsSFbAd7RY6glCl0hsoZNoeRZvvlSp3Z1SC7SiXaXdFE8y
         4LyW8To1NxB3yLrsIAYHtyqeapQj1Exjld9uM2N2XvJWREiy8iGxsTg5BpuBRepPgt1H
         tL6D587WLPTBeaTPsq3lbQv3KuQoRAiDW7+SlR+XTnkYkw31Dk1vQ2SLXvbpIfiPvc2m
         FzL/+oF2zRdr5caCiA5HDpXhON+IRP1xkzc3bra0FJxo+a9a0EOnqG/SgqegfNpsyxom
         eJfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vm5uQPUk3L7cdmJQMxhhUDgS4/sel2FhAHppNqlg4pM=;
        b=d7DmTGZuuqiahbqJMOoZxmf04SKHNVeKAKSjMWAr9tiL86OfMwB/Tjd1aaTcwMvnop
         xKLJpVqc74ClwXNHWPSVW2ZMzhmhAY2yz3QsrEDF9YskxxJ2HJBm7j7mq6yag2V1Q1QH
         fqWUc+XFpTJYCI2cwx9lPKFcMyrJRm1uowvZFdVNgqfGaiXd6K5Ri9MR1KH8HoX0I8gZ
         EwzraLmqzLhhMSemK7eFIDNurpc/k4LVQ9Sz2SSL4v3C1v2rkgwR3pRRA9mvD4qVjnRo
         zNmx8jfAdLY9gKLM9C5HJj7mC7BOvMJKjfKA4iBdjL7gP1Cm0ydpOrwTzSRQZnf0gFLV
         ouVQ==
X-Gm-Message-State: AOAM532SFqIsDYQMcXgqQy5WH9ViMkpOs7qsBQbVQDdsT4p0YTjxOjmt
        9Bp2IBbm7gyEUmCWglLG7lEyS9coAP/z
X-Google-Smtp-Source: ABdhPJxn7wnciZ1NB9+jv2yJiXWPW1QBxivOOlOsXw/8795duqsrMOQbfc/UK8lrjQFbDpilWhhN3g==
X-Received: by 2002:a62:ee0a:0:b029:19a:73c8:b1b0 with SMTP id e10-20020a62ee0a0000b029019a73c8b1b0mr18121811pfi.52.1606729175737;
        Mon, 30 Nov 2020 01:39:35 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:6c0d:98b:4016:605b:102d:cbb8])
        by smtp.gmail.com with ESMTPSA id u14sm16348429pfc.87.2020.11.30.01.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 01:39:34 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmitry.baryshkov@linaro.org, saiprakash.ranjan@codeaurora.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 0/4] Add LLCC support for SM8250 SoC
Date:   Mon, 30 Nov 2020 15:09:20 +0530
Message-Id: <20201130093924.45057-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

This series adds Last Level Cache Controller (LLCC) support for SM8250
SoC from Qualcomm.

All 4 patches in this series are expected to go through arm-soc tree.

Thanks,
Mani

Changes in v2:

* Used patch from Sai for using the major version extracted from the IP
  instead of a dedicated llcc_v2 flag.

Manivannan Sadhasivam (3):
  dt-bindings: msm: Add LLCC for SM8250
  arm64: dts: qcom: sm8250: Add support for LLCC block
  soc: qcom: llcc-qcom: Add support for SM8250 SoC

Sai Prakash Ranjan (1):
  soc: qcom: llcc-qcom: Extract major hardware version

 .../bindings/arm/msm/qcom,llcc.yaml           |  1 +
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |  6 +++
 drivers/soc/qcom/llcc-qcom.c                  | 50 +++++++++++++++++++
 include/linux/soc/qcom/llcc-qcom.h            |  3 ++
 4 files changed, 60 insertions(+)

-- 
2.25.1

