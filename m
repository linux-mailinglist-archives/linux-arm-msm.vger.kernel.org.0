Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 021F53CBEA3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jul 2021 23:39:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235198AbhGPVl5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Jul 2021 17:41:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235022AbhGPVl4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Jul 2021 17:41:56 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D571C061760
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jul 2021 14:39:01 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id s23so12610798oij.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jul 2021 14:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=DJUmmGWanKO2Kc2lJb4r4AqUuRlfqVFicUMQJabxH2I=;
        b=a1b4VUlP+SBehYC2KNr0RA6XHEdwYZC1UJSJvAOlMXI7z0YSB4aoNbwrJ8tsoeMxk9
         o5ewozJwZnIiB8JBJ8u28V1C9QtxUi/7k4H0191/LZSRrNMelmnf0UuQRLnhDmoBQzMH
         pZ91UofbIJBzcU3z1U19CnAqABufK2a85QUvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=DJUmmGWanKO2Kc2lJb4r4AqUuRlfqVFicUMQJabxH2I=;
        b=LEo9SMdHKfeXNZKzCC2l4qVI3OdaXJMEc9b1cNjm+ZwpPa8MxQP3OrAgegu5HqdAYv
         WEjd+tZ5OnAMa8yEJZa6xVuYDbpYlXwOPD8mQL1KIdbpjrWQxNibXRDIOmhPrZoY8FZL
         budOL0tWg7i1CKi+DXTeT0BDRlAnEhUw/FMKoaUv2CAsAEaskfsFWJQ67J0KbFaFYvZ1
         BuJT7tBhpDmwLRhUUD+H36OCMyVZeCnj3CteaHGkHeQnpisF1Ka0xddNHDKeCErnEWrF
         Ev2pR4203cBxsDP16JQK0zvytzUoa/c3y9x/zajvDO0QG12zE+PI2TX1+7Asy7H06tJb
         f7HA==
X-Gm-Message-State: AOAM531Fn5AntqdsEE8YGoCUKOVHJEM+wEK0bHkIKEYRPk/whcWsIqQ9
        LZyxkjtXGDgebVW8eaOl7dMlnQ0zgZCxT8uT1hS3jA==
X-Google-Smtp-Source: ABdhPJy8ESmm35FiG9eVwSCULP7aZWRcaoghukrt/IjV6yztctNN60HxaKtQcXbjRTHOeOA0F3YBmvgit6bjbVs2wCM=
X-Received: by 2002:a05:6808:a83:: with SMTP id q3mr13795158oij.125.1626471540770;
 Fri, 16 Jul 2021 14:39:00 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 16 Jul 2021 23:39:00 +0200
MIME-Version: 1.0
In-Reply-To: <YPHsu+QLWRYpYRCz@yoga>
References: <1626443927-32028-1-git-send-email-pmaliset@codeaurora.org>
 <1626443927-32028-5-git-send-email-pmaliset@codeaurora.org>
 <CAE-0n538LKQpeY_NKQF-VM3nHVxEE0B_pN4aN=sQ8iQzK+Yyxw@mail.gmail.com> <YPHsu+QLWRYpYRCz@yoga>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 16 Jul 2021 23:39:00 +0200
Message-ID: <CAE-0n53k9Pn0LMe2xiNN_iTsv-z_rrGSthJVHeLdafDhPuBK=A@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] PCIe: qcom: Add support to control pipe clk src
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Prasad Malisetty <pmaliset@codeaurora.org>, agross@kernel.org,
        bhelgaas@google.com, lorenzo.pieralisi@arm.com, robh+dt@kernel.org,
        svarbanov@mm-sol.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, dianders@chromium.org,
        mka@chromium.org, vbadigan@codeaurora.org, sallenki@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2021-07-16 13:31:55)
> On Fri 16 Jul 14:37 CDT 2021, Stephen Boyd wrote:
>
> > Quoting Prasad Malisetty (2021-07-16 06:58:47)
> > > This is a new requirement for sc7280 SoC.
> > > To enable gdsc gcc_pcie_1_pipe_clk_src should be TCXO.
> >
> > Why? Can you add that detail here? Presumably it's something like the
> > GDSC needs a running clk to send a reset through the flops or something
> > like that.
> >
>
> Which presumably means that we need to "park" gcc_pcie_N_pipe_clk_src
> whenever the PHY pipe is paused due to a suspend or runtime suspend.
>
> I find this part of the commit message to primarily describing the next
> patch (that is yet to be posted).

Ah I see. So there will be another patch to do the park and unpark over
suspend/resume?

