Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D13A190523
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2020 06:29:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725853AbgCXF3K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Mar 2020 01:29:10 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:47008 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725869AbgCXF3K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Mar 2020 01:29:10 -0400
Received: by mail-pl1-f195.google.com with SMTP id r3so6927138pls.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2020 22:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ra3lKpyRwpXEMv7HLjwjk2xlSk4Do59iXflfneeNh40=;
        b=OVJfwC4b1PEr/2jykKzhhdZvbXbHUcn76l1jFofytmydV+hZD1SG74gGKktPsDAqSN
         zFKJ9gjIseLoywqXUMffqa6z41YelbniVwpLO4cn8k0/mGxSfs7+o5oFd6hvmdDBA392
         TgFhjkqejJ48IaOASEmZVcLA3uow/kBIBJQFR1sTibJHVU9HxbwaajHYFBRxYfkt7Lfc
         nhCBas2c5k3T//9GSC0RH3Dr+dlmRIu9zN8KVHOIwDLqy2qQQJMantm2Ab9ZGL/wN+9z
         m5wDS3bK9tYy8DXYGGxibpI3a8L9q46iPYyA83+bBvhoIk76AogOmzXTIYGzB8UYj+2N
         q1iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ra3lKpyRwpXEMv7HLjwjk2xlSk4Do59iXflfneeNh40=;
        b=Siu5ibn0zVUS6mZvl/wmApjHzmPKPzVf+k8bGmsq8Z3orO4SFHGtiG0UMnzLMlbIzI
         8Xshq/7xnOzlfuVLdk/ENmP85JP0F4Rb1VlXefg1E72r064RnSoebTpYDSjyWxbblsRg
         8Vvz9RK0I5PjF/3qY63DGFSCbjqubfGybfVVUov7iYd/Endd0/0Sua0PMQWwwjiLEedC
         tymXhXsA50/Dg90gn44JJW7IaZw1mMfxyTbwS30ypKNL70R6Z/ExRJwhS9NXKjj+GLAI
         oYT0Ydh4w4GZOLe8QY//CjunH11Vl/SJ9sQwDAIp1XjF2FzIkN2acklogs38WoXb14IS
         LmlQ==
X-Gm-Message-State: ANhLgQ21MyzeCQVQnYQUHbR+JfUT8rlyzjmjRUK+JkfpcVo7s+rvEeLS
        AFySb+M0hbTi8qmkyTh80Qovrw==
X-Google-Smtp-Source: ADFU+vtODNbfRHAyBz68wwxhAstaZapwyPZvFzxoO8Q8NW3QROIugYa6Kgu2ZXMASrFt7wQDdwTfxA==
X-Received: by 2002:a17:90a:bd01:: with SMTP id y1mr3362201pjr.129.1585027748925;
        Mon, 23 Mar 2020 22:29:08 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id j14sm2795413pgk.74.2020.03.23.22.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2020 22:29:08 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/4] remoteproc: Panic handling
Date:   Mon, 23 Mar 2020 22:29:00 -0700
Message-Id: <20200324052904.738594-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for invoking a panic handler in remoteproc drivers, to allow them
to invoke e.g. cache flushing on the remote processors in response to a kernel
panic - to aid in post mortem debugging of system issues.

Bjorn Andersson (4):
  remoteproc: Traverse rproc_list under RCU read lock
  remoteproc: Introduce "panic" callback in ops
  remoteproc: qcom: q6v5: Add common panic handler
  remoteproc: qcom: Introduce panic handler for PAS and ADSP

 drivers/remoteproc/qcom_q6v5.c       | 20 ++++++++++
 drivers/remoteproc/qcom_q6v5.h       |  1 +
 drivers/remoteproc/qcom_q6v5_adsp.c  |  8 ++++
 drivers/remoteproc/qcom_q6v5_pas.c   |  8 ++++
 drivers/remoteproc/remoteproc_core.c | 57 +++++++++++++++++++++++++---
 include/linux/remoteproc.h           |  3 ++
 6 files changed, 92 insertions(+), 5 deletions(-)

-- 
2.24.0

