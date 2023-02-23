Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E1936A0831
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Feb 2023 13:07:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232565AbjBWMHn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Feb 2023 07:07:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234127AbjBWMHZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Feb 2023 07:07:25 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D938B72E53
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Feb 2023 04:07:03 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id b13so11569732ljf.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Feb 2023 04:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kU1DhHqljkZnMyZ8L0mfvbfdXEv07yxf2+yc3rbwTBA=;
        b=PYQZM3L2LumSLyw8wcCvEpFKJeoS7thhe/+9xJHxQtEQ4+LobuF5sEKheGM5Bhgv9a
         wbMdwBtRz0l3SS6hA/rhcWf6qMjaYrkGPrV5YgMreAsrt3oE0XzzWYR1PXuoxcyVxJd8
         HHbq8ShTi/kMCc9B8S2NuGipD3j3rBrDAAgh1i52he9oNhp4UcQPk51PF2eUkELBpire
         wwHD5B/5vmh9rwmXtLhJ+NQt+t6Qmh60cnNfjGbtWIVlSV9zw9v4sRZx8SSY/lUTOMrJ
         L3nQnAlfQy1Rfx4iBNKjUxK1tHP++eLtew8HYpB8EImTjZKM+eUdOrgLNxOQl26Fiq0E
         tapg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kU1DhHqljkZnMyZ8L0mfvbfdXEv07yxf2+yc3rbwTBA=;
        b=yU5911qlTbJd+/6xedtZS2emtr5+99Q0qcj3xx0YYzcZh0VpmEcLsMLuRoGKfaK16G
         0//e16cR61WU3xzkmbL5L7rd5SaVYttDnljMuDV9LG0jWF2YsOUJTlnPacWN6/ghmlwM
         tkWeDo4P11ukyGxQOxTQrUYhQ8bH1rs0463lLbu+AsRT9oCoq66h/X9Oe/OYSRQhYmJj
         ssGjkNxJmHTMUu28+oQDE7aYzhRTljlX6Q9Z+1QxJ2bMWkpDNalFC4r5Rmv86HWJF0zn
         Mk4iGoULaYeG9+zZi39WvC0ci4A0KDsYqEHpXEto9RI7GJmYtXyD67urHVeEGgvpzZ37
         z7uw==
X-Gm-Message-State: AO0yUKWyZ2wGXAUl4ksZnLmboRjRKchALwB5M8duv1etwyQvrXyj6f6d
        HChdv60kajyAFGrFkUwO7EosKg==
X-Google-Smtp-Source: AK7set+VgAFb/5QtFiJTtVw7Lkm+EfmrUhUt6x98C5jyNKNo/8vE0EAKnvJZmYI876jSaQ6jtDZ1Uw==
X-Received: by 2002:a05:651c:158c:b0:295:9d2c:c5b5 with SMTP id h12-20020a05651c158c00b002959d2cc5b5mr1217095ljq.12.1677154023428;
        Thu, 23 Feb 2023 04:07:03 -0800 (PST)
Received: from [192.168.1.101] (abxi151.neoplus.adsl.tpnet.pl. [83.9.2.151])
        by smtp.gmail.com with ESMTPSA id h23-20020a2ea497000000b0029599744c02sm414838lji.75.2023.02.23.04.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 04:07:03 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Thu, 23 Feb 2023 13:06:46 +0100
Subject: [PATCH v3 12/15] drm/msm/a6xx: Use "else if" in GPU speedbin rev
 matching
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v3-12-5be55a336819@linaro.org>
References: <20230223-topic-gmuwrapper-v3-0-5be55a336819@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v3-0-5be55a336819@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677154003; l=1434;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=diEdpVPV98iDyAF3qtuCIpbTUiF49iB6aIjsVbWV6Sw=;
 b=ZkCJF5gp9SXq5tTFz0avDKLTNJiqFPEk/lO8lIguPILtj3GJe8qp7Dwgbk2fVNK0eKEvODJDTQ+H
 O5dIDuC/BSYaR/lZLPu4xYN+7gJPClPMteoXtQm13k4Gtpt8w4mQ
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The GPU can only be one at a time. Turn a series of ifs into if +
elseifs to save some CPU cycles.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index eb24be772934..f694acca931c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2222,16 +2222,16 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
 	if (adreno_cmp_rev(ADRENO_REV(6, 1, 8, ANY_ID), rev))
 		val = a618_get_speed_bin(fuse);
 
-	if (adreno_cmp_rev(ADRENO_REV(6, 1, 9, ANY_ID), rev))
+	else if (adreno_cmp_rev(ADRENO_REV(6, 1, 9, ANY_ID), rev))
 		val = a619_get_speed_bin(fuse);
 
-	if (adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), rev))
+	else if (adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), rev))
 		val = adreno_7c3_get_speed_bin(fuse);
 
-	if (adreno_cmp_rev(ADRENO_REV(6, 4, 0, ANY_ID), rev))
+	else if (adreno_cmp_rev(ADRENO_REV(6, 4, 0, ANY_ID), rev))
 		val = a640_get_speed_bin(fuse);
 
-	if (adreno_cmp_rev(ADRENO_REV(6, 5, 0, ANY_ID), rev))
+	else if (adreno_cmp_rev(ADRENO_REV(6, 5, 0, ANY_ID), rev))
 		val = a650_get_speed_bin(fuse);
 
 	if (val == UINT_MAX) {

-- 
2.39.2