>
> > > after PHY initialization gcc_pcie_1_pipe_clk_src needs
> > > to switch from TCXO to gcc_pcie_1_pipe_clk.
> > >
> > > Signed-off-by: Prasad Malisetty <pmaliset@codeaurora.org>
> > > ---
> > >  drivers/pci/controller/dwc/pcie-qcom.c | 22 ++++++++++++++++++++++
> > >  1 file changed, 22 insertions(+)
> > >
> > > diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> > > index 8a7a300..9e0e4ab 100644
> > > --- a/drivers/pci/controller/dwc/pcie-qcom.c
> > > +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> > > @@ -1167,6 +1170,20 @@ static int qcom_pcie_get_resources_2_7_0(struct qcom_pcie *pcie)
> > >         if (ret < 0)
> > >                 return ret;
> > >
> > > +       if (of_device_is_compatible(dev->of_node, "qcom,pcie-sc7280")) {
> > > +               res->gcc_pcie_1_pipe_clk_src = devm_clk_get(dev, "pipe_mux");
> > > +               if (IS_ERR(res->gcc_pcie_1_pipe_clk_src))
> > > +                       return PTR_ERR(res->gcc_pcie_1_pipe_clk_src);
> > > +
> > > +               res->phy_pipe_clk = devm_clk_get(dev, "phy_pipe");
> > > +               if (IS_ERR(res->phy_pipe_clk))
> > > +                       return PTR_ERR(res->phy_pipe_clk);
> > > +
> > > +               res->ref_clk_src = devm_clk_get(dev, "ref");
> > > +               if (IS_ERR(res->ref_clk_src))
> > > +                       return PTR_ERR(res->ref_clk_src);
> > > +       }
> > > +
> > >         res->pipe_clk = devm_clk_get(dev, "pipe");
> > >         return PTR_ERR_OR_ZERO(res->pipe_clk);
> > >  }
> > > @@ -1255,6 +1272,11 @@ static void qcom_pcie_deinit_2_7_0(struct qcom_pcie *pcie)
> > >  static int qcom_pcie_post_init_2_7_0(struct qcom_pcie *pcie)
> > >  {
> > >         struct qcom_pcie_resources_2_7_0 *res = &pcie->res.v2_7_0;
> > > +       struct dw_pcie *pci = pcie->pci;
> > > +       struct device *dev = pci->dev;
> > > +
> > > +       if (of_device_is_compatible(dev->of_node, "qcom,pcie-sc7280"))
> > > +               clk_set_parent(res->gcc_pcie_1_pipe_clk_src, res->phy_pipe_clk);
> >
> > Is anything wrong if we call clk_set_parent() here when this driver is
> > running on previous SoCs where the parent is assigned via DT?
>
> We don't assign the parent on previous platforms, we apparently just
> rely on the reset value (afaict).

Oh sheesh. I thought that was being done already. It looks like at least
on sdm845 that there is only one parent for this clk so we don't need to
call clk_set_parent to set it there.

>
> So I think it makes sense for all platforms to explicitly mux
> pipe_clk_src to phy::pipe_clk, one the PHY is up and running.

Sure, except some platforms don't have a mux?

>
> But I was under the impression that we have the BRANCH_HALT_SKIP on the
> pipe_clk because there was some sort of feedback loop to the PHY's
> calibration... What this patch indicates is that we should park
> pipe_clk_src onto XO at boot time, then after the PHY starts ticking we
> should enable and reparent the clk_src - at which point I don't see why
> we need the HALT_SKIP.

I recall that qcom folks kept saying they needed to enable the
pipe_clk_src clk branch in GCC before enabling the phy. So they required
the halt skip flag so that the clk_prepare_enable() call would
effectively set the enable bit in GCC and move on without caring. Then
they could enable the upstream clk source in the phy without having to
stop halfway through to enable the branch in GCC. The whole design here
is pretty insane.

In fact, I think we discussed this whole topic in late 2019[1] and we
concluded that we could just slam the clk on forever and deal with the
clk_set_parent() when the clk became a mux+gate instead of a pure gate.

>
> > Also, shouldn't we make sure the parent is XO at driver probe time so
> > that powering on the GDSC works properly?
> >
> > It all feels like a kludge though given that the GDSC is the one that
> > requires the clock to be running at XO and we're working around that in
> > the pcie driver instead of sticking that logic into the GDSC. What do we
> > do if the GDSC is already enabled out of boot instead of being the power
> > on reset (POR) configuration?
> >
>
> What happens if we boot the device out of NVME...

I guess it's fine? The GDSC will be on and the parent clk will already
be set so things are a no-op.

>
>
> PS. Are we certain that it's the PCIe driver and not the PHY that should
> do this dance? I really would like to see the continuation of this patch
> to see the full picture...
>

[1] https://lore.kernel.org/linux-clk/eba920f5-f5a2-53d5-2227-529b5ea99d32@codeaurora.org/
