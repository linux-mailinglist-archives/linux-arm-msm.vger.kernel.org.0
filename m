Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B4FF544A4B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jun 2022 13:33:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242926AbiFILdE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jun 2022 07:33:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242975AbiFILcn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jun 2022 07:32:43 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E17813BAA0C
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jun 2022 04:31:51 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id u26so36786815lfd.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jun 2022 04:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=osPC7nggXKqJCgggBesqx8Y0buQDmZALkohv6+cRgp8=;
        b=rxgaufoYydqleVu0MBrDVaOwUv9VSuk7YDRyq06HxJQJcY/RrJTzQBpBlj+J+CiX+W
         ZjtUS5e21LzJ1xBtgSH+YVwtBTsfH1pQBIBz7nQNBekVYj2tLH63RN2Fn7/QczwGC+OK
         arFI7LP/hK7lZmEKDiEKuAyWz95kXtrQZ3gInOAacjD0XncyN7v5pPTSoZMGZwrf77bq
         ojnKCnMZQaHDHpB1O0Prjyo1ZBAko/CF9Y4ZnCpRYuEKpfZSLOOhEfaUoBOkyl0hfbYH
         /y0EbMsU+WTvOPTeLUkUb/GCaUkM+hogrvOPr0aQ+lQO5LZTKrowtWpzOjhUoQbnJkPE
         q+UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=osPC7nggXKqJCgggBesqx8Y0buQDmZALkohv6+cRgp8=;
        b=DnR9IdmWu7auAAWs3G7OiA7j6w+/lUuMxxlg9O9x8AhSsx0+MI8oTZ2f4773iidF76
         imMOEvocaIlVrWeiRsQp024lhky+D2tu38Yv6ANoFx8BnF9QQYASHNiP2m5aqTI/wCXR
         CDLbVhdQz/sLfGYZSWYPQbqC2DXX9H6d62WzQFGs0Gu8mdUhwBQIQ64TYMm4dK3N734u
         4hZ/JYdPFUGPM9wjMiaCBJC7bB4VCaIvF7vmKODTYgtCpH0w1qfQh7TmTRVKy7+DT5cu
         k/3d2ZUChVYqPyxzqDx9KxJ9vbalWwP3mX3pl6PMqTyUXlavVgjmoEQYY3FJkcEuU9ux
         w8UQ==
X-Gm-Message-State: AOAM532IkNynoTZ4DIQ9+teRzQ1y0KYfnXS8GPVc0Op/jIXj9NH4t1JL
        r5k8CFyF/fWKGmWI0av1BqHB9A==
X-Google-Smtp-Source: ABdhPJxW6RZmoRdg9h0UIzsoBpR2KmQ5DeD1hic3gg2SxUODs8OxB0D6TTPV4Sd5S7S435+Z44zw3A==
X-Received: by 2002:a05:6512:4004:b0:479:1d77:4e43 with SMTP id br4-20020a056512400400b004791d774e43mr18757090lfb.537.1654774309942;
        Thu, 09 Jun 2022 04:31:49 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d29-20020a0565123d1d00b00478f2325fbbsm4180147lfv.282.2022.06.09.04.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 04:31:49 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/hdmi: fill the pwr_regs bulk regulators
Date:   Thu,  9 Jun 2022 14:31:48 +0300
Message-Id: <20220609113148.3149194-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

Conversion to use bulk regulator API omitted filling the pwr_regs with
proper regulator IDs. This was left unnoticed, since none of my testing
platforms has used the pwr_regs. Fix this by propagating regulator ids
properly.

Fixes: 31b3b1f5e352 ("drm/msm/hdmi: use bulk regulator API")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 992d29f75008..c66e857ef20e 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -180,6 +180,9 @@ static struct hdmi *msm_hdmi_init(struct platform_device *pdev)
 		goto fail;
 	}
 
+	for (i = 0; i < config->pwr_reg_cnt; i++)
+		hdmi->pwr_regs[i].supply = config->pwr_reg_names[i];
+
 	ret = devm_regulator_bulk_get(&pdev->dev, config->pwr_reg_cnt, hdmi->pwr_regs);
 	if (ret) {
 		DRM_DEV_ERROR(&pdev->dev, "failed to get pwr regulator: %d\n", ret);
-- 
2.35.1

