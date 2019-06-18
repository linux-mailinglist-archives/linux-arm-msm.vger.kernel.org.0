Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 082EA4ABA7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2019 22:24:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730176AbfFRUYe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jun 2019 16:24:34 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:38873 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729961AbfFRUYe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jun 2019 16:24:34 -0400
Received: by mail-qt1-f194.google.com with SMTP id n11so17066383qtl.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2019 13:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MOjw9BHWo3T0l7S3HTHH3vMaG0gZSQ2JDUl5dsuqsG8=;
        b=dhgqGKJRQYeZ5wNr0CU80k43oKxmMrcbwu87Xx/12miDILLgt9ZCqpaaOkteCPM2U+
         l7kj/4GPfvgF3O+gOwNnBaSuzdAFZafzhTRXkw6zWyEB42jgGcTWXSa2peqsn7xalZEB
         eI5R6cGeCpe3kxGJP74JoWeKbwnYhfTHIjte4lf/jIyoWckJuLp+Fvg/3GA3Kk/lP4m7
         C9HTU09CPakaTTFYp4YoBKr+SECrp9oV/vBugwVaQtTeQw1vXTcYXZxmEcaQTEgBWj+9
         5N8q6QPeq9zudjkVo8WjnwzWGeEuegBE+0qlyI3NTDAigfAn79nl5hlGwl0nbuD40t+l
         eTJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MOjw9BHWo3T0l7S3HTHH3vMaG0gZSQ2JDUl5dsuqsG8=;
        b=Qw3+LjJtqtOUsQSUA2fDhR8+rkOe/IHrYf/ZolmgKmJju5G84lwsQES7DIm+J+kOsj
         TBJSQClcOf811qLBvjNK96OOoVm296qf3DFzE3Hajip3y8UlCFG7X9sDI7XG7HjjjJf4
         p3k+xW+wulp+ZDdUeMyHVxZuo4wOKYbQRfZHHbyvGeNHfp/EWlr0Vh1iAUU9h8o2hnlj
         Boj6pBO8O9XS81bgNOiY+/N6LpK+QNhui73ykyfI6Occb9uEZ+GaokGBzVJjblrNBE5b
         PVvbbrIcHUDaBg3+0imdEhgrVevw8N4KrzXeH1tqYW8+fZwHbJHTXJqqZRH0p1SrMQoL
         C7yw==
X-Gm-Message-State: APjAAAUOR+CpIhsC8YyeaoAJMUa0uTx6c/RnEvjPjkZcxwP5pxMstNj/
        XNnHLdaC+TEUcVllD44vdVw=
X-Google-Smtp-Source: APXvYqydfwJ5cnp6fT1knf4RuCLh1+NLiNl0Xink+Hs1XytUjAPJARWNPVAhqmBKCLyWY67k3z6LRg==
X-Received: by 2002:a0c:a182:: with SMTP id e2mr28217546qva.15.1560889473369;
        Tue, 18 Jun 2019 13:24:33 -0700 (PDT)
Received: from localhost ([2601:184:4780:7861:5010:5849:d76d:b714])
        by smtp.gmail.com with ESMTPSA id o71sm8516554qke.18.2019.06.18.13.24.32
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 18 Jun 2019 13:24:32 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, Sean Paul <seanpaul@chromium.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Rob Clark <robdclark@chromium.org>
Subject: [PATCH 0/5] drm/msm: mdp5+dpu interconnect support
Date:   Tue, 18 Jun 2019 13:24:08 -0700
Message-Id: <20190618202425.15259-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Most of this is a resend of things that have already been posted to
list.  I've rebased the DPU patches, which was somewhat conflicty due to
other changes and refactoring in the DPU code.

Abhinav Kumar (1):
  drm/msm/dpu: add icc voting in dpu_mdss_init

Georgi Djakov (1):
  drm/msm/mdp5: Use the interconnect API

Jayant Shekhar (3):
  drm/msm/dpu: clean up references of DPU custom bus scaling
  drm/msm/dpu: Integrate interconnect API in MDSS
  dt-bindings: msm/disp: Introduce interconnect bindings for MDSS on
    SDM845

 .../devicetree/bindings/display/msm/dpu.txt   |  10 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 174 +++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |  11 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c      |  57 +++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h     |  22 +--
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c      |  14 ++
 7 files changed, 158 insertions(+), 134 deletions(-)

-- 
2.20.1

