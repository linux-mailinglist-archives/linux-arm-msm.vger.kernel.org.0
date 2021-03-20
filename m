Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0479A342A26
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Mar 2021 04:06:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229766AbhCTDFt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Mar 2021 23:05:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229955AbhCTDFd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Mar 2021 23:05:33 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6763DC061761
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Mar 2021 20:05:33 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id x7-20020a17090a2b07b02900c0ea793940so7608198pjc.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Mar 2021 20:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Em6lpjRfJTbiYdVSiA1ppSbjAUxMrhzU5Ds1dTYJXe8=;
        b=w3OoCnPNXittE8wi/EHalhW9k1I9VETut3jNvP5lq9QA744ELqa2aUkDKmJwq9l+zP
         KKh18KKa7Nawwzmw3JpkOnmE8eXOTrqF0s/DlEQzh3WhJtIyOUqEuOiFvhlHmg911eYY
         pXZJ8z2v0cO7Z+XP1XGuJ7ht3mSrfE9SCgLdIeIPvJMUeCjfZvYGoRHd+dW4z+pGsOkR
         30z2UZNNjGq1WZddd6B3Z28jeGVpwv+VXq4C0FHYBHQQ13/+NRWzSMpioCTtka/MNPXO
         GE6qnjq/9FOdpRPCy7ho7sL14KFAyuilWJUA8afzHLGnTgENcZjuSbx7Qh96JTglW1b7
         iz5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Em6lpjRfJTbiYdVSiA1ppSbjAUxMrhzU5Ds1dTYJXe8=;
        b=cAvWMzDnSx9ViTpCIlFLkRe3DWouIAW0gzqOyi3YnFiwl7dlU9kZTcY4Gb6/Z+mIoF
         2vnBllL/iLF/8axBc1XeP7oXJ9ykIEu4ub3TQjtsoHKN8mYCyMvQjlMHldiAlCVBFVvO
         +3NnEoaTQuEAOUu/qaqIImWTo0mxKFK+D5Yc1WVg4NBikFlGZD1G5lPtd2O8bjmr8ETw
         jnNrYfYbLZLSNIbjZpgMxXRUKDnuRxLcwOcSpdTlUQpJjDBppU0XRSX70kE0xL22xTIN
         aH/PoEird7gZDQpQ5Liyru5By6FVjT27u6l9gxjjSfuIalELDA++CrboTjC8wFvwRdBx
         vNEQ==
X-Gm-Message-State: AOAM5305SN4wiLO9Pt8Buv8Re7AIcDmxePlK9pXJX0DQgpWezBCep2T/
        YPLj9fWr3pi9UiLSPDg8BEBDyg==
X-Google-Smtp-Source: ABdhPJwSQDMHwF6dvSvGGyqfyHQF2o7+RnnBuuJrW8/PeWhQemdRuw4bSMTpMylMQSGpf0thCIFMOw==
X-Received: by 2002:a17:90a:c257:: with SMTP id d23mr1606185pjx.102.1616209532943;
        Fri, 19 Mar 2021 20:05:32 -0700 (PDT)
Received: from leoy-ThinkPad-X240s ([116.206.101.226])
        by smtp.gmail.com with ESMTPSA id v1sm6178974pgh.17.2021.03.19.20.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 20:05:32 -0700 (PDT)
Date:   Sat, 20 Mar 2021 11:05:28 +0800
From:   Leo Yan <leo.yan@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Coresight ML <coresight@lists.linaro.org>,
        Mike Leach <mike.leach@linaro.org>
Cc:     Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [PATCH] arm64: dts: msm8916: Enable CoreSight STM component
Message-ID: <20210320030528.GA488187@leoy-ThinkPad-X240s>
References: <20210320025942.487916-1-leo.yan@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210320025942.487916-1-leo.yan@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mike,

On Sat, Mar 20, 2021 at 10:59:42AM +0800, Leo Yan wrote:
> From: Georgi Djakov <georgi.djakov@linaro.org>
> 
> Add DT binding for CoreSight System Trace Macrocell (STM) on msm8916,
> which can benefit the CoreSight development on DB410c.

For the DT binding for CoreSight STM on DB410c, I have one question:

Do you know there have any CTI is conntected to STM so that the DT
binding needs to reflect the connection?  If this is the case, we
should update the DT binding for CTI node as well.

Thanks,
Leo

> 
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
> Signed-off-by: Leo Yan <leo.yan@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi |  1 +
>  arch/arm64/boot/dts/qcom/msm8916.dtsi     | 27 +++++++++++++++++++++++
>  2 files changed, 28 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> index 3a9538e1ec97..dd87e5d739ab 100644
> --- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> +++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> @@ -406,6 +406,7 @@ &wcd_codec {
>  &etm1 { status = "okay"; };
>  &etm2 { status = "okay"; };
>  &etm3 { status = "okay"; };
> +&stm { status = "okay"; };
>  &etr { status = "okay"; };
>  &funnel0 { status = "okay"; };
>  &funnel1 { status = "okay"; };
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index 402e891a84ab..892f1772e53c 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -562,6 +562,13 @@ funnel0_in4: endpoint {
>  						remote-endpoint = <&funnel1_out>;
>  					};
>  				};
> +
> +				port@7 {
> +					reg = <7>;
> +					funnel0_in7: endpoint {
> +						remote-endpoint = <&stm_out>;
> +					};
> +				};
>  			};
>  
>  			out-ports {
> @@ -882,6 +889,26 @@ etm3_out: endpoint {
>  			};
>  		};
>  
> +		stm: stm@802000 {
> +			compatible = "arm,coresight-stm", "arm,primecell";
> +			reg = <0x802000 0x1000>,
> +			      <0x9280000 0x180000>;
> +			reg-names = "stm-base", "stm-stimulus-base";
> +
> +			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
> +			clock-names = "apb_pclk", "atclk";
> +
> +			status = "disabled";
> +
> +			out-ports {
> +				port {
> +					stm_out: endpoint {
> +						remote-endpoint = <&funnel0_in7>;
> +					};
> +				};
> +			};
> +		};
> +
>  		msmgpio: pinctrl@1000000 {
>  			compatible = "qcom,msm8916-pinctrl";
>  			reg = <0x01000000 0x300000>;
> -- 
> 2.25.1
> 
