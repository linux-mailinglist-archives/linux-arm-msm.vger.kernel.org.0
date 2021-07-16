Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A5343CBDD2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jul 2021 22:32:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233726AbhGPUe4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Jul 2021 16:34:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233119AbhGPUez (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Jul 2021 16:34:55 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0541AC06175F
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jul 2021 13:31:59 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id w127so12314393oig.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jul 2021 13:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=skur1GUOLazLI9sGw0mejIHq2wA0Qk680cR6nWMO0gg=;
        b=LwwcqbgFHQkMbqk1jYcxEcYdIkZvuwGRMhi5jbFla+CtGB+Hewhiw/2KUAe7icFwAf
         m4jub9zvG0KPDG/uOUhbbZ4cMi7YmBaL4ly31rmpmk96M6wlZpkcECO2+O4rY9bTh8K+
         f0KnZTQfPF2QV3yjHHQOK3lFt6s2qgzADMaijUdYuWS4b+mPRCTG7K3LT1KXL1Uyl43X
         8NQhA2YBYvkZWhN/pKrSdeOnPprxqNeno0XtwE+zc6LT3VLQfrHou3dQlGMRVpe2JU0y
         r+m5szqGyXeI2UjF31//tUMgl3ouerRlNMexxMVR9V8XHhcGO8NydNIT+cmfyiBnvBFc
         rknA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=skur1GUOLazLI9sGw0mejIHq2wA0Qk680cR6nWMO0gg=;
        b=ZWGDTOrtNGXaKblO/1HGo1D77ZAt55o+ckh6TeG/ouAOTjDW8g8pMi6V3OWKz+ozKj
         7FaeLRUGbJnHUv1z8kONZtPYBYTZXXIzNoYQ7N7cXWTH2J+7bt8JLaKGAKEEHTJ5Xf88
         ME5etiymJ6bOtp/NNQslOq1UXsDvqn17A5leHhVOriIce7vTOPLyqBzVGEDXI/6VM3HG
         Ryije3h0trPAGhVZWDAZp7rNNEXcsxc3TYErB6v4CFW9K5VlxCONU5rlEGtfcaNGJcpq
         ZMOJAWZCoapgwx1SEadKMGTjwnzG0eje3TZG70kdTmoJWQSzhrfvYvfmEibYhukkVR7s
         v4vA==
X-Gm-Message-State: AOAM531yKGN7/C1/71enzlqIFFlskZoJl7PtFBE3FoaUespE+/6F9KkK
        wzsU4kmN54ocXD7oI7lFNu1kjA==
X-Google-Smtp-Source: ABdhPJxs3RU6KbEjxZ/8AJyPjwqCKUMC6jqq/YEpxrH8KZ+P+JJmCUyzDX79WSngCiWDogB29ttcuw==
X-Received: by 2002:a05:6808:192:: with SMTP id w18mr14135102oic.61.1626467518434;
        Fri, 16 Jul 2021 13:31:58 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r16sm1208092otu.26.2021.07.16.13.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jul 2021 13:31:57 -0700 (PDT)
Date:   Fri, 16 Jul 2021 15:31:55 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Prasad Malisetty <pmaliset@codeaurora.org>, agross@kernel.org,
        bhelgaas@google.com, lorenzo.pieralisi@arm.com, robh+dt@kernel.org,
        svarbanov@mm-sol.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, dianders@chromium.org,
        mka@chromium.org, vbadigan@codeaurora.org, sallenki@codeaurora.org
Subject: Re: [PATCH v4 4/4] PCIe: qcom: Add support to control pipe clk src
Message-ID: <YPHsu+QLWRYpYRCz@yoga>
References: <1626443927-32028-1-git-send-email-pmaliset@codeaurora.org>
 <1626443927-32028-5-git-send-email-pmaliset@codeaurora.org>
 <CAE-0n538LKQpeY_NKQF-VM3nHVxEE0B_pN4aN=sQ8iQzK+Yyxw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n538LKQpeY_NKQF-VM3nHVxEE0B_pN4aN=sQ8iQzK+Yyxw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 16 Jul 14:37 CDT 2021, Stephen Boyd wrote:

> Quoting Prasad Malisetty (2021-07-16 06:58:47)
> > This is a new requirement for sc7280 SoC.
> > To enable gdsc gcc_pcie_1_pipe_clk_src should be TCXO.
> 
> Why? Can you add that detail here? Presumably it's something like the
> GDSC needs a running clk to send a reset through the flops or something
> like that.
> 

Which presumably means that we need to "park" gcc_pcie_N_pipe_clk_src
whenever the PHY pipe is paused due to a suspend or runtime suspend.

I find this part of the commit message to primarily describing the next
patch (that is yet to be posted).

> > after PHY initialization gcc_pcie_1_pipe_clk_src needs
> > to switch from TCXO to gcc_pcie_1_pipe_clk.
> >
> > Signed-off-by: Prasad Malisetty <pmaliset@codeaurora.org>
> > ---
> >  drivers/pci/controller/dwc/pcie-qcom.c | 22 ++++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >
> > diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> > index 8a7a300..9e0e4ab 100644
> > --- a/drivers/pci/controller/dwc/pcie-qcom.c
> > +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> > @@ -1167,6 +1170,20 @@ static int qcom_pcie_get_resources_2_7_0(struct qcom_pcie *pcie)
> >         if (ret < 0)
> >                 return ret;
> >
> > +       if (of_device_is_compatible(dev->of_node, "qcom,pcie-sc7280")) {
> > +               res->gcc_pcie_1_pipe_clk_src = devm_clk_get(dev, "pipe_mux");
> > +               if (IS_ERR(res->gcc_pcie_1_pipe_clk_src))
> > +                       return PTR_ERR(res->gcc_pcie_1_pipe_clk_src);
> > +
> > +               res->phy_pipe_clk = devm_clk_get(dev, "phy_pipe");
> > +               if (IS_ERR(res->phy_pipe_clk))
> > +                       return PTR_ERR(res->phy_pipe_clk);
> > +
> > +               res->ref_clk_src = devm_clk_get(dev, "ref");
> > +               if (IS_ERR(res->ref_clk_src))
> > +                       return PTR_ERR(res->ref_clk_src);
> > +       }
> > +
> >         res->pipe_clk = devm_clk_get(dev, "pipe");
> >         return PTR_ERR_OR_ZERO(res->pipe_clk);
> >  }
> > @@ -1255,6 +1272,11 @@ static void qcom_pcie_deinit_2_7_0(struct qcom_pcie *pcie)
> >  static int qcom_pcie_post_init_2_7_0(struct qcom_pcie *pcie)
> >  {
> >         struct qcom_pcie_resources_2_7_0 *res = &pcie->res.v2_7_0;
> > +       struct dw_pcie *pci = pcie->pci;
> > +       struct device *dev = pci->dev;
> > +
> > +       if (of_device_is_compatible(dev->of_node, "qcom,pcie-sc7280"))
> > +               clk_set_parent(res->gcc_pcie_1_pipe_clk_src, res->phy_pipe_clk);
> 
> Is anything wrong if we call clk_set_parent() here when this driver is
> running on previous SoCs where the parent is assigned via DT?

We don't assign the parent on previous platforms, we apparently just
rely on the reset value (afaict).

So I think it makes sense for all platforms to explicitly mux
pipe_clk_src to phy::pipe_clk, one the PHY is up and running.

But I was under the impression that we have the BRANCH_HALT_SKIP on the
pipe_clk because there was some sort of feedback loop to the PHY's
calibration... What this patch indicates is that we should park
pipe_clk_src onto XO at boot time, then after the PHY starts ticking we
should enable and reparent the clk_src - at which point I don't see why
we need the HALT_SKIP.

> Also, shouldn't we make sure the parent is XO at driver probe time so
> that powering on the GDSC works properly?
> 
> It all feels like a kludge though given that the GDSC is the one that
> requires the clock to be running at XO and we're working around that in
> the pcie driver instead of sticking that logic into the GDSC. What do we
> do if the GDSC is already enabled out of boot instead of being the power
> on reset (POR) configuration?
> 

What happens if we boot the device out of NVME...


PS. Are we certain that it's the PCIe driver and not the PHY that should
do this dance? I really would like to see the continuation of this patch
to see the full picture...

Regards,
Bjorn

> >
> >         return clk_prepare_enable(res->pipe_clk);
> >  }
