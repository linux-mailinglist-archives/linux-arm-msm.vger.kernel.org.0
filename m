Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6655B17F0A5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2020 07:39:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726205AbgCJGju (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Mar 2020 02:39:50 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:40371 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726211AbgCJGju (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Mar 2020 02:39:50 -0400
Received: by mail-pf1-f196.google.com with SMTP id l184so6019459pfl.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2020 23:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ra3lKpyRwpXEMv7HLjwjk2xlSk4Do59iXflfneeNh40=;
        b=Lbd+jRiVgFM/GOA25/zgQIwcVdRtjO336AYWMv936Bf0BBNwu/atrxnDP92hlNItad
         S+zcWWIOstOuzuwvc1BTHx/E/Ko37whEBJUybmpnhY+sODvoXsH0G9C4uo9NF2ZYKAiu
         z+lfQIxjGSU0jIkyDJbP9rpxS7ayJVvxy56VvCkc04qU+You79QuaWbNs518z/IMBsP5
         NMWt6sqK4E73ZFH6k2qwMbVGsfLZYmQNLiSxItRXmrdc+F05AtUEhSytIlgPG0W7tI0W
         O7+uPihlXtizOmHR3VGO8O85AffsPjfh+0TMppMXcHGnS+x2IFNXJVzdM1fnWP0hF94t
         LA2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ra3lKpyRwpXEMv7HLjwjk2xlSk4Do59iXflfneeNh40=;
        b=MxZxklKXz2ssUmnbLstVoikrnaPfLnNoM1nvvzKGfXxjgFKneZHwpetPPr9JkArjcY
         BJTGghLIC8xpay9oeSf0uxlV4ivpF2lbAwvSw7Yb7M0N+w+ywNeLdT4vemavzhHL0sRt
         5eFQfuFCzAf39kqEcN7xNxqXAHaBFtp91MgyjgNjJgz0KYkGS05wCspsr15VwmHDzOJs
         SUftDod876RzmrqzJxa/N1vXg/6gb9cE/lrzLP9DVW91n8NJP/mZI6Mxn/UAs6MXp51h
         nWsKypGvu7M1M+4tstj3KjIpzAx0roSVXELNNSzFsjn4Y9li7lqWFu//5ysd3pNuF01W
         h3vg==
X-Gm-Message-State: ANhLgQ30j0I3xf4JQN0wumWTQ/6CXeaqi1j4aOxPWLRFwlX8JRReZmFz
        baxmh9FWTD1Py/2MqqieMR+JSQ==
X-Google-Smtp-Source: ADFU+vvg6ldWvoYAmaIYZ5vD5tZJbZSSd9XMNxXMPf8i/qa/tRM6EyvNYj9Og3zbvkL3fncx9Vg2VA==
X-Received: by 2002:aa7:9538:: with SMTP id c24mr14561624pfp.14.1583822389416;
        Mon, 09 Mar 2020 23:39:49 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id j38sm42398468pgi.51.2020.03.09.23.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2020 23:39:48 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [PATCH v4 0/4] remoteproc: Panic handling
Date:   Mon,  9 Mar 2020 23:38:13 -0700
Message-Id: <20200310063817.3344712-1-bjorn.andersson@linaro.org>
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

