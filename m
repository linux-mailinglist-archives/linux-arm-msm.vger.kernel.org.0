Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0767B4B4430
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Feb 2022 09:33:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233752AbiBNIdM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Feb 2022 03:33:12 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:54612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233232AbiBNIdK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Feb 2022 03:33:10 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB03F25C6D
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Feb 2022 00:33:03 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id i21so26527462pfd.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Feb 2022 00:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=MQIMrUbmJr4HGjKCakRsNk9/9OfJlXhm8q7RlUKXMaI=;
        b=vsgHU6bQxQM9c6c5kUJ/voPa1pHJu59MJIMpC2rAYxd36SbLN7XVj3m5zz6mLbc3Hy
         nTG9mtMogq/DDitVg42I+zJoApJuXaaw4c1wZJw4NLK7GVzACsLOi5aFm/ezh9QXD2Ol
         p5he31YPRq/udxq4rj0tOBRDMmECIRHng4jsmcbyN24nXEzfh+CgfdkyYXny0HQb5+vN
         exjYJKRoaduRAicNjlChU8TRBzdr12KIm+mCWEYSB0Uk46jihYWLg8+pZ4GpGlpiOAfw
         U8jLqA0P3lmDmwJKWloqe6rx/h+c1BaGn+kNXpmD5Y0GBXAEaAfXACHSEzb1PdKGQKDi
         AyJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MQIMrUbmJr4HGjKCakRsNk9/9OfJlXhm8q7RlUKXMaI=;
        b=WaO+BY8UOlIa4JInlKjdnbMBB3HBebSlFjDtk3QMZJtL9/UIEbwHR7L50PUEqBNi0o
         g8XyV4ryPJd8QSKu6ZDjkWhiX0bTR0a7V2Fjht5NBACcQ6Xo+tbQiSPcR9dohI1AKeQ/
         CgTw1kcvos1KHvLsG0DPC6K+1bH62eR0DIOwHdoNsQYQ6vIxwUF0r5Uj/ZVn+QY0swM/
         +ZpyHWTfYBetdHySV6Iw4dCNQ9gfazn6GVtwQuco8usv7KC13bXldguKSIxruW41IYlP
         vsen0PefnfjNAqfC1vtJ6bK0dbhJpAMloqwVaQ+ntV75xOid2co9CLncCQXOkImmDUnK
         vojA==
X-Gm-Message-State: AOAM532tGA3HoiH/OiOJa2oRX6pd+MD+AjeUEBUwKzMZ3O75dPirZoJZ
        2i37hC26VwTj2uoPzFFFWWhj
X-Google-Smtp-Source: ABdhPJx/toKkqhnRa/DQ5aFWSCH56pBGK5bwvQVAuo9GFs8uPRfPVABiVr7YvlfStyOmaEfhC1HniQ==
X-Received: by 2002:a62:e419:: with SMTP id r25mr3685087pfh.24.1644827583233;
        Mon, 14 Feb 2022 00:33:03 -0800 (PST)
Received: from thinkpad ([2409:4072:817:5a6f:3104:62c0:1941:5033])
        by smtp.gmail.com with ESMTPSA id t15sm3411815pgu.13.2022.02.14.00.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 00:33:02 -0800 (PST)
Date:   Mon, 14 Feb 2022 14:02:57 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        jassisinghbrar@gmail.com, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/8] dt-bindings: mailbox: Add binding for SDX65 APCS
Message-ID: <20220214083257.GA3494@thinkpad>
References: <1644821668-18073-1-git-send-email-quic_rohiagar@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1644821668-18073-1-git-send-email-quic_rohiagar@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Feb 14, 2022 at 12:24:28PM +0530, Rohit Agarwal wrote:
> Add devicetree YAML binding for SDX65 APCS GCC block. The APCS block
> acts as the mailbox controller and also provides a clock output and
> takes 3 clock sources (pll, aux, ref) as input.
> 
> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> index 01e9d91..688ae8b 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> @@ -91,6 +91,7 @@ allOf:
>          compatible:
>            enum:
>              - qcom,sdx55-apcs-gcc
> +            - qcom,sdx65-apcs-gcc
>      then:
>        properties:
>          clocks:
> -- 
> 2.7.4
> 
