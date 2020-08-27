Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EE8225420F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Aug 2020 11:24:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728357AbgH0JYx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Aug 2020 05:24:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728072AbgH0JYx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Aug 2020 05:24:53 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70B71C06121A
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2020 02:24:52 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id a5so4652732wrm.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2020 02:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=8WNu0XydsAAxM+xlTuetSXgq7SQdQWTliyRHRVl7Y4g=;
        b=UL/vz5KWCm02EuPRAlLKPbb9B6iVLeT9V1c/TeQ3wBfqFfI9ZUoWyds8dhdZgA66le
         hqwK7ff7FgTVA9epB9WOvwy0qqJJzPom2RvGc9DLDTX/YRi7Y/IzM7PcwMy0k/D9GvOi
         wHNJKUAgGZ2nnvRI8ZVRaxV+BymIBN8TF7+INK0fgdJvdI7BTqW+La/yNCb0HKZVBQ1J
         ArRx+aD2BpL9pBOWeZrT4/um5kI6KYDU1okUAC87MPpjdeoxB7usyjWWhRAyvSozP6DU
         OongPC7b9onBZ9DmibATUNbgQotawMF4lG2yxZMNjoC4GdsRsYasupdcj8Pkm9v84dfe
         fw3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=8WNu0XydsAAxM+xlTuetSXgq7SQdQWTliyRHRVl7Y4g=;
        b=iFF5cJWVa3eFYELD7lv7f/4IPS3oZQwrgx9kP3vqijl1FcyyG7fE3EYgeVUVunM1jB
         miY7N4licZSd0uZmJvDLoJeUIOl6L88MQVauE+05j2UqTRVcbpEEBKeN9b9wPlfy92Va
         CAFtZ+RxhaWMOMZav/IA9OEKxvfjHJwDFGFw0gAencfhrdsoaEDrkT/L9QWumRFVwmSH
         Fk40zknFh1hjh1gb/7DQ0nfs3xK/IOvn1IsBKBpHuLztO0RVgUDILrIE4lWCRi74Q9qF
         kkPY8oYGGhcj0tvKxTwEBfItx7D2VS2lS3n/UOUSl6bboqrIPl0pnChFKJ3WJTTmrO8/
         cIGw==
X-Gm-Message-State: AOAM5301hrmZ4lcWRllTj5U9luksOf9n4VGfheaoIhOcStuIoeL7oj1m
        iOaEIP4QodpnCtGlbhzyzt/c5w==
X-Google-Smtp-Source: ABdhPJx6idO50L1XDN5kcjld944eIACRkX8P547xDnM3cOcZwurffRl2Wmd66tiTvD+xF3nR5bQdWw==
X-Received: by 2002:adf:ae42:: with SMTP id u2mr18217235wrd.337.1598520289345;
        Thu, 27 Aug 2020 02:24:49 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id z203sm4357330wmc.31.2020.08.27.02.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 02:24:48 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Dikshita Agarwal <dikshita@codeaurora.org>,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 00/13] Introduce new hfi platform layer
Date:   Thu, 27 Aug 2020 12:24:04 +0300
Message-Id: <20200827092417.16040-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

In this patch series we introduce a new hfi platform layer in the
Venus driver to cover the differences between hfi versions.

The hfi_platform layer contains ops for getting supported codecs,
capabilities, number of VPP pipes and buffer requirements (the list
could be extended with more ops if needed). Starting from hfi v6 the
buffer sizes and buffer counts for particular codec will be calculated
in the driver.

Here we add hfi platform ops for v4 (sdm845 and sc8170) and v6
(sm8250) but my plan is to move v1 and v3 too with follow up patches.
With addition of v6 hfi_platform we aslo start a preparation to support
Venus v6 found in sm8250.

regards,
Stan

Stanimir Varbanov (13):
  venus: Delete not used core caps
  venus: Add more capabilities and VP9 profile/levels
  venus: Create hfi platform and move vpp/vsp there
  venus: Rename venus_caps to hfi_plat_caps
  venus: hfi_plat: Add codecs and capabilities ops
  venus: hfi_plat_v4: Populate codecs and capabilities for v4
  venus: hfi_plat: Add platform ops for getting number of VPP pipes
  venus: hfi_plat_v6: Populate capabilities for v6
  venus: hfi_plat: Add hfi platform buffers ops
  venus: Add platform buffers for v6
  venus: Get codecs and capabilities from hfi platform
  venus: vdec,core: Handle picture structure event
  venus: helpers: Wire up hfi platform buffer requirements

 drivers/media/platform/qcom/venus/Makefile    |    4 +-
 drivers/media/platform/qcom/venus/core.c      |   17 -
 drivers/media/platform/qcom/venus/core.h      |   48 +-
 drivers/media/platform/qcom/venus/helpers.c   |  110 +-
 drivers/media/platform/qcom/venus/helpers.h   |    2 +-
 .../media/platform/qcom/venus/hfi_helper.h    |   34 +
 .../media/platform/qcom/venus/hfi_parser.c    |   55 +-
 .../media/platform/qcom/venus/hfi_parser.h    |    7 +-
 .../media/platform/qcom/venus/hfi_plat_bufs.h |   38 +
 .../platform/qcom/venus/hfi_plat_bufs_v6.c    | 1231 +++++++++++++++++
 .../media/platform/qcom/venus/hfi_platform.c  |   65 +
 .../media/platform/qcom/venus/hfi_platform.h  |   66 +
 .../platform/qcom/venus/hfi_platform_v4.c     |  319 +++++
 .../platform/qcom/venus/hfi_platform_v6.c     |  326 +++++
 drivers/media/platform/qcom/venus/hfi_venus.c |    3 -
 .../media/platform/qcom/venus/pm_helpers.c    |    9 +-
 drivers/media/platform/qcom/venus/vdec.c      |   12 +-
 drivers/media/platform/qcom/venus/venc.c      |    6 +-
 18 files changed, 2229 insertions(+), 123 deletions(-)
 create mode 100644 drivers/media/platform/qcom/venus/hfi_plat_bufs.h
 create mode 100644 drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
 create mode 100644 drivers/media/platform/qcom/venus/hfi_platform.c
 create mode 100644 drivers/media/platform/qcom/venus/hfi_platform.h
 create mode 100644 drivers/media/platform/qcom/venus/hfi_platform_v4.c
 create mode 100644 drivers/media/platform/qcom/venus/hfi_platform_v6.c

-- 
2.17.1

