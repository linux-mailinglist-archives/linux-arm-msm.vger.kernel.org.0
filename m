Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEFA710CA38
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2019 15:18:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbfK1OSW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Nov 2019 09:18:22 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:36522 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726227AbfK1OSW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Nov 2019 09:18:22 -0500
Received: by mail-wr1-f67.google.com with SMTP id z3so31303392wru.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2019 06:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zmBrf0xqWz93gyW7QbCHP8mXJjqNqFkUYk+vbwEVB8s=;
        b=aM1vUqNsSpqBNiApc4iz65iEABx7XJ1axHnAjaD8ZrzUv0tRaVVhznKeoFj9RvUCmD
         ppZSu2UVOxZhScA22OQ63Hj2t8SsB1Y3o/8ozblAcVgp3jSyjw6M2+i4r9mkqtkZVjRm
         gEgySW2xq6vdzwcZ48FCn1Tg+WyXjt4OTusE/pLxYGkn8xC1391qiwtRrhqjMiLNDeFt
         Egg7mbZ0tm7Yb0Obo0seGdRUxvkKyS8DG/egQfTdRIu0GTJeJSZqhCzAWWjhe7s/f1v9
         XgrmLEXUxHXd1BE+9aMHiO6OfygrtYfiScxmxsycVCVKT5ksGDwMZjWYfbDKrr020FE1
         uv/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zmBrf0xqWz93gyW7QbCHP8mXJjqNqFkUYk+vbwEVB8s=;
        b=RN035/IlLt5CecxMl4h+e1HBIguraEhum3qu+LZeK7RAVBtaPJE/hthkcIrQdvMH/m
         UGje3aPzq71flNuBRGowEI9MhijHMexTYGONA/iPGni5O3EobPt/ZoWEywU+lRcvVpfC
         z9bjXSatfRyHQa+hH1WlwLqhVmb289G4jmELI/j0IJonkzlEHt+rBsZ6YSALkZjJXp1W
         KJmiwEE7gLM0n8QGTSwoxgYUWQF1ROa5snhB8qpkdVpKAjRCmUd2B/f+OmfZV42yFOo0
         NLXn0t+rVZtzgN6sjd5/N+8hEYLXBGTqzI2BIxhgefhijgbM3fM6CapdRPi9d0/yPT0u
         Js2Q==
X-Gm-Message-State: APjAAAUyLzUgBD44iELY22wcn/evuzfpkBZG/1Svtcu5msJk5kuPeSWJ
        Abi9pxWeri3Z7yPHAaxBR8Cy0w==
X-Google-Smtp-Source: APXvYqz8o+Q52MqClLfUk6mTe+L+SVyrESEGjsTfL5qd16dFy78u2RSOKRh8c9qQv3AWXa+WkyjGWQ==
X-Received: by 2002:a5d:5704:: with SMTP id a4mr27635310wrv.198.1574950700480;
        Thu, 28 Nov 2019 06:18:20 -0800 (PST)
Received: from localhost.localdomain ([212.45.67.2])
        by smtp.googlemail.com with ESMTPSA id f6sm23947092wrr.15.2019.11.28.06.18.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 28 Nov 2019 06:18:19 -0800 (PST)
From:   Georgi Djakov <georgi.djakov@linaro.org>
To:     linux-pm@vger.kernel.org
Cc:     rostedt@goodmis.org, mingo@redhat.com, bjorn.andersson@linaro.org,
        vincent.guittot@linaro.org, daidavid1@codeaurora.org,
        okukatla@codeaurora.org, evgreen@chromium.org, mka@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        georgi.djakov@linaro.org
Subject: [PATCH v4 0/3] interconnect: Add basic tracepoints
Date:   Thu, 28 Nov 2019 16:18:15 +0200
Message-Id: <20191128141818.32168-1-georgi.djakov@linaro.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The tracepoints can help with understanding the system behavior of a
given interconnect path when the consumer drivers change their bandwidth
demands. This might be interesting when we want to monitor the requested
interconnect bandwidth for each client driver. The paths may share the
same nodes and this will help to understand "who and when is requesting
what". All this is useful for subsystem drivers developers and may also
provide hints when optimizing the power and performance profile of the
system.

v4:
- Move CREATE_TRACE_POINTS below all other headers and remove internal.h
  from trace.h
- Picked Steven's Reviewed-by.

v3: http://lore.kernel.org/r/20191122152712.19105-1-georgi.djakov@linaro.org
- In order to avoid #including a file with relative path, move the trace.h
  header into drivers/interconnect/. (Steven)

v2: https://lore.kernel.org/r/20191101130031.27996-1-georgi.djakov@linaro.org
- Moved dev_name() into TP_fast_assign() to reduce cache footprint. (Steven)
- Added path name to traces (Bjorn)
- Added trace for path, device and ret. (Bjorn)

v1: https://lore.kernel.org/r/20191018140224.15087-1-georgi.djakov@linaro.org

Georgi Djakov (3):
  interconnect: Move internal structs into a separate file
  interconnect: Add a name to struct icc_path
  interconnect: Add basic tracepoints

 drivers/interconnect/Makefile   |  1 +
 drivers/interconnect/core.c     | 55 +++++++++------------
 drivers/interconnect/internal.h | 42 ++++++++++++++++
 drivers/interconnect/trace.h    | 88 +++++++++++++++++++++++++++++++++
 4 files changed, 155 insertions(+), 31 deletions(-)
 create mode 100644 drivers/interconnect/internal.h
 create mode 100644 drivers/interconnect/trace.h

