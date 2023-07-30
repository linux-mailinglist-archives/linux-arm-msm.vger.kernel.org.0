Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2001768324
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jul 2023 03:19:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbjG3BT3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Jul 2023 21:19:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229559AbjG3BT2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Jul 2023 21:19:28 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B63AF171F
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jul 2023 18:19:27 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-99bf91956cdso153553966b.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jul 2023 18:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690679966; x=1691284766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U0wpK3A204WX+OKsINI1AYwcUxgviu2sOl+wOj2EUdI=;
        b=aK0f5NWQM6COdeiu7SvyUzC8HCOPFgfS8Ve0Gmj8X2tc2LOYAiu7HmHmPnJHWlQzZD
         V+ec2CgO+zusKNQqdEzadHbCOn0J9Vr8VxR6wvmNvY1Nnl2QBi4CVD8bAZgp0Nr3Jwd0
         SuL6K+IOGMwWI4jT+3N1DGPaNwIqiwH7AqUDiTuoMD7rsmOs4Olni/Xqf9JK4B2nt/gP
         vIHzNif52XgdLSfeJM4z8hk08ULoeEjmB9IjAjvlkI9iMU46H92GoSBH8Qa/ab6IWwHS
         Holw4d8Rnvg5xEzT0opBb+/UfshmikVPaVuf6ZlA8jyIRfM2VkBL+YqeEB6lCTOAV++U
         yaww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690679966; x=1691284766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U0wpK3A204WX+OKsINI1AYwcUxgviu2sOl+wOj2EUdI=;
        b=dmySuXCoqoqForpg5mORlplUqnB/AilunbUn9paNPis90PecdglV+gqD6kRfUgMIdz
         /Vwt9Y6KEb+orjnbEY01LSwCqWc5xPio4aqO+ByIBtEFoRbZwwU66Scmgin8djguzge4
         3Ts9mRk6djUGeIMNE4+KHYQ0QNhWv3G2I7Mxv0oUMFoRXvn+ekZ41ciHfO8gnHjseQ8U
         npjE2MtiWM1sVUNcCfrGAGs8XK7hJll0chzWW7SR/QRx5zOmklU12lokG3L5TEwbEXtS
         B+2JSqiMigNFrvmCDQEDwIpD04bZPtdu7D6zDOdNjMtYF7L/mAXNMZhjMvcIOhy3YBZt
         GQ8g==
X-Gm-Message-State: ABy/qLZVccvFnwIfa+wjGWurdOPny7q0Z/WhP4P5nYN3+8W/fLMkShew
        HZWUE8GeAkLozhlZP44TlJ32XQ==
X-Google-Smtp-Source: APBJJlGRep0ESOlLPd6AHtdKqokWBWL/l7VKefGoEhVF9IspyvdPjQMmbek8jcRmtM3mjTw9InNxNA==
X-Received: by 2002:a17:907:a077:b0:993:d536:3cb8 with SMTP id ia23-20020a170907a07700b00993d5363cb8mr2919701ejc.2.1690679965769;
        Sat, 29 Jul 2023 18:19:25 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id rk21-20020a170907215500b00992ea405a79sm3915835ejb.166.2023.07.29.18.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jul 2023 18:19:25 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH v3 02/13] drm/msm/dpu: remove IS_ERR_OR_NULL for dpu_hw_intr_init() error handling
Date:   Sun, 30 Jul 2023 04:19:09 +0300
Message-Id: <20230730011920.354575-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230730011920.354575-1-dmitry.baryshkov@linaro.org>
References: <20230730011920.354575-1-dmitry.baryshkov@linaro.org>
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
return code. Replace IS_ERR_OR_NULL() with IS_ERR() in the
dpu_hw_intr_init() error check.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 77a79bc42492..3fe43d9be2e5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1136,7 +1136,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	}
 
 	dpu_kms->hw_intr = dpu_hw_intr_init(dpu_kms->mmio, dpu_kms->catalog);
-	if (IS_ERR_OR_NULL(dpu_kms->hw_intr)) {
+	if (IS_ERR(dpu_kms->hw_intr)) {
 		rc = PTR_ERR(dpu_kms->hw_intr);
 		DPU_ERROR("hw_intr init failed: %d\n", rc);
 		dpu_kms->hw_intr = NULL;
-- 
2.39.2

