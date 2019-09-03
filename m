Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1273A7795
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2019 01:32:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727168AbfICXcG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Sep 2019 19:32:06 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:33417 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726965AbfICXcF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Sep 2019 19:32:05 -0400
Received: by mail-pf1-f195.google.com with SMTP id q10so6854660pfl.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Sep 2019 16:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=LfTKMbZe2QVHemXyI/fIb1Ivk454nudy7JvQKOTshZI=;
        b=hhxlaIHTv3gXPMOEiEPTnhAjD9Y6bAgnhOJMrJaoKWITBLAEEXo3g+Dr2AbD2y2cNW
         aVavGUpAgsD4jBtLtEdcSxEL4wLAtcHcQKJ+FN+dvjfpwYreNISdkKS6biYVAK6DtoAA
         Zk0HK2Zi15ceZYkRx0KmoAQUwfHZ/KUWv1S/klYU/mGRS+G98nPqD3x9ggg1VsPL/TRD
         tan1EttguFZmZzPYbMfKngbDKfMfRPDmpDkOw1ekyVuS2GOV7CzX1zIu+KtLeRFee8U3
         p7MkywnwKuyKa3RQPnqFQoCteQJuhSKOBDHg/btqO/Wkmv67b/R11k8TlQP68drElMhr
         MsEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LfTKMbZe2QVHemXyI/fIb1Ivk454nudy7JvQKOTshZI=;
        b=Vf8rWbRJRYkAhKps1DR/gX6CGVAdWRxgPAUOvOHKrCuixclzi3gGVWO/4bfBDrixpC
         G3HTPkqfhJPFKf4IAp43Rx1cSpPGNUbPzHxW5Y9keXXSjZF/SyYJb6Ppx6W51ZbtCqtt
         STHF5yyzyunw2/44CM7FeYWsiPUAFWWoWgI177T32rgvMEegr1b4dwx47JfyY5E0SIia
         Kg0hBs/fid0d5gy+GJYYZ2iyySBzepuUaCyCIh3bNCtkBXrvw+dSMuFmfa4AHqx/pX2z
         P4ljoxYBTPhxRKPPZqKh7rCS5Gfa1D7mP31XoE+z/12Me1M0DZpB7Qg9OFxRmRYWL3gX
         /flQ==
X-Gm-Message-State: APjAAAUMYCP8TgVaW0T1C/SQBSQGoDvYpiXB67QLm1NeUO3kGF3xBdOu
        VxUAotdR7V0ud7jS9bxKdncsgA==
X-Google-Smtp-Source: APXvYqzOEVmuwaiwOAKa84Gb6UNz3WotsIqSI/TBfnStU4C0+10SnuM4+VTmlepgJynzri/fsmD3jg==
X-Received: by 2002:a63:3fc9:: with SMTP id m192mr33069603pga.429.1567553524617;
        Tue, 03 Sep 2019 16:32:04 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id a29sm29714392pfr.152.2019.09.03.16.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2019 16:32:03 -0700 (PDT)
Date:   Tue, 3 Sep 2019 16:34:10 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Jack Pham <jackp@codeaurora.org>,
        Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>,
        robh@kernel.org, andy.gross@linaro.org, shawn.guo@linaro.org,
        gregkh@linuxfoundation.org, mark.rutland@arm.com, kishon@ti.com,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, khasim.mohammed@linaro.org
Subject: Re: [PATCH v4 3/4] dt-bindings: Add Qualcomm USB SuperSpeed PHY
 bindings
Message-ID: <20190903233410.GQ26807@tuxbook-pro>
References: <20190207111734.24171-1-jorge.ramirez-ortiz@linaro.org>
 <20190207111734.24171-4-jorge.ramirez-ortiz@linaro.org>
 <20190223165218.GB572@tuxbook-pro>
 <6dc0957d-5806-7643-4454-966015865d38@linaro.org>
 <5d694878.1c69fb81.5f13b.ec4f@mx.google.com>
 <20190830164520.GK26807@tuxbook-pro>
 <5d696ad2.1c69fb81.977ea.39e5@mx.google.com>
 <f3584f38-dabc-7e7a-d1cb-84c80ed26215@linaro.org>
 <20190903173924.GB9754@jackp-linux.qualcomm.com>
 <5d6edee5.1c69fb81.a3896.1d05@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d6edee5.1c69fb81.a3896.1d05@mx.google.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 03 Sep 14:45 PDT 2019, Stephen Boyd wrote:

