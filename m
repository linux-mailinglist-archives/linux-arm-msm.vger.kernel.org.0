Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A15651C152
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 May 2022 15:50:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237639AbiEENy1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 May 2022 09:54:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380101AbiEENx4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 May 2022 09:53:56 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1337058389
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 May 2022 06:50:11 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id bq30so7603734lfb.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 May 2022 06:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UpknYVo+DPBanWKhGXXYTya2awtDru7xqOaKjU/zIXs=;
        b=jYpTjc8C+5n8SykUBLJlcX5f4/GaOP6cofNjPFSWocIRskcsTJBKXn3aPUWYfj9ejM
         U0o0tNYhzJ24OB1Rfdisw6FWA/OiwTIjo1pVJyKqKIgw5KQ8503scj/bwx+0FoLZAsSU
         f8C2J/BFIz122GP0+cSOtixDfiIBQWM/5TqmXVTk6v8iv1477Lu1Ovh1EmQKvz8QQ4fA
         61mA+ykZrb+zZbseVcAbtUao6oxksh6pLzGGal+wb06aDuN7MPMuIS5aefWz3fIID0a7
         n+Lrr/z3RNnpg9plBf7SPpW/oQHW0y+Jp2HB0m8U7GDhig/z9d/z9j6TL3o+urvX28Pd
         rvsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UpknYVo+DPBanWKhGXXYTya2awtDru7xqOaKjU/zIXs=;
        b=ZT+jh4OPCguLUUUKjO6mizqCWgiGso9s0TDKvoa8T/rz2+hN+rYC7V4pzypnzg1MOE
         zQtuNFBPkISR9Yx2XqXKtA4tF2u/rK3DOuxnwvHRoM1uCz3YHk+3DUwjZuGWi1ZbQp97
         KgnSJKnF5Tg8SIO3I4z+b7ANjUUVwkJ5fmYJ0ol7KNBjcXAaRI/NT9KR5vL2z0jFOEfB
         bwsz3uqWpXNvkOtm7MZ64A2Ch0Rx+pIl3IUm5iKiUc2UUPomHOd/mM0UdDQD6ZPpGyHJ
         vyKq0VEBkVmH3WLGBHZVD5Os1wesymGpYK5couLr2obh3LhSVE+/4T9ALTuljfr7X0ER
         yp/g==
X-Gm-Message-State: AOAM532xoMQ4Clx/tOAEuPmTpR+yVokJSMoBaIKt0ZVDiltbamjBgfIF
        s9jPp03zdNxe65KSQmv7FfM6BiuNYG8Odg==
X-Google-Smtp-Source: ABdhPJxk+A+USoTrmmhDNbDbzaJg/sCHtmKZabpJS2NcPJFPHS1t7xOecFr/5FjS9oNdhmox/ahsPA==
X-Received: by 2002:a05:6512:158c:b0:473:9d87:aa23 with SMTP id bp12-20020a056512158c00b004739d87aa23mr12785524lfb.409.1651758609431;
        Thu, 05 May 2022 06:50:09 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c17-20020a2ea791000000b0024f3d1dae96sm210935ljf.30.2022.05.05.06.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 06:50:09 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 0/2] drm/msm/mpd4: get rid of struct mdp4_platform_config
Date:   Thu,  5 May 2022 16:50:06 +0300
Message-Id: <20220505135008.1351533-1-dmitry.baryshkov@linaro.org>
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

The struct mdp4_platform_config is a remnant from pre-DT times. It
serves no particular purpose nowadays. So let's get rid of it.

Dmitry Baryshkov (2):
  drm/msm/mdp4: move iommu_domain_alloc() call close to its usage
  drm/msm/mdp4: get rid of struct mdp4_platform_config

 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 29 ++++++++----------------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h |  6 -----
 2 files changed, 10 insertions(+), 25 deletions(-)

-- 
2.35.1

