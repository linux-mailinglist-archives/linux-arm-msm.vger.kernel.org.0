Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B07534730A7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Dec 2021 16:34:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235648AbhLMPeq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Dec 2021 10:34:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233095AbhLMPeq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Dec 2021 10:34:46 -0500
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F201AC061748
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Dec 2021 07:34:45 -0800 (PST)
Received: by mail-ot1-x32e.google.com with SMTP id a23-20020a9d4717000000b0056c15d6d0caso17756513otf.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Dec 2021 07:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9UxEcNSwKoN2mFJyfZRLVmjwVvQHZtyiCY9mygjt3b0=;
        b=hT1cyNUIs/Cld053RUbQRay51RV52B4dNNPvh5M6K0oE9LtogP9309HzTGyNDfD65Z
         Fm3Y9VnMX7sLl0MytXQHC2w05h/HfkaELfBLJkh2FSfu+BRaxZ2dRpx6eXP33TsOg0gJ
         pQ7RZXVIDCg7wbvlZZmOWj7bUCVXNLKMCpM1CP/kVaGiytaiK6cYVu/0oEtMc9zLV6kc
         ZIC/n08WmpDBMBvIP8WLbnBO3RAB0Hd2ktu1pgtpOD2PCRMmqDHYZrWymDpdebEMdK/P
         yDYQKW9tSwyss7oWRjShhuRgke66Kj6RbH9nXIOkBNeJktjFv8C7kebjvc8zzPejvmEM
         fQNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9UxEcNSwKoN2mFJyfZRLVmjwVvQHZtyiCY9mygjt3b0=;
        b=djpiu/B0MY5m3XA2cwNDxsDWXMGx3szPF42puNMM0/JiNtELjjiXmcHBsCwHtPqF1q
         5tm9aQndZWK+CiuIHNs99L9mfh4lhCQSCupaLmhQcjx1PqbjGrzHE5iZw21HiQG8J2M/
         Jf2HUIHYzF8dFtO5fgycJ2jOaSliyl1fRg0TVcEX/qUvZgwq2cZO16509UVgAQ2goxok
         i50Rm9ZNNvxwV0EwXekc1S2xNXJIhQ/1K+piJ60VB4MyOFKwL5JBMgmoddxmym70semK
         tPQ2pDDOJ79uqxLsxJUItJRF05yXAqYxeIPpy/bxYdQdX2h3MohJDYVJ40aMf1fW5HBV
         CmOw==
X-Gm-Message-State: AOAM532oWAjWsl+pNcW+Zptz9f049JopwdogLd2NQ8KO2QQDV9jP5JCN
        2iz1FAjnfTkLufutYrtqb/ynJQ==
X-Google-Smtp-Source: ABdhPJx81QSenwwldv/3J3MLPwfG5VTKRajH0fC/WJKcz6OkMHMJkY3dRqn27AaWUvRHqQKD7PX9tw==
X-Received: by 2002:a05:6830:3185:: with SMTP id p5mr26271701ots.222.1639409685194;
        Mon, 13 Dec 2021 07:34:45 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a17sm2838627oiw.43.2021.12.13.07.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 07:34:44 -0800 (PST)
Date:   Mon, 13 Dec 2021 07:36:03 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     robh+dt@kernel.org, gregkh@linuxfoundation.org,
        devicetree@vger.kernel.org, ekangupt@qti.qualcomm.com,
        jeyr@codeaurora.org, bkumar@qti.qualcomm.com,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 8/8] arm64: dts: qcom: add non-secure domain property
 to fastrpc nodes
Message-ID: <YbdoY9PgvZO7AX1T@ripper>
References: <20211209120626.26373-1-srinivas.kandagatla@linaro.org>
 <20211209120626.26373-9-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211209120626.26373-9-srinivas.kandagatla@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 09 Dec 04:06 PST 2021, Srinivas Kandagatla wrote:

> From: Jeya R <jeyr@codeaurora.org>
> 
> FastRPC DSP domain would be set as secure if non-secure dsp property is not
> added to the fastrpc DT node. Add this property to DT files of msm8916,
> sdm845, sm8150, sm8250 and sm8350 so that nothing is broken after secure
> domain patchset.
> 
> This patch is purely for backward compatibility reasons.
> 
> Signed-off-by: Jeya R <jeyr@codeaurora.org>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8916.dtsi | 1 +
>  arch/arm64/boot/dts/qcom/sdm845.dtsi  | 2 ++
>  arch/arm64/boot/dts/qcom/sm8150.dtsi  | 3 +++
>  arch/arm64/boot/dts/qcom/sm8250.dtsi  | 3 +++
>  arch/arm64/boot/dts/qcom/sm8350.dtsi  | 3 +++
>  5 files changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index c1c42f26b61e..137a479449d4 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -1365,6 +1365,7 @@
>  					compatible = "qcom,fastrpc";
>  					qcom,smd-channels = "fastrpcsmd-apps-dsp";
>  					label = "adsp";
> +					qcom,non-secure-domain;

