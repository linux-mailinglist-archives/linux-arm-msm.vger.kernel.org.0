Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1468D6E7D24
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Apr 2023 16:42:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233431AbjDSOmG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Apr 2023 10:42:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233356AbjDSOmD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Apr 2023 10:42:03 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BA7444B7
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 07:41:59 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-2f4c431f69cso2077244f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 07:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20221208.gappssmtp.com; s=20221208; t=1681915318; x=1684507318;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=836GTkcDRi2+2z0HJ4qWmHnCerN9xvuUtbFVbOWzfY0=;
        b=baHQi3d04LBNOBuAxmRa8A+HZi0CSATDXEXKALd54qg51/ZMXTqiy/deoAlkXb3Ns9
         T+7hwNDw6PJ6AJioYgA3neZjGdb0E+DSnI4WFeL19+FqCrQ2TFEdzEpMqcf9Zuh0+Olb
         bR6FK5w/+QNuNiosi3B6uEqaev9iIsq+N7brfgCjDtj7AK2Q8QDjIPOGPmWzeiFwc1PL
         wBpJqQpYCc1V8qtcAfOEnji2mEh9INPZjNEhYmM/fB3Cix1AhN6yPCbxq7ApO1j04GFt
         rLJrMHNshKmCbGx/jQfiDwTnDNcHtLBcmqDnULs9eYjA6+JImyz4vaF+Mqnn7ApLKuOS
         qoog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681915318; x=1684507318;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=836GTkcDRi2+2z0HJ4qWmHnCerN9xvuUtbFVbOWzfY0=;
        b=V3jJfcOK/9WXZdfkBoKWM+Xom7uFU/Pc3h8ZZWQ0IyHTukAPp2OF6NY/LoinkQTXyU
         860qu+70KQYgyo2vmMe+17kTj9+Akr+mNgr4QWwHZSL4kMpn3zTKNjxHT1Cp0Opb5OaR
         S4gHycsn8irTXLwTYiotIpmnAmjEkjfHhVQuZ9os4jpYlzGIBfdpUs1asbEXiOIBbtub
         eu07UDp50dPen5RxlYNyl6h8dOWP/XomI7+4hm1VDAftDIfHiEQIxl3P7E7AWfU6XqzI
         BI+KwJWo5SZ1I7iepkeMLmIR3gYCNx0OiQt9bVE4aE9xIiLk7HayhnTuat/Be5eXgN8/
         YNhQ==
X-Gm-Message-State: AAQBX9faI5Efoa2nIqYEAY+VO9XOvZqNCSfM+bnocizh4HPZiY2QN9Vn
        5DdVGrjiSLgzOeM9XfRJOGnt
X-Google-Smtp-Source: AKy350Z3Xuz9WufoZqxCoYxbq0Xd6W5KfFcqPnl3JWZpyOuA2xlpK+wbnSrbTuHAqTHqR57P3f6p4g==
X-Received: by 2002:a05:6000:c8:b0:2f8:e652:dc04 with SMTP id q8-20020a05600000c800b002f8e652dc04mr4711567wrx.45.1681915317898;
        Wed, 19 Apr 2023 07:41:57 -0700 (PDT)
