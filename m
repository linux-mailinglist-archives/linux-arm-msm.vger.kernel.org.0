Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19D6419CE12
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2020 03:10:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389857AbgDCBKP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Apr 2020 21:10:15 -0400
Received: from mail-pj1-f66.google.com ([209.85.216.66]:33855 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731783AbgDCBKO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Apr 2020 21:10:14 -0400
Received: by mail-pj1-f66.google.com with SMTP id q16so362607pje.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2020 18:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Luf/fzzUSBDtgsUDhRbE5+9vXNzx2NmwBbv3fvA1Qys=;
        b=Xj+BSE1xKkmaeyBaDk56UdgXU8tt9dmxz+hH0pv3mgWTYdCvVE3ooALLA5Xgu7B7qt
         j/9+CpyYXc10vn6EBlMcGFOdoXXXKNscO3YJuMc/JNL9CS5DUDDA4VTEc9fnVGzHZv55
         +aStKiB0GNQlvO0Sbt5jWa4SIJ2klI5n1x9rMhL0vzfv/u7jRVUAk1ISuJ8hgxXy+ePL
         aKivaL9Li6dZb5Ss+OtJ63l2xsnVNZgBZksApupHZHtu+wZ6Q6HXAc0VXD8co+l5TLYn
         zWBnnUVZsGyxR1IFp0xHNuk0BgNQW4tkmnF96mjdiXzTiLVttJmbop6XDD4PXzGy8A9S
         jmHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Luf/fzzUSBDtgsUDhRbE5+9vXNzx2NmwBbv3fvA1Qys=;
        b=oL5N2r72p/GwDS1X29k/4LgDvBFm8yYv+6e9l2bFNv5VPMT3uc1nwjpUEe03DP4dVt
         tW3JxF0chDaLyCOGGB5yj9HYw82sA9UMMzQWehlRlgd4kJs+G30jjJ1nO4miU5DeJ9mw
         cs6dMQx6MrAsJPAAVJXtLbXKf4NFYvq6vGcDxG0FNEI2zI5O/lTdagoIBVRRSJrDYPEE
         ZwUeiz8NAmoSEvppvSkm6+qkFXnenrea24kSECfR2AQPXrdJukerxMgp0wSb/6IAOHpw
         vw6EiCBRHI8E5SYaFgIN09sy/hfTy2WZ3VkV61WGETTeOQNvH6IqrIvSK/kMQtKpC8aZ
         T1+Q==
X-Gm-Message-State: AGi0PuYNMvfKcosrYB5iHyqd6rmm/tDJMBIUz8HfS9eTcGmefxdYnoBO
        F+/aZBs4yMRvPYHGP0TZ7P7r8w==
X-Google-Smtp-Source: APiQypIaSSbkZJO7x+WdjYtJZRToEdxex27qGlXxPZaOvWfJ7epTX3hmRlVcP74afa/b0SH82SJCJA==
X-Received: by 2002:a17:90a:206a:: with SMTP id n97mr6960833pjc.16.1585876212873;
        Thu, 02 Apr 2020 18:10:12 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id f69sm4535571pfa.124.2020.04.02.18.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2020 18:10:12 -0700 (PDT)
Date:   Thu, 2 Apr 2020 18:10:11 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        linux-arm-msm@vger.kernel.org, agross@kernel.org
Subject: Re: [PATCH v2] arch: arm64: dts: msm8916: Add missing cpu opps
Message-ID: <20200403011011.GA20625@builder.lan>
References: <1585821635-28324-1-git-send-email-loic.poulain@linaro.org>
 <20200402111432.GA95396@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200402111432.GA95396@gerhold.net>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 02 Apr 04:14 PDT 2020, Stephan Gerhold wrote:

> Hi,
> 
> On Thu, Apr 02, 2020 at 12:00:35PM +0200, Loic Poulain wrote:
> > The highest cpu frequency opps have been dropped because CPR is not
> > supported. However, we can simply specify operating voltage so that
> > they match the max corner voltages for each freq. With that, we can
> > support up to 1.2Ghz. Ideally, msm8916 CPR should be implemented to
> > fine tune operating voltages and optimize power consumption.
> > 
> > The SPMI interface is directly used for AP regulator control since
> > it offers a minimal transition latency (maximum transition latency
> > with spmi is 250us, with rpm is 970us as reported by cpufreq-info).
> > 
> > This patch:
> > - Adds missing opps and corresponding target voltages to msm8916.dtsi.
> > - Adds pm8916 spmi regulator node to pm8916.dtsi.
> > 
> > Tested with a dragonboard-410c.
> > 
> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > ---
> >  v2: - move cpu-supply to msm8916 since pm8916 s2 is tighly coupled
> >      to AP core (cf pm8916 specification) + other pm8916 supplies
> >      are already defined in msm8916.
> 
> Thanks for making these changes!
> 
> I will try to test this on my devices later today,
> and will ask some more people to test it on theirs.
> 
> What is a good way to test that it works correctly?
> If the device manages to reach the higher frequencies and still works
> correctly it's fine?
> 
> >      - s2 min/max are specified in pm8916 spec
> 
> Regarding this I have a small concern below.
> 
> >      - Removed 1.36GHz op since freq seems capped to 1.21 anyway
> > 
> >  arch/arm64/boot/dts/qcom/msm8916.dtsi | 25 +++++++++++++++++++++++++
> >  arch/arm64/boot/dts/qcom/pm8916.dtsi  | 13 +++++++++++++
> >  2 files changed, 38 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> > index 9f31064..7407157 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> > @@ -103,6 +103,7 @@
> >  			next-level-cache = <&L2_0>;
> >  			enable-method = "psci";
> >  			clocks = <&apcs>;
> > +			cpu-supply = <&pm8916_spmi_s2>;
> >  			operating-points-v2 = <&cpu_opp_table>;
> >  			#cooling-cells = <2>;
> >  			power-domains = <&CPU_PD0>;
> > @@ -116,6 +117,7 @@
> >  			next-level-cache = <&L2_0>;
> >  			enable-method = "psci";
> >  			clocks = <&apcs>;
> > +			cpu-supply = <&pm8916_spmi_s2>;
> >  			operating-points-v2 = <&cpu_opp_table>;
> >  			#cooling-cells = <2>;
> >  			power-domains = <&CPU_PD1>;
> > @@ -129,6 +131,7 @@
> >  			next-level-cache = <&L2_0>;
> >  			enable-method = "psci";
> >  			clocks = <&apcs>;
> > +			cpu-supply = <&pm8916_spmi_s2>;
> >  			operating-points-v2 = <&cpu_opp_table>;
> >  			#cooling-cells = <2>;
> >  			power-domains = <&CPU_PD2>;
> > @@ -142,6 +145,7 @@
> >  			next-level-cache = <&L2_0>;
> >  			enable-method = "psci";
> >  			clocks = <&apcs>;
> > +			cpu-supply = <&pm8916_spmi_s2>;
> >  			operating-points-v2 = <&cpu_opp_table>;
> >  			#cooling-cells = <2>;
> >  			power-domains = <&CPU_PD3>;
> > @@ -342,15 +346,35 @@
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
> >  		};
> >  	};
> >  
> > @@ -1605,6 +1629,7 @@
> >  					compatible = "qcom,rpm-pm8916-regulators";
> >  
> >  					pm8916_s1: s1 {};
> > +					/* s2 is directly controlled via spmi */
> >  					pm8916_s3: s3 {};
> >  					pm8916_s4: s4 {};
> >  
> > diff --git a/arch/arm64/boot/dts/qcom/pm8916.dtsi b/arch/arm64/boot/dts/qcom/pm8916.dtsi
> > index 0bcdf04..73d3b28 100644
> > --- a/arch/arm64/boot/dts/qcom/pm8916.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/pm8916.dtsi
> > @@ -157,5 +157,18 @@
> >  			vdd-micbias-supply = <&pm8916_l13>;
> >  			#sound-dai-cells = <1>;
> >  		};
> > +
> > +		spmi_regulators: spmi_regulators  {
> > +			compatible = "qcom,pm8916-regulators";
> > +			#address-cells = <1>;
> > +			#size-cells = <1>;
> > +
> > +			pm8916_spmi_s2: s2 {
> > +				regulator-always-on;
> > +				regulator-min-microvolt = <900000>;
> > +				regulator-max-microvolt = <1562000>;
> 
> This might be just me but I'm usually cautious when it comes to setting
> up the regulator constraints.
> 
> One way is to set the regulator constraints based on the capabilities of
> the regulator itself (which is what you did here I think)?
> 

The capabilities of the regulator goes in the regulator driver, what
should be specified in the DT are the constraints on this particular
board; i.e. the constraints of the devices attached to the regulator.

> The other way is to only allow voltages that actually make sense;
> to ensure that setting incorrect voltages (for whatever reason) will
> fail. (I actually know someone who managed to break a board by setting
> some regulator voltages incorrectly...)
> 
> We don't actually set anything < 1050000 or > 1350000.
> And if I'm reading the datasheet correctly, the CPU cores are not even
> specified to operate correctly at > 1.42V.
> 

Right, per the datasheet VDD_APC's operational range is 0.97V to 1.42V.
So I would like the min/max here to reflect that - to define the
valid range for this regulator on this (these) board(s).


The fact that we only vote for 1.05-1.35 is presumably a result of us
not using CPR, which possible would extend that further. So this feels
like a property of the client.

> I would personally prefer to keep the min/max voltages from your
> previous patch set, i.e.
> 
> 	regulator-min-microvolt = <1050000>;
> 	regulator-max-microvolt = <1350000>;
> 
> In case a higher/lower voltage is needed it could still be changed later.
> 
> But maybe that's just me being overly cautious?
> 

I prefer that adjustments in the operating points (or a move to CPR)
wouldn't require modifying the valid range of the regulator. I.e. that
we match the operating range of VDD_APC here.

But thanks for being cautious, I missed that the specified ranges was
outside VDD_APC.

Regards,
Bjorn

> Thanks,
> Stephan
> 
> > +			};
> > +			/* other regulators can be controlled via rpm */
> > +		};
> >  	};
> >  };
> > -- 
> > 2.7.4
> > 
