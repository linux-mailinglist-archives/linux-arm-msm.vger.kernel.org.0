Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C248158281B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jul 2022 15:59:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231266AbiG0N7Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jul 2022 09:59:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233309AbiG0N7H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jul 2022 09:59:07 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F186239BA5
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Jul 2022 06:59:05 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id o1so13277662qkg.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Jul 2022 06:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VL9RxAlrlCWPRlbOT8q7ce/Z6YeW18HbrwcrpBQP3qw=;
        b=Pla9aOWUf7VME7IpoDRTTvu1DhvIABgH4b2rNbAEqnNyPiTAg66fOXhrPMMHoWxUq9
         j+OXy77yp0dFb5ts+mD6P4lfG4iNWTJOtTWZkl/kZHqivrcDjxSwVv/IdMsoe8TdMlwZ
         Te1VrsyBUjmT3BrOE1p12zdzUJa5TADZy+MqmvFqjWDxsCWMRlakO4upe4kw4V1Sx/G1
         CALzIDXwocuP8F4nXFEApXBb2BtGAkphdkNp5GVdAL96jrvx+R28GhnOqhTBP9QaPeau
         JR23ro+cVg60tEa53cnJE+WxUKkczKwA7vHx3+aEUV41UewN09MSWAHvZaJlQ/pE/Ix4
         qqBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VL9RxAlrlCWPRlbOT8q7ce/Z6YeW18HbrwcrpBQP3qw=;
        b=buDw/95rci+cSQ/YsMZeheFm9+JgtUW165j10xduR1mhZpqYdpJnqbc5eW/iSdxwro
         WvYqddgt+sQnh+MFlVhC80DvMkTtlL7hlIUk++GIP/oilTI3aWPLWNMyKpO/paFKwYVZ
         xyDuC/mE17eV7hY03HSXh+4uYjedO0ZF3U1p5CSUs6oUUS2bZAx50z5pmQM5vdvBjrK0
         zUziGd6nq9iuyx7+e8UvfTQwD/35gBhAMoCjfpQ3twb5MrABooE0CQ9eRYhoVOt5Qte3
         +OoIgEnrMqwzlbqE/qeziN1m96/ndygzyuQdQkDlCACca9XnSJ22m/RcFVWjLLhxIYn+
         3mMg==
X-Gm-Message-State: AJIora+AMMCV+fYcTDFo52Uf+N8BSf2RcOd2a8hU3vKgM8cEglJZETVE
        JmNMvKLrZF/t9EON+WXqERIhxTe3g/FC4RuHaRV7oA==
X-Google-Smtp-Source: AGRyM1tzZoro6GxmvJC6SIRF21uAIipGsfUkIUIInp4yja7tz6w/4VkQMK/Pw1QkZTbZIpbA1+WkpSQc+eqAzbr8zZI=
X-Received: by 2002:a05:620a:2408:b0:6b6:2df3:d18b with SMTP id
 d8-20020a05620a240800b006b62df3d18bmr15960355qkn.203.1658930345047; Wed, 27
 Jul 2022 06:59:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220725174810.1.If1f94fbbdb7c1d0fb3961de61483a851ad1971a7@changeid>
 <661fa514-cd37-e062-3294-c844b7f0b894@quicinc.com> <CAD=FV=UHhfLn+S8F60EPoC0ip6YzmrihfTz=KmmauXHCxof2QQ@mail.gmail.com>
In-Reply-To: <CAD=FV=UHhfLn+S8F60EPoC0ip6YzmrihfTz=KmmauXHCxof2QQ@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 27 Jul 2022 16:58:54 +0300
Message-ID: <CAA8EJppHr7GjcvqRqXAgjw9mf+ObzCi58-VYSdO_JMfk1-4ifA@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH] drm/msm/dsi: Don't set a load before
 disabling a regulator
To:     Doug Anderson <dianders@chromium.org>
Cc:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>,
        freedreno <freedreno@lists.freedesktop.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        David Airlie <airlied@linux.ie>,
        Rajeev Nandan <quic_rajeevny@quicinc.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Sean Paul <sean@poorly.run>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 27 Jul 2022 at 16:57, Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Tue, Jul 26, 2022 at 4:53 PM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >
> > On 7/25/2022 5:49 PM, Douglas Anderson wrote:
> > > As of commit 5451781dadf8 ("regulator: core: Only count load for
> > > enabled consumers"), a load isn't counted for a disabled
> > > regulator. That means all the code in the DSI driver to specify and
> > > set loads before disabling a regulator is not actually doing anything
> > > useful. Let's remove it.
> > >
> > > It should be noted that all of the loads set that were being specified
> > > were pointless noise anyway. The only use for this number is to pick
> > > between low power and high power modes of regulators. Regulators
> > > appear to do this changeover at loads on the order of 10000 uA. You
> > > would a lot of clients of the same rail for that 100 uA number to
> >
> > I guess you meant "you would need a lot of clients"
>
> Yeah, sorry. :( I'll fix it up if I need a v3.
>
>
> > > @@ -259,15 +259,7 @@ static inline struct msm_dsi_host *to_msm_dsi_host(struct mipi_dsi_host *host)
> > >   static void dsi_host_regulator_disable(struct msm_dsi_host *msm_host)
> > >   {
> > It seems like now we can drop this function dsi_host_regulator_disable()
> > entirely and just call regulator_bulk_disable() ?
>
> Sure, if you want. One could still argue that it provides a tiny bit
> of abstraction and avoids the caller from having to know where to find
> the number of regulators and all that, but I can go either way. Is
> this worth a v3, do you think? If so, I might tack it on at the end of
> the series.

I'd say, drop it. Having extra single-call wrappers doesn't seem to add a lot.

>
> Note that I say "v3" because I actually included this patch in a
> larger series and called that series "v2" [1].
>
>
> [1] https://lore.kernel.org/r/20220726173824.1166873-1-dianders@chromium.org



-- 
With best wishes
Dmitry
