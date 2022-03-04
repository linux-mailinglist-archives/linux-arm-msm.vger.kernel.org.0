Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EC5A4CDFE9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Mar 2022 22:49:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229716AbiCDVub (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Mar 2022 16:50:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbiCDVub (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Mar 2022 16:50:31 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEB851AAA74
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Mar 2022 13:49:42 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id y2so7754352edc.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Mar 2022 13:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gorolFJ2WIFQvAsoxOSrO8YEN0k5n1TryFpMGW1zZQQ=;
        b=LzsQ5rUYvvNub8x9l9kvDaWf7K77rlY+iRkn5dlD+82ZPl7ZCGrmcqBTtvNe+X0bPW
         MXRTMoQCl8ndHSQ6jy2WO/qD7mm7dVBag6oQqBnicr4/Dj55BzR195+oqLqUf8RbLZob
         PzkGqmSuP2Iou/Cr3Jb7zTgkEP2cvx8IU6iZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gorolFJ2WIFQvAsoxOSrO8YEN0k5n1TryFpMGW1zZQQ=;
        b=OEC0pZrZyoG/Ba7GPRo1z4DdG5R31/T84pG7BGHW7BTE/NB7kxp6DLyYZKkWATbV6K
         +7TvV21TJlXyDvHkRbHXwJnKyXWMEJPi2G6dOwV/FbMTWbRHH0OYIigrsgBiQ9V4xXzj
         6AOifszOWQcp42wylZ18xdEDikETQQUnwc6rHwBUfSQ54rGftMb3xgQF6qbKaubXNUUz
         PHCrSAL5hC6QOelLzAk/tpMe45JPk9a+y6n1e6pU+fA2IIfYDiyT2+BP6I90Pn8i8h6N
         jhVhF87H1VxLakk8/hEJVZgCKD8jAP6lSEQZ8UzEEjpRDw6g9iufxQCLWBB1nGe289CQ
         KzXA==
X-Gm-Message-State: AOAM531tcbbZFPy1YcibUmtrUq4LQ457zmNIqMZE6Tcid5bLCeypAsIW
        ctBoR+9WchCKzfJ3kUdxz52hF5qRtdOGf5Ib
X-Google-Smtp-Source: ABdhPJzDEBTBOxpdS9lGcSbevvKtY/g28fyjZ3J24tYdTM2BMy4ldElCipd4zT4BuSk4scGBCdriTQ==
X-Received: by 2002:a05:6402:1435:b0:410:d2e1:e6dc with SMTP id c21-20020a056402143500b00410d2e1e6dcmr548713edx.138.1646430581030;
        Fri, 04 Mar 2022 13:49:41 -0800 (PST)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com. [209.85.128.53])
        by smtp.gmail.com with ESMTPSA id sb31-20020a1709076d9f00b006ceb969822esm2148085ejc.76.2022.03.04.13.49.40
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Mar 2022 13:49:40 -0800 (PST)
Received: by mail-wm1-f53.google.com with SMTP id l10so1916652wmb.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Mar 2022 13:49:40 -0800 (PST)
X-Received: by 2002:a05:600c:1d08:b0:381:6eda:67d1 with SMTP id
 l8-20020a05600c1d0800b003816eda67d1mr9758221wms.88.1646430579829; Fri, 04 Mar
 2022 13:49:39 -0800 (PST)
MIME-Version: 1.0
References: <1646300401-9063-1-git-send-email-quic_vpolimer@quicinc.com>
 <1646300401-9063-5-git-send-email-quic_vpolimer@quicinc.com>
 <CAA8EJpqkK8q7g8q56rfiOO22ykxgycJTpSJKHuhcqGk05nsVzA@mail.gmail.com>
 <CAE-0n53jGQcn=NThrrW92NL-cry8yrFErdSYTHHEHWW48b3xbg@mail.gmail.com> <CAA8EJpoEpn2RPByeDkaGPUX+OC7tvbEw4k78Gd+RKs02jpzG1w@mail.gmail.com>
In-Reply-To: <CAA8EJpoEpn2RPByeDkaGPUX+OC7tvbEw4k78Gd+RKs02jpzG1w@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 4 Mar 2022 13:49:27 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WZUSuNa0Ei_0ByjHRdsJ7smhD+uVghs28NzNGvGp0LwQ@mail.gmail.com>
Message-ID: <CAD=FV=WZUSuNa0Ei_0ByjHRdsJ7smhD+uVghs28NzNGvGp0LwQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] arm64/dts/qcom/sm8250: remove assigned-clock-rate
 property for mdp clk
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>, quic_kalyant@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Mar 3, 2022 at 4:16 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Fri, 4 Mar 2022 at 02:56, Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Quoting Dmitry Baryshkov (2022-03-03 15:50:50)
> > > On Thu, 3 Mar 2022 at 12:40, Vinod Polimera <quic_vpolimer@quicinc.com> wrote:
> > > >
> > > > Kernel clock driver assumes that initial rate is the
> > > > max rate for that clock and was not allowing it to scale
> > > > beyond the assigned clock value.
> > > >
> > > > Drop the assigned clock rate property and vote on the mdp clock as per
> > > > calculated value during the usecase.
> > > >
> > > > Fixes: 7c1dffd471("arm64: dts: qcom: sm8250.dtsi: add display system nodes")
> > >
> > > Please remove the Fixes tags from all commits. Otherwise the patches
> > > might be picked up into earlier kernels, which do not have a patch
> > > adding a vote on the MDP clock.
> >
> > What patch is that? The Fixes tag could point to that commit.
>
> Please correct me if I'm wrong.
> Currently the dtsi enforces bumping the MDP clock when the mdss device
> is being probed and when the dpu device is being probed.
> Later during the DPU lifetime the core_perf would change the clock's
> rate as it sees fit according to the CRTC requirements.

"Currently" means _before_ ${SUBJECT} patch lands, right? Since
${SUBJECT} patch is removing the bump to max.


> However it would happen only when the during the
> dpu_crtc_atomic_flush(), before we call this function, the MDP clock
> is left in the undetermined state. The power rails controlled by the
> opp table are left in the undetermined state.
>
> I suppose that during the dpu_bind we should bump the clock to the max
> possible freq and let dpu_core_perf handle it afterwards.

Definitely feels like seeing the clock to something predictable during
the initial probe makes sense. If it's just for the initial probe then
setting it to max (based on the opp table) seems fine. I think an
earlier version of this series set it to max every time we did runtime
resume. We'd have to have a good reason to do that.

-Doug
