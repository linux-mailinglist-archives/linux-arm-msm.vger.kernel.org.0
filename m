Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51AE139858E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 11:47:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231467AbhFBJta (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 05:49:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232302AbhFBJtM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 05:49:12 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8D7AC061574
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Jun 2021 02:47:27 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id ce15so2926188ejb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jun 2021 02:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TjNOujOCl3ETnXLp5iU4xEZrOgOPX0jitIH/VNFrqDM=;
        b=ONXcRjf/pt/Z6l6ynHIvjr7aJ2iA1aTzUX2erpcO4yHbEwp/LSZ9epfeql/f7zB1EB
         kUeHRvdUi+0LzS5RS7MDdKAcR/fN7F8uWPLGFHgyoMFDnCIrU5MqbTxFVxCF+cC+ddAu
         /RXw8CNa54eQZlTaGqdCc5mK8cfbvfitc5AIlKnQZfQasUpjrsXVEfqG/i+1HB6UNVqL
         KvxMKsPUCVuUSyMBjAG2c9ETnk7czlhHMXhM1pvY4ojzE1ehyrWCz1FIwsydf+fL8d84
         DVHut55QZvPyE1Qa8SsOjQ3mTH25VgnVbvXLUS9y5PULqfb+eYfaodjtWklK7N88pfO8
         zbDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TjNOujOCl3ETnXLp5iU4xEZrOgOPX0jitIH/VNFrqDM=;
        b=UfTm0G6Xs8e3LBkYY/lKusN0U09mZjuOqo93121g7HSGduwMxTRDd8U961JjpWKyJw
         jWE6gCwPrHNBioSPEzFNg85fRZcYV8F9YGWwMsPgD0fQYdq3qCzBjFwVHgweP+mAYphi
         ZVnBHXlQ27rSabS0mbg4wBQV0GeDyUM9c7FbRrLTR/fP6KA0fgrKX19L7INql9GOfCKw
         2p0sf0gHE5pFd38NrNdyWpHBngI4x759m3WfS00rqFmdhFNmNAloBykCBQ4sL1h4tVqI
         LUtW//M32eNcivkwnozkskfrDRb9o9oppVEk1+H7g7eWSq3xaF9Kp/NH6dORfX5av2fB
         aVDw==
X-Gm-Message-State: AOAM530hma9wQidl6um1eyyTVicnZ/skHHC7EVIYHyDNM2f3rwwLN8al
        drCbtRrVq4w5jLn9FmpN4LEY79a+G0syIUEN
X-Google-Smtp-Source: ABdhPJzkVzWIxN+ha82Y4Q1vSlqzv9wTrhl+2IMMgZ4YcoORqGPV0gkrMjjv1/9uGZtEdhrVqy9j0A==
X-Received: by 2002:a17:906:660c:: with SMTP id b12mr4832657ejp.86.1622627246522;
        Wed, 02 Jun 2021 02:47:26 -0700 (PDT)
Received: from localhost.localdomain (hst-221-100.medicom.bg. [84.238.221.100])
        by smtp.gmail.com with ESMTPSA id q18sm945138edd.3.2021.06.02.02.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 02:47:26 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        nicolas.dufresne@collabora.com,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v4 0/2]  Intra-refresh period control
Date:   Wed,  2 Jun 2021 12:47:12 +0300
Message-Id: <20210602094714.607828-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes since v3:
  * Dropped double space in .rst (Hans)
  * Clear the usage of INTRA_REFRESH_PERIOD and CYCLIC_INTRA_REFRESH_MB
  (Hans)

regards,
Stan

Stanimir Varbanov (2):
  media: v4l2-ctrls: Add intra-refresh period control
  venus: venc: Add support for intra-refresh period

 .../media/v4l/ext-ctrls-codec.rst             | 18 ++++++++++++-
 drivers/media/platform/qcom/venus/core.h      |  1 +
 drivers/media/platform/qcom/venus/venc.c      | 26 +++++++++++++++++++
 .../media/platform/qcom/venus/venc_ctrls.c    | 14 +++++-----
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  2 ++
 include/uapi/linux/v4l2-controls.h            |  1 +
 6 files changed, 54 insertions(+), 8 deletions(-)

-- 
2.25.1

