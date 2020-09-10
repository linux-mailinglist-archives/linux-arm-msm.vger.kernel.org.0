Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0944E263F10
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Sep 2020 09:53:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730193AbgIJHxY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Sep 2020 03:53:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730064AbgIJHw6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Sep 2020 03:52:58 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8308C061757
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2020 00:52:56 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id l17so5274059edq.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2020 00:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=vN12iXSe93FrYozqq5r2Omm4hmslv0t/kmDHtlJE9ZI=;
        b=x4eQRdKfg0RY9zTkFU0gUMOdLG/E5FrZKotRF1B3H2YO5zS27dgHrV84H0WuJ52ZJS
         +z6ydGAnhu0yTEcvHZtnF2EbCAVJXVfLfzn2W3l4lDdG0OBUVq/HJfyhj2Ga12cWsFQq
         4I/ernKvfYfl4FMqdtg+W49FHlfvKJgUa9l2GR+Hqe13Ay2L9NMrxI9GhXqDk8LWlPz+
         J1llg1x270YQuSvcevwyIymxn8ml/k8eN0CLNB6vZA1BWvzKvApyA2AU7HCT2mCuBlP3
         RgBt2+4jav8Ssawga7FuDt1ZiSuVopUjdMx52pbKLhPAKuVTrRPAhmgTTqcNtdsldpiU
         hEuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=vN12iXSe93FrYozqq5r2Omm4hmslv0t/kmDHtlJE9ZI=;
        b=Ynq4ul/YUDzi2Lv6XxBA/Kzgu3/FNEtnwzzKqx17dSrumcnEhBgRfToNcR5IhzupK9
         iWTKGqfMBB73ZtK4kyMalC/uS64y57EiO/vhglsIahfEFSfheQ5C/Qq5bbFWs1i/akoZ
         jX+pyaxTeeGUrsPikuaFOZ99vN1IGyFx9P2NoqSTHAVAa9EYxkRs5eXk5I6pEVbo6fD5
         m/1abzjGw0IJ2YHfPothgzSWxEtPyoE70kFwlQ1FgU+hjwqh7NZRpvOyQEPV64Cxt8jr
         wH58KQsQDr1rVpuo7kHSOhSYWvyeoi0kfk/FMHaolSUrjQsHN6+8jeoJM7SB2snfkvGm
         gOGQ==
X-Gm-Message-State: AOAM530ByOBJ8AcFYltUFOWxv6uKqtrV+p4rvjfogeX7aqNlWo9OUx40
        +2erGlGeMD0NQb7MT0h3UGpDc6KTNbrr3Vmj
X-Google-Smtp-Source: ABdhPJw2BPEh1f8NHoqYvWJpzyvcWuUQF5T3Gq/nELgPfY74+EXJhH7ilI+eTdKH4UxgDRteSzze0Q==
X-Received: by 2002:a50:84a2:: with SMTP id 31mr8187522edq.138.1599724374085;
        Thu, 10 Sep 2020 00:52:54 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id q26sm5742838ejr.97.2020.09.10.00.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 00:52:53 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Elliot Berman <eberman@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v3 0/2] Venus - fix firmware load failure
Date:   Thu, 10 Sep 2020 10:52:25 +0300
Message-Id: <20200910075227.950-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

Two changes since v2:
 * 1/2 drop pointless line remove.
 * 2/2 call qcom_scm_pas_shutdown() in error path - spotted by Bjorn.

v2 can be found at [1].

Regards,
Stan

[1] https://lkml.org/lkml/2020/8/17/323

Stanimir Varbanov (2):
  firmware: qcom_scm: Add memory protect virtual address ranges
  venus: firmware: Set virtual address ranges

 drivers/firmware/qcom_scm.c                  | 24 ++++++++++++++++++++
 drivers/firmware/qcom_scm.h                  |  1 +
 drivers/media/platform/qcom/venus/core.c     |  4 ++++
 drivers/media/platform/qcom/venus/core.h     |  4 ++++
 drivers/media/platform/qcom/venus/firmware.c | 19 +++++++++++++++-
 include/linux/qcom_scm.h                     |  7 ++++++
 6 files changed, 58 insertions(+), 1 deletion(-)

-- 
2.17.1

