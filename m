Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B78DF2EB890
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jan 2021 04:44:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbhAFDnB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 22:43:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726618AbhAFDnA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 22:43:00 -0500
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F7BCC06134C
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jan 2021 19:42:14 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id o11so1875650ote.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jan 2021 19:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=clNr85B17P/VHZbj4dl/JPQb+NJv3je0BLjWWpKEqw8=;
        b=BB/VpaN2DQRcq516SWQRmCcwCtFSFZehuv2ZGPxZLFjLL9r1PJwvmaJTcTqYNQB6dG
         7EOAOHJ2+WivoZkZ8/ysTBIY8YiQTjjkBmy1OVqwvFT90yCTspSU0g/FEgbNtoNnJGC8
         X1uDm4OWK77Q2QEVuYRclQRc1FxhOgO5uN9/2TUliP36vb31MvrDQHgPSHViDZHpLZMM
         rGKaMcgRICDeA2b30A6rC+BOgc1rlznqjmrCEnCw5u+jlfGwcPF6Y5OKFMPf/BQJFwSX
         IjzduvHxgzu6Cz4SROLDYt6+g5iPyBKvc9vMVU6JtrdzdcVn+8luIoyrZr2SpgFoAjP2
         BYQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=clNr85B17P/VHZbj4dl/JPQb+NJv3je0BLjWWpKEqw8=;
        b=lM6tb/xALjrvpsG9C/XnJW53iVxgGbbG/KGNdEfKLrDOpHlVZQulrHAwTQmCatxS/D
         bqZ9v013o5fIaojlvC+gvMLXev4sF0dl1/eDyewh9Za+nLJzS97bX71ytI9Nh8ma/CVg
         f6yx4eTW0yxP1+IzQTNf69UH4p/bmKq4gf38cZQP7Pq7DqlSa7EQ6JdV+Woa+A26AK2f
         siZUNpSeOqA9oSLdvcvQQlpYhQwCUXvhQiNxod4RdI54XxU+K6BbeldMF5gRfYkOTOJH
         cB1QZewnmS1t3towqnA0QnUsrlgPmze9k86YSW6cqPP0X8VMNn1Jm8USgNuYoHZk79IC
         R81w==
X-Gm-Message-State: AOAM533KwEUpmRTX7yma6XXZ2TG9oeMv+osD+VhoJno4AHWvAQwE6TqP
        M3WNc/vsrYFJGncPd2nh5H1GTTJUsyuOAA==
X-Google-Smtp-Source: ABdhPJzXJ1LVgWhlEkSml8zxn7ofneI12x53wvuhaBWs0Fy6Ec8khQor11zf2HJ+Z207i37fbnsDxQ==
X-Received: by 2002:a9d:1720:: with SMTP id i32mr1949179ota.84.1609904533572;
        Tue, 05 Jan 2021 19:42:13 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r204sm368597oif.0.2021.01.05.19.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 19:42:12 -0800 (PST)
Date:   Tue, 5 Jan 2021 21:42:11 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v2 02/18] ARM: dts: qcom: sdx55: Add reserved memory nodes
Message-ID: <X/Uxk15iuCkizzuT@builder.lan>
References: <20210105122649.13581-1-manivannan.sadhasivam@linaro.org>
 <20210105122649.13581-3-manivannan.sadhasivam@linaro.org>
 <X/Sqfeonlthrys/O@builder.lan>
 <20210106030709.GD14794@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210106030709.GD14794@thinkpad>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 05 Jan 21:07 CST 2021, Manivannan Sadhasivam wrote:

> On Tue, Jan 05, 2021 at 12:05:49PM -0600, Bjorn Andersson wrote:
> > On Tue 05 Jan 06:26 CST 2021, Manivannan Sadhasivam wrote:
> > 
> > > From: Vinod Koul <vkoul@kernel.org>
> > > 
> > > This adds reserved memory nodes to the SDX55 dtsi as defined by v8 of
> > > the memory map
> > > 
> > > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > ---
> > >  arch/arm/boot/dts/qcom-sdx55.dtsi | 67 +++++++++++++++++++++++++++++++
> > >  1 file changed, 67 insertions(+)
> > > 
> > > diff --git a/arch/arm/boot/dts/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom-sdx55.dtsi
> > > index 08b4a40338fa..eeb6bf392f93 100644
> > > --- a/arch/arm/boot/dts/qcom-sdx55.dtsi
> > > +++ b/arch/arm/boot/dts/qcom-sdx55.dtsi
> > > @@ -60,6 +60,73 @@ psci {
> > >  		method = "smc";
> > >  	};
> > >  
> > > +	reserved-memory {
> > > +		#address-cells = <1>;
> > > +		#size-cells = <1>;
> > > +		ranges;
> > > +
> > > +		mpss_debug_mem: memory@8ef00000 {
> > > +			no-map;
> > > +			reg = <0x8ef00000 0x800000>;
> > > +		};
> > > +
> > > +		hyp_mem: memory@8fc00000 {
> > > +			no-map;
> > > +			reg = <0x8fc00000 0x80000>;
> > > +		};
> > > +
> > > +		ac_db_mem: memory@8fc80000 {
> > > +			no-map;
> > > +			reg = <0x8fc80000 0x40000>;
> > > +		};
> > > +
> > > +		secdata_mem: memory@8fcfd000 {
> > > +			no-map;
> > > +			reg = <0x8fcfd000 0x1000>;
> > > +		};
> > > +
> > > +		ipa_fw_mem: memory@8fced000 {
> > > +			no-map;
> > > +			reg = <0x8fced000 0x10000>;
> > > +		};
> > > +
> > > +		sbl_mem: memory@8fd00000 {
> > > +			no-map;
> > > +			reg = <0x8fd00000 0x100000>;
> > > +		};
> > > +
> > > +		aop_image: memory@8fe00000 {
> > > +			no-map;
> > > +			reg = <0x8fe00000 0x20000>;
> > > +		};
> > > +
> > > +		aop_cmd_db: memory@8fe20000 {
> > > +			compatible = "qcom,cmd-db";
> > > +			reg = <0x8fe20000 0x20000>;
> > > +			no-map;
> > > +		};
> > > +
> > > +		smem_mem: memory@8fe40000 {
> > > +			no-map;
> > > +			reg = <0x8fe40000 0xc0000>;
> > > +		};
> > > +
> > > +		tz_mem: memory@8ff00000 {
> > > +			no-map;
> > > +			reg = <0x8ff00000 0x100000>;
> > > +		};
> > > +
> > > +		tz_apps_mem: memory@0x90000000 {
> > > +			no-map;
> > > +			reg = <0x90000000 0x500000>;
> > > +		};
> > > +
> > > +		mpss_adsp_mem: memory@90800000 {
> > > +			no-map;
> > > +			reg = <0x90800000 0xf800000>;
> > 
> > Didn't you say this moved to 0x9c000000?
> > 
> 
> That's for an old bootloader which is used in the MTP. But I guess we should
> always use the latest mem map for the latest bootloader.
> 

That reminds me, a number of times we're learned that these are at least
related to which firmware the individual vendors are shipping on their
devices. So the peripheral (remoteproc) regions is better to push out to
the board file.

I.e. that would (probably) be &mpss_debug_mem, &ipa_fw_mem and
&mpss_adsp_mem.

Regards,
Bjorn
