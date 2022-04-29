Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3469F51459E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Apr 2022 11:44:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356647AbiD2Jr6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Apr 2022 05:47:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244541AbiD2Jr5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Apr 2022 05:47:57 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55C89BF514
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 02:44:40 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-2f16645872fso79489417b3.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 02:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WYCGVCEJksGGCdRlgIqjR2lhvuooSLq5edP8oO1Q4Gc=;
        b=qXTCKdPPbH69hhnz+M+TPUAGCmNzy6PuGKgWs0JHwB2aoBg7hrjTPaMZoAoIQDoWSs
         0lmnwzpo47pGHqJUzmoSLgH0xxs4vpYqKs5VaNkLhIjt4xe9NBaCxYnD5rZfSLgbIvMm
         zgsM0ilvnK84KcGPdNndif0vtYd6QRYkZJD3a2KzeKri4hyAji+GDZtusBC2mSHRCr6p
         SHFXwtn+sHZPaLC6Fb5Q0NESuoOi44uDggQGTZz3h/jeU4OWkJiRd3uhm2tuN+g2bh9f
         3Z9w0ZVNZJEs1+L18TcczTi8dfVqr4yn0gF8OPbL3O5iS7U8siW5kSCj9kKn8nzEQQc7
         3MkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WYCGVCEJksGGCdRlgIqjR2lhvuooSLq5edP8oO1Q4Gc=;
        b=uZQ2IREgLuKC4heA5A192B3ZSW9kE+2+Cbq1wYTGpvl28wj0omPGQkuezzsfPp+6or
         gzzCm4sWzqBWesVYmIt79WplBxlnJY3cfva7v9CBnJcOsMPWuINjGoRnvckmYMWFHGs/
         P/5Tsds0ag89jJ9Tw5xOyfaxysdv7Wu35RloB1Zzhqj0Zbv8oT6UalDJ/HT7N9fj2iFv
         R8jaSeS79aiaNtfaOT3/n8DFLTGyz0Ex+PKqzJL7v9C717SWvg/So+xOC9zxJR6UsI/o
         YuFd/ReD/P8N1G+fI0G//C5sVOWa0U+XxfOdpT07Qa5w06priCuzKK0dtwf2Dd0ahGUH
         j06w==
X-Gm-Message-State: AOAM532mDwhhKpX1OoDqIkF5QKrEDB72+n1LljqC3c7F1LZzzoH8fs+0
        LiqOkfLvfUz2xMml9zGSUO1cdfmf+l2JgK9HqrOHGAbpbgg=
X-Google-Smtp-Source: ABdhPJynZzoVZwfjlCOF1/abA7cHNOUV/ui+HyQTclEHfZp0K+s8TqPA+IOfsxjsI1xMK2BMg4DLPDanu12s14nmOyg=
X-Received: by 2002:a81:5603:0:b0:2f8:3187:f37a with SMTP id
 k3-20020a815603000000b002f83187f37amr15645499ywb.255.1651225479645; Fri, 29
 Apr 2022 02:44:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220217055529.499829-1-dmitry.baryshkov@linaro.org>
 <20220217055529.499829-4-dmitry.baryshkov@linaro.org> <CAE-0n53wAqV3ttugY+VR_zxdZGZGjbitWOppk1zF-Rp-buiNaA@mail.gmail.com>
In-Reply-To: <CAE-0n53wAqV3ttugY+VR_zxdZGZGjbitWOppk1zF-Rp-buiNaA@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 29 Apr 2022 12:44:28 +0300
Message-ID: <CAA8EJpqCwe_mr60SpFNfK8rE84RoA4EzAaPw-rC-PGmdB99ytQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] drm/msm/dp: set stream_pixel rate directly
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 29 Apr 2022 at 04:20, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Dmitry Baryshkov (2022-02-16 21:55:27)
> > The only clock for which we set the rate is the "stream_pixel". Rather
> > than storing the rate and then setting it by looping over all the
> > clocks, set the clock rate directly.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Thanks! I think this series can be queued for 5.20 then (probably not
worth rushing it into 5.19)

-- 
With best wishes
Dmitry
