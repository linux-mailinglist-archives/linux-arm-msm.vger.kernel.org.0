Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B61C347EF5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Mar 2021 18:12:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236994AbhCXRLp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Mar 2021 13:11:45 -0400
Received: from mail-io1-f53.google.com ([209.85.166.53]:33305 "EHLO
        mail-io1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237135AbhCXRLV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Mar 2021 13:11:21 -0400
Received: by mail-io1-f53.google.com with SMTP id n198so22297165iod.0;
        Wed, 24 Mar 2021 10:11:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FVfgfmrfEXgvH/xwoowikLdiOAgX7H/asfVmfp1otcU=;
        b=RUswf6je9Q3xi3vyYe+BPwYrzvXW7RnvrP9kcrNJo5I5L3o3IO4c+9KVaa3CkqCySD
         cX/paiAPQ1NSIqnhiiRvn6+8LjyEyQIr6kUDa/0/6SjxeeDETVsZb8jpyDZK+1EgeTh0
         E5n5YDdEHLusidEHfNKAob0pvJMwCbwunCNR2teF92NaK41VGDSe8bBmewBOn/CE3yHO
         nLtWky9xE4Nt6hITLpvRgcaNfdERCeo8L4488482U6axw3VdoGh/K6/l2BVtkk2sE60F
         F3HvCWtfI5KjntNb3fSQc4SsoUViLG0p1MBF1FeIjUWuqA3hE5/h+WPHjhtKRF2ZVa1T
         Glgw==
X-Gm-Message-State: AOAM532J9sgfqjpWv6qnxpYrP0VD5SF9JFq6DhgcSt1wWz7QWaw1GPpk
        J2OBfyWnSIMom0XJQG5SVg==
X-Google-Smtp-Source: ABdhPJwEjE7OvTWRIBZQ7oG8M8g0qKgsn0b01EQMIaQ7s0S9RO5YPjjGmsq3cie5wi/4K3Easg0W7Q==
X-Received: by 2002:a05:6638:2a3:: with SMTP id d3mr3958018jaq.42.1616605880340;
        Wed, 24 Mar 2021 10:11:20 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id 18sm1351781ilj.59.2021.03.24.10.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 10:11:19 -0700 (PDT)
Received: (nullmailer pid 3262398 invoked by uid 1000);
        Wed, 24 Mar 2021 17:11:17 -0000
Date:   Wed, 24 Mar 2021 11:11:17 -0600
From:   Rob Herring <robh@kernel.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 9/9] clk: qcom: gcc-msm8994: Add a quirk for a different
 SDCC configuration
Message-ID: <20210324171117.GA3260515@robh.at.kernel.org>
References: <20210313021919.435332-1-konrad.dybcio@somainline.org>
 <20210313021919.435332-9-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210313021919.435332-9-konrad.dybcio@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Mar 13, 2021 at 03:19:18AM +0100, Konrad Dybcio wrote:
> Some devices come with a different SDCC clock configuration,
> account for that.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  .../bindings/clock/qcom,gcc-msm8994.yaml         |  4 ++++
>  drivers/clk/qcom/gcc-msm8994.c                   | 16 ++++++++++++++++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml
> index f8067fb1bbd6..9db0800a4ee4 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml
> @@ -49,6 +49,10 @@ properties:
>      description:
>        Protected clock specifier list as per common clock binding.
>  
> +  qcom,sdcc2-clk-src-40mhz:
> +    description: SDCC2_APPS clock source runs at 40MHz.
> +    type: boolean

Why don't you have some input clock you can get the rate from?

> +
>  required:
>    - compatible
>    - reg