Received: from [127.0.1.1] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id m22-20020a7bcb96000000b003f17131952fsm2388519wmi.29.2023.04.19.07.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 07:41:57 -0700 (PDT)
From:   Arnaud Vrac <avrac@freebox.fr>
Date:   Wed, 19 Apr 2023 16:41:10 +0200
Subject: [PATCH 03/11] drm/msm/dpu: use hsync/vsync polarity set by the
 encoder
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230419-dpu-tweaks-v1-3-d1bac46db075@freebox.fr>
References: <20230419-dpu-tweaks-v1-0-d1bac46db075@freebox.fr>
In-Reply-To: <20230419-dpu-tweaks-v1-0-d1bac46db075@freebox.fr>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Arnaud Vrac <avrac@freebox.fr>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2002; i=avrac@freebox.fr;
 h=from:subject:message-id; bh=xpOaiqpNNEOLuHJaoCWSS7YKv71vYiVAS0+zh3bWo5U=;
 b=owEBbQKS/ZANAwAIAXED/9m7NDSrAcsmYgBkP/2aYvMBvH6zGssGiiSjbchn7LFtzFExHjPPk
 Uu7xG862vKJAjMEAAEIAB0WIQSUwb/ndwkXHdZ/QQZxA//ZuzQ0qwUCZD/9mgAKCRBxA//ZuzQ0
 qwsqD/42uGbh/PrZu04lyUsR5hVCa7Xmdo0LCCazacHEC/BYFFlGvWNkhc7PsrezO3YdP7YUkAV
 odihBbhCD/J0kexfj085S9cV1BHejLPWRGLDXOkPAaHolB8DRGM7GfBKbLkvaQE6di3lIA6lJDa
 M/27C2U9iKWSa8VxVhARC5feO5zeTnJJ2khmElSSMb+ycMbEX9a4N+nRvfKN9eSW65dqzzOWR15
 Ti9QXnMq/8FsyVWim/cQvMa8pcZAd9bQvuiJveRI4qoUuil0WTmIFhrwGs+J5PSG0j85xi2LAhu
 UdgEhL4yD8b/DavQRt8bE8JCT8TlSkCv0hLJGBtmHhxKVHqLZVDpO7Xbq8JnX4hVAWQDEVFFOeb
 aU3vXMTGEpZ2/g11Bvn3aKpqdgeOXCeuvWHaBPK5K/gx3MuE/kRlhEhl30NFeQH6jyNbkNyy0xZ
 q9sGqtnNHTLzsWoxxgc16ztUfL9hpLW51GsWAR1vSqcNEfYNnZjBEeaFb5uFlouYRWNFZxuayDJ
 r4PfnBf6O1hgZ63ok55tnZAmvqXF7/mxr91e5diSyx4BTnlxuW0joKDZh11kkLcGacGdj431Tdw
 AxpGO6avO+otXYsvvZ0/H7YXwSJhlklY5/f+UMZSM6udGdxoqGVGdCpwjc3NKdsTtHizBlKtDvj
 9F8RSxj5MR9u+LA==
X-Developer-Key: i=avrac@freebox.fr; a=openpgp;
 fpr=6225092072BB58E3CEEC091E75392A176D952DB4
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Do not override the hsync/vsync polarity passed by the encoder when
setting up intf timings. The same logic was used in both the encoder and
intf code to set the DP and DSI polarities, so those interfaces are not
impacted. However for HDMI, the polarities were overriden to static
values based on the vertical resolution, instead of using the actual
mode polarities.

Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 84ee2efa9c664..9f05417eb1213 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -104,7 +104,7 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
 	u32 active_h_start, active_h_end;
 	u32 active_v_start, active_v_end;
 	u32 active_hctl, display_hctl, hsync_ctl;
-	u32 polarity_ctl, den_polarity, hsync_polarity, vsync_polarity;
+	u32 polarity_ctl, den_polarity;
 	u32 panel_format;
 	u32 intf_cfg, intf_cfg2 = 0;
 	u32 display_data_hctl = 0, active_data_hctl = 0;
@@ -191,19 +191,9 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
 	}
 
 	den_polarity = 0;
-	if (ctx->cap->type == INTF_HDMI) {
-		hsync_polarity = p->yres >= 720 ? 0 : 1;
-		vsync_polarity = p->yres >= 720 ? 0 : 1;
-	} else if (ctx->cap->type == INTF_DP) {
-		hsync_polarity = p->hsync_polarity;
-		vsync_polarity = p->vsync_polarity;
-	} else {
-		hsync_polarity = 0;
-		vsync_polarity = 0;
-	}
 	polarity_ctl = (den_polarity << 2) | /*  DEN Polarity  */
-		(vsync_polarity << 1) | /* VSYNC Polarity */
-		(hsync_polarity << 0);  /* HSYNC Polarity */
+		(p->vsync_polarity << 1) | /* VSYNC Polarity */
+		(p->hsync_polarity << 0);  /* HSYNC Polarity */
 
 	if (!DPU_FORMAT_IS_YUV(fmt))
 		panel_format = (fmt->bits[C0_G_Y] |

-- 
2.40.0

