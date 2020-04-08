Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 941211A2B3E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2020 23:34:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730753AbgDHVeK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Apr 2020 17:34:10 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:44567 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730754AbgDHVeK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Apr 2020 17:34:10 -0400
Received: by mail-lj1-f196.google.com with SMTP id z26so5176087ljz.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2020 14:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=KqwTl0YCgxCFoD6QzWeacolgi5eHFyPVK66/B9eGEJU=;
        b=Rs+1EAWzy1VV58B8ic72umCM2g0DVr+FxSWDqFmuwQmbfcsQpCSPb7ozP5rsx/AY+v
         WRNLg7tvETXoGITLQpT/VnxMGFH2obCaWmepQI3a9qkWRDDXkdyEQIJCH/3Sj4/nTST0
         T26x+BW6P1xRvZ0cSj/M70vkWbWi5s+NJMYTnYH/DbwSaaSfOTaD0im2zjRHktmqAotY
         eTtHSQcVx3L32UzappU/dibiG6+F0TR+g7dexzBVWP8PzFLig3R/qXtGrOiOd9MlGYES
         aJvKlWhE3FdV0pJwG+LKBZRLJeBP0lQhpN5F530MQF5kQY1xQj/NaWdktwvQT35PKwoy
         WzIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=KqwTl0YCgxCFoD6QzWeacolgi5eHFyPVK66/B9eGEJU=;
        b=SdeK5H6Rwa837l9sGD8zDI/ZAsaJbNnfyZp9/AuXrvtG2E7xS4Zm+XMTltHoSXqo7d
         VicEr3fO8WfZhVO6QRpGVfhT5SZkAEgi0sxTC8elzEArzDgvlL0mPdlXQY5rgyIxJvvS
         1E/2R9rjbjuN2U+Er0FPCS3hEmdbLjRzEKvzU8xOuVABu3qu/rGGd1X1bm1Tbdz398/Z
         w+amLzOCJAExzqEIuD51QnzzJaBpfzdqUKWbzfEuS/0jSUFg2SH+9gt4D/yktVb5Sde0
         CTZQyZpUBT4jjxfHFWpoEnckOKaYwddIdiu6Y0wmJK3LyR1zxOgaIVbMCIMTzlk5iLPN
         Pe9g==
X-Gm-Message-State: AGi0PuaxBzbsZRHfeBiwsQJZxK4XcpXtB5y5uKRoK8TuCgQ7BskGgBAR
        271V+mP7TyaLW9ZKLyNNo7XmBQ==
X-Google-Smtp-Source: APiQypLMz6OhjtqiITix26SHaGKIE/PNn8sq0YjVxchoC3Vnmc57okLBEnC2m/RXu2OROr26JHycvw==
X-Received: by 2002:a2e:9ccd:: with SMTP id g13mr6174687ljj.147.1586381648068;
        Wed, 08 Apr 2020 14:34:08 -0700 (PDT)
Received: from localhost.localdomain (212-5-158-138.ip.btc-net.bg. [212.5.158.138])
        by smtp.gmail.com with ESMTPSA id t6sm15746688lfb.55.2020.04.08.14.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 14:34:07 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 5/7] venus: vdec: Mark flushed buffers with error state
Date:   Thu,  9 Apr 2020 00:33:28 +0300
Message-Id: <20200408213330.27665-6-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200408213330.27665-1-stanimir.varbanov@linaro.org>
References: <20200408213330.27665-1-stanimir.varbanov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Once the hfi_session_flush is issued by the vdec all queued
buffers to firmware should be returned to the v4l driver. Some
of those buffers are not processed at the time of flush command,
those buffers has filled len zero (no data). Catch that in
buffer_done callback and mark not filled capture buffers with
error state so that client can discard them.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/vdec.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 7d093accbd59..5823537b3131 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1241,6 +1241,9 @@ static void vdec_buf_done(struct venus_inst *inst, unsigned int buf_type,
 			if (inst->codec_state == VENUS_DEC_STATE_DRAIN)
 				inst->codec_state = VENUS_DEC_STATE_STOPPED;
 		}
+
+		if (!bytesused)
+			state = VB2_BUF_STATE_ERROR;
 	} else {
 		vbuf->sequence = inst->sequence_out++;
 	}
-- 
2.17.1

