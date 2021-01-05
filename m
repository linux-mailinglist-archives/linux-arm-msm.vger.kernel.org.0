Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEC7B2EB26C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 19:23:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728287AbhAESVh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 13:21:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727939AbhAESVh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 13:21:37 -0500
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4648C061574
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jan 2021 10:20:56 -0800 (PST)
Received: by mail-ot1-x32e.google.com with SMTP id a109so610714otc.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jan 2021 10:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TgdQ9EPkmLTFUask62HEFvvOeT/vGfc0nzoqRnts06I=;
        b=Xab9Aq6RoPLxU3Ae4il8TBXX4uLNM5KWmF30Euzfbr3H4vcu6cQOgiRKeBhhBuiXYH
         gtQ++qaw+VoQakl9ak4DIClXOZMD5RFNV4kgk4NZ9/avIxm36ALgqy7MIopDXCyRGqzM
         c6SxgY25e2M8ELtr8L/MhQSIYHMgULnO/REqV7K+0YhYgPDDwrhNm2scdQAF8F9SWPSv
         GpRAqjkS4gcItFHAibSf9xeS6EgHSzbJ+B0lpYZSYGQzfckuVIum3xDwReZYp6ei4wdV
         iF4LigiNRUKMAI72z0kjDRC05549/6wLPw2JXrEccgepKptx4DVKHhWJn+aYWMpo/L4f
         pJUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TgdQ9EPkmLTFUask62HEFvvOeT/vGfc0nzoqRnts06I=;
        b=X392CLoXEhLSOwF9LSRZHUztg5wxanU89P2x6tGB/6riXfmTNXV9BaY8uUGQTbpsH9
         mwI1Wzly2r0mQw3Ad5yzRnmHRCdAbDDjxWsCEPESFzCpqFH6ytnjGRHyyTXk77OFIZGP
         puduOmcQy/hr/Ie5ztcXyBhrJ95bRklL+Xi1isjEEcEjw6n+mEEmOudQy3qmohPPV6+w
         Vhvw9+CL3ONYgFal1Ujn0fVVO2PxyHEBkcmSAqIu4/Na8Gxg/5nxQmFz3ABPHnam6Ner
         drqQbLps7mUJJb1dNUmwPmw9z6Ya33Qpj8lnjl2ia2CNZgDwNgg3NMKC02uEGRr4pFbn
         /O/Q==
X-Gm-Message-State: AOAM532cIFAQT4tpPkzlv7SufS1ipd5KxfrdjKZQYMa/I6lMdN676mOy
        fN1YW0RvUXkykWIKzDuk0R+WaM6v1kC6Jw==
X-Google-Smtp-Source: ABdhPJxYeJ9B3csY0clznLA36fy8LRstOGZ7CA9DyWp4RhdZYbx2ufcdMTfYtkSC31am6uHyGXKUJA==
X-Received: by 2002:a9d:3ef6:: with SMTP id b109mr571239otc.288.1609870856051;
        Tue, 05 Jan 2021 10:20:56 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t19sm71184otp.36.2021.01.05.10.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 10:20:55 -0800 (PST)
Date:   Tue, 5 Jan 2021 12:20:53 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 07/18] ARM: dts: qcom: sdx55: Add support for TCSR
 Mutex
Message-ID: <X/SuBbnHKmFyj5hY@builder.lan>
References: <20210105122649.13581-1-manivannan.sadhasivam@linaro.org>
 <20210105122649.13581-8-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210105122649.13581-8-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 05 Jan 06:26 CST 2021, Manivannan Sadhasivam wrote:

> Add TCSR Mutex node to support Qualcomm Hardware Mutex block on SDX55
> platform.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  arch/arm/boot/dts/qcom-sdx55.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom-sdx55.dtsi
> index 927f43a7414c..e48ec7a1971b 100644
> --- a/arch/arm/boot/dts/qcom-sdx55.dtsi
> +++ b/arch/arm/boot/dts/qcom-sdx55.dtsi
> @@ -166,6 +166,17 @@ sdhc_1: sdhci@8804000 {
>  			status = "disabled";
>  		};
>  
> +		tcsr_mutex_block: syscon@1f40000 {
> +			compatible = "syscon";

It was recently determined that simply "syscon" isn't a valid
compatible.

> +			reg = <0x1f40000 0x20000>;
> +		};
> +
> +		tcsr_mutex: hwlock {
> +			compatible = "qcom,tcsr-mutex";

And in some platforms the tcsr_mutex_block seems to be single use
anyways, so I rewrote this binding a while ago.

So, this will still work in Linux, please update the patch to match the
new binding
(Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml)

Thanks,
Bjorn

> +			syscon = <&tcsr_mutex_block 0 0x1000>;
> +			#hwlock-cells = <1>;
> +		};
> +
>  		pdc: interrupt-controller@b210000 {
>  			compatible = "qcom,sdx55-pdc", "qcom,pdc";
>  			reg = <0x0b210000 0x30000>;
> -- 
> 2.25.1
> 
