Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5C0D28D0EF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Oct 2020 17:03:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727728AbgJMPDT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Oct 2020 11:03:19 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:46580 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726157AbgJMPDT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Oct 2020 11:03:19 -0400
Received: by mail-ot1-f68.google.com with SMTP id m11so230810otk.13;
        Tue, 13 Oct 2020 08:03:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=o5w7AiSSvOScWVEvBemOGxs8ySO+ClTEubv5ALBOy58=;
        b=OtQE990ujb3vudiDxsW7BS/tA7RnobaliJrzU5wnSXww60xuJdKfRtEHNfkClBk7qU
         uu9yUFtnHFQrKL8He4/HYO3SxoZ9BPFUOPdgUNP5Fyu9YfopcGZzUV2bDvzugpuEkuZ9
         dD/Z2tZ4f3H7F4leakKLPpvGObCueI69pBXVfoPycSfW7/86bW9mmbxxXw09eksFV2XD
         +9cOdPiMTOBr4r+McieTvTNySes8qsuNokRw63MG7hsH9Fj28u4yR24C5CY98Fd/YNCS
         ZI9XPUaaGCSp5GywqTOLmK5LRFEAykeCMZQvG5jweJbkasTCz7A9jiwFFjqn5tRhqJ9T
         m5Dw==
X-Gm-Message-State: AOAM531OjZWexCjDHqIjs1tswW3PgncsxrzzIqcoh4o/vjF7YncyljQO
        dyOBIVDLHzzGru6E083ZOA==
X-Google-Smtp-Source: ABdhPJwPcGuIXfIA54rr5+iTWAXBSTcMGC1Q5kdQ2TXck21QX7ObO/HcKjz5tTQsFK0eEc3/kSij2g==
X-Received: by 2002:a9d:7f15:: with SMTP id j21mr63221otq.76.1602601398326;
        Tue, 13 Oct 2020 08:03:18 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i5sm31758ooo.32.2020.10.13.08.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 08:03:17 -0700 (PDT)
Received: (nullmailer pid 3511465 invoked by uid 1000);
        Tue, 13 Oct 2020 15:03:16 -0000
Date:   Tue, 13 Oct 2020 10:03:16 -0500
From:   Rob Herring <robh@kernel.org>
To:     Wesley Cheng <wcheng@codeaurora.org>
Cc:     sboyd@kernel.org, heikki.krogerus@linux.intel.com,
        agross@kernel.org, gregkh@linuxfoundation.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, jackp@codeaurora.org,
        sergei.shtylyov@gmail.com
Subject: Re: [PATCH v10 4/4] arm64: boot: dts: qcom: pm8150b: Add DTS node
 for PMIC VBUS booster
Message-ID: <20201013150316.GB3497815@bogus>
References: <20201008235934.8931-1-wcheng@codeaurora.org>
 <20201008235934.8931-5-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201008235934.8931-5-wcheng@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 08, 2020 at 04:59:34PM -0700, Wesley Cheng wrote:
> Add the required DTS node for the USB VBUS output regulator, which is
> available on PM8150B.  This will provide the VBUS source to connected
> peripherals.
> 
> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/pm8150b.dtsi   | 6 ++++++
>  arch/arm64/boot/dts/qcom/sm8150-mtp.dts | 4 ++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm8150b.dtsi b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
> index 2bf385f5a55a..49ea597cc0c5 100644
> --- a/arch/arm64/boot/dts/qcom/pm8150b.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
> @@ -53,6 +53,12 @@ power-on@800 {
>  			status = "disabled";
>  		};
>  
> +		pm8150b_vbus: regulator@1100 {
> +			compatible = "qcom,pm8150b-vbus-reg";
> +			status = "disabled";
> +			reg = <0x1100>;
> +		};
> +
>  		pm8150b_typec: usb-typec@1500 {
>  			compatible = "qcom,pm8150b-usb-typec";
>  			status = "disabled";
> diff --git a/arch/arm64/boot/dts/qcom/sm8150-mtp.dts b/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
> index 6c6325c3af59..ba3b5b802954 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
> @@ -409,6 +409,10 @@ &ufs_mem_phy {
>  	vdda-pll-max-microamp = <19000>;
>  };
>  
> +&pm8150b_vbus {
> +	status = "okay";
> +};

Why aren't you enabling the TypeC node and providing a complete example?

> +
>  &usb_1_hsphy {
>  	status = "okay";
>  	vdda-pll-supply = <&vdd_usb_hs_core>;
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
