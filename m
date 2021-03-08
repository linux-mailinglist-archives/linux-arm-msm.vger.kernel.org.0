Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8CA8331543
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Mar 2021 18:53:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230457AbhCHRwe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Mar 2021 12:52:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231190AbhCHRwZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Mar 2021 12:52:25 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3097FC061760
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 Mar 2021 09:52:25 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id v192so4285447oia.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Mar 2021 09:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UJ98E5rmZfHbLKJKvUQ3vbkulnFI/CkiQEts/LrvON4=;
        b=v9lT5uRiEW/JY9GU54oE8V/ushOzvh8RrkgIaeybKCLMB9r2PkD/u8cpiGo+pLtC1R
         QmVIgis+zFLmLv5/36OzcvD+zhu4mzqsH9CMsvNthKiQsd6nB+Enp72qlcaBOqsmeN3O
         5/bHoArg7C/VeqVpCmFWob+gMk14t8Makhp22YQCw82slhSJhtRPbtzk8TsnJVpkjbU0
         rtlNnQK6X2ncsFPqitnbAmEWx1hv68IZAVKPDow6WIeQeXJ2uenYQf0gK1pEBbwFoDNg
         k0BYvJZIURLObaUoe1M+pcc5sgKC8zLb9B5EJUtiS/d2CjEUxwm0Ecuqi7EqARVTTl82
         LrtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UJ98E5rmZfHbLKJKvUQ3vbkulnFI/CkiQEts/LrvON4=;
        b=NDWrllGoOszjz0PdxmsNt35AKSdqXcu1X0GBtBTXv7vchfjp8wEe0uDbb8zGyOmZHs
         aACtYqDEKiqV4iZ8Xw5YGqLBFGnBfJ08PKq5wgEDrv8kZzQMHe6krby/vTzOCsZLpoot
         wfCApMK8ZqNXlk03OzUlec09uM9TDih0a0PYl/E1ZHVEcS9xIX3umfz7WZN/HZcJf54B
         QBrNcrEcxCJWXGDIaPbe+og1z5c3ttCTdVY4m4mi/Z+e63oFDJ29pUZyBQvgCS/QDm6L
         2A119DGxcA5qSYo9Fl4hzo3iuh3F9Ho7T3RgbwMYat8PeG/oH3RwC7hF6Qn0jaQ/MNf4
         tPUQ==
X-Gm-Message-State: AOAM533MrneUf9JDXsS+F9qcRuPgYqi+nyHV0HNzVGneMeIJTC+MQT23
        RfEtdjbu3jojcu0nW3yBSEv4Yg==
X-Google-Smtp-Source: ABdhPJwFL5Lpr4wM+4X3oqNIhP5sUv8WSwqsShOurMTMV+mQPD5odZ36Qj5kwGgTWecJto4SC/6g7w==
X-Received: by 2002:aca:f04:: with SMTP id 4mr1515564oip.151.1615225944495;
        Mon, 08 Mar 2021 09:52:24 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id x3sm2109983oif.22.2021.03.08.09.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 09:52:24 -0800 (PST)
Date:   Mon, 8 Mar 2021 11:52:22 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: Introduce SM8350 HDK
Message-ID: <YEZkVo+Cg9Wn2YKH@builder.lan>
References: <20210306020905.1173790-1-bjorn.andersson@linaro.org>
 <83273ce6-448d-a969-e9bf-97c11d57a38b@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83273ce6-448d-a969-e9bf-97c11d57a38b@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat 06 Mar 04:34 CST 2021, Konrad Dybcio wrote:

> Hi!
> 
> 
> > +		vreg_l5b_0p88: ldo5 {
> > +			regulator-name = "vreg_l5b_0p88";
> > +			regulator-min-microvolt = <880000>;
> > +			regulator-max-microvolt = <888000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +		};
> > +
> 
> This one needs `regulator-allow-set-load` since you specify current settings under UFS nodes, we've seen it not working at all without this property.
> 
> 
> > +		vreg_l6b_1p2: ldo6 {
> > +			regulator-name = "vreg_l6b_1p2";
> > +			regulator-min-microvolt = <1200000>;
> > +			regulator-max-microvolt = <1208000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +		};
> > +
> > +		vreg_l7b_2p96: ldo7 {
> > +			regulator-name = "vreg_l7b_2p96";
> > +			regulator-min-microvolt = <2504000>;
> > +			regulator-max-microvolt = <2504000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +		};
> > +
> > +		vreg_l9b_1p2: ldo9 {
> > +			regulator-name = "vreg_l9b_1p2";
> > +			regulator-min-microvolt = <1200000>;
> > +			regulator-max-microvolt = <1200000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +		};
> 
> Ditto for all three
> 
> 
> > +&usb_1_dwc3 {
> > +	/* TODO: Define USB-C connector properly */
> 
> Sidenote: doesn't the new pm8150x (I think?) USB-C driver work on pm8350x?
> 

I would not be surprised, just haven't looked at it yet.

> 
> > +/* PINCTRL - additions to nodes defined in sdm845.dtsi */
> 
> sm8350
> 
> 
> Aside from these minor comments,
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> 

Thanks for the feedback, I'll incorporate the changes and respin the
patch.

Regards,
Bjorn
