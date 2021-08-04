Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B93573E02F9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Aug 2021 16:22:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238659AbhHDOWn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Aug 2021 10:22:43 -0400
Received: from guitar.tcltek.co.il ([192.115.133.116]:32812 "EHLO
        mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237114AbhHDOWm (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Aug 2021 10:22:42 -0400
Received: from tarshish (unknown [10.0.8.3])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx.tkos.co.il (Postfix) with ESMTPS id 4895544011A;
        Wed,  4 Aug 2021 17:22:08 +0300 (IDT)
References: <3d86f45004fe2fcbae0a2cd197df81a1fd076a1e.1628085910.git.baruch@tkos.co.il>
 <0e99e3d453547ad2a8f4541090a03f3c80b80332.1628085910.git.baruch@tkos.co.il>
 <87lf5h5mc2.fsf@kernel.org>
User-agent: mu4e 1.4.15; emacs 27.1
From:   Baruch Siach <baruch@tkos.co.il>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Balaji Prakash J" <bjagadee@codeaurora.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        Jack Pham <jackp@codeaurora.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/6] usb: dwc3: reference clock period configuration
In-reply-to: <87lf5h5mc2.fsf@kernel.org>
Date:   Wed, 04 Aug 2021 17:22:27 +0300
Message-ID: <87v94lxpb0.fsf@tarshish>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Felipe,

On Wed, Aug 04 2021, Felipe Balbi wrote:
> Baruch Siach <baruch@tkos.co.il> writes:
>> @@ -1371,6 +1398,8 @@ static void dwc3_get_properties(struct dwc3 *dwc)
>>  				    &dwc->hsphy_interface);
>>  	device_property_read_u32(dev, "snps,quirk-frame-length-adjustment",
>>  				 &dwc->fladj);
>> +	device_property_read_u32(dev, "snps,ref-clock-period",
>> +				 &dwc->ref_clk_per);
>
> I wonder if it would make more sense to pass an actual clock reference
> here. If valid, then reconfigure the period to the value returned by
> clk_get_rate(). It would avoid yet another DT binding. If we make the
> clock optional, then we won't affect any other platforms. The clock
> itself could be a regular fixed clock node.

Thinh Nguyen asked to add a dedicated DT property. He explained that
clk_get_rate() does not work for PCI hosted dwc3. This is the most
complete summary of the discussion:

  https://lore.kernel.org/r/c797e9cb-cae6-c0b6-5714-169c2ad79d32@synopsys.com

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
