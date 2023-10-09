Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F1707BE8E8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 20:10:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377450AbjJISKu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 14:10:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377383AbjJISKt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 14:10:49 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32D54A3
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 11:10:48 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-504427aae4fso7207961e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Oct 2023 11:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696875046; x=1697479846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=znTJnZe1eU48JjBsnTfzCMGOflPzOp8ZDEbta/LuWII=;
        b=DRvQPZUbd6hDs8+kTLXkAFVGtO1uYg/GGD4p4mq2vKFbT4uAc1mnhhte6inGPkQHag
         /6KX5/8Dn5Gm5y7K40OuDpbzAlNgTCJ9oLz6J7vu/7gsBYQFSuWdLyVlouU8IJjJLbs8
         zRvrEEltx+G9ltsnWgONKE85GysXmnbq+vCzCry5+w4E9ySvUs2Cu50H2pFyl/Y4MKVD
         gpY/6sKw27VC7c0rmfEK8d6Bz50S9FZliZbmQqrfOjm+nU+7xlP/seYR/GhE21q68o4j
         49vpD2J9fnlg5gpfGtjYfPwLHs82nJetwwFMUyLfsD+v8gwADtc9Fyb0XXSOtVFmLf7a
         mPRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696875046; x=1697479846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=znTJnZe1eU48JjBsnTfzCMGOflPzOp8ZDEbta/LuWII=;
        b=VO6p3wnHGS1fQt3QWpXlbqNAVvmFHaWqD4i72mh5Nhie6JtOvDv0F8KjhaPlDNS9Th
         N4a8Hw3s2JEpyaM5d5cEFQaJmJht2GhaQWvSjgcjdIC5S1BE8HIQWCtKNyZGeBJ4HYWg
         bIU0AkvdRD4EjxLkWT/BW/VZruTTUzUyTXAK9qRgi95VDeR+ebFO6qVeaYoTsZGbkDIP
         hVJbtY0SUWl1xY8MiUZOtfQUtC5v6aya+S82x2fnSrpPDi98b7MRtoH51UvVcVxh05bl
         RD2LEdy6yeVAu+j0LUTGbG2mGQxwSECOPxJhqaGAht6DBGUxtP3h9aOBaevcr31GyQRt
         KY5Q==
X-Gm-Message-State: AOJu0YxtuNlTQ+VgWQi36mbGMYVGVzESRX7USBAD/0bvCkjN+FLgdJFA
        Uq8KLUJ4CqfDcD3RCOoXz+kZ+g==
X-Google-Smtp-Source: AGHT+IHE6rUV6n/8/o3X/GGKBulZ/BEWEElLvf0NxLXzu3dOfhP4sDOjS2sIfxkEd+5dKWvsn3UBxw==
X-Received: by 2002:a05:6512:3995:b0:4f8:586a:d6ca with SMTP id j21-20020a056512399500b004f8586ad6camr9733327lfu.9.1696875046534;
        Mon, 09 Oct 2023 11:10:46 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d6-20020ac25446000000b00505677e7a99sm1506963lfn.139.2023.10.09.11.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 11:10:46 -0700 (PDT)
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
Subject: [PATCH v2 06/13] drm/msm: drop pm ops from the headless msm driver
Date:   Mon,  9 Oct 2023 21:10:33 +0300
Message-Id: <20231009181040.2743847-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
References: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The msm_pm_prepare()/msm_pm_complete() only make sense for the
KMS-enabled devices, they have priv->kms guards inside. Drop global
msm_pm_ops, which were used only by the headless msm device.

Reviewed-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 7617c456475a..fe885bfd9742 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1122,11 +1122,6 @@ void msm_pm_complete(struct device *dev)
 	drm_mode_config_helper_resume(ddev);
 }
 
-static const struct dev_pm_ops msm_pm_ops = {
-	.prepare = msm_pm_prepare,
-	.complete = msm_pm_complete,
-};
-
 /*
  * Componentized driver support:
  */
@@ -1305,7 +1300,6 @@ static struct platform_driver msm_platform_driver = {
 	.shutdown   = msm_drv_shutdown,
 	.driver     = {
 		.name   = "msm",
-		.pm     = &msm_pm_ops,
 	},
 };
 
-- 
2.39.2

