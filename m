Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 892884C8241
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Mar 2022 05:22:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231492AbiCAEXK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Feb 2022 23:23:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229940AbiCAEXK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Feb 2022 23:23:10 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 025D137A31
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 20:22:30 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id c9so12517803pll.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 20:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=er1+nF+4ONhOGnKGy9pN0cgSQ+ll2TiqgLcg/njPFr8=;
        b=oipGy61VYoVU8qK0vDv+oTTQJDjlwLNQ/7BP7du86NT3zcCh8TcDtQC8K42swbDpum
         I3E9IrpJcDKPhXuZ4X/Mwr93XJtS8XyTGZ1H4vDeAVyDDjBO4QFbUuycOCTvOTZifpFd
         IR1NnYAESHnlLxwtrAEhmyiMV1FeFZnSHo1tcBvA6k2SgQ2W9JhcmpaOYn7IcFMdP7u8
         IthW0hX1gh1wQ1UaLwKwcxtPh1YCnAY/In8ZCHWA3r1/ZKT+rtgiVb1o+wwdWWtEES/b
         GOmADlQUigu87w7la849TIv8sMsQLW3K55M8Ttm0qEVJkZqdfJCGDCEvOeD4iVWXL1MG
         14ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=er1+nF+4ONhOGnKGy9pN0cgSQ+ll2TiqgLcg/njPFr8=;
        b=ByV+aaEWf0hJDOkFStihvDzbKI3rliQoMjx9JCmL/Fv5nw20AJz+KUWu0Eo9Y/codl
         IfqPOUgJ6/HR18shemrHspKqZRwIIU/X6NQvGm9yFqAM/KplBKnFOgN7yQGtRJfr0ICR
         5HxSPbIxMnelpYDR13L+QdM4odeBC+Nqq7AYRGex92Nto948CPNrQU16EM+HfUgoSAlk
         Cav8GTbJf39qbqYH8tW/uWY+XJ5yJ9HxF7SfdP12ZbrTdTzeV9OpTjLLDlBirDjxtWXL
         +voLaDsb+zjtjchVsWR4VsT9gcToWg9PGiWghCsT6Kc5MUmwbm8aglQuzkoz/g+IXy4X
         NbSQ==
X-Gm-Message-State: AOAM530dGLD/Ezk5Q3GTi5eLEPDBww4KNNuvJHrc5zD8NPi7rBu01jzj
        9z5unEIMHwLNcBnQ6bnH7uh4Q2xCHN9Q2g==
X-Google-Smtp-Source: ABdhPJz5ksmIRw0B3/MxjyFEI3mi/rvPVvfZBj5u1kfSb7EtS9xUAp83HI6xgpzP9yDKKSCwRJUq2g==
X-Received: by 2002:a17:902:7892:b0:14e:c520:e47d with SMTP id q18-20020a170902789200b0014ec520e47dmr22953335pll.105.1646108549538;
        Mon, 28 Feb 2022 20:22:29 -0800 (PST)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id y8-20020a056a00180800b004e156f7191esm14549503pfa.213.2022.02.28.20.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 20:22:28 -0800 (PST)
Date:   Tue, 1 Mar 2022 12:22:23 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, bhupesh.linux@gmail.com,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, vkoul@kernel.org,
        linux-phy@lists.infradead.org, robh+dt@kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 3/8] arm64: dts: qcom: msm8996-xiaomi: Drop
 max-microamp and vddp-ref-clk properties from QMP PHY
Message-ID: <20220301042223.GK269879@dragon>
References: <20220228123019.382037-1-bhupesh.sharma@linaro.org>
 <20220228123019.382037-4-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220228123019.382037-4-bhupesh.sharma@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Feb 28, 2022 at 06:00:14PM +0530, Bhupesh Sharma wrote:
> The following properties are not supported and causing dtbs_check
> warnings.
> 
>     - vdda-phy-max-microamp
>     - vdda-pll-max-microamp
>     - vddp-ref-clk-max-microamp
>     - vddp-ref-clk-always-on
> 
> arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dt.yaml: phy@627000:
>    'vdda-phy-max-microamp', 'vddp-ref-clk-always-on', 'vddp-ref-clk-max-microamp'
>     do not match any of the regexes: '^phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
> 
> Drop them from QMP PHY nodes for 'msm8996-xiaomi' dts.
> 
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
> index 7a9fcbe9bb31..f6f6b2e89a36 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
> @@ -337,12 +337,7 @@ &ufsphy {
>  	vdda-phy-supply = <&vreg_l28a_0p925>;
>  	vdda-pll-supply = <&vreg_l12a_1p8>;
>  
> -	vdda-phy-max-microamp = <18380>;
> -	vdda-pll-max-microamp = <9440>;
> -
>  	vddp-ref-clk-supply = <&vreg_l25a_1p2>;

I do not see this is supported by qmp-phy driver.  Maybe we should drop
it from bindings and clean up from DTS as well?

Shawn

> -	vddp-ref-clk-max-microamp = <100>;
> -	vddp-ref-clk-always-on;
>  };
>  
>  &venus {
> -- 
> 2.35.1
> 
