Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09798732336
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jun 2023 01:21:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbjFOXV2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jun 2023 19:21:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237408AbjFOXV1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jun 2023 19:21:27 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9AA8297E
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 16:21:24 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4f769c37d26so3435872e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 16:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686871283; x=1689463283;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6a1QMmj81oXqiu8nN+luqgMSndStx7gXh0gMxhBOOQU=;
        b=bnm2oqpcOD3oUBEBY4/+9G1rwJOOkHaxxb/MKoOlS4zT4IbznR7AYXh0nexgmiF0kn
         48BtXsBNuWaURsK/FTEBnbFS0YgaiRKrqmaBxyogMz8Vqk0WWSpXlrhUMJzAJh3oC3Tj
         vNjjaDKIcaNzlJwqrN8gWI9gUOgTdBnErOuzlHmdw9qCH+lf/cpnEhM7byVE5JkW+SPq
         tXtnGauYGKhHfUc86ZTEyectBvgAxdZxR/96uSzNYzH4oIXDOvWDTS/wG+WFbZ6hWqPV
         QY3WJdWZ3wR4xzNi8c71vFo2VIyAmaqcXZikCaT5YhuDWsjTO8T4fmUDnRtE33ihgbng
         YjrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686871283; x=1689463283;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6a1QMmj81oXqiu8nN+luqgMSndStx7gXh0gMxhBOOQU=;
        b=D5qY95dmnccT/tEmnU2SvWLbQeinzVuA1/pF3xuv9RWOpyAIN1snayf5HQ+zBIq3gI
         TIvnCP+r2T3SDEFVHdPWUYxWf8eWoLGjcnUdOGk/w9HnHmZN1+3GUUaX1pppP2RayX9q
         mQ4j/JfZVd4gYer2nNh/4C5WhQll+BhnjEjb2reV46wRAuOwjgCK+rBeWfSGq3q/4qV8
         m7u1mh8KvFlULvdfLWy1iE4wLN0U9pOh/Wrwbdz329G3h9R51AZkiKiYQifQoFRbRAgp
         KaSGoNFnFluNhvbp7OcMJmYSqdJk3707P8FEwSL0hxTwFtVNGBGLdXcQ2EqgkV97kqms
         WBHQ==
X-Gm-Message-State: AC+VfDy5oftZMFLHbTLbP4uuR0JNv/TMGt85E+pAPIEtrCjp3SvqWnkM
        ccmruL00nGZT6L+e71vqG/dpmQ==
X-Google-Smtp-Source: ACHHUZ4YEcCeVa8ugJonftGODrNlpJM5dJgZg94FEbXaKFQpvvxHse3N3U7BrVsY6xiGjq6JVIYaBQ==
X-Received: by 2002:a19:5f15:0:b0:4f3:92a9:aa06 with SMTP id t21-20020a195f15000000b004f392a9aa06mr70560lfb.48.1686871282945;
        Thu, 15 Jun 2023 16:21:22 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id u25-20020a056512041900b004f24ee39661sm2744852lfk.137.2023.06.15.16.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 16:21:22 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 16 Jun 2023 01:20:44 +0200
Subject: [PATCH v9 03/20] drm/msm/adreno: Use adreno_is_revn for A690
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v9-3-890d8f470c8b@linaro.org>
References: <20230223-topic-gmuwrapper-v9-0-890d8f470c8b@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v9-0-890d8f470c8b@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686871276; l=824;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=zkQglxSAYJ6XB8sCRIg7Jh2Ryhgw+vFHA/mfzuc8H1A=;
 b=97c9wz7gJsAfoY56WRmkvESFippkdb670pINXb4BLBXtrNr+y4CB2brw3RN31wQvf5iaVN4AH
 DITwGzQ0X3ZBxOJeLPRD/Q42Dk0XxQhL0jDuD39KPtAKI+sfROBTHBl
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The adreno_is_revn rework came at the same time as A690 introduction
and that resulted in it not covering all cases. Fix it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 9a7626c7ac4d..5a26c8a2de7c 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -286,7 +286,7 @@ static inline int adreno_is_a660(const struct adreno_gpu *gpu)
 
 static inline int adreno_is_a690(const struct adreno_gpu *gpu)
 {
-	return gpu->revn == 690;
+	return adreno_is_revn(gpu, 690);
 };
 
 /* check for a615, a616, a618, a619 or any derivatives */

-- 
2.41.0

