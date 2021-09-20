Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AF83410E8B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Sep 2021 04:52:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233966AbhITCxx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 19 Sep 2021 22:53:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233773AbhITCxx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 19 Sep 2021 22:53:53 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E80EC061764
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Sep 2021 19:52:27 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id u22so14595604oie.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Sep 2021 19:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hqgjeEmiczW8tyKT8Sr0WXeHexE/OvbKNC0oLWg2H/4=;
        b=Whbs1pdjrgldXPCC3E9xYht+gLTTfEO6F/KlkdIHFWPDytj3dnYd1Youe6zJx0abCl
         KjuM3AYBDO8YiphKuMA95nKlVpl5DxPN4c8ZrGVPaYy8VdjHFqT1kmHZWMncO4PGx+09
         T9GMJzsVbhsjnt4lOoUzy684h+u9/Jd1xccQXr0SJfBN8+QDRwDdLC8N0lfh4BySy1CJ
         cXfn/ozRipIvoaZwMzgzdn00wr/rA8s98KhoxKDD+7G/7iI2dvdSGFXNi3j2ZRlWh68d
         NiFbP4lRzY7nnWliysPDPD/609sfrMwgjMCvMefn9azq5mGwrhss8TEFwbzZXVCROTc8
         DjbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hqgjeEmiczW8tyKT8Sr0WXeHexE/OvbKNC0oLWg2H/4=;
        b=1RsBs/M5VfzXqgXrkk+fp5ya1lpUI+VL+DwI1xMCpkuNB4NBjRIJwQTd82OPQJ24f3
         +K02cGSdedvFBQLIKZ+ltUu+ErbFPrvACXLqXRST6htNUmG+89QY/9zIWJx0zwy/Xsq3
         XlaCwWemh/nclpf0f61RJqzdFs/4XhFRWRQ5/qy37e/g+z6akxFvwOIszFPzWeTosOfd
         4aJJbzCqd1trpZt/7UVYKsjCFJIlu32R0xeNZ410fyS+N6HXbCMKwYAcKWsPeRx1CroI
         ymdj4BCv2lOublSaLF5+clbXj9n5UbkAlBMCX0IIAA7PSeAmwz/CqDuyDj4R8zEXrug6
         PaMw==
X-Gm-Message-State: AOAM530NDPtnhxQ68/95fEKDzjpIQPzUtvVCieacnmiZ1h4eKzrMjhPP
        eHVTafqaaQtJqW+17IdeTyA79A==
X-Google-Smtp-Source: ABdhPJz+vQStpjHcJb+3SHr7KTaxn/yVv5tliVD+7gAyws+d8yNzvDFL8bsHY1dBoCmL1e0tFUIvIA==
X-Received: by 2002:a05:6808:2026:: with SMTP id q38mr11668804oiw.15.1632106346279;
        Sun, 19 Sep 2021 19:52:26 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id l19sm419390otj.77.2021.09.19.19.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Sep 2021 19:52:25 -0700 (PDT)
Date:   Sun, 19 Sep 2021 21:52:24 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Robert Marko <robimarko@gmail.com>
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: ipq8074: add SMEM support
Message-ID: <YUf3aKn78+41Cb/G@builder.lan>
References: <20210902214708.1776690-1-robimarko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210902214708.1776690-1-robimarko@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 02 Sep 16:47 CDT 2021, Robert Marko wrote:

> IPQ8074 uses SMEM like other modern QCA SoC-s, so since its already
> supported by the kernel add the required DT nodes.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>

Thanks for your patch Robert.

> ---
>  arch/arm64/boot/dts/qcom/ipq8074.dtsi | 28 +++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> index a620ac0d0b19..83e9243046aa 100644
> --- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> @@ -82,6 +82,29 @@ scm {
>  		};
>  	};
>  
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		smem_region: memory@4ab00000 {
> +			no-map;
> +			reg = <0x0 0x4ab00000 0x0 0x00100000>;
> +		};
> +	};
> +
> +	tcsr_mutex: hwlock {
> +		compatible = "qcom,tcsr-mutex";
> +		syscon = <&tcsr_mutex_regs 0 0x80>;

Since it's not okay to have a lone "syscon" and I didn't think it was
worth coming up with a binding for the TCSR mutex "syscon" I rewrote the
binding a while back. As such qcom,tcsr-mutex should now live in /soc
directly.

So can you please respin accordingly?

Thanks,
Bjorn

> +		#hwlock-cells = <1>;
> +	};
> +
> +	smem {
> +		compatible = "qcom,smem";
> +		memory-region = <&smem_region>;
> +		hwlocks = <&tcsr_mutex 0>;
> +	};
> +
>  	soc: soc {
>  		#address-cells = <0x1>;
>  		#size-cells = <0x1>;
> @@ -293,6 +316,11 @@ gcc: gcc@1800000 {
>  			#reset-cells = <0x1>;
>  		};
>  
> +		tcsr_mutex_regs: syscon@1905000 {
> +			compatible = "syscon";
> +			reg = <0x01905000 0x8000>;
> +		};
> +
>  		sdhc_1: sdhci@7824900 {
>  			compatible = "qcom,sdhci-msm-v4";
>  			reg = <0x7824900 0x500>, <0x7824000 0x800>;
> -- 
> 2.31.1
> 
