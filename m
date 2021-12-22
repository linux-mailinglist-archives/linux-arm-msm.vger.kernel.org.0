Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A0BB47D4EC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Dec 2021 17:14:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238023AbhLVQOF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Dec 2021 11:14:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237569AbhLVQOF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Dec 2021 11:14:05 -0500
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A71BC06173F
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Dec 2021 08:14:05 -0800 (PST)
Received: by mail-oi1-x235.google.com with SMTP id bk14so4644039oib.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Dec 2021 08:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=R1KJE3FXvrSj8HB5KXe1+gFkdNmQmE8s+9hukGzG70I=;
        b=jCgDbDMamLnBshk8hspx+invcjhIWvKnQG1sRQG+oNpxI6JglacyO9XUYAdGKmsHLJ
         AI2+2CYg6s5guB+9cAi+tvvdLaDjqFst1SG0zjSmqVoDABOxoyMHZ68thvsS2w0uSB68
         WcKNd9SCBcAMr6UNOa5ussgbCmM/xNnJHehHSOG07aeQmFZmT2eNSvogUyQO+cCTmXkB
         XoW2z8AYQNn92pCI876qM1cCsXiX8PEjXgqT1jfX3qYDrPHR04CHIYoHyU+dbj2OW9IJ
         d0VCoiDrKTRDr0Z2GO+dPnd1ke/NvunOkMSpFAVgVae3N1wiJ5M+Tykm5ywsTBPnXAZu
         Gwhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=R1KJE3FXvrSj8HB5KXe1+gFkdNmQmE8s+9hukGzG70I=;
        b=x7ObXICbSK/6bmeOwrH2rDmwHdFE7MhNvl9b8GW8vnE1Yp7z7OmRrCXlb45zsPHIeM
         2som9wJ5fYJoTZYOvHaJwfVWndhMhxBeRHrLiwX/u6AR8fW+5N0vcHrXW+RQFRycLCjn
         xE2osezH0UevRGr3x2XRHF5/Yq7/OKvTagvshoExjw0x6Jqtome4ig3jgayGsytXGHYf
         EUdTYb9jxZvOBKWQh55tNgUOy8JtWlwpr0k8JCsJmkuShH5rFM56o2jcicLDQpY8RlAV
         fX7tRXp0k/v7xMBD/CVMtbR0c5b+MxaetB/iIu5SQ/S4r8AhrvvVp2QGMDWdVjtGEFGE
         b2EA==
X-Gm-Message-State: AOAM530jc2dQtPZogWucqAiM7QZ0D3zow6ZewKu1rejlb2FTGyxTBZSK
        +uWiosZdTZ3oPqCf+YYZ739TAw==
X-Google-Smtp-Source: ABdhPJwDbWYvUezPD/oxsmC/A3QZpxF9vYOgE9VM4BASq3J47B5Xup16MkyZUxtnmIxkmG2D8OwqEg==
X-Received: by 2002:a54:470f:: with SMTP id k15mr555640oik.92.1640189644359;
        Wed, 22 Dec 2021 08:14:04 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t14sm418978otr.23.2021.12.22.08.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 08:14:03 -0800 (PST)
Date:   Wed, 22 Dec 2021 08:15:10 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8350: Correct UFS symbol clocks
Message-ID: <YcNPDiyx/biMZMQE@ripper>
References: <20211222002644.3396011-1-bjorn.andersson@linaro.org>
 <YcL/0PUeAI6SJ86s@matsya>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YcL/0PUeAI6SJ86s@matsya>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 22 Dec 02:37 PST 2021, Vinod Koul wrote:

> On 21-12-21, 16:26, Bjorn Andersson wrote:
> > The introduction of '9a61f813fcc8 ("clk: qcom: regmap-mux: fix parent
> > clock lookup")' broke UFS support on SM8350.
> > 
> > The cause for this is that the symbol clocks have a specified rate in
> > the "freq-table-hz" table in the UFS node, which causes the UFS code to
> > request a rate change, for which the "bi_tcxo" happens to provide the
> > closest rate.  Prior to the change in regmap-mux it was determined
> > (incorrectly) that no change was needed and everything worked. Instead
> > mimic the configuration found in other platforms, by omitting the rate
> > for the symbol clocks as well to avoid the rate change.
> > 
> > While at it also fill in the dummy symbol clocks that was dropped from
> > the GCC driver as it was upstreamed.
> > 
> > Fixes: 59c7cf814783 ("arm64: dts: qcom: sm8350: Add UFS nodes")
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sm8350.dtsi | 28 +++++++++++++++++++++++-----
> >  1 file changed, 23 insertions(+), 5 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> > index bc176c252bca..ceb064a83038 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> > @@ -38,6 +38,24 @@ sleep_clk: sleep-clk {
> >  			clock-frequency = <32000>;
> >  			#clock-cells = <0>;
> >  		};
> > +
> > +		ufs_phy_rx_symbol_0_clk: ufs-phy-rx-symbol-0 {
> > +			compatible = "fixed-clock";
> > +			clock-frequency = <1000>;
> > +			#clock-cells = <0>;
> > +		};
> > +
> > +		ufs_phy_rx_symbol_1_clk: ufs-phy-rx-symbol-1 {
> > +			compatible = "fixed-clock";
> > +			clock-frequency = <1000>;
> > +			#clock-cells = <0>;
> > +		};
> > +
> > +		ufs_phy_tx_symbol_0_clk: ufs-phy-tx-symbol-0 {
> > +			compatible = "fixed-clock";
> > +			clock-frequency = <1000>;
> > +			#clock-cells = <0>;
> > +		};
> >  	};
> >  
> >  	cpus {
> > @@ -606,9 +624,9 @@ gcc: clock-controller@100000 {
> >  				 <0>,
> >  				 <0>,
> >  				 <0>,
> > -				 <0>,
> > -				 <0>,
> > -				 <0>,
> > +				 <&ufs_phy_rx_symbol_0_clk>,
> > +				 <&ufs_phy_rx_symbol_1_clk>,
> > +				 <&ufs_phy_tx_symbol_0_clk>,
> >  				 <0>,
> >  				 <0>;
> >  		};
> > @@ -2079,8 +2097,8 @@ ufs_mem_hc: ufshc@1d84000 {
> >  				<75000000 300000000>,
> >  				<0 0>,
> >  				<0 0>,
> > -				<75000000 300000000>,
> > -				<75000000 300000000>;
> > +				<0 0>,
> > +				<0 0>;
> 
> should the rate be zero here?
> 

It seems that the numbers (75 and 300MHz) are the correct rates for the
symbol clocks.
It's however not clear to me where they are coming from and hence how we
would represent the change of rate in &ufs_phy_?x_symbol_?_clk. Let's
make sure to document this in the commit message...

Thanks,
Bjorn

