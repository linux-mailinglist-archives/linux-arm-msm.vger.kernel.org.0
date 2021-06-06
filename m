Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6DF639CC9B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Jun 2021 05:53:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230099AbhFFDzh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 5 Jun 2021 23:55:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230025AbhFFDzg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 5 Jun 2021 23:55:36 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE655C061767
        for <linux-arm-msm@vger.kernel.org>; Sat,  5 Jun 2021 20:53:32 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id x196so13961300oif.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 05 Jun 2021 20:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TsYbNZ4laI9teXiRJwQVtXw/WDE1ka50Y7QE5jEbcP4=;
        b=bbcnenBvpJuDnmICaT9RTDNMiZKHi64pJelIP6411edJGm6lP2ahR9DHujng+OvGKR
         iEDVN1SHnmIcfdqhuXH5F4sEfooK91eon7fCFMznQFyyAmLe69I5MxNHWnW3UCbv8l+S
         w8OGJ4WYeQ8f9HkHoc9shmU6g2QHklgbgl59uzNQVA+k0SOIBPWnVsxJFShpFjMpgAdT
         3ZU0Ts65dhmcyQAfSGJBqZFI8woFUfa99Yq97FEXtCrsl/nFjuzvcyxma9AZz5xLoV3a
         8D567spjUgk/tXA3hNq6jEgs7+mAaM2wCRyEKiwAx+n3OeAeKqh67FUpGA+wp8a3qI4+
         JcJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TsYbNZ4laI9teXiRJwQVtXw/WDE1ka50Y7QE5jEbcP4=;
        b=DeMCgckJAefL6QEidQbWtnuZCJOv74fYWQbPKRy4kvemf18avJNWFp2w3BP57zrV7R
         NeGJumK6Z0KEKCWv5IRZLJQ+MpLxrCNKTdnDyJnGGTpZXtd4whXTvDHkXyCRoA9wd4Zw
         W7/cVs/g7qKBlv68MlaUONQ7me99V9OhouqyqOhVXnB8RPxb0hZtZXMGzGSlVeeAtIsl
         w2Srbf/TrqAaQ3puruSS3GaV1jhf8yWazcgj5u3N1tnzA3j5iGS20wBePlaT0Co8p7xS
         0BRU437n5WIPFPuG7BNeltDwGziiEhphOKK/IIZzhN0KjW0Y4fSzJur3lurhFjWVqhUK
         j+jQ==
X-Gm-Message-State: AOAM532RcHaxB/SS1Y0FNKwMAdH9C3O+n5Gx2tbluzLWnynyqtixIgDW
        XwurERO3j+3H9bGISId57+xIhg==
X-Google-Smtp-Source: ABdhPJzyruRqU3EEplQVcCRdayKYdxRwFXNLcXRW6dB7mQ4HsbBseHLG6XV9Edghjv66KDiiXHu6lw==
X-Received: by 2002:a05:6808:249:: with SMTP id m9mr7656763oie.120.1622951612225;
        Sat, 05 Jun 2021 20:53:32 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id l24sm569847oii.45.2021.06.05.20.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jun 2021 20:53:31 -0700 (PDT)
Date:   Sat, 5 Jun 2021 22:53:30 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Roja Rani Yarubandi <rojay@codeaurora.org>
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com
Subject: Re: [PATCH V3 3/3] arm64: dts: sc7280: Add QUPv3 wrapper_1 nodes
Message-ID: <YLxGuumLA5ii9awe@builder.lan>
References: <20210604135439.19119-1-rojay@codeaurora.org>
 <20210604135439.19119-4-rojay@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210604135439.19119-4-rojay@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 04 Jun 08:54 CDT 2021, Roja Rani Yarubandi wrote:

> Add QUPv3 wrapper_1 DT nodes for SC7280 SoC.
> 
> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
> ---
> Changes in V3:
>  - Broken the huge V2 patch into 3 smaller patches.
>    1. QSPI DT nodes
>    2. QUP wrapper_0 DT nodes
>    3. QUP wrapper_1 DT nodes
> 
> Changes in V2:
>  - As per Doug's comments removed pinmux/pinconf subnodes.
>  - As per Doug's comments split of SPI, UART nodes has been done.
>  - Moved QSPI node before aps_smmu as per the order.
> 
>  arch/arm64/boot/dts/qcom/sc7280-idp.dts |   4 +
>  arch/arm64/boot/dts/qcom/sc7280.dtsi    | 751 ++++++++++++++++++++++++
>  2 files changed, 755 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> index f57458dbe763..bdea9bf4eeca 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> @@ -288,6 +288,10 @@ &qupv3_id_0 {
>  	status = "okay";
>  };
>  
> +&qupv3_id_1 {
> +	status = "okay";
> +};
> +
>  &uart5 {
>  	status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index b783f5622a66..348a34f3448e 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -881,6 +881,437 @@ uart7: serial@99c000 {
>  			};
>  		};
>  
> +		qupv3_id_1: geniqup@ac0000 {
> +			compatible = "qcom,geni-se-qup";
> +			reg = <0 0x00ac0000 0 0x2000>;
> +			clock-names = "m-ahb", "s-ahb";
> +			clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
> +				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +			iommus = <&apps_smmu 0x43 0x0>;
> +			interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>;
> +			interconnect-names = "qup-core";

We used to have interconnect votes for the wrapper, but I recently
merged patches that dropped these for sc7180, so please conclude which
way this should be.

The rest looks good.

Regards,
Bjorn
