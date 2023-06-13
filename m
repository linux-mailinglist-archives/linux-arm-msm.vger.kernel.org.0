Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8625A72D557
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jun 2023 02:10:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233343AbjFMAKM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jun 2023 20:10:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233482AbjFMAKK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jun 2023 20:10:10 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 721A11720
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 17:10:09 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f64fb05a8aso5960613e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 17:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686615008; x=1689207008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=27BaSyAqy1Cnxu5e2T0eLInr8w11mQnmD00hWGVy5XY=;
        b=QAOCVKUtTOD4feIPdq1byQnfc75zs3PvnpzacyB+wvcoK5WaV+wKM1IvULTpepOo0W
         rgA6eRMyWnjNRTXQgz38ir7q3RhXv2J7M1T7KmBB9erbKtd0rM0a1qiaBZth0gXbHpQT
         IEjuoFPQIy27eP+5hATz8/ozZk21hI7vlGhmAMbeOyC/YA7rxjsmqzkMm+bDelfamkJ7
         v+a1oX1OofH7lqG6ngx2VmiVuSgi6l5UF58vOAiwPErkUoNzSPJLm1goov6FdGZQFikW
         XEaqPezRjapGYqAptpIk8ZevFkgGwYNFir2PMDKtJCu4GcDsrXrDCeqiUngrKJtdGZbN
         RIfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686615008; x=1689207008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=27BaSyAqy1Cnxu5e2T0eLInr8w11mQnmD00hWGVy5XY=;
        b=dCTgkG1uChAmN8I2pJs2VneR4SaTuRWHYMghnm4y+GBHzsjlSh6k/c+nAnXq3ylj/r
         HsdBaSN02Ju1yTVKIPcC2kNqnWdV8N56lrIMp+NPlXvCvJOj+mdg6JGVsA2ofcMMyViU
         +TzyumgvVISlFwlgdxCGLtMJgKpekZVbM32B+7BwBIJ5pIsLhWZ4hxZlsRO1U1YyiPk8
         D44maUW1fvjQGaqULzuPvs+gwbjsBYWnXHb5BxuekfXZqZx/V7vf0SOnQPjA2eCYEkU8
         1QaqdsqEjK0x6fHuTgxvu1lsQnzsbZ7Dnrno0M4mar2ui9j/+rbJ68lZMFHIqjvMPioZ
         ioaA==
X-Gm-Message-State: AC+VfDz6UGoBfoFbPeprWOBF69ftb2FcC1q7ElxEqSHPXrfNrPREqlvp
        8mhXS1Qjsaku3mkXbuby/y1qNg==
X-Google-Smtp-Source: ACHHUZ68C4jaT5uSfPxIfARr159iicx5JmxaUtYJQldxoc1pXFDid47hcJFg8a1KHF+ndtv62R5wQg==
X-Received: by 2002:a05:6512:28a:b0:4f4:db63:23a0 with SMTP id j10-20020a056512028a00b004f4db6323a0mr4964184lfp.33.1686615007749;
        Mon, 12 Jun 2023 17:10:07 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id c10-20020ac2530a000000b004f63eea01a7sm1581604lfh.192.2023.06.12.17.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 17:10:06 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 02/22] drm/msm/dpu: correct MERGE_3D length
Date:   Tue, 13 Jun 2023 03:09:41 +0300
Message-Id: <20230613001004.3426676-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230613001004.3426676-1-dmitry.baryshkov@linaro.org>
References: <20230613001004.3426676-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Each MERGE_3D block has just two registers. Correct the block length
accordingly.

Fixes: 4369c93cf36b ("drm/msm/dpu: initial support for merge3D hardware block")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 36ba3f58dcdf..0de507d4d7b7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -508,7 +508,7 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
 #define MERGE_3D_BLK(_name, _id, _base) \
 	{\
 	.name = _name, .id = _id, \
-	.base = _base, .len = 0x100, \
+	.base = _base, .len = 0x8, \
 	.features = MERGE_3D_SM8150_MASK, \
 	.sblk = NULL \
 	}
-- 
2.39.2

