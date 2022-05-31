Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FF7553987B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 May 2022 23:13:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347891AbiEaVNp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 May 2022 17:13:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346313AbiEaVNp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 May 2022 17:13:45 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBED736B75
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 May 2022 14:13:43 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id f9so29134662ejc.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 May 2022 14:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2D0n0MD9FVM5CduT1NCFZoyK1Wf+YfR32ZwltpKGpW0=;
        b=ZQT68xf2h4yPB1aO3z6MMCxjgrGQxzK6GsAwKC4AbtmM7jt7hPu9NP/5/38W/CoGs4
         /U426ZyODXRJ/hIK1zizXSQUiCeTA65NiXm2tba9pIlaxq1ArpOmj55sVibamQlHpil1
         HXArJ8lpnCJ5gJjSUw7JSWNWLGFhmor2Mb+W4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2D0n0MD9FVM5CduT1NCFZoyK1Wf+YfR32ZwltpKGpW0=;
        b=suJXUn0qOwsewoF7YiAuEMQR8WHDJtq2lUeRgSmVRAfnRMBSE7nQUVrLUMUIO40cFD
         CCt4fF/O7Ar4Wt0VotUexEL4YsSfIkisS8Q3gbVixosFQNF2qhYcNqe566CMqS3pJE0I
         yqRsgHA8qFGFXEB0LwiGxdKXkCk1G5Zzy9CQOesqNBK6ym4QMK71AOoEi/njK368eDvl
         37hA4CmKvAqvWhHo4JaPye0RbpiYADjGtMxf+0tSgmWl698MYpU6lT5T+efiuOkunR2L
         cpgmAZ6RE0JogTzkTphm7YwH6U3ZoNGfTOolplpqcww0PUw02NU5uU1CtTiqLceeUIEN
         +sMA==
X-Gm-Message-State: AOAM533ox4Bw7O+SSgZwfkOV6bbNjL6zsHhh32I4Q6Jw/Fv9fyG7BkIP
        nDyDwGaeP7JCgFVSc6JIxaAWoSmt7iBi47Zf
X-Google-Smtp-Source: ABdhPJzzZz4kRiZ1mtTrqtDbMYC69l+JTG5UgAvLrOXVTEfYA9MGJEikmQt9UIVWJFwJYthz5bPcew==
X-Received: by 2002:a17:907:972a:b0:6f4:f456:50a7 with SMTP id jg42-20020a170907972a00b006f4f45650a7mr54274035ejc.431.1654031622298;
        Tue, 31 May 2022 14:13:42 -0700 (PDT)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id d21-20020a170906641500b006febce7081esm5415052ejm.177.2022.05.31.14.13.41
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 May 2022 14:13:41 -0700 (PDT)
Received: by mail-wm1-f54.google.com with SMTP id f23-20020a7bcc17000000b003972dda143eso1924368wmh.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 May 2022 14:13:41 -0700 (PDT)
X-Received: by 2002:a05:600c:3d8e:b0:397:73e3:8c83 with SMTP id
 bi14-20020a05600c3d8e00b0039773e38c83mr25043368wmb.29.1654031205884; Tue, 31
 May 2022 14:06:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220510192944.2408515-1-dianders@chromium.org>
 <20220510122726.v3.3.Iba4b9bf6c7a1ee5ea2835ad7bd5eaf84d7688520@changeid>
 <20220521091751.opeiqbmc5c2okdq6@houat> <CAD=FV=Wea0LT5umK4Xg87cDikim+dSuyLndfydO3_DnTujZr9Q@mail.gmail.com>
In-Reply-To: <CAD=FV=Wea0LT5umK4Xg87cDikim+dSuyLndfydO3_DnTujZr9Q@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 31 May 2022 14:06:34 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XqJuPHxm7HYMvyHBL_zC-BBA_f0MBsZX-jHt7Pk9ngsQ@mail.gmail.com>
Message-ID: <CAD=FV=XqJuPHxm7HYMvyHBL_zC-BBA_f0MBsZX-jHt7Pk9ngsQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] drm/bridge: Add devm_drm_bridge_add()
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Philip Chen <philipchen@chromium.org>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        Robert Foss <robert.foss@linaro.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
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

Maxime,

On Mon, May 23, 2022 at 10:00 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Sat, May 21, 2022 at 2:17 AM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > Hi,
> >
> > On Tue, May 10, 2022 at 12:29:43PM -0700, Douglas Anderson wrote:
> > > This adds a devm managed version of drm_bridge_add(). Like other
> > > "devm" function listed in drm_bridge.h, this function takes an
> > > explicit "dev" to use for the lifetime management. A few notes:
> > > * In general we have a "struct device" for bridges that makes a good
> > >   candidate for where the lifetime matches exactly what we want.
> > > * The "bridge->dev->dev" device appears to be the encoder
> > >   device. That's not the right device to use for lifetime management.
> > >
> > > Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >
> > If we are to introduce more managed helpers, I think it'd be wiser to
> > introduce them as DRM-managed, and not device managed.
> >
> > Otherwise, you'll end up in a weird state when a device has been removed
> > but the DRM device is still around.
>
> I'm kinda confused. In this case there is no DRM device for the bridge
> and, as per my CL description, "bridge-dev->dev" appears to be the
> encoder device. I wasn't personally involved in discussions about it,
> but I was under the impression that this was expected / normal. Thus
> we can't make this DRM-managed.

Since I didn't hear a reply, I'll assume that my response addressed
your concerns. Assuming I get reviews for the other two patches in
this series I'll plan to land this with Dmitry's review.

-Doug
