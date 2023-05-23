Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5531470D679
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 May 2023 10:00:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236106AbjEWIAh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 May 2023 04:00:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236101AbjEWIAU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 May 2023 04:00:20 -0400
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F50410EF
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 00:59:35 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-4f3b9e54338so3306370e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 00:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684828616; x=1687420616;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uz91t5CPsz6QMWtRIYuzaeaGaQUSJIZo7OKNOwA96Nw=;
        b=Yys1SuM5lXX4t65dXVCxR3c4Guf7QIgGVNibpDkl54RN3Znt665d/pRQFxYgBBjLmO
         Db7AVzW9V9NsAvGDGdvBWxsgDcCkxcjJaupKKRARuBLISOvvfNQrmbbbXAhD3vK2Sn9C
         RADdi0hxYBZ5DNuOtyK1K0sbPCTlBbcAToX7EK/a89ltxwZrQz7fjfBI/uTyF0rZhbB3
         qPOdfLia6p1PjThN161b22RArg59fYs/qkPUFVWAOoNBfIVORfhsx+kPNCejl22WAxp6
         hKtdiQsSrgOX53GVUep+PBZyJcQrI8rHPrrnFqM8CQsv43e0tTur+LWCB0i1az6R15jg
         oD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684828616; x=1687420616;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uz91t5CPsz6QMWtRIYuzaeaGaQUSJIZo7OKNOwA96Nw=;
        b=E6LYly4gRL3vGcAlZ1+8COEQMAJij7rcvw3d2XdNPqprHSaV8uAfj9PrUTTMlq++Ca
         UGS6qHyaxiR2q/0pVsfW059Z8944UuxEvxMHs6UVNdlX7ay5rw2hD4aNXFwIbMenBOYG
         oRjbX7Zp/7aOZ/f7XzSDR1S2uu1wsY9arm4C9TS6AJ9NJFefjqARokEkZu0hE8r2394l
         xSUE1cjKNPZbFO38odh7k+oHUg9JCcW3CVvljjYacgoOBUcJYKha++y9lzUuLXbrglf8
         qXll0wz9gt8lec/SCp0iVCLgwcuR76aydACLioAW9ssS751JYz7kCxpopYoO3bfnBXun
         bf1w==
X-Gm-Message-State: AC+VfDz/VzxbS8daBj2v6BVkcBR9tZXypihc8Y25G/C5Z5CtVX0bJ0AS
        bY3RVkZRtrde/US6+wERhxNDs/i0Be1/qxzGXAs=
X-Google-Smtp-Source: ACHHUZ5kAF5uQSeuXgAPRImGMQR5VzZ/7OSgGpdEbGRQ+peABQ0DXcoD5LeeMzy346x6Cn0v/DN4vQ==
X-Received: by 2002:ac2:4c09:0:b0:4f2:74d3:8996 with SMTP id t9-20020ac24c09000000b004f274d38996mr4455935lfq.8.1684828020519;
        Tue, 23 May 2023 00:47:00 -0700 (PDT)
Received: from [192.168.1.101] (abyk138.neoplus.adsl.tpnet.pl. [83.9.30.138])
        by smtp.gmail.com with ESMTPSA id t9-20020ac25489000000b004eb0c51780bsm1257070lfk.29.2023.05.23.00.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 00:47:00 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 23 May 2023 09:46:20 +0200
Subject: [PATCH v5 09/12] drm/msm: mdss: Add SM6375 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230411-topic-straitlagoon_mdss-v5-9-998b4d2f7dd1@linaro.org>
References: <20230411-topic-straitlagoon_mdss-v5-0-998b4d2f7dd1@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v5-0-998b4d2f7dd1@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684828003; l=1022;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Nh6zuYJI8gb14gxje6MmS/hbQSaIA3Eeoi75EfztoC0=;
 b=mwOMTHZtQczidymOKPTKW1hJ3k0Sfycwrop+S9790DYqps1onxdXRPHNXVFw+jMyTBbN68XRh
 O+ZzxbdzSd9AdFBeZSqcdaG2O5vRco+Dkni81Bj96yukCZc4ScXw/yr
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for MDSS on SM6375.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 4e3a5f0c303c..05648c910c68 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -580,6 +580,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sc8280xp-mdss", .data = &sc8280xp_data },
 	{ .compatible = "qcom,sm6115-mdss", .data = &sm6115_data },
 	{ .compatible = "qcom,sm6350-mdss", .data = &sm6350_data },
+	{ .compatible = "qcom,sm6375-mdss", .data = &sm6350_data },
 	{ .compatible = "qcom,sm8150-mdss", .data = &sm8150_data },
 	{ .compatible = "qcom,sm8250-mdss", .data = &sm8250_data },
 	{ .compatible = "qcom,sm8350-mdss", .data = &sm8250_data },

-- 
2.40.1

