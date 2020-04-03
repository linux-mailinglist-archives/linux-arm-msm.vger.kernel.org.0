Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB56819D4A4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2020 12:09:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727923AbgDCKJb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Apr 2020 06:09:31 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.167]:14238 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727774AbgDCKJb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Apr 2020 06:09:31 -0400
X-Greylist: delayed 93153 seconds by postgrey-1.27 at vger.kernel.org; Fri, 03 Apr 2020 06:09:28 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1585908565;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=JgPvAhdZUtxze5wPD1t8wDBIPEo/ihw52rIG25HGMzk=;
        b=h1SEQVCWWOdtOMOJh0NRUS18C7dqNmzP4SSlvcxhARe9nyMqTZo65UDmdXTBPfLy+p
        yZ18dUlgwVFD1pyqUAFJ/UfrnF3kk99Y5BuKXmqvK+B9Be47o2+vXeR/3naL3Sz4Xb6h
        k1XDB13YfXR2lPOtLqU50CbFV0Y827+7eUDuvupWVyszKrGghufl4WongVqeFU8d/c0L
        Lyn3Slr7z51kDVHt+/cumep3QNPb+8nvHC/67cNrH92FkJUGj2lOMvOnrkSRzzdfEU89
        n1F9Hf/gXf03E5wf2nuGdn+4Oe9kwcFgq0cRNzgj7o1LPXciKeiqWr9MjeK+S5e0V5qL
        uB7A==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j9Ic/NBg=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 46.2.1 DYNA|AUTH)
        with ESMTPSA id u043b8w33A9Oo87
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Fri, 3 Apr 2020 12:09:24 +0200 (CEST)
Date:   Fri, 3 Apr 2020 12:09:23 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>, agross@kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arch: arm64: dts: apq8016-dbc: Add missing cpu opps
Message-ID: <20200403100923.GB2652@gerhold.net>
References: <1585763459-21484-1-git-send-email-loic.poulain@linaro.org>
 <20200402081349.GA932@gerhold.net>
 <20200403013119.GB20625@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200403013119.GB20625@builder.lan>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Apr 02, 2020 at 06:31:19PM -0700, Bjorn Andersson wrote:
> On Thu 02 Apr 01:13 PDT 2020, Stephan Gerhold wrote:
> 
> > Hi,
> > 
> > On Wed, Apr 01, 2020 at 07:50:59PM +0200, Loic Poulain wrote:
> > > The highest cpu frequency opps have been dropped because CPR is not
> > > supported. However, we can simply specify operating voltage so that
> > > they match the max corner voltages for each freq. With that, we can
> > > support up to 1.36Ghz. Ideally, msm8916 CPR should be implemented to
> > > fine tune operating voltages and optimize power consumption.
> > 
> > Thanks for the patch! I was wondering how to enable the higher CPU
> > frequencies for a while now...
> > 
> > I was actually quite excited to see CPR being mainlined for QCS404.
> > If we are trying to add such a workaround (rather than CPR) for MSM8916
> > now, does that mean it's unlikely to see CPR working for MSM8916
> > anytime soon?
> > 
> > AFAICT, there is a WIP branch from Niklas Cassel here:
> > https://git.linaro.org/people/nicolas.dechesne/niklas.cassel/kernel.git/log/?h=cpr-msm8916-mainline
> > but it hasn't been updated for a while. (Not sure if it was working
> > already...)
> > 
> > Can someone explain what is missing to make CPR work for MSM8916?
> > 
> 
> CPR needs to control 3 things; VDD_APC, VDD_MX and MEMACC. On QCS404 it
> seems we don't have to adjust VDD_MX, so the code for this is missing
> from the driver.
> 
> So, afaict, what's missing is that rpmpd.c needs to gain support for
> 8916, then the CPR driver needs to gain a cpr_acc_desc and compatible
> for 8916, it needs to reference the VDDMX power domain and before/after
> we're adjusting the corner of the CPR we need to adjust the MX according
> to the mapping specified in the downstream kernel (i.e.  1->4, 2->5 and
> 3->7).
> 
> 
> Unfortunately, the requirement that VDDMX (VDD_MEM I presume) must be
> higher than VDD_APC most likely needs to be taken into consideration for
> Loic's proposed static voltage scaling as well. Unless VDD_MEM is left
> in Turbo mode from the boot loader I think we need to take VDDMX to
> corner 7 for speeds 998MHz and above (i.e. where we pull VDD_APC to
> 1.35V).
> 

I see! I wonder how hard it would be to add MSM8916 to rpmpd,
looking at previous commits it's mainly setting up a few defines?

If I understand it correctly, the OPPs from rpmpd could then be
referenced as "required-opps" in the CPU OPP table so that VDD_MX is
scaled together with the CPU frequency, and doesn't need to stay at
turbo mode (like in v3 from Loic) the whole time.

Scaling VDD_APC and VDD_MEM to the maximum necessary for the selected
CPU frequency sounds like a good (temporary) solution to me until we
have full CPR eventually at some point.

