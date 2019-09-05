Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C26EAAA73
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2019 19:58:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729101AbfIER6K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Sep 2019 13:58:10 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:55552 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726837AbfIER6K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Sep 2019 13:58:10 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 0F534602EE; Thu,  5 Sep 2019 17:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1567706289;
        bh=nFWYzMin0X86XFTxfBQkZ2g+xZj2gnwJ+osEMBqkGZU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FsaSvgx2rDCQBAhofHKJipypjSWuP4UJBf/hWGAL2CkGE1E2aHGCCJYIBBAGlvmWK
         ZIk6utDAsL3XS+/PqeJFAbZHF8XE4XEK6XwI7AF0MUSJrWLhDFPt0cV6sFsJYGrewE
         iUrDBXfMUsfYlYeJN7/8iF7e5IJJlRAdqtDSlZnM=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jackp@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 980E7602EE;
        Thu,  5 Sep 2019 17:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1567706287;
        bh=nFWYzMin0X86XFTxfBQkZ2g+xZj2gnwJ+osEMBqkGZU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BNXk2vyH0V0FYTxlPkk4085980/XQYJ9ebz2q0rsVvyjfCZr95boNa6EXs2tlC+0p
         KEqiC8BNx7d6iHpNnLzzwolJ1Q5KrNhBrFLCcU0p2tbA7TuQuLqRF9SgVKRdC5IaB9
         V+CgS9Et8DWbBQpN4I40R6gO+5yHVhNqkOHSGkRw=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 980E7602EE
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jackp@codeaurora.org
Date:   Thu, 5 Sep 2019 10:58:02 -0700
From:   Jack Pham <jackp@codeaurora.org>
To:     Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>, robh@kernel.org,
        andy.gross@linaro.org, shawn.guo@linaro.org,
        gregkh@linuxfoundation.org, mark.rutland@arm.com, kishon@ti.com,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, khasim.mohammed@linaro.org
Subject: Re: [PATCH v4 3/4] dt-bindings: Add Qualcomm USB SuperSpeed PHY
 bindings
Message-ID: <20190905175802.GA19599@jackp-linux.qualcomm.com>
References: <20190223165218.GB572@tuxbook-pro>
 <6dc0957d-5806-7643-4454-966015865d38@linaro.org>
 <5d694878.1c69fb81.5f13b.ec4f@mx.google.com>
 <20190830164520.GK26807@tuxbook-pro>
 <5d696ad2.1c69fb81.977ea.39e5@mx.google.com>
 <f3584f38-dabc-7e7a-d1cb-84c80ed26215@linaro.org>
 <20190903173924.GB9754@jackp-linux.qualcomm.com>
 <5d6edee5.1c69fb81.a3896.1d05@mx.google.com>
 <20190903233410.GQ26807@tuxbook-pro>
 <c9481b7d-4805-25c6-f40f-9cbfc40afc93@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c9481b7d-4805-25c6-f40f-9cbfc40afc93@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Jorge, Bjorn,

