Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB6254B4441
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Feb 2022 09:36:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237010AbiBNIft (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Feb 2022 03:35:49 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:56216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242081AbiBNIfs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Feb 2022 03:35:48 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5034E25C77
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Feb 2022 00:35:41 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id m22so8801429pfk.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Feb 2022 00:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=B2Av8IIBA8TjB3eMKgW+LESmfQPDIqBtrj6laU9omWM=;
        b=J6Yc007szTdnDHdOnptLspSeqDqdzPSpNGjBh+w8YNT3IIQxCdn0oJjnWqNGgQ1+l6
         6Tr/9S40ugx9Y3w2Wth5CLHlrtUMeojV2bkEem9RpZrSKsbki+wrSVLxGhCHBxaSKgY4
         KQQxBXHe/2UkoGXZr67MMwgsDteHOHgJpbk5ygHtIuZR8z5+qcMQTm0+cVJj6ggV0ErW
         690gpTX2nnp8I5Vv2DOdkwoJiVChd2VyCAzYrvkab5omlVvFr58BRFF84BBQjFjOQgob
         nOnfCNISLbxr6koFDoXKUyfR7DkmmxKc5+nULCByBbAFPAH8KtcSEq+fCnPs4SiDcToX
         E4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=B2Av8IIBA8TjB3eMKgW+LESmfQPDIqBtrj6laU9omWM=;
        b=SWeumV0pCzb2JkOVHN2ioPtvBsBVwm+unzDXGlcSQ3yklRPkIZBjKqADuEvkXj4zIa
         CwKbq0ngX2JtdFer23fQWcNuDhG/kNGuXkR5BOxW2Bq3f/c8M4NXO/qC0zFEFTy5MN3I
         uvpG+XKKSLzKWTh1Y59l1Q3zBq+7gWwQPvITdXouQ5lS3C6gdtgRI7C5QMxgszBwfT7n
         Iqc5gwkaAjkERkDkmfFtzVB2sQ0EdhDhG1aJgKvfW8Z60x8NjmXWGa+V+q8EqdPyRwGR
         TqD7nry/cPIvd4WJc50YFvy4KSizSjL95/xvLOB4XENj+F9wNglJWoXP3VS90tAxf0Kg
         bF/A==
X-Gm-Message-State: AOAM531oEcXCipz5FqGn1EmqSIZAY55G2KnlPO+B54xdV6H9C7RQWTwg
        NyT1ptuDmz1CmcIwiqMhFH4f
X-Google-Smtp-Source: ABdhPJzP0FhuWI8d9fn+EiMWyyxIjF3bsw7lxM014ecR/cIjod/p/xOgA8qk6iVqHLJh4mBGKYIyKg==
X-Received: by 2002:a05:6a00:17a1:: with SMTP id s33mr1546456pfg.72.1644827740803;
        Mon, 14 Feb 2022 00:35:40 -0800 (PST)
Received: from thinkpad ([2409:4072:817:5a6f:3104:62c0:1941:5033])
        by smtp.gmail.com with ESMTPSA id mi11sm12805901pjb.37.2022.02.14.00.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 00:35:40 -0800 (PST)
Date:   Mon, 14 Feb 2022 14:05:34 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/8] dt-bindings: clock: Add A7 PLL binding for SDX65
Message-ID: <20220214083534.GC3494@thinkpad>
References: <1644821869-27199-1-git-send-email-quic_rohiagar@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1644821869-27199-1-git-send-email-quic_rohiagar@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Feb 14, 2022 at 12:27:49PM +0530, Rohit Agarwal wrote:
> Add YAML binding for Cortex A7 PLL clock in Qualcomm
> platforms like SDX65.
> 
> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  Documentation/devicetree/bindings/clock/qcom,a7pll.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,a7pll.yaml b/Documentation/devicetree/bindings/clock/qcom,a7pll.yaml
> index 8666e99..b8889dc 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,a7pll.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,a7pll.yaml
> @@ -10,13 +10,14 @@ maintainers:
>    - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>  
>  description:
> -  The A7 PLL on the Qualcomm platforms like SDX55 is used to provide high
> +  The A7 PLL on the Qualcomm platforms like SDX55, SDX65 is used to provide high
>    frequency clock to the CPU.
>  
>  properties:
>    compatible:
>      enum:
>        - qcom,sdx55-a7pll
> +      - qcom,sdx65-a7pll
>  
>    reg:
>      maxItems: 1
> -- 
> 2.7.4
> 
