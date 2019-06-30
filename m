Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26AE55AFD3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jun 2019 15:15:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726509AbfF3NO7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 Jun 2019 09:14:59 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:39749 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726500AbfF3NO7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 Jun 2019 09:14:59 -0400
Received: by mail-qk1-f196.google.com with SMTP id i125so8916336qkd.6
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Jun 2019 06:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Nc5W7+AXQXpGcLL+N74zfKeQQmgVMy5emCXGT/mdFok=;
        b=C6cU4x2uPfVu/sKGnA0d31gUr4/SD0rfIkGWCTw7ejLqxsIuTjAO/sGHgDelc5kZYw
         iPYJJnqQr36x/POyezEwcZ79/RZRairBochzK9pz9V3KCw02LSutlBDzGje7IVDfXZs4
         O3lk+wevFqtWfil16atlL6VzADGLOJpoy/+C29dJl6ugfAkF6E8VejpQHdahMqpZEugz
         NoYelWjNnh7PAXWTbrkMpiyJXqno0FjkPjkWl6NwF0psObn2uSkNb26zJtv3pyvONYQu
         CvPSXNxYH6mirAzEdeVrMBpFcjtOkRDfV0kkppMCeJ5R9qKpG1aLW4c0CL4IDfscMBVD
         fGwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Nc5W7+AXQXpGcLL+N74zfKeQQmgVMy5emCXGT/mdFok=;
        b=Xxoo+X/+0OC8JKR/CwFnnMwi3M8Ff1of6ComZUyttDkUb42mg94RLdyFyF5McpYTpL
         BZtupypcARwSd+bOOp3odNvKqTLtm9QPvd40HtOuQiES5dKczIbW9vnpHkra8QHvMfIY
         6F9YQ2YhCKmpJlwKp22E0c5rpuC2RT0IKelQG1ePzqLPhXPaGnY5qYuVv0lBKpi7XVx2
         R6a2q00t7sBB2s9QeL2fmYs1TfOwwKFT2sx/PyugF7Ua6zh5oD5lMzwD5oD+LQaZWqLU
         cvwWNky3urci1HNm1fgWk4lRJxX/zuRxovUzyUHpkOns/GV+0SoAO+KQUh2zNXYyif9h
         AxBQ==
X-Gm-Message-State: APjAAAUzfb85+FE9jxEYq8A65Fg5cbU4BxRw20/jvmn5bEhS5LDtQUTL
        k+LI26WIxUDd0OMoXvjhPEUC6Tk/1DU=
X-Google-Smtp-Source: APXvYqyWLADI9zCODKytyFhhWC20izReqX526BI+yel5BcdlsW8jp45pwiETLtEsIuiDjBjgs17wAQ==
X-Received: by 2002:a37:a854:: with SMTP id r81mr16453214qke.53.1561900497832;
        Sun, 30 Jun 2019 06:14:57 -0700 (PDT)
Received: from localhost ([2601:184:4780:7861:5010:5849:d76d:b714])
        by smtp.gmail.com with ESMTPSA id b5sm3405201qkk.45.2019.06.30.06.14.56
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 30 Jun 2019 06:14:57 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>
Subject: [PATCH 0/3] drm/msm: few small cleanups
Date:   Sun, 30 Jun 2019 06:14:40 -0700
Message-Id: <20190630131445.25712-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

2 and 3 are some early prep-work to deal with bootloader enabled
displays, where we want to avoid runpm get/put cycles until we know
that we won't -EPROBE_DEFER.  (Otherwise, it will kill the display,
and it's not terribly nice to kill efifb and leave the user with no
good way to debug what dependency they are missing.)

Rob Clark (3):
  drm/msm: don't open-code governor name
  drm/msm/dpu: remove dpu_mdss:hwversion
  drm/msm/dsi: make sure we have panel or bridge earlier

 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c |  5 ----
 drivers/gpu/drm/msm/dsi/dsi.h            |  2 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c       | 30 ++++++++++++------------
 drivers/gpu/drm/msm/dsi/dsi_manager.c    |  9 +++----
 drivers/gpu/drm/msm/msm_gpu.c            |  2 +-
 5 files changed, 20 insertions(+), 28 deletions(-)

-- 
2.20.1

