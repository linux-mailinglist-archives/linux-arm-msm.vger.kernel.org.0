Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5E134D9FCE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Mar 2022 17:19:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349984AbiCOQUd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Mar 2022 12:20:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349987AbiCOQUb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Mar 2022 12:20:31 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CECC913D1C
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Mar 2022 09:19:17 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id w2so13279320oie.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Mar 2022 09:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jji1tgDZhiJNyWN5WyuZ3fZEi8EJxLCmUtuKoul6FBo=;
        b=YTy9nR61OW4lRvjZWSUzAyhlygBXmUQqpsjkPQ8YtRf9dX/0IendoIblPcPA3WWszy
         2h5k8yhe+HaBIPcmuEOqbx4rRJTp/wzx/j4CrwpVZYBoF/rzCtwWL4jKaqoxkAhKAMZJ
         G8XUupZ/X0OuHOKvoFsAGvAvBeEp/ajsPKCuNGJNmG+ISsTHYfDR4uVxje9OHQoz/87T
         ma9tmAbRW1Pn4Ade5fzAEOi3bilnju6Lva0G/GvDtIvq9GUz6fFf7f73g+pUDzXxRH99
         oE4gW4mmKKeDOQu3G8oGjXwJaObmPXQAtE78dxHQUAbymKcgCRm5BEagcqknIf8F47KL
         3JEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jji1tgDZhiJNyWN5WyuZ3fZEi8EJxLCmUtuKoul6FBo=;
        b=gbxPFB5M5otPCbqWZoZqKZxZZ+dnxcSRrAq2d5O+Id2/X38KLwhZbVLIah3nSl1gDD
         k+jWX+olETq5FXGhlbY9MgRtE70FVAb3oXd3Up7rxI7V9GT4/1xIEfUkerDql+dSFb15
         t61bW2XfcWWnYaaRrP/v6cB7pIDS8naLlXARH36n78C+Xfo1quyag0UzA3JDO70Gs1Kk
         Ckc4WxdWWRgzwVkg0SYTiJTrsxsjOnghx0tx3XUtdfIy81zQc0QquNmM1fl75i/sPcMs
         wq+m3AySeN1oD5pX4MTn5dM5PAafo1CmtJnzBqCYIB8hWtXAAZI9DrtPkcqpKQBsw7aV
         h7kA==
X-Gm-Message-State: AOAM530mrii5Gb276fqLn6NUkcyvilgpv6H3t34tMbo6972kDfuWCpGn
        NLFIpqw/fnhgAKu35plK8pYqDg==
X-Google-Smtp-Source: ABdhPJzSSgACVwWZ+cleUvVSPF2LLrix/GamFW+S5D/ZGAhmB5q9+dc/K0kW1R4QzWb98l5HY0CLYw==
X-Received: by 2002:a05:6808:23c1:b0:2da:30fd:34d9 with SMTP id bq1-20020a05680823c100b002da30fd34d9mr2000204oib.203.1647361157016;
        Tue, 15 Mar 2022 09:19:17 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id k13-20020a056830150d00b005c942e2281dsm6022432otp.76.2022.03.15.09.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 09:19:16 -0700 (PDT)
Date:   Tue, 15 Mar 2022 11:19:14 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, bhupesh.linux@gmail.com,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, maz@kernel.org,
        quic_mkshah@quicinc.com, linux-gpio@vger.kernel.org,
        linus.walleij@linaro.org, robh+dt@kernel.org,
        Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sm8150: Add PDC as the
 interrupt parent for tlmm
Message-ID: <YjC8gnRZnS2V7zI1@builder.lan>
References: <20220226184028.111566-1-bhupesh.sharma@linaro.org>
 <20220226184028.111566-5-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220226184028.111566-5-bhupesh.sharma@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat 26 Feb 12:40 CST 2022, Bhupesh Sharma wrote:

> Several wakeup gpios supported by the Top Level Mode Multiplexer (TLMM)
> block on sm8150 can be used as interrupt sources and these interrupts
> are routed to the PDC interrupt controller.
> 
> So, specify PDC as the interrupt parent for the TLMM block.
> 
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> index aaeacd379460..6e6fa7811c7a 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -1937,6 +1937,7 @@ tlmm: pinctrl@3100000 {
>  			#gpio-cells = <2>;
>  			interrupt-controller;
>  			#interrupt-cells = <2>;
> +			wakeup-parent = <&pdc>;
>  
>  			qup_i2c0_default: qup-i2c0-default {
>  				mux {
> -- 
> 2.35.1
> 
