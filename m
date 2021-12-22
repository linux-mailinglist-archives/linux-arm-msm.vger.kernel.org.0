Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15EF347CA35
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Dec 2021 01:21:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239248AbhLVAU7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Dec 2021 19:20:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239208AbhLVAU7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Dec 2021 19:20:59 -0500
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F2BAC06173F
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Dec 2021 16:20:59 -0800 (PST)
Received: by mail-ot1-x330.google.com with SMTP id a23-20020a9d4717000000b0056c15d6d0caso561347otf.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Dec 2021 16:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jbfOD5CFsxRJOwQM/rjR3cxXxZ9C6XulxtRYL9VjoJU=;
        b=aHWRaPaJlTJX2cwcz9+HsPGcPadxRTU5wvHZZrGdIog0hX7z7wEt4ypKqwH66ppM0T
         5FZ2HvlNDFNKpVCFR8dgkmUBOa08WODjmPGCPyY6n3mtWxNiWd0PTzrT6WejFYfMW9du
         TK3gyVTrb9ycwTNVkGh9ffIzZ4MQiY3CPrfIr/vf60ncBGpWdColSZjNxZ3d+BIMDpPP
         K3ws0WqkwCx9bmS5uthYXALsP/FfxO5iMHmdhjP5gpsREaWsCO4hjLrlGuFq9bj6B1Vt
         vS8G2A+k1HwnmcC7WNTXlTWmY65f4702LnrYBlIefWVtcq2aanMwLzmpQZSFnpgK1Nle
         2EzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jbfOD5CFsxRJOwQM/rjR3cxXxZ9C6XulxtRYL9VjoJU=;
        b=TBAQm+2HCukYPUxwCsgewBmuBru1uXUKHg3W8/CoFyo5pQBlz9hsbmUcXGFReKZLn6
         zAeBXZlATkJu5vza1rQBA+Hxj4jjS2AiZpoUZj2AW8+pIaUxhhH8y7y3GA09vMabs33g
         nQf7AWaBGtCpbqn8LN0Q5stIy1UKa586irBJa76mYhE1z6EQLjQmB0gXE+owjXeEnMpx
         WSYCg06Bo982WnN806TUKdmD9PLBMefUv1/ihqUylQgyq15TFGYCmhiAjq9SsjqVk1sQ
         d205YgRydvCuUtCAnwndZSvBjaBEUmW1RPYKXoS2DZ2Fdt9CF+mpZKbyxpffSDvDYhM5
         NaBg==
X-Gm-Message-State: AOAM530YyF75gtxnkZr8nSZj3Z10D8SEjOLqChnwTtgdS59E5xQSNVlt
        hBdf2FH593/PrO3pOwIHSUme8Q==
X-Google-Smtp-Source: ABdhPJzH5bBLDKvNaOhu6/mVwMqLJrfN6ZQ8W9tgqIlq0cZMX4K1p08Iyzj2TPDFELNHltkKlQgWTQ==
X-Received: by 2002:a05:6830:1551:: with SMTP id l17mr513037otp.335.1640132458641;
        Tue, 21 Dec 2021 16:20:58 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id h3sm100978oon.34.2021.12.21.16.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 16:20:58 -0800 (PST)
Date:   Tue, 21 Dec 2021 16:22:08 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Mike Tipton <quic_mdtipton@quicinc.com>, agross@kernel.org,
        sboyd@kernel.org, shawn.guo@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-qcm2290: CLK_OPS_PARENT_ENABLE flag for
 rcg2 clocks
Message-ID: <YcJvsEFXPPVI+GZi@ripper>
References: <1639994084-25447-1-git-send-email-loic.poulain@linaro.org>
 <YcEUrtQuJ5CGF2RW@ripper>
 <CAMZdPi9g9x0Rn4YUwcLrZ5M23i3EzJOuUfh3MXFVM7pscQx5Tw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMZdPi9g9x0Rn4YUwcLrZ5M23i3EzJOuUfh3MXFVM7pscQx5Tw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 21 Dec 02:50 PST 2021, Loic Poulain wrote:

