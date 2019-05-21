Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF47C24C7B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2019 12:14:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726389AbfEUKOe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 May 2019 06:14:34 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:51653 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726289AbfEUKOe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 May 2019 06:14:34 -0400
Received: by mail-wm1-f67.google.com with SMTP id c77so2353596wmd.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 May 2019 03:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3voex/jBEW9v9dc4oWg0TTQi5rLILcSF0U6L8KVM4UE=;
        b=PIkr1V2QTJYmRpwDqmjYbI060u3HF5TNMycLref/026rLmSbRIE7Ka3CfSC0T7nhMP
         10OOJQR+wKMIaENtCO/He9lOoeuV1e7tS4/PJhUadKYY8cy4LqVtbdZoY3xnfvRV6exh
         q3WKxM1k+H5UeCAgy93LelnODqeoDVHq7C4BBV1n3d/nEsoXVFMIYX3lnI5LyY2fY9M2
         ZnVmKYnuDFAxRTk+74a99dxd4+MLk6YTBY0J9yXVG3DCgKFXEOTJMhxwoRw5y781v4+l
         +I5uN3TJ7tbHnAo2YJx6a4UQftob+IwzxxhotKsYiuiqN3fsdtHC3aZuyGmOWNtC0Cw8
         QnnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3voex/jBEW9v9dc4oWg0TTQi5rLILcSF0U6L8KVM4UE=;
        b=R0bc5Ax2FvuJQn5VUN31yc/CS9ncum3ZKilfOhv/RvlxyYJyIB31vopjQzMqJFvAQC
         hDscj2xzD8WMqoNVD/IUSMO7aKLMcXneKL3uF5iQ11LqxEJ4RtzgTI0GkNvuFijZ8grC
         vuf0/6pPP1HQ9qG8EzCC7x35+Q6ph0Bo64gNkdM3hCDtn54oVuQXPCrIh826eS/ShmDT
         URBxgrDe1ngNLULzqpTjTDrz4bhMv4B8hofCw2BXWCL/E7H6kbEvK8FxJ59smJyyaWfz
         BdoHAjarUubGvvSzaq0MbodshM60WTrNEH5dujSaD3Y8MzMyC6hSiJ4xcQgLcyPMezVp
         PKfQ==
X-Gm-Message-State: APjAAAVTM7Sbgm6J4LgI5wpNMZPwcwnWyGTHQJhoEgb7DvbwnoOrhAj5
        ksNGc/ZU267uJISTBKvqNlbo/A==
X-Google-Smtp-Source: APXvYqyo+0aEb88Qh52g+hWsQkGu2zF7ZMonwwWcENIiggHq3E+mgnk4XyzZ4R3uURr+ZjJHGnE9Bw==
X-Received: by 2002:a7b:ca4c:: with SMTP id m12mr2717082wml.31.1558433671197;
        Tue, 21 May 2019 03:14:31 -0700 (PDT)
Received: from [10.1.203.87] (nat-wifi.sssup.it. [193.205.81.22])
        by smtp.googlemail.com with ESMTPSA id 20sm3441976wmj.36.2019.05.21.03.14.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 May 2019 03:14:30 -0700 (PDT)
Subject: Re: [PATCH v2 9/9] arm64: dts: msm8996: Add proper capacity scaling
 for the cpus
To:     Amit Kucheria <amit.kucheria@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        niklas.cassel@linaro.org, marc.w.gonzalez@free.fr,
        sibis@codeaurora.org, Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Cc:     devicetree@vger.kernel.org
References: <cover.1558430617.git.amit.kucheria@linaro.org>
 <5224535a7ef5b257e3baa698991bf6deeefccc36.1558430617.git.amit.kucheria@linaro.org>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <6636af52-4f29-2869-7f9f-6d6277af6712@linaro.org>
Date:   Tue, 21 May 2019 12:14:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5224535a7ef5b257e3baa698991bf6deeefccc36.1558430617.git.amit.kucheria@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/05/2019 11:35, Amit Kucheria wrote:
> msm8996 features 4 cpus - 2 in each cluster. However, all cpus implement
> the same microarchitecture and the two clusters only differ in the
> maximum frequency attainable by the CPUs.
> 
> Add capacity-dmips-mhz property to allow the topology code to determine
> the actual capacity by taking into account the highest frequency for
> each CPU.
> 
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> Suggested-by: Daniel Lezcano <daniel.lezcano@linaro.org>

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>

> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 4f2fb7885f39..e0e8f30ce11a 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -96,6 +96,7 @@
>  			reg = <0x0 0x0>;
>  			enable-method = "psci";
>  			cpu-idle-states = <&CPU_SLEEP_0>;
> +			capacity-dmips-mhz = <1024>;
>  			next-level-cache = <&L2_0>;
>  			L2_0: l2-cache {
>  			      compatible = "cache";
> @@ -109,6 +110,7 @@
>  			reg = <0x0 0x1>;
>  			enable-method = "psci";
>  			cpu-idle-states = <&CPU_SLEEP_0>;
> +			capacity-dmips-mhz = <1024>;
>  			next-level-cache = <&L2_0>;
>  		};
>  
> @@ -118,6 +120,7 @@
>  			reg = <0x0 0x100>;
>  			enable-method = "psci";
>  			cpu-idle-states = <&CPU_SLEEP_0>;
> +			capacity-dmips-mhz = <1024>;
>  			next-level-cache = <&L2_1>;
>  			L2_1: l2-cache {
>  			      compatible = "cache";
> @@ -131,6 +134,7 @@
>  			reg = <0x0 0x101>;
>  			enable-method = "psci";
>  			cpu-idle-states = <&CPU_SLEEP_0>;
> +			capacity-dmips-mhz = <1024>;
>  			next-level-cache = <&L2_1>;
>  		};
>  
> 


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

