Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 121E84D9FA3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Mar 2022 17:09:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238095AbiCOQKt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Mar 2022 12:10:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241387AbiCOQKq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Mar 2022 12:10:46 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD5974338C
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Mar 2022 09:09:34 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id o20-20020a9d7194000000b005cb20cf4f1bso50507otj.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Mar 2022 09:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FSKsjh6tlY83BKe3eff069HucMWdRlY6fuyM/Q6C3TE=;
        b=s/z/fAyYr7fl/NxStJ0DOkxbJBO5YREjsOZCIJg2MkVW5YNrj0YtJO2qu3LAIUbjQe
         w8eyu1I0GYr2PHtoAC6ERGvuJaDpiGkr1yMN4BecvRSx/ZebwTfBRh9UktA5y+vBdZlc
         hxpznvlWjW5u7ggYI+usFEow8dUcB+wxoTBJYXd2sMrPOjRWj4APKjAFWkdhOZSEVqkx
         OU82U7McW6/PrErEgTKRiUuTnzyjF+5TxDoVVfBwxHVdCAvn7vtlQBwM7v5WOPVnVGop
         1mLj1r4xORy5JHFBvV2GAxaTx646pjp+4HVccHh/PCYTccy+P+mX4vgK0/ScwCoTQIrC
         Q8Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FSKsjh6tlY83BKe3eff069HucMWdRlY6fuyM/Q6C3TE=;
        b=2rXYLCVNz1OL+x9k2nAyhlykWCiT9OIgEbIr2GL9pQG3rn68ZLcC9VBHEhxRUSBxhk
         O+/SF4qlTFs6VbLqWXt23X6H1C3MWdFAryBlMlwME6EUgrOF4bPoco7BFzKp2vUJEi6A
         Wpy+LtxB5BL35xYEe8OJ7VjTeObgMkfG1nDQq+b83mKC7yeBjJ18kBUPW706PaFQruFV
         Tgs54m07iWqQXpLouuLQ/VGfA32Mw44C6if6DWeXhi0shUuZoyRgvtIt6FsCQs+rUTXF
         Tb4kr4VZ2CP3QgC87brz+pWWX2iiSZYL6xJwtqlQd41s9colFI+Y7fKek8+jHWlx7gBC
         gE5A==
X-Gm-Message-State: AOAM530OuB6kDnhmyEqeHUQmgLcOT92E9PyODDdVon97KdlWLBxsMd7o
        Yk3+WPVdUr6zAkhogeDdObVu8g==
X-Google-Smtp-Source: ABdhPJyYrVxAz6LrDABB0+jQOFQfR8/DmFdUbSP0Em05+RNYEaZX3yLBI/V600XgT3mcQBRRknPcDA==
X-Received: by 2002:a9d:1729:0:b0:5b2:3828:c84c with SMTP id i41-20020a9d1729000000b005b23828c84cmr13359647ota.362.1647360574205;
        Tue, 15 Mar 2022 09:09:34 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id z192-20020a4a49c9000000b003213bf4bf0csm8966672ooa.31.2022.03.15.09.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 09:09:33 -0700 (PDT)
Date:   Tue, 15 Mar 2022 11:09:31 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, bhupesh.linux@gmail.com,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, maz@kernel.org,
        quic_mkshah@quicinc.com, linux-gpio@vger.kernel.org,
        linus.walleij@linaro.org, robh+dt@kernel.org,
        Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: qcom,pdc: Add compatible for SM8150
Message-ID: <YjC6O5phACatGyL1@builder.lan>
References: <20220226184028.111566-1-bhupesh.sharma@linaro.org>
 <20220226184028.111566-2-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220226184028.111566-2-bhupesh.sharma@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat 26 Feb 12:40 CST 2022, Bhupesh Sharma wrote:

> Add the compatible string for SM8150 SoC from Qualcomm.
> 
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Marc Zyngier <maz@kernel.org>
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  .../devicetree/bindings/interrupt-controller/qcom,pdc.txt        | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
> index 98d89e53013d..bd3539644d3f 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
> +++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
> @@ -21,6 +21,7 @@ Properties:
>  		    - "qcom,sc7180-pdc": For SC7180
>  		    - "qcom,sc7280-pdc": For SC7280
>  		    - "qcom,sdm845-pdc": For SDM845
> +		    - "qcom,sdm8150-pdc": For SM8150
>  		    - "qcom,sdm8250-pdc": For SM8250
>  		    - "qcom,sdm8350-pdc": For SM8350
>  
> -- 
> 2.35.1
> 
