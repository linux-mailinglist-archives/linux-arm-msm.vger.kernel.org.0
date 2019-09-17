Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19172B5692
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2019 21:58:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728056AbfIQT6i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Sep 2019 15:58:38 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:45122 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728054AbfIQT6i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Sep 2019 15:58:38 -0400
Received: by mail-pg1-f195.google.com with SMTP id 4so2535910pgm.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Sep 2019 12:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tAt20ZtT6/V6jtPZAgZl62EdYLrMxlX9bTR2hscPgas=;
        b=gK25IE/TKxsN/R8h9YVrCAj9/xBFjOYRVpzU5l3muVi7cdMu3eZSu+aFdek2HoZytb
         VAkVcFdphBvmT9Y6iESM4Koe9D0lP6BQMxr0bqUTt+ivHEN8NpqHrPulJ++E1gkS4ZXl
         /cAc+WMMQkYnXgz/gn7/lis+h1t2U1X9F8H5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tAt20ZtT6/V6jtPZAgZl62EdYLrMxlX9bTR2hscPgas=;
        b=TzOhD68tjjlptSk6MY1iiAbEoLPkAmU9Jqoz0sIHlBnogCu5qfPS1FAhcC9qyOGPYI
         lkvPh3xnKwxp6nAVg9mb9AbwSKavNUk4E5MX/TncgSybxGSLjHBqqVKtaZc9Rt14bmEh
         jv5WtGB9WA7lJDmaMOFGPOmpxCGg3R73k4DiLFyO9z6mQCi3+w9AwkDCXAuWJs3Qgtu6
         OMhxNYpShnxoe1akve5FAUCwYBC5mKH2oo4YAOWD/hNmJj0f7Ayx0x+axvuVhj9/Z12+
         XvKazHlhHaXQ26e8+yEuVgLjapK978hvny5qvN3Tr9pbKufWkZzWI75M/KFTuu54fq0E
         l3iQ==
X-Gm-Message-State: APjAAAWPR5qNI911PlP2VYCNgRtOOnhxpLbFdYfGD00kNHpAhXI9VHTS
        oFKyj0gziWhxNsdMPj0EYZ3JJw==
X-Google-Smtp-Source: APXvYqyYk6nWXOzE1cg11+NQ7aSPb6HMh8zRfyEhcp8XAT9fCtjO83D0nQFS5UVVw1u/PQCRWAe8HQ==
X-Received: by 2002:a63:f401:: with SMTP id g1mr580534pgi.314.1568750317289;
        Tue, 17 Sep 2019 12:58:37 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
        by smtp.gmail.com with ESMTPSA id bb15sm2935588pjb.2.2019.09.17.12.58.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Sep 2019 12:58:36 -0700 (PDT)
Date:   Tue, 17 Sep 2019 12:58:35 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
Cc:     balbi@kernel.org, agross@kernel.org, david.brown@linaro.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH V3 3/3] arm64: dts: sdm845: Add interconnect properties
 for USB
Message-ID: <20190917195835.GL133864@google.com>
References: <1568718649-20124-1-git-send-email-cchiluve@codeaurora.org>
 <1568718649-20124-4-git-send-email-cchiluve@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1568718649-20124-4-git-send-email-cchiluve@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Sep 17, 2019 at 04:40:49PM +0530, Chandana Kishori Chiluveru wrote:
> Populate USB DT nodes with interconnect properties.
> 
> Signed-off-by: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index fcb9330..e4885f3 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -1837,6 +1837,12 @@
>  
>  			resets = <&gcc GCC_USB30_PRIM_BCR>;
>  
> +			interconnects = <&rsc_hlos MASTER_USB3_0
> +					 &rsc_hlos SLAVE_EBI1>,
> +					<&rsc_hlos MASTER_APPSS_PROC
> +					 &rsc_hlos SLAVE_USB3_0>;
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
> +					 &rsc_hlos SLAVE_EBI1>,
> +					<&rsc_hlos MASTER_APPSS_PROC
> +					 &rsc_hlos SLAVE_USB3_1>;
> +			interconnect-names = "usb-ddr", "apps-usb";
> +
>  			usb_2_dwc3: dwc3@a800000 {
>  				compatible = "snps,dwc3";
>  				reg = <0 0x0a800000 0 0xcd00>;

Please collect tags from earlier versions, unless the new version has
'major' changes (which is a bit of a judgement call).

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
