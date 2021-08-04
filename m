Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3341B3E0351
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Aug 2021 16:33:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237013AbhHDOdK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Aug 2021 10:33:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:35706 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238955AbhHDOb5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Aug 2021 10:31:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id ACEB160F35;
        Wed,  4 Aug 2021 14:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628087495;
        bh=eYtxiCOL6Sv7h7R130RHKETBBse3R3y5RSeyOc221j0=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=NDSrdXRBJX76rRp606Dq1f5kJeIUWzJOtgMrOr0Sa9MVC1GjDzsA81KdBdHrdPwtU
         ceF2MDSfIsTgzTBaig8VJlWyTpY6DYQqsWgmLLX5UTyGlMUjvOREsvim8cF00kWZTb
         5HW7WPfZSuObcHtj2c2tzYSJAn81XhapM2pUaaRrYWx7kuNN/zi7g3gnv7Rsl4Rfwm
         UjKuvaLKRBJkOYnZPBjAVgWXP2HXDsYRkSfR5oaowEQm8P9FsNQ9jIAHkp+buqI+01
         z7sDxEbSgjC0IqmoGXcTIkewuOAco3ip5EYI7k2n0rQ556DmYwTNy4PT6KWo3mPFO6
         1F1dWxB2pnbvA==
References: <3d86f45004fe2fcbae0a2cd197df81a1fd076a1e.1628085910.git.baruch@tkos.co.il>
 <0e99e3d453547ad2a8f4541090a03f3c80b80332.1628085910.git.baruch@tkos.co.il>
 <87lf5h5mc2.fsf@kernel.org> <87v94lxpb0.fsf@tarshish>
User-agent: mu4e 1.6.1; emacs 27.2
From:   Felipe Balbi <balbi@kernel.org>
To:     Baruch Siach <baruch@tkos.co.il>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Balaji Prakash J <bjagadee@codeaurora.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        Jack Pham <jackp@codeaurora.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/6] usb: dwc3: reference clock period configuration
Date:   Wed, 04 Aug 2021 17:30:42 +0300
In-reply-to: <87v94lxpb0.fsf@tarshish>
Message-ID: <87im0l5lj1.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Hi,

Baruch Siach <baruch@tkos.co.il> writes:
> Hi Felipe,
>
> On Wed, Aug 04 2021, Felipe Balbi wrote:
>> Baruch Siach <baruch@tkos.co.il> writes:
>>> @@ -1371,6 +1398,8 @@ static void dwc3_get_properties(struct dwc3 *dwc)
>>>  				    &dwc->hsphy_interface);
>>>  	device_property_read_u32(dev, "snps,quirk-frame-length-adjustment",
>>>  				 &dwc->fladj);
>>> +	device_property_read_u32(dev, "snps,ref-clock-period",
>>> +				 &dwc->ref_clk_per);
>>
>> I wonder if it would make more sense to pass an actual clock reference
>> here. If valid, then reconfigure the period to the value returned by
>> clk_get_rate(). It would avoid yet another DT binding. If we make the
>> clock optional, then we won't affect any other platforms. The clock
>> itself could be a regular fixed clock node.
>
> Thinh Nguyen asked to add a dedicated DT property. He explained that
> clk_get_rate() does not work for PCI hosted dwc3. This is the most
> complete summary of the discussion:

Hence the "optional" :-)

Or, perhaps, Thinh wants to use this for internal FPGA-based validation?

In that case, I'm okay with the property.

-- 
balbi
