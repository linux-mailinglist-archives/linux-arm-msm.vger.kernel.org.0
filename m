Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2B0D19DD17
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2020 19:50:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404021AbgDCRuM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Apr 2020 13:50:12 -0400
Received: from mail-qv1-f65.google.com ([209.85.219.65]:45414 "EHLO
        mail-qv1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727882AbgDCRuM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Apr 2020 13:50:12 -0400
Received: by mail-qv1-f65.google.com with SMTP id g4so3993411qvo.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2020 10:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6RqKi5kQS7abbcK/m1MeYgXWyu5S1dWWUHnw0at9jU4=;
        b=hnyAoV/88z+dlStydxHrx8vJJda32g/f6iLhSfqsoXgbvHFR0fKod2GO+mjA7AMilm
         K8sayx6yZNn4mNTqNmSHR6Z4zshubd5vm+PpE9d/xCiHeAfvwbc2fWlWkKpxe/3Qna/w
         o95oqnQsktIYx+OQHocxLgJwacDbZI75GdSX8UzoQznNWqoS7/+i3TbeF3BqpecqkDg3
         xtCX75JbLMROPmKKjR8HzUg1PbHYFI7fRb505sSqP05/wdQFrGvwapN82De8OjTed/+Z
         D10mknQQn1jwnOlj7ZGc49ajapHlBqsVMl8vy803lptaH1CA58uvrEqpgY4gP9sWZecb
         gpgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6RqKi5kQS7abbcK/m1MeYgXWyu5S1dWWUHnw0at9jU4=;
        b=ljowwLpl6va42Bt/JDlKV2iVxukZOnfSa13quCA/zbt50BADDgoxOOuxUB8N44GKW9
         RtT9FSfBOs/951xFG3eAeHxyj8pA2ErLSd2b53lXN2fbkvF3rbBgpMRz5iU4Z9VUUBDF
         3AXVi3bKuVWpTRNWyvvrW/HD61iT7uyE6vTEVlEyXLZ4Li/0xVZ5vSvncQEQsnuig3jZ
         U5EhJKBltq8vWLVSNv3XEHEZfNneoEDnv9CurcvvLZlA5vrJj2n3GyBdIRDkk0j91iAg
         nWrGve2RGiNQNg2hneuGmKTjOYQXPcvOxAa/GmgxKEDwjJaLY3yhm39L/+T5QN9BEpBw
         oWww==
X-Gm-Message-State: AGi0PuZJfRaVRru5K9zjf62Ro3LYdSnQh+r6ZA+FiKKkfscEQjkdBVXd
        gFf3hFSPj0Krl5UhqzkbRh/idw==
X-Google-Smtp-Source: APiQypKqlXQdNVDSxOjJ1Ms50Az8IIgj5YUggK9m6THUtnyNdT511yDYfxOcjAcIrniOVwzOCbpasA==
X-Received: by 2002:a05:6214:b0a:: with SMTP id u10mr9744314qvj.45.1585936211473;
        Fri, 03 Apr 2020 10:50:11 -0700 (PDT)
Received: from presto.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id 77sm6821225qkh.26.2020.04.03.10.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2020 10:50:10 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Andy Gross <agross@kernel.org>
Cc:     linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] remoteproc: bug fixes
Date:   Fri,  3 Apr 2020 12:50:02 -0500
Message-Id: <20200403175005.17130-1-elder@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series fixes some bugs in remoteproc error paths.  The last
patch is derived from something I posted before, but has been
updated to based on Linus' current master branch.

					-Alex

Alex Elder (3):
  remoteproc: fix a bug in rproc_alloc()
  remoteproc: qcom_q6v5_mss: fix a bug in q6v5_probe()
  remoteproc: qcom_q6v5_mss: fix q6v5_probe() error paths

 drivers/remoteproc/qcom_q6v5_mss.c   | 33 +++++++++++++++++-----------
 drivers/remoteproc/remoteproc_core.c |  4 ++--
 2 files changed, 22 insertions(+), 15 deletions(-)

-- 
2.20.1

