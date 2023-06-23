Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A645173AE61
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jun 2023 03:37:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229685AbjFWBhh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jun 2023 21:37:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229865AbjFWBhg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jun 2023 21:37:36 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E0E32114
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jun 2023 18:37:35 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4f95bf5c493so10810e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jun 2023 18:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687484253; x=1690076253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q4BYdFvvxG+q/HmC6ELTHeulur76vgi4GiOcatnZ7Ts=;
        b=rVMZDIFizYvJqXw8bslYCOuxhjcqXMKNc5rip2nyUCYNrjKtzirS/TPsveCjySQeNP
         x9Hf2LRweSdpMQcpOUZ2cXgXaIYUQCSrNZrf8/Iah0x4jpd2akzxBdx2xLa0LjsKq8O/
         tcfld64UhpyMR13jOW2ccgV0T2VPAmoeCrqkarrUOFMs6iwYT76dBR/4WOXuSUy9JQ+z
         o8w/YeNwDdT5gFoo4OHFlCVu5i+ApDlDNO3Taqii6Hml+vdsTV6IXuwGuMRRZ7Ejvg2L
         9B9kqesJY7PONVtXQ7D+Ur7B6T47VRH8BZa2qeVhglIi1FgUs/e6ZdwP3ucuVpRUUvJ0
         LrHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687484253; x=1690076253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q4BYdFvvxG+q/HmC6ELTHeulur76vgi4GiOcatnZ7Ts=;
        b=k8JddPWN5w1oFUACkGj9JROmH/CbgY0vPD5ZS9xHB8jMi6AMq9tGCcoW0QaaTHHUnx
         OyFMqQkxDTyNEQIh5niCuhJznw9aOcP4SYE+el2FjtkFAFCrzjh3spo60pVsYkADQzVD
         n5kT6KGCdVrM5y/XhLHdio2N32dmgoM4B9gj98M8V8Ysavhf90HxiV2bdstPFI6ddJ9Q
         Oju0Qdj8FrLkQg6YlEu2vEAKVDRyNrf5ryN6e71NhT9LL08T2YtZrQZ/iwGuVD1LlvTN
         hr9PwHplRLt+/VypcQ5gGVFz/z7h1VygH9UvZJKaYfFDz2Z+IgN9+iy/qdRWe+orMP3F
         SSHA==
X-Gm-Message-State: AC+VfDyjdOs4us5+WrnB2gQJR2AowVL2BsWDYTzQK1NMX8wJLXcw5saN
        zV/lQdnBWfxpYJ4p7ua/ClRdKg==
X-Google-Smtp-Source: ACHHUZ6GhFGf2rw6svgbgnjA1AT61SNYoOgZFET7N1jwrRjd6LzVJaVPzMjq77aEfIvAw5/YkTKUow==
X-Received: by 2002:a19:ab12:0:b0:4f8:6aec:1a7b with SMTP id u18-20020a19ab12000000b004f86aec1a7bmr8327312lfe.67.1687484253354;
        Thu, 22 Jun 2023 18:37:33 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id r25-20020ac25a59000000b004f252003071sm1290984lfn.37.2023.06.22.18.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 18:37:32 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 2/2] drm/msm/dpu: fix DSC 1.2 enc subblock length
Date:   Fri, 23 Jun 2023 04:37:31 +0300
Message-Id: <20230623013731.1088007-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623013731.1088007-1-dmitry.baryshkov@linaro.org>
References: <20230623013731.1088007-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Both struct dpu_dsc_sub_blks instances declare enc subblock length to be
0x100, while the actual length is 0x9c (last register having offset 0x98).
Reduce subblock length to remove the empty register space from being
dumped.

Fixes: 0d1b10c63346 ("drm/msm/dpu: add DSC 1.2 hw blocks for relevant chipsets")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 0de507d4d7b7..dd2f89ada043 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -517,12 +517,12 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
  * DSC sub blocks config
  *************************************************************/
 static const struct dpu_dsc_sub_blks dsc_sblk_0 = {
-	.enc = {.base = 0x100, .len = 0x100},
+	.enc = {.base = 0x100, .len = 0x9c},
 	.ctl = {.base = 0xF00, .len = 0x10},
 };
 
 static const struct dpu_dsc_sub_blks dsc_sblk_1 = {
-	.enc = {.base = 0x200, .len = 0x100},
+	.enc = {.base = 0x200, .len = 0x9c},
 	.ctl = {.base = 0xF80, .len = 0x10},
 };
 
-- 
2.39.2

