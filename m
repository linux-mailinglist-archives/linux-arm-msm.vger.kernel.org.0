Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C5A3692D0A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Feb 2023 03:11:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229612AbjBKCLl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Feb 2023 21:11:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbjBKCLk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Feb 2023 21:11:40 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B70D873942
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 18:11:39 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id lu11so20241743ejb.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 18:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5i21R7JP0H/rN6EdxfT/uxDsuzXK7e5UT/U0od2qKqs=;
        b=VcxpmFT3ncqU4l7V8bMvWZWCyZTg/2jmicRzkBwz5KKl7ATPpZGjNX5ufv5sB5OO/I
         memsWNODlS4RUfZo1DBPnGACaDYakJ5DPWyorqCXFNYapvKx7xiZyDRI4eZLbVYc8lca
         Mz4ND58F3Cz+B9alpX1Euv08p95+GfjbpExgyKrCj5puLa7GoJLSfLxoONI4j5figgCn
         R3HiSzGho1T7Vc97pwBaUmwnBTIBllWo6j9c/1crR+sRTGPgHfv50dq6aGN2wS3xA1AB
         SVmxaRtn44iWfaDWf2vFfbOFPWBg0YHvvWfhI8ObQS0KABd63wviweJ1yq7hHg9i7cis
         MnRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5i21R7JP0H/rN6EdxfT/uxDsuzXK7e5UT/U0od2qKqs=;
        b=nQynTjlVPeqynQYW2hW6YEApIZ6tMdiz6ZhT/5kRDDduB0SHXXzGuXKMtzGcUYZ1hn
         2iZhhSzjFkhNOAfV8Q3kvjZb4oxxmtIj4CVAi4rS/UoCgkSqM/IzA/MknK+D65xBdp4Z
         i9XpEAGT1hQFPfDnKYEkewV7JGx5ynFjOFT+BeP16eoIpVr/uHM5zw0ccOC/Ik9H+IPb
         RcmZDbl+fgKmbHns8bMfZFlKDuY9X3++2n5rqxSxWlTQug7c7qcYSXU3HJXbSDmRB+F/
         vcbMeGqXIP12WBXrB3rOaeg0gRMb7MhK53uOdNXHhLmN3M1pgxJQT35UQuZXzxOl5fwq
         pJaw==
X-Gm-Message-State: AO0yUKUEoCDtZAbiz8MAOFMBKKXfi9WnHQwNazvwRnj8Y7fEX63T1Z25
        a9SjvGezDna/GTObOSlD6P6UuQ==
X-Google-Smtp-Source: AK7set8NaGDhwqw/BOpzA53mP5VOJ/LU28ODqa+tyRe5Cn+oWJFuNChqsSO0x4mCxNwaDMaVFYUwXw==
X-Received: by 2002:a17:906:a242:b0:878:734d:1d87 with SMTP id bi2-20020a170906a24200b00878734d1d87mr19306532ejb.47.1676081498346;
        Fri, 10 Feb 2023 18:11:38 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id e20-20020a170906c01400b008ae3324c8adsm3180831ejz.214.2023.02.10.18.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 18:11:38 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 41/43] drm/msm/dpu: drop DPU_DIM_LAYER from MIXER_MSM8998_MASK
Date:   Sat, 11 Feb 2023 04:10:51 +0200
Message-Id: <20230211021053.1078648-42-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
References: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The msm8998 doesn't seem to support DIM_LAYER, so drop it from
the supported features mask.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 8189bbb88b10..23fe5f1ce92d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -50,7 +50,7 @@
 	(DMA_DPU_4_MASK | BIT(DPU_SSPP_CURSOR))
 
 #define MIXER_MSM8998_MASK \
-	(BIT(DPU_MIXER_SOURCESPLIT) | BIT(DPU_DIM_LAYER))
+	(BIT(DPU_MIXER_SOURCESPLIT))
 
 #define MIXER_SDM845_MASK \
 	(BIT(DPU_MIXER_SOURCESPLIT) | BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
-- 
2.39.1

