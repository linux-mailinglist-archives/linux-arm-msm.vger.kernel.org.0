Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61C856CF65A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 00:25:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229869AbjC2WZH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Mar 2023 18:25:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230004AbjC2WZF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Mar 2023 18:25:05 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70DC51BF0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Mar 2023 15:25:04 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id h25so22133474lfv.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Mar 2023 15:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680128702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XvOicm7FSZsvoLM+I7eZyYxaJPBR6NHXblQQPNco0kQ=;
        b=wMNTntBtw3JbTujEgRlvIK1ugsDeViUl3qgk6tzLyCNzeOSCIpPdJlk4I4ZNDMthb/
         AOX3vvAr8/YUaGuvgou1JQShkvM+HTeh9Dlk5BK99T5N5VIENL0fP9By1KEgWziqA4N7
         JzOSptsOGmJwUe+TJyqdNisp45Z9JFoy8z0Vn6BhsVitIrn2STBQY8Rq93pOEjuJo/Mi
         MwxqYbpUW1uhvQ1a5R7vzHPBs0M49qyPDg0l8xTcotdc/jupwSQuhWwVs+POh5EOJYbP
         /TRYVXC7ToT1tP301fMTyzCk7qgy6AFW1JNDonwO9hyngBswFUUaooNEich/MQxDijYx
         v5kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680128702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XvOicm7FSZsvoLM+I7eZyYxaJPBR6NHXblQQPNco0kQ=;
        b=fu/t0Tfo4HyMs50TmI4ut5FnvWepgG1w2GZUd3DwI+8uZTH1UNWmQJWay+qP7xKi4I
         nSVMRhgIzgk5Rnn4RPop7TW4k2f8R3xb+PYVi2U5pjZMSdswiSltpEf5anGIWR4eeApm
         5BOsKFehtB6X+fEsWWiL18VI1pXQRZZYcwF4oLTMcnr0H7gAFAMT2U7I55laCTfJwgqv
         ze8EiMf4WvRxckvf40mZDDpWBUrpTV5sLnzJxgM225I3677oRgjTc8Rt5Abe7W+tmS+r
         PyhfRyjRNvSjytzl22oJgSNXsTRaQbnddUGyj4nkjWDXTz/+CHrEYELnjINUfpQdfQkn
         lE+Q==
X-Gm-Message-State: AAQBX9ctFzO6gHdxggSnZf6auvwDNXTIqYZXHBjtKEZwo1JlBT6B4rUG
        Spg0jx/+xFw6f754oS8t0MN5jA==
X-Google-Smtp-Source: AKy350Yafz+44RhjayuM2tQER3bgUHCtIb4t+86yGSe52bNOnaGogVbbHxOlWGD5ykjwJGQWJoEEYg==
X-Received: by 2002:ac2:46d4:0:b0:4e8:200:132b with SMTP id p20-20020ac246d4000000b004e80200132bmr6084675lfo.62.1680128702692;
        Wed, 29 Mar 2023 15:25:02 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id y26-20020ac255ba000000b004e9b307d2c8sm4724226lfg.238.2023.03.29.15.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 15:25:02 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [RFC PATCH 2/3] drm/msm/a5xx: scale MX domain following the frequncy changes
Date:   Thu, 30 Mar 2023 01:24:59 +0300
Message-Id: <20230329222500.1131836-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230329222500.1131836-1-dmitry.baryshkov@linaro.org>
References: <20230329222500.1131836-1-dmitry.baryshkov@linaro.org>
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

For some a5xx Adrenos we have to specify both GX and MX power domains.
GX is used to power up the GPU clocks and logic. MX is used for scaling
voltage of memory cells.

