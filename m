Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 451184A528F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Jan 2022 23:46:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234341AbiAaWqY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Jan 2022 17:46:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234281AbiAaWqW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Jan 2022 17:46:22 -0500
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDBD5C06173D
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 14:46:21 -0800 (PST)
Received: by mail-oi1-x235.google.com with SMTP id b186so23549846oif.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 14:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cPSwipAItewrlwlaB1WgBWvG61rxGLcFg9j2CvLpcl4=;
        b=fNI2v12SSGf4SjaosIMf61vcXiPBZ8h/JfxIBp1Nn485Jw2QvpBpcFoaqi+JulyJUD
         xqNZPZpWi8A4WaMqNR+Qi8Ak2zpAPe4ZOU5PDIsKBFFjOfAVI8rtVZ7UQ74eDj+QEJKq
         up9My2u5uR/Jiiu5J4Bj3VR3vQOFHgfyKGQJPwg3fQ6M5sQoB0VLo9TsLrJZvV8h5iJW
         8WIJezdrcvyxBDM3vWCqtFTK62WTcrDApbO2rICGZJWZHq/7QwHsLT5HxC7oZMZiBfDn
         QRLY1Z4ZDsLTxg6ZteQnj/5PQ2ji9skJeI8cZ34jk/at7dlGyTMdng88pBmK/p43vSPL
         Kukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cPSwipAItewrlwlaB1WgBWvG61rxGLcFg9j2CvLpcl4=;
        b=3hXrzfZOZUc1s75hHiTDfUEScYnqhSljGkotcYJKDOAiK9fd/0YxYix2Eoc+XEgBkR
         9VUdl0fXHJu9j8YMxrbApVgNatjGEycjKJXohnjiuYVVihTlG7PUPtsoIjBqrzwy4po0
         tUq0hZEN4cHX1KIBf8YjSskTnS8lAl8ULmToMXC9vxIfVUwE5XQxveZqDLa/2nWzG3M7
         tsrF4R9wC6JhHvKwDn9v+s0y6k/U1PaAz0ubjpyR/ogn0zqWUs8cFxj18uA7yLD3xJe5
         PzTfd6xJBdjZ6cKW94DjhpBboAAmyKlSTX/InRUi8F/F+/32V+iiYCTEFgaJuu5a5OqX
         +Mmw==
X-Gm-Message-State: AOAM532D0S5vXBjGbWl0CAXj9DwL09IV76fTGp98QIa2dHE2f7F7zM8O
        EMIdIKi5lOkP+UsTNbP98fHQpQ==
X-Google-Smtp-Source: ABdhPJy37enwPYoI7CBQqfeyVSBy1AhPAF9NzuycunkO9qrLp8a1s4gU/voxLeGJODYg6F8qmwegSw==
X-Received: by 2002:a05:6808:1208:: with SMTP id a8mr19819135oil.223.1643669181198;
        Mon, 31 Jan 2022 14:46:21 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id w20sm13203286otu.12.2022.01.31.14.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 14:46:20 -0800 (PST)
Date:   Mon, 31 Jan 2022 16:46:18 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/17] ARM: dts: qcom: add missing rpm regulators and
 cells for ipq8064
Message-ID: <Yfhmum8BnB1JIALP@builder.lan>
References: <20220118012051.21691-1-ansuelsmth@gmail.com>
 <20220118012051.21691-4-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220118012051.21691-4-ansuelsmth@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 17 Jan 19:20 CST 2022, Ansuel Smith wrote:

> Add cells definition for rpm node and add missing regulators for the 4
> regulator present on ipq8064. There regulators are controlled by rpm and
> to correctly works gsbi4_i2c require to be NEVER disabled or rpm will
> reject any regulator change request.
> 

Is the SMB208 mandatory on all ipq8064 designs, or should this be pushed
out to the device dts?

Regards,
Bjorn

> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
>  arch/arm/boot/dts/qcom-ipq8064.dtsi | 35 +++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> index 094125605bea..824cf13dd037 100644
> --- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> @@ -829,10 +829,45 @@ rpm: rpm@108000 {
>  			clocks = <&gcc RPM_MSG_RAM_H_CLK>;
>  			clock-names = "ram";
>  
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
>  			rpmcc: clock-controller {
>  				compatible = "qcom,rpmcc-ipq806x", "qcom,rpmcc";
>  				#clock-cells = <1>;
>  			};
> +
> +			regulators {
> +				compatible = "qcom,rpm-smb208-regulators";
> +
> +				smb208_s1a: s1a {
> +					regulator-min-microvolt = <1050000>;
> +					regulator-max-microvolt = <1150000>;
> +
> +					qcom,switch-mode-frequency = <1200000>;
> +				};
> +
> +				smb208_s1b: s1b {
> +					regulator-min-microvolt = <1050000>;
> +					regulator-max-microvolt = <1150000>;
> +
> +					qcom,switch-mode-frequency = <1200000>;
> +				};
> +
> +				smb208_s2a: s2a {
> +					regulator-min-microvolt = < 800000>;
> +					regulator-max-microvolt = <1250000>;
> +
> +					qcom,switch-mode-frequency = <1200000>;
> +				};
> +
> +				smb208_s2b: s2b {
> +					regulator-min-microvolt = < 800000>;
> +					regulator-max-microvolt = <1250000>;
> +
> +					qcom,switch-mode-frequency = <1200000>;
> +				};
> +			};
>  		};
>  
>  		tcsr: syscon@1a400000 {
> -- 
> 2.33.1
> 
