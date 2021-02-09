Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E466D315AE9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Feb 2021 01:21:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234219AbhBJASo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Feb 2021 19:18:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233817AbhBIXh6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Feb 2021 18:37:58 -0500
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 461C2C061794
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Feb 2021 15:36:35 -0800 (PST)
Received: by mail-ot1-x333.google.com with SMTP id r21so114826otk.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Feb 2021 15:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9dBRmNZ9i0NwHuXCx2HpRhIs/zJV+YiWsUyUJRG1n9Y=;
        b=VKxskR1IKkiw/3W7tR9uPZhroPqyWrhZAjIvKeRx7ha++Eh3jQtUEliOz4Un0v3Qsb
         OoOvn6D8As7ZtrjkFfSu+vN1CwYkXvudvorlMnu9qyU0m0qO50mqzgRQJDPNCsnuwV2F
         PsuOyB4kC6Pyt3mUbDU3CwiODHxqkAffTFiHlHMELHyyHkR7pht2PxYWG+VlVpDeS8vc
         909nI5iEVbsGK7jRWeIoYFGKxkyjq81J1rs/7pAbJZQWlzzizYETntMv8VrSZ8VyulpC
         9Qn/EwQoIYOurMOFpYnvQmPzX1dPBOR06OdLNEvvmuFfgoDx13c9lZzzKTN0pewdGLHF
         kTVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9dBRmNZ9i0NwHuXCx2HpRhIs/zJV+YiWsUyUJRG1n9Y=;
        b=VKmLJl0hbZPIWWYObuIfobQtcO071rY2HQmQpfXGLWEyW/YPSIu0Eo8rOpDjbq27kb
         xd4TKHaoK5jSoZ/eH4igCLsIAUgudOHhKFls28Q6n1KIyphUNmm8jn0TZwQg4JWYnG4H
         Rq27twzOJfWdS2NiLx0ohU8+qM1g/UpuOL33PoDU9VnVA2lKAj+ck5DEeLjOvwdrFqBv
         aFI7WxBPK7B7fbkd3qSUclp84i/6TcMZJh8AvGpo5hT12k9ZU0/SbhmOStexPNE3HOYr
         cDl6jwL7fVzUorTYwhOVE3VRE1VmfWoUk143oia1i7NNMwI6CDBCAnSk/FqaDlcapFpY
         VerQ==
X-Gm-Message-State: AOAM530QgDL4dOkmxMRdwdm6k3B5Mrilu1DfNJpkYhnESLU6fve+p/Y8
        ii0pYxG2569znxVSYzfMVfRweQ==
X-Google-Smtp-Source: ABdhPJzOeefwoWjHSZ8redpHT3x5AV3RQQmHrzkJU5BzqdaOzfZmzBIVexiX4fV48CIKbr7P3pYKag==
X-Received: by 2002:a9d:3b06:: with SMTP id z6mr98595otb.22.1612913794563;
        Tue, 09 Feb 2021 15:36:34 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 203sm62236oie.14.2021.02.09.15.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 15:36:33 -0800 (PST)
Date:   Tue, 9 Feb 2021 17:36:32 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sdm845: Move reserved-memory to
 devices
Message-ID: <YCMcgHfJDeGAMlVp@builder.lan>
References: <20210209160946.29382-1-bjorn.andersson@linaro.org>
 <CAD=FV=UnYd5w83xkf0D+ND0nsVfX+RVnr=f=hyLg0j=ERDsXKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=UnYd5w83xkf0D+ND0nsVfX+RVnr=f=hyLg0j=ERDsXKQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 09 Feb 17:25 CST 2021, Doug Anderson wrote:

> Hi,
> 
> On Tue, Feb 9, 2021 at 8:09 AM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> > index 216a74f0057c..2f44785d1af0 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> > @@ -153,36 +153,66 @@ panel_in_edp: endpoint {
> >   * all modifications to the memory map (from sdm845.dtsi) in one place.
> >   */
> >
> > -/*
> > - * Our mpss_region is 8MB bigger than the default one and that conflicts
> > - * with venus_mem and cdsp_mem.
> > - *
> > - * For venus_mem we'll delete and re-create at a different address.
> > - *
> > - * cdsp_mem isn't used on cheza right now so we won't bother re-creating it; but
> > - * that also means we need to delete cdsp_pas.
> > - */
> > -/delete-node/ &venus_mem;
> > -/delete-node/ &cdsp_mem;
> > -/delete-node/ &cdsp_pas;
> 
> Note to self: on cheza we'll end up with "cdsp_pas" existing now, but
> that _should_ be OK since it's disabled
> 

That was not intentional, but as you say it shouldn't make a difference.

> 
> > @@ -1321,6 +1359,7 @@ config {
> >  };
> >
> >  &venus {
> > +       memory-region = <&venus_mem>;
> >         video-firmware {
> >                 iommus = <&apps_smmu 0x10b2 0x0>;
> >         };
> 
> slight nit: I think it looks ugly not to have a blank line between the
> property and the sub-node.  ;-)
> 

I agree, will go over and adjust this in v2.

> 
> > @@ -766,8 +697,6 @@ adsp_pas: remoteproc-adsp {
> >                 clocks = <&rpmhcc RPMH_CXO_CLK>;
> >                 clock-names = "xo";
> >
> > -               memory-region = <&adsp_mem>;
> > -
> 
> Note to self: we're losing the above on cheza, but that _should_ be OK
> since the node is disabled anyway.
> 
> Probably not critical at this point, but it makes me wonder whether we
> could remove adsp_mem on cheza...
> 

I noticed this too, but figured that this is an actual change, so it
would be better to do in a separate commit - if that's desired.

> ---
> 
> So I only looked at the cheza and sdm845 changes and they look fine to
> me and this seems like a good change overall.  I'm assuming that folks
> who focus on the other boards will double-check your work there if
> they care or just trust that everything is great.  ;-)
> 
> OK, I lied.  I took a quick glance.  In "sdm845-db845c" you maybe miss
> adding the "memory-region" back to the WiFi?  Have you tried running
> something like this before/after:
> 
> for f in sdm845*.dtb; do   dtc -I dtb -O dts --sort $f > $f.dts; done
> 

I was not aware of the --sort, so I did this by chaining together some
more things in the shell to confirm that I didn't actually change any
reserved-memory regions...

> You've gotta ignore phandle ID differences but otherwise it'll point
> out things like this.
> 

But as the phandles changed all over the place I looked only at the
reserved-memory, will fix up the db845c wifi node and double check the
rest of the nodes. Thanks for spotting this!

Regards,
Bjorn
