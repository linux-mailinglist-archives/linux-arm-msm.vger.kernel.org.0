Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8C231CEA37
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2020 03:45:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728452AbgELBpP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 May 2020 21:45:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726415AbgELBpP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 May 2020 21:45:15 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A438C061A0E
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 18:45:15 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id x2so5595801pfx.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 18:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EzSvlPNDgC8QL7k10YiJ3iEGWBUqaT/TcSlvZ5anIbI=;
        b=Z1GpKQFF7AJRwxu45DBLZusPUf9VrAZH9t36YQCR9/bdtM/LwWvR0hmpxb5eChwkxr
         ZYPpknWrHs4x0/fy/4PVbHVu12DzYD8T0uT6V7WT6w+nvKNM1MFUgKiBJ/Il4FkqjlCX
         9vHCpt6s1AFL5sEcyRKUONVy8e4zPif8so9I5Y2YSsVKojAOlhM4maBJvqvSy3ZUR5t5
         2jPEFETY8XL3FR6C+5gG01ynTgmOSLxKlzO9B0s8PcKEm+s9ZS69yY+VN6DytgTF01NA
         fCmovQ5o9DCOOJGJl8r7+EGAGOhFtKmdk/yWM3TqrgMUm+yRyAPsqmUWgrjKJgMAlGfW
         Rweg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EzSvlPNDgC8QL7k10YiJ3iEGWBUqaT/TcSlvZ5anIbI=;
        b=lHWViFnEG0xITe19dizWgDXbOg+NZP71gm6zPNvKMTnpPS7DY1gcUNxD2x3S0FYYaS
         rN21e3Yz5mXp5oaihTy82NDfykBVX8Zz5a5SjiHDpU7VGUciQfbbfKjZJFLHkikFcyeE
         f8bFz4bv6Xdv9nucJIt/h1FcHCVxMEy9NUyT5DL25FTnSQoa4YjkEIgsALKAMLeLRP9Z
         F4snSOtZgy5QubdbtGbhJ01ParTyj23I/7s45O7PZWqoqzlXynpFp4gNdkj241+nDg1R
         iOc8BvoBrfUrwsWbzQvxQModT9v+pw13WXYoZhNWNRbnw+vUcJIwsd5aFaTsanXmKUyl
         y/Ig==
X-Gm-Message-State: AGi0PuYKLGDZLxgYJDp9+K+hbnzJJu6TFZ+KJ2WrzonIbB6wq0vzhSAc
        RZJy6LxXouxHTYFLKMHT2VabYw==
X-Google-Smtp-Source: APiQypJsZ7ZIXhfW5xJ/S5w9zLmhRM6eJ1H7SWozJ4hVlmFcnAYBLrV/n7xK+cO90AVmYEBQp8f+Mw==
X-Received: by 2002:aa7:9802:: with SMTP id e2mr18728502pfl.213.1589247913730;
        Mon, 11 May 2020 18:45:13 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id z66sm520869pfz.141.2020.05.11.18.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 18:45:13 -0700 (PDT)
Date:   Mon, 11 May 2020 18:43:39 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sumit Semwal <sumit.semwal@linaro.org>
Cc:     agross@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        robh+dt@kernel.org, nishakumari@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org,
        rnayak@codeaurora.org
Subject: Re: [v2 1/4] dt-bindings: regulator: Add labibb regulator
Message-ID: <20200512014339.GE57962@builder.lan>
References: <20200508204200.13481-1-sumit.semwal@linaro.org>
 <20200508204200.13481-2-sumit.semwal@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200508204200.13481-2-sumit.semwal@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 08 May 13:41 PDT 2020, Sumit Semwal wrote:

> From: Nisha Kumari <nishakumari@codeaurora.org>
> 
> Adding the devicetree binding for labibb regulator.
> 
> Signed-off-by: Nisha Kumari <nishakumari@codeaurora.org>
> Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>

Sorry, I missed this when we talked about it. But please rewrite this in
yaml.

> 
> --
> v2: updated for better compatible string and names.
> ---
>  .../regulator/qcom-labibb-regulator.txt       | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.txt
> 
> diff --git a/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.txt b/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.txt
> new file mode 100644
> index 000000000000..6e639d69f780
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.txt
> @@ -0,0 +1,47 @@
> +Qualcomm's LAB(LCD AMOLED Boost)/IBB(Inverting Buck Boost) Regulator
> +
> +LAB can be used as a positive boost power supply and IBB can be used as a negative
> +boost power supply for display panels. Currently implemented for pmi8998.
> +
> +Main node required properties:
> +
> +- compatible:			Must be:
> +				"qcom,pmi8998-lab-ibb"
> +- #address-cells:		Must be 1
> +- #size-cells:			Must be 0

But the children doesn't have reg properties...

> +
> +LAB subnode required properties:
> +
> +- interrupts:			Specify the interrupts as per the interrupt
> +				encoding.
> +- interrupt-names:		Interrupt names to match up 1-to-1 with
> +				the interrupts specified in 'interrupts'
> +				property.

Do specify the expected string (and given that you already have the
lab & ibb subnodes, you don't need to include this in the string).

Regards,
Bjorn

> +
> +IBB subnode required properties:
> +
> +- interrupts:			Specify the interrupts as per the interrupt
> +				encoding.
> +- interrupt-names:		Interrupt names to match up 1-to-1 with
> +				the interrupts specified in 'interrupts'
> +				property.
> +
> +Example:
> +	pmi8998_lsid1: pmic@3 {
> +		labibb {
> +			compatible = "qcom,pmi8998-lab-ibb";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			lab: lab {
> +				interrupts = <0x3 0xde 0x0 IRQ_TYPE_EDGE_RISING>;
> +				interrupt-names = "lab-sc-err";
> +			};
> +
> +			ibb: ibb {
> +				interrupts = <0x3 0xdc 0x2 IRQ_TYPE_EDGE_RISING>;
> +				interrupt-names = "ibb-sc-err";
> +			};
> +
> +		};
> +	};
> -- 
> 2.26.2
> 
