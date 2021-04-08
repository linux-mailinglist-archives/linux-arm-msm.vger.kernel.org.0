Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C79D5357AAA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 05:15:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229596AbhDHDPj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 23:15:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbhDHDPj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 23:15:39 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5BD7C061761
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Apr 2021 20:15:28 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id m13so684056oiw.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Apr 2021 20:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=vS5gDy+mOqDxFgD8t0ydxE+6kNfHYG1fmHl9dTi7+bM=;
        b=skoKBKkyBkHK0znA0taQcfRnLDOrrTUSmezmjwECtaAR4fLjCSOlzav6RASzEq5y7V
         WMXlNWY9pNjnWxr5bHjN022AWVeQsxSaCB8GsTM1cyV+UzEZ0JAZVLgEneEFw+k/aF/S
         AfvymeI676iNn7IXXpzorpObkRMGdW7xjM2kJuJJi69G/I6sdZE2CNUHPBdRPIsEmBgm
         Om0CQr6IejyfEWWuDpeiQDcfIoYWlJuW7v5xCpe0kndpkHUSAHLN3kq6uOahhx4o99Pk
         pjXQZ+MbMC4JNKcGV2toZpstURdJPWMgLzMTqMeAO5Y8TMRNDppFPtDAE9LodoOQMqiA
         +vAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=vS5gDy+mOqDxFgD8t0ydxE+6kNfHYG1fmHl9dTi7+bM=;
        b=SUUbN3rYh8SPv0maCfHUNvorQKa9qtLC1eny6RbnWMCclnnCnCYiixctBK4blq48QH
         fR/qJzhiaSr99irdlSwJ53NnrTru2O9wJA+mbqppQ8EKnvGPdJwSmoB63yN5muRaTnKk
         p3XwIjIGK2N8FiD6ZxYeu8Q/Aee6q1x9KDhACnXT4effAfh6hI95ay8Eh+u37OBDFcnF
         PxwWu8FukiWAcGU9DZLhWskA6ovQw2h99ZRngilSCZN2LopB1iIJTpxCvxxpCUJIeIQt
         iHe0muAWJhEt/y7V3XhSNBB6/su6i5AkRv4fdK/61quVQwDAGSCQBM5xQd4x6zQrmrec
         Ybjw==
X-Gm-Message-State: AOAM533la4r5jTe9yOTlW9rH9rRfPNSkVn/n14dfBM5mm3+PzVzxYq1u
        MwfdfZLDXphep1FK3YKbu7RWKg==
X-Google-Smtp-Source: ABdhPJzyu1o04Fg3x+z7e6Ip5IOlCLvNDVhxOmY0BZgwj0KsgYM23QZpBW770+K0Gd4Pwbgm3lb+DA==
X-Received: by 2002:a05:6808:10c5:: with SMTP id s5mr4482133ois.58.1617851727417;
        Wed, 07 Apr 2021 20:15:27 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id v6sm5154250ook.40.2021.04.07.20.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 20:15:27 -0700 (PDT)
Date:   Wed, 7 Apr 2021 22:15:25 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Kathiravan T <kathirav@codeaurora.org>,
        Baruch Siach <baruch@tkos.co.il>,
        Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        Balaji Prakash J <bjagadee@codeaurora.org>
Subject: Re: [PATCH] usb: dwc3: reference clock configuration
Message-ID: <YG51Ta6gYT1x9vXT@builder.lan>
References: <8fc38cb73afd31269f1ea0c28e73604c53cebb17.1612764006.git.baruch@tkos.co.il>
 <f3042097-8569-5882-06db-ae56e05cac59@synopsys.com>
 <8cc9617dc62be17ac3a9420e7750b0ee@codeaurora.org>
 <4e5a3487-bae2-b21a-df90-80b5f0d170ba@synopsys.com>
 <20210408022309.GL904837@yoga>
 <379f7e1a-35ce-511e-74d7-1e22451ad7a6@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <379f7e1a-35ce-511e-74d7-1e22451ad7a6@synopsys.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 07 Apr 21:50 CDT 2021, Thinh Nguyen wrote:

