Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D6DD25421F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Aug 2020 11:25:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728620AbgH0JZv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Aug 2020 05:25:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728604AbgH0JZX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Aug 2020 05:25:23 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84869C061239
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2020 02:25:22 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id o4so4668402wrn.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2020 02:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=26b9ZpoO3fx+ixXB0E3OlKajS9U73sb4174Ch8Q2TcY=;
        b=ls/E8s1X+JgvkrgngkXoGDYBLCEU/jJEA+wq9vnLD4z1ROImxG9aN0ogvb6jeclWv8
         20L6l07nAoVQutKXQK5AdxqVwGquBLDGDEcD2UQb72SYA0L5tKMe5ISN16rp7hESErlw
         7mohDDpTkLrRBP5qI0XmR8L1zWCkLZVwCTwiKK+ISw5kaXSKFDLPEZMIkt9XjWWMPbJE
         KaTIyiVz33QVxmBIyydw2vT4PojOv+uUJDyJKgvOlZw6MkaS7Fzc/f6DyJewjDwqsmnO
         cHmRKQkLHhzRrmf3ucpffgIf/ON5zzPMKhIom0nb3Qfg8LRAym4Xa/Ju2YprrH8R5K/9
         BmdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=26b9ZpoO3fx+ixXB0E3OlKajS9U73sb4174Ch8Q2TcY=;
        b=aINVGyk4Z+pxXOAa/xUjDdnzdaYwyoDKYbhsQaHdE+AQQRrh76fdJwM46U3WOG3vSP
         flD+d9bRO4UzxiPptVjSSdGfzx8Xww33wpCmVv2bpVeks44luPbtZmx496vqzfClRnwV
         621rJeQyaLWjJKiPfljzPVozBa7LEsKjukOwY+8NkKix+fGRygHPyl8q0cRW7ftZqftz
         0IPn6kh5JmKgdqBItUrWVtkspT5KDQGk6oZ4/PF0xsTAP9XMrGDf2I24byZo/C2QwxIP
         WvIYd0f3NiDGQ452l2bdt/ZK8ttejMVdBNBVKqXGsaqWQ0XDvAnc1yU+fCIjMiZXgAi5
         OyPg==
X-Gm-Message-State: AOAM532ZDRLIiKVqyMm35l8oLo/fhe1e374pc6ZdOpzgwSn7UjJ9aZz9
        wgcZbpfr/nANTpxeR6kG7UGhtA==
X-Google-Smtp-Source: ABdhPJzFMHdT/c1AqvH07HxTW89Bha4zy+AnytM5h4Gqvr+Bahiz1GXddehf41O2/nVDE6cXfI1S8g==
X-Received: by 2002:adf:fb87:: with SMTP id a7mr20766902wrr.390.1598520320904;
        Thu, 27 Aug 2020 02:25:20 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id z203sm4357330wmc.31.2020.08.27.02.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 02:25:20 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Dikshita Agarwal <dikshita@codeaurora.org>,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 12/13] venus: vdec,core: Handle picture structure event
Date:   Thu, 27 Aug 2020 12:24:16 +0300
Message-Id: <20200827092417.16040-13-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200827092417.16040-1-stanimir.varbanov@linaro.org>
References: <20200827092417.16040-1-stanimir.varbanov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Handle progressive/interlaced bitstream event by similar way as
bit depth.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/core.h | 1 +
 drivers/media/platform/qcom/venus/vdec.c | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 7545f004f564..59996e96e1f2 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -371,6 +371,7 @@ struct venus_inst {
 	union hfi_get_property hprop;
 	unsigned int core_acquired: 1;
 	unsigned int bit_depth;
+	unsigned int pic_struct;
 	struct vb2_buffer *last_buf;
 };
 
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index be3bcba2643b..af223da492e6 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1310,6 +1310,9 @@ static void vdec_event_change(struct venus_inst *inst,
 	if (inst->bit_depth != ev_data->bit_depth)
 		inst->bit_depth = ev_data->bit_depth;
 
+	if (inst->pic_struct != ev_data->pic_struct)
+		inst->pic_struct = ev_data->pic_struct;
+
 	dev_dbg(dev, VDBGM "event %s sufficient resources (%ux%u)\n",
 		sufficient ? "" : "not", ev_data->width, ev_data->height);
 
@@ -1486,6 +1489,7 @@ static int vdec_open(struct file *file)
 	inst->clk_data.core_id = VIDC_CORE_ID_DEFAULT;
 	inst->core_acquired = false;
 	inst->bit_depth = VIDC_BITDEPTH_8;
+	inst->pic_struct = HFI_INTERLACE_FRAME_PROGRESSIVE;
 	init_waitqueue_head(&inst->reconf_wait);
 	venus_helper_init_instance(inst);
 
-- 
2.17.1

