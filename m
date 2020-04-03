Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2788519CE20
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2020 03:31:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389366AbgDCBbX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Apr 2020 21:31:23 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:44289 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389108AbgDCBbW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Apr 2020 21:31:22 -0400
Received: by mail-pf1-f193.google.com with SMTP id b72so2665873pfb.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2020 18:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oeFfhyseU7mufRlzDCVQkx0SbciUhb12v0Jr/7fcu9A=;
        b=VQVcEo5Gmuwr3uy0VcbY0+qLGrgyMjm/WEhxPGe1yu8VMDOirLu5ioc5ynLYxNwkza
         Epd6/dGfevIR/hU0qVlKfrKd8uxdbNboB1vtdJ31gQsE6cXCtOHHDm/YA5oDfVE+/iPl
         ZoQu3m1GO3h9wLDWuMQcsneuG6ak0Mb0vcqVU5G/12Re2vod+cRF+zYphBCrTbYKSqn6
         lTvy8+DDCbdmM2N2qsY+jhz3sR+/pgWNBHQYaYIPIg9/ey5Zae7nkk4/3leJlZMskdnc
         YMlThV0GJJrC7pVyjcugMkEeT5PcQHx2ZVxalvV15fVSANYX9aHOYhRCGqODmhAzMwCP
         TIuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oeFfhyseU7mufRlzDCVQkx0SbciUhb12v0Jr/7fcu9A=;
        b=e6yfLQ92EVNf1/gyF33/I+KnqCuVOuGsH+7OK9NINPljMwKuqb1PER8ytYOWAwoiGa
         f7RoBQBIS4ZmjwOIeQHR3lTkUzleoUPohqzGRaJd5pZA3MyW6LmSXKEzKfSEzfDXF0Nz
         A6setPLEM7zIAQ6jSEL79P/0WfLbeUs+GVtOz7Slwe7QtXEqbc4b+lOQRn6Uayc9P04R
         bhNFM6x/E6EPRP63s9iJUZXh2APV54pIMLDu496h+GI/GJ83Q68NbsFAn6ILvcDeRk4q
         JvdXb5+lD99PlBRyCHAYg94bVlUahrAtg5zbwDNLwVGhuh09zJ+vGY2JH0bpzfrThB9D
         3nsA==
X-Gm-Message-State: AGi0Puaad3gtPE0wgwu8W7hHmMNc9lvbKwh2dPsEyipLxgsPpY31yWr+
        O1tZsebwFVsPu7U4xoWes2QuuQ==
X-Google-Smtp-Source: APiQypI+2efyTCOEZSYvxrgxVA18U3RQkyxluX3bkVC1YctRKcoZmG+EdyrNrwZT9i70Y4yClmAArQ==
X-Received: by 2002:a63:1e43:: with SMTP id p3mr6076033pgm.422.1585877481442;
        Thu, 02 Apr 2020 18:31:21 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id g11sm4597527pfm.4.2020.04.02.18.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2020 18:31:20 -0700 (PDT)
Date:   Thu, 2 Apr 2020 18:31:19 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Loic Poulain <loic.poulain@linaro.org>, agross@kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arch: arm64: dts: apq8016-dbc: Add missing cpu opps
Message-ID: <20200403013119.GB20625@builder.lan>
References: <1585763459-21484-1-git-send-email-loic.poulain@linaro.org>
 <20200402081349.GA932@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200402081349.GA932@gerhold.net>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 02 Apr 01:13 PDT 2020, Stephan Gerhold wrote:

> Hi,
> 
> On Wed, Apr 01, 2020 at 07:50:59PM +0200, Loic Poulain wrote:
> > The highest cpu frequency opps have been dropped because CPR is not
> > supported. However, we can simply specify operating voltage so that
> > they match the max corner voltages for each freq. With that, we can
> > support up to 1.36Ghz. Ideally, msm8916 CPR should be implemented to
> > fine tune operating voltages and optimize power consumption.
> 
> Thanks for the patch! I was wondering how to enable the higher CPU
> frequencies for a while now...
> 
> I was actually quite excited to see CPR being mainlined for QCS404.
> If we are trying to add such a workaround (rather than CPR) for MSM8916
> now, does that mean it's unlikely to see CPR working for MSM8916
> anytime soon?
> 
> AFAICT, there is a WIP branch from Niklas Cassel here:
> https://git.linaro.org/people/nicolas.dechesne/niklas.cassel/kernel.git/log/?h=cpr-msm8916-mainline
> but it hasn't been updated for a while. (Not sure if it was working
> already...)
> 
> Can someone explain what is missing to make CPR work for MSM8916?
> 

CPR needs to control 3 things; VDD_APC, VDD_MX and MEMACC. On QCS404 it
seems we don't have to adjust VDD_MX, so the code for this is missing
from the driver.

So, afaict, what's missing is that rpmpd.c needs to gain support for
8916, then the CPR driver needs to gain a cpr_acc_desc and compatible
for 8916, it needs to reference the VDDMX power domain and before/after
we're adjusting the corner of the CPR we need to adjust the MX according
to the mapping specified in the downstream kernel (i.e.  1->4, 2->5 and
3->7).


