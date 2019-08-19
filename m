Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D9CB94BC7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2019 19:34:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727398AbfHSRdz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Aug 2019 13:33:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:32794 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726987AbfHSRdz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Aug 2019 13:33:55 -0400
Received: from localhost (unknown [122.182.221.154])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3B30422CE8;
        Mon, 19 Aug 2019 17:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566236034;
        bh=x0M/SmomdKgu2MdGv9MrRMrpHPzPbbCMFKCIWj5RoEc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lMBxRgf+ptk+qqthJDfFXYSDHEsiv9FYXEKT21zUrnRJRtGBTkH2LAixsbHtda0Lv
         Xvgmi8hzpmRqaFLMzJYhJs4wLAw8QgtUEN4iDWa7NnObEWDGvmeOoOO/FVldKdioJU
         xblnd31cpknx2a2Cb20pgTNSZ7fy2nes+uABDJJY=
Date:   Mon, 19 Aug 2019 23:02:37 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        sibis@codeaurora.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/22] arm64: dts: qcom: pm8150: Add pon and rtc nodes
Message-ID: <20190819173237.GJ12733@vkoul-mobl.Dlink>
References: <20190814125012.8700-1-vkoul@kernel.org>
 <20190814125012.8700-8-vkoul@kernel.org>
 <20190814170349.7E4462173E@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190814170349.7E4462173E@mail.kernel.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14-08-19, 10:03, Stephen Boyd wrote:
> Quoting Vinod Koul (2019-08-14 05:49:57)
> > PM8150 PMIC contains pon and rtc devices so add nodes for these.
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> 
> Squash this with the other patch?

OK

> 
> > @@ -12,6 +13,25 @@
> >                 #address-cells = <1>;
> >                 #size-cells = <0>;
> >  
> > +               pon: pon@800 {
> > +                       compatible = "qcom,pm8916-pon";
> > +                       reg = <0x0800>;
> > +                       pwrkey {
> > +                               compatible = "qcom,pm8941-pwrkey";
> > +                               interrupts = <0x0 0x8 0 IRQ_TYPE_EDGE_BOTH>;
> > +                               debounce = <15625>;
> > +                               bias-pull-up;
> > +                               linux,code = <KEY_POWER>;
> 
> status = "disabled"?

will do

> 
> > +                       };
> > +               };
> > +
> > +               rtc@6000 {
> > +                       compatible = "qcom,pm8941-rtc";
> > +                       reg = <0x6000>;
> > +                       reg-names = "rtc", "alarm";
> > +                       interrupts = <0x0 0x61 0x1 IRQ_TYPE_NONE>;
> 
> status = "disabled"?

will do

-- 
~Vinod
