Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C11D490BE1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jan 2022 16:56:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240723AbiAQP4g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jan 2022 10:56:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240725AbiAQP4d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jan 2022 10:56:33 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69B22C06173E
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jan 2022 07:56:33 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id s6-20020a7bc386000000b0034a89445406so559028wmj.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jan 2022 07:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bgKGUZV9Ow5lTkYXyL6TgBgt5kr++QVKt0rnOqG3iUs=;
        b=hPKEO6RbEwtanUyhH29rvXKo7a1lDWirpsEPcwqroYORwk+SWdfHWYOXwGMT8nZI6y
         1vVWcA91VsvtCa37CzG6TguLIZEU1BCUS9vbcN1YBZ60OgrWdL67IDUi9aoQH63yK3a4
         FX+cYYf3/dryh3+4w8aHRaXMiklOxdeu/wF8cw1FjWUiJtk/dy4jajBQp9F/wvMV3DGj
         M7K5H/o/nQLx3B3Kqb6dEKDvDdanuvbwLm+x0vvxU+FLZ9nRQiW+IzGRQFPZZ0m1FhJC
         hq/nD44am+dUSAAc4k+POFiojdxs9Wgkr5V1AxF1HrQzVebKwZa9MadF+6aatbKZVC8v
         qG2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bgKGUZV9Ow5lTkYXyL6TgBgt5kr++QVKt0rnOqG3iUs=;
        b=XJAKU27s3RhKclMROaBF2ZSg4eva6c8a6sLMedWzwfQVIBtCzFWpGVlteFDHhRzENp
         efCxZXDel/l6LAIYsAQRpgy7mcz9y4DLmya8ik9EfF5ASW4GS+XtBraqScjPPldXXWab
         d8RlfSVd/GNoe3fn8FMrZyjxMtLv7IuRnH53HqerbdYCyCAq1jGUZDO8zOLdMDw4jmzG
         aCCbxVV8Qry1Rz1x5JowHY5gKyC9VSsGVwnGF+J8y+2rRnAF+iG1CkuOtI7y8/n1cNYa
         X9TzAnOCtSBP8E6PIjiGWMY1s9aFe4/hHQ6WUwiqq8is5VUdsdBXAYjdPPtldZVfCQsm
         E+pg==
X-Gm-Message-State: AOAM530rGsg8xFaHMkAKEI3OFzlrSqrjI+HtNTTOF35KCvp+UdRrkWeQ
        9XqZRl2FLeOjH9PT4Bu9MDltHA==
X-Google-Smtp-Source: ABdhPJzr/7XZi6aFKSP/M/VHidCWixLwsc5ZmN0nt/bU2gTkObXMHon4UFpIO4YvoQL8GzsP2aNqSQ==
X-Received: by 2002:a5d:4bd2:: with SMTP id l18mr19767924wrt.445.1642434992091;
        Mon, 17 Jan 2022 07:56:32 -0800 (PST)
Received: from localhost.localdomain (hst-221-60.medicom.bg. [84.238.221.60])
        by smtp.gmail.com with ESMTPSA id i82sm15542900wma.23.2022.01.17.07.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jan 2022 07:56:31 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-api@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v3 6/6] venus: vdec: Use output resolution on reconfigure
Date:   Mon, 17 Jan 2022 17:55:59 +0200
Message-Id: <20220117155559.234026-7-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220117155559.234026-1-stanimir.varbanov@linaro.org>
References: <20220117155559.234026-1-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

