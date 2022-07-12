Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C3C1571976
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jul 2022 14:10:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229729AbiGLMK2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jul 2022 08:10:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230127AbiGLMK1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jul 2022 08:10:27 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2349359264
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 05:10:25 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id e132so7384172pgc.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 05:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=H4mgbZdPBhNU48LgD066YZDVrCNGP1S1bHh2d7Rqxmc=;
        b=BpZvDHOOia2h4/UpP/jboWITkslgPVpLe0yfOs5h0Df+ZjY0wMYUgP7xt6h9O5binS
         Kipt74HAMZ1sMWDmumpbFvrXa7eEmJSmJjRbJE/q4j21tcnxiuqv33MiuGu4jqN9iSDi
         U2+7X41vT1q4JkPLr91UuQ6mgSmoVpqPsTUChd0CqWjx5+FqprA+ncYsL+k+L4Vqq7qB
         7jcIge+wdAc6PKzeDeEt003wmCprxISJ6KKXYQWamSmyWdzWBiX7aopFdyGrLdTdiffK
         9QrG6WEpV24sB0CM2r2nSlBU3KpT0YZ6NuNUxDVxZTNGX+zxM5EFB9haXEbwE6Wun3IZ
         2gKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=H4mgbZdPBhNU48LgD066YZDVrCNGP1S1bHh2d7Rqxmc=;
        b=WoZVwEwV0hPJdSsUZ6XqEKGYFumc8jeFBAAGtGe2lChtA75MBXSDbHeexK8Piye3JD
         n3FyU+tI5/+f5c33lZ9r6SK7RpL+kqI5fghToH6LydEyksE18v+YY7mXtHWbqpuM9q79
         qvWKcDxfD7H8J0jKUOZa0EHFKoOxX9BhabRtz6sbrPWyxG/b21s+j4d/oaDVXkkQd7qt
         bxBxqmiqeDKPY2iI9iv6Xx/ZK8gWx1/8Q8laUuVKIQQsgQXrEnECZUXhFhJq4Ylbj7Xt
         UQjP42mkx9MtoWbxvaRGPu4XtdBnAps9UR1yn+XzB2Ry13LHHBobmJ7zQWyK1ShRBEfZ
         edyQ==
X-Gm-Message-State: AJIora96gokeqBbnelELcb0KjsFdrHkabdwFmLUhgMWZClky4GibrkEA
        uVaSvTKjqPoeL7DVhX1Td6tq
X-Google-Smtp-Source: AGRyM1ttHx0mAyPTnRcSp9iV9wTc2Yhu+Dyis5xnOAx0TATIfwHt9FYlOWjpQ/S6VXYWZWrUt8g6ig==
X-Received: by 2002:a63:6a49:0:b0:3fd:df6d:5ba3 with SMTP id f70-20020a636a49000000b003fddf6d5ba3mr19591665pgc.385.1657627824450;
        Tue, 12 Jul 2022 05:10:24 -0700 (PDT)
Received: from workstation ([117.207.31.14])
        by smtp.gmail.com with ESMTPSA id a13-20020a170902eccd00b001664d88aab3sm6647228plh.240.2022.07.12.05.10.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jul 2022 05:10:23 -0700 (PDT)
Date:   Tue, 12 Jul 2022 17:40:18 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Parikshit Pareek <quic_ppareek@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Prasanna Kumar <quic_kprasan@quicinc.com>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: remove duplicate apps_smmu
 irq
Message-ID: <20220712121018.GA17302@workstation>
References: <20220712075859.875-1-quic_ppareek@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220712075859.875-1-quic_ppareek@quicinc.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 12, 2022 at 01:28:59PM +0530, Parikshit Pareek wrote:
> Remove the duplicate irq number 424, from apps_smmu node. This is needed
> to correct the interrupt mapping for context banks.
> 
> Fixes: 152d1faf1e2f ("arm64: dts: qcom: add SC8280XP platform")
> Signed-off-by: Parikshit Pareek <quic_ppareek@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> index 7945cbb57bb4..9583cc53aa03 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -1580,7 +1580,6 @@
>  				     <GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 706 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>,

While the change is correct, the IRQs are not sorted and that's what
encouraging these kind of dups.

Please sort them too.

Thanks,
Mani

>  				     <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>,
> -- 
> 2.17.1
> 
