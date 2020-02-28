Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82E3C173FA7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2020 19:34:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726791AbgB1SeE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Feb 2020 13:34:04 -0500
Received: from mail-yw1-f68.google.com ([209.85.161.68]:34364 "EHLO
        mail-yw1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725827AbgB1SeE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Feb 2020 13:34:04 -0500
Received: by mail-yw1-f68.google.com with SMTP id b186so4273952ywc.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2020 10:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7wb4fM/fxsBWj2lM6yFnKblnS6hqlfKT/9ovNQOCelQ=;
        b=sia8DF2PMZvqJTaJ2BJs3rWU3msaKBIuEH2gPCHv0JJgn6W+hTvHfJRKTwcp4IklR1
         oO0c1a1oEWC+/wMl2RYPML96chVYwx8gV9CQHY8c57P9MunsWLkIV+Rr16kBrmg2B/av
         FPophBKQnG5A5m/ot141yYwRwXUu+hj2SNi+jArp2bs1MkM3y+srh1lASYCF3ba4Tquk
         rIUHuplZ6W6BBm2MvCpNJ70cmgXBMpDm1wFnBVEuewJvxETJA1o/VtCt4Mk4NOcLuVAI
         IZL0cJ6GlaEPfnxm8NoyaL9MlXlzqYu2BuPwRTrkE7HfyH+Rh8FRYiiv4hT0uOkmqnoG
         LMDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7wb4fM/fxsBWj2lM6yFnKblnS6hqlfKT/9ovNQOCelQ=;
        b=pjyOxWD88Erf+SIUjAXQ4DRjltmRCKBxTb5SI1n63KFg+s6Fq8p4Iv0AY4XkJHCAVk
         d7UWiUnelJHfXYf37vJxe9kWJzk3CYtICFwCaTT5QfjHY686dcN5wG8tISc7Au7XimhT
         gYqoCLGScFXGdAPmhSNKu0ini2TKKhkRGnMqRB3nnOtOSXcs3bthcTZj7Xb1ZyzCz7WY
         QLnr8JxxbVUcztwwIKPB+dc8cnk4Nw2s8CBaKsQZx1uuTltgduYxUKF3pqqKGrcElKeO
         pm/u6Bup4vgGQ6IBRu38/dx66enVfEDmM12rOtlBKZ2Kp59JY//wY2h9fcH2mf1dxvve
         Xniw==
X-Gm-Message-State: APjAAAVFbbx21uV/mT/pF2TlikO54TdSRB54z7D6z8x78tfnigQG8QNg
        MpppzOtWLSYADpYEc8HXHxgtgg==
X-Google-Smtp-Source: APXvYqzczBTiNG47/L6qDWHBWVsGtRUHy5XwYXQS7CV1VyIbsG528QGtwlJyZAQ3dQf5N+GR6iDVLA==
X-Received: by 2002:a25:8449:: with SMTP id r9mr4754880ybm.244.1582914843320;
        Fri, 28 Feb 2020 10:34:03 -0800 (PST)
Received: from localhost.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id o127sm4409884ywf.43.2020.02.28.10.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2020 10:34:02 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] remoteproc: some bug fixes
Date:   Fri, 28 Feb 2020 12:33:55 -0600
Message-Id: <20200228183359.16229-1-elder@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series fixes some bugs in the remoteproc code.
  - The first patch moves some checks of the remoteproc state inside
    the protection of the mutex.
  - The second just eliminates an unsafe state check before calling
    a function, because the function will make the same check safely.
  - The third does proper recovery in the q6v5_probe() error path.
  - The last returns EINVAL if an unrecognized value is written
    into the "recovery" debugfs file.

This series is available (based on v5.6-rc3) in branch "remoteproc-v1"
in this git repository:
  https://git.linaro.org/people/alex.elder/linux.git

					-Alex

Alex Elder (4):
  remoteproc: re-check state in rproc_trigger_recovery()
  remoteproc: remoteproc debugfs file fixes
  remoteproc: qcom: fix q6v5 probe error paths
  remoteproc: return error for bad "recovery" debugfs input

 drivers/remoteproc/qcom_q6v5_mss.c      | 23 +++++++++++++++--------
 drivers/remoteproc/remoteproc_core.c    | 12 ++++++++----
 drivers/remoteproc/remoteproc_debugfs.c | 14 +++++++-------
 3 files changed, 30 insertions(+), 19 deletions(-)

-- 
2.20.1