> Bjorn Andersson wrote:
> > On Wed 07 Apr 20:53 CDT 2021, Thinh Nguyen wrote:
> > 
> >> Kathiravan T wrote:
> >>> On 2021-03-31 06:47, Thinh Nguyen wrote:
> >>>> Baruch Siach wrote:
> >>>>> From: Balaji Prakash J <bjagadee@codeaurora.org>
> >>>>>
> >>>>> DWC_USB3_GFLADJ and DWC_USB3_GUCTL registers contain options
> >>>>> to control the behavior of controller with respect to SOF and ITP.
> >>>>> The reset values of these registers are aligned for 19.2 MHz
> >>>>> reference clock source. This change will add option to override
> >>>>> these settings for reference clock other than 19.2 MHz
> >>>>>
> >>>>> Tested on IPQ6018 SoC based CP01 board with 24MHz reference clock.
> >>>>>
> >>>>> Signed-off-by: Balaji Prakash J <bjagadee@codeaurora.org>
> >>>>> [ baruch: mention tested hardware ]
> >>>>> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> >>>>> ---
> >>>>>  .../devicetree/bindings/usb/dwc3.txt          |  5 ++
> >>>>>  drivers/usb/dwc3/core.c                       | 52 +++++++++++++++++++
> >>>>>  drivers/usb/dwc3/core.h                       | 12 +++++
> >>>>>  3 files changed, 69 insertions(+)
> >>>>>
> >>>>> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt
> >>>>> b/Documentation/devicetree/bindings/usb/dwc3.txt
> >>>>> index 1aae2b6160c1..4ffa87b697dc 100644
> >>>>> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
> >>>>> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
> >>>>> @@ -89,6 +89,11 @@ Optional properties:
> >>>>>   - snps,quirk-frame-length-adjustment: Value for GFLADJ_30MHZ field
> >>>>> of GFLADJ
> >>>>>      register for post-silicon frame length adjustment when the
> >>>>>      fladj_30mhz_sdbnd signal is invalid or incorrect.
> >>>>> + - snps,quirk-ref-clock-adjustment: Value for GFLADJ_REFCLK_* fields
> >>>>> of GFLADJ
> >>>>> +    register for reference clock other than 19.2 MHz is used.
> >>>>> + - snps,quirk-ref-clock-period: Value for REFCLKPER filed of GUCTL.
> >>>>> This field
> >>>>> +    indicates in terms of nano seconds the period of ref_clk. To
> >>>>> calculate the
> >>>>> +    ideal value, REFCLKPER = (1/ref_clk in Hz)*10^9.
> >>>>
> >>>> Why is this a quirk? It's not a quirk. The user can inform the ref_clk
> >>>> period to the controller here.
> >>>>
> >>>> The default value from GUCTL.REFCLKPER is a value from coreConsultant
> >>>> setting. The designer knows what period it should be and should properly
> >>>> set it if the default is not correctly set.
> >>>
> >>> Thanks Thinh for your inputs. Can we have the DT property for both the
> >>> GUCTL.REFCLKPER and GFLADJ.REFCLK* fields?
> >>> Since GFLADJ.REFCLK* field values derived based on the GUCTL.REFCLKPER.
> >>> In other words, are you fine with the
> >>> approach followed here? If so, we can work on the nitpicks and send the V2.
> >>>
> >>> Please let us know your thoughts on this.
> >>>
> >>
> >> Hi Kathiravan,
> >>
> >> Yes, IMO, using DT properties work just fine to inform the controller if
> >> the default settings don't match the HW configuration.
> > 
> > I'm not against using a separate DT property if the information it
> > provides can't be derived from what's already there.
> 
> That's the issue. That information is not available if dwc3 is using PCI
> bus.
> 
> > 
> >> As I mention in
> >> the separate email thread, using clk_get_rate() doesn't make sense for
> >> PCI devices.
> >>
> > 
> > I'm sorry, can you help me understand why this relate to PCI?
> 
> It's because the clock's attributes are not exposed if we're using the
> PCI bus. The driver cannot access this information unless the user
> provides it in some other way.
> 

So we have a DWC3 controller on a PCI bus, somehow described in DT, but
the refclock is derived from something that's not described as a clock
in the OS?

> > 
> >> The snps,quirk-ref-clock-adjustment property updates multiple fields of
> >> the GFLADJ and not just GFLADJ_REFCLK_FLADJ. I'd suggest to split them
> >> to different properties for different fields for clarity. If the other
> >> fields of GFLADJ.REFCLK_* are derived based on the GUCTL.REFCLKPER
> >> according to the example of the programming guide, then do that
> >> calculation in the driver as default.
> > 
> > It sounds to me that rather than saying "refclk is X MHz" you propose a
> > set or properties in the line of "write X, Y, Z to these registers",
> > which isn't what we typically put in DT.
> 
> Different fields of the register control different features and not just
> the "refclk is X MHz".
> 
> GUCTL register field REFCLKPER is "refclk is X MHz"
> 

As long as there's a technical reason why this needs to be described,
this would be a property.

> GFLADJ register field GFLADJ_REFCLK_LPM_SEL enables a feature to use
> refclk to track SOF/ITP counter
> 
> GFLADJ register field GFLADJ_REFCLK_FLADJ do adjustments to the frame
> length when running on refclk
> 
> GFLADJ register field GFLADJ_REFCLK_240MHZ_DECR is another adjustment
> for 240MHz
> 
> GFLADJ register field GFLADJ_REFCLK_240MHZDECR_PLS1 is another adjustment
> 
> My suggestion is to have 2 DT properties:
> 1) for GUCTL.REFCLKPER for "refclk is X MHz" but in term of period ns
> 2) for GFLADJ.GFLADJ_REFCLK_LPM_SEL to enable a specific feature of the
> controller. The other fields of GFLADJ can be calculated as default
> according to the programming guide.
> 

I'm not familiar with the details of these adjustments, but from what
you describe your suggestion sounds very reasonable to me.

> Is it typical that we combine different features in a single DT
> property? Which was what this orignal patch did for GFLADJ register with
> the fields mentioned above.
> 

For things that are generic yes, but otherwise the general guideline is
that things should be human readable with standard units (whenever
possible).

Thank you,
Bjorn
