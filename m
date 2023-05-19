Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D07A5709B92
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 May 2023 17:49:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230459AbjESPtm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 May 2023 11:49:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230268AbjESPtm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 May 2023 11:49:42 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2CE2128
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 08:49:40 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2af16426065so25596461fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 08:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684511379; x=1687103379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=etm0lGlferaZBiu/m/R8IoSiZbBr1p0Ve2cEXO9P+d8=;
        b=x8LjhB6xV2Gj3OFH4jaZP6gUtckhUvcOYS9pHNHfPL61gKRIv1BAYr2sxa3VccvZD5
         An2mB8Vj7r+DYW2ca74/rS99Ezpw3La8fUHpz8VVRVhKG7aTG3d0woWzKylEJO1AELHy
         T6wKlkMybmccdH9j3QA/eTiFmA3cMw93Ym/EhXl4QwWJTPZyI07ifqrimYHjWf8XG734
         x26Q3+qSmuTBUcwe3hJZcsCZVLl1JQNKw9D7cT3WSkriH9FxnwaEVv33A7IIg+MtrDra
         LqD4iK4B7uqKyGLcB+ygv3a6uA08vV5iG0sQ3W5+kiYTLsmmqBynjaZZhdbHFJ4YipSD
         FDUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684511379; x=1687103379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=etm0lGlferaZBiu/m/R8IoSiZbBr1p0Ve2cEXO9P+d8=;
        b=KD1jSIpZyKUj2zh2sgPPuUi2Bc2d66RdKo1420Lw59VE4GLhgW1cJv4tp28AFxwoEv
         8gAKN7ee4RPIb81pB70qNir4chTWEKMHa/6fbgcf3xMVLgUCW1XVShjjaz/VI9PQM7x7
         mmGwHnaM7QKYnpExLV14A+R2/e+OGQEz7N/o75QQa8A4EjgHQ8kKJGAPaqekwCGj9XIC
         R4/KXMRYJmh+5HYL+3BWV+LvN76wDoznt/aQrw1dEbTozaXLBlz48wZdHNymK7gTBayI
         sSWkhOwEwXh/ra5Nve4RJrLqNZEDImVLasLRgFmRmMrk1cWtsoBPEq6AcZPbwO8W2LRS
         LPHg==
X-Gm-Message-State: AC+VfDxBcwehTYB4Pu5OGgmDfoW2iEaylpkBbbIa7uItEj1wsOrjE1JV
        iFxIXcM+EXwhBEkPvXadLSI1iQIAFTueZjO5BMg=
X-Google-Smtp-Source: ACHHUZ75pz5tZfDvLgjAVqnnC4tOhnfAgvtWOyj7YnyKWM8M8h8lZ9SLgfBikSAxL9c6aN1LICZbzA==
X-Received: by 2002:a2e:960a:0:b0:2ac:7ffb:6bda with SMTP id v10-20020a2e960a000000b002ac7ffb6bdamr908462ljh.2.1684511379018;
        Fri, 19 May 2023 08:49:39 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d22-20020a2e96d6000000b002ab59a09d75sm873333ljj.120.2023.05.19.08.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 08:49:38 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 0/4] drm/msm: move resource allocation to the _probe  function
Date:   Fri, 19 May 2023 18:49:34 +0300
Message-Id: <20230519154938.3929839-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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

This patchset was left untouched for almost a year. Let's reiterate it
in attempt to solve the long-standing issue.

As discussed several times on IRC, move display subdriver resource
allocation from kms_init to probe time to let it bail early.

Changes since v1:
- Dropped the applied patch
- Picked in the patch to pass msm_kms pointer via msm_drv_probe()

Dmitry Baryshkov (4):
  drm/msm: allow passing struct msm_kms to msm_drv_probe()
  drm/msm/dpu: move resource allocation to the _probe function
  drm/msm/mdp4: move resource allocation to the _probe function
  drm/msm/mdp5: move resource allocation to the _probe function

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  64 +++++++-------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 107 +++++++++++------------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 100 ++++++++++-----------
 drivers/gpu/drm/msm/msm_drv.c            |   6 +-
 drivers/gpu/drm/msm/msm_drv.h            |   3 +-
 5 files changed, 132 insertions(+), 148 deletions(-)

-- 
2.39.2

