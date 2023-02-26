Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35FAB6A2CBD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Feb 2023 01:15:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbjBZAPp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 Feb 2023 19:15:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbjBZAPp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 Feb 2023 19:15:45 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 358C91042E
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Feb 2023 16:15:44 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id n2so3916230lfb.12
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Feb 2023 16:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Grqh/4AoPdhazL6MpZGfQQg2Jt5JYM0bzl/+dktY5dw=;
        b=DS7ZpMlF5Ik4nba/RbyZB23Lz0FBFYDvyY+eDE+gM9Rn/bn6cLnpb5qh8KqN6iOb/R
         lCTBiWgw9uqkAxAGbpaS1ZYRnFmqHvRJgWTq2z8yZb0xNTtnUmtzpggqknFySmSvI7iH
         YdyXmB2xhd3sMAvN2/RGief0ZnQwpHdRpc1Fp5ycRUJ1Wp0uDgHmczLeBdM6+U3CO9tt
         0Qo89Fkw63SSAcD08jf0brF7LjnhPdMV1O+exyOY90O5GVmVtn4XNVUPRBIDT4B7O43f
         MKijjws1ClnBHLeekq2VDNAcF6s7NfmGoocp5et0aA3ClgVNZQMsMP+kfMdczK6cVuir
         yvDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Grqh/4AoPdhazL6MpZGfQQg2Jt5JYM0bzl/+dktY5dw=;
        b=d4W09rTHVST2ltm5fYJyGLwJsW9mg+HIoYHpaM20HlK3EcLeTz3owf28AloC0psJRN
         yypooRllRHljorrUFwbZ2iuasy4R5JYol2t1nETvlDVmKhRy48obHwn8mBfvhhYfopaP
         oYzlDAUPklY8nMQTeTqZ5cQZcDPFxRat57hiqAlXH4qnkTFb/PxdeKllpl41WvKkr4DT
         AcJljFeIVXwBc64+GRk74pv+Z0CG3cKXQmO/NvywNe6w/41p5p59cwbq8O/pad85nYyO
         2b9KsZYD5IqilZ6CHn0BCqyhgJSIBD4T3ql6LJDfp+vB0rMCvNeh3feMvFjG1ZinLP23
         cLKQ==
X-Gm-Message-State: AO0yUKVbcRMkfB7I399Ecsrm8hdc7nlaYy40UOzv6JJP6SWKvP+sAjgY
        REZehik9rchmsmrW+YS8D40vqg==
X-Google-Smtp-Source: AK7set84D+a6dBvLKpC3e3cAYiAOCQNOFFe3/gJzzZtj14ixvbmkoGmCwgs9JNq7d+ShRIqGblj0bg==
X-Received: by 2002:ac2:44d4:0:b0:4d8:8af4:3b2c with SMTP id d20-20020ac244d4000000b004d88af43b2cmr6410561lfm.68.1677370542439;
        Sat, 25 Feb 2023 16:15:42 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s16-20020ac25ff0000000b004cb3e97bff8sm356238lfg.284.2023.02.25.16.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Feb 2023 16:15:42 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 0/2] drm/msm: rework msm_parse_deps() and
Date:   Sun, 26 Feb 2023 02:15:39 +0200
Message-Id: <20230226001541.788023-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
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

As discusssed in the the review of [1], rework these two functions to
separate single point parser and provide clean error path.

Depenencies: [1]

[1] https://lore.kernel.org/all/20230215235048.1166484-1-robdclark@gmail.com

Changes since v1:
- Restored dumping of ring->id in trace_msm_gpu_submit (requested by Rob
  Clark)

Dmitry Baryshkov (2):
  drm/msm: drop unused ring variable in msm_ioctl_gem_submit()
  drm/msm: simplify msm_parse_deps() and msm_parse_post_deps()

 drivers/gpu/drm/msm/msm_gem_submit.c | 201 ++++++++++++++-------------
 1 file changed, 108 insertions(+), 93 deletions(-)

-- 
2.39.1

