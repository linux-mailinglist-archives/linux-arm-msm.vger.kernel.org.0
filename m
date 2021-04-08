Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A8EC357A48
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 04:23:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229770AbhDHCXX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 22:23:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbhDHCXX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 22:23:23 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB785C061760
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Apr 2021 19:23:12 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id 68-20020a9d0f4a0000b02901b663e6258dso790808ott.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Apr 2021 19:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ZQM7zlrUAKKwqKxQS21G7GbZqpqSCydFFeiVwOcyGTQ=;
        b=yV8MPsWO6LQTyhdFY7wo4u4AvzjH88/86xCPkeybS6ayhhJqM6/tQoL07H6XkQ0axR
         9xHqSg5wSWbN5/SsdVU8f3+Z6S0doncsAtjBapFLg4s6l/5d/vKr0zjZ8gUgihj51NHL
         HKXZ7bNghgYummDWmnMc7yt0fFsafjVW+VMvPCTP6wT8e1gEpMw857jq+mivRQQp+mxm
         CDkIlWG5ghHKY4sxT+YcZzsmypfrBSPY6pRBQSb4cBADgCqJzm6YFS6THWejbq3nPC3p
         iN0S7VhMDwV5MNYoIWiNkTy3/NvhJ+ik1FPG5U8i5xYZH2d4YM8o0625oYoH9kmKTWWQ
         O9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ZQM7zlrUAKKwqKxQS21G7GbZqpqSCydFFeiVwOcyGTQ=;
        b=f6VFWSBIeeEqZKuzYJd4qY7Yto5Q4NKOP1AzRd2rWAfEgUm1krAFLWXMCpGZc9dOra
         U6Dx6HFnSq+19q+IwE5A1ApGXq7vB+XwE/5bfZY+GrHXMlHTFdT5eqoVZr4VbT+Oo6ie
         STNk7i9QViWJhxtrlpHlOG2OFR0YUZKO9Kaciso/7VrPLo91t8rmodZbTu5ZCFo/8hg1
         37G4gaVtN4hC/9DoiAuVt/F8z67gTh8RjbOXgfbEeAA0sTJSI9UNdfMXBGOXhTFyTnCu
         hoLchDlm+sMP2YB7Z569jC+Y1UCtp9Mwjaxa7uYk2xdbaL9ipUM5gqQXDMFxgCeJM/Jj
         46eQ==
X-Gm-Message-State: AOAM532PppHU7MAleMhKDlr26wNqBq4Ezs+av/Ywi06TliMFMLobnW3W
        kEU8Kb6Z8JomDRonf2F1WAQcIQ==
X-Google-Smtp-Source: ABdhPJwUqkXxhSvSziOBiq6Al8pQ9oyUJUdjyHGDs1UUIXS1Kh+YhPy+1rp8G7h/BmYPo85eiU1ZiA==
X-Received: by 2002:a9d:480d:: with SMTP id c13mr5513898otf.149.1617848592345;
        Wed, 07 Apr 2021 19:23:12 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id e15sm5739135otk.64.2021.04.07.19.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 19:23:11 -0700 (PDT)
Date:   Wed, 7 Apr 2021 21:23:09 -0500
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
Message-ID: <20210408022309.GL904837@yoga>
References: <8fc38cb73afd31269f1ea0c28e73604c53cebb17.1612764006.git.baruch@tkos.co.il>
 <f3042097-8569-5882-06db-ae56e05cac59@synopsys.com>
 <8cc9617dc62be17ac3a9420e7750b0ee@codeaurora.org>
 <4e5a3487-bae2-b21a-df90-80b5f0d170ba@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4e5a3487-bae2-b21a-df90-80b5f0d170ba@synopsys.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 07 Apr 20:53 CDT 2021, Thinh Nguyen wrote:

