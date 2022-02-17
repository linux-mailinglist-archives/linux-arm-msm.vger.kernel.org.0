Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A426C4B96D3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Feb 2022 04:45:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232910AbiBQDpW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Feb 2022 22:45:22 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232952AbiBQDpV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Feb 2022 22:45:21 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 713D529C139
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 19:45:07 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id b20so6335713ljf.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 19:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=U/YRcQBG+8CmKlfSNRGmKhbYNFYa0GOg31OmQ3eN8P4=;
        b=JlqKAQ6AUL8g9W9NO3LJ6vb9NdsRoKYoAyf63GcrRH3GnZy7hPS068H52YdeHrYmAF
         XaqrMBVvCQf9LbU+0j4n+SaekNIjKsNx8bnk+TE+3MHPTGX0RH0Nt3zspYARomIBe0Nw
         BGBQZWKMKZjfR4xuvrbUe+oz9UT3DkI2rzP//GhSSSRwT7KM8Ou8uwBy6z88/v4cZZUa
         rBMtfeSJ95LVdF+z3JIVTptiaj1ms5gKUbkLHE/84CnxOSbJlboEkjLamKSKGLX81WFo
         ms1Ytw7jPbIEygTsEyQSiHQymiR0OpnyJtCoIhGuVRF+Bo+vmtgUhVA147ns8LP6arHw
         6amA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U/YRcQBG+8CmKlfSNRGmKhbYNFYa0GOg31OmQ3eN8P4=;
        b=XTrwuZWojMP9d8jFH8hcYoLnxIdv9IawLWZkpJHg3AD3E3fqO9NFfPqu/7w6EVwUZC
         26VtBkxeGJ+UVpZ1l+f+lgsSza0/YZtI1lBeLhQwQAbXdTgESSOeXGP193yOGm7n+Y3o
         oIr0n/Jcgzkmkph+EmLi+WjXBkSoAKsjXvP5TqJyTuEAXB5CmCiSnBLHVJ/tL+SHHlJ1
         5nt3hnMXICxDCI1KrpMnVSKX1VGnc78ey3eRt16tRIA8t/mJB1jb/3yilYQIYctzG9VY
         I7E1tJT472gVOHwTYqkWT1UkH6dguLwd004k3b8/+ed6GvhLCSuNGf9oKLi5XlBCvfm2
         Z1zw==
X-Gm-Message-State: AOAM533nBDEF5Y5IKPZc5Tqek8k36GxywrzQ/C1qTZS4xiU+EBXhEm8T
        5CQd8O5RjBnlvDzVIP0oPRP75w==
X-Google-Smtp-Source: ABdhPJxtd7V+S/bnD3Oc615ZGRXme/XvFNSXsqKMmYXNLWx/nQ0uqusSKV6JWhSTpFwOb2DxKZhZgg==
X-Received: by 2002:a2e:87d3:0:b0:244:c1ab:91ae with SMTP id v19-20020a2e87d3000000b00244c1ab91aemr820892ljj.277.1645069504092;
        Wed, 16 Feb 2022 19:45:04 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c25sm822268lfc.22.2022.02.16.19.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 19:45:03 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 2/3] drm/msm/dpu: fix error handling around dpu_hw_vbif_init
Date:   Thu, 17 Feb 2022 06:45:01 +0300
Message-Id: <20220217034502.464312-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220217034502.464312-1-dmitry.baryshkov@linaro.org>
References: <20220217034502.464312-1-dmitry.baryshkov@linaro.org>
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 81a35c8d62e7..f8f1bf3b511d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1102,10 +1102,8 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 
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
2.34.1

