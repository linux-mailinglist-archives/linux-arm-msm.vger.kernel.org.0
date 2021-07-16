Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72F093CBF0D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jul 2021 00:11:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236106AbhGPWO1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Jul 2021 18:14:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236255AbhGPWO0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Jul 2021 18:14:26 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29727C061760
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jul 2021 15:11:30 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id 59-20020a9d0ac10000b0290462f0ab0800so11392413otq.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jul 2021 15:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GsypGQCg9S/GisxcDVlWXCBawzzEOc/grzW2bvmRMAg=;
        b=gVx/ZHrIC70vmVOCXTr5TS+1Jruf64sqkyxZ3UrGgiV9XuXtxC2XqLJ7mJExhp4mM0
         KBQbw8boqaMx05zqTEMZhJ9kHBIa+UbhgxjdD9lfnx26rqskUupU666RDLet7noW+R1t
         aurTICKChGvUPOXRPGC/Rn2T3wlWxwz49jWSAgSiM4hBTew/zOtn0SFMeuoVm9x3Z9xg
         mRRG+s4KML/diC5yfsyM0KPHWbspq9A3dPbTW6ZcB1dlLiA/guSR/TXIBXZZHhG8A+ja
         bSQ0fcPF9WhxPjmtXlaJEB5SZz+ZEV1haGrLR8OuDqGqMjgnyUKndrCyt/iQgwoV1qYQ
         diEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GsypGQCg9S/GisxcDVlWXCBawzzEOc/grzW2bvmRMAg=;
        b=Zj/3r7I/3wva7TnTn17yIS9QWdJYjb3N/TU+4m7dUaDZ+GvRxfpFcmhgwNrtQjdjqm
         5RjCEH04SESXHGeriyHj7OJFES1RpPF7ecgm7bKe9tfEJyrN6+XxuNksAUDx4gpEK9wb
         i1uUwG9EFehxwB8xmhYA+eayHqHtSuqUz0z+Gzr1uSd6k6YhyBqNY6wCw0Uc5ansMtsv
         HH+ZyezR9JcFEIrOKDJO+1IfiETCnO2Dga3kFB3pNCZPlDXmv7/TTYamIdGJMWnV9XnJ
         y9U+q2w7au9BLdQ4+GbMzLB4YeCSbLLBk3fLjF1QEclEE2fFVmzCwy6B5ITamDZh402a
         BhGQ==
X-Gm-Message-State: AOAM532yZK9BXER7bj+tJaU32C0wVMK2cM+irWn/1dcmbvQr0Anzs3wY
        IedyAuN6Qq4kxpDXmQKVqwCnrQ==
X-Google-Smtp-Source: ABdhPJwBsE83jLbN160zVaPWxMbMbgpOEWRAqn74ZxPAZqv8WZM743HqtDM41JWWiSUBuY6Bb+j3ng==
X-Received: by 2002:a9d:4f09:: with SMTP id d9mr9585414otl.265.1626473489414;
        Fri, 16 Jul 2021 15:11:29 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id b10sm2365497oiy.4.2021.07.16.15.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jul 2021 15:11:28 -0700 (PDT)
Date:   Fri, 16 Jul 2021 17:11:26 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Prasad Malisetty <pmaliset@codeaurora.org>, agross@kernel.org,
        bhelgaas@google.com, lorenzo.pieralisi@arm.com, robh+dt@kernel.org,
        svarbanov@mm-sol.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, dianders@chromium.org,
        mka@chromium.org, vbadigan@codeaurora.org, sallenki@codeaurora.org
Subject: Re: [PATCH v4 4/4] PCIe: qcom: Add support to control pipe clk src
Message-ID: <YPIEDhIEPo+Gwibq@yoga>
References: <1626443927-32028-1-git-send-email-pmaliset@codeaurora.org>
 <1626443927-32028-5-git-send-email-pmaliset@codeaurora.org>
 <CAE-0n538LKQpeY_NKQF-VM3nHVxEE0B_pN4aN=sQ8iQzK+Yyxw@mail.gmail.com>
 <YPHsu+QLWRYpYRCz@yoga>
 <CAE-0n53k9Pn0LMe2xiNN_iTsv-z_rrGSthJVHeLdafDhPuBK=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n53k9Pn0LMe2xiNN_iTsv-z_rrGSthJVHeLdafDhPuBK=A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 16 Jul 16:39 CDT 2021, Stephen Boyd wrote:

> Quoting Bjorn Andersson (2021-07-16 13:31:55)
> > On Fri 16 Jul 14:37 CDT 2021, Stephen Boyd wrote:
> >
> > > Quoting Prasad Malisetty (2021-07-16 06:58:47)
> > > > This is a new requirement for sc7280 SoC.
> > > > To enable gdsc gcc_pcie_1_pipe_clk_src should be TCXO.
> > >
> > > Why? Can you add that detail here? Presumably it's something like the
> > > GDSC needs a running clk to send a reset through the flops or something
> > > like that.
> > >
> >
> > Which presumably means that we need to "park" gcc_pcie_N_pipe_clk_src
> > whenever the PHY pipe is paused due to a suspend or runtime suspend.
> >
> > I find this part of the commit message to primarily describing the next
> > patch (that is yet to be posted).
> 
> Ah I see. So there will be another patch to do the park and unpark over
> suspend/resume?
> 

That's my understanding.

