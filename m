Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B2326D1150
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 23:54:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230207AbjC3VyV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 17:54:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230198AbjC3VyS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 17:54:18 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68DBC11144
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 14:54:16 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id q16so26366846lfe.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 14:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680213256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ypvks8Nd4YCSiniAO1T/BNftQnJ4Oqy5AhQ1SVvGOLw=;
        b=PibJy4N3FtioWzHiCyjezAzgljLOv5t4TFWDA0/LgVT0d0yzX+XWdGJwybKig2BmzD
         Uq/W5edzqUIYH/nGMn+0Iv3lO4IRpT5aBAcZER21cTtBpkgcUcToLx8X1Q+v6+0kRka5
         qUcBduCpDFaRB1vsP8/BB36K7Wddyk8L4SFWSuISMifs1IZRpPuFaPGTfSMvG7UpWoxp
         BYgWeDEra3xi9PbiOE5Hv4rLkz9gB4FEXlP0L2ij0RIHrZ+61gO95ZykFuA096pxzu5I
         OmmjF2ZFXLOIPIPc81RU9OSRM4RaiK719PtgBCqOP7IJML5r/QJUa9CnSZp9ij17LIgc
         +qCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680213256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ypvks8Nd4YCSiniAO1T/BNftQnJ4Oqy5AhQ1SVvGOLw=;
        b=1F4a760rQyytYrxbnV0GqitycPb6HhhemO+knh4ip5kvYm4owF8n0TTriD7g0oKZy4
         gaqc/b+6Q1rODzkDNatYuGa1+duJilW/y2tVKKx1pV3rTenVf6s0fiC+qJWiYiltfjjt
         GTk6d5t4S/wmHhZDRxZKv9rK4KDGCgjRCgEYIdyH5XvZ+/RZSRC4ZdKViOiyVVFQTAdz
         UKQZ/bNn3A0YnYqaFIWZyNlPrd69kPd5Td+Drzhtzlvyytt/ZSgMde3On26madt+A7E0
         QMM1UwYSV9bOtu+6BD6No8qtSgBzzG1get9z1mbvzmIMuMY+8s+Nb3U7ZLMl+J1+/rsH
         vIkA==
X-Gm-Message-State: AAQBX9eocpD9aEvpM8YrN90p6rXrwazhtnAGOgS9+rS8iz4ZVOGVaFNr
        HJHfyhXnOaLHSFF8kXtk4d2lmw==
X-Google-Smtp-Source: AKy350Yq32N51YLheHbnkMme9F4sPIgraKrGm4BzCMNAwnMn4l+qor7FwY1Jz3UVYuIz6Op4kwQQ6Q==
X-Received: by 2002:ac2:4287:0:b0:4ea:c730:aabe with SMTP id m7-20020ac24287000000b004eac730aabemr6359527lfh.20.1680213255994;
        Thu, 30 Mar 2023 14:54:15 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f16-20020a056512093000b004cc8207741fsm104574lft.93.2023.03.30.14.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 14:54:15 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v3 28/38] drm/msm/dpu: enable DSPP on sc8180x
Date:   Fri, 31 Mar 2023 00:53:14 +0300
Message-Id: <20230330215324.1853304-29-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230330215324.1853304-1-dmitry.baryshkov@linaro.org>
References: <20230330215324.1853304-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable DSPP blocks on sc8180x platform, basing on the vendor dtsi.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index 92a8e474e380..bbdfec415185 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -90,6 +90,8 @@ static const struct dpu_mdss_cfg sc8180x_dpu_cfg = {
 	.sspp = sm8150_sspp,
 	.mixer_count = ARRAY_SIZE(sm8150_lm),
 	.mixer = sm8150_lm,
+	.dspp_count = ARRAY_SIZE(sm8150_dspp),
+	.dspp = sm8150_dspp,
 	.pingpong_count = ARRAY_SIZE(sm8150_pp),
 	.pingpong = sm8150_pp,
 	.merge_3d_count = ARRAY_SIZE(sm8150_merge_3d),
-- 
2.39.2

