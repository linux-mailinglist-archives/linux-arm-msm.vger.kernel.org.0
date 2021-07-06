Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B2C33BD6ED
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jul 2021 14:47:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238023AbhGFMsn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jul 2021 08:48:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239261AbhGFMsk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jul 2021 08:48:40 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4D13C05BD35
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jul 2021 05:41:07 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id u8-20020a7bcb080000b02901e44e9caa2aso2158540wmj.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jul 2021 05:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZnlHLNnJd5GU0c7sfvbRXRKe3J+7AIP690BFavXKv1w=;
        b=Tgdihnyrz7EvhoXM7zBn/7wdjxTn+9+TZAnba00UOq7jgBqH6P/RLawu3OCcSSkS5r
         uT3uVAay9MiFXblkJgnjCsSyVvtuMpADlgH6oG1B02sTNA2s2UMFXxoWHKlJZknNk6Hp
         cAb3kKvRh/tgoiFtFBf09SjMGCwyD9QmHby5qIf+TgbD2EWZlvb2wCV1WfJIr+zJ4jDu
         a2x68i1M5MHokjcsbpqiMQQ5R1kYLQQP/dOilQdz6FBptzuHgnekoyaCWgVd9HCuBG80
         Mw+snaA+Gosk9GobmtcCGtOP2IbKgiZQFx7cDhQ95ZEx/jUyaEO872DCzVvJcqgXA4yB
         s5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZnlHLNnJd5GU0c7sfvbRXRKe3J+7AIP690BFavXKv1w=;
        b=LcJreyABH/PLRDxFvWSuo+5y7Lx0iYcjsQij4R7ZBKZAyCAlr0WMQWnanfNzd68Rcf
         0N5XcuDrEIOAsyoYErxBySe9SVM47Xxny0a1k8GfFI6Jp+yA6atGmk+sB0T0o7YIzk+q
         ACC3/0ihXQHmJmGQqFa2UNEjsMeEAr9hwJu/Yz85YoCpL2083i4NCh/vcKkbaayIVULM
         HiZ1uttu5noOGsloVQNcY0iJOFWw0Vp27ufkjQPo3RYfTXdjD8Uehdj9AZR1wO6LSKCm
         JILJ0G8KZdLRGkv53jAIAO91ss99/vuX5cpaUV7+saTvaQAE0UpLYM2fPBSBIjtoeuHM
         /8Tw==
X-Gm-Message-State: AOAM531fhPGu/zk/PkE/agDlk9caUChnfG0RBvZRbQenUt9x0PEgQ1gj
        a5K21rjCZ3AOwZqDgV5D9dBGf9rxQNkQZg==
X-Google-Smtp-Source: ABdhPJzWRZPLxPm5pkjpVSedfMNIICVpLIX53ZmQsrzAHGeoZVifZhAkmLeC18AjdSgx43eqXYMCPw==
X-Received: by 2002:a05:600c:a45:: with SMTP id c5mr442364wmq.153.1625575266517;
        Tue, 06 Jul 2021 05:41:06 -0700 (PDT)
Received: from localhost.localdomain (hst-221-27.medicom.bg. [84.238.221.27])
        by smtp.gmail.com with ESMTPSA id n18sm2585979wms.3.2021.07.06.05.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 05:41:06 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-api@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 0/5] Qualcomm custom compressed pixfmt
Date:   Tue,  6 Jul 2021 15:40:29 +0300
Message-Id: <20210706124034.773503-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

Changes since v1:
 * rename QC8C to QC08C
 * rewrite the documentation part
 * handle correctly QC10C compressed format in the driver
 * correct compressed 10-bit formats for Venus v4 and v6

Regards,
Stan

v1: https://patchwork.linuxtv.org/project/linux-media/list/?series=5331

Stanimir Varbanov (5):
  v4l: Add Qualcomm custom compressed pixel formats
  venus: helpers: Add helper to check supported pixel formats
  venus: Add a handling of QC08C compressed format
  venus: hfi_platform: Correct supported compressed format
  venus: Add a handling of QC10C compressed format

 .../media/v4l/pixfmt-reserved.rst             | 18 +++++++
 drivers/media/platform/qcom/venus/helpers.c   | 48 +++++++++++--------
 drivers/media/platform/qcom/venus/helpers.h   |  1 +
 .../platform/qcom/venus/hfi_platform_v4.c     |  4 +-
 .../platform/qcom/venus/hfi_platform_v6.c     |  4 +-
 drivers/media/platform/qcom/venus/vdec.c      | 31 ++++++++++--
 drivers/media/v4l2-core/v4l2-ioctl.c          |  2 +
 include/uapi/linux/videodev2.h                |  2 +
 8 files changed, 82 insertions(+), 28 deletions(-)

-- 
2.25.1

