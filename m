Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FDB9338163
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Mar 2021 00:25:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230231AbhCKXYz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 18:24:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229900AbhCKXYe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 18:24:34 -0500
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B59FAC061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Mar 2021 15:24:34 -0800 (PST)
Received: by mail-ot1-x331.google.com with SMTP id 75so2687619otn.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Mar 2021 15:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KOImosFVDKe6eni3/E1z+f4eza54wkEaxNnDYMA1BkY=;
        b=U6fz3qasj6Npqu11+ansN2N4q6/htLsUcNuxeHHOE0kW/Zk3uPhCn5BA72b6J5VKeq
         VYxIVlEg7dzdnwx6U1XOOdyc0VwwPgepTvZ+1O/2nA4a5n7gJi+L7z7biZoaEyU1tbm4
         t7GR7uUH/Z3LSUsxHM6NgEUrcFzkEFojrzYEY01arZgk0FJF6BjIoxcnDgaF8wBGd6o+
         xo2Fb3QTBVNPMn7TxAPdBUbiQj5fVNFs+ALqx36KWRHIrrFpf5j9JuG0+tBBEvkZ9AVd
         Tk3GCqUfnlM3CXuleRehOFPqK7bH3H2IU4bFWwF9axl4scW8JFQTNscdTmEchz4yKuUL
         MfHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KOImosFVDKe6eni3/E1z+f4eza54wkEaxNnDYMA1BkY=;
        b=DxcbUwA4VXBmRqAAwqaJoxkq6kk9jWnQybsvF3DrbPKxPUdMATONxN4RUfBjy3+Nj8
         I8rAWIxamGwKxAPMiziXBzxELXaSNz1TdcFicYpjSuIWsg7YzLcxrj6xIxmS8mo9EGbs
         nUK5baSt09orEZSZyqyvK3huVfyO0Tokr2MifJqTphn4uKGjIKQdDMHpk+3p/l5lgjwk
         +2apne3nwANAv+ZNgqpW0uN3xQFHynui3ikXb23KtbAHNlicCGWYlg0gS1aAEwgL0c2j
         hI7grnLnZ7wxuV6MLxLg/s9o4Kt5vg5Glhcu6YvlRkT430MtvTBIHb0q8JFr7LQ/VlZq
         W98Q==
X-Gm-Message-State: AOAM533T5+iJOwoiXUUZFQfVVh3HnFBRFXDjIwKv7rgVY5npq4Tz85pW
        qhalWnMzJYe5gdwxJuCRwI643ARsI5Qqzw==
X-Google-Smtp-Source: ABdhPJxDU5xLYUJyWILcQngDIdjMhNw8UY1bDIjZNGQckzP86zmEJoPMITj8dp1yZLMsB+rXvhTYoQ==
X-Received: by 2002:a9d:7103:: with SMTP id n3mr1034451otj.223.1615505074094;
        Thu, 11 Mar 2021 15:24:34 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w23sm841497oow.25.2021.03.11.15.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 15:24:33 -0800 (PST)
Date:   Thu, 11 Mar 2021 17:24:31 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Roja Rani Yarubandi <rojay@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Akash Asthana <akashast@codeaurora.org>,
        msavaliy@qti.qualcomm.com
Subject: Re: [PATCH] arm64: dts: sc7280: Add qspi, qupv3_0 and qupv3_1 nodes
Message-ID: <YEqmr1eUJoKp3ufO@builder.lan>
References: <20210311033957.8978-1-rojay@codeaurora.org>
 <CAD=FV=VuGPvUY8edN+PEuZS_pO+=3WHeJ-4J5tHDAPRnXJs0QA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=VuGPvUY8edN+PEuZS_pO+=3WHeJ-4J5tHDAPRnXJs0QA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 11 Mar 15:54 CST 2021, Doug Anderson wrote:

> Hi,
> 
> On Wed, Mar 10, 2021 at 7:41 PM Roja Rani Yarubandi
> <rojay@codeaurora.org> wrote:
> >
> > +&qspi_cs0 {
> > +       pinconf {
> > +               pins = "gpio15";
> > +               bias-disable;
> > +       };
> 
> The "pinconf" / "pinmux" subnode shouldn't be used for new SoCs. See:
> 
> http://lore.kernel.org/r/CAD=FV=UY_AFRrAY0tef5jP698LEng6oN652LcX3B4nG=aWh0gA@mail.gmail.com
> 
> ...same feedback for this whole patch.
> 
> > +                       qup_spi0_default: qup-spi0-default {
> > +                               pinmux {
> > +                                       pins = "gpio0", "gpio1",
> > +                                              "gpio2", "gpio3";
> > +                                       function = "qup00";
> > +                               };
> > +                       };
> 
> Please split these SPI nodes as per the thread above, like:
> 
> tlmm: pinctrl@... {
>   qup_spi0_data_clk: qup-spi0-data-clk {
>     pins = "gpio0", "gpio1", "gpio2";
>     function = "qup0";
>   };
> 
>   qup_spi0_cs: qup-spi0-cs {
>     pins = "gpio3";
>     function = "qup0";
>   };
> 
>   qup_spi0_cs_gpio: qup-spi0-cs-gpio {
>     pins = "gpio3";
>     function = "gpio";
>   };
> };
> 
> 
> > +                       qup_uart0_default: qup-uart0-default {
> > +                               pinmux {
> > +                                       pins = "gpio0", "gpio1",
> > +                                              "gpio2", "gpio3";
> > +                                       function = "qup00";
> > +                               };
> > +                       };
> 
> I suspect things would actually be cleaner if we broke the uart lines
> up since the boards tend to have to adjust pulls differently for each
> line. With the new "no pinconf / pinmux" world it's pretty clean. It's
> obviously up to Bjorn, but if it were me I'd request this in the SoC
> file:
> 

I'd like that.

> qup_uart0_cts: qup-uart0-cts {
>   pins = "...";
>   function = "qup00";
> };
> 
> qup_uart0_rts: qup-uart0-rts {
>   pins = "...";
>   function = "qup00";
> };
> 
> qup_uart0_rx: qup-uart0-rx {
>   pins = "...";
>   function = "qup00";
> };
> 
> qup_uart0_tx: qup-uart0-tx {
>   pins = "...";
>   function = "qup00";
> };
> 
> ...and now when the board file wants to adjust the pulls they can just
> reference each one:
> 
> /*
>  * Comments about why the UART0 pulls make sense.
>  * Blah blah blah.
>  */
> 
> &qup_uart0_cts {
>   bias-pull-down;
> };
> 
> &qup_uart0_rts {
>   drive-strength = <2>;
>   bias-disable;
> };
> 
> &qup_uart0_rx {
>   bias-pull-up;
> };
> 
> &qup_uart0_tx {
>   drive-strength = <2>;
>   bias-disable;
> };
> 
> 
> > +               qspi: spi@88dc000 {
> 
> I believe the qspi node is sorted incorrectly. When I apply this to
> the top of the Qualcomm tree it shows up after the "apps_smmu:
> iommu@15000000" node. However:
> 
> 0x088dc000 < 0x15000000
> 
> ...which means it should be _before_.
> 
> -Doug
