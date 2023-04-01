Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18D856D304C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Apr 2023 13:54:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229792AbjDALyz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 1 Apr 2023 07:54:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229659AbjDALyy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 1 Apr 2023 07:54:54 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A1091D864
        for <linux-arm-msm@vger.kernel.org>; Sat,  1 Apr 2023 04:54:53 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id k37so32285005lfv.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Apr 2023 04:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680350091;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ctHnqMHZO0pzp/yb6Z2dEorUTEc6FXrEYWhX8iD6OjI=;
        b=aVGHIcDwAhHEbX8rTDGY5Rb7qR+M8HNPK1MH/vfK/lO55HbWywTqJdioncURcXv74e
         uYUfZxuRkvuzEdG+Y8CDvm9LahtJQPUhWh5yf/HJm6EfXfTLdNdesGBE5Or4MSIVY+xE
         orjq0j64cZMqQrb0MWijoKzQ+mVpMQ4EDd1EL0NcOEm6OgjcOsBEuBe5a3+A8XaXz7Zh
         q7V2dWHDmHmbL29R0wg+Ti3q6nM7B4pV6Z5BYUz0MbC+L8Rp79e7uV7bangEAU3uTgVf
         Qhz0JiukPVUgwnO6F2/EQv5JbXJNJh2pcpZyuERJB7pJNJILCGqm5SyDjg6nJ1JQS18d
         2heA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680350091;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ctHnqMHZO0pzp/yb6Z2dEorUTEc6FXrEYWhX8iD6OjI=;
        b=Vs/T/Ah/QeiVNdXieBpwcLYVDHCSP19Fz+6UWL8sa4TmOeapXEwPxjKnheSofxSNE3
         sWWFWI8ObIghTMNLP0jO4YAtRJ9IaPmX3F0+lXxDAPKUQobAsN54lAMmQntEFbf8qkzf
         vMPBLcJ5OTBkKb0I0+yR77BsKtdzQCcK8jXl7aK9ANLXxpaSx/A062p0OYe1RjUfqI1b
         nzxoKLOHi3YUxWUi8JVtW/CRuz8ESkL/aMCJeD7don8OUYLhPD2zkYiFeMQ6ba1Ch5Wb
         Xlng/W7F6Ha6m+/TFLDcZ3VZW8T2lXRzjNIYa+HDjqf9yeYNukggZZ1RXXdkY42H1GjL
         ezaA==
X-Gm-Message-State: AAQBX9fbYMOh+xXBaS9XDAJRHUtwSksC/9K57Cgz+vMHM4rPhLc3+GRh
        tiAy+fHWeJpJ2eElvN8+F/Ms+g==
X-Google-Smtp-Source: AKy350aIVzUYbMsf+4Ma49meqzWQW8ICcdLO0rTGM74lSEzeeotYTSpy/PnWE+VwXf87vD0pJkvzgA==
X-Received: by 2002:ac2:5972:0:b0:4db:3847:12f0 with SMTP id h18-20020ac25972000000b004db384712f0mr9567501lfp.50.1680350091424;
        Sat, 01 Apr 2023 04:54:51 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
        by smtp.gmail.com with ESMTPSA id w8-20020ac254a8000000b004e83f386878sm786737lfk.153.2023.04.01.04.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Apr 2023 04:54:51 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Sat, 01 Apr 2023 13:54:38 +0200
Subject: [PATCH v6 01/15] drm/msm/adreno: adreno_gpu: Don't set OPP scaling
 clock w/ GMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v6-1-2034115bb60c@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680350084; l=2082;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=uLNnu/k+L1QbWFWkCWE2U/K/JWVJJaw9MSaaSbA5pkE=;
 b=c69tvTZp+eIVVV5kmR4XL9hM2jDTb2CKHbPZwbWjhYEMNXj783BF9pyz0eHWUGzzmv+6khEclsDI
 yYPF1Uk6C03PYld7+6ehn4/5kGtJCEAZhtxsV29rkQPqEQgn8BZv
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

Recently I contributed the switch to OPP API for all Adreno generations.
I did however also skip over the fact that GPUs with a GMU don't specify
a core clock of any kind in the GPU node. While that didn't break
anything, it did introduce unwanted spam in the dmesg:

adreno 5000000.gpu: error -ENOENT: _opp_set_clknames: Couldn't find clock with name: core_clk

Guard the entire logic so that it's not used with GMU-equipped GPUs.

Fixes: 9f251f934012 ("drm/msm/adreno: Use OPP for every GPU generation")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index bb38e728864d..6934cee07d42 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -1074,18 +1074,22 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	u32 speedbin;
 	int ret;
 
-	/*
-	 * This can only be done before devm_pm_opp_of_add_table(), or
-	 * dev_pm_opp_set_config() will WARN_ON()
-	 */
-	if (IS_ERR(devm_clk_get(dev, "core"))) {
+	/* Only handle the core clock when GMU is not in use */
+	if (config->rev.core < 6) {
 		/*
-		 * If "core" is absent, go for the legacy clock name.
-		 * If we got this far in probing, it's a given one of them exists.
+		 * This can only be done before devm_pm_opp_of_add_table(), or
+		 * dev_pm_opp_set_config() will WARN_ON()
 		 */
-		devm_pm_opp_set_clkname(dev, "core_clk");
-	} else
-		devm_pm_opp_set_clkname(dev, "core");
+		if (IS_ERR(devm_clk_get(dev, "core"))) {
+			/*
+			 * If "core" is absent, go for the legacy clock name.
+			 * If we got this far in probing, it's a given one of
+			 * them exists.
+			 */
+			devm_pm_opp_set_clkname(dev, "core_clk");
+		} else
+			devm_pm_opp_set_clkname(dev, "core");
+	}
 
 	adreno_gpu->funcs = funcs;
 	adreno_gpu->info = adreno_info(config->rev);

-- 
2.40.0

