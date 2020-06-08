Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D106A1F20DF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2020 22:45:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726897AbgFHUog (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Jun 2020 16:44:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726879AbgFHUo2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Jun 2020 16:44:28 -0400
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com [IPv6:2607:f8b0:4864:20::f41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7105C08C5D1
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2020 13:44:17 -0700 (PDT)
Received: by mail-qv1-xf41.google.com with SMTP id e20so9059071qvu.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2020 13:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=acHevj3wQIcryhB7O2ZRO4PATF9eIWbo+G1WRkznV+0=;
        b=SJTSV2+Z6VNkFlhdlnWtITIVaf5vYoqSYKr/f34664q6R+QXXEV+tgRZ1FHi/+E000
         Me6yk+QNbCBGelQ4P8PI20FbKZAZLoNFWmZ3HZE4EqK4iuDEH60ryY2dISsf9y3argHu
         UMPAB4Swt6oUhedie/XcWLz2KkFOcXE+6wCHKUGd2O9Tq444VcZvSUQc8hYhHY1pn3NX
         GQ/Crp3r1oq3LYlCpjCS9HmMuxEiEK9ZKef+xUVC+ih5B+N98Y8rB9YafCduk4sQKpit
         m1kjz5WQ6UsujVM0dfRYbpOYlCQLsp+Ps7L+DqkjqhiCv+PUA2Fc3tPXduqWNHZnTe7s
         ExJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=acHevj3wQIcryhB7O2ZRO4PATF9eIWbo+G1WRkznV+0=;
        b=Gx4ilKryddLc+f724RmaBNqxWHHsmAFmGLGLDVcLOiAGC2vc/okrN/SJodINaaT/V5
         Vz3PJC1NXwuflUbJSG2KfHdjGxynpHI/61tr9hQfF+ijo/zCPRgnZR9wkCvlw5ZPZyXT
         0Omz0zXiXNMgN9G55z4AOgNWU0R32fcGGsh84dEfGSmBsXdfAD4tFdZEunijfLfuXqas
         +bHxdfsFbcNdXXunZ6rVpigmgJ6EREZ4wwOos2vNIM+5D7+VosrjWOijVFyuESwEsnQd
         9OE/2aPZM4Fd0jbULv5HBGeZSgjJLoxQ/YWZ27rHLldcnaClkdCDcjmF2LMErswuOHPy
         /y7w==
X-Gm-Message-State: AOAM532HqryckqsgkB8W9m3D2PvOjbH3h8ojRWyHypjDi4bgSKZJxY9Y
        p42vXpFLgNFMLr1wDMqCdMWTQw==
X-Google-Smtp-Source: ABdhPJzOla+D8EOOeekqVt/wBj46R/nJoH0uM20TvTKVjJNwP4MBDNiTWp7yPIFrDtsJ9VawFCxsyA==
X-Received: by 2002:ad4:5668:: with SMTP id bm8mr549681qvb.248.1591649056614;
        Mon, 08 Jun 2020 13:44:16 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id y16sm8895565qty.1.2020.06.08.13.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 13:44:16 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     alsa-devel@alsa-project.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 5/5] soundwire: qcom: enable CPU interrupts for mmio devices
Date:   Mon,  8 Jun 2020 16:43:46 -0400
Message-Id: <20200608204347.19685-6-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200608204347.19685-1-jonathan@marek.ca>
References: <20200608204347.19685-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This allows the CPU to receive interrupts.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/soundwire/qcom.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index ac81c64768ea..58ffb46e0d64 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -34,6 +34,7 @@
 #define SWRM_INTERRUPT_STATUS_SPECIAL_CMD_ID_FINISHED		BIT(10)
 #define SWRM_INTERRUPT_MASK_ADDR				0x204
 #define SWRM_INTERRUPT_CLEAR					0x208
+#define SWRM_INTERRUPT_CPU_EN					0x210
 #define SWRM_CMD_FIFO_WR_CMD					0x300
 #define SWRM_CMD_FIFO_RD_CMD					0x304
 #define SWRM_CMD_FIFO_CMD					0x308
@@ -325,6 +326,12 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 	ctrl->reg_write(ctrl, SWRM_COMP_CFG_ADDR,
 			SWRM_COMP_CFG_IRQ_LEVEL_OR_PULSE_MSK |
 			SWRM_COMP_CFG_ENABLE_MSK);
+
+	/* enable CPU IRQs */
+	if (ctrl->mmio) {
+		ctrl->reg_write(ctrl, SWRM_INTERRUPT_CPU_EN,
+				SWRM_INTERRUPT_STATUS_RMSK);
+	}
 	return 0;
 }
 
-- 
2.26.1

