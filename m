Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD6397419C3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jun 2023 22:37:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231944AbjF1Ugr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Jun 2023 16:36:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231933AbjF1Ufv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Jun 2023 16:35:51 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFE532718
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jun 2023 13:35:46 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4fa48b5dc2eso97263e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jun 2023 13:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687984545; x=1690576545;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=voWmkq5A/4H6lrc7bXc4yRtm7lr6RklCvSbF7Hr43HQ=;
        b=bvwPX9iP1u0B4dVVrwoOKjAjYT9LWVkOzmGvgfrcnHnX8XfIw1kbxsUXjuS4u3dNdt
         +nc29D4mb2pNHv519QJhDSkS79ZC15A9UVGqlWZ6lPIk/C5+kvdra+ikO9sZIFoLd7Xa
         bWN1SolzqXnjhKPtjqkVFBsvlchU2UIeGNF1HEbhbaMXyAhqi3K0tJW1Z31w2zVKbf7S
         g6B14ODlxsgbHZ4UPE4uQRKynZmFJMgtkOmYx4HDPWS1ZNRj2NIM0UJ2gH05d7DtYmGH
         rektJN9Ujyob5dY0eWrXdWl5asVDrnteqpv7zplar0cE0hF9PKVbLk1B2tF4w3gZ0Rpz
         f5jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687984545; x=1690576545;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=voWmkq5A/4H6lrc7bXc4yRtm7lr6RklCvSbF7Hr43HQ=;
        b=XvtiSVz1HK3EVWa5c45yKd8QI994lhEVwOsQBQZmbDwqgB9lPEIDb7V5ma+etx1Ar3
         M9Sfk0wILcRzaQTWx7Hcqj6DMqWdCCg+YjloASTGRZ6qHVXb4IbnyWKVJmRaUb/EJ0ju
         H/YCouav+Ix8uXtSlXlOeMPzNShLzK5DmcF7d/EDcrnpEbSoIYudYAh3ec+Q+nO/GOZa
         iJag9nCoQ6Jm0o96qscfERX+lZgGyYltnkf+JTSbid073oQa6z6gWnBsrJhBp/CvRuwJ
         5vlJK5wB0FWTxexTcS2fCv//AU895DBXs12vsm6KVDYsr725rWulbW7+6dr9SzWw/Q7K
         1nyA==
X-Gm-Message-State: AC+VfDxo9bEm77G2ybacsTArq/qvJ4F3LhgsmHOdamlu8oFrJE1KyXwj
        ZOy+c+o5fQAvibx7Mj+/mo2H4A==
X-Google-Smtp-Source: ACHHUZ7yYY5xB5BOCg57Wk9P4RZ0TASg4RnHuydH+NJKXLhpuzizJhVfp+DTy6qJqYFjwlPt095a1g==
X-Received: by 2002:a19:5e48:0:b0:4f6:29cf:c0dd with SMTP id z8-20020a195e48000000b004f629cfc0ddmr19592853lfi.8.1687984544935;
        Wed, 28 Jun 2023 13:35:44 -0700 (PDT)
Received: from [192.168.1.101] (abyk82.neoplus.adsl.tpnet.pl. [83.9.30.82])
        by smtp.gmail.com with ESMTPSA id m25-20020a056512015900b004fb86c89fa1sm753363lfo.135.2023.06.28.13.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 13:35:44 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 28 Jun 2023 22:35:13 +0200
Subject: [PATCH 13/14] drm/msm/a6xx: Vastly increase HFI timeout
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230628-topic-a7xx_drmmsm-v1-13-a7f4496e0c12@linaro.org>
References: <20230628-topic-a7xx_drmmsm-v1-0-a7f4496e0c12@linaro.org>
In-Reply-To: <20230628-topic-a7xx_drmmsm-v1-0-a7f4496e0c12@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687984524; l=863;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=dEgcZTxCoSPqEO7GO/0ZL2tns6GDxdULpb4qFZADjmk=;
 b=/Mfvry5SQ0m/wK5vDp3W2W1GiurV0+qd9uxCmsN576pkyGMTxvesfqdFzY18kxMFp33X4ZnGe
 KT9o55q1KbuDNDwjmDjPN2PnwmAd933Lox8wZjXypTcxnhdXg3wqymD
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

A7xx GMUs can be slow as molasses at times.
Increase the timeout to 1 second to match the vendor driver.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
index cdb3f6e74d3e..e25ddb82a087 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
@@ -108,7 +108,7 @@ static int a6xx_hfi_wait_for_ack(struct a6xx_gmu *gmu, u32 id, u32 seqnum,
 
 	/* Wait for a response */
 	ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_GMU2HOST_INTR_INFO, val,
-		val & A6XX_GMU_GMU2HOST_INTR_INFO_MSGQ, 100, 5000);
+		val & A6XX_GMU_GMU2HOST_INTR_INFO_MSGQ, 100, 1000000);
 
 	if (ret) {
 		DRM_DEV_ERROR(gmu->dev,

-- 
2.41.0

