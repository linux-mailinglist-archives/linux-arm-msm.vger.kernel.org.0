Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB8A0214C5D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2020 14:12:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727052AbgGEMML (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 5 Jul 2020 08:12:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727051AbgGEMMJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 5 Jul 2020 08:12:09 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B2B2C08C5DE
        for <linux-arm-msm@vger.kernel.org>; Sun,  5 Jul 2020 05:12:08 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id dm19so25875316edb.13
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2020 05:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=PCNLmGR8sMtBYV74iVoiny++gKyFU6QKve9J6ft8KaU=;
        b=K/7rA4K4EI8hH3WgLD9Nf1fvOjaQ2N3MAe9A9/Q+DJx/2ssL1Qe4HiABlOUCSkqgWw
         JAlYHMnQbaZkFA1GCxToq1heUQvMw4zBb1asjEsuCMT7CyN/hpN4eFNbkGR3uMO6NVyV
         KmSWfYWLxCVEipYByTksOCBLMyMtwvaLO1xmibJFqSdDo45h5/2bNFh7mE8epKXLn5M1
         UX7W4uTFx38idvXGt1L1olIZTTv3YXLtyeqTNxrJ8rbQseZwicHF6JvvrMkldIazkioa
         +UObmDI13lhx1SB+NXQBsWu/Qh7Wqe2DblVQ2aOiUw5R3qu1kb/QSyoQMo42cXONv2Oz
         A1yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=PCNLmGR8sMtBYV74iVoiny++gKyFU6QKve9J6ft8KaU=;
        b=O2dqwgLcgrxHk7rrnnMBWpl/3OxCu/+TabkxMyUubxC+uvFJoklBLf9MF6QqesBs2N
         fB0Bx9Bhah1u/nisHyP+zH2jIKBKIsOByczPGTHAh10nZsYZtBMEQWLlVgaYOvmHyTSt
         /VCrBMprXkc2iMeI9XXNAs1Gp1Fyivv+zQGCTOcTWGT5pFJRPKh6MwRi/78+3XhlssAn
         X8r1Z0P2z1zsOWYiwXnHO0GM60VpQwMMlt2uurmqbBIQA7jm52zZ0sKWTzh1jLlh0V3V
         pEgnTb4a4LXM9yVT3oEGe7CyBOogP0LLbYlCNUA+42d5uHn9lwkaAR0+a1psxQmUREnS
         0h7g==
X-Gm-Message-State: AOAM532dIMj8DMEEki+k6blzidIg4U+89G5xOMx+urModtasbt5KkRoB
        0dWCUGBH7KR375xIcwCnFz34TA==
X-Google-Smtp-Source: ABdhPJxUphOOcj51GIKZWPtS46QmBw6AGzkKHIdyv2GSwmDoikz7HE47hcK37iqB3e+CWv/7FyxzEw==
X-Received: by 2002:aa7:c2cf:: with SMTP id m15mr25321916edp.27.1593951127381;
        Sun, 05 Jul 2020 05:12:07 -0700 (PDT)
Received: from localhost.localdomain (212-5-158-133.ip.btc-net.bg. [212.5.158.133])
        by smtp.gmail.com with ESMTPSA id j64sm1517458edd.61.2020.07.05.05.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2020 05:12:06 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Kyungmin Park <kyungmin.park@samsung.com>,
        Kamil Debski <kamil@wypas.org>,
        Jeongtae Park <jtp.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Maheshwar Ajja <majja@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 3/4] media: s5p-mfc: Use standard frame skip mode control
Date:   Sun,  5 Jul 2020 15:11:27 +0300
Message-Id: <20200705121128.5250-4-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200705121128.5250-1-stanimir.varbanov@linaro.org>
References: <20200705121128.5250-1-stanimir.varbanov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use the standard menu control for frame skip mode in the MFC
driver. The legacy private menu control is kept for backward
compatibility.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/s5p-mfc/s5p_mfc_enc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc_enc.c b/drivers/media/platform/s5p-mfc/s5p_mfc_enc.c
index 912fe0c5ab18..3092eb6777a5 100644
--- a/drivers/media/platform/s5p-mfc/s5p_mfc_enc.c
+++ b/drivers/media/platform/s5p-mfc/s5p_mfc_enc.c
@@ -261,6 +261,11 @@ static struct mfc_control controls[] = {
 		.menu_skip_mask = 0,
 		.default_value = V4L2_MPEG_MFC51_VIDEO_FRAME_SKIP_MODE_DISABLED,
 	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE,
+		.maximum = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT,
+		.default_value = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED,
+	},
 	{
 		.id = V4L2_CID_MPEG_MFC51_VIDEO_RC_FIXED_TARGET_BIT,
 		.type = V4L2_CTRL_TYPE_BOOLEAN,
@@ -1849,6 +1854,7 @@ static int s5p_mfc_enc_s_ctrl(struct v4l2_ctrl *ctrl)
 		p->seq_hdr_mode = ctrl->val;
 		break;
 	case V4L2_CID_MPEG_MFC51_VIDEO_FRAME_SKIP_MODE:
+	case V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE:
 		p->frame_skip_mode = ctrl->val;
 		break;
 	case V4L2_CID_MPEG_MFC51_VIDEO_RC_FIXED_TARGET_BIT:
-- 
2.17.1

