Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B684F3DDB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2019 03:06:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725928AbfKHCGa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Nov 2019 21:06:30 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:37229 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728574AbfKHCGa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Nov 2019 21:06:30 -0500
Received: by mail-io1-f68.google.com with SMTP id 1so4632420iou.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Nov 2019 18:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aSgW3A7RWyhsJj378/fhZw4bo/3lSZywb10x/TiQ6js=;
        b=AobIyWBWp8Z6LpdtKuyma3ufS/KNGQ+bmCTeW6cvoDC7nZ3SHSDceDgHKbyNh1AIwM
         CxX6yLM6gyuEKDxu8eYrOCBPuL58TvXko5kWxjv1YVWCJzzqo9G0qLEny5lAwy2u80JN
         +uoc4wzs5+DZjg+oVIZUomGzqkbJXUsZoz2/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aSgW3A7RWyhsJj378/fhZw4bo/3lSZywb10x/TiQ6js=;
        b=bz+3PirftRUCTbEVOkPOCc0osDCrflF5hwkAlGSqXZ9WVZRqTlidVJZWq0myK/Hq0v
         I0Gx9wMmnnsf/u4xP+CPXQYqFQlF4hi0tML19ILpKuK/LIWrjKevIWDwImqGzHjfg0aI
         RWIAPYdu1J3HDZ70m8op4MBJCcrT/e1afmSYWxY0p5hsMAyhFqp6Cr7ZjfTw3klRM1uF
         u3O/Xn5W3t+HEkgBnLVf8Ztjz2GiF5XzXJZsXBLIGSRaFeYH+Lvhbbu4GCxU2TjBlP8U
         X9MAnSkdLRj5m32tT2OJDRwrf9uIKDvgFqxlrxgjMqxH2Bn6iejUqzUsP7iicMwV6bvE
         rrZQ==
X-Gm-Message-State: APjAAAUnPbMtRMn4xu3dmdT6rKF1f/y+UqmD6yhufm+MTnEaTZrR7dCV
        aAuM4PHMFCKGQLZ+qZWr4YjOTip/RY07xrPH/8Ecuw==
X-Google-Smtp-Source: APXvYqyn0DsKqg8rSWqcfoMm6d8Fl2Z6dgUSaiBlmZgGR04MFVjbMr+p8KLgwaxrK5kbeIdRnkzz/m2YgeK0W6B0DHA=
X-Received: by 2002:a02:58c8:: with SMTP id f191mr7652985jab.94.1573178789631;
 Thu, 07 Nov 2019 18:06:29 -0800 (PST)
MIME-Version: 1.0
References: <20191014102308.27441-1-tdas@codeaurora.org> <20191014102308.27441-6-tdas@codeaurora.org>
 <20191029175941.GA27773@google.com> <fa17b97d-bfc4-4e9c-78b5-c225e5b38946@codeaurora.org>
 <20191031174149.GD27773@google.com> <20191107210606.E536F21D79@mail.kernel.org>
In-Reply-To: <20191107210606.E536F21D79@mail.kernel.org>
From:   Rob Clark <robdclark@chromium.org>
Date:   Thu, 7 Nov 2019 18:06:19 -0800
Message-ID: <CAJs_Fx60uEdGFjJXAjvVy5LLBXXmergRi8diWxhgGqde1wiXXQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] clk: qcom: Add Global Clock controller (GCC)
 driver for SC7180
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        Taniya Das <tdas@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, Rob Herring <robh+dt@kernel.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 7, 2019 at 1:06 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Matthias Kaehlcke (2019-10-31 10:41:49)
> > Hi Taniya,
> >
> > On Thu, Oct 31, 2019 at 04:59:26PM +0530, Taniya Das wrote:
> > > Hi Matthias,
> > >
> > > Thanks for your comments.
> > >
> > > On 10/29/2019 11:29 PM, Matthias Kaehlcke wrote:
> > > > Hi Taniya,
> > > >
> > > > On Mon, Oct 14, 2019 at 03:53:08PM +0530, Taniya Das wrote:
> > > > > Add support for the global clock controller found on SC7180
> > > > > based devices. This should allow most non-multimedia device
> > > > > drivers to probe and control their clocks.
> > > > >
> > > > > Signed-off-by: Taniya Das <tdas@codeaurora.org>
> > >
> > > >
> > > > v3 also had
> > > >
> > > > +   [GCC_DISP_AHB_CLK] = &gcc_disp_ahb_clk.clkr,
> > > >
> > > > Removing it makes the dpu_mdss driver unhappy:
> > > >
> > > > [    2.999855] dpu_mdss_enable+0x2c/0x58->msm_dss_enable_clk: 'iface' is not available
> > > >
> > > > because:
> > > >
> > > >          mdss: mdss@ae00000 {
> > > >                     ...
> > > >
> > > >   =>             clocks = <&gcc GCC_DISP_AHB_CLK>,
> > > >                           <&gcc GCC_DISP_HF_AXI_CLK>,
> > > >                           <&dispcc DISP_CC_MDSS_MDP_CLK>;
> > > >                  clock-names = "iface", "gcc_bus", "core";
> > > >     };
> > > >
> > >
> > > The basic idea as you mentioned below was to move the CRITICAL clocks to
> > > probe. The clock provider to return NULL in case the clocks are not
> > > registered.
> > > This was discussed with Stephen on v3. Thus I submitted the below patch.
> > > clk: qcom: common: Return NULL from clk_hw OF provider.
> >
> > I see. My assumption was that the entire clock hierarchy should be registered,
> > but Stephen almost certainly knows better :)
> >
> > > Yes it would throw these warnings, but no functional issue is observed from
> > > display. I have tested it on the cheza board.
> >
> > The driver considers it an error (uses DEV_ERR to log the message) and doesn't
> > handle other clocks when one is found missing. I'm not really famililar with
> > the dpu_mdss driver, but I imagine this can have some side effects. Added some
> > of the authors/contributors to cc.
>
> NULL is a valid clk pointer returned by clk_get(). What is the display
> driver doing that makes it consider NULL an error?
>

do we not have an iface clk?  I think the driver assumes we should
have one, rather than it being an optional thing.. we could ofc change
that

BR,
-R
