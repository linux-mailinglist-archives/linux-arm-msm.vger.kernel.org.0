Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55C49133A9E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2020 05:57:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726525AbgAHE5T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jan 2020 23:57:19 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:39881 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbgAHE5T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jan 2020 23:57:19 -0500
Received: by mail-pj1-f66.google.com with SMTP id t101so534421pjb.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2020 20:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4mtdywEsJk+nT9VyFRx8P9/lJ04ak0DTV5M3N2oJ6TI=;
        b=IFCNzfE7iaak3dYJ1Yo+CaQgGqdHU+rfnC0wA0asEZh3mwNM1h3hScSbEa03vlZRgV
         MAPp5pCSefK9OXvYT5Waxldi6gEVqLLUSA+o4HblpXqowqsmbdQuimnfTf+AGUW/LHW1
         THk3eO06X4L8Elr5oqkT++qalFZVbq1SV9b3oUjmDCX+OUemW2JL9pLvU39PHC4aE6PJ
         3dwNd11UTsTeqK4HiKkBGeQkG7hnLu09OwNu3UeRKPtqmTZf+uIIDeTFjdzd+K2uilN1
         cntRJGYp9dQ5zOwrEnt+A+DuE40gtfi65O3OKNIXPDRzhBaXRl74aJn8KjKjzt74dwLi
         +E7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4mtdywEsJk+nT9VyFRx8P9/lJ04ak0DTV5M3N2oJ6TI=;
        b=X+K4xMD90gbSsx5nmWObNvSlPJxq0vhhkqiUcv1kuhiCjDHovQ1hKhq1guWNBUQVSn
         jTKlMxHIcqD5GwK++BzStje27h+ZuVsW24XzR0o3d9oIvQWg2H3Iwh0Utb/1JJbBcOoY
         L252iKLIWZ4vvuEIs+CoxATeaII+I1Sl6qlDmr5aNCJIHmiAGbpEgIADDs4twgPqv7/3
         kWb1L2z2TyAXqoSXHAMhiP0VgJMzl3/XIP7qjSz1BILO8+uIvazW/4xP0uZ5warvEG3b
         07xwc3vxsXNOUB9LjQOnqIBn4wAvWEMJrQr4t6nwoFOHYd31i293VlbZa3I86kA1Wslf
         zRtQ==
X-Gm-Message-State: APjAAAXi71ARbylciCUD9UykSm/4hUdpTpRbTDfzfl5Q1qDs2ey2BlsZ
        pZzmoFKjnF1kWWEEAUHcUt0zKA==
X-Google-Smtp-Source: APXvYqyAiUM0Zfk94sj3wybH1+jEV9hsV42rj3yXWIoRlo02aJPtDczc5InitHATpM/Ute/7PNrkUA==
X-Received: by 2002:a17:902:760e:: with SMTP id k14mr3539817pll.238.1578459437930;
        Tue, 07 Jan 2020 20:57:17 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id j38sm1469771pgj.27.2020.01.07.20.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 20:57:17 -0800 (PST)
Date:   Tue, 7 Jan 2020 20:57:14 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] arm64: dts: sdm845: move gpu zap nodes to per-device
 dts
Message-ID: <20200108045714.GH738324@yoga>
References: <20200108013847.899170-1-robdclark@gmail.com>
 <20200108013847.899170-4-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200108013847.899170-4-robdclark@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 07 Jan 17:38 PST 2020, Rob Clark wrote:

> From: Rob Clark <robdclark@chromium.org>
> 
> We want to specify per-device firmware-name, so move the zap node into
> the .dts file for individual boards/devices.  This lets us get rid of
> the /delete-node/ for cheza, which does not use zap.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi           | 1 -
>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts           | 7 +++++++
>  arch/arm64/boot/dts/qcom/sdm845-mtp.dts              | 8 ++++++++
>  arch/arm64/boot/dts/qcom/sdm845.dtsi                 | 6 +-----
>  arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 7 +++++++
>  5 files changed, 23 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> index 9a4ff57fc877..2db79c1ecdac 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> @@ -165,7 +165,6 @@ panel_in_edp: endpoint {
>  /delete-node/ &venus_mem;
>  /delete-node/ &cdsp_mem;
>  /delete-node/ &cdsp_pas;
> -/delete-node/ &zap_shader;
>  /delete-node/ &gpu_mem;
>  
>  /* Increase the size from 120 MB to 128 MB */
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> index d100f46791a6..c472195e44fb 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> @@ -352,6 +352,13 @@ &gcc {
>  			   <GCC_QSPI_CNOC_PERIPH_AHB_CLK>;
>  };
>  
> +&gpu {
> +	zap-shader {
> +		memory-region = <&gpu_mem>;
> +		firmware-name = "qcom/db845c/a630_zap.mbn";

We agreed upon qcom/sdm845/* for the test-signed 845 firmware :)

> +	};
> +};
> +
>  &pm8998_gpio {
>  	vol_up_pin_a: vol-up-active {
>  		pins = "gpio6";
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> index c57548b7b250..876155fc0547 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> @@ -360,6 +360,14 @@ &gcc {
>  			   <GCC_LPASS_SWAY_CLK>;
>  };
>  
> +&gpu {
> +	zap-shader {
> +		memory-region = <&gpu_mem>;
> +		// TODO presumably mtp can use same "test key" signed zap?

Drop this comment after s/db845c/sdm845/

> +		firmware-name = "qcom/db845c/a630_zap.mbn";

Apart from that, I think this looks good!

Regards,
Bjorn

> +	};
> +};
> +
>  &i2c10 {
>  	status = "okay";
>  	clock-frequency = <400000>;
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index ddb1f23c936f..601c57cc9b6d 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -2804,7 +2804,7 @@ dsi1_phy: dsi-phy@ae96400 {
>  			};
>  		};
>  
> -		gpu@5000000 {
> +		gpu: gpu@5000000 {
>  			compatible = "qcom,adreno-630.2", "qcom,adreno";
>  			#stream-id-cells = <16>;
>  
> @@ -2824,10 +2824,6 @@ gpu@5000000 {
>  
>  			qcom,gmu = <&gmu>;
>  
> -			zap_shader: zap-shader {
> -				memory-region = <&gpu_mem>;
> -			};
> -
>  			gpu_opp_table: opp-table {
>  				compatible = "operating-points-v2";
>  
> diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> index 13dc619687f3..b255be3a4a0a 100644
> --- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> @@ -245,6 +245,13 @@ &gcc {
>  			   <GCC_QSPI_CNOC_PERIPH_AHB_CLK>;
>  };
>  
> +&gpu {
> +	zap-shader {
> +		memory-region = <&gpu_mem>;
> +		firmware-name = "qcom/LENOVO/81JL/qcdxkmsuc850.mbn";
> +	};
> +};
> +
>  &i2c1 {
>  	status = "okay";
>  	clock-frequency = <400000>;
> -- 
> 2.24.1
> 
