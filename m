Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58FE8459543
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Nov 2021 20:04:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235819AbhKVTHJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Nov 2021 14:07:09 -0500
Received: from linux.microsoft.com ([13.77.154.182]:54072 "EHLO
        linux.microsoft.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230094AbhKVTHI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Nov 2021 14:07:08 -0500
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
        by linux.microsoft.com (Postfix) with ESMTPSA id CE15420B4865;
        Mon, 22 Nov 2021 11:04:01 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com CE15420B4865
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1637607841;
        bh=YBDmGsj+w3Lu1UUMBhU8o1vq1OWBkE9hg87FRdzFKVM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KbZRDnI+gHqD/SVzsxm3p4KM25rj8N0mGx6tKTTtt++TZLDxMzeiX34BCGxWmWAqS
         e/WUJvcFIqcS5Vp3NjqjcRrYmDwPwk7b8YBx3L5evviDSxYn96ZGTyZm66efCAImzr
         tlD10xGPz3beb42YhJitO4ZCZvOfvaYT9hRjJ9dM=
Date:   Mon, 22 Nov 2021 11:04:00 -0800
From:   Katherine Perez <kaperez@linux.microsoft.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Felipe Balbi <balbi@kernel.org>
Subject: Re: [RESEND PATCH 2/2] arm64: dts: sm8350: fix tlmm base address
Message-ID: <20211122190400.GA11727@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <20211116235045.3748572-1-kaperez@linux.microsoft.com>
 <20211116235045.3748572-3-kaperez@linux.microsoft.com>
 <YZcd/lFm8HgQ8SLs@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YZcd/lFm8HgQ8SLs@builder.lan>
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 18, 2021 at 09:46:06PM -0600, Bjorn Andersson wrote:
> On Tue 16 Nov 17:50 CST 2021, Katherine Perez wrote:
> 
> > TLMM controller base address is incorrect and will hang on some platforms.
> > Fix by giving the correct address.
> > 
> > Signed-off-by: Katherine Perez <kaperez@linux.microsoft.com>
> > ---
> >  arch/arm64/boot/dts/qcom/sm8350.dtsi | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> > index d134280e2939..624d294612d8 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> > @@ -960,9 +960,9 @@ spmi_bus: spmi@c440000 {
> >  			#interrupt-cells = <4>;
> >  		};
> >  
> > -		tlmm: pinctrl@f100000 {
> > +		tlmm: pinctrl@f000000 {
> >  			compatible = "qcom,sm8350-tlmm";
> > -			reg = <0 0x0f100000 0 0x300000>;
> > +			reg = <0 0x0f000000 0 0x300000>;
> 
> There's a group of register blocks related to TLMM starting at
> 0x0f000000 and then there's the register block that is relevant to the
> OS that starts at 0x0f100000.
> 
> Downstream uses the group, while upstream describes only the hardware
> block that's relevant to the OS. Unfortunately it seems that the shift
> was missed for the UFS and SDC pins as the driver was upstreamed.
> 
> So I recently submitted this patch, which I expect would help you:
> https://lore.kernel.org/all/20211104170835.1993686-1-bjorn.andersson@linaro.org/
> 
> Please let me know if that's not sufficient, or if I'm missed something
> in my analysis.
> 
> Regards,
> Bjorn
> 
> >  			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
> >  			gpio-controller;
> >  			#gpio-cells = <2>;
> > -- 
> > 2.31.1
> > 

Hi Bjorn,

I tested without the change to the TLMM address and made sure your patch was included, but my
platform is unable to boot without my patch to the TLMM address.

Best,
Katherine
