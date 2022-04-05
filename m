Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1DB84F565A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Apr 2022 08:24:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241990AbiDFFik (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Apr 2022 01:38:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239311AbiDFCnE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Apr 2022 22:43:04 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32E0628CF76
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Apr 2022 16:45:54 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id q68so1077170ljb.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Apr 2022 16:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FHNN2mSJ3x+q9jH5PWO6X0bvixa+kSt0fmYoqYECsKk=;
        b=T6Jcn97rtZF8kxQuxjc+V1ulcQ1/sxTl7CIWujNP8Iyu0sDdXUOkRfiQufT6QFhZaG
         bWIDgTZG3PTHx8bRNkYAUjGLbln8Wc8JCaEOx0Gm2TGHOTtuN3ThRoUF6qdNg737stNT
         Ou1MwgLjmxb1SwaJqWRkSELPODae5SxJwvJUqGWz7z/KboCp9oodSIrvrirnJM1qgG1n
         G6bELGU1sqYCMJ9uve+/XjO0j8wLMzRFq3pTFa6RxfsI5bYE6CpBtjqafjxKO6f9cA0r
         7U+3nX4/9XZNDSY9J0bsKr7hqco0w6pWO9tNZp/HuZRMovDWffPkLvQ0xCBIY9eX9Blx
         QoAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FHNN2mSJ3x+q9jH5PWO6X0bvixa+kSt0fmYoqYECsKk=;
        b=wSO9dSh+duPOsHmtkvxknpgGf5ZvQ33K4zJnA51wgZGrSiNaweAO+7sP0crYLg8HYz
         a9mVLulzrGiMs9oqFXJ/hnMtaKDSRIfTzjvBgfcWTR1sYuYIYwZEDb/5/jD49sul3s3v
         0+knl1bqdL+ioOLviX/OFPwEW+FGFWhSh4La+2XyNxuxjejfYlFHDSZ8zpOP1HsgXBd/
         yyLzxJqpm1tUQpT52hRcsZ+RPC20NHLCbIlTyAmJTZZG21UNMZjCm3i0NgeyO70RHUfu
         KTTtvStZ5ZZbSa/CP+QyFPO6NG4Lynw+0ocByUxHosEZJtqUxhXJNfdX51YblikaOgCR
         fZYg==
X-Gm-Message-State: AOAM533kmgBMdZP8H1d//6ijvE7IsSi6YdbciVKmSp9JgRH0XzfrC26A
        KHD79mLPIIsH6kKSLUjBCKpNKA==
X-Google-Smtp-Source: ABdhPJzkToHLpplQMOLHZSVka6ZBmiCriVZwm+PE6IeOGsKoEGIEhX1BAlK9J5qMuBzNWr0j1FJRCg==
X-Received: by 2002:a05:651c:50e:b0:249:89ef:101b with SMTP id o14-20020a05651c050e00b0024989ef101bmr3490721ljp.109.1649202352309;
        Tue, 05 Apr 2022 16:45:52 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id g11-20020ac24d8b000000b0044a3454c858sm1651897lfe.81.2022.04.05.16.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 16:45:51 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 0/4] drm/msm: properly add and remove internal bridges
Date:   Wed,  6 Apr 2022 02:45:47 +0300
Message-Id: <20220405234551.359453-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

While running the kernel with the mutex debugging enabled, I noticed the
warning reported in the first commit (that the bridge's hpd_mutex is
unitialized). Additional research revealed that we do not add and remove
internal drm_bridges in the msm drm driver. Fix this now.

Dmitry Baryshkov (4):
  drm/msm/hdmi: properly add and remove created bridges
  drm/msm/dsi: properly add and remove created bridges
  drm/msm/dp: properly add and remove created bridges
  drm/msm: unregister all internal bridges

 drivers/gpu/drm/msm/dp/dp_drm.c        | 5 +++++
 drivers/gpu/drm/msm/dsi/dsi_manager.c  | 3 +++
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 3 +++
 drivers/gpu/drm/msm/msm_drv.c          | 3 +++
 4 files changed, 14 insertions(+)

-- 
2.35.1

