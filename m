Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FFDA634AE7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Nov 2022 00:14:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235292AbiKVXNA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Nov 2022 18:13:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235310AbiKVXMt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Nov 2022 18:12:49 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2B3230559
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Nov 2022 15:12:46 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id r8so8989143ljn.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Nov 2022 15:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qFfDzv26PSPKle35bbHIudwu2pfLnHezdaMAAf4+MDM=;
        b=nwxlyA1Xsbv6cMVS7Mv0sDdhBWe3BPRMqqQPClaVQRosWTBMMf6vRuBEF/NTd2epGQ
         U6UOdUNSe2D94YU15MhC1b/YCMLo/VFofkz0Lw46S9GXzTkV52AwPTxTojY1mBkqtMiS
         WyC807k5cKG/FjNHcbUagATFiJpt4ySVNhoWfJMBTLaZK3aeZoOWWbaOI6Vaa+33jVv0
         YW+p/ce8IE0g6zJuXoMsW5f1/RnPPTfhQh+v8yX9mmcac1NSAhLpmk4dCOsMhnFHK1U/
         iie5dOccED+XXfjYbyVD/X6rjJuHUj1AWFmQrPFfJUESEmSokcjCoc06QWvI1xUUJoWd
         gSGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qFfDzv26PSPKle35bbHIudwu2pfLnHezdaMAAf4+MDM=;
        b=SsCECyW2/qwPkNYWyMaWfhSrEbGodq6HL6jvPC6LCYI+zvsY22xzTiwShJRCtgFGI6
         8Und4ToHImeTzqtj8jp5kp6+nFKWoLyh1KK9Sh243fFR32CYT+n/hsO9ygvqtPmvIMtU
         oaUJ400d8fDI321gsfs4QycDEhocsv20YuC3JVr+LXvuHPm+I/eCzQWQ4gL7jN4In7p3
         luuaaWVa+w+uVBFY+yOx+wEIn73iwDyKATGHAGC9YjuAvsKI5bOXGL8tRjYd/ULEGW57
         rYOGbuRd+8w0dmJ3LYASxxewFxUcA0n/EmMMhedfYQozlOVOa7qpdAmV1eF+6i7PJI+v
         64VQ==
X-Gm-Message-State: ANoB5pkMTMsLrBv8ea8OpaRnjHMHFwX5wwbZp1LA82U6fnc1h8tHu7Fj
        hK+05xQeQgqxA1llwwBZdPY11Q==
X-Google-Smtp-Source: AA0mqf7SgQkkPErJqPAXl40ZPkuumJgRT4JLyzqbnc46KHQnuZYFQkLJJakcJsaFJL3VjfxaIM78IA==
X-Received: by 2002:a2e:a594:0:b0:277:4150:b560 with SMTP id m20-20020a2ea594000000b002774150b560mr2258472ljp.299.1669158765084;
        Tue, 22 Nov 2022 15:12:45 -0800 (PST)
Received: from eriador.lumag.spb.ru (dzpbkzhtyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:a302:8a1a::1])
        by smtp.gmail.com with ESMTPSA id q18-20020ac246f2000000b00497feee98basm2617541lfo.274.2022.11.22.15.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 15:12:44 -0800 (PST)
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
Subject: [PATCH v4 11/11] drm/msm: mdss add support for SM8450
Date:   Wed, 23 Nov 2022 01:12:34 +0200
Message-Id: <20221122231235.3299737-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221122231235.3299737-1-dmitry.baryshkov@linaro.org>
References: <20221122231235.3299737-1-dmitry.baryshkov@linaro.org>
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

