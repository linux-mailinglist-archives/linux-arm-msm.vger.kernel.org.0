Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F4C2FFD28
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2019 03:41:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726336AbfKRClv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 Nov 2019 21:41:51 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:43531 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725905AbfKRClu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 Nov 2019 21:41:50 -0500
Received: by mail-pg1-f196.google.com with SMTP id l24so8851242pgh.10
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Nov 2019 18:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=fJYb6L5a/iapIcfwsY2PvjI2V490sWHh3NSh3Twoa4Y=;
        b=EE0onkOYhoERx7brBXEdiRX+DN2MPuKcFBxWvEf87vIBM4uJXkTis6SKeET/uw31pX
         +w9ATldpV/J95BZ5Km7rkWdMLPeOHWyxx664EFOFjXYqSYjbHLO+M7CAihPdZaNwFB1D
         cUc36wTD8Z8TztXNEYYABOr9PgY2r7Mkqg7AuqAa1nXHGsfg8f5jGPjImNFroBvnBivh
         VhFhHS/kgRKBLN1wDK421Dmc87tqBBFTbBKxMiYxQK+6BBG//jZvzFEu7DcmQirWbsU3
         0fxDtDUiQB1iglSrs6Tmm1aZ0DhNGU/dTQaU+I90GT4BohQwRgtsQbaqdQW4Qq81nsUA
         sJ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fJYb6L5a/iapIcfwsY2PvjI2V490sWHh3NSh3Twoa4Y=;
        b=inkmcPXhQTN4gVBx8Xo5kGiVAsPEgAu6LEgGK3JAMNYB4msargUnzmRHGjHKAZH5Bu
         rNnYFfhKT5bzVKA5pz1bfxcOvgl3i7JWm4iqgT3CBQsrt3UKI706zHeZ0IPyy5iSv1fV
         DzmA4SDpfvQXpY9LUbSgyjP7mD/CrupE/8CWgTv2I1r5f7YzNS9nlVbbJMYFj9arY7xX
         fYmcMhvz056lnAmi+pj/P8qOgD/KU0/DBX30DMm3C+MqWBEmGeagnJIF+mse0VHxoG6J
         jHY2L9yvWkZ5MMFzUn46bGdAoyHrsqc+QxvvR6qH5O11zTf7fqAeau/OqrHnj6iosMhO
         aTNA==
X-Gm-Message-State: APjAAAXPB2pW2XKQww9RtGMqKBNRJWyzxyYlhbFJppbhm0qnYdyebenY
        HwHXbQm0UmyFnEf4kofWubW5bA==
X-Google-Smtp-Source: APXvYqx9PzHEY2s7nymmHBLR7qypFLfgeJJM/LJIfMC5Mu4iS1J3yTMR/wcdeDGp6z1pLnJy4y8fjw==
X-Received: by 2002:a63:4d8:: with SMTP id 207mr7410369pge.441.1574044908379;
        Sun, 17 Nov 2019 18:41:48 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 12sm18133068pjm.11.2019.11.17.18.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Nov 2019 18:41:47 -0800 (PST)
Date:   Sun, 17 Nov 2019 18:41:45 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: msm8998-mtp: Add alias for blsp1_uart3
Message-ID: <20191118024145.GC25371@yoga>
References: <20191116064415.159899-1-bjorn.andersson@linaro.org>
 <CAOCk7Nov_HvZe1Z6COd2z=VUf=mVbvqS4wjqU4Ee=F1qR_KKww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOCk7Nov_HvZe1Z6COd2z=VUf=mVbvqS4wjqU4Ee=F1qR_KKww@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat 16 Nov 14:24 PST 2019, Jeffrey Hugo wrote:

> On Fri, Nov 15, 2019 at 11:44 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > The msm_serial driver uses a simple counter to determine which port to
> > use when no alias is defined, but there's no logic to prevent this from
> 
> Which port to use for what, the default console?
> 

The driver defines three (3) struct uart_ports (wrapped in struct
msm_ports), see msm_uart_port[] around line 1538 in msm_serial.c

This means that you can have a whooping 3 instances of msm_serial in the
system and per the logic found in msm_serial_probe() the allocation
follows the serial%d aliases defined and for entries without an alias a
simple counter, starting at 0 is used.

> > not colliding with what's defined by the aliases. As a result either
> > none or all of the active msm_serial instances must be listed as
> > aliases.
> >
> > Define blsp1_uart3 as "serial1" to mitigate this problem.
> >
> > Fixes: 4cffb9f2c700 ("arm64: dts: qcom: msm8998-mtp: Enable bluetooth")
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> That driver behavior seems like a strange thing to be doing.
> 
> If you clarify the question above, -
> Reviewed-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> 

Thanks, I'll respin the message to properly document this behavior.

Regards,
Bjorn

> > ---
> >  arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
> > index 5f101a20a20a..e08fcb426bbf 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
> > @@ -9,6 +9,7 @@
> >  / {
> >         aliases {
> >                 serial0 = &blsp2_uart1;
> > +               serial1 = &blsp1_uart3;
> >         };
> >
> >         chosen {
> > --
> > 2.23.0
> >
