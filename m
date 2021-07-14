Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BFDA3C927A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jul 2021 22:50:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230372AbhGNUxI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jul 2021 16:53:08 -0400
Received: from mail-il1-f182.google.com ([209.85.166.182]:34622 "EHLO
        mail-il1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbhGNUxI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jul 2021 16:53:08 -0400
Received: by mail-il1-f182.google.com with SMTP id e13so2945002ilc.1;
        Wed, 14 Jul 2021 13:50:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xCdS+pd+oqZTwY0QnXLhGz1dPTl4CKLKedkVikROQ+g=;
        b=euhY2eQ48gYp5GLwKrmCms+miTMy6+RlzBIKz6ro822t600M+AMqer3o4yQXjH8Mka
         /g6XsoDEQAX/g5zQC+CY7wRBeMajvHWxt3nL5vjqJzNamzyvCR15rinGM53dNglRJqg1
         SvBAGmaZv3/F7jpdg68iloMQg30+AcskdE2LVDFKfFraEakCdPVDtn2uQrgkDwgYm/DD
         m8xJI/16DXcr2Lhx8BNllWB6LslJFvhmIsDO7+ZyGwEW9fyTExQfEwPVYIjy7wuLiL++
         JebgKe4t5+1SluoWgesWKPt2syw3NT2xvLi/WpbtOhUCt/n1MqJWFReNeG64lI54mcLa
         Xpug==
X-Gm-Message-State: AOAM5322KrQPXjDtJY1dKc3UIc/vXGiNFbvhNUbB8w9Iekkw6zrG4+cr
        ZRtTxin5vq0H/tGbtZY+eg==
X-Google-Smtp-Source: ABdhPJxQwGvMEkFYajAJUIyivfiRf7BlgQI3ce+ysj6h13I0Ly7h/3FYfSec4W4fxYcV8fuR9aMgdw==
X-Received: by 2002:a92:1802:: with SMTP id 2mr7422891ily.139.1626295816188;
        Wed, 14 Jul 2021 13:50:16 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id m24sm1834459ion.3.2021.07.14.13.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 13:50:15 -0700 (PDT)
Received: (nullmailer pid 3497655 invoked by uid 1000);
        Wed, 14 Jul 2021 20:50:13 -0000
Date:   Wed, 14 Jul 2021 14:50:13 -0600
From:   Rob Herring <robh@kernel.org>
To:     Iskren Chernev <iskren.chernev@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 2/5] dt-bindings: clock: qcom: rpmcc: Document SM6115
 compatible
Message-ID: <20210714205013.GA3493680@robh.at.kernel.org>
References: <20210627185927.695411-1-iskren.chernev@gmail.com>
 <20210627185927.695411-3-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210627185927.695411-3-iskren.chernev@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Jun 27, 2021 at 09:59:24PM +0300, Iskren Chernev wrote:
> Add the dt-binding for the RPM Clock Controller on the SM4250/6115 SoCs.
> 
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmcc.txt |  1 +
>  include/dt-bindings/clock/qcom,rpmcc.h                 | 10 ++++++++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
> index 6cf5a7ec2b4c..0045583f02b5 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
> +++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
> @@ -25,6 +25,7 @@ Required properties :
>  			"qcom,rpmcc-msm8998", "qcom,rpmcc"
>  			"qcom,rpmcc-qcs404", "qcom,rpmcc"
>  			"qcom,rpmcc-sdm660", "qcom,rpmcc"
> +			"qcom,rpmcc-sm6115", "qcom,rpmcc"

This is going to conflict with sm6125 addition...

>  
>  - #clock-cells : shall contain 1
>  
> diff --git a/include/dt-bindings/clock/qcom,rpmcc.h b/include/dt-bindings/clock/qcom,rpmcc.h
> index 8aaba7cd9589..aa834d516234 100644
> --- a/include/dt-bindings/clock/qcom,rpmcc.h
> +++ b/include/dt-bindings/clock/qcom,rpmcc.h
> @@ -149,5 +149,15 @@
>  #define RPM_SMD_CE2_A_CLK			103
>  #define RPM_SMD_CE3_CLK				104
>  #define RPM_SMD_CE3_A_CLK			105
> +#define RPM_SMD_QUP_CLK				106
> +#define RPM_SMD_QUP_A_CLK			107
> +#define RPM_SMD_MMRT_CLK			108
> +#define RPM_SMD_MMRT_A_CLK			109
> +#define RPM_SMD_MMNRT_CLK			110
> +#define RPM_SMD_MMNRT_A_CLK			111
> +#define RPM_SMD_SNOC_PERIPH_CLK			112
> +#define RPM_SMD_SNOC_PERIPH_A_CLK		113
> +#define RPM_SMD_SNOC_LPASS_CLK			114
> +#define RPM_SMD_SNOC_LPASS_A_CLK		115
>  
>  #endif
> -- 
> 2.32.0
> 
> 
