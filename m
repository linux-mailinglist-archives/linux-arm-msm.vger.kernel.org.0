Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C0DC273789
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Sep 2020 02:36:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728565AbgIVAgK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Sep 2020 20:36:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728608AbgIVAgK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Sep 2020 20:36:10 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D99E4C0613D0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 17:36:09 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id w16so19099218oia.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 17:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=c7d1ZHf6hruUfheuX8IrRgfyoHv969LCspu96Gk4jWw=;
        b=bGE5yCUmr0pws3QG29/8q+aHDyYYYNNc0WDpPBYqLlP5eBQN1C81DRyriyDz/PUBWq
         0PnLvXuaWQDvYbTUusp0Wxy4hbGxL6J4wKE4e2YlpBm+/Bffb4HO+iMM/kv3XKNio3fh
         ZJQWkRorKSfkk8+XHv99H3Cksd1nfRbmJB+Vwydug6Hupt5I5/uCbT7536vK+JmObKCu
         6vsrYuSlIuw1O89pqRLnuO0P0uf8MPedPN7+9GbmEFyvWPnZJJ35ZIYzRkiYcfiUHOGU
         OkUyTmZpRkVRvasaxIL6Wa+/h8sWYuNOtCrADUKRu/tEPIzsSP1GSs1/0+v2TrcghqL1
         e4XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=c7d1ZHf6hruUfheuX8IrRgfyoHv969LCspu96Gk4jWw=;
        b=mAIBAeHfFEjCMndl+jEjPuWj3GtFcNckWTex2UWymySQX0+eMnLAu75FSPKxYgn9uT
         ar5JaVa8VBqXfMScRrLuMV/hvV63nduEGjd5csmK4MauLIqv/UDGeP+pWM+qn1a1hxT7
         CHrEjAHftZ/mESEHCcpLyIFOx8b75ABTmOJ/avuI6N+VTO1JjvxePEdC0OxNgy5oZShO
         W3dkW9zjKW6nICCpwODHJ4bB5EY3NyVc9AgE818OFA2oTOrtD4FDDSkMxCqghaeibp/N
         2fO/N+VwX9aMqHi/va3Yvm7sTGGFMtiBXgFsfeFo+MW0C17dhTR4Z7xRv56xk67Bnukv
         G2ig==
X-Gm-Message-State: AOAM5335D/zQ+okvEdWrcKepT/HV7MvXh9H2PoPHfBAWiMzZUgURvKvX
        k5PyBXZ0bHBxi+Th7mmxFtszVJ8gPHB9kAsM
X-Google-Smtp-Source: ABdhPJzRh/kSLe9FlVRP8uOIfw614cbOwwASFz3QQg3rNYhkKb5K0FpVQgh+cY1XdsQU3gFoNRbJRQ==
X-Received: by 2002:a54:411a:: with SMTP id l26mr1109432oic.12.1600734968942;
        Mon, 21 Sep 2020 17:36:08 -0700 (PDT)
Received: from yoga (99-135-181-32.lightspeed.austtx.sbcglobal.net. [99.135.181.32])
        by smtp.gmail.com with ESMTPSA id 187sm7181376oie.42.2020.09.21.17.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 17:36:08 -0700 (PDT)
Date:   Mon, 21 Sep 2020 19:36:06 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     nguyenb@codeaurora.org
Cc:     Rob Herring <robh@kernel.org>, Can Guo <cang@codeaurora.org>,
        Asutosh Das <asutoshd@codeaurora.org>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        SCSI <linux-scsi@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Avri Altman <Avri.Altman@wdc.com>,
        Vinod Koul <vkoul@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/2] scsi: dt-bindings: ufs: Add vcc-voltage-level for
 UFS
