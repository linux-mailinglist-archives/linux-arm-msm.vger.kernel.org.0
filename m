Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CF686CCD7B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Mar 2023 00:38:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229750AbjC1Wic (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Mar 2023 18:38:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229811AbjC1Wi0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Mar 2023 18:38:26 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12DFA2728
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 15:38:15 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id s20so14187541ljp.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 15:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680043094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8uJ+dREdoTJrUO/jV2t+HGD1km8rKwGduSmzZBjBU7g=;
        b=D2ECxZSeCKcuEvhongZrmzkPveDQF4kcPot17cg0PKP8Oe9v1TXMjkysUxXvirw58E
         Y4z0vwOZXFHlRZHvvHSDEBK2bnpGDJ1qXxrCzHPan0WXYcyqnolNZPnfGcVVBO3QYRaV
         XD9Q/53oyXNoABLaeYxBuvz+Q+gpOUDpzOggu205Uomy8DzbkAYtb0pkpM2NmxsXyzxR
         4Du3UYAdVMVfZWLUHtelQ25Ia0Dyueu65pfTZNVWgXJbRoRLkLsVSfTiIvCBH3Fbl80M
         8Y4arARf6kFczQFSBihSefxDoB0HXdGj70Y+fZ6/9g1FHbIPO6Y/RMk5s8Z9QIv4noYI
         UMcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680043094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8uJ+dREdoTJrUO/jV2t+HGD1km8rKwGduSmzZBjBU7g=;
        b=pBA6ej0rvV1ETVjcpUwoI4eZ5Znj/nzkSdnQPccG5fjit6hSidHGCJw5PXTBYm7vpM
         fwDdPQjKFBN2kKo+BVkqIs3TMSdJVkMI+oSAj/FhTTIE1STuxcXk/OwxBcdEtCDbtsfS
         vNoY3VPOouvT1iwCwRsvAmMOZGlgd+ldMouqHZXOQIUJeUC4lLdFzDphoMM6NCtH3N4R
         f6BHzHj38V9lPxByMjeiK3TKje/AaIRmAx7q8GKIomIZX01T5zREBwuZwu1GNDVWlZ2v
         y6vl0LIGiqqH4odW+I/E9YxtrNaTNUYEoKA5z9rH/a00xeN7auJ8rQ8MlNCAhtom4eZa
         H0Ow==
X-Gm-Message-State: AAQBX9eOj5+FBK3uHiXn4NVh485RYd0gYbKBQLfUZtGRKJGMjYVkrSXC
        iEZwCpMbXrUa7svDilznaYXwRw==
X-Google-Smtp-Source: AKy350YFBAq4dymHWHmkybxynzGNIcJh1mPRco8Jz4A0vFkG6OeccjLzq8XYc0Dwn8j6VAfFKQptBw==
X-Received: by 2002:a05:651c:d0:b0:29b:b01e:aa68 with SMTP id 16-20020a05651c00d000b0029bb01eaa68mr5645839ljr.40.1680043094640;
        Tue, 28 Mar 2023 15:38:14 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id t22-20020a2e9d16000000b002934d555783sm5199522lji.6.2023.03.28.15.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 15:38:14 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Avoid rounding down to zero jiffies
Date:   Wed, 29 Mar 2023 01:38:01 +0300
Message-Id: <168004255459.1060915.15692339879242886666.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230324220013.191795-1-robdclark@gmail.com>
References: <20230324220013.191795-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Fri, 24 Mar 2023 15:00:13 -0700, Rob Clark wrote:
> If userspace asked for a timeout greater than zero, but less than a
> jiffy, they clearly weren't planning on spinning.  So it is better
> to round up to one.
> 
> This fixes an issue with supertuxkart that was (for some reason)
> spinning on a gl sync with 1ms timeout.  CPU time for a demo lap
> drops from:
> 
> [...]

Applied, thanks!

[1/1] drm/msm: Avoid rounding down to zero jiffies
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a5c5593477b0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
