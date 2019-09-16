Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD7D8B444E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2019 00:56:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388025AbfIPW4L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Sep 2019 18:56:11 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:38477 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727971AbfIPW4L (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Sep 2019 18:56:11 -0400
Received: by mail-pl1-f196.google.com with SMTP id w10so566955plq.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Sep 2019 15:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=u9U0NhfEbSzfNz2L/ZQn95duwdZF6KZ4lfx8fSmuha0=;
        b=NCA8Klj4av5tbA8D3ZetmtXimpMr5XYJNZvRKJv57IgJtpe+tv/r2HucvRP9LzfQjO
         pHVmn8VrzdqVVHOYn3JL8WTcuk+ZCXXNmW4QtL3MPFi6lNrRGlTvM6dfb58LCIa3kCNb
         k8k8WOLA6cxionUR4VdGuNf1TX5ttdTs9PEBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=u9U0NhfEbSzfNz2L/ZQn95duwdZF6KZ4lfx8fSmuha0=;
        b=p0s+N1wJK/zgEbF/8L8jKwfYzP1DEmypiDPux6fNTKY89+MH9WcQELRgATCHHQx1AJ
         ElOspLAMdk6CP205rAm+Lp07KU990o7rMl3dE1gsuvu5SRps3ZYJs4dnlGb0EugIetA5
         jsJIImZ89LsmA1FanAk1MgvCGTs3A0ZNYIMtxVhS4YyTd7Co5YHgvdsCv73HveLjFMiX
         LMTujYvfcxpH/jGSKsMWiDmF6TRwP1fjZUyHCVWDZphoxuIGqYi2r9f11llDh827aQU1
         QaVEauTdw8bGcI0QovE2hbBRQKgMHjVzapkLmvICNThl3tI8ImMvJ/EHlT07YVhqMKwM
         2Vhw==
X-Gm-Message-State: APjAAAUGgC5GF2rITOFWtbzUFEJYj8LU3eBArIwhc1JGGdx76n6QYayo
        y8NilU6Q6xqWnHo76EtlV7Z5ks7utrs=
X-Google-Smtp-Source: APXvYqwayKK9Iuyyov+NmVfGJ7dVLJdhErF/+zcZt3Ry1ibyTi88v0HuPEDLkwFsVqAQXDkhm30daA==
X-Received: by 2002:a17:902:bd8c:: with SMTP id q12mr474569pls.339.1568674570418;
        Mon, 16 Sep 2019 15:56:10 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
        by smtp.gmail.com with ESMTPSA id c127sm158945pfb.5.2019.09.16.15.56.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Sep 2019 15:56:09 -0700 (PDT)
Date:   Mon, 16 Sep 2019 15:56:08 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
Cc:     balbi@kernel.org, agross@kernel.org, david.brown@linaro.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH V2 3/3] arm64: dts: sdm845: Add interconnect properties
 for USB
Message-ID: <20190916225608.GH133864@google.com>
References: <1568634061-14455-1-git-send-email-cchiluve@codeaurora.org>
 <1568634061-14455-4-git-send-email-cchiluve@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1568634061-14455-4-git-send-email-cchiluve@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Chandana.

On Mon, Sep 16, 2019 at 05:11:01PM +0530, Chandana Kishori Chiluveru wrote:
> Populate USB DT node with interconnect properties.

nit: nodes

> Signed-off-by: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index fcb9330..1c41922 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -1837,6 +1837,12 @@
>  
>  			resets = <&gcc GCC_USB30_PRIM_BCR>;
>  
> +			interconnects = <&rsc_hlos MASTER_USB3_0
> +						&rsc_hlos SLAVE_EBI1>,

nit: align second line after '<' for better readability (like
'interrupts' or 'clocks' properties):

			interconnects = <&rsc_hlos MASTER_USB3_0
					 &rsc_hlos SLAVE_EBI1>,

same for the other entries.

> +					<&rsc_hlos MASTER_APPSS_PROC
> +						&rsc_hlos SLAVE_USB3_0>;
> +			interconnect-names = "usb-ddr", "apps-usb";
> +
>  			usb_1_dwc3: dwc3@a600000 {
>  				compatible = "snps,dwc3";
>  				reg = <0 0x0a600000 0 0xcd00>;
> @@ -1881,6 +1887,12 @@
>  
>  			resets = <&gcc GCC_USB30_SEC_BCR>;
>  
> +			interconnects = <&rsc_hlos MASTER_USB3_1
> +						&rsc_hlos SLAVE_EBI1>,
> +					<&rsc_hlos MASTER_APPSS_PROC
> +						&rsc_hlos SLAVE_USB3_1>;
> +			interconnect-names = "usb-ddr", "apps-usb";
> +
>  			usb_2_dwc3: dwc3@a800000 {
>  				compatible = "snps,dwc3";
>  				reg = <0 0x0a800000 0 0xcd00>;

Besides the nits:

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
