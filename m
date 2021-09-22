Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45D2141534B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Sep 2021 00:21:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238285AbhIVWXI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Sep 2021 18:23:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238267AbhIVWXH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Sep 2021 18:23:07 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73CFDC061756
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Sep 2021 15:21:37 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id o59-20020a9d2241000000b0054745f28c69so3704616ota.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Sep 2021 15:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ja8P90alKcm52QaXgYnZ7BUhTvF9+wlJdRipgZdGOFs=;
        b=qXlLg/WhVNjulQbruujZv3u/T4ld2T05DqpToIjWGKKfvv648ujXO7p+uMwJMMFF+L
         YsJhDXEkNmnZlDr5SjO2pMq0gJl232wf7uuFDFAAUExaDd85+rtW4weT+EF16ynqdgwb
         Gh0e3t3aANroNpqcZ+YOgKdAjfp86Q0IyAeO6+mq73PXz6K8XkGM0eDTUhXXDQ6+caWn
         n1031/+sIrX1nX9Rl6bpKNnfaYlbeoJVL8Z0ZBtb1SJVRFO+HvvDIaxeB4MV8cTDsgdY
         ffYwBavJxglLknxKm4RBpzkCidjv7Zh7xhNN7Cjd8YTCnwXasXq9GMVhtiLRRQNVbM/9
         04RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ja8P90alKcm52QaXgYnZ7BUhTvF9+wlJdRipgZdGOFs=;
        b=4hQxIbKMxGDKqYueSc/+HEm7PunpEQiOTrb0cua065WDyOekkv9NmDAgm2pQ6o2JBq
         DTtlx+vEWfAzkxMQnK1PNQ9mFSy+cv6dJGMovxszALOxMLLCntpz6iQQ2MPXgpL4zG1q
         Xa46PE5d2Xb50t3iUy44GRTZ/WHsfodrPi+4YDvQAC0ngL9o1Z1+rLFb2gFX9uKKUuxN
         SMyDO6x/NZ13XWfdZg8ZJZQkoY5rAotX4moXrspVt/mt2T+u0izb9ii97ceCQHvTefBZ
         ojrOGb0Njk5AC9+HLERVEZW8UDQ1PSv9mHAdwbbPZRAvWIPSQjDtQto/DUNSTQ6z1pCs
         roHQ==
X-Gm-Message-State: AOAM532veRBOTe1JAhKk68Pd82g5HzCn77PLuFTaOu429Bbz/C1O4k96
        6vsV42mexZGFrg6KQwqJnF7nLA==
X-Google-Smtp-Source: ABdhPJyGcQhkV7NXta9iszKaO2uuSspl7b8wttS3JuAmLIML3dBy6x4KVyfDxfpOJuK7e8mzTtlABQ==
X-Received: by 2002:a9d:6752:: with SMTP id w18mr1334818otm.117.1632349296814;
        Wed, 22 Sep 2021 15:21:36 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id v29sm887582ooe.31.2021.09.22.15.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 15:21:36 -0700 (PDT)
Date:   Wed, 22 Sep 2021 17:21:34 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: clk: qcom,rpmcc: Document QCM2290
 compatible
Message-ID: <YUusbv901tngxsoz@builder.lan>
References: <20210917030434.19859-1-shawn.guo@linaro.org>
 <20210917030434.19859-3-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210917030434.19859-3-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 16 Sep 22:04 CDT 2021, Shawn Guo wrote:

> Add compatible for the RPM Clock Controller on the QCM2290 SoC.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmcc.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
> index a4877881f1d8..da295c3c004b 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
> +++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
> @@ -25,6 +25,7 @@ Required properties :
>  			"qcom,rpmcc-msm8994",·"qcom,rpmcc"
>  			"qcom,rpmcc-msm8996", "qcom,rpmcc"
>  			"qcom,rpmcc-msm8998", "qcom,rpmcc"
> +			"qcom,rpmcc-qcm2290", "qcom,rpmcc"
>  			"qcom,rpmcc-qcs404", "qcom,rpmcc"
>  			"qcom,rpmcc-sdm660", "qcom,rpmcc"
>  			"qcom,rpmcc-sm6115", "qcom,rpmcc"
> -- 
> 2.17.1
> 