Thanks,
Stephan

> > One other minor comment/question below.
> > 
> > > 
> > > This patch:
> > > - Adds missing opps and corresponding target voltages to msm8916.dtsi.
> > > - Adds cpu-supply to apq8016-sbc.dtsi (board level info).
> > > - Adds pm8916 spmi regulator node to pm8916.dtsi.
> > > 
> > > Tested with a dragonboard-410c.
> > > 
> > > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > > ---
> > >  arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi | 24 ++++++++++++++++++++++++
> > >  arch/arm64/boot/dts/qcom/msm8916.dtsi     | 24 ++++++++++++++++++++++++
> > >  arch/arm64/boot/dts/qcom/pm8916.dtsi      |  6 ++++++
> > >  3 files changed, 54 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> > > index 037e26b..f1c1216 100644
> > > --- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> > > @@ -560,6 +560,30 @@
> > >  	qcom,mbhc-vthreshold-high = <75 150 237 450 500>;
> > >  };
> > >  
> > > +&spm_regulators {
> > > +	vdd_cpu: s2 {
> > > +		regulator-always-on;
> > > +		regulator-min-microvolt = <1050000>;
> > > +		regulator-max-microvolt = <1350000>;
> > > +	};
> > > +};
> > > +
> > > +&CPU0 {
> > > +	cpu-supply = <&vdd_cpu>;
> > > +};
> > > +
> > > +&CPU1 {
> > > +	cpu-supply = <&vdd_cpu>;
> > > +};
> > > +
> > > +&CPU2 {
> > > +	cpu-supply = <&vdd_cpu>;
> > > +};
> > > +
> > > +&CPU3 {
> > > +	cpu-supply = <&vdd_cpu>;
> > > +};
> > > +
> > 
> > I'm a bit confused about the separation here. The cpu-supply is defined
> > in the board-specific device tree, yet the voltages are set in the
> > common device tree below.
> > 
> > Is it even possible that the CPU is supplied by something other than S2
> > and if yes, how likely is this?
> > 
> > I'm asking because I have two other MSM8916 devices in mainline
> > (and a few more pending upstreaming), and it seems like I would need to
> > duplicate this into each of them.
> > 
> > Thanks,
> > Stephan
> > 
> > >  &smd_rpm_regulators {
> > >  	vdd_l1_l2_l3-supply = <&pm8916_s3>;
> > >  	vdd_l5-supply = <&pm8916_s3>;
> > > diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> > > index 9f31064..9805af0 100644
> > > --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> > > @@ -342,15 +342,39 @@
> > >  
> > >  		opp-200000000 {
> > >  			opp-hz = /bits/ 64 <200000000>;
> > > +			opp-microvolt = <1050000>;
> > >  		};
> > >  		opp-400000000 {
> > >  			opp-hz = /bits/ 64 <400000000>;
> > > +			opp-microvolt = <1050000>;
> > > +		};
> > > +		opp-533330000 {
> > > +			opp-hz = /bits/ 64 <533330000>;
> > > +			opp-microvolt = <1150000>;
> > >  		};
> > >  		opp-800000000 {
> > >  			opp-hz = /bits/ 64 <800000000>;
> > > +			opp-microvolt = <1150000>;
> > >  		};
> > >  		opp-998400000 {
> > >  			opp-hz = /bits/ 64 <998400000>;
> > > +			opp-microvolt = <1350000>;
> > > +		};
> > > +		opp-1094400000 {
> > > +			opp-hz = /bits/ 64 <1094400000>;
> > > +			opp-microvolt = <1350000>;
> > > +		};
> > > +		opp-1152000000 {
> > > +			opp-hz = /bits/ 64 <1152000000>;
> > > +			opp-microvolt = <1350000>;
> > > +		};
> > > +		opp-1209600000 {
> > > +			opp-hz = /bits/ 64 <1209600000>;
> > > +			opp-microvolt = <1350000>;
> > > +		};
> > > +		opp-1363200000 {
> > > +			opp-hz = /bits/ 64 <1363200000>;
> > > +			opp-microvolt = <1350000>;
> > >  		};
> > >  	};
> > >  
> > > diff --git a/arch/arm64/boot/dts/qcom/pm8916.dtsi b/arch/arm64/boot/dts/qcom/pm8916.dtsi
> > > index 0bcdf04..c9b9c4f 100644
> > > --- a/arch/arm64/boot/dts/qcom/pm8916.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/pm8916.dtsi
> > > @@ -157,5 +157,11 @@
> > >  			vdd-micbias-supply = <&pm8916_l13>;
> > >  			#sound-dai-cells = <1>;
> > >  		};
> > > +
> > > +		spm_regulators: spm_regulators  {
> > > +			compatible = "qcom,pm8916-regulators";
> > > +			#address-cells = <1>;
> > > +			#size-cells = <1>;
> > > +		};
> > >  	};
> > >  };
> > > -- 
> > > 2.7.4
> > > 