> Hi Bjorn,
> 
> On Tue, 21 Dec 2021 at 00:40, Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Mon 20 Dec 01:54 PST 2021, Loic Poulain wrote:
> >
> > > When a rcg2 clock migrates to a new parent, both the old and new
> > > parent clocks must be enabled to complete the transition. This can
> > > be automatically performed by the clock core when a clock is flagged
> > > with CLK_OPS_PARENT_ENABLE.
> > >
> > > Without this, we may hit rate update failures:
> > > gcc_sdcc2_apps_clk_src: rcg didn't update its configuration.
> > > WARNING: CPU: 1 PID: 82 at drivers/clk/qcom/clk-rcg2.c:122 update_config+0xe0/0xf0
> > >
> > > Fixes: 496d1a13d405 ("clk: qcom: Add Global Clock Controller driver for QCM2290")
> > > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > > ---
> > >  drivers/clk/qcom/gcc-qcm2290.c | 20 ++++++++++++++++++++
> > >  1 file changed, 20 insertions(+)
> > >
> > > diff --git a/drivers/clk/qcom/gcc-qcm2290.c b/drivers/clk/qcom/gcc-qcm2290.c
> > > index b6fa7b8..9e1d88e 100644
> > > --- a/drivers/clk/qcom/gcc-qcm2290.c
> > > +++ b/drivers/clk/qcom/gcc-qcm2290.c
> > > @@ -674,6 +674,7 @@ static struct clk_rcg2 gcc_usb30_prim_mock_utmi_clk_src = {
> > >               .name = "gcc_usb30_prim_mock_utmi_clk_src",
> > >               .parent_data = gcc_parents_0,
> > >               .num_parents = ARRAY_SIZE(gcc_parents_0),
> > > +             .flags = CLK_OPS_PARENT_ENABLE,
> >
> > This seems like a correct fix for the obvious problem that we might end
> > up invoking clk_set_rate() and clk_set_parent() for these clocks while
> > their (and thereby themselves - in a software sense) are disabled.
> >
> >
> > However, clocks that downstream are marked "enable_safe_config", may in
> > addition be enabled by the hardware, behind out back. As such we must
> > ensure that they always have a valid configuration, we do this by
> > "parking" them on CXO whenever we're going to disable their parent
> > clocks.
> >
> > Upstream we handle this by using the clk_rcg2_shared_ops, which will do
> > exactly this.
> 
> Ok, thanks for the explanation, so we actually need both
> clk_rcg2_shared_ops and CLK_OPS_PARENT_ENABLE, the former parking the
> clock under always-on CXO (safe source), allowing hardware to toggle it
> on its own. The latter allows safe parent switching by enabling the
> new parent clock before update (and old parent, but we don't care
> since we are actually parked on CXO) . Is that correct?
> 

If a clock is parked and we get a request to change its rate, then the
old parent doesn't matter (as you say). But as we are done with the
set_rate the new parent will be turned off, as such as soon as we've
changed the parent we must park the RCG again.

So for parked shared_ops RCGs we simply remember the new configuration
of the set_rate until it's time to enable the RCG again.

As such I don't think that CLK_OPS_PARENT_ENABLE adds any value (for the
shared_ops RCGs), only a bit of overhead.


That said, if I read the code correctly don't think we properly handles
a clk_set_parent() of a parked shared RCGs today...

Regards,
Bjorn

> > PS. Unfortunately these RCGs doesn't allow us to reliably implement
> > is_enabled() and as such clk_disable_unused() will skip parking the
> > unused clocks and continue to disable the PLLs feeding them (if they are
> > unused). I don't think this is a problem for the clocks you list here,
> > but we certainly have a problem with this in the dispcc. So this is
> > currently being discussed. For now it's expected that booting without
> > "clk_ignore_unused" is "broken".
> 
> Ok, understood thanks.
> 
> 
> Loic
