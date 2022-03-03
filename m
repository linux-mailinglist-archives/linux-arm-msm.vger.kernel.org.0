Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68E8D4CC0BE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Mar 2022 16:07:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234306AbiCCPHk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Mar 2022 10:07:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234318AbiCCPHi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Mar 2022 10:07:38 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 155B2190B42
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Mar 2022 07:06:48 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id 7-20020a05600c228700b00385fd860f49so2582633wmf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Mar 2022 07:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bgKGUZV9Ow5lTkYXyL6TgBgt5kr++QVKt0rnOqG3iUs=;
        b=TWIVaeFLPw3aJf4W+SVAkQayYuhXJUaCDckHLmfl2sqjIvYVf7A5d2VIxXHhUEbctG
         /0CAr73TCB/72Sal9mTRhAM9U9G8N1SnJYOPhYZBW0WFoKlNirW+FCHEHz5490eWcJK/
         fvms0rlfWgRfM/E+E2ImynSk5ar/CoKEqmCzqm68l0T64lMASIOCEDDEbC33Ju9BCn99
         3ouJryNh373bn7HuUoSXXp25UZUl7HEocdQhGvcfbqUrMH1BZQr/7eG5R6jalEeIsyPl
         ZOFk75SPzWG1hf/PJ2fu63xfirLVFvv/hPBxLvIRpOdKBEHX0FvPRY2/5xuW5t5/VeBX
         FZIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bgKGUZV9Ow5lTkYXyL6TgBgt5kr++QVKt0rnOqG3iUs=;
        b=EJ7rtbBkxHeIrHO//8L4Zk9AGGD71+V8JEo8SznCh/okDnuPU8Emljw5D1B5SL4WI1
         c3eoM26TxxvFRsZzZtvSZr1AeDJ1sLDwRxRfZ6C0Nac3q1Rk0wgoeKp++9U1o+9Dg0Ao
         OwUJOqOMYBArNvBxxpQRSiUggEhf6MPDJ6Hz8KVrQLcZaH9t+cdappOOUmyImFpglsL8
         U2Gmnny8XBDTP4FfUyK7jt/gWnR77j+0FgEgKas0c1YGsBOP9um7CnDRiUnGt8eq0qHa
         d5sXhYTxon7NFVZ6C5c+qVWmA30i7kjYoBs9g8NCDBw7thGJvBlXaX8xQxxxPbBQY6Fa
         TwNA==
X-Gm-Message-State: AOAM530qQPpwSrjnti8Af/2cOYisf7EcmrEWP6j2VuGpwgTQ/fKDndbE
        CHePvW/UzztLreBNnBeVuNpK6Q==
X-Google-Smtp-Source: ABdhPJy6646N9PvrrPbXQM8ipQCvbMf0hssT95yZgxvuSuRwDiiqUx2o6vNW51KmBI2R1A0OXZFDDQ==
X-Received: by 2002:a1c:f70a:0:b0:37c:533d:d296 with SMTP id v10-20020a1cf70a000000b0037c533dd296mr4022986wmh.147.1646320007507;
        Thu, 03 Mar 2022 07:06:47 -0800 (PST)
Received: from localhost.localdomain (hst-221-14.medicom.bg. [84.238.221.14])
        by smtp.gmail.com with ESMTPSA id o16-20020a05600c511000b0038141b4a4edsm10757072wms.38.2022.03.03.07.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 07:06:47 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-api@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl, Nicolas Dufresne <nicolas@ndufresne.ca>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v4 6/6] venus: vdec: Use output resolution on reconfigure
Date:   Thu,  3 Mar 2022 17:06:36 +0200
Message-Id: <20220303150636.577063-7-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303150636.577063-1-stanimir.varbanov@linaro.org>
References: <20220303150636.577063-1-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,TVD_PH_BODY_ACCOUNTS_PRE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When recalculate output buffer size we have to take into account
the output resolution from the firmware received during event change
notification.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/vdec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index c8261c6cb0fb..76716ceb3e18 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -701,8 +701,8 @@ static int vdec_output_conf(struct venus_inst *inst)
 	struct venus_core *core = inst->core;
 	struct hfi_enable en = { .enable = 1 };
 	struct hfi_buffer_requirements bufreq;
-	u32 width = inst->out_width;
-	u32 height = inst->out_height;
+	u32 width = inst->width;
+	u32 height = inst->height;
 	u32 out_fmt, out2_fmt;
 	bool ubwc = false;
 	u32 ptype;
-- 
2.25.1

