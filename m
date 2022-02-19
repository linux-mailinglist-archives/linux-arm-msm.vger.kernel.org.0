Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70BD54BC427
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Feb 2022 02:10:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240905AbiBSA4V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Feb 2022 19:56:21 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:40950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240912AbiBSA4F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Feb 2022 19:56:05 -0500
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com [IPv6:2607:f8b0:4864:20::c2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7043627FBA4
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Feb 2022 16:55:30 -0800 (PST)
Received: by mail-oo1-xc2c.google.com with SMTP id 189-20020a4a03c6000000b003179d7b30d8so5644507ooi.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Feb 2022 16:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc:content-transfer-encoding;
        bh=maCiXDsH7Piecw7CFVUouSN0+BxrDTavlzWiZL+tFJ0=;
        b=bOv6CwZIKZHtpIQnWvILAOBC6r25um6+oH4DrZQ93R6IHHUGHJs3CAD+Z9LEFIjR99
         WR3GZPsEdjaf65IzYPiE5r/XtX4oii/eGmJPX8XtHB4nAzcD3EBdZeKklVvfPetXdY2t
         2q8dHpsk4Ax/DonkZqiE3ylaePFUkWbpKjXQU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc:content-transfer-encoding;
        bh=maCiXDsH7Piecw7CFVUouSN0+BxrDTavlzWiZL+tFJ0=;
        b=ABN18ME9/cJSmeUr6f9y8jg4g5ijyDKOHERNTHQeEjD5RtLhi+QG4+4YsVQk380314
         Ssa1AG3i/cmLFYFgwtsuxyz/54aLxtMefPIBXo5mPFPu3Xry++6othdZcvkBMwkGkZvd
         W8Gcg23c00JbD89YReilv39M3aqeR1DKhu9YWRqOccVYyVRxcoS8djDMqfLiwphfKyC7
         bfyitRekM+NxPc/XkvsCWwXVuDcU/wes2z7xX2Hl4dvoV9BGpXIVndRA6+kG5AlbDhoY
         s8hp8D5Jh8TSjxmPPuiV/ZGtvzaO2sGuhhWWMnns4SdIFMbUuvsaommDUIHyzYyGMWjt
         mSCg==
X-Gm-Message-State: AOAM532vdWBxIIjehUBAcmhggjEYlSb4YwnA6+VzHUSK5LZZYNcYrztM
        H3VWjL/z3hRSlJe4nnkE4n/Np0rZMTCsmghz8K+b3g==
X-Google-Smtp-Source: ABdhPJywGtHkEJiSikl5mOrCZbkSyqbuSbXwCo5TdExAry7Ny8z6sSuvbtjak34CZwM8SLSxuRi5rOWWPRfvbKAu8mQ=
X-Received: by 2002:a05:6870:631a:b0:d1:7d97:806 with SMTP id
 s26-20020a056870631a00b000d17d970806mr3727706oao.8.1645232129818; Fri, 18 Feb
 2022 16:55:29 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 18 Feb 2022 16:55:29 -0800
MIME-Version: 1.0
In-Reply-To: <b25d422e-cdd8-bcb9-1815-1d89f170d421@linaro.org>
References: <20220211224006.1797846-1-dmitry.baryshkov@linaro.org>
 <20220211224006.1797846-5-dmitry.baryshkov@linaro.org> <572c0402-55da-077b-1809-3d1caf7ce743@quicinc.com>
 <b25d422e-cdd8-bcb9-1815-1d89f170d421@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 18 Feb 2022 16:55:29 -0800
Message-ID: <CAE-0n51afuHURLHaZBa77H_n+cm4Tj1Du-rpLH-HsrkY5xQVJA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 4/5] drm/msm/dp: replace dp_connector with drm_bridge_connector
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-02-18 14:32:53)
> On 19/02/2022 00:31, Kuogee Hsieh wrote:
> >
> > On 2/11/2022 2:40 PM, Dmitry Baryshkov wrote:
> >> There is little point in having both connector and root bridge
> >> implementation in the same driver. Move connector's functionality to t=
he
> >> bridge to let next bridge in chain to override it.
> >>
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> > This patch break primary (edp) display
> >
> > -- right half of screen garbled
> >
> > -- screen shift vertically
> >
> > below are error messages seen --
> >
> > [=C2=A0=C2=A0 36.679216] panel-edp soc@0:edp_panel: No display modes
> > [=C2=A0=C2=A0 36.687272] panel-edp soc@0:edp_panel: No display modes
> > [=C2=A0=C2=A0 40.593709] panel-edp soc@0:edp_panel: No display modes
> > [=C2=A0=C2=A0 40.600285] panel-edp soc@0:edp_panel: No display modes
>
> So, before the patch the drm core was getting modes from the
> drm_connector (which means, modes from drm driver itself). With this
> patch the panel-edp tries to get modes.
>
> Could you please check, why panel_edp_get_modes() fails? Assuming that
> you use platform panel-edp binding (rather than 'edp-panel') could you
> please check you have either of the following:
> - ddc bus for EDID?

I don't see anywhere where the ddc pointer is set for the dp bridge in
msm_dp_bridge_init(). Is that required though? I'd think simple panel is
still being used here so reading EDID isn't required.

> - either num_timing or num_modes in your panel desc.
>
