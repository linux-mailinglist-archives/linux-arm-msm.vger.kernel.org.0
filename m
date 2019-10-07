Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E85ACED88
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2019 22:33:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728273AbfJGUd3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Oct 2019 16:33:29 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:35765 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728187AbfJGUd3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Oct 2019 16:33:29 -0400
Received: by mail-pg1-f194.google.com with SMTP id p30so6826093pgl.2;
        Mon, 07 Oct 2019 13:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YIGB5rJKa3Nx+y5Yme8n/YvLb1Ib/S8pJqTx4xDiXH0=;
        b=LyU/jqzmdtoaohFHiEUWVKJU4XnVKA0WlP9CkJCjGUe0SV4/BIBd6pw8HXM8Pvd52O
         sH0slGqUYiWPO2+0ej9aBsJ7bnh6Kkoz4A1dZX2LpbyUF6i7m9zFdJZxCll6Bb92ONGX
         6iNbCXMJA3XM2jsBQ9rvunwFmrWAcxNuDdUtrPKEiDvyjGSa1Zt+zGoR185DFe68c1oM
         KlRLZWqU+lclAlAQR0uPCKsSq+AHb5kmSgeQjLur5WZZBS22/WrIkwSvZ2Rx/do5Y1c6
         mdNOsAiFcBzfoYx0NFPdGM5kcbSTc56hVnBEUPdO4Odli0WHT7gFXpvo6aUpSOVWLQmG
         QVZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YIGB5rJKa3Nx+y5Yme8n/YvLb1Ib/S8pJqTx4xDiXH0=;
        b=D/bdCidi0kRC3yMCvEVQiqiFVmCuRN/ySCfm8T0QwaTZno8uhoPk8X6IWGeJBN1UCm
         twkkm6HL775clOZ6u2YeycFdWGta58oaWnCG0ejBG2dCu1zNei1d9+b2uX/VjcP3GSoB
         qJ5oTFydqpaxXhtOqNvvW20Cs3FkgFbvIfwfvYVOTzp3spuEZOz/N84hwlS25OqY1rBf
         uABQxFU1VeSqmUbl+ytqKMFeFPYrwCc3G1fYx43/x61XDzsj8dzijd+PbDB1XmrRcisg
         zc+PY1dkU3MLM1N/RbofTMc6m4lSd4W4E3mEe4eCkrNxTp9PjYapykF4AclkfRssEiMz
         pIOQ==
X-Gm-Message-State: APjAAAUJbcZXVJNgj8gK1FC9r6GGvopb0FaojId3TwfNHZwPbU/J9HV6
        Ael09h+GfoMfGMWuxuCNkQ8=
X-Google-Smtp-Source: APXvYqwavWe8oRsj1hCM4qAecyeDctcm+6+xa8gLklkRlAhhFJeuKwgfoVdYJtH1e+uIAY1L+UD0ZQ==
X-Received: by 2002:a65:4506:: with SMTP id n6mr32113258pgq.240.1570480407088;
        Mon, 07 Oct 2019 13:33:27 -0700 (PDT)
Received: from localhost ([100.118.89.196])
        by smtp.gmail.com with ESMTPSA id c8sm16734359pfi.117.2019.10.07.13.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2019 13:33:26 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] drm/msm: fix rd dumping for split-IB1
Date:   Mon,  7 Oct 2019 13:31:07 -0700
Message-Id: <20191007203108.18667-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

When IB1 is split into multiple cmd buffers, we'd emit multiple
RD_CMDSTREAM_ADDR per submit.  But after this packet is handled
by the cffdump parser, it resets it's known buffers on the next
GPUADDR packet, so subsequent RD_CMDSTREAM_ADDR packets from the
same submit would not find their buffers.

Re-work the loop to snapshot all buffers before RD_CMDSTREAM_ADDR
to avoid this problem.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_rd.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_rd.c b/drivers/gpu/drm/msm/msm_rd.c
index 76d3fdd17bf8..f8f654301def 100644
--- a/drivers/gpu/drm/msm/msm_rd.c
+++ b/drivers/gpu/drm/msm/msm_rd.c
@@ -382,7 +382,6 @@ void msm_rd_dump_submit(struct msm_rd_state *rd, struct msm_gem_submit *submit,
 			snapshot_buf(rd, submit, i, 0, 0);
 
 	for (i = 0; i < submit->nr_cmds; i++) {
-		uint64_t iova = submit->cmd[i].iova;
 		uint32_t szd  = submit->cmd[i].size; /* in dwords */
 
 		/* snapshot cmdstream bo's (if we haven't already): */
@@ -390,6 +389,11 @@ void msm_rd_dump_submit(struct msm_rd_state *rd, struct msm_gem_submit *submit,
 			snapshot_buf(rd, submit, submit->cmd[i].idx,
 					submit->cmd[i].iova, szd * 4);
 		}
+	}
+
+	for (i = 0; i < submit->nr_cmds; i++) {
+		uint64_t iova = submit->cmd[i].iova;
+		uint32_t szd  = submit->cmd[i].size; /* in dwords */
 
 		switch (submit->cmd[i].type) {
 		case MSM_SUBMIT_CMD_IB_TARGET_BUF:
-- 
2.21.0

