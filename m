Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19EEB6E7D30
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Apr 2023 16:42:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233364AbjDSOmQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Apr 2023 10:42:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233379AbjDSOmE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Apr 2023 10:42:04 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 437E040FE
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 07:42:00 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id v10so10607949wmn.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 07:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20221208.gappssmtp.com; s=20221208; t=1681915318; x=1684507318;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IVSa3v9KsJg/92VqlTELAV8syGj4pvx3zjA8ESRGdaw=;
        b=uXSH5qJybjPTZGPMwftuPl8wsOD+ae7+MkZoy48K6gde/MsLM7C3IxMRkoquOgGwEj
         said5iJMtae7d0h7mjDwvaLZRyja7XLrcZli50caoBfCpROYKO9ZC4QM+sMACjxjFFuJ
         JQbmkCrnH1RDgN2umeuiRe3M9QmHcyYOZllCLg2a/vDt86gAcKsjivIo7GLZWGgETPNX
         3U42L+bvrWt0mn7hyoKm/RkPCi9OKVmJ/ZGw3nR16KZI+1XMZcEDLaFf1TpTRNbciPur
         Hx+0rMkNmCBlcLgqNLUjbx2k6MUXPmHzdmYpAIJSDBt9liA3lxhiC2D4GXYSyWAiFM+5
         MF8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681915318; x=1684507318;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IVSa3v9KsJg/92VqlTELAV8syGj4pvx3zjA8ESRGdaw=;
        b=SplE6eW3Z4OsmPCKs7rRE4g9k9btHA70oLcaCO0vhFA23fWiSd5Gf7HctEaasXACc9
         cY0n0m1f0avf21KuBIUu9OBQCTHBOWGOiILAVZ1jSfUUbfGkUmtY3jiBuJP3I3/gHsxx
         vlmduaXfBQaaiBlJ+X3GfOWQXUTjbmSka2R4ISx/m5hI3qg9exnIEa7CUTcpin2IWpg2
         6gaSKnezmS0v/Kd2lk7nP6zSCKu1UYAumeMsedhRG7zGB4nHjmSHAVJMMDMpXuawHWtu
         1u+IqR4rYNQOlZGWbOi/EZ4fX0qBPi6YqUi5NVOoURrnNJ4Lap/a+bUg/Q9gu9qmNkm8
         AZCg==
X-Gm-Message-State: AAQBX9fNp8qDS+aXCwC6dqwsZgH7wr5FUfAgRAzIGF+pDRBHo55+wlQw
        AFuD67ZlRu2I4M/h+DvIhJpR
X-Google-Smtp-Source: AKy350bGlmQmMtXg9CozuDIW9XuYDCQgxYNBmMpzExRWiBSBCFebEa48q9C8fW7LnLJHgnHzr4pg/w==
X-Received: by 2002:a1c:ed07:0:b0:3ef:6eeb:c25a with SMTP id l7-20020a1ced07000000b003ef6eebc25amr16057062wmh.6.1681915318699;
        Wed, 19 Apr 2023 07:41:58 -0700 (PDT)
Received: from [127.0.1.1] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id m22-20020a7bcb96000000b003f17131952fsm2388519wmi.29.2023.04.19.07.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 07:41:58 -0700 (PDT)
From:   Arnaud Vrac <avrac@freebox.fr>
Date:   Wed, 19 Apr 2023 16:41:12 +0200
Subject: [PATCH 05/11] drm/msm/dpu: allow using all lm mixer stages
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230419-dpu-tweaks-v1-5-d1bac46db075@freebox.fr>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1211; i=avrac@freebox.fr;
 h=from:subject:message-id; bh=CDBIvOWtwi9aZ7RRIDQqd7SRtuQgF7hezIg0kgVuXhA=;
 b=owEBbQKS/ZANAwAIAXED/9m7NDSrAcsmYgBkP/2dJRmjvyQIHMA35EzFtdfeQCWdKsmoqxMyC
 KhTYcFPJ+OJAjMEAAEIAB0WIQSUwb/ndwkXHdZ/QQZxA//ZuzQ0qwUCZD/9nQAKCRBxA//ZuzQ0
 q0X5D/0aSHCjp0ig81KYbJRs3J6FjRqaFku3XF7PaHPJLMriUUmk19hVcxaYBNWKsKxBq3f3k1+
 SJL2G79OCXfM30ongZgZ57t4BMp/lmOrnOguLlj+6n5RLVJ8KvkGHMVL7pA5o/1YEMP6k1SVH5B
 sFhAc/t99qssE0rjEtIZDSR96Bg2ZRUaWBjBK8ddEnghwXtojkv0Udb7cJywJ25X7T3IH8RpXln
 +fA6sGohtUZ+T/a6ieO6p4Kk3bFUVG2p8MVzCFlMjkjdoWqdNTj5rc6IwNL8UR9R7PZED4bID7G
 ZzsZUtTbj/h13CL7UmnG28jvU2jUsHX5VLJOmrh0RgfKG4Gq2CX0FgEF9ejE1ISmJTxwf4npwK5
 nMYyAVPdje7ca2sAx56wDAfKglSSahk9L7r8NAOb0ArKKe2qN4ZJ/DzmE1tfmFRon+xPuxwYLpj
 c61NMrfMeOM8ykBLgOSOwzUvUhzcrAhBlMDq4C73aZA8QTKD2BRwaqyBVa4IJY2A1MfClyuWInq
 QoVbFCxb71ZE3VHuv3GIyLfNuAWr2JOMj0KLYsragK1vDks+eOOWgdrzPA9FXFEeF7i+g2kZjYl
 L5ZkcSgBt10Jacwq8m6jQSUuwI0Wh6mX+UNFVRQoLxnf/Nf4aJRkFCo6bPMSCbs+GirNvCuC2ou
 7vnXujDg35QAmKQ==
X-Developer-Key: i=avrac@freebox.fr; a=openpgp;
 fpr=6225092072BB58E3CEEC091E75392A176D952DB4
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The max_mixer_blendstages hw catalog property represents the number of
planes that can be blended by the lm mixer, excluding the base stage, so
adjust the check for the number of currently assigned planes accordingly.

Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 148921ed62f85..128ecdc145260 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -882,9 +882,9 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	r_pipe->sspp = NULL;
 
 	pstate->stage = DPU_STAGE_BASE + pstate->base.normalized_zpos;
-	if (pstate->stage >= pdpu->catalog->caps->max_mixer_blendstages) {
-		DPU_ERROR("> %d plane stages assigned\n",
-			  pdpu->catalog->caps->max_mixer_blendstages - DPU_STAGE_0);
+	if (pstate->stage > DPU_STAGE_BASE + pdpu->catalog->caps->max_mixer_blendstages) {
+		DPU_ERROR("> %d plane mixer stages assigned\n",
+			  pdpu->catalog->caps->max_mixer_blendstages);
 		return -EINVAL;
 	}
 

-- 
2.40.0

