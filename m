Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 693D8A71D1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2019 19:39:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729860AbfICRja (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Sep 2019 13:39:30 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:36864 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727662AbfICRja (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Sep 2019 13:39:30 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id C98BB608FF; Tue,  3 Sep 2019 17:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1567532368;
        bh=xKD/ENinILDUC661caazKHdhGNze9nJEsqCHmhYq/gI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mSaHHI4HlqZuevjNtneF5Fa2yJjpP7bfH9j9pabBFRGe2jeFBT8mW9GzJPts/jfhS
         X3LvycC7PVgj6ebntpN4mHQyNl6fk+wPTvVN62n/ytmfCZdEFBnZHrbYmABrjNTKw7
         bliWM9PTZ5qt6qS7ysbpzLR53CqNUkYOuLQlcQfg=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EF13C602DC;
        Tue,  3 Sep 2019 17:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1567532366;
        bh=xKD/ENinILDUC661caazKHdhGNze9nJEsqCHmhYq/gI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FcbIZ/0q69EnCWiymdG7m0I+ACVb6+Yw9NnKnzl+XyDOR89aqQpX2ebgNrgB1GS7Z
         LJ7N5D2R1hF4yrXVwlMyOHwD00Q1EMANIY0r0jA/4pBPA3BUDQj7RwDk2/j/BQ7/n/
         IB6yq6j6JC7XeMKSOSo3R0uwCk6DUCRQEiVdWhqg=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EF13C602DC
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jackp@codeaurora.org
Date:   Tue, 3 Sep 2019 10:39:24 -0700
From:   Jack Pham <jackp@codeaurora.org>
To:     Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>, robh@kernel.org,
        andy.gross@linaro.org, shawn.guo@linaro.org,
        gregkh@linuxfoundation.org, mark.rutland@arm.com, kishon@ti.com,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, khasim.mohammed@linaro.org
Subject: Re: [PATCH v4 3/4] dt-bindings: Add Qualcomm USB SuperSpeed PHY
 bindings
Message-ID: <20190903173924.GB9754@jackp-linux.qualcomm.com>
References: <20190207111734.24171-1-jorge.ramirez-ortiz@linaro.org>
 <20190207111734.24171-4-jorge.ramirez-ortiz@linaro.org>
 <20190223165218.GB572@tuxbook-pro>
 <6dc0957d-5806-7643-4454-966015865d38@linaro.org>
 <5d694878.1c69fb81.5f13b.ec4f@mx.google.com>
 <20190830164520.GK26807@tuxbook-pro>
 <5d696ad2.1c69fb81.977ea.39e5@mx.google.com>
 <f3584f38-dabc-7e7a-d1cb-84c80ed26215@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3584f38-dabc-7e7a-d1cb-84c80ed26215@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Sep 02, 2019 at 08:23:04AM +0200, Jorge Ramirez wrote:
> On 8/30/19 20:28, Stephen Boyd wrote:
> > Quoting Bjorn Andersson (2019-08-30 09:45:20)
> >> On Fri 30 Aug 09:01 PDT 2019, Stephen Boyd wrote:
> >>
> >>> Quoting Jorge Ramirez (2019-08-29 00:03:48)
> >>>> On 2/23/19 17:52, Bjorn Andersson wrote:
> >>>>> On Thu 07 Feb 03:17 PST 2019, Jorge Ramirez-Ortiz wrote:
> >>>>>> +
> >>>>>> +Required child nodes:
> >>>>>> +
> >>>>>> +- usb connector node as defined in bindings/connector/usb-connector.txt
> >>>>>> +  containing the property vbus-supply.
> >>>>>> +
> >>>>>> +Example:
> >>>>>> +
> >>>>>> +usb3_phy: usb3-phy@78000 {
> >>>>>> +    compatible = "qcom,snps-usb-ssphy";
> >>>>>> +    reg = <0x78000 0x400>;
> >>>>>> +    #phy-cells = <0>;
> >>>>>> +    clocks = <&rpmcc RPM_SMD_LN_BB_CLK>,
> >>>>>> +             <&gcc GCC_USB_HS_PHY_CFG_AHB_CLK>,
> >>>>>> +             <&gcc GCC_USB3_PHY_PIPE_CLK>;
> >>>>>> +    clock-names = "ref", "phy", "pipe";
> >>>>>> +    resets = <&gcc GCC_USB3_PHY_BCR>,
> >>>>>> +             <&gcc GCC_USB3PHY_PHY_BCR>;
> >>>>>> +    reset-names = "com", "phy";
> >>>>>> +    vdd-supply = <&vreg_l3_1p05>;
> >>>>>> +    vdda1p8-supply = <&vreg_l5_1p8>;
> >>>>>> +    usb3_c_connector: usb3-c-connector {
> >>>
> >>> Node name should be 'connector', not usb3-c-connector.
> >>>
> >>
> >> It probably has to be usb-c-connector, because we have a
> >> micro-usb-connector on the same board.
> > 
> > Ok. Or connector@1 and connector@2? Our toplevel node container story is
> > sort of sad because we have to play tricks with node names. But in the
> > example, just connector I presume? 
> > 
> >>
> >>>>>
> >>>>> The USB-C connector is attached both to the HS and SS PHYs, so I think
> >>>>> you should represent this external to this node and use of_graph to
> >>>>> query it.
> >>>>
> >>>> but AFAICS we wont be able to retrieve the vbux-supply from an external
> >>>> node (that interface does not exist).
> >>>>
> >>>> rob, do you have a suggestion?
> >>>
> >>> Shouldn't the vbus supply be in the phy? Or is this a situation where
> >>> the phy itself doesn't have the vbus supply going to it because the PMIC
> >>> gets in the way and handles the vbus for the connector by having the SoC
> >>> communicate with the PMIC about when to turn the vbus on and off, etc?
> >>>
> >>
> >> That's correct, the VBUS comes out of the PMIC and goes directly to the
> >> connector.
> >>
> >> The additional complicating factor here is that the connector is wired
> >> to a USB2 phy as well, so we need to wire up detection and vbus control
> >> to both of them - but I think this will be fine, if we can only figure
> >> out a sane way of getting hold of the vbus-supply.
> >>
> > 
> > Does it really matter to describe this situation though? Maybe it's
> > simpler to throw the vbus supply into the phy and control it from the
> > phy driver, even if it never really goes there. Or put it into the
> > toplevel usb controller?
> > 
> that would work for me - the connector definition seemed a better way to
> explain the connectivity but since we cant retrieve the supply from the
> external node is not of much functional use.
> 
> but please let me know how to proceed. shall I add the supply back to
> the phy?

Putting it in the toplevel usb node makes sense to me, since that's
usually the driver that knows when it's switching into host mode and
needs to turn on VBUS. The dwc3-qcom driver & bindings currently don't 
do this but there's precedent in a couple of the other dwc3 "glues"--see
Documentation/devicetree/bindings/usb/{amlogic\,dwc3,omap-usb}.txt

One exception is if the PMIC is also USB-PD capable and can do power
role swap, in which case the VBUS control needs to be done by the TCPM,
so that'd be a case where having vbus-supply in the connector node might
make more sense.

Jack
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
