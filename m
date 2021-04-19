Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9B423646FF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Apr 2021 17:21:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238029AbhDSPWQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Apr 2021 11:22:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233733AbhDSPWQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Apr 2021 11:22:16 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22073C06174A
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Apr 2021 08:21:45 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id 92-20020a9d02e50000b029028fcc3d2c9eso10413964otl.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Apr 2021 08:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7q7bqxk84+tZWLx+S3rG1WzdRlKLYf+MiQJMKigSFd8=;
        b=lmsoshBWCDGMUKrNLB9AlLYCqcSmgLNDLL5NNR7cwYziJT6id/hqIJtURNpv6/t7gp
         9m4UtjONinFZkMm+YVacJ6efnbcDxgkrtFvQwmu6vaNRP4jhAy+IiyCpYYsgJ/bti/gz
         ZNs7gDhFXXNEk2ABZVcBqgbSnP3frwgkrBTVkeZbtlI+tQzSkTLz3EOiZtVxU5+Mx0vE
         7e6SNQ9Ci7nhSvRgMuviMAVJQErhLDBUueAFTcgP1EQHE36JhnDEIHOcH9k4QB3K5+tR
         Vk+yJusQaNXgTfGN7mYmrzZ/JMl/FZbdj5DqoJrWjfp4i/KXpyDXe3O3P8EfakPmngqz
         E9tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7q7bqxk84+tZWLx+S3rG1WzdRlKLYf+MiQJMKigSFd8=;
        b=rKgvvrimbXofGwXXdzjOnqtlA7EEGi2B5LFH+EqZhw2bIFTGY2Dpbm7CWO8GkPut3d
         mUPf33pLYicwnPpe+3bUGeZWylalz5Klyk82ay1k9FMU3cyUOFoSJpr6EX8ac1ztXSs7
         WvF+xptYeeEHXb9t1BSqcLF3Q61m6s+X3HBds4m3M5Eg+hFxrJ1kDEIy9KJZ3o75fkKd
         MaWv9yULlHqe2EwVjivzKsC8TccrZeIPWxR1rkoBFn/gj0wkqs60qvhjxWx3mImGKS51
         ELFhK+UIo0sQIXpxMA6WSNS+DobHIhuDqyXrihQt1CfmzRZliiLB6WVLwIb5zdoJMU0L
         v3fA==
X-Gm-Message-State: AOAM5314pcsxYjQPmT38KkZYlufivbiqQM/N51T2tmUQs303Yh3iqyIq
        XjHL2uEjuXVJ0YQOXDphBggklQ==
X-Google-Smtp-Source: ABdhPJwvTvnVMh2WJXmsPNvKt0j8k7ttDwSes8duCvTdlZhTFqE07cJvD154/leTHrPv6Rh2ogPGxg==
X-Received: by 2002:a05:6830:1f12:: with SMTP id u18mr8412677otg.132.1618845704569;
        Mon, 19 Apr 2021 08:21:44 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t19sm3622469otm.40.2021.04.19.08.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 08:21:44 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: [GIT PULL] Qualcomm ARM defconfig updates for 5.13
Date:   Mon, 19 Apr 2021 10:21:43 -0500
Message-Id: <20210419152143.861934-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-defconfig-for-5.13

for you to fetch changes up to 7de91b665600c96b1fc66c4c5a679db275c0c674:

  ARM: configs: qcom_defconfig: Reduce CMA size to 64MB (2021-04-13 21:21:22 -0500)

----------------------------------------------------------------
Qualcomm ARM defconfig updates for 5.13

This enables all the hardware support currently available for the
Qualcomm SDX55 platform in the qcom_defconfig. Due to (current) size
limitations these changes are not done in the multi-platform config.

----------------------------------------------------------------
Manivannan Sadhasivam (7):
      ARM: configs: qcom_defconfig: Enable APCS IPC mailbox driver
      ARM: configs: qcom_defconfig: Enable SDX55 A7 PLL and APCS clock driver
      ARM: configs: qcom_defconfig: Enable CPUFreq support
      ARM: configs: qcom_defconfig: Enable Q6V5_PAS remoteproc driver
      ARM: configs: qcom_defconfig: Enable SDX55 interconnect driver
      ARM: configs: qcom_defconfig: Enable GLINK SMEM driver
      ARM: configs: qcom_defconfig: Reduce CMA size to 64MB

 arch/arm/configs/qcom_defconfig | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)
