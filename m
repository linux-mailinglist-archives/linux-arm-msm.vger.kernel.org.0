Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CD63245FFA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Aug 2020 10:27:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728410AbgHQI15 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Aug 2020 04:27:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728286AbgHQI1q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Aug 2020 04:27:46 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12439C061342
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2020 01:27:46 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id a5so14051696wrm.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2020 01:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=/MeQgobB67Kfom3s+YkCdvLeiREa8hjlhCt5MNPwpVY=;
        b=nD24KhF8r6AcrSKMIX6irVZl79yTcBlQd36rEnuhaZo8d/9DFl3/aWhsHqODTW4dWE
         6bgjKA+PPn5QUM0eCBPRQsPM/gQbhn2G4vworT+IQsHnZt8JcW5ITsjGcs0Q0Cvt9kJf
         JM7CHEZvaRVRrjhLXofuMnBMXAh4oFIgfQ7tHdIl5VNtE9ose8Ul7M52HH03GPs1agwo
         RoePHIwq+FOy5078Qlj0rHuGiCxu7Mlz3mx0xqhgi8eG+kfXDUigxkMJvGWK17Vd9Gs8
         IqISumd0XG8U/L5gHxzmIEealTXEGjAzqIqMvhXS7hpPV33Wvl5zSjp+74t+N+UpZftC
         P1wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=/MeQgobB67Kfom3s+YkCdvLeiREa8hjlhCt5MNPwpVY=;
        b=qtnhwvmpwzpJjnLKC4I/jG2pSZuvbvNEuUYoxFDbqoehg3Q7zij22epnK1jAU48l+8
         1wOgBf7HxLBDUF+EiBH/deTHKqMWnDKP7PWxDRrGnWSuJIBTzKzTzGDRk2uNegOQpHsm
         4+UurXiErRG1MaTvjxvbNKsL4Y7ANPmfQVHIw0OwLsx9JEgAm595SMo5FcPzu/W7uaIv
         0Nz+ccVVy5AT7ANElfg4gAU3kEE3OrRj1DRxY261Eh4RpRGR0tr8isOJ5SXvbQLfMZcp
         ZgRFkJuLuhrbupgpyqlGXhIGVmX1DSe6Tsa+JUJB0jXcDWH6b01IACbsdZTXCgQX9y3l
         96/g==
X-Gm-Message-State: AOAM5330mxDDB4KdvuhNpskWf4eoG1a03ZLydCaWnoi3CQmB00/TtsH4
        HVmBFA4KRYQG86+LdhDB+LuNsQAgj0oTqbWJ
X-Google-Smtp-Source: ABdhPJxRASNZ/4Ci1xX88rgpdzZo6Ubi7BbRnlcmzgqWzruYtPmJ7w373dxouwOPYL109NNb6CuO7A==
X-Received: by 2002:adf:ca06:: with SMTP id o6mr13656275wrh.181.1597652864488;
        Mon, 17 Aug 2020 01:27:44 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id h5sm33270888wrc.97.2020.08.17.01.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 01:27:43 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     Elliot Berman <eberman@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 0/2] Venus - fix firmware load failure
Date:   Mon, 17 Aug 2020 11:27:21 +0300
Message-Id: <20200817082723.17458-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

Changes since v1:
 * Move the new scm call above assign mem - Elliot Berman

v1 can be found at [1].

regards,
Stan

[1] https://lkml.org/lkml/2020/7/9/472

Stanimir Varbanov (2):
  firmware: qcom_scm: Add memory protect virtual address ranges
  venus: firmware: Set virtual address ranges

 drivers/firmware/qcom_scm.c                  | 24 ++++++++++++++++++++
 drivers/firmware/qcom_scm.h                  |  1 +
 drivers/media/platform/qcom/venus/core.c     |  4 ++++
 drivers/media/platform/qcom/venus/core.h     |  4 ++++
 drivers/media/platform/qcom/venus/firmware.c | 18 ++++++++++++++-
 include/linux/qcom_scm.h                     |  8 ++++++-
 6 files changed, 57 insertions(+), 2 deletions(-)

-- 
2.17.1

