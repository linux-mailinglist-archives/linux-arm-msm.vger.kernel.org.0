Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D51C5195FF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 May 2022 05:30:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239255AbiEDDeW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 May 2022 23:34:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344474AbiEDDeO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 May 2022 23:34:14 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5CC61BEBE
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 May 2022 20:30:39 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id k27so313145edk.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 May 2022 20:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Gs5Ounip899C5lOiAHgN9uTnUVGqEvAG7D7k08amNUU=;
        b=HDFCo6RgpG74US91ZvtFD01vc6SEfhs/hMctx67JvMAFtT8caBpUOb07SMOPDFS0II
         lKG7CSe5N/dGOVU0YUMpd6Bzw3Y2PQjCVndT1T0Se7+/0A7GGC7+l8AnScBLo4l5q1fF
         gX1/SoS2DdcwJcirjlMsLQNSS3z3H+2wAANvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Gs5Ounip899C5lOiAHgN9uTnUVGqEvAG7D7k08amNUU=;
        b=C9wSrXVx5JK2gpOP/xqXWQIWevjf3NKBPmNmGXNY4+0sSqUDJx5eBTJU1V0a808CLC
         omyuXAfE6F5XK0x1URIOAfiCZOmAz75YssJPsfP86+wtUswY9cd6ZNGG1NhhwO67D1lL
         0+/3WyHv0vWk16MqX4DFYXBtAOg1JhbGWRaARb3cAVbNefEj+IGtNNrBnBodbR3zUgA4
         /CS3nlcbw+9nghfwBHEAawUsjdEynOH8719GXLQ4CuzAhX2EG9A7RGPOwPyNhnUs7JYM
         Ynsq/kZ4qWUm7WY8extmTrGPxfU4am/J9HOw1xiPZK9kNEY8vryKqWfk26Nod2Wy0kIY
         yGJw==
X-Gm-Message-State: AOAM531PCUv90WuakGTs8LaJMgatbEnEzMdYlw3euledEOiz8b5x1Urt
        IDklba/HQ/fhr/rpF898nSmoR5b3wVfYRS0dITo=
X-Google-Smtp-Source: ABdhPJzBYRiD58FkUmI6IpEM6+er+E6GXaojX26YUoNimpXkpieYPgSAuf8zSLI+vHViU4Peu7Rldw==
X-Received: by 2002:a05:6402:2710:b0:427:d087:b with SMTP id y16-20020a056402271000b00427d087000bmr10954630edd.11.1651635038039;
        Tue, 03 May 2022 20:30:38 -0700 (PDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com. [209.85.221.42])
        by smtp.gmail.com with ESMTPSA id ia8-20020a170907a06800b006f3ef214da5sm5323049ejc.11.2022.05.03.20.30.36
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 May 2022 20:30:36 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id k2so265753wrd.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 May 2022 20:30:36 -0700 (PDT)
X-Received: by 2002:a5d:6d09:0:b0:20c:53a9:cc30 with SMTP id
 e9-20020a5d6d09000000b0020c53a9cc30mr13905399wrq.513.1651635035897; Tue, 03
 May 2022 20:30:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220502173338.1.I26eca1856f99e6160d30de6d50ecab60e6226354@changeid>
 <13819b2d-26f0-14f4-9cb9-affb6b18f13d@quicinc.com>
In-Reply-To: <13819b2d-26f0-14f4-9cb9-affb6b18f13d@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 3 May 2022 20:30:23 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VBqbhB03uPtnzYdRHhU-4TnX6RgDpHK27RUXY84esebw@mail.gmail.com>
Message-ID: <CAD=FV=VBqbhB03uPtnzYdRHhU-4TnX6RgDpHK27RUXY84esebw@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: socinfo: Add another ID for sc7180
To:     Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>, matvore@chromium.org,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, May 3, 2022 at 7:14 PM Sai Prakash Ranjan
<quic_saipraka@quicinc.com> wrote:
>
> Hi,
>
> On 5/3/2022 6:03 AM, Douglas Anderson wrote:
> > It appears the some sc7180 devices, like the one in my
> > sc7180-trogdor-homestar, report an ID of 407 instead of 425. Add
> > another ID into the list.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> >   drivers/soc/qcom/socinfo.c | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
> > index cee579a267a6..2ef1dc2a1dd3 100644
> > --- a/drivers/soc/qcom/socinfo.c
> > +++ b/drivers/soc/qcom/socinfo.c
> > @@ -318,6 +318,7 @@ static const struct soc_id soc_id[] = {
> >       { 396, "IPQ8071A" },
> >       { 402, "IPQ6018" },
> >       { 403, "IPQ6028" },
> > +     { 407, "SC7180" },
> >       { 421, "IPQ6000" },
> >       { 422, "IPQ6010" },
> >       { 425, "SC7180" },
>
> Hmm, this ID maps to SM6250 which is a mobile variant. Not sure we should
> use it for SC7180 which already has 425 ID assigned, perks of marketing :)

That's super weird. Any idea why my strongbad reports 407 then? Is it
a firmware bug, or someone misprogrammed something? What can we do to
make the CPU recognized in strongbad?

...and just for extra info, I believe strongbad actually has the
slightly faster version of sc7180. It has a higher GPU/CPU speed. In
some places I've heard it called sc7185, but in other places I've
heard it called just sc7180 with a faster clock speed...

-Doug
