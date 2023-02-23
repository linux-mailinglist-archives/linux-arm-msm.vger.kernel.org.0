Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADF766A0812
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Feb 2023 13:07:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233844AbjBWMHK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Feb 2023 07:07:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234031AbjBWMHF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Feb 2023 07:07:05 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6486054549
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Feb 2023 04:06:56 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id y14so3479722ljq.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Feb 2023 04:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qf5HInxjG90aUJ6hCZyojCQwkimyt7Jgftn2UOCVowY=;
        b=PblEPf/xero1S5B6lz+EkjYQqQGaR3LqwLmbXZLAlwoNHm7ZalfNJZ2fHw1hwcF2VS
         0d1LkH4gUzTpbyC+OYCy/89Uv0rUCxpXqd3xvPQf//Oa02qGtNswmtzmT1pde1TYMaGO
         Y96OQxy/OCX6jNOO6byWEp7EJr5BVZUUjrxa6dBnw7BCCbNg8fM9lEIFIhSDsTRTEGc0
         sz+I7NIVt6lzuUL4MIlHoM1megdE+6rt2soWExAfh3JNU394tu2cW8YUswJ3NGNJDe8L
         8QlgOA3NhMtuNN2mJGkKW2ar89bmgdBwmX5FuLAbNs+nW7PJddScFIkE51xF0P8ZvJa1
         d1Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qf5HInxjG90aUJ6hCZyojCQwkimyt7Jgftn2UOCVowY=;
        b=ClSAbv9M/c9ZerJT/QqZ2nrBAYYQEGVjat4hhYpz8+jjYISL2LSaSeRyvJbIjeqsZZ
         a6mU1bZpIevueXMPorqs5ymd3rIPX0P5qN9tplafLpycVlClo/gyx531Zze5U5I9+Eyk
         sWDoIkjRlmheJCCCcUDTvxTl4eje0jpfLStZ7yihUCOGIKD8IlwyLb8NAOZRCwkhhQHX
         IduPxCp21nZyhk5yxCLsKEY9MoYqC15U7AvmA8mErgGPBFcG4d2IjYNLO/uvQDfjrQXB
         lTL5BIid2xu87ZxUCxy6NjcWlzbnzhZ6mytTHi9N+lVTVOVasQm1eFl5XUCIKyv1VWg0
         SHCw==
X-Gm-Message-State: AO0yUKXcCzNt55DRz+PPPoekZoOVK0WWQAerdcvA6Nsrr5hm1G2Mc17t
        3uNkxBq48lANv8I8BM7VnUWhuw==
X-Google-Smtp-Source: AK7set8LggzN6WNPfBVr0UHvKGJ3hSixlN1HA7HErHjUIxOpbU4YBioGHk+U2bkHICf2lFT3ZDrCQg==
X-Received: by 2002:a05:651c:109:b0:293:3d31:be8 with SMTP id a9-20020a05651c010900b002933d310be8mr4002640ljb.5.1677154015641;
        Thu, 23 Feb 2023 04:06:55 -0800 (PST)
Received: from [192.168.1.101] (abxi151.neoplus.adsl.tpnet.pl. [83.9.2.151])
        by smtp.gmail.com with ESMTPSA id h23-20020a2ea497000000b0029599744c02sm414838lji.75.2023.02.23.04.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 04:06:55 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Thu, 23 Feb 2023 13:06:41 +0100
Subject: [PATCH v3 07/15] drm/msm/adreno: Disable has_cached_coherent in
 GMU wrapper configurations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v3-7-5be55a336819@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677154003; l=1374;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=YYycR3bRJfKGsgGpgNOineZFPyZdnWytf23WfqsrBCk=;
 b=cLHqy1jK95xMtC2H769nOzM6xMSsaFAe/WGrn1IYO7julVHu5tBndfmxPVQn2i+HLOjV8ES2kW4E
 +nErpCukA7P3YzRQOH6OQqE7uQm5Kq+ROEkDvH0NLuZVuEw6UKS8
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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
index 5142a4c72cfc..dfb43741ea32 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -540,7 +540,6 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 		config.rev.minor, config.rev.patchid);
 
 	priv->is_a2xx = config.rev.core == 2;
-	priv->has_cached_coherent = config.rev.core >= 6;
 
 	gpu = info->init(drm);
 	if (IS_ERR(gpu)) {
@@ -552,6 +551,10 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
+	if (config.rev.core >= 6)
+		if (!adreno_has_gmu_wrapper(to_adreno_gpu(gpu)))
+			priv->has_cached_coherent = true;
+
 	return 0;
 }
 

-- 
2.39.2

