Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E01E265A71
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2019 17:28:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728471AbfGKP2A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Jul 2019 11:28:00 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:34351 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728311AbfGKP2A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Jul 2019 11:28:00 -0400
Received: by mail-pl1-f196.google.com with SMTP id i2so3222154plt.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jul 2019 08:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=uMsVDicDOb3lhj4yIbuOZntxA7sECtLuV+gybGzQqeU=;
        b=rgIByt6j+CT1bDeZ1dG5yEGPFHYKSyg+NPlvE5ax2UXaEqyinB3qWooX58sy7y537i
         ZMT7aafv0DVnlW86rYn2QMv02OMIB7hmQbR7pOKbj5YQlSuIYmFnTZXfPpASzu68AteA
         tkBbTDr89/zlXNs7mOSqOZs7UtNmCAqFBowjFlBGutQXB7GDTQCcVkeaGRknXA3q7wEJ
         fPUim1MajW40r4S/kv4z/xfVjvzYuMQIIbGx6u8Y2YmUjGw8MBjZABWJPxbQUx3b7Jmq
         /H+EFAin5UVLoubHVbRiwJwT3EiOnpBLZYYzNwkbjoigIhmnka0zO9EaM8nBu+OGgp3c
         UkXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=uMsVDicDOb3lhj4yIbuOZntxA7sECtLuV+gybGzQqeU=;
        b=UEgMU281EuuLVfaX+zB04XExWDthxtKa5G/nSBSAW6F9sGH+sYeDRKWU6OsuzyXfla
         zYTwRX5/cAAE6m0/btHzWLk676oHCi1HRMBO8Vo1vbU7tYu+Pw6Ts0GM7aoQZF3C/jkr
         ifrvc1MrZU431NE7OLt3KKzCMNIAIJD5HqXKPZphTtVBB4HI6si/hqTIIKYlvTm8BmnN
         Swt01QGxjP1/JGdgWFLEA4IjXPp8ONIOJO8n0QMXZpCCwij4OA13e6v2Kl/7CpsBuoW2
         DwngFOfqkc3oD7zU5f1SC1Tysa48UO3JuIwAOOJktfCk43hdHnH2XAbVEJpA0RJmuPDj
         LR7w==
X-Gm-Message-State: APjAAAUEyD7xfilNJqEms3CrWKqf3MRmM4x8EByJKKerx6vU/WrrDuUT
        eXvbgW+ENy/olbcwfFT01Svfhg==
X-Google-Smtp-Source: APXvYqwNbmI3JyRFZsBS7iOj0fl3s07h7X0FI9ixCmAonmnpaGSvvC0CiHoHMbDvsZcDftbZGo/7Rg==
X-Received: by 2002:a17:902:ff05:: with SMTP id f5mr5168522plj.116.1562858879444;
        Thu, 11 Jul 2019 08:27:59 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id h14sm6439150pfq.22.2019.07.11.08.27.57
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 11 Jul 2019 08:27:58 -0700 (PDT)
Date:   Thu, 11 Jul 2019 08:29:09 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc:     sboyd@kernel.org, david.brown@linaro.org, jassisinghbrar@gmail.com,
        mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org,
        will.deacon@arm.com, arnd@arndb.de, horms+renesas@verge.net.au,
        heiko@sntech.de, sibis@codeaurora.org,
        enric.balletbo@collabora.com, jagan@amarulasolutions.com,
        olof@lixom.net, vkoul@kernel.org, niklas.cassel@linaro.org,
        georgi.djakov@linaro.org, amit.kucheria@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, khasim.mohammed@linaro.org
Subject: Re: [PATCH v3 13/14] arm64: dts: qcom: qcs404: Add DVFS support
Message-ID: <20190711152909.GO7234@tuxbook-pro>
References: <20190625164733.11091-1-jorge.ramirez-ortiz@linaro.org>
 <20190625164733.11091-14-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190625164733.11091-14-jorge.ramirez-ortiz@linaro.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 25 Jun 09:47 PDT 2019, Jorge Ramirez-Ortiz wrote:

> Support dynamic voltage and frequency scaling on qcs404.
> 
> Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>

I agree with Niklas on the possibility of squashing this with the opp
table. But unless you respin this

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  arch/arm64/boot/dts/qcom/qcs404.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> index 9569686dbc41..4b4ce0b5df76 100644
> --- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> @@ -34,6 +34,9 @@
>  			enable-method = "psci";
>  			cpu-idle-states = <&CPU_SLEEP_0>;
>  			next-level-cache = <&L2_0>;
> +			clocks = <&apcs_glb>;
> +			operating-points-v2 = <&cpu_opp_table>;
> +			cpu-supply = <&pms405_s3>;
>  		};
>  
>  		CPU1: cpu@101 {
> @@ -43,6 +46,9 @@
>  			enable-method = "psci";
>  			cpu-idle-states = <&CPU_SLEEP_0>;
>  			next-level-cache = <&L2_0>;
> +			clocks = <&apcs_glb>;
> +			operating-points-v2 = <&cpu_opp_table>;
> +			cpu-supply = <&pms405_s3>;
>  		};
>  
>  		CPU2: cpu@102 {
> @@ -52,6 +58,9 @@
>  			enable-method = "psci";
>  			cpu-idle-states = <&CPU_SLEEP_0>;
>  			next-level-cache = <&L2_0>;
> +			clocks = <&apcs_glb>;
> +			operating-points-v2 = <&cpu_opp_table>;
> +			cpu-supply = <&pms405_s3>;
>  		};
>  
>  		CPU3: cpu@103 {
> @@ -61,6 +70,9 @@
>  			enable-method = "psci";
>  			cpu-idle-states = <&CPU_SLEEP_0>;
>  			next-level-cache = <&L2_0>;
> +			clocks = <&apcs_glb>;
> +			operating-points-v2 = <&cpu_opp_table>;
> +			cpu-supply = <&pms405_s3>;
>  		};
>  
>  		L2_0: l2-cache {
> -- 
> 2.21.0
> 
