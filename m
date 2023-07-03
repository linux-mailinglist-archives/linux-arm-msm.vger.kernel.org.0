Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A108745338
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jul 2023 02:37:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbjGCAhz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Jul 2023 20:37:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229797AbjGCAhy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Jul 2023 20:37:54 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 488CFE46
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Jul 2023 17:37:53 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2b63e5f94f1so48532891fa.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Jul 2023 17:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688344671; x=1690936671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gi6uYs0yy4iwxnVM5Npf/ZisXoud61FuBDGjFnoLitw=;
        b=bPclgG/9b5NaCNxTxnhM6g+c02HqU/l4Xc7QOmVOxGLUiRZ3oqbxpUo3q351s1G3fE
         Tj5V+qwfI2yC3fC4cFY/y2WsKyJXTas7V9wSxsl/qf9wRvbgR4ogfYafJs8RM7ssqtdX
         r8MuPyjgtCfnIpXeOyVY/a8buxGWRrwAiYgLDXJ3g+SPg2prRmwuAHxO0AsqaTHkZpze
         0/Ozh4nFoeBI8AK/MQOqrXeXgpuL85s1SSsvR9tA1/cYwkFDGA7Bm9Vapdq+9aOanIIY
         8frFITUoOaVe4atGCrInx/yVZ9xoEBPu4Kl6O6WfxoQ3Da6Ul8ddanDLbT2T2hMcWlBg
         jVuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688344671; x=1690936671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gi6uYs0yy4iwxnVM5Npf/ZisXoud61FuBDGjFnoLitw=;
        b=mInua9uUjK1mCBRYmX/0GP4iFUfqi0zhWBcqnQqP4281i6qhMSjy0CTrLRvfxPCp3G
         ohwhgWRSgxhm1lTid4ENP62eXT8jIkHKXBons4nMPC0K6ucznnU2T5Nd88em3L8Xy6hY
         sBX/revZIlLPAtxw7zFSJCe0Z7GmXha8Ahdg/wEJX4r9r1KpXAONXSerrmrAVxKp9JWF
         M6LMJMQSC5rfRwNdlF/D4/YG4Oq6czU9NSG83UXMa+wfFGYTMvoKIJz6zSBltWxGOMpD
         DrMrESTzsL57RmISE8bW954iiyYHekZx+ZMqvpjcEiBOA0eTfjljauPUXAYDnFyjlg8i
         VZIg==
X-Gm-Message-State: AC+VfDw1IavU7ObJ3qFxtJw7r+0AL3Itjuj0sOntdr+aW1YrbWXAyfV8
        ghUwOGeXBjOu7HIpl2on7+Vg8g==
X-Google-Smtp-Source: ACHHUZ6cEuCuRJauL94EMMA9/zg+ErB/kYdxQ2lOaMyLtFzzNZ5MR+FZ2EF3HsTFomamhe4i+lBc1Q==
X-Received: by 2002:a05:651c:124b:b0:2b6:a694:aaa1 with SMTP id h11-20020a05651c124b00b002b6a694aaa1mr4520858ljh.1.1688344671623;
        Sun, 02 Jul 2023 17:37:51 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id s24-20020a2e98d8000000b002b6ebc61e85sm136704ljj.54.2023.07.02.17.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 17:37:51 -0700 (PDT)
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
Subject: [PATCH 06/13] drm/msm: drop pm ops from the headless msm driver
Date:   Mon,  3 Jul 2023 03:37:38 +0300
Message-Id: <20230703003745.34239-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230703003745.34239-1-dmitry.baryshkov@linaro.org>
References: <20230703003745.34239-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The msm_pm_prepare()/msm_pm_complete() only make sense for the
KMS-enabled devices, they have priv->kms guards inside. Drop global
msm_pm_ops, which were used only by the headless msm device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 9fe789a546f5..a85eb7b21061 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1123,11 +1123,6 @@ void msm_pm_complete(struct device *dev)
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
@@ -1308,7 +1303,6 @@ static struct platform_driver msm_platform_driver = {
 	.shutdown   = msm_drv_shutdown,
 	.driver     = {
 		.name   = "msm",
-		.pm     = &msm_pm_ops,
 	},
 };
 
-- 
2.39.2

