Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61BF84F6507
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Apr 2022 18:27:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237404AbiDFQLh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Apr 2022 12:11:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237513AbiDFQLW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Apr 2022 12:11:22 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 492202241D3
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Apr 2022 21:01:31 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id e4so1244028oif.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Apr 2022 21:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=fIVejTEIid4k3Br38o3vOB4Nk9WqXrcCLUm7LB9wI3g=;
        b=IG5KZiqjlYqUD90FPrmnIgW+5KsruCkJ4uZoErUI/mKHOTGCUWeMFTYnc7WKctoNOP
         cYTd85rDYHam1mnYrEea4ubBLmeYxEsTtViLox71HIP/rXEZ7lIujl5B1vVbEX3a01el
         pfHVZE6Xtpql9NhpcOvG+eD92M4DdC2WqQQdc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=fIVejTEIid4k3Br38o3vOB4Nk9WqXrcCLUm7LB9wI3g=;
        b=whSKsIKQJ4FsWyTP2A4jP5v+SauzoYxdkiAjLFKRvD/HHdxTqHiwHXLGEPHK7JZGHH
         0RDJF+yvT/tUvCe58SIWDHuXA2s/QQbOHHEmd1yAwI4R5cz/tAbXA1bqn+EoGTX9W0AV
         JExqwl2bWmOsYsLB2yawkawg1Q0Bc4/RjghboswYovpsHni3WExBJQj/TFHc0EkrcKUo
         +zVk1RioECQI6Z5Xy5Eni46oQ8dlYGITwxSjweoD8t8x8Q5E3v7xVBlBiALOznYXmwuO
         xseQhPI7f6SmwvY2cZbVjunSqw19AI8aa7TrMkMDKXRpMU17oSleJ6i4gB061uXPT8u3
         FXZQ==
X-Gm-Message-State: AOAM533Bt4Va85UgPTePCS5pKwptwcpuGlNKKAPncLJwPqZJjxW3NE5X
        kMMq/opufNMsFwW6buBFzGG1+bUPyUK5tA/taBeopg==
X-Google-Smtp-Source: ABdhPJy4kKtuxcG2c6xjt9MqzFhHOds4NrTsKjmMV009Br4gwIA2ZK4qn18tizd30AhF8wyIdheSb6Saw6YHfHoaFNg=
X-Received: by 2002:aca:a9c8:0:b0:2da:45b6:b796 with SMTP id
 s191-20020acaa9c8000000b002da45b6b796mr2653100oie.193.1649217690556; Tue, 05
 Apr 2022 21:01:30 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 5 Apr 2022 21:01:30 -0700
MIME-Version: 1.0
In-Reply-To: <20220405235059.359738-3-dmitry.baryshkov@linaro.org>
References: <20220405235059.359738-1-dmitry.baryshkov@linaro.org> <20220405235059.359738-3-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 5 Apr 2022 21:01:30 -0700
Message-ID: <CAE-0n51ayjyfEdne_=R6FU-3+O91JiYz-GRg2C7jeXB_9HTiRA@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/msm: loop over encoders using drm_for_each_encoder()
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-04-05 16:50:58)
> Rather than manually looping over encoders array, use standard
> drm_for_each_encoder() macro.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
