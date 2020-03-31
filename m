Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64855199C43
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2020 18:56:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731229AbgCaQ4X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Mar 2020 12:56:23 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:39424 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730099AbgCaQ4X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Mar 2020 12:56:23 -0400
Received: by mail-pf1-f193.google.com with SMTP id k15so5454708pfh.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2020 09:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=AoYRd9Pq6YoKCArfaky/GwN/okmu7M4Melv1gMLsus0=;
        b=Dia3hfRrpxaRBxvHdYd3kMBU9QW0vqQmdSuDx/tIahRVeQTZWE1qSImujnys9OAPzf
         ihL/Ae2uVTeIm7IRV4nnp3pPWpBiL7cxYKs2CPUGddpc3yogJ6Rik6vHHDjyPYtjRX5q
         Py3e9yi5uOJCFjqDCc48fMSRehdhvj0dXwqdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=AoYRd9Pq6YoKCArfaky/GwN/okmu7M4Melv1gMLsus0=;
        b=MPHd4HN1tIJW+iuxN4b4JWarFDlEugrH6+JayPqKSBy0OhZrJiYNjTAfGuXcAP79Ue
         EKRnItcDgPbBT06WrWr14VqXXROVo1/fIrJtnkQw9EB49TJ76edYQpifS6O2w+qy//Md
         d+ejHCVoVDfZcmEx2xrz171Mc/1qUpDJk7arGP/ewQqvfoN95hMZOcBUQTNszSgosnwf
         3t4kvFtrdzODWxytdHcy3XkHGpTAFBWVeUYYl/jOs4jNJX4ja6BSQaFI/Zwuy/9jW8a/
         o9ktoiFS9ec6YQTJwkHuoCeDZmvEz5rc3rRcwvZipZj4wEcQaiQM7u68tJWHfSuUDZa2
         f3Ng==
X-Gm-Message-State: ANhLgQ3KwVWqPIdPbAwmmyfXVJTCy5MnPbRz1/ZMsBSLgctq3IQKCkYr
        SOEwhmpeyFcU7/SygL7zl3Riww==
X-Google-Smtp-Source: ADFU+vu2yJB9PydRxx64pKqd+7UiF/mWFNoEoubw30zUx4+AkYrfUieVzTWz0wrsdhsJ/MmJMU3XnQ==
X-Received: by 2002:a63:484:: with SMTP id 126mr19669475pge.161.1585673781872;
        Tue, 31 Mar 2020 09:56:21 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id p22sm12147731pgn.73.2020.03.31.09.56.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2020 09:56:21 -0700 (PDT)
Date:   Tue, 31 Mar 2020 09:56:20 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: sc7180: Swap order of gpucc and sdhc_2
Message-ID: <20200331165620.GF199755@google.com>
References: <20200331092832.1.Ic361058ca22d7439164ffea11421740462e14272@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200331092832.1.Ic361058ca22d7439164ffea11421740462e14272@changeid>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Mar 31, 2020 at 09:29:00AM -0700, Douglas Anderson wrote:
> Devices are supposed to be sorted by unit address.  These two got
> swapped when they landed.  Fix.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 998f101ad623..4bdadfd9efb9 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1294,6 +1294,20 @@ pinconf-sd-cd {
>  			};
>  		};
>  
> +		gpucc: clock-controller@5090000 {
> +			compatible = "qcom,sc7180-gpucc";
> +			reg = <0 0x05090000 0 0x9000>;
> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
> +				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
> +				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
> +			clock-names = "bi_tcxo",
> +				      "gcc_gpu_gpll0_clk_src",
> +				      "gcc_gpu_gpll0_div_clk_src";
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
>  		sdhc_2: sdhci@8804000 {
>  			compatible = "qcom,sc7180-sdhci", "qcom,sdhci-msm-v5";
>  			reg = <0 0x08804000 0 0x1000>;
> @@ -1312,20 +1326,6 @@ sdhc_2: sdhci@8804000 {
>  			status = "disabled";
>  		};
>  
> -		gpucc: clock-controller@5090000 {
> -			compatible = "qcom,sc7180-gpucc";
> -			reg = <0 0x05090000 0 0x9000>;
> -			clocks = <&rpmhcc RPMH_CXO_CLK>,
> -				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
> -				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
> -			clock-names = "bi_tcxo",
> -				      "gcc_gpu_gpll0_clk_src",
> -				      "gcc_gpu_gpll0_div_clk_src";
> -			#clock-cells = <1>;
> -			#reset-cells = <1>;
> -			#power-domain-cells = <1>;
> -		};
> -
>  		qspi: spi@88dc000 {
>  			compatible = "qcom,qspi-v1";
>  			reg = <0 0x088dc000 0 0x600>;

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
