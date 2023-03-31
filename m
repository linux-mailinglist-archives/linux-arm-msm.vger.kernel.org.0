Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36A186D14BE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Mar 2023 03:15:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbjCaBPC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 21:15:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbjCaBPA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 21:15:00 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFA05D306
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 18:14:58 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id by14so2307791ljb.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 18:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680225297;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p4o6oBmHnEhp5oKh/mixd7WOHYgf5ln4PuMXkA7t4Yg=;
        b=ilIG2XmxB/j7n7ATeF8zJTqz4zU2CrZAhUg7m4fK8Ct9T3JCf+UojRN2STUA6fj/N8
         e/MkIBwAqqo6YeNmch6+KcXlbjkcMAUlfRa7Xldldwc8qjrMo5N6relst0oYtxTgE2Jk
         QTkBQuHpXE/gWpk6a9g+S85Dybzo2/bHMMSUMJIdIGTEzZ7XzGN2Vta/lJAQHImrjJhl
         JFTY+vhLgHk578tIAu3AAKZnL/UnaAcT770w/MeJW706mdvvAWDujHuW4esZOhIxHUsQ
         8xqhryyHkDC92IcC+aQ/sbPw3jEVGQzL4EJ9NK+PHwlmSVNlNqlKVNK3JErawbNLRb8n
         OS9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680225297;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p4o6oBmHnEhp5oKh/mixd7WOHYgf5ln4PuMXkA7t4Yg=;
        b=xL/Uhn23FBQTr466HVjDGweEYSv6Ws4z6ODJ4/8m/6Cc3ww4HFJ1fG8F+iXWkNbfL5
         7pGOMuz844FzgUIBFF4VJanx6USpkNjn3asawZTDwKxAb+HgAuDwxho4VKNx/zqIQsIY
         oUjdohdXtcXy37ab8pT3IT12n9WGdknZ8YoTFwuxE/KNnJBvEXe3fcVcFKqFqkcPp+35
         kiQ1+hZKLPrzYokucintHqbFt2nE6OM9Vwwz5WuKdxBkfvrTtzUJ/87ePJLzE0Y6Ih5C
         jSvLScb7Xv3+hY7OYXrsKNQCok0A6AWlopHyMXNoEnWf/WoNcGwKUdTS4XdI1guTqPjf
         +AsA==
X-Gm-Message-State: AAQBX9f7QHTqAvzGH+9Rb4SX6DYeoqZF5P2Uqku3vFdhkYdObl1MdIgF
        CdGCfNXMy+XdKW7WZQpyupl7TA==
X-Google-Smtp-Source: AKy350Y8pbW2rnifmrFP6LIvKRu4SZkzHXfmhAHRIISb+6+uRa6c0W7ynL15+xedRsg87Zo3jeaRGA==
X-Received: by 2002:a2e:aa1c:0:b0:2a1:9b6a:72b9 with SMTP id bf28-20020a2eaa1c000000b002a19b6a72b9mr2513568ljb.13.1680225297167;
        Thu, 30 Mar 2023 18:14:57 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
        by smtp.gmail.com with ESMTPSA id n7-20020a2e7207000000b002986854f27dsm134573ljc.23.2023.03.30.18.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 18:14:56 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 31 Mar 2023 03:14:49 +0200
Subject: [PATCH v3 1/5] drm/msm/a6xx: Add support for A640 speed binning
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230331-topic-konahana_speedbin-v3-1-2dede22dd7f7@linaro.org>
References: <20230331-topic-konahana_speedbin-v3-0-2dede22dd7f7@linaro.org>
In-Reply-To: <20230331-topic-konahana_speedbin-v3-0-2dede22dd7f7@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680225294; l=1296;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=VXMxl1zaALk2VQGZ0SUWZWF+pL7ypf/TNwlzN5n8NSU=;
 b=kdwkwRFUtJBE2RUvooae/psy8PkBqKZzpIRLEnDz0bWAFsqckUPcG6f+uXQfdlVlK+Uu7jLRej2i
 6iCqX4j7AjGitZ8xuD3j/PrE/IF9redU8LaK+IiBz+VU46aV/KQr
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

Add support for matching QFPROM fuse values to get the correct speed bin
on A640 (SM8150) GPUs.

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 1e09777cce3f..663090973c1b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1890,6 +1890,16 @@ static u32 a619_get_speed_bin(u32 fuse)
 	return UINT_MAX;
 }
 
+static u32 a640_get_speed_bin(u32 fuse)
+{
+	if (fuse == 0)
+		return 0;
+	else if (fuse == 1)
+		return 1;
+
+	return UINT_MAX;
+}
+
 static u32 adreno_7c3_get_speed_bin(u32 fuse)
 {
 	if (fuse == 0)
@@ -1915,6 +1925,9 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
 	if (adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), rev))
 		val = adreno_7c3_get_speed_bin(fuse);
 
+	if (adreno_cmp_rev(ADRENO_REV(6, 4, 0, ANY_ID), rev))
+		val = a640_get_speed_bin(fuse);
+
 	if (val == UINT_MAX) {
 		DRM_DEV_ERROR(dev,
 			"missing support for speed-bin: %u. Some OPPs may not be supported by hardware\n",

-- 
2.40.0

