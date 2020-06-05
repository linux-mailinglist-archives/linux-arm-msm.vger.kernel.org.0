Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C1FB1EF0A2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2020 06:40:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726062AbgFEEkB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Jun 2020 00:40:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:37370 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725968AbgFEEkB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Jun 2020 00:40:01 -0400
Received: from localhost (unknown [122.179.53.240])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 80379207D3;
        Fri,  5 Jun 2020 04:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591332000;
        bh=L1FEKM7MEb9qr5cixN406x104Ogs7508E4Slz4lbxSs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RzayYD7twaxofHxVJZy+VDkiNJjvzne9s9+vMFgOVLfUY7y8c+LCkVLQQHzvBoRju
         cluIPXE72MIeMsgnKgU3ZJr/VdfrX0Q+BeiER+vf70s1YmkIQCmoX3aQDqiO6XIi4J
         7DXv3fhWI/s7ZhB/26s8KTwigirmdbMxJ3ofh5H4=
Date:   Fri, 5 Jun 2020 10:09:55 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Amit Kucheria <amit.kucheria@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        patches@linaro.org, linaro-kernel@lists.linaro.org
Subject: Re: [PATCH 5/7] arm64: dts: qcom: pm8150x: add thermal alarms and
 thermal zones
Message-ID: <20200605043955.GJ3521@vkoul-mobl>
References: <20200604004331.669936-1-dmitry.baryshkov@linaro.org>
 <20200604004331.669936-5-dmitry.baryshkov@linaro.org>
 <20200604104701.GG3521@vkoul-mobl>
 <8df3fe11-867f-b6a3-fe29-5a8ab988e006@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8df3fe11-867f-b6a3-fe29-5a8ab988e006@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Sorry missed ccing Amit, done now.

On 04-06-20, 18:03, Dmitry Baryshkov wrote:
> On 04/06/2020 13:47, Vinod Koul wrote:
> > On 04-06-20, 03:43, Dmitry Baryshkov wrote:

> > >   		pm8150_adc: adc@3100 {
> > >   			compatible = "qcom,spmi-adc5";
> > >   			reg = <0x3100>;
> > > @@ -38,8 +47,6 @@ pm8150_adc: adc@3100 {
> > >   			#io-channel-cells = <1>;
> > >   			interrupts = <0x0 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
> > > -			status = "disabled";
> > > -
> > 
> > This should not be removed, rather than this please add enabled in you
> > board dts file

...

> > > +&thermal_zones {
> > > +	pm8150_temp {
> > > +		polling-delay-passive = <0>;
> > > +		polling-delay = <0>;
> > > +
> > > +		thermal-sensors = <&pm8150_temp>;
> > > +
> > > +		trips {
> > > +			trip0 {
> > > +				temperature = <95000>;
> > > +				hysteresis = <0>;
> > > +				type = "passive";
> > > +			};
> > > +
> > > +			trip1 {
> > > +				temperature = <115000>;
> > > +				hysteresis = <0>;
> > > +				type = "passive";
> > > +			};
> > > +
> > > +			trip2 {
> > > +				temperature = <145000>;
> > > +				hysteresis = <0>;
> > > +				type = "passive";
> > > +			};
> > > +		};
> > > +
> > > +	};
> > 
> > Not sure about this, Amit..? Should this also not be in board dts?
> > 
> > Similar comments on similar ones for rest of the patch as well..
> 
> I'm not so sure. This part of the configuration seems generic to me. Unlike
> adc-tm config, which definitely goes to the board file.

I think the temperature values may be board specific, Amit can confirm
that. If that is the case then this belongs to board dts, otherwise here :)

> I can split this into a separate pm8150-temp.dtsi file. Does that sound
> better?

That might make it worse, we don't do splitting.

-- 
~Vinod
