Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95A6D206851
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2020 01:25:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387491AbgFWXZQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jun 2020 19:25:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388310AbgFWXZJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jun 2020 19:25:09 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77DECC061795
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2020 16:25:09 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id l63so340706pge.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2020 16:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=O693aBUZA0/02GeteSwkznapNiqCdk4fR4JfhAjgavc=;
        b=E7GeDhstIFhfU6UMSXEXnw12+uANnkkg6BPkJQ1DeVXe/HPH78nR/zlVv4a9+C4z/3
         iFsAk0aky/OE/pjiWRSP9ml8X35XD3eQ/ZEAxJ/LFBrtV420T/R6QHdwKVt1XIACJ7hb
         n7SFRrWjS3pvX2sVcqmg+/myPCMlW/kXNEFes6RqGMpQW3MFSvLSiOxXZCFoaTzI0Mzq
         v8B7MiLSZ0cgU2BM7H35D7ac16DBSl6nKNLWbCahFh9Iq2tK35UWMgUUAwaKNXuqqfsJ
         Qdb2MC+KdIpp9aUy9qqq55CwnOT5LGVeU5v4Sq4lYKUIpHJ4WRw4Lu5qWfHIUMkMpDUX
         CWiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=O693aBUZA0/02GeteSwkznapNiqCdk4fR4JfhAjgavc=;
        b=M4p5mzVnd06qkwqLZt+/DVi5e+s0UfHV18ejCg1kV2L8LAieAb2D6mn/U6//P+d/mm
         RaNt+TIOCT1TipuXG/sJXMDur9TAiJMDWlSb6BCHniTMbVVjQZ5MAX+XO9qwMjixkPzi
         ZSy6/b6AWdfOeJzYzoZijfOZip2SL9ad1l0QwpjXnoTCrjHbqzlTppHcOj7AyU/M4/wB
         J/ZzCWrBhlZ6QUpznfvu6rIqKjIm3gKmeyN6fJnSsaMeMaF7WEZ1M7nn2itU6rtoRURb
         fqUjhFgIu6VgOA2fXN760tRQE454x1FYYkzN9nsrXspL4ortFdM6h2bsc9Q9j7Wxhsk4
         1l8A==
X-Gm-Message-State: AOAM530LQF27PGj8Xe+h9dxYhViVbbL5EOcXfDfhf8jStohsqrOAI0Sq
        VPzbAqTM0HHE/5VFUOGmn1JwpA==
X-Google-Smtp-Source: ABdhPJxrhbnAFdFw9+anuE/yWe/CReucVHYYbY2Ub9iSuabkIhcI+U3Lx0tcNQdgrhacKhQjcgUS+w==
X-Received: by 2002:aa7:96af:: with SMTP id g15mr27462110pfk.75.1592954708697;
        Tue, 23 Jun 2020 16:25:08 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id w124sm17656423pfc.213.2020.06.23.16.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 16:25:08 -0700 (PDT)
Date:   Tue, 23 Jun 2020 16:22:25 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     skrzynka@konradybcio.pl, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/12] arm64: dts: qcom: msm8994: Add PSCI node
Message-ID: <20200623232225.GO128451@builder.lan>
References: <20200623224813.297077-1-konradybcio@gmail.com>
 <20200623224813.297077-10-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200623224813.297077-10-konradybcio@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 23 Jun 15:48 PDT 2020, Konrad Dybcio wrote:

> Add PSCI node to enable multi-processor startup.
> 
> Note that not every 8994 device firmware supports PSCI,
> and even if, then it can only start the cores and not
> shut them down.
> 
> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>

Applied, thanks.

> ---
>  arch/arm64/boot/dts/qcom/msm8994.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
> index b3c01ebc5c67..9eec8ab6bf2c 100644
> --- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
> @@ -159,6 +159,11 @@ pmu {
>  		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4)| IRQ_TYPE_LEVEL_HIGH)>;
>  	};
>  
> +	psci {
> +		compatible = "arm,psci-0.2";
> +		method = "hvc";
> +	};
> +
>  	reserved-memory {
>  		#address-cells = <2>;
>  		#size-cells = <2>;
> -- 
> 2.27.0
> 