On Thu, Sep 05, 2019 at 09:18:57AM +0200, Jorge Ramirez wrote:
> On 9/4/19 01:34, Bjorn Andersson wrote:
> > On Tue 03 Sep 14:45 PDT 2019, Stephen Boyd wrote:
> > 
> >> Quoting Jack Pham (2019-09-03 10:39:24)
> >>> On Mon, Sep 02, 2019 at 08:23:04AM +0200, Jorge Ramirez wrote:
> >>>> On 8/30/19 20:28, Stephen Boyd wrote:
> >>>>> Quoting Bjorn Andersson (2019-08-30 09:45:20)
> >>>>>> On Fri 30 Aug 09:01 PDT 2019, Stephen Boyd wrote:
> >>>>>>
> >>>>>>>>>
> >>>>>>>>> The USB-C connector is attached both to the HS and SS PHYs, so I think
> >>>>>>>>> you should represent this external to this node and use of_graph to
> >>>>>>>>> query it.
> >>>>>>>>
> >>>>>>>> but AFAICS we wont be able to retrieve the vbux-supply from an external
> >>>>>>>> node (that interface does not exist).
> >>>>>>>>
> >>>>>>>> rob, do you have a suggestion?
> >>>>>>>
> >>>>>>> Shouldn't the vbus supply be in the phy? Or is this a situation where
> >>>>>>> the phy itself doesn't have the vbus supply going to it because the PMIC
> >>>>>>> gets in the way and handles the vbus for the connector by having the SoC
> >>>>>>> communicate with the PMIC about when to turn the vbus on and off, etc?
> >>>>>>>
> >>>>>>
> >>>>>> That's correct, the VBUS comes out of the PMIC and goes directly to the
> >>>>>> connector.
> >>>>>>
> >>>>>> The additional complicating factor here is that the connector is wired
> >>>>>> to a USB2 phy as well, so we need to wire up detection and vbus control
> >>>>>> to both of them - but I think this will be fine, if we can only figure
> >>>>>> out a sane way of getting hold of the vbus-supply.
> >>>>>>
> >>>>>
> >>>>> Does it really matter to describe this situation though? Maybe it's
> >>>>> simpler to throw the vbus supply into the phy and control it from the
> >>>>> phy driver, even if it never really goes there. Or put it into the
> >>>>> toplevel usb controller?
> >>>>>
> >>>> that would work for me - the connector definition seemed a better way to
> >>>> explain the connectivity but since we cant retrieve the supply from the
> >>>> external node is not of much functional use.
> >>>>
> >>>> but please let me know how to proceed. shall I add the supply back to
> >>>> the phy?
> >>
> >> So does the vbus actually go to the phy? I thought it never went there
> >> and the power for the phy was different (and possibly lower in voltage).
> >>
> > 
> > No, the PHYs use different - lower voltage - supplies to operate. VBUS
> > is coming from a 5V supply straight to the connector and plug-detect
> > logic (which is passive in this design).
> > 
> >>>
> >>> Putting it in the toplevel usb node makes sense to me, since that's
> >>> usually the driver that knows when it's switching into host mode and
> >>> needs to turn on VBUS. The dwc3-qcom driver & bindings currently don't 
> >>> do this but there's precedent in a couple of the other dwc3 "glues"--see
> >>> Documentation/devicetree/bindings/usb/{amlogic\,dwc3,omap-usb}.txt
> >>>
> >>> One exception is if the PMIC is also USB-PD capable and can do power
> >>> role swap, in which case the VBUS control needs to be done by the TCPM,
> >>> so that'd be a case where having vbus-supply in the connector node might
> >>> make more sense.
> >>>
> >>
> >> The other way is to implement the code to get the vbus supply out of a
> >> connector. Then any driver can do the work if it knows it needs to and
> >> we don't have to care that the vbus isn't going somewhere. I suppose
> >> that would need an of_regulator_get() sort of API that can get the
> >> regulator out of there? Or to make the connector into a struct device
> >> that can get the regulator out per some generic connector driver and
> >> then pass it through to the USB controller when it asks for it. Maybe
> >> try to prototype that out?
> >>
> > 
> > The examples given in the DT bindings describes the connector as a child
> > of a PMIC, with of_graph somehow tying it to the various inputs. But in
> > these examples vbus is handled by implicitly inside the MFD, where
> > extcon is informed about the plug event they toggle vbus as well.
> > 
> > In our case we have a extcon-usb-gpio to detect mode, which per Jorge's
> > proposal will trickle down to the PHY and become a regulator calls on
> > either some external regulator or more typically one of the chargers in
> > the system.

Interesting you mention extcon-usb-gpio. I thought extcon at least from
bindings perspective is passé now. Maybe this is what you need (just
landed in usb-next):

usb: common: add USB GPIO based connection detection driver
https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=usb-next&id=4602f3bff2669012c1147eecfe74c121765f5c56

dt-bindings: usb: add binding for USB GPIO based connection detection driver
https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=usb-next&id=f651c73e71f53f65e9846677d79d8e120452b59f

Fortunately this new driver might check the right boxes for you:
- usb connector binding
- ID detect GPIO
- vbus-supply regulator

With that, I think you can also keep the connector subnode out of the
SSPHY node well, and similarly get rid of the vbus toggle handling from
the PHY driver.

The big thing missing now is that this driver replaces extcon
completely, so we'll need handling in dwc3/dwc3-qcom to retrieve the
role switch state to know when host mode is entered. I saw this a while
back but don't think it got picked up:

https://patchwork.kernel.org/patch/10909981/

> > So if we come up with a struct device for the connector and some API for
> > toggling the vbus we're going to have to fairly abstract entities
> > representing pretty much the same thing - and in a design with a mux we
> > would have a different setup.
> 
> I am a bit unclear - not sure if we have gone full circle on this
> subject. what is then the direction to get this merged?
> 
> I did have look last week and the level of effort to support regulators
> on external nodes is not neglectable meaning that I might not have the
> time to deliver that feature (perhaps someone else wishes to take over?)
> 
> > 
> > Regards,
> > Bjorn
> > 
> 

Jack
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