> Quoting Jack Pham (2019-09-03 10:39:24)
> > On Mon, Sep 02, 2019 at 08:23:04AM +0200, Jorge Ramirez wrote:
> > > On 8/30/19 20:28, Stephen Boyd wrote:
> > > > Quoting Bjorn Andersson (2019-08-30 09:45:20)
> > > >> On Fri 30 Aug 09:01 PDT 2019, Stephen Boyd wrote:
> > > >>
> > > >>>>>
> > > >>>>> The USB-C connector is attached both to the HS and SS PHYs, so I think
> > > >>>>> you should represent this external to this node and use of_graph to
> > > >>>>> query it.
> > > >>>>
> > > >>>> but AFAICS we wont be able to retrieve the vbux-supply from an external
> > > >>>> node (that interface does not exist).
> > > >>>>
> > > >>>> rob, do you have a suggestion?
> > > >>>
> > > >>> Shouldn't the vbus supply be in the phy? Or is this a situation where
> > > >>> the phy itself doesn't have the vbus supply going to it because the PMIC
> > > >>> gets in the way and handles the vbus for the connector by having the SoC
> > > >>> communicate with the PMIC about when to turn the vbus on and off, etc?
> > > >>>
> > > >>
> > > >> That's correct, the VBUS comes out of the PMIC and goes directly to the
> > > >> connector.
> > > >>
> > > >> The additional complicating factor here is that the connector is wired
> > > >> to a USB2 phy as well, so we need to wire up detection and vbus control
> > > >> to both of them - but I think this will be fine, if we can only figure
> > > >> out a sane way of getting hold of the vbus-supply.
> > > >>
> > > > 
> > > > Does it really matter to describe this situation though? Maybe it's
> > > > simpler to throw the vbus supply into the phy and control it from the
> > > > phy driver, even if it never really goes there. Or put it into the
> > > > toplevel usb controller?
> > > > 
> > > that would work for me - the connector definition seemed a better way to
> > > explain the connectivity but since we cant retrieve the supply from the
> > > external node is not of much functional use.
> > > 
> > > but please let me know how to proceed. shall I add the supply back to
> > > the phy?
> 
> So does the vbus actually go to the phy? I thought it never went there
> and the power for the phy was different (and possibly lower in voltage).
> 

No, the PHYs use different - lower voltage - supplies to operate. VBUS
is coming from a 5V supply straight to the connector and plug-detect
logic (which is passive in this design).

> > 
> > Putting it in the toplevel usb node makes sense to me, since that's
> > usually the driver that knows when it's switching into host mode and
> > needs to turn on VBUS. The dwc3-qcom driver & bindings currently don't 
> > do this but there's precedent in a couple of the other dwc3 "glues"--see
> > Documentation/devicetree/bindings/usb/{amlogic\,dwc3,omap-usb}.txt
> > 
> > One exception is if the PMIC is also USB-PD capable and can do power
> > role swap, in which case the VBUS control needs to be done by the TCPM,
> > so that'd be a case where having vbus-supply in the connector node might
> > make more sense.
> > 
> 
> The other way is to implement the code to get the vbus supply out of a
> connector. Then any driver can do the work if it knows it needs to and
> we don't have to care that the vbus isn't going somewhere. I suppose
> that would need an of_regulator_get() sort of API that can get the
> regulator out of there? Or to make the connector into a struct device
> that can get the regulator out per some generic connector driver and
> then pass it through to the USB controller when it asks for it. Maybe
> try to prototype that out?
> 

The examples given in the DT bindings describes the connector as a child
of a PMIC, with of_graph somehow tying it to the various inputs. But in
these examples vbus is handled by implicitly inside the MFD, where
extcon is informed about the plug event they toggle vbus as well.

In our case we have a extcon-usb-gpio to detect mode, which per Jorge's
proposal will trickle down to the PHY and become a regulator calls on
either some external regulator or more typically one of the chargers in
the system.


So if we come up with a struct device for the connector and some API for
toggling the vbus we're going to have to fairly abstract entities
representing pretty much the same thing - and in a design with a mux we
would have a different setup.

Regards,
Bjorn
