Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E43FD2279E0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jul 2020 09:52:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728513AbgGUHwI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jul 2020 03:52:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728476AbgGUHwG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jul 2020 03:52:06 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74EADC061794
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2020 00:52:06 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id b30so8858136lfj.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2020 00:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=PCNLmGR8sMtBYV74iVoiny++gKyFU6QKve9J6ft8KaU=;
        b=ajU56GrsuzhVrOlNfLRWp8gS9xgN5nLCwulEk19YM/GaWszzUOzXZsUttzaFR+kYBd
         a3WblZS8HsXjcOC+06HIMV/LfkYXcZpbGarrKZegHGsFyAEj/801vqo3iMBEB/GbSAfu
         5G8PlNSKeeoRAyWoCTQUtqRvvOpPsdyur+CMiLPDYZyvMhtv9uWYiDmN756EBkuZADpN
         2Kyo38Mvtv/2H8ivHQdBv83rtP1KNSTNZwjTHa0dNZqyXHixtKsGNiZc7WycJks8M/Xe
         Kng05ZGPmPIK/PAuxYzSmLffC8oh+0kR8WmHRM6j5HJg+pSXYsO/xDEvgGfhr+4Xf1tC
         09tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=PCNLmGR8sMtBYV74iVoiny++gKyFU6QKve9J6ft8KaU=;
        b=TpY0uLMtI+34/luruSZgq2ZTsuu/Pum4yTNQX/uICBQtMjPmt2rOy0hkOsxIsRUuSj
         ZPF1I7XvAzUWiIR/ru6xv0zzf0Jp+rGW+e6utPxxmZ2ieNqyZRfn0YLOyBzOLdoGocRX
         oww/jXicVo80ZOjzh9Yo49B27R8WLCBp9SxLWI2vpdjexlq/aAd003t2rZgo+tVQeUN7
         At/FjQEC7tavessVq8RGmOZsHUvUTNgMItuyZxLFMqf+FjjDdNxRuiE7fQbyBzmbDzsz
         caaJZCP9l/JDiQVCq53dTgTnJHneNMUDNxJnZZRGefayJppe4IkWu0P0jjX4z5VZ+7Vb
         q1DA==
X-Gm-Message-State: AOAM530cIUP23TKvJTdhrl2LDe6/GANSQkBMIKTYl3HsM+5XVn4Rmsf9
        rE57vkBMSQFPgTb7hHR+YxCgGw==
X-Google-Smtp-Source: ABdhPJy2qjOFre89D/XJ6t8nL6rNdprR8dDkMF1M23qAA64/hgv3xri/5CIiQNouo4dhr2d7ayG8ww==
X-Received: by 2002:a19:e45:: with SMTP id 66mr9554217lfo.82.1595317924966;
        Tue, 21 Jul 2020 00:52:04 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id d2sm4045334ljg.6.2020.07.21.00.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 00:52:04 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kamil Debski <kamil@wypas.org>,
        Jeongtae Park <jtp.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Maheshwar Ajja <majja@codeaurora.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 5/6] media: s5p-mfc: Use standard frame skip mode control
Date:   Tue, 21 Jul 2020 10:45:37 +0300
Message-Id: <20200721074538.505-6-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200721074538.505-1-stanimir.varbanov@linaro.org>
References: <20200721074538.505-1-stanimir.varbanov@linaro.org>
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

