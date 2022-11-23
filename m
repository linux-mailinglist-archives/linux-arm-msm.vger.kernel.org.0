Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB354636BE8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Nov 2022 22:04:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237473AbiKWVEb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Nov 2022 16:04:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237496AbiKWVES (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Nov 2022 16:04:18 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B66C9A5E6
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 13:04:14 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id g12so29957851lfh.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 13:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qFfDzv26PSPKle35bbHIudwu2pfLnHezdaMAAf4+MDM=;
        b=hOR9T2WBUBzeoJhxrzfXIAfWT/wWhnip7qpYY6KkgDy9e5kXVpfLk5u0s7OJOGJFQw
         4H5Zlgc+S/7HWQXfqd28doH6Ln40unyRjyak5xH6gdhnzXcedv9HuC9/M8zdd4iAm/so
         vWSNfSP+s7iOOyztcJDLFUkJaoDCDixLLf0yhA1W5oL1Cf2OYfbQcgdceZLr4RKgJ2yI
         Z80qRBVB9hWzVrQgQYyyinlAqWE7bQJR0wH4mOPSw2xJVvz/pIybaMCO+1rTj2u0zri/
         vo6AJFCbyZIgkQv6SAGcA5W1AjIin2DkZZbqBnEWyHt9Vdok0gE91M7vDZY1vu+CRKGi
         mqZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qFfDzv26PSPKle35bbHIudwu2pfLnHezdaMAAf4+MDM=;
        b=xb2yE+qzPtG7CBdGHqez3FeWgm6RVkemcEhvz+4jJuMCYaQZG33ywBTMINWpSKzx9o
         /e0KcqrdIN2y/HxR1i9pl8SvXFi7rfLKRaXNf/2hMCUSuWQu95FxDD6DAJWHT4j+Rswk
         zHzhU+UN+Dn5LPrDbc272bG8La1jP6x7L8nJYCJLMFoH7ObOf1V5+gWbprWZ/L80IVtK
         i/ziKaKS/0/cGfbfxi+IYN4hmH//+ZzJEIiWeSnVyWmKTq1NPCOXhzsEsyYSLJfBL6Mw
         QrUy3KZ5/ulYXjtGzBL16OSMT72k96m9WAM9WYH2uGnbyy6KU9LBJikZpaZHbHCLFIFS
         hHow==
X-Gm-Message-State: ANoB5pkSbCRcw2Z0GqceAWqHyHq8fon/zJUBcy19Rg8NWCqdoG6fpCXb
        0oInPMnTLQWVol55a6hTi7ETsw==
X-Google-Smtp-Source: AA0mqf7K9huOyhYq/RY7ogvrk54iEVQ7THwYon0Ka4gxzk3/alQSkTDqB9xJcJrFTNaeDNcC4eRvoA==
X-Received: by 2002:a05:6512:786:b0:4a2:44c7:ee58 with SMTP id x6-20020a056512078600b004a244c7ee58mr9718519lfr.127.1669237452870;
        Wed, 23 Nov 2022 13:04:12 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c3-20020ac25f63000000b004b177293a8dsm3009913lfc.210.2022.11.23.13.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 13:04:12 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v5 10/10] drm/msm: mdss add support for SM8450
Date:   Wed, 23 Nov 2022 23:04:03 +0200
Message-Id: <20221123210403.3593366-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221123210403.3593366-1-dmitry.baryshkov@linaro.org>
References: <20221123210403.3593366-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for the MDSS block on SM8450 platform.

Tested-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 6a4549ef34d4..5602fbaf6e0e 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -283,6 +283,10 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	case DPU_HW_VER_720:
 		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_3_0, 6, 1, 1, 1);
 		break;
+	case DPU_HW_VER_810:
+		/* TODO: highest_bank_bit = 2 for LP_DDR4 */
+		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_4_0, 6, 1, 3, 1);
+		break;
 	}
 
 	return ret;
@@ -511,6 +515,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sc8180x-mdss" },
 	{ .compatible = "qcom,sm8150-mdss" },
 	{ .compatible = "qcom,sm8250-mdss" },
+	{ .compatible = "qcom,sm8450-mdss" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, mdss_dt_match);
-- 
2.35.1

