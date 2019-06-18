Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64FDB49BB8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2019 10:08:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726330AbfFRIId (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jun 2019 04:08:33 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:45941 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726091AbfFRIId (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jun 2019 04:08:33 -0400
Received: by mail-wr1-f67.google.com with SMTP id f9so12784939wre.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2019 01:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=7+XK6aLqdHyJuqOe/EfmAFxcldVywlvsw3biHLfZdLw=;
        b=gWDuvQB1k7LXKzanxGhj67D7H2ev4dYzEfTQ9KTyJRTWMdc5WSxApc3f4CP8NDTKhJ
         B8tWsYPT6QZSzZvMPpOMdrqBMgSe5tgrwPeo9jRnINZ/gE8v9sbghFhTtRBHDbVQwkKs
         XGCjKTg6jhxby7RolexfP1MlSuKwvQa1siLhAU4ruK72qWSaXccSv8Jx6TLYTPKQKSmI
         fyLIZ7BpGyAJyNzkYgsfnbkNw2SnmGMhcHIAzg3YQbDGv+gkFVbJrHSD6FOF3VwOnWkU
         ksZhmV+fozc465sMggqlacQxZ5PxwKbkyv1FicFLoqEr3m1UT3BFVTdfwHcBZDS4fx9Z
         djmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=7+XK6aLqdHyJuqOe/EfmAFxcldVywlvsw3biHLfZdLw=;
        b=pJ2exK7smCvKlcLr+mx3NrL7OErHgs7IZ7tz7dtyFgKDI8QYeVCfHgy660btyrMtQA
         hvvMVYjF6FRF76wrojIWeKAXPxlOXnrSkENg2ZHcY/8xX1sVEvqlcmNcHUy/C7fOPni9
         ETDSWIxFvx/Frf0Uge9oSBeW2NVZPxcbl/FIwJE8rM84+tTJsrWxInn+XF74AXmL8opN
         TLTRh+QMiTFzPIHpt1Tn53zyNLRlVE9lrgC6JWdmv+TZpXzEBXhxzO20ZH6rOev/jdgi
         riAKLBu23nc6ZQ1EoqR9mZIJaGcnUFn5VyAEcNQ+h4rCMu9o0OAjeCSwooTAu7QxCSn9
         GRtQ==
X-Gm-Message-State: APjAAAUET+5bu+yKsFwCkgimo+A84G1h0uMm6IhtK1Wk6yh/jK7ibER7
        2n8Cbc3uytWV2WJGbRTDSfz56w==
X-Google-Smtp-Source: APXvYqwd2z7gnkyuKgUH4Vl+EJ9hNK/zuX63Cwe+vVbNOvf+uFKnW+PiW9RWY9rA+O5VoFiGEdAh0g==
X-Received: by 2002:adf:dc45:: with SMTP id m5mr12897113wrj.148.1560845311283;
        Tue, 18 Jun 2019 01:08:31 -0700 (PDT)
Received: from dell ([2.27.35.243])
        by smtp.gmail.com with ESMTPSA id u13sm9755253wrq.62.2019.06.18.01.08.30
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jun 2019 01:08:30 -0700 (PDT)
Date:   Tue, 18 Jun 2019 09:08:28 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     alokc@codeaurora.org, agross@kernel.org, david.brown@linaro.org,
        bjorn.andersson@linaro.org, gregkh@linuxfoundation.org,
        ard.biesheuvel@linaro.org, jlhugo@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND v4 0/4] I2C: DWC3 USB: Add support for ACPI based
 AArch64 Laptops
Message-ID: <20190618080828.GJ16364@dell>
References: <20190617125105.6186-1-lee.jones@linaro.org>
 <87lfy0gym0.fsf@linux.intel.com>
 <20190617132349.GI16364@dell>
 <87a7efgxw7.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87a7efgxw7.fsf@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 18 Jun 2019, Felipe Balbi wrote:
> Lee Jones <lee.jones@linaro.org> writes:
> > On Mon, 17 Jun 2019, Felipe Balbi wrote:
> >
> >> Lee Jones <lee.jones@linaro.org> writes:
> >> 
> >> > This patch-set ensures the kernel is bootable on the newly released
> >> > AArch64 based Laptops using ACPI configuration tables.  The Pinctrl
> >> > changes have been accepted, leaving only I2C (keyboard, touchpad,
> >> > touchscreen, fingerprint, etc, HID device) and USB (root filesystem,
> >> > camera, networking, etc) enablement.
> >> >
> >> > RESEND: Stripped I2C patches as they have also been merged into
> >> >         their respective subsystem.
> >> >
> >> > v4:
> >> >  * Collecting Acks
> >> >  * Adding Andy Gross' new email
> >> >  * Removing applied Pinctrl patches
> >> >
> >> > Lee Jones (4):
> >> >   soc: qcom: geni: Add support for ACPI
> >> >   usb: dwc3: qcom: Add support for booting with ACPI
> >> >   usb: dwc3: qcom: Start USB in 'host mode' on the SDM845
> >> >   usb: dwc3: qcom: Improve error handling
> >> 
> >> pushed to testing/next
> >
> > Sounds promising, thanks Felipe.
> >
> > OOI, what is your process?
> >
> > How does do the patches typically sit in there?
> 
> I'll probably merge to my 'next' branch today. I leave them in
> testing/next for a couple days, usually, so 0-day can run its thing and
> I get a chance of at least boot testing on our machines in the lab here.
> 
> Since this doesn't touch anything "generic", I don't _have_ to boot
> test, so I'll probably merge to 'next' today.

You're a star.  Thanks Felipe.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
