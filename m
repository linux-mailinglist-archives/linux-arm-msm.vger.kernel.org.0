Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95F692EBA69
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jan 2021 08:19:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725601AbhAFHT3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jan 2021 02:19:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725562AbhAFHT3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jan 2021 02:19:29 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F056FC06134D
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jan 2021 23:18:58 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id h10so1199370pfo.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jan 2021 23:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0Uh9RboShiaGL7bsQEmHaWZYhbP/zLweA6er2Ky5XbQ=;
        b=HRky2vtlB0iJioVDwoZmf5blWBMcNOn3NcIAgCiVX80PiUN9K4zVfhLPO6EHVR0ugR
         A1qHMctMHwLb3NAtinLBCO1m3Oo7j19l5ubEvbFs6Xll3/XoXPAMMPOrTzX8oB0e/snt
         EOXtYPp3u8/FhAe1r6JR9WU/ncA+7snBQ68Omrkep95AQOoT6vrcJXZGe7YAwezHLAdX
         4B8oSK8qgoOuYzGVSM8z/0q2pLsuBuQ/Kia+baRP4L5c+ch2g3ML5Mo4Yja5hQ1j6Rcx
         QK4aCoQiIGnLWTyNt8ZIqdBpVGjDxmn4WV45+jGR9AuJottgztwWNbs4+G7B3jilSrft
         NLrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0Uh9RboShiaGL7bsQEmHaWZYhbP/zLweA6er2Ky5XbQ=;
        b=AbYSsjXQJjIVcedRV2Fs5WNrhXskmeaqoUIYjhXA23/ea1b7bXlj9HhOJh2qg7wBcA
         AB0t0Yr2gR8UMruQ/bw1nyFLtr7sA7B/YLGA6aswQE0SGTNOeOkYnXSVHyW7LamdSJRw
         OemnVuBjcPLUkCwHa33/IREMphoA4u2zD1Xc2sXicJ+IY/iUf7ZfCOxb/Xejx1CMYaah
         ePONb/h9gR2/RTrbZCJ8INFnOyr0EP7Ls3cHbOKtbxUu+1zfx9kKD7pmrqaR2kXq5wQQ
         OdI1H+J1YVm3KjhroOy8V5LVDhTaeu0N7eJXUe9rqdSCJN0RXltcgWvm6JnFKqzUjToP
         km9Q==
X-Gm-Message-State: AOAM5311yxVMRnro7oZ93cLoRixP5+ZNigQ0OmDOt4339E9+LmWkbrJP
        Ds8aVNvdmcMmpozjWyjBtB1x
X-Google-Smtp-Source: ABdhPJx//cjQpFVRo/w2Vike3G4UBWptVN4SuLazwjccY1lv3gfvpQAekJSEBrjnrIKU80cizKPFuw==
X-Received: by 2002:a65:4783:: with SMTP id e3mr3170617pgs.368.1609917538314;
        Tue, 05 Jan 2021 23:18:58 -0800 (PST)
Received: from thinkpad ([2409:4072:6e17:af05:51f0:bf72:bf80:ec88])
        by smtp.gmail.com with ESMTPSA id 8sm1428505pfz.93.2021.01.05.23.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 23:18:57 -0800 (PST)
Date:   Wed, 6 Jan 2021 12:48:52 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v2 02/18] ARM: dts: qcom: sdx55: Add reserved memory nodes
Message-ID: <20210106071852.GA3131@thinkpad>
References: <20210105122649.13581-1-manivannan.sadhasivam@linaro.org>
 <20210105122649.13581-3-manivannan.sadhasivam@linaro.org>
 <X/Sqfeonlthrys/O@builder.lan>
 <20210106030709.GD14794@thinkpad>
 <X/Uxk15iuCkizzuT@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X/Uxk15iuCkizzuT@builder.lan>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jan 05, 2021 at 09:42:11PM -0600, Bjorn Andersson wrote:
> On Tue 05 Jan 21:07 CST 2021, Manivannan Sadhasivam wrote:
> 
> > On Tue, Jan 05, 2021 at 12:05:49PM -0600, Bjorn Andersson wrote:
> > > On Tue 05 Jan 06:26 CST 2021, Manivannan Sadhasivam wrote:
> > > 
> > > > From: Vinod Koul <vkoul@kernel.org>
> > > > 
> > > > This adds reserved memory nodes to the SDX55 dtsi as defined by v8 of
> > > > the memory map
> > > > 
> > > > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > ---
> > > >  arch/arm/boot/dts/qcom-sdx55.dtsi | 67 +++++++++++++++++++++++++++++++
> > > >  1 file changed, 67 insertions(+)
> > > > 
> > > > diff --git a/arch/arm/boot/dts/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom-sdx55.dtsi
> > > > index 08b4a40338fa..eeb6bf392f93 100644
> > > > --- a/arch/arm/boot/dts/qcom-sdx55.dtsi
> > > > +++ b/arch/arm/boot/dts/qcom-sdx55.dtsi
> > > > @@ -60,6 +60,73 @@ psci {
> > > >  		method = "smc";
> > > >  	};
> > > >  

[...]

> > > > +		mpss_adsp_mem: memory@90800000 {
> > > > +			no-map;
> > > > +			reg = <0x90800000 0xf800000>;
> > > 
> > > Didn't you say this moved to 0x9c000000?
> > > 
> > 
> > That's for an old bootloader which is used in the MTP. But I guess we should
> > always use the latest mem map for the latest bootloader.
> > 
> 
> That reminds me, a number of times we're learned that these are at least
> related to which firmware the individual vendors are shipping on their
> devices. So the peripheral (remoteproc) regions is better to push out to
> the board file.
> 
> I.e. that would (probably) be &mpss_debug_mem, &ipa_fw_mem and
> &mpss_adsp_mem.
> 

Okay.

Thanks,
Mani

> Regards,
> Bjorn