> Kathiravan T wrote:
> > On 2021-03-31 06:47, Thinh Nguyen wrote:
> >> Baruch Siach wrote:
> >>> From: Balaji Prakash J <bjagadee@codeaurora.org>
> >>>
> >>> DWC_USB3_GFLADJ and DWC_USB3_GUCTL registers contain options
> >>> to control the behavior of controller with respect to SOF and ITP.
> >>> The reset values of these registers are aligned for 19.2 MHz
> >>> reference clock source. This change will add option to override
> >>> these settings for reference clock other than 19.2 MHz
> >>>
> >>> Tested on IPQ6018 SoC based CP01 board with 24MHz reference clock.
> >>>
> >>> Signed-off-by: Balaji Prakash J <bjagadee@codeaurora.org>
> >>> [ baruch: mention tested hardware ]
> >>> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> >>> ---
> >>>  .../devicetree/bindings/usb/dwc3.txt          |  5 ++
> >>>  drivers/usb/dwc3/core.c                       | 52 +++++++++++++++++++
> >>>  drivers/usb/dwc3/core.h                       | 12 +++++
> >>>  3 files changed, 69 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt
> >>> b/Documentation/devicetree/bindings/usb/dwc3.txt
> >>> index 1aae2b6160c1..4ffa87b697dc 100644
> >>> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
> >>> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
> >>> @@ -89,6 +89,11 @@ Optional properties:
> >>>   - snps,quirk-frame-length-adjustment: Value for GFLADJ_30MHZ field
> >>> of GFLADJ
> >>>      register for post-silicon frame length adjustment when the
> >>>      fladj_30mhz_sdbnd signal is invalid or incorrect.
> >>> + - snps,quirk-ref-clock-adjustment: Value for GFLADJ_REFCLK_* fields
> >>> of GFLADJ
> >>> +    register for reference clock other than 19.2 MHz is used.
> >>> + - snps,quirk-ref-clock-period: Value for REFCLKPER filed of GUCTL.
> >>> This field
> >>> +    indicates in terms of nano seconds the period of ref_clk. To
> >>> calculate the
> >>> +    ideal value, REFCLKPER = (1/ref_clk in Hz)*10^9.
> >>
> >> Why is this a quirk? It's not a quirk. The user can inform the ref_clk
> >> period to the controller here.
> >>
> >> The default value from GUCTL.REFCLKPER is a value from coreConsultant
> >> setting. The designer knows what period it should be and should properly
> >> set it if the default is not correctly set.
> > 
> > Thanks Thinh for your inputs. Can we have the DT property for both the
> > GUCTL.REFCLKPER and GFLADJ.REFCLK* fields?
> > Since GFLADJ.REFCLK* field values derived based on the GUCTL.REFCLKPER.
> > In other words, are you fine with the
> > approach followed here? If so, we can work on the nitpicks and send the V2.
> > 
> > Please let us know your thoughts on this.
> > 
> 
> Hi Kathiravan,
> 
> Yes, IMO, using DT properties work just fine to inform the controller if
> the default settings don't match the HW configuration.

I'm not against using a separate DT property if the information it
provides can't be derived from what's already there.

> As I mention in
> the separate email thread, using clk_get_rate() doesn't make sense for
> PCI devices.
> 

I'm sorry, can you help me understand why this relate to PCI?

> The snps,quirk-ref-clock-adjustment property updates multiple fields of
> the GFLADJ and not just GFLADJ_REFCLK_FLADJ. I'd suggest to split them
> to different properties for different fields for clarity. If the other
> fields of GFLADJ.REFCLK_* are derived based on the GUCTL.REFCLKPER
> according to the example of the programming guide, then do that
> calculation in the driver as default.

It sounds to me that rather than saying "refclk is X MHz" you propose a
set or properties in the line of "write X, Y, Z to these registers",
which isn't what we typically put in DT.

Regards,
Bjorn

> However, I'd suggest to create a
> separate property (maybe "snps,use-refclk-for-sof-itp"?) to select
> GFLADJ.GFLADJ_REFCLK_LPM_SEL or GCTL.SOFITPSYNC depending whether the
> controller is operating as host or device mode.
> Note that this feature
> is only available for DWC_usb32 and DWC_usb31 v1.80a or higher. I need
> to double check for DWC_usb3 IP, but I believe it's v3.30a or higher.
> 
> Btw, we don't need to mention 19.2 MHz since it's the specific default
> configuration of your setup. Other setups may not be the same.
> 
> BR,
> Thinh
