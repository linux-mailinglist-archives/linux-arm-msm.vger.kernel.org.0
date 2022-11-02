Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06FDE616AAE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Nov 2022 18:28:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230179AbiKBR2m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Nov 2022 13:28:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230077AbiKBR2l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Nov 2022 13:28:41 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15E35BAD
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Nov 2022 10:28:40 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id k2so47251206ejr.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Nov 2022 10:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X2+9yxVt9jWEvW8G1POIGEGcQSupOLAIpJg0gweghVs=;
        b=EgGB89Zg2h2E8cHoQjjgPCz2n0IaFrtoRPxndhM06adDo28bUdZZyYjM7q7PGcAuCO
         qrK1/JRrMVIgQ54XSYURFj9EiicVAjN1F6gMP1c632DyLUMlyDJIn0yQ1+VaCn4KYaHU
         OW4PLBRpp/FdhTOokAVnaOpXhTYDriLrSphdI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X2+9yxVt9jWEvW8G1POIGEGcQSupOLAIpJg0gweghVs=;
        b=vuMGgiwp+SGf5Nm3ieZLvB0RLS5dHZL063jyLi5DCSi46JUwexFO04sJGcF6ouNRCw
         Tmpu2qRz+4a5EaLKx5HXLxdiOhkfbOH7Zg2f1BFVmUQDmUtI0s0FdezrdC0UnDVU2P3p
         t+F77nePhE9rWyYfmbc4hcmgMLD8OVFKzR9SVSxDzsWb1ufasMGfgNp9Mqf5F8TQupME
         s1GEdJDHR6mLom+izdkhYM7hX74oWVKU1DDb47zHNyZAEGS5T9iMTthwCeIrsKNwlkaT
         W2nFUGc9JqNVhI3Y8dIUPRWaF7dpeTLQz+jne1lZKxkuxKsILsjqazdcv2PjRprtE1GQ
         3hEg==
X-Gm-Message-State: ACrzQf1VAcN4kNoXWrb8zbA8qC9ZHxfP6jN4885P3urtpSf4LuDTGh65
        12KYzmcie6DME+dCBdZOv7kfAkrgWXadPlu6
X-Google-Smtp-Source: AMsMyM6q9CmwZ4EahGPZhgD1vp+mENqhgSKe61eXimM54Bp2Zj4+MIYn9qqA4hL+z4H7k1Guy56uIw==
X-Received: by 2002:a17:906:4717:b0:7ad:c606:349f with SMTP id y23-20020a170906471700b007adc606349fmr19297294ejq.214.1667410118418;
        Wed, 02 Nov 2022 10:28:38 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id f15-20020a50ee8f000000b00462e4de6891sm6094135edr.35.2022.11.02.10.28.36
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 10:28:37 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id r186-20020a1c44c3000000b003cf4d389c41so1736244wma.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Nov 2022 10:28:36 -0700 (PDT)
X-Received: by 2002:a05:600c:2212:b0:3cf:6068:3c40 with SMTP id
 z18-20020a05600c221200b003cf60683c40mr16617338wml.57.1667410116349; Wed, 02
 Nov 2022 10:28:36 -0700 (PDT)
MIME-Version: 1.0
References: <1667237245-24988-1-git-send-email-quic_khsieh@quicinc.com>
 <94b507e8-5b94-12ae-4c81-95f5d36279d5@linaro.org> <deb60200-5a37-ec77-9515-0c0c89022174@quicinc.com>
 <CAD=FV=X_fs_4JYcRvAwkU9mAafOten9WdyzPfSVWdAU=ZMo8zg@mail.gmail.com>
 <155e4171-187c-4ecf-5a9b-12f0c2207524@linaro.org> <CAD=FV=Wk5rBSq9Mx1GCO0QFYckKV9KUFKL36Ld7dQX1ypHVcYw@mail.gmail.com>
 <CAD=FV=XTOUjVAGFWZ6xTkcNOrCT1p73aU-=KJNYUOxsS-BQsyA@mail.gmail.com> <c5aedb31-3881-50e7-f747-e75b18c3f4b8@linaro.org>
In-Reply-To: <c5aedb31-3881-50e7-f747-e75b18c3f4b8@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 2 Nov 2022 10:28:22 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WPde5wVOGCKQYGuGwgCwRebox4FF0MgV_2pPCTsfo_UA@mail.gmail.com>
Message-ID: <CAD=FV=WPde5wVOGCKQYGuGwgCwRebox4FF0MgV_2pPCTsfo_UA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: remove limitation of link rate at 5.4G to
 support HBR3
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Kuogee Hsieh <quic_khsieh@quicinc.com>, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, vkoul@kernel.org,
        daniel@ffwll.ch, airlied@linux.ie, agross@kernel.org,
        quic_abhinavk@quicinc.com, quic_sbillaka@quicinc.com,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Nov 2, 2022 at 10:23 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> > 1. Someone figures out how to model this with the bridge chain and
> > then we only allow HBR3 if we detect we've got a TCPC that supports
> > it. This seems like the cleanest / best but feels like a long pole.
> > Not only have we been trying to get the TCPC-modeled-as-a-bridge stuff
> > landed for a long time but even when we do it we still don't have a
> > solution for how to communicate the number of lanes and other stuff
> > between the TCPC and the DP controller so we have to enrich the bridge
> > interface.
>
> I think we'd need some OOB interface. For example for DSI interfaces we
> have mipi_dsi_device struct to communicate such OOB data.
>
> Also take a note regarding data-lanes from my previous email.

Right, we can somehow communicate the max link rate through the bridge
chain to the DP controller in an OOB manner that would work.


> > 2. We add in a DT property to the display controller node that says
> > the max link rate for use on this board. This feels like a hack, but
> > maybe it's not too bad. Certainly it would be incredibly simple to
> > implement. Actually... ...one could argue that even if we later model
> > the TCPC as a bridge that this property would still be valid / useful!
> > You could certainly imagine that the SoC supports HBR3 and the TCPC
> > supports HBR3 but that the board routing between the SoC and the TCPC
> > is bad and only supports HBR2. In this case the only way out is
> > essentially a "board constraint" AKA a DT property in the DP
> > controller.
>
> We have been discussing similar topics with Abhinav. Krzysztof suggested
> using link-frequencies property to provide max and min values.

This sounds good to me and seems worth doing even if we eventually do #1.
