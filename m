Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71A2E7704CC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Aug 2023 17:33:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229679AbjHDPd2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Aug 2023 11:33:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229976AbjHDPdZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Aug 2023 11:33:25 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4946349D7
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Aug 2023 08:33:23 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4fe4762173bso3793666e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Aug 2023 08:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691163201; x=1691768001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X2lDqiwz35BQibene2FfD8lrq9i3EOhYkHMGMZsm/j4=;
        b=oMchbnnfu/8fyfd0LvESvGZ4gXeW+1J+fm5Yhsa8GUoM8EIDXYMJ5WGaIXYKGuiorV
         ixEbrUc7Rt2pHKtsK79uHYWPhQSeJ/hw3fMsqd98zlq8PxYcWuQ9IGSxIpAlIYcOTRf4
         VFnPB1pBw5yYnVnNSdS+6KudIL//HURVDuVZbERy/RkCYaAthVw/kv8k4GE1OVM7DgZ3
         EBZpQ4JDhNHh+YINlNwUxs0rWWIy95gXdf7fdGePCHJQ7MiYId7qBmsarMG1vm16eqH/
         aDUcyYsbM5VZJxFH7ESkrraV2qr1+okccYDDINHNtwhjjNXWhDzufEqD54ZXQQ/bAhFp
         X66g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691163201; x=1691768001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X2lDqiwz35BQibene2FfD8lrq9i3EOhYkHMGMZsm/j4=;
        b=LLZY7q8hzJsPXuJ2NU8v1A0/cm9B6zd1cmabw+TIVhY6s7d0MOUCHY11yUFzwKAP3Q
         2uUnqENe5VbAG2N2t02xDkDFHLBPwo19qzdGfnqH/jYVjNiGWNfh0yVuPUJ0uqzxuoDF
         FHgJ+KmsxX4ByQqJzdlWA565OfMkS1vIZY3Z+UnTWeYyFQMBP6FBK/ZuwanX3TPMTuJq
         BwlL/GwfzYd5FvgZFbpl/rzO0PAvKc6EQX2b/HjwoQue5tokNL2IyeXVP7kygUBTgGam
         PWpTS7+NbDitppQXOWocvBEu1Y2UoDeFagA1RplDU3ZQZ525zOru+GF+lfr4LmfjlBEI
         CAZA==
X-Gm-Message-State: AOJu0YwT5bzfG27cucEi6Iiml6ouU6lKtD7j6jl/9Cis4N1hzSTJQjDb
        oLGDRGhcvWrU/nIhagaZ9+XrnQ==
X-Google-Smtp-Source: AGHT+IGow14D3i6LCW/akM1kEPHox7qVuyqMgXZd3Gf68lKDr4B22u2NXiK2kEbqvGaFMdxoaCXyaw==
X-Received: by 2002:ac2:465a:0:b0:4fb:cabd:2a66 with SMTP id s26-20020ac2465a000000b004fbcabd2a66mr1179171lfo.21.1691163201016;
        Fri, 04 Aug 2023 08:33:21 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id w12-20020a05651204cc00b004f873ca4139sm411874lfq.71.2023.08.04.08.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 08:33:20 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     DRI Development <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        dorum@noisolation.com, Daniel Vetter <daniel.vetter@intel.com>
Subject: Re: [PATCH] drm/msm/mdp5: Don't leak some plane state
Date:   Fri,  4 Aug 2023 18:33:15 +0300
Message-Id: <169116308156.148471.11222648448148490850.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230803204521.928582-1-daniel.vetter@ffwll.ch>
References: <20230803204521.928582-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Thu, 03 Aug 2023 22:45:21 +0200, Daniel Vetter wrote:
> Apparently no one noticed that mdp5 plane states leak like a sieve
> ever since we introduced plane_state->commit refcount a few years ago
> in 21a01abbe32a ("drm/atomic: Fix freeing connector/plane state too
> early by tracking commits, v3.")
> 
> Fix it by using the right helpers.
> 
> [...]

Applied, thanks!

[1/1] drm/msm/mdp5: Don't leak some plane state
      https://gitlab.freedesktop.org/lumag/msm/-/commit/fd0ad3b2365c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
