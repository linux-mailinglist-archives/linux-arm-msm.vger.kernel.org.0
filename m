Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 707226D3077
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Apr 2023 13:55:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230081AbjDALzv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 1 Apr 2023 07:55:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229947AbjDALza (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 1 Apr 2023 07:55:30 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 397B924AD2
        for <linux-arm-msm@vger.kernel.org>; Sat,  1 Apr 2023 04:55:13 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id g19so19114021lfr.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Apr 2023 04:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680350111;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ifhrbShC7+juhdrM7tSPSmIe9BvFlsZ4IeJyZGUcR1w=;
        b=t3FWIRjFKkx2JGZv4wZqYWLGC53QNHQPYM2XqLu8rcG+v808heG6inHMxujip9i9TK
         NGy6evo9wHZqV3omXLiTO5MyoWY69eKT81cPD5Fg8gXUpF8NdBfqKO3aTwXmpnWp+T3I
         nFUYtBCqZdcDDGRek47/cv0cpCvNws0xMPWt2GPL2yyQ0IMz8w7z9k6U8C4xe1FkeSu6
         t/i1veutCJuhgmxKl/vx7k8snA3zcqx7E1zNbbJ0GLFc1ISrX/Ks+8Hrmcm1sGR5uBHa
         loS3v8zY6ZZOgkjdKJKmQkU0UeVE2MkcCDnxV95qFsaeyOYm4DsNrhELa9FDoD/Oq5dK
         LKkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680350111;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ifhrbShC7+juhdrM7tSPSmIe9BvFlsZ4IeJyZGUcR1w=;
        b=y9PpN6FcuyY3XBSKluJLN5ST6Fdoq5TgIIK5shWNT4KUuwNNX3ST2BOHohkmOcg7rK
         x3DmZt7UUC0mwlcLj9dcyWi0IVFs42t6+9Ouy+fvGAdYgTJzB0YSCzcM4pWU4VG1N+yj
         j1sNiG4X1wgw7AibTXWd0F5V3Hg/XhQMEdGckmUeaUylTYl+LKxzqZW0eARedYzwQbMT
         w2OAwM7dhHe4b/SxkS8Aup0o2LUvaVAe/9D69ADi/og49VEC36vEesTJM8DaigrH6fMU
         y8fKG2UQ2/2pxB/iQ5jKFdbKfEpwGISKywwjY0kYrNy0euMxf0dQhASfP/90j4Aaktww
         P3EQ==
X-Gm-Message-State: AAQBX9cDrRlWPMYcLv70JU6lRKgZqfWALVZbpanrgPhFuCMrfunk+Sg6
        Al2YoOZcTG/SPz97ZaBhuL2qug==
X-Google-Smtp-Source: AKy350a11lcjS0h/eZP2Fw6OpWyaX8WRZkquSON+2y9iqlGDGCqkSRGCzQDR1b65rDEhnI1DHsO9Iw==
X-Received: by 2002:ac2:5482:0:b0:4b5:8f03:a2bc with SMTP id t2-20020ac25482000000b004b58f03a2bcmr8649139lfk.9.1680350111509;
        Sat, 01 Apr 2023 04:55:11 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
        by smtp.gmail.com with ESMTPSA id w8-20020ac254a8000000b004e83f386878sm786737lfk.153.2023.04.01.04.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Apr 2023 04:55:11 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Sat, 01 Apr 2023 13:54:45 +0200
Subject: [PATCH v6 08/15] drm/msm/adreno: Disable has_cached_coherent in
 GMU wrapper configurations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v6-8-2034115bb60c@linaro.org>
References: <20230223-topic-gmuwrapper-v6-0-2034115bb60c@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v6-0-2034115bb60c@linaro.org>
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
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680350084; l=1374;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Uy9xduAlMWK2dLdqx78UuoS6GjnaBPbaxTCDUXSqNNk=;
 b=WbgMypqr8VbfjFpGDgyRqDk0vGFsrUY/gNWlfqaZQ2JlGKoTnt8e9m+Zkw6fJpFD0wul+XOiavpo
 yz5f2dmyAjAUqze+TnpY+c6yeGpi9YcCLzUgTP7glEDXgHbuUsO3
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

A610 and A619_holi don't support the feature. Disable it to make the GPU stop
crashing after almost each and every submission - the received data on
the GPU end was simply incomplete in garbled, resulting in almost nothing
being executed properly. Extend the disablement to adreno_has_gmu_wrapper,
as none of the GMU wrapper Adrenos that don't support yet seem to feature it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 4d1448714285..4705ce3eb95e 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -551,7 +551,6 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 		config.rev.minor, config.rev.patchid);
 
 	priv->is_a2xx = config.rev.core == 2;
-	priv->has_cached_coherent = config.rev.core >= 6;
 
 	gpu = info->init(drm);
 	if (IS_ERR(gpu)) {
@@ -563,6 +562,10 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
+	if (config.rev.core >= 6)
+		if (!adreno_has_gmu_wrapper(to_adreno_gpu(gpu)))
+			priv->has_cached_coherent = true;
+
 	return 0;
 }
 

-- 
2.40.0

