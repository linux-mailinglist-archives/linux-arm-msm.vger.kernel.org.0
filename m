Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C6692A7693
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Nov 2020 05:50:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727098AbgKEEub (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Nov 2020 23:50:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726214AbgKEEub (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Nov 2020 23:50:31 -0500
Received: from mail-oo1-xc43.google.com (mail-oo1-xc43.google.com [IPv6:2607:f8b0:4864:20::c43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50AB1C0613CF
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2020 20:50:31 -0800 (PST)
Received: by mail-oo1-xc43.google.com with SMTP id j6so127945oot.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2020 20:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iXvgDxUHZDgdioVnVUBDyJDddujUGaP7Ie4ZuxcP+CI=;
        b=nucqWknzsoq365apuWXQVlZcjnkYpcNJaHtDoaRoDKUB9VtXBeHQua/2hyFp8jlOHJ
         lIAltg8yVtQrq5Nmbo0qFJA08479IkdQvYUt8IaJT7uBn9/JfDt4FK5lDlw1aiCyiPD9
         UJEuBld5zdrWbrIS5jqvzdqN9LjbCW1nYejygDLY39k1TX9eRYMfpmQbpdTfzGDY/APs
         AUGCAhhWhsXwal0ove22yWRvOt8Jo17OpD/DOR8kA4njQXL1TA9EtWJM4zf+50AaOwLS
         DzpatBmTWwhEpyuBu2P6DKQfBUvykIm6uJ7Rx8gII5ghxEcwxE1lSWjhy8NnDwi8TcrM
         GpQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iXvgDxUHZDgdioVnVUBDyJDddujUGaP7Ie4ZuxcP+CI=;
        b=hMMAlyA5BdUQHcLxLYfubcG1XQz13nXnfISfkjcfdkL23+T2HQo3K+Mwn+wygJXPY5
         aGN8zvV/fS8eheh5K1vqrkNA8G8v9cFEJAvV+IRFxGb1mq022B3vSo9KWKaJLNHYFbLP
         h6tqxvxmn+bEesJN6S4an5qq6JnBeYH4fJuf0MS201vQKl89puA9h+rWFeQT0YUepyjx
         SGytrICOvabeQFZoZvffIxPMi92dJabmiPbDUlzftVSG7s1j49jgCExQx4keuQQjTKVO
         Pp+F/7IFGuCYRhzz/Dce2NXIWcPrK6R5wt3khKouSvocJR5CvpRcDinbSqTSIFlNA5zC
         vwHw==
X-Gm-Message-State: AOAM531q36Hx2r4N0yVzaL2mW1CZn2m94IjyFbpaAjDvZmUcHHtvsr8L
        /3qVY2TnF/hgdraZr757xPt+7g==
X-Google-Smtp-Source: ABdhPJyMFQp7wq6UClyhJmtWpQ9QnmWlEsO1pCt2RlzkGZsjTJ+HA4MmmJIEK8SAHA5Oy68pkjl6uQ==
X-Received: by 2002:a4a:e96d:: with SMTP id i13mr546876ooe.66.1604551830486;
        Wed, 04 Nov 2020 20:50:30 -0800 (PST)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id k13sm100553ooi.41.2020.11.04.20.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 20:50:29 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Siddharth Gupta <sidgup@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] remoteproc: Improvement for the Qualcomm sysmon
Date:   Wed,  4 Nov 2020 20:50:47 -0800
Message-Id: <20201105045051.1365780-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The core part of this series is the update to the sysmon driver to ensure that
notifications sent to the remote processor are consistent and always present
valid state transitions.

In testing this I finally took the time to fix up the issue of the SMP2P based
graceful shutdown in the remoteproc drivers always timing out if sysmon has
already successfully shut down the remote processor.

Bjorn Andersson (4):
  remoteproc: sysmon: Ensure remote notification ordering
  remoteproc: sysmon: Expose the shutdown result
  remoteproc: qcom: q6v5: Query sysmon before graceful shutdown
  remoteproc: sysmon: Improve error messages

 drivers/remoteproc/qcom_common.h    |   6 ++
 drivers/remoteproc/qcom_q6v5.c      |   8 +-
 drivers/remoteproc/qcom_q6v5.h      |   3 +-
 drivers/remoteproc/qcom_q6v5_adsp.c |   2 +-
 drivers/remoteproc/qcom_q6v5_mss.c  |   2 +-
 drivers/remoteproc/qcom_q6v5_pas.c  |   2 +-
 drivers/remoteproc/qcom_q6v5_wcss.c |   2 +-
 drivers/remoteproc/qcom_sysmon.c    | 121 +++++++++++++++++++++-------
 8 files changed, 109 insertions(+), 37 deletions(-)

-- 
2.28.0