Message-ID: <20200922003606.GA40811@yoga>
References: <cover.1598939393.git.nguyenb@codeaurora.org>
 <0a9d395dc38433501f9652a9236856d0ac840b77.1598939393.git.nguyenb@codeaurora.org>
 <20200914183505.GA357@bogus>
 <d332e61cea4fef237507f1404efa724a@codeaurora.org>
 <CAL_Jsq+YV-GjAhVVHtgNz6xFR=bEgSwWKY+QGixRQJ5Ov75pag@mail.gmail.com>
 <e489cee219d48e9f5e48dc30518f445b@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e489cee219d48e9f5e48dc30518f445b@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 21 Sep 19:22 CDT 2020, nguyenb@codeaurora.org wrote:

> On 2020-09-18 12:01, Rob Herring wrote:
> > On Tue, Sep 15, 2020 at 2:10 AM <nguyenb@codeaurora.org> wrote:
> > > 
> > > On 2020-09-14 11:35, Rob Herring wrote:
> > > > On Mon, Aug 31, 2020 at 11:00:47PM -0700, Bao D. Nguyen wrote:
> > > >> UFS's specifications supports a range of Vcc operating
> > > >> voltage levels. Add documentation for the UFS's Vcc voltage
> > > >> levels setting.
> > > >>
> > > >> Signed-off-by: Can Guo <cang@codeaurora.org>
> > > >> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
> > > >> Signed-off-by: Bao D. Nguyen <nguyenb@codeaurora.org>
> > > >> ---
> > > >>  Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt | 2 ++
> > > >>  1 file changed, 2 insertions(+)
> > > >>
> > > >> diff --git a/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
> > > >> b/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
> > > >> index 415ccdd..7257b32 100644
> > > >> --- a/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
> > > >> +++ b/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
> > > >> @@ -23,6 +23,8 @@ Optional properties:
> > > >>                            with "phys" attribute, provides phandle to
> > > >> UFS PHY node
> > > >>  - vdd-hba-supply        : phandle to UFS host controller supply
> > > >> regulator node
> > > >>  - vcc-supply            : phandle to VCC supply regulator node
> > > >> +- vcc-voltage-level     : specifies voltage levels for VCC supply.
> > > >> +                          Should be specified in pairs (min, max),
> > > >> units uV.
> > > >
> > > > The expectation is the regulator pointed to by 'vcc-supply' has the
> > > > voltage constraints. Those constraints are supposed to be the board
> > > > constraints, not the regulator operating design constraints. If that
> > > > doesn't work for your case, then it should be addressed in a common way
> > > > for the regulator binding.
> > > The UFS regulator has a min_uV and max_uV limits. Currently, the min
> > > and
> > > max are hardcoded
> > > to UFS2.1 Spec allowed values of 2.7V and 3.6V respectively.
> > > With this change, I am trying to fix a couple issues:
> > > 1. The 2.7V min value only applies to UFS2.1 devices. with UFS3.0+
> > > devices, the VCC min should be 2.4V.
> > > Hardcoding the min_uV to 2.7V does not work for UFS3.0+ devices.
> > 
> > Don't you know the device version attached and can adjust the voltage
> > based on that? Or you have to set the voltage first?
> Yes it is one of the solutions. Once detect the UFS device is version 3.0+,
> you can lower
> the voltage to 2.5V from the hardcoded value used by the driver. However, to
> change the
> Vcc voltage, the host needs to follow a sequence to ensure safe operations
> after Vcc change
> (device has to be in sleep mode, Vcc needs to go down to 0 then up to 2.5V.)
> Also same sequence is repeated for every host initialization which is
> inconvenient.
> 

It sounds like you're suggesting that we detect the UFS device using
some voltage, then depending on version we might lower it to 2.5V.

I'm afraid I don't see any of this either documented or implemented in
these patches.

What is this initial detection voltage and how to you configure it?

Regards,
Bjorn

> > 
> > > 2. Allow users to select a different Vcc voltage within the allowed
> > > range.
> > > Using the min value, the UFS device is operating at marginal Vcc
> > > voltage.
> > > In addition the PMIC and the board designs may add some variables
> > > especially at extreme
> > > temperatures. We observe stability issues when using the min Vcc
> > > voltage.
> > 
> > Again, we have standard regulator properties for this already that you
> > can tune per board.
> Thank you for the suggestion.
> 
> > 
> > Rob
