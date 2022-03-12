Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6778C4D7028
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Mar 2022 18:36:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232333AbiCLRhh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Mar 2022 12:37:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231996AbiCLRhf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Mar 2022 12:37:35 -0500
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C67EB6D3A
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Mar 2022 09:36:29 -0800 (PST)
Received: by mail-oo1-xc2d.google.com with SMTP id h16-20020a4a6f10000000b00320507b9ccfso14594288ooc.7
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Mar 2022 09:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=iRAZJoZoZh3qRV/UYKwJwKogthRoGQB0qt95Y42xJ0o=;
        b=oKm0ZN3ZKvIZN/GefFAARdns9WrE3x4XoBJ1uXZNjdXYJBaoCaTRVBtd93sMGwI+wb
         p8+Rmdi0ffArNKC5tXIP3YZaSq6/DeK62G9RbnTr32gMAG+JgcMDg+JdNv++AmYUV1Df
         O/HZTYKLa5nkt0j7LQvGtgOghhLEbfRLRX/FE9l+m8hY+tB0hxUqoUtufFnw1e6szCRd
         JAfZbCuLpYAvWUxWJlNGHYM84N582JIcLYdIYqJWPblubxZzIUmM93j3yCcHmtdVpNJX
         ZzlMrZWr4rSZLALOPDVB2B3L7jmmV2Ran9m0xNL+HRRM0xboeJumYwhCKmr7ZVJI1CyN
         gxgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iRAZJoZoZh3qRV/UYKwJwKogthRoGQB0qt95Y42xJ0o=;
        b=oU1fSCLQgNvgZauypVkT1Yj09E2x0+/dreaHzO8XppFF3/S+SKLF6y4ZnRmVgy6ZV0
         9fzX+6WLbCmFmMLCDovFb5jp6y40urHH98PPi5+WKUQnGdw1OdoSfoQyMpQYT+FkWdDX
         QVM3GvASVdYurP8MhEgM4ZOsEpEWaL0Z6qfXqUU78Pwf1lOaJdERG70CTWNa5e17GhTC
         h1DmyDwxD4QcpOzZ4KQ4ixKpzFjEyM0SNqGWxjn1+QIEPUg+usS8Snhv6kNmTWzc7ApK
         HV/fVj8FVIck9Se0YXMnqaLZS7w6G8E/3m/UnFsphvzDV9NRqxHtUphqbfAUK3QaJB96
         g/3Q==
X-Gm-Message-State: AOAM530ZqJlkZ+Cms2lFe41AfgDUAT7lF03feEipTBfD/7fOOD+6NCnI
        0sy5HGE54hfgY+db4Kub6veB6w==
X-Google-Smtp-Source: ABdhPJyn9jljunqjT976KNT5QT5bTu3YoYxtUp/Qci2+b4frJrNNW1FUWyYNGk3vpCQ8IWOrnRf9uA==
X-Received: by 2002:a4a:6b5d:0:b0:321:493c:edcb with SMTP id h29-20020a4a6b5d000000b00321493cedcbmr7108644oof.81.1647106588714;
        Sat, 12 Mar 2022 09:36:28 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id q16-20020a9d4b10000000b005b22b93d468sm5105250otf.74.2022.03.12.09.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Mar 2022 09:36:28 -0800 (PST)
Date:   Sat, 12 Mar 2022 11:36:26 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Polimera <quic_vpolimer@quicinc.com>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        dianders@chromium.org, swboyd@chromium.org,
        quic_kalyant@quicinc.com
Subject: Re: [PATCH v5 1/5] arm64/dts/qcom/sc7280: remove assigned-clock-rate
 property for mdp clk
Message-ID: <YizaGgCLxH0D9MRF@builder.lan>
References: <1646758500-3776-1-git-send-email-quic_vpolimer@quicinc.com>
 <1646758500-3776-2-git-send-email-quic_vpolimer@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1646758500-3776-2-git-send-email-quic_vpolimer@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 08 Mar 10:54 CST 2022, Vinod Polimera wrote:

Please run:

  git log --oneline --no-decorate -- arch/arm64/boot/dts/qcom/sc7280.dtsi

and make sure your $subject is prefixed according to all other
sc7280-specific changes.

> Kernel clock driver assumes that initial rate is the
> max rate for that clock and was not allowing it to scale
> beyond the assigned clock value.
> 
> Drop the assigned clock rate property and vote on the mdp clock as per
> calculated value during the usecase.
> 
> Changes in v2:
> - Remove assigned-clock-rate property and set mdp clk during resume sequence.
> - Add fixes tag.
> 
> Changes in v3:
> - Remove extra line after fixes tag.(Stephen Boyd)

It's only in drivers/drm that the changelog goes in the commit message,
so please move this below the ---.

Thanks,
Bjorn

> 
> Fixes: 62fbdce91("arm64: dts: qcom: sc7280: add display dt nodes")
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index baf1653..408cf6c 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -2856,9 +2856,6 @@
>  				      "ahb",
>  				      "core";
>  
> -			assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>;
> -			assigned-clock-rates = <300000000>;
> -
>  			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
>  			interrupt-controller;
>  			#interrupt-cells = <1>;
> @@ -2892,11 +2889,9 @@
>  					      "lut",
>  					      "core",
>  					      "vsync";
> -				assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>,
> -						<&dispcc DISP_CC_MDSS_VSYNC_CLK>,
> +				assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>,
>  						<&dispcc DISP_CC_MDSS_AHB_CLK>;
> -				assigned-clock-rates = <300000000>,
> -							<19200000>,
> +				assigned-clock-rates = <19200000>,
>  							<19200000>;
>  				operating-points-v2 = <&mdp_opp_table>;
>  				power-domains = <&rpmhpd SC7280_CX>;
> -- 
> 2.7.4
> 
