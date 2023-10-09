Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBDFC7BE8EB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 20:10:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377383AbjJISKw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 14:10:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377457AbjJISKw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 14:10:52 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFC779D
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 11:10:49 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-50433d8385cso6401495e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Oct 2023 11:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696875048; x=1697479848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rIiIl1qxmpZwJAax2zo4ZFB4kzioqbwuWWlEMohjM5o=;
        b=xH0B2U/eo+TY7dNACLPSuYFTsKTFM6oie1vCy1ZuFLqRAhbnrDefEdzJ/dlnk4agVT
         DlsFJiKAVcmOlZx667FH5sdRHyI3CdPA/M1uyzPL6s+ZCSrmJ55qJYJ13g+uBb1Sh4PQ
         JrOtbJDwCxQcSAJQnj2+98En/eMs3vclnoWQzGmu5OC6MyJASvgjQQHOtUr4fvuqY/wy
         gxDTPLBkTYryfK6t4NUvffWZa+74+F4i0GnsSSlWY2DfdqCEcHu6rK09Pyc9wnwW7i4L
         KNR+O2b11OL0U7RFwCCHPqgImtxhuDYqdoI3b4hORTmjx8AxX9zK22C08u0iSfVRJTYH
         EL6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696875048; x=1697479848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rIiIl1qxmpZwJAax2zo4ZFB4kzioqbwuWWlEMohjM5o=;
        b=VkhhJhVbi2UcfV6bM7QJ0/KGXD+Y4Yixs5WyJcg51RRLgApRdmhbM5zwmmLXX0gdgN
         JbCEDVlJH750we/YSlFKRo5L/cchEsbfYsMxl4UW/NAz2JnLasLyCnb4Fugt5jtxlpKo
         9h9yI15OhGUzYXeBd9erwsOxb7KF/hT/zGAIHTEOqFwMb7j6xHYwGDSVgzOZcUQB/aZF
         O4QEQPJt7WTg7x4GG922LW3c4lXEszWFFspvxBE2M7oU+X4RH/N3/4ysIMni44wYA1Zb
         szjMueB4WCOK9ry4KVUqPa1affhaBgsZZqP/pj9OKQmUQa2vQOTanyOpF/QO4iJQ43RY
         9KZw==
X-Gm-Message-State: AOJu0Yz64xRiKrxUW6YHvqlAxCVmouTOjZxkppzlN1MNHmg21AFwrhNY
        29Jmz2j3rgvOn4it/+WSKBpdyg==
X-Google-Smtp-Source: AGHT+IELzXLGkqfFXYHQEEg+Re6/uU4DLwq935JYwzvmyWABx/+281fRZT0fJSVsJMsGdurSBTxfLg==
X-Received: by 2002:a05:6512:3e18:b0:505:7a65:ad5d with SMTP id i24-20020a0565123e1800b005057a65ad5dmr15542523lfv.56.1696875048162;
        Mon, 09 Oct 2023 11:10:48 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d6-20020ac25446000000b00505677e7a99sm1506963lfn.139.2023.10.09.11.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 11:10:47 -0700 (PDT)
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
Subject: [PATCH v2 08/13] drm/msm: remove shutdown callback from msm_platform_driver
Date:   Mon,  9 Oct 2023 21:10:35 +0300
Message-Id: <20231009181040.2743847-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
References: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The msm_drv_shutdown only makes sense for the KMS-enabled devices, while
msm_platform_driver is only used in the headless case. Remove the
shutdown callback from the driver structure.

Reviewed-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 76b69f605b9c..c2f989d1ff42 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1297,7 +1297,6 @@ void msm_drv_shutdown(struct platform_device *pdev)
 static struct platform_driver msm_platform_driver = {
 	.probe      = msm_pdev_probe,
 	.remove_new = msm_pdev_remove,
-	.shutdown   = msm_drv_shutdown,
 	.driver     = {
 		.name   = "msm",
 	},
-- 
2.39.2