In case the DT specifies several (GX, MX) power domains, none will be
bound by the core. We have to manage GX manually. Also make sure that
the MX domain is resumed and scaled to the proper performance state
following the desired frequency.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 52 +++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a5xx_gpu.h |  3 ++
 2 files changed, 55 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 0372f8908202..36b3d11dd5b0 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -8,6 +8,7 @@
 #include <linux/firmware/qcom/qcom_scm.h>
 #include <linux/pm_opp.h>
 #include <linux/nvmem-consumer.h>
+#include <linux/pm_domain.h>
 #include <linux/slab.h>
 #include "msm_gem.h"
 #include "msm_mmu.h"
@@ -1053,6 +1054,13 @@ static void a5xx_destroy(struct msm_gpu *gpu)
 	}
 
 	adreno_gpu_cleanup(adreno_gpu);
+
+	if (a5xx_gpu->mx_link)
+		device_link_del(a5xx_gpu->mx_link);
+
+	if (a5xx_gpu->gxpd)
+		dev_pm_domain_detach(a5xx_gpu->gxpd, true);
+
 	kfree(a5xx_gpu);
 }
 
@@ -1339,8 +1347,15 @@ static void a5xx_dump(struct msm_gpu *gpu)
 static int a5xx_pm_resume(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a5xx_gpu *a5xx_gpu = to_a5xx_gpu(adreno_gpu);
 	int ret;
 
+	if (a5xx_gpu->gxpd) {
+		ret = pm_runtime_resume_and_get(a5xx_gpu->gxpd);
+		if (ret < 0)
+			return ret;
+	}
+
 	/* Turn on the core power */
 	ret = msm_gpu_pm_resume(gpu);
 	if (ret)
@@ -1414,6 +1429,9 @@ static int a5xx_pm_suspend(struct msm_gpu *gpu)
 	if (ret)
 		return ret;
 
+	if (a5xx_gpu->gxpd)
+		pm_runtime_put(a5xx_gpu->gxpd);
+
 	if (a5xx_gpu->has_whereami)
 		for (i = 0; i < gpu->nr_rings; i++)
 			a5xx_gpu->shadow[i] = 0;
@@ -1762,6 +1780,40 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 
 	a5xx_gpu->lm_leakage = 0x4E001A;
 
+	/*
+	 * If the device has several power domain (gx and mx), none are attached by the core.
+	 */
+	if (!pdev->dev.pm_domain) {
+		struct device **opp_virt_dev;
+		struct device *pd;
+
+		/* FIXME: add cpr once it is supported */
+		static const char *genpd_names[] = { "mx", NULL };
+
+		pd = dev_pm_domain_attach_by_name(&pdev->dev, "gx");
+		if (IS_ERR(pd))
+			return ERR_CAST(pd);
+
+		/* GX is required for GPU to function */
+		if (pd == NULL)
+			return ERR_PTR(-EINVAL);
+
+		a5xx_gpu->gxpd = pd;
+
+		ret = devm_pm_opp_attach_genpd(&pdev->dev, genpd_names, &opp_virt_dev);
+		if (ret) {
+			dev_pm_domain_detach(a5xx_gpu->gxpd, true);
+			return ERR_PTR(ret);
+		}
+
+		a5xx_gpu->mx_link = device_link_add(&pdev->dev, opp_virt_dev[0],
+						    DL_FLAG_RPM_ACTIVE |
+						    DL_FLAG_PM_RUNTIME |
+						    DL_FLAG_STATELESS);
+		if (!a5xx_gpu->mx_link)
+			return ERR_PTR(-ENODEV);
+	}
+
 	check_speed_bin(&pdev->dev);
 
 	nr_rings = 4;
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.h b/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
index c7187bcc5e90..36e910397c14 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
@@ -44,6 +44,9 @@ struct a5xx_gpu {
 
 	/* True if the microcode supports the WHERE_AM_I opcode */
 	bool has_whereami;
+
+	struct device *gxpd;
+	struct device_link *mx_link;
 };
 
 #define to_a5xx_gpu(x) container_of(x, struct a5xx_gpu, base)
-- 
2.39.2

