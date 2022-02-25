Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FEA84C3EF1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Feb 2022 08:25:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238101AbiBYH0H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Feb 2022 02:26:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238033AbiBYH0F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Feb 2022 02:26:05 -0500
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD8BF252926
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Feb 2022 23:25:33 -0800 (PST)
Received: by mail-pf1-x432.google.com with SMTP id z15so3992458pfe.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Feb 2022 23:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=69Gf58wBq8Dh5eVfCBlMrle4NsrKmADuIFSdP7YDRTM=;
        b=HeUyM6GBC3LnvDkWZI8Y9sGWlt+M3w0qOxargDS/ayD5Xl9zvIa0AYM5xt5cE8eZy9
         xgwaMQ3IzfsIhBTk/vf3UQKYP8m7bQxJyJA8Lwu3swAH8uTx3LZwFIuh0CNRhN4dFhG1
         hxGUaXWs0EwwflcOkQmPFL7R3gRT/ZEcc0Oed1YwrTDJtqpb5CVDQcjQiQlgea8Z5X1I
         7ZIJULHxE78fNfBqi/vQL7h2BZ83lqj29QBwNJcy0gx/ztzI8I37beo4+qSbCJ49pCzJ
         dH/u+yqlhhDN02XIqm6ml6FG0NEmUP4Hxk+QeBxNxXmfnAuTFt9EWoq1Yzqt2qgfiSVg
         ytmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=69Gf58wBq8Dh5eVfCBlMrle4NsrKmADuIFSdP7YDRTM=;
        b=aM4lY1Ipy9cItVPLu7lNN5FXV9mCQKzli7AennyCLJMk6YjfxrJvtUYZWgJ16D2uBP
         34XOsKCuNXjWIdlWYnsu1A3rU/gyvY8fgimv33cTZGo9T/Lfxam5v5yrkdtu/MfqFBwY
         8UIoHFuT1oaya6aNf7lvFm2bCzYp9yjWt+OxczYafLc7e0f9op04Hw9NkxgE12NLvvl1
         iD69i/jlC3lx3GhHkShQDMMlE9lmYqQu7ws7YOzAhbNOzyTrP1pHncmd1GrBZ4v/A6u2
         45fv7DC8RcuejWpsTlL46OQSlWLHx6Nucp5mErY9esEWySLYiigq1haR6I7aMuc5SRRB
         MYiQ==
X-Gm-Message-State: AOAM5333SnzP61or8H/ZmtJaNmVoQyH+YtJBwAvXKcdbbQurDAWYIm49
        weT6QS4uyMWxK2GN34Vzcsww
X-Google-Smtp-Source: ABdhPJzZQ6FY+KsBp8kvwfgEP4p390Va71pEf3cz8HAhmjyLk7qZ++KEF44vyE2iv5QmQgfFK+1X0A==
X-Received: by 2002:a63:d443:0:b0:364:51b7:c398 with SMTP id i3-20020a63d443000000b0036451b7c398mr5155662pgj.511.1645773933286;
        Thu, 24 Feb 2022 23:25:33 -0800 (PST)
Received: from thinkpad ([220.158.159.240])
        by smtp.gmail.com with ESMTPSA id l13-20020a056a00140d00b004e13da93eaasm2065900pfu.62.2022.02.24.23.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 23:25:32 -0800 (PST)
Date:   Fri, 25 Feb 2022 12:55:27 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/5] dt-bindings: clock: Add A7 PLL binding for SDX65
Message-ID: <20220225072527.GA274289@thinkpad>
References: <1645505785-2271-1-git-send-email-quic_rohiagar@quicinc.com>
 <1645505785-2271-2-git-send-email-quic_rohiagar@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1645505785-2271-2-git-send-email-quic_rohiagar@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Feb 22, 2022 at 10:26:21AM +0530, Rohit Agarwal wrote:
> Add information for Cortex A7 PLL clock in Qualcomm
> platform SDX65.
> 
> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  Documentation/devicetree/bindings/clock/qcom,a7pll.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,a7pll.yaml b/Documentation/devicetree/bindings/clock/qcom,a7pll.yaml
> index 8666e99..0e96f69 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,a7pll.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,a7pll.yaml
> @@ -10,7 +10,7 @@ maintainers:
>    - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>  
>  description:
> -  The A7 PLL on the Qualcomm platforms like SDX55 is used to provide high
> +  The A7 PLL on the Qualcomm platforms like SDX55, SDX65 is used to provide high
>    frequency clock to the CPU.
>  
>  properties:
> -- 
> 2.7.4
> 
