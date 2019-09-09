Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7AD6CADD89
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2019 18:54:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390355AbfIIQyM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Sep 2019 12:54:12 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:55414 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390200AbfIIQyM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Sep 2019 12:54:12 -0400
Received: by mail-wm1-f68.google.com with SMTP id g207so359244wmg.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Sep 2019 09:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=f9/8yy+NKv4q/o4tIkF6O8Or8uSW/OZKuGNstmgenRc=;
        b=rtj5Mvb9qp1ydqG8Dx9wrY+kW9C96wthSIEoYr32iyA8rXHVaahnacuxvVAg9TgJoH
         AavDm8EfpZxfUaUrlsZfFaq3Rff3LneiUax9g+x0EJhTqRSPdbgrNliPd6T4RLHHJpF6
         ya6x2MyPXQ7W+UTom2TTu3VieoF3MhdPUhOeuOCoCWaLFkrZ79uFyoRVgcozZeCoxFDW
         aFY+ZdUevNupWUJz4aZWiNQZqZGhmXQ3k/DBmSj87Yx+evow+Xji9f6FNUDZ1plIdulz
         oKNt9ZyAU/V38zWVHOmrJBnp2mcxHp9oRM2yM7zZxjHc6ja9mRb2Tlvi7XEvb60RXs1t
         ED9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=f9/8yy+NKv4q/o4tIkF6O8Or8uSW/OZKuGNstmgenRc=;
        b=tOak2Y9pzxqbiA/koxWxqvWENGxNk+vJmVN4fjyhaYIP00R4Gj2tWt9RgKKA9smIMx
         If7MtEvizaMZIvPUASC44UKIc1pWIAOtHevSaCh8TxbYPNflRUu5I0dF0NfYdLvJB+SF
         p148sWnyw/NE+KTmD/NGjazElIo+ImE+8/QKQ9m+XheNPBo73r+rivYAqDh0nAFOUMwi
         8O3AWTfXc8sNRNyvOskDIotFC+Feb4dBWZEaYG2W7oy4D/7dfv4ag9RzADRb60Uw4Rj7
         mo9Yp723ymhf8dAezxvtHiAFxOlFpqb5z+YXwks9ojwUOKqcVdievo0/S8Vac2uo9q6l
         jLVA==
X-Gm-Message-State: APjAAAWmQJj6V/Er47ddJNDLx237iMQLC30l/HzHYpcUb/nUHlUaK2y2
        8XDwTiTKx0FN4HAT1J1+q6xW8g==
X-Google-Smtp-Source: APXvYqx43oC4exXldBFEey6vvP4qHCDYNmsutB9kH+ydwlTmCRk+BOCW0A52BvRAZd+MGWkL90MXiQ==
X-Received: by 2002:a1c:7011:: with SMTP id l17mr152064wmc.39.1568048049688;
        Mon, 09 Sep 2019 09:54:09 -0700 (PDT)
Received: from igloo (69.red-83-35-113.dynamicip.rima-tde.net. [83.35.113.69])
        by smtp.gmail.com with ESMTPSA id r20sm20381639wrg.61.2019.09.09.09.54.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Sep 2019 09:54:09 -0700 (PDT)
From:   "Jorge Ramirez-Ortiz, Linaro" <jorge.ramirez-ortiz@linaro.org>
X-Google-Original-From: "Jorge Ramirez-Ortiz, Linaro" <JorgeRamirez-Ortiz>
Date:   Mon, 9 Sep 2019 18:54:08 +0200
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     "Jorge Ramirez-Ortiz, Linaro" <jorge.ramirez-ortiz@linaro.org>,
        agross@kernel.org, mturquette@baylibre.com,
        bjorn.andersson@linaro.org, niklas.cassel@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] clk: qcom: apcs-msm8916: get parent clock names from
 DT
Message-ID: <20190909165408.GC23964@igloo>
References: <20190826164510.6425-1-jorge.ramirez-ortiz@linaro.org>
 <20190826164510.6425-2-jorge.ramirez-ortiz@linaro.org>
 <20190909102117.245112089F@mail.kernel.org>
 <20190909141740.GA23964@igloo>
 <20190909161704.07FAE20640@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190909161704.07FAE20640@mail.kernel.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/09/19 09:17:03, Stephen Boyd wrote:
> Quoting Jorge Ramirez-Ortiz, Linaro (2019-09-09 07:17:40)
> > On 09/09/19 03:21:16, Stephen Boyd wrote:
> > > Quoting Jorge Ramirez-Ortiz (2019-08-26 09:45:07)
> > > > @@ -76,10 +88,11 @@ static int qcom_apcs_msm8916_clk_probe(struct platform_device *pdev)
> > > >         a53cc->src_shift = 8;
> > > >         a53cc->parent_map = gpll0_a53cc_map;
> > > >  
> > > > -       a53cc->pclk = devm_clk_get(parent, NULL);
> > > > +       a53cc->pclk = of_clk_get(parent->of_node, pll_index);
> > > 
> > > Presumably the PLL was always index 0, so why are we changing it to
> > > index 1 sometimes? Seems unnecessary.
> > > 
> > 
> > it came as a personal preference. hope it is acceptable (I would
> > rather not change it)
> > 
> > apcs-msm8916.c declares the following
> > 
> > [..]
> > static const u32 gpll0_a53cc_map[] = { 4, 5 };
> > static const char *gpll0_a53cc[] = {
> >        "gpll0_vote",
> >         "a53pll",
> >         };
> > [..]
> > 
> > 
> > now will be doing this
> > 
> > --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> > @@ -429,7 +429,8 @@
> >      compatible = "qcom,msm8916-apcs-kpss-global", "syscon";
> >      reg = <0xb011000 0x1000>;
> >      #mbox-cells = <1>;
> > -                   clocks = <&a53pll>;
> > +                 clocks = <&gcc GPLL0_VOTE>, <&a53pll>;
> > +                 clock-names = "aux", "pll";
> >                       #clock-cells = <0>;
> >                };
> >                                                                                                                 
> > 
> > so I chose to keep the consistency between the clocks definition and
> > just change the index before calling of_clk_get.
> > 
> 
> But now the binding is different for the same compatible. I'd prefer we
> keep using devm_clk_get() and use a device pointer here and reorder the
> map and parent arrays instead. The clocks property shouldn't change in a
> way that isn't "additive" so that we maintain backwards compatibility.
> 

but the backwards compatibility is fully maintained - that is the main reason
behind the change. the new stuff is that  instead of hardcoding the
names in the source - like it is being done on the msm8916- we provide
the clocks in the dts node (a cleaner approach with the obvious
benefit of allowing new users to be added without having to modify the
sources).



