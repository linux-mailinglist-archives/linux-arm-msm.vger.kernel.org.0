Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 330AE955BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2019 05:50:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729012AbfHTDru (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Aug 2019 23:47:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:53952 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728669AbfHTDru (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Aug 2019 23:47:50 -0400
Received: from localhost (unknown [106.201.62.126])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 96049206DD;
        Tue, 20 Aug 2019 03:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566272868;
        bh=WdtdvtyJ5xCApfwgYXwgjnhfk0eANksRfCR816c5iuQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mPlhU8n83WBacfgb0w/pYQnsU4ERkzlaXm0CseeOw4DGf2gydouYW4xtHp9Oycdvx
         eahuYmaV7map/WK+0TEHWV7S+jyOYbhZ+y/RAkL/PY7nPIDZMyt9Jw7lD+FUv4BWtH
         ljMfYtdpV2sJj0WdbWaw89+FQEP/nAaiSm/U+dkY=
Date:   Tue, 20 Aug 2019 09:16:37 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        sibis@codeaurora.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/22] arm64: dts: qcom: pm8150b: Add pon and adc nodes
Message-ID: <20190820034637.GO12733@vkoul-mobl.Dlink>
References: <20190814125012.8700-1-vkoul@kernel.org>
 <20190814125012.8700-11-vkoul@kernel.org>
 <20190814170803.DEFCC214DA@mail.kernel.org>
 <20190819174331.GN12733@vkoul-mobl.Dlink>
 <20190819175628.6914A22CEB@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190819175628.6914A22CEB@mail.kernel.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19-08-19, 10:56, Stephen Boyd wrote:
> Quoting Vinod Koul (2019-08-19 10:43:31)
> > On 14-08-19, 10:08, Stephen Boyd wrote:
> > > 
> > > > 
> > > > diff --git a/arch/arm64/boot/dts/qcom/pm8150b.dtsi b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
> > > > index c0a678b0f159..846197bd65cd 100644
> > > > --- a/arch/arm64/boot/dts/qcom/pm8150b.dtsi
> > > > +++ b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
> > > > @@ -2,6 +2,7 @@
> > > >  // Copyright (c) 2017-2019, The Linux Foundation. All rights reserved.
> > > >  // Copyright (c) 2019, Linaro Limited
> > > >  
> > > > +#include <dt-bindings/iio/qcom,spmi-vadc.h>
> > > >  #include <dt-bindings/interrupt-controller/irq.h>
> > > >  #include <dt-bindings/spmi/spmi.h>
> > > >  
> > > > @@ -11,6 +12,59 @@
> > > >                 reg = <0x2 SPMI_USID>;
> > > >                 #address-cells = <1>;
> > > >                 #size-cells = <0>;
> > > > +
> > > > +               pon@800 {
> > > 
> > > Maybe pon node name should be 'key' or 'power-on'?
> > 
> > pon stands for power on device. See Documentation/devicetree/bindings/power/reset/qcom,pon.txt
> 
> Right. I was hoping for a more standard node name vs. an acronym that's
> SoC specific.

Sure that sounds better to me, I will make it "power-on"

-- 
~Vinod
