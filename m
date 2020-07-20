Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBEA52260D4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jul 2020 15:24:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728232AbgGTNYT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jul 2020 09:24:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726705AbgGTNYS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jul 2020 09:24:18 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95D1FC0619D2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2020 06:24:18 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id i80so9682956lfi.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2020 06:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=PCNLmGR8sMtBYV74iVoiny++gKyFU6QKve9J6ft8KaU=;
        b=YLYbNeJbyBIaAQ8rb/3znbvrfWAkG4bvqP1j/gNRpW2GRjAqCS3c57lHyprI9vcUVy
         CFYb6/y0MWLSE9CSw6JnkGdtlKiGuenOa6djBdXOcXB5EZe4wJ/G7oXvQ7cCPaNamTef
         cnXYLGAHpAjq/bOaUfi4sP9VWdQu3vzn/aG6Fjt2+/ybVS/Cf4NRtH/7inpbltWwLXvx
         9M9lYOOvRcrBJ++S/+qt8xMlSOTOCTGXb83x40QVyzfzokshHKrV6DUZODmIrA9GXWim
         bMophe4N3uJwQBu0Sr/9uv2THyxTHEDF5bsZ6Dd3yM9YBKQwikBqCqYtNwc9pWARjKHq
         vGdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=PCNLmGR8sMtBYV74iVoiny++gKyFU6QKve9J6ft8KaU=;
        b=igf5giGgSV+RGWYqJom3e9g0OjYMX0QNoSOUCRd7iDsf1FAHARB2BZHf4WVRWctb/+
         eQsX7pQtub9D9BE/YK9WES/X8pgRbLiSZn0pbU5NHMhouVFd7Cqgp8rbZ4fxUN6oDlzO
         Ttdn/3VYKE+bkW7ErN77fqrlI81QNQN7ziMA6AvjDUwaqPWwNY8d3OdYP56bLTPyEmVo
         9axbpDOcJnHIaVDly3ql9jzIlDPc/iQ33Q3/94qSRluySt1V8upKjxe6Sn9C/TJTDLhX
         DHpq2pr8AF7r9iL9/SESpsBUtZPdmri8wl7DqY88DN4S4lONt6sSi5JJrlH4huZBFp+D
         iBCA==
X-Gm-Message-State: AOAM531Wm4F+JZUSJQsgnN9SiEUSnr18RGW04Qlg16gVchBpcY4M8ffM
        UifFiLgF6Ruon9mVK5XQlxBhBQ==
X-Google-Smtp-Source: ABdhPJytG2Zgu+Ki97e5vuTKx8cSPSuv8MmaZXlz3NwLFdPuLR5QOLyNERbVvYpBHWPXrKtnKiUjVg==
X-Received: by 2002:a19:f80e:: with SMTP id a14mr811645lff.49.1595251457123;
        Mon, 20 Jul 2020 06:24:17 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id h6sm867829lfc.84.2020.07.20.06.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 06:24:16 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kamil Debski <kamil@wypas.org>,
        Jeongtae Park <jtp.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maheshwar Ajja <majja@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 5/6] media: s5p-mfc: Use standard frame skip mode control
Date:   Mon, 20 Jul 2020 16:23:12 +0300
Message-Id: <20200720132313.4810-6-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200720132313.4810-1-stanimir.varbanov@linaro.org>
References: <20200720132313.4810-1-stanimir.varbanov@linaro.org>
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

