Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1DE47125FD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 May 2023 13:52:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243178AbjEZLwI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 May 2023 07:52:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243025AbjEZLwH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 May 2023 07:52:07 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EF35119
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 04:52:05 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-30ab87a1897so364474f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 04:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685101924; x=1687693924;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=94lOxsLEFjNeUwsBx4SaU5IrAwgtw5WWI0FQECJPg/E=;
        b=QR7LsiBBs85Pai0DwtnlFfzUYDkkQShckxJbj9SwuLSADIADR2i/l3xHaMffLEBgTl
         R/k1RCTFIy/O+2RwsmkE3olt01XOPwMziGfMhCe/dpNWkAvP+C01U4YWkzYjnH+m9aUQ
         f1UK1ZLyeilbWyknk6yf94kITZErWvpbTiQmKvOvUjoniQr+HZO2HYNdBdVxQ01u58ob
         jtwXybedyR8jCAkpeP7ZtnAtJeRv7PBVjck+frZlndqi/n7wCpVBXHchYmmIZfIqT2KT
         tsnfKDqmIuOCXMRukK5a5r7NameVHM3ElYDWEqS9sRzbk/hBTAfIoTmPrTmsjLmBXhME
         PxXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685101924; x=1687693924;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=94lOxsLEFjNeUwsBx4SaU5IrAwgtw5WWI0FQECJPg/E=;
        b=jydnPfCAluBdbD3uUnHMH948+lfTV7LbuHBL3nG0KuF49ZVxD+CZGA4TgrQKutezDx
         bk2SnoJrVVswVOZNLc02sPzdoewbSvmMEq5h0674bX3qS9byiyRtKqWhGg2ua/tvNpdA
         s5ihKrajb3Th6SSfdm4nrb/R13ut/LEqborj1VNA2X7Llo2UBtCq7mObMhsWKamSE4F/
         vspa5ZGti1H31zzjTYeNJPCjgSA1ipS0d6+sE+2qFejwlRzm8PPwxZkrA1D9gXj9c5DN
         whp0olLX/nI7guEcZ/Cg+9k73u3O8scNuXZmUDWfGvMRS+qEQg7UIe1W7DNDHIE2m27d
         L85Q==
X-Gm-Message-State: AC+VfDwEfTX/Sozwjn4dsH8xaJTStxoADxRzxYggxso01lNR/pr8V1RM
        6vf2CtX1ypAzAb3s8/eUgoJfMw==
X-Google-Smtp-Source: ACHHUZ6/7YDYu2DrYFOko7cae4ceje+2MQW67ePdGrI9Wdm3un67/ARE6Gcse9uzeVtUdeAVlrmvkA==
X-Received: by 2002:adf:dcc4:0:b0:306:2b5a:d8db with SMTP id x4-20020adfdcc4000000b003062b5ad8dbmr1112003wrm.23.1685101923983;
        Fri, 26 May 2023 04:52:03 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id v15-20020a5d4a4f000000b00307c0afc030sm4920185wrs.4.2023.05.26.04.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 04:52:02 -0700 (PDT)
Date:   Fri, 26 May 2023 14:51:59 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Liu Shixin <liushixin2@huawei.com>,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH v2] drm/msm/dpu: clean up dpu_kms_get_clk_rate() returns
Message-ID: <28644c5e-950e-41cd-8389-67f37b067bdc@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Static analysis tools complain about the -EINVAL error code being
stored in an unsigned variable.  Let's change this to match
the clk_get_rate() function which is type unsigned long and returns
zero on error.

Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: In v1 I change the type to int which was wrong.  This is a different
    approach.  CC the freedreno list this time too.

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 0e7a68714e9e..25e6a15eaf9f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -979,13 +979,13 @@ static int _dpu_kms_mmu_init(struct dpu_kms *dpu_kms)
 	return 0;
 }
 
-u64 dpu_kms_get_clk_rate(struct dpu_kms *dpu_kms, char *clock_name)
+unsigned long dpu_kms_get_clk_rate(struct dpu_kms *dpu_kms, char *clock_name)
 {
 	struct clk *clk;
 
 	clk = msm_clk_bulk_get_clock(dpu_kms->clocks, dpu_kms->num_clocks, clock_name);
 	if (!clk)
-		return -EINVAL;
+		return 0;
 
 	return clk_get_rate(clk);
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index aca39a4689f4..961918e5a5b3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -201,6 +201,6 @@ void dpu_disable_vblank(struct msm_kms *kms, struct drm_crtc *crtc);
  *
  * Return: current clock rate
  */
-u64 dpu_kms_get_clk_rate(struct dpu_kms *dpu_kms, char *clock_name);
+unsigned long dpu_kms_get_clk_rate(struct dpu_kms *dpu_kms, char *clock_name);
 
 #endif /* __dpu_kms_H__ */
-- 
2.39.2

