Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED8B94BC4C9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Feb 2022 03:23:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241094AbiBSCXR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Feb 2022 21:23:17 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:39932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240107AbiBSCXQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Feb 2022 21:23:16 -0500
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E40B25B2CF
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Feb 2022 18:22:58 -0800 (PST)
Received: by mail-qv1-xf2f.google.com with SMTP id c14so18328654qvl.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Feb 2022 18:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UAPX59R95iQoqcb29QNi0y25GZdCHmhAw3GFp0BvSug=;
        b=oAhv0YrAA95noECsF1VbXIg8i78c6RDiGTgt32Xgs2QfTWnOUwejdg56m7O6BuSfJt
         mBS1H8+U04XHHJjKtPH5fPXVc9RSuoogDbGZU9mTSLm+37/AHSpI/tyHAF6j1pr5Fmtd
         WWfA9NplFb2DarN8kpLrSHgcSx8jLmfgaFtkjCfvviErOXezqUlRTjIj6NO5mSCu7KjZ
         wRmauT3uYlTcJjwgUPzL1Lu7E2ZO1EnZYJcV+nM/y4tIBW7ckjbnyfnR3ezV8boSDE6r
         qoCr2Pyuq/l0EneuUB05TOM/u71/6DgjQSpTCYufy4JjRe0Gq/wawCT3eiXM9Z1LOP5e
         +64g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UAPX59R95iQoqcb29QNi0y25GZdCHmhAw3GFp0BvSug=;
        b=hX7i9We26pTVGjux/IBcOz40zcqf2wStGIVSkKx5jkR8WqEagoJc6kZDUZPGnaNiXS
         qwsRvVbb3d0Oe+RruOdz2r/DnH5W+OzaUS35uppXs3YbMOyxcpYQWIlbaLUnBxb08i4M
         8QJmQFAb+munTvtlQr4+6p+9odYM8IDgZa/99lqHGJuhkBZLJlNJq/8A7Ze+ZATEkZeZ
         dgU2tlUmR0sTfZpJx/wvDhykEu7PmfVXSFYaG50F6QPzCYH+kkU+7mkInn146qW4BM4/
         tdDE9sLBFAQeSrFM9SNKJFIc3YydBayhHhpXzWkmg4WG5Ws6NCtIxHGkL6rM/bXWwKxo
         thtQ==
X-Gm-Message-State: AOAM530zyMNk6nXCW10u/xCdmZ+08TeT/gXbC5IixOWzst4JF36UJwD4
        dTsYe/byYE5sqB0fr8p1Y5pMUgyHRBds9D2aVyhYfQ==
X-Google-Smtp-Source: ABdhPJzwxVrkef+NHwg4T52gU0d1zJda+hVFqEPfCpfPgZzWo0dNrJqWTDqoKAkziUUE2ntG8G4fFfSZOAAdOx63+sU=
X-Received: by 2002:ac8:5716:0:b0:2d6:4f00:6a76 with SMTP id
 22-20020ac85716000000b002d64f006a76mr9178340qtw.682.1645237377621; Fri, 18
 Feb 2022 18:22:57 -0800 (PST)
MIME-Version: 1.0
References: <20220211224006.1797846-1-dmitry.baryshkov@linaro.org>
 <20220211224006.1797846-5-dmitry.baryshkov@linaro.org> <572c0402-55da-077b-1809-3d1caf7ce743@quicinc.com>
 <b25d422e-cdd8-bcb9-1815-1d89f170d421@linaro.org> <CAE-0n51afuHURLHaZBa77H_n+cm4Tj1Du-rpLH-HsrkY5xQVJA@mail.gmail.com>
In-Reply-To: <CAE-0n51afuHURLHaZBa77H_n+cm4Tj1Du-rpLH-HsrkY5xQVJA@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 19 Feb 2022 05:22:46 +0300
Message-ID: <CAA8EJpobtpc5mB48g6K=+KaZQ-o8m_QTZr-dQvwz-9cEwiJ_Kg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 4/5] drm/msm/dp: replace dp_connector with drm_bridge_connector
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 19 Feb 2022 at 03:55, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Dmitry Baryshkov (2022-02-18 14:32:53)
> > On 19/02/2022 00:31, Kuogee Hsieh wrote:
> > >
> > > On 2/11/2022 2:40 PM, Dmitry Baryshkov wrote:
> > >> There is little point in having both connector and root bridge
> > >> implementation in the same driver. Move connector's functionality to the
> > >> bridge to let next bridge in chain to override it.
> > >>
> > >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >
> > > This patch break primary (edp) display
> > >
> > > -- right half of screen garbled
> > >
> > > -- screen shift vertically
> > >
> > > below are error messages seen --
> > >
> > > [   36.679216] panel-edp soc@0:edp_panel: No display modes
> > > [   36.687272] panel-edp soc@0:edp_panel: No display modes
> > > [   40.593709] panel-edp soc@0:edp_panel: No display modes
> > > [   40.600285] panel-edp soc@0:edp_panel: No display modes
> >
> > So, before the patch the drm core was getting modes from the
> > drm_connector (which means, modes from drm driver itself). With this
> > patch the panel-edp tries to get modes.
> >
> > Could you please check, why panel_edp_get_modes() fails? Assuming that
> > you use platform panel-edp binding (rather than 'edp-panel') could you
> > please check you have either of the following:
> > - ddc bus for EDID?
>
> I don't see anywhere where the ddc pointer is set for the dp bridge in
> msm_dp_bridge_init(). Is that required though? I'd think simple panel is
> still being used here so reading EDID isn't required.

I meant the 'ddc-i2c-bus' property for the corresponding eDP panel.

> > - either num_timing or num_modes in your panel desc.

After reading the panel-edp's code I don't have another cause for
panel_edp_get_modes(). It should either have a DDC bus specified using
the mentioned device tree property, or it should have specified the
timings.

Kuogee, which platform were you using when testing this patch? Could
you please share the dts fragment?

-- 
With best wishes
Dmitry
