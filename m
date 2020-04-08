Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A19011A2B34
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2020 23:34:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730705AbgDHVeA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Apr 2020 17:34:00 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:40694 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729222AbgDHVeA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Apr 2020 17:34:00 -0400
Received: by mail-lj1-f196.google.com with SMTP id 142so4744510ljj.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2020 14:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=FfmcLu7OaNG5my17Bb1bWpc03LxeJJ91Gr/SWFxHfKY=;
        b=fdCK9KNPorKg20SE98S/pwHuRJ45w86pgp/d1PdPGgjyxPDJU7n4PxSO1AzW1ZFOzS
         BjDGZ4JZ34OVZJSxHZOFbXkF7CVk8LsCm1YOVv+uP9mlzH1kCxiRFkt5TzxVTkVTweZ4
         aQP+5QpWjj7WCBwvx/iEC7GWoizXMpwJB1jyDtEq8ix3+ZFxqWMI8k1LEcDQ4OIPQqgA
         VK19UmeLEl+ui7w5ZF3EYOaKgSS0I/zF2yM5DRk4p52vRAA/726/XTeLIUlxnakaHd0U
         VaSW4heO3tTeAipqaby7ZT1G3DtLWbkZdgL0skMnJSdYStSSxPRwVdKyUNlWr2FZjJd8
         D95A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=FfmcLu7OaNG5my17Bb1bWpc03LxeJJ91Gr/SWFxHfKY=;
        b=JNeSzqeEWd40w7+BoS2W8HjxMD4N9UrjX4TbXEPFcTJ5ozXGoASqB2DpkTIkVc4Nqn
         vTJfV5EYr4ZykVMAZtHBUGh9vrtURIrkdcvmnPrVqm+nO/Qz9kV6A/49pNfcAAfmBXWA
         xy4tW6GjNLq0GiwDbFQXLReBLkjcIrFT9nT8yEm9OVKGO7PuZ7fcmYU+0jAo0KaBns42
         A+COC3UbPMN+tsmqFtTBkecGAPwxCnjYcL42IMdzSIxxo1tr9oPc90DLkiLaijaZRBrP
         qOnMFjx/yJ8butMJdJ+nG0QWVtyIUAisFHrhAgPGEmOx9JEWyv+rRVHsnmdr8cZSFAfF
         kNqQ==
X-Gm-Message-State: AGi0PuYa1eHVkHQlwKefSjO2V+FwPGUZHBExBZUEfkVnF370/s103ggp
        P8oUynPSz95ue5SU4eVLVe5JDw==
X-Google-Smtp-Source: APiQypIpB2e2ViIL0CCnYA4oVkvhs/yNpUwKFGColwjFzRfm4QOmlrGRqt9fD3677H7kyMyuPa9D0A==
X-Received: by 2002:a2e:b8c1:: with SMTP id s1mr6507942ljp.0.1586381636370;
        Wed, 08 Apr 2020 14:33:56 -0700 (PDT)
Received: from localhost.localdomain (212-5-158-138.ip.btc-net.bg. [212.5.158.138])
        by smtp.gmail.com with ESMTPSA id t6sm15746688lfb.55.2020.04.08.14.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 14:33:55 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 0/7] Venus Codec API addition and few fixes  
Date:   Thu,  9 Apr 2020 00:33:23 +0300
Message-Id: <20200408213330.27665-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

Here are few fixes found during testing and one new addition
related to decoder dynamic-resolution-change Codec API requirement.

Please comment.

Stanimir Varbanov (7):
  venus: core: Add missing mutex destroy
  venus: core: Fix mutex destroy in remove
  venus: core: Constify codec frequency data array
  venus: helpers: Done buffers per queue type
  venus: vdec: Mark flushed buffers with error state
  venus: vdec: Init registered list unconditionally
  venus: Mark last capture buffer

 drivers/media/platform/qcom/venus/core.c     |  6 +-
 drivers/media/platform/qcom/venus/core.h     |  5 +-
 drivers/media/platform/qcom/venus/helpers.c  | 18 ++++--
 drivers/media/platform/qcom/venus/helpers.h  |  2 +-
 drivers/media/platform/qcom/venus/hfi.c      | 10 ++--
 drivers/media/platform/qcom/venus/hfi.h      |  3 +-
 drivers/media/platform/qcom/venus/hfi_msgs.c |  2 +
 drivers/media/platform/qcom/venus/vdec.c     | 58 ++++++++++++++++----
 drivers/media/platform/qcom/venus/venc.c     |  2 +-
 9 files changed, 80 insertions(+), 26 deletions(-)

-- 
2.17.1

