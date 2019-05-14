Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 994B11CCA0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 May 2019 18:12:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726347AbfENQMj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 May 2019 12:12:39 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:37452 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726098AbfENQMj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 May 2019 12:12:39 -0400
Received: by mail-lf1-f67.google.com with SMTP id q17so1836177lfo.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 May 2019 09:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0QxQLniEtG81+kyArEQM4sajonuLI/d4dsOlin13g+k=;
        b=eenmdHUSIm3Tz7X70d847Bpnla+2zhuJtXMT/tmzVk2AvrfI2No6UPc8DYYj2ZMaVt
         INXyC+MAH0BCNBy9W+jK1WWLPyLbKQkmY9O2xdenMkk8sVzmYpy0m6A9QiO7+yIULATg
         qQMqSa42+mQn5/eCYdtsdhrLjfBY9YpkDnwULLmqupWSnbwuz1uj7BWh9Ew13En70x5G
         4LuYK+jxQ/0TQuj0xH8eSZIPlDXLyK7js7ve469VUwrx+MDmmNHxT+PTR/hvEEHE00KZ
         fwRaGiRa5cboHR48kbERBTIg6+jXKlOd8euphr53VklwV9N/wtoghNeIuwAtwbMx3TEm
         tPwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0QxQLniEtG81+kyArEQM4sajonuLI/d4dsOlin13g+k=;
        b=ru1aeRC59j64PfpzwEPTVVY7Vc0pV/bJ8TmmeUwkbUVsYmmjvpcbDNXKBzKcbcddkp
         qMv/VQcXvWNHxKfLRfZkTOvknIPBa607OHKsk+qH19ohWahTpxEuGjtq3aEaSWMUZVj9
         Bit5SLOe4VhK3OAUb6GPOWeZVZC8y6n/8DHkuQOIM+Kkn1C4W2PERDn1pmZpcdg6cJAo
         YokE/sIV2jQLRqnIUlXJEx57A36wR+Qs7g9P6RZ4cKyddvNSldoBZVtAOdEJC6pqj27J
         UhWvOjK6h/yfCoD58zTJwYSBVLrbhbm5fwL5mA6ETJL9tA6T8FgCSYjVVDlpNkEoHKLE
         lYZQ==
X-Gm-Message-State: APjAAAUirgLKAtApe1rPf5D49nBb+E6CuR5rjEBHOWVxlV3TC0C6TbGe
        NAlpzG/WfQTj1tI0Sr5xc6eTAg==
X-Google-Smtp-Source: APXvYqylM726m0SsDubH8owhcqjWTD03ejTAgx+NHERKamKAdhR1TTE56/rLFxqgbMYgwe0FS0g8Bw==
X-Received: by 2002:a19:81d4:: with SMTP id c203mr17305334lfd.160.1557850357833;
        Tue, 14 May 2019 09:12:37 -0700 (PDT)
Received: from centauri.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id x2sm3699922ljx.13.2019.05.14.09.12.36
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 14 May 2019 09:12:37 -0700 (PDT)
Date:   Tue, 14 May 2019 18:12:35 +0200
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     Amit Kucheria <amit.kucheria@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, andy.gross@linaro.org,
        David Brown <david.brown@linaro.org>,
        Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCHv1 5/8] arm64: dts: qcom: qcs404: Add PSCI cpuidle low
 power states
Message-ID: <20190514161235.GD1824@centauri.ideon.se>
References: <cover.1557486950.git.amit.kucheria@linaro.org>
 <d3a517b90620fe167eb9fd27bcc88a43dce514b2.1557486950.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d3a517b90620fe167eb9fd27bcc88a43dce514b2.1557486950.git.amit.kucheria@linaro.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 10, 2019 at 04:59:43PM +0530, Amit Kucheria wrote:
> From: Niklas Cassel <niklas.cassel@linaro.org>
> 
> Add device bindings for cpuidle states for cpu devices.
> 
> [amit: rename the idle-states to more generic names and fixups]
> 
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> Reviewed-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qcs404.dtsi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> index e8fd26633d57..369c59c35bc7 100644
> --- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> @@ -30,6 +30,7 @@
>  			compatible = "arm,cortex-a53";
>  			reg = <0x100>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&CPU_SLEEP_0>;
>  			next-level-cache = <&L2_0>;
>  		};
>  
> @@ -38,6 +39,7 @@
>  			compatible = "arm,cortex-a53";
>  			reg = <0x101>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&CPU_SLEEP_0>;
>  			next-level-cache = <&L2_0>;
>  		};
>  
> @@ -46,6 +48,7 @@
>  			compatible = "arm,cortex-a53";
>  			reg = <0x102>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&CPU_SLEEP_0>;
>  			next-level-cache = <&L2_0>;
>  		};
>  
> @@ -54,6 +57,7 @@
>  			compatible = "arm,cortex-a53";
>  			reg = <0x103>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&CPU_SLEEP_0>;
>  			next-level-cache = <&L2_0>;
>  		};
>  
> @@ -61,6 +65,20 @@
>  			compatible = "cache";
>  			cache-level = <2>;
>  		};
> +
> +		idle-states {
> +			entry-method="psci";

Please add a space before and after "=".

> +
> +			CPU_SLEEP_0: cpu-sleep-0 {

Regarding CPU_SLEEP_0 vs CPU_PC, see my comment on patch 4/8.

> +				compatible = "arm,idle-state";
> +				idle-state-name = "standalone-power-collapse";
> +				arm,psci-suspend-param = <0x40000003>;
> +				entry-latency-us = <125>;
> +				exit-latency-us = <180>;
> +				min-residency-us = <595>;
> +				local-timer-stop;
> +			};
> +		};
>  	};
>  
>  	firmware {
> -- 
> 2.17.1
> 