Unfortunately, the requirement that VDDMX (VDD_MEM I presume) must be
higher than VDD_APC most likely needs to be taken into consideration for
Loic's proposed static voltage scaling as well. Unless VDD_MEM is left
in Turbo mode from the boot loader I think we need to take VDDMX to
corner 7 for speeds 998MHz and above (i.e. where we pull VDD_APC to
1.35V).

Regards,
Bjorn

> One other minor comment/question below.
> 
> > 
> > This patch:
> > - Adds missing opps and corresponding target voltages to msm8916.dtsi.
> > - Adds cpu-supply to apq8016-sbc.dtsi (board level info).
> > - Adds pm8916 spmi regulator node to pm8916.dtsi.
> > 
> > Tested with a dragonboard-410c.
> > 
> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi | 24 ++++++++++++++++++++++++
> >  arch/arm64/boot/dts/qcom/msm8916.dtsi     | 24 ++++++++++++++++++++++++
> >  arch/arm64/boot/dts/qcom/pm8916.dtsi      |  6 ++++++
> >  3 files changed, 54 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> > index 037e26b..f1c1216 100644
> > --- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> > @@ -560,6 +560,30 @@
> >  	qcom,mbhc-vthreshold-high = <75 150 237 450 500>;
> >  };
> >  
> > +&spm_regulators {
> > +	vdd_cpu: s2 {
> > +		regulator-always-on;
> > +		regulator-min-microvolt = <1050000>;
> > +		regulator-max-microvolt = <1350000>;
> > +	};
> > +};
> > +
> > +&CPU0 {
> > +	cpu-supply = <&vdd_cpu>;
> > +};
> > +
> > +&CPU1 {
> > +	cpu-supply = <&vdd_cpu>;
> > +};
> > +
> > +&CPU2 {
> > +	cpu-supply = <&vdd_cpu>;
> > +};
> > +
> > +&CPU3 {
> > +	cpu-supply = <&vdd_cpu>;
> > +};
> > +
> 
> I'm a bit confused about the separation here. The cpu-supply is defined
> in the board-specific device tree, yet the voltages are set in the
> common device tree below.
> 
> Is it even possible that the CPU is supplied by something other than S2
> and if yes, how likely is this?
> 
> I'm asking because I have two other MSM8916 devices in mainline
> (and a few more pending upstreaming), and it seems like I would need to
> duplicate this into each of them.
> 
> Thanks,
> Stephan
> 
> >  &smd_rpm_regulators {
> >  	vdd_l1_l2_l3-supply = <&pm8916_s3>;
> >  	vdd_l5-supply = <&pm8916_s3>;
> > diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> > index 9f31064..9805af0 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> > @@ -342,15 +342,39 @@
> >  
> >  		opp-200000000 {
> >  			opp-hz = /bits/ 64 <200000000>;
> > +			opp-microvolt = <1050000>;
> >  		};
> >  		opp-400000000 {
> >  			opp-hz = /bits/ 64 <400000000>;
> > +			opp-microvolt = <1050000>;
> > +		};
> > +		opp-533330000 {
> > +			opp-hz = /bits/ 64 <533330000>;
> > +			opp-microvolt = <1150000>;
> >  		};
> >  		opp-800000000 {
> >  			opp-hz = /bits/ 64 <800000000>;
> > +			opp-microvolt = <1150000>;
> >  		};
> >  		opp-998400000 {
> >  			opp-hz = /bits/ 64 <998400000>;
> > +			opp-microvolt = <1350000>;
> > +		};
> > +		opp-1094400000 {
> > +			opp-hz = /bits/ 64 <1094400000>;
> > +			opp-microvolt = <1350000>;
> > +		};
> > +		opp-1152000000 {
> > +			opp-hz = /bits/ 64 <1152000000>;
> > +			opp-microvolt = <1350000>;
> > +		};
> > +		opp-1209600000 {
> > +			opp-hz = /bits/ 64 <1209600000>;
> > +			opp-microvolt = <1350000>;
> > +		};
> > +		opp-1363200000 {
> > +			opp-hz = /bits/ 64 <1363200000>;
> > +			opp-microvolt = <1350000>;
> >  		};
> >  	};
> >  
> > diff --git a/arch/arm64/boot/dts/qcom/pm8916.dtsi b/arch/arm64/boot/dts/qcom/pm8916.dtsi
> > index 0bcdf04..c9b9c4f 100644
> > --- a/arch/arm64/boot/dts/qcom/pm8916.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/pm8916.dtsi
> > @@ -157,5 +157,11 @@
> >  			vdd-micbias-supply = <&pm8916_l13>;
> >  			#sound-dai-cells = <1>;
> >  		};
> > +
> > +		spm_regulators: spm_regulators  {
> > +			compatible = "qcom,pm8916-regulators";
> > +			#address-cells = <1>;
> > +			#size-cells = <1>;
> > +		};
> >  	};
> >  };
> > -- 
> > 2.7.4
> > 
