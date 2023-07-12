Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8430D7507AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jul 2023 14:11:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231298AbjGLMLw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jul 2023 08:11:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231811AbjGLMLv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jul 2023 08:11:51 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A278AE4D
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jul 2023 05:11:50 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4fbb281eec6so10816218e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jul 2023 05:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689163909; x=1691755909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j8u99usX7me3R6ezNiQ39VuDYE1QHKY3yic4fbiQ42Y=;
        b=PaeeNlqC29vJaW47FUTpwhwKWIZ8YVsPowcrbrOneBcOsCtve21sP7QvI67vqtPj7a
         OgqBzUYqtQ89eyhn9KT4jIjPGmz1Eg8d3jh7JHAgxp+yxB4o9xTFDnD1zoAMLZei63jV
         /vC1c3ShGU3utgazkEmdFRrnBv8UuY/wXbuqHOc+fuL4QRtgs8yofcyfTECMlquMT1x4
         AT8sPzxPyfw1I5BvXsYHIjD1FPFfI82EMBsZoRGVmnuMe3T6dcY947W9Erf4CUOzHmJa
         3wl8tRzX9rt8mccS0TDhiMQe9CXoPRfPrOORwAPUIWaZpjOlIzKFC2eZNvjdN9Y2eElK
         40Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689163909; x=1691755909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j8u99usX7me3R6ezNiQ39VuDYE1QHKY3yic4fbiQ42Y=;
        b=A1MxQdFS87JReKUr+r1vs1JRKP9ClwE+iAoDSOfUlg43IOlI/SGvVRpDcYbQIpYKtM
         NblLiREf+qwv3GUqHlilwvJVW6qYBm5uL7Dqfb9ldDDlmZbDNwCBVVed93PDyBuuOsl8
         ACdMND96MdxDkK3aN9PjAXHWQAi4Ryw7xZa3U8jrSByJhkecfXevcDsqZN4CCwDKH+Vu
         AaNcRnS16SjR4/u6n7C17pLrm0LVuV+3KoWsFT7j+cGmJD4+ZPY6SsEr/s2WZK5+VvIs
         OHfyP54LTTxUH9GpAOkuMrWCeTrZIQwI+ThZXHgw0rehk75p55aJLlSXHiVBS9gg2V/d
         nzGA==
X-Gm-Message-State: ABy/qLYK6iabAr5tBOOd18Slb5tLF+S575Vb6LteecwkuATVmawqHv74
        KX5IlqzH967mllXi+J4VBs8K0Q==
X-Google-Smtp-Source: APBJJlFw7Bt7yaBOhgBe1Bw0QG87L+kc2FH2U2ZcIx7JWarVs1gcvnh8RQ2nSmByaNKIv1/2fXSEAg==
X-Received: by 2002:a2e:8745:0:b0:2b6:d700:fbdd with SMTP id q5-20020a2e8745000000b002b6d700fbddmr15522209ljj.15.1689163908814;
        Wed, 12 Jul 2023 05:11:48 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id p14-20020a2ea40e000000b002b6c8cf48bfsm913135ljn.104.2023.07.12.05.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 05:11:48 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 3/8] drm/msm/mdss: switch mdss to use devm_of_icc_get()
Date:   Wed, 12 Jul 2023 15:11:40 +0300
Message-Id: <20230712121145.1994830-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230712121145.1994830-1-dmitry.baryshkov@linaro.org>
References: <20230712121145.1994830-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Stop using hand-written reset function for ICC release, use
devm_of_icc_get() instead.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 798bd4f3b662..304a6509e1fb 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -58,14 +58,14 @@ static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
 	struct icc_path *path0;
 	struct icc_path *path1;
 
-	path0 = of_icc_get(dev, "mdp0-mem");
+	path0 = devm_of_icc_get(dev, "mdp0-mem");
 	if (IS_ERR_OR_NULL(path0))
 		return PTR_ERR_OR_ZERO(path0);
 
 	msm_mdss->path[0] = path0;
 	msm_mdss->num_paths = 1;
 
-	path1 = of_icc_get(dev, "mdp1-mem");
+	path1 = devm_of_icc_get(dev, "mdp1-mem");
 	if (!IS_ERR_OR_NULL(path1)) {
 		msm_mdss->path[1] = path1;
 		msm_mdss->num_paths++;
@@ -74,15 +74,6 @@ static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
 	return 0;
 }
 
-static void msm_mdss_put_icc_path(void *data)
-{
-	struct msm_mdss *msm_mdss = data;
-	int i;
-
-	for (i = 0; i < msm_mdss->num_paths; i++)
-		icc_put(msm_mdss->path[i]);
-}
-
 static void msm_mdss_icc_request_bw(struct msm_mdss *msm_mdss, unsigned long bw)
 {
 	int i;
@@ -389,9 +380,6 @@ static struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool is_mdp5
 	dev_dbg(&pdev->dev, "mapped mdss address space @%pK\n", msm_mdss->mmio);
 
 	ret = msm_mdss_parse_data_bus_icc_path(&pdev->dev, msm_mdss);
-	if (ret)
-		return ERR_PTR(ret);
-	ret = devm_add_action_or_reset(&pdev->dev, msm_mdss_put_icc_path, msm_mdss);
 	if (ret)
 		return ERR_PTR(ret);
 
-- 
2.40.1