I was under the impression that the support for loading unsigned fastrpc
applications was introduced in SM8150 or SM8250, can you confirm that
this has been possible all along?

Regards,
Bjorn

>  
>  					#address-cells = <1>;
>  					#size-cells = <0>;
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 526087586ba4..4aebfed4ec00 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -838,6 +838,7 @@
>  				compatible = "qcom,fastrpc";
>  				qcom,glink-channels = "fastrpcglink-apps-dsp";
>  				label = "adsp";
> +				qcom,non-secure-domain;
>  				#address-cells = <1>;
>  				#size-cells = <0>;
>  
> @@ -888,6 +889,7 @@
>  				compatible = "qcom,fastrpc";
>  				qcom,glink-channels = "fastrpcglink-apps-dsp";
>  				label = "cdsp";
> +				qcom,non-secure-domain;
>  				#address-cells = <1>;
>  				#size-cells = <0>;
>  
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> index 81b4ff2cc4cd..9ac213bb96b7 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -1751,6 +1751,7 @@
>  					compatible = "qcom,fastrpc";
>  					qcom,glink-channels = "fastrpcglink-apps-dsp";
>  					label = "sdsp";
> +					qcom,non-secure-domain;
>  					#address-cells = <1>;
>  					#size-cells = <0>;
>  
> @@ -2994,6 +2995,7 @@
>  					compatible = "qcom,fastrpc";
>  					qcom,glink-channels = "fastrpcglink-apps-dsp";
>  					label = "cdsp";
> +					qcom,non-secure-domain;
>  					#address-cells = <1>;
>  					#size-cells = <0>;
>  
> @@ -3439,6 +3441,7 @@
>  					compatible = "qcom,fastrpc";
>  					qcom,glink-channels = "fastrpcglink-apps-dsp";
>  					label = "adsp";
> +					qcom,non-secure-domain;
>  					#address-cells = <1>;
>  					#size-cells = <0>;
>  
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index f0d342aa662d..06be221ad5b6 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -2265,6 +2265,7 @@
>  					compatible = "qcom,fastrpc";
>  					qcom,glink-channels = "fastrpcglink-apps-dsp";
>  					label = "sdsp";
> +					qcom,non-secure-domain;
>  					#address-cells = <1>;
>  					#size-cells = <0>;
>  
> @@ -2330,6 +2331,7 @@
>  					compatible = "qcom,fastrpc";
>  					qcom,glink-channels = "fastrpcglink-apps-dsp";
>  					label = "cdsp";
> +					qcom,non-secure-domain;
>  					#address-cells = <1>;
>  					#size-cells = <0>;
>  
> @@ -4100,6 +4102,7 @@
>  					compatible = "qcom,fastrpc";
>  					qcom,glink-channels = "fastrpcglink-apps-dsp";
>  					label = "adsp";
> +					qcom,non-secure-domain;
>  					#address-cells = <1>;
>  					#size-cells = <0>;
>  
> diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> index d134280e2939..80f753cbe91c 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> @@ -1278,6 +1278,7 @@
>  					compatible = "qcom,fastrpc";
>  					qcom,glink-channels = "fastrpcglink-apps-dsp";
>  					label = "sdsp";
> +					qcom,non-secure-domain;
>  					#address-cells = <1>;
>  					#size-cells = <0>;
>  
> @@ -1347,6 +1348,7 @@
>  					compatible = "qcom,fastrpc";
>  					qcom,glink-channels = "fastrpcglink-apps-dsp";
>  					label = "cdsp";
> +					qcom,non-secure-domain;
>  					#address-cells = <1>;
>  					#size-cells = <0>;
>  
> @@ -1643,6 +1645,7 @@
>  					compatible = "qcom,fastrpc";
>  					qcom,glink-channels = "fastrpcglink-apps-dsp";
>  					label = "adsp";
> +					qcom,non-secure-domain;
>  					#address-cells = <1>;
>  					#size-cells = <0>;
>  
> -- 
> 2.21.0
> 
