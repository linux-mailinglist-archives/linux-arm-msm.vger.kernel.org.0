Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE38E31BF08
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Feb 2021 17:24:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231962AbhBOQXv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Feb 2021 11:23:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231801AbhBOQVF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Feb 2021 11:21:05 -0500
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4296C0613D6
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Feb 2021 08:16:40 -0800 (PST)
Received: by mail-qk1-x732.google.com with SMTP id f17so6837326qkl.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Feb 2021 08:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zI/vme6L5zTS+JUbt3TZt+qvFZC6hwyCTXjo3SFjNA8=;
        b=W3+bs3TIbLKEKVEWyOaRzLE+XoqcTWdp6JgnNG0qAU2/I2jiTWbW2qMv0fEhHJ7gVd
         SunYU90VMDHHOKh4tbwdvJGlZiRzuj9wJ7F5Icnn3vK3B5cvUfS3jjxS4FE0BKIK5j5E
         PUhoBv9TFoTn+GqkMa1R1HT67bitkfgonQMe5PcWI7RoD83fFgY9XAUxzGg6yOZuvY8I
         /qXDL5ZkVJBSOT+epRlBYnDhJFaY4hlCeOjcV/efPXM4cbz3VIZHOLgaDNekTB01vVqx
         Chzw8DtLpscI1bqsXOdsIwWdP64ReLgId1RPU6Cqi7G+NIFec35WIWHQO5/Gy/StiP1t
         JhLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zI/vme6L5zTS+JUbt3TZt+qvFZC6hwyCTXjo3SFjNA8=;
        b=rhSc0M0Mr/nhc9R0Uk8qRu9WBKCR70Md08XCrM9UnPMCBHfY9sfToyKw2xa2Yq8pTu
         qj6QvsLAvNhN7E6FP2DHeeb/frFCJ3EdSo879n1eJN6wjKREWAB8xmbih+6JTJwl0XqM
         el6yDCQXbpVZTUQ21WJqYyFoOJ/k6aXF+/LAtuy29+qKeY8jzhGHQrUuxZBM68yZZxwZ
         d8EGHyyIZbVHynv3/Cwqc9Ht35FxeCeJqtymqM/da3O2xORY/ahrclXcjfDYBhWWhNOP
         ztswwXNOva5q3vy6fQWRqjuYPEqKlxQlD3uhIFaF4bBYft7kfBRKe3ITJk6Qa5Pvc5o1
         hedQ==
X-Gm-Message-State: AOAM530CEHnMUkAGlg6Ns2u5g+84sQf4s+Chksp99e60zVyVq2hurB/8
        mYlFSM3qDcLs34Q0ie6dB4MmMpPXDvCf/WIo
X-Google-Smtp-Source: ABdhPJxzjPCzJ7MLbj3Ud0yAixQXe48Db6t2j8gXRl6cQKt2VbaHWevVqB+Rx2F1g33Q69egieRChg==
X-Received: by 2002:a37:6ca:: with SMTP id 193mr15363303qkg.436.1613405799609;
        Mon, 15 Feb 2021 08:16:39 -0800 (PST)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id j124sm12225227qkf.113.2021.02.15.08.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 08:16:38 -0800 (PST)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Drew Davenport <ddavenport@chromium.org>,
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), Eric Anholt <eric@anholt.net>,
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), Jeykumar Sankaran <jsanka@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        linux-kernel@vger.kernel.org (open list),
        Qinglang Miao <miaoqinglang@huawei.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>,
        Tanmay Shah <tanmay@codeaurora.org>,
        tongtiangen <tongtiangen@huawei.com>
Subject: [PATCH v2 0/2] arm64: dts: qcom: sm8250: fix display nodes
Date:   Mon, 15 Feb 2021 11:15:32 -0500
Message-Id: <20210215161537.14696-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add sm8150/sm8250 compatibles to drm/msm and fix the sm8250
display nodes.

v2: do not remove mmcx-supply from dispcc node

Jonathan Marek (2):
  drm/msm: add compatibles for sm8150/sm8250 display
  arm64: dts: qcom: sm8250: fix display nodes

 .../devicetree/bindings/display/msm/dpu.txt   |  4 +--
 arch/arm64/boot/dts/qcom/sm8250.dtsi          | 33 +++++--------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  2 ++
 drivers/gpu/drm/msm/msm_drv.c                 |  6 ++--
 4 files changed, 16 insertions(+), 29 deletions(-)

-- 
2.26.1

