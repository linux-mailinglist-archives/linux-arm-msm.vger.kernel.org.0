Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2729254C943
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jun 2022 14:57:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345613AbiFOM5I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jun 2022 08:57:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349368AbiFOM5H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jun 2022 08:57:07 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69C9341F8D
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jun 2022 05:57:06 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id l20so6396314lji.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jun 2022 05:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Y3lVlj1KKNHBEo54nqDtt6bYRWwOKPlUpIBRqxeMjlg=;
        b=JgGvBPV9MF2UOBPmhw7nC7nM+kL2Zf582u1CGh9aYJpx0gFohrzbrHh1OwD9JT48Zs
         CPV04XhiIYfUplyDtw911XnlkoNINjsgB1g2Q2CfcjhNt+cczDr9sKp6vJP2oZMTLtHc
         ODneIIB7tWAPqjzD8+ZPCefYS7G7jGAYust0DtmKEb7pnX4ecJpvCP4iatAtvA7GF7ZS
         ssh/3aKeURbysmeaOJRX/5An03NPmAbfjEcXbhPKSOogzcICQClnRySJRkTCCFErq8Xd
         vR+dlfssXm3PdaIQuBaNaOTnrOb6fTtm8zMGjPoQAAjekQ6Zv/AAYWBE9UPx+DrkVvDt
         /KMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y3lVlj1KKNHBEo54nqDtt6bYRWwOKPlUpIBRqxeMjlg=;
        b=VTdXZ1TvH71pWvOVEhfxsOcYvtIm6RqVyXR0yc9wZIN+TcoVnc3auK27lhkCV3Muhe
         zLaNYQng0F+NTN40lCnDSd4LMgkwt0EA5mnFks7uHSWK79/tC9TgkmCbFWyekWjc8u7R
         HT6jzL3NKHJBcrO6kq8MuYAoqfI4/+sJMQJHWWdP3fuenfh5j9TC9UWh3Wzc4BW8Qu91
         ZN4wpP4046IXgC10GMWwjlnHbTE0JjdnQ3IW927T6lIwWwATrt260vhM67eimw29KQx5
         CnzbhBxIUhg+3xP0wLJXIt6rJM/PLDmY0cFtfT6cMBMaU0icuIRH+Kjs93gm9rGINNgB
         KOnQ==
X-Gm-Message-State: AJIora+am4mykp44q3dqEJYvqFJrhecEwbqx+23ejhc8knCcPL/SLFzB
        EbHhSp8ED2qLI1pZO2YfUTT4Iw==
X-Google-Smtp-Source: AGRyM1swLq5IAWEw0pYZnwfi64+I3HJ1EkOBvA8ctl5T7zkei9G/V1FNwfKeiJX28Emsg2SFVbFKAA==
X-Received: by 2002:a2e:2a44:0:b0:256:abe5:275e with SMTP id q65-20020a2e2a44000000b00256abe5275emr5008546ljq.190.1655297824791;
        Wed, 15 Jun 2022 05:57:04 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u13-20020a05651220cd00b0047255d21100sm1798013lfr.47.2022.06.15.05.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 05:57:04 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v3 2/3] drm/msm/dpu: fix error handling around dpu_hw_vbif_init
Date:   Wed, 15 Jun 2022 15:57:02 +0300
Message-Id: <20220615125703.24647-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220615125703.24647-1-dmitry.baryshkov@linaro.org>
References: <20220615125703.24647-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Using IS_ERR_OR_NULL() together with PTR_ERR() is a typical mistake. If
the value is NULL, then the function will return 0 instead of a proper
return code. Moreover dpu_hw_vbif_init() function can not return NULL.
So, replace corresponding IS_ERR_OR_NULL() call with IS_ERR().

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 1255d00c92cf..922725c92898 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1135,10 +1135,8 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 
 		dpu_kms->hw_vbif[vbif_idx] = dpu_hw_vbif_init(vbif_idx,
 				dpu_kms->vbif[vbif_idx], dpu_kms->catalog);
-		if (IS_ERR_OR_NULL(dpu_kms->hw_vbif[vbif_idx])) {
+		if (IS_ERR(dpu_kms->hw_vbif[vbif_idx])) {
 			rc = PTR_ERR(dpu_kms->hw_vbif[vbif_idx]);
-			if (!dpu_kms->hw_vbif[vbif_idx])
-				rc = -EINVAL;
 			DPU_ERROR("failed to init vbif %d: %d\n", vbif_idx, rc);
 			dpu_kms->hw_vbif[vbif_idx] = NULL;
 			goto power_error;
-- 
2.35.1