> >
> > > > after PHY initialization gcc_pcie_1_pipe_clk_src needs
> > > > to switch from TCXO to gcc_pcie_1_pipe_clk.
> > > >
> > > > Signed-off-by: Prasad Malisetty <pmaliset@codeaurora.org>
> > > > ---
> > > >  drivers/pci/controller/dwc/pcie-qcom.c | 22 ++++++++++++++++++++++
> > > >  1 file changed, 22 insertions(+)
> > > >
> > > > diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> > > > index 8a7a300..9e0e4ab 100644
> > > > --- a/drivers/pci/controller/dwc/pcie-qcom.c
> > > > +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> > > > @@ -1167,6 +1170,20 @@ static int qcom_pcie_get_resources_2_7_0(struct qcom_pcie *pcie)
> > > >         if (ret < 0)
> > > >                 return ret;
> > > >
> > > > +       if (of_device_is_compatible(dev->of_node, "qcom,pcie-sc7280")) {
> > > > +               res->gcc_pcie_1_pipe_clk_src = devm_clk_get(dev, "pipe_mux");
> > > > +               if (IS_ERR(res->gcc_pcie_1_pipe_clk_src))
> > > > +                       return PTR_ERR(res->gcc_pcie_1_pipe_clk_src);
> > > > +
> > > > +               res->phy_pipe_clk = devm_clk_get(dev, "phy_pipe");
> > > > +               if (IS_ERR(res->phy_pipe_clk))
> > > > +                       return PTR_ERR(res->phy_pipe_clk);
> > > > +
> > > > +               res->ref_clk_src = devm_clk_get(dev, "ref");
> > > > +               if (IS_ERR(res->ref_clk_src))
> > > > +                       return PTR_ERR(res->ref_clk_src);
> > > > +       }
> > > > +
> > > >         res->pipe_clk = devm_clk_get(dev, "pipe");
> > > >         return PTR_ERR_OR_ZERO(res->pipe_clk);
> > > >  }
> > > > @@ -1255,6 +1272,11 @@ static void qcom_pcie_deinit_2_7_0(struct qcom_pcie *pcie)
> > > >  static int qcom_pcie_post_init_2_7_0(struct qcom_pcie *pcie)
> > > >  {
> > > >         struct qcom_pcie_resources_2_7_0 *res = &pcie->res.v2_7_0;
> > > > +       struct dw_pcie *pci = pcie->pci;
> > > > +       struct device *dev = pci->dev;
> > > > +
> > > > +       if (of_device_is_compatible(dev->of_node, "qcom,pcie-sc7280"))
> > > > +               clk_set_parent(res->gcc_pcie_1_pipe_clk_src, res->phy_pipe_clk);
> > >
> > > Is anything wrong if we call clk_set_parent() here when this driver is
> > > running on previous SoCs where the parent is assigned via DT?
> >
> > We don't assign the parent on previous platforms, we apparently just
> > rely on the reset value (afaict).
> 
> Oh sheesh. I thought that was being done already. It looks like at least
> on sdm845 that there is only one parent for this clk so we don't need to
> call clk_set_parent to set it there.
> 

I'll have to check the documentation on that...

> >
> > So I think it makes sense for all platforms to explicitly mux
> > pipe_clk_src to phy::pipe_clk, one the PHY is up and running.
> 
> Sure, except some platforms don't have a mux?
> 
> >
> > But I was under the impression that we have the BRANCH_HALT_SKIP on the
> > pipe_clk because there was some sort of feedback loop to the PHY's
> > calibration... What this patch indicates is that we should park
> > pipe_clk_src onto XO at boot time, then after the PHY starts ticking we
> > should enable and reparent the clk_src - at which point I don't see why
> > we need the HALT_SKIP.
> 
> I recall that qcom folks kept saying they needed to enable the
> pipe_clk_src clk branch in GCC before enabling the phy. So they required
> the halt skip flag so that the clk_prepare_enable() call would
> effectively set the enable bit in GCC and move on without caring. Then
> they could enable the upstream clk source in the phy without having to
> stop halfway through to enable the branch in GCC. The whole design here
> is pretty insane.
> 
> In fact, I think we discussed this whole topic in late 2019[1] and we
> concluded that we could just slam the clk on forever and deal with the
> clk_set_parent() when the clk became a mux+gate instead of a pure gate.
> 

That's exactly what I asked Prasad about, because per the description
and content of this patch the parent pipe_clk_src will remain XO until
the PHY is initialized. So either the PHY no longer need gcc in the loop
to calibrate the pipe clock or it used to, but no longer does.


Thanks for the link, we definitely should clean that up, but I think at
this point it might be worth waiting a little bit longer to see what
actually going to happen in the suspend/resume (system and runtime)
paths...

> >
> > > Also, shouldn't we make sure the parent is XO at driver probe time so
> > > that powering on the GDSC works properly?
> > >
> > > It all feels like a kludge though given that the GDSC is the one that
> > > requires the clock to be running at XO and we're working around that in
> > > the pcie driver instead of sticking that logic into the GDSC. What do we
> > > do if the GDSC is already enabled out of boot instead of being the power
> > > on reset (POR) configuration?
> > >
> >
> > What happens if we boot the device out of NVME...
> 
> I guess it's fine? The GDSC will be on and the parent clk will already
> be set so things are a no-op.
> 

Yes, if the pipe_clk_src is parked nicely in late initcall, so that when the
pd late init cuts the GDSC things will end up in a clean state.

Regards,
Bjorn

> >
> >
> > PS. Are we certain that it's the PCIe driver and not the PHY that should
> > do this dance? I really would like to see the continuation of this patch
> > to see the full picture...
> >
> 
> [1] https://lore.kernel.org/linux-clk/eba920f5-f5a2-53d5-2227-529b5ea99d32@codeaurora.org/
