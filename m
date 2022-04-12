Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7ECD94FE3E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Apr 2022 16:33:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349172AbiDLOfu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Apr 2022 10:35:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352662AbiDLOft (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Apr 2022 10:35:49 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBB5B5EDF5
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 07:33:30 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id e189so19192671oia.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 07:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=16zlRzLQaeI5Lfq40tI5fznUUSFHqeb4rIP0NZlx/SQ=;
        b=Yxf2BarqXD49Rg5pPEzAsbZfIxsRPjLqwPvITATmpdxok2SSsbM/iYks+nfuqBQigr
         nDCBRlN7mCKzkI89CjibB1uxl9u9jP7ipB4s+uwEiys8JquRT2uYww4xmgVJUfDDpNyR
         //ShnjTJVLq0IGQzoQk7ziTPRicwOKGIfXO4zF8SKU6I/KHlFQAd6V+xtk00ll8hQrIX
         eijXCOoAkfp/icuxYYnr67QwhOYuQCM9+vi7KyDcomRxFz0dotMn053stN/37SYtsfUp
         UBg3K6CSBtKk02yFpipFL8N3kOZA4OodYha7zAq5Nb6vZIeAgco28PrrS8t/Hkhx0y0o
         p48Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=16zlRzLQaeI5Lfq40tI5fznUUSFHqeb4rIP0NZlx/SQ=;
        b=Og/ln7EXd2pHul1VFoKFBJFD4Bkd688uMCjn0rlj6Ca6eFqySoePilK1bXloUriDK2
         MzaAg+7N3fQhS5LyYFMXkWz8o4LG9Fsn9Q95rMbtq+R4k2eqr441qrlCZe2rr0v0xbhC
         vTfDGjuabwl8eAJyYqihm/3IuturcQMTvd/QMjIeOcJpXdueXOOYU04kJazv3+7vJuro
         juhZujN8Y7xBREhQxsIftUjXUAmuH/rEgR9Wsuv5vvsON8SwjoG6yeJU81zeHkCredkc
         pJsaSG8XwJVVhUM/LsPSSiqcZpad0QbkjeuV8Edptizbv2ni196F/4xkoFn7A5OerSpH
         F5XQ==
X-Gm-Message-State: AOAM532LzGPm4szCwJz4xLS0LgIcksapEif1s/JvsAAQM2JX56iiD//l
        RvUBgISIRj/Cd+46bRFtYaZx0A==
X-Google-Smtp-Source: ABdhPJwBA/222PiQAxJQ9fHmUWxwdJWC/fMo3zEL9Y5yWbFkh8by223DqgzbHY3HiGCeOXOxguRrMw==
X-Received: by 2002:a05:6808:11c4:b0:2f9:ccd6:15a4 with SMTP id p4-20020a05680811c400b002f9ccd615a4mr1938023oiv.219.1649774010211;
        Tue, 12 Apr 2022 07:33:30 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id l92-20020a9d1b65000000b005e8a3a4aca6sm290716otl.25.2022.04.12.07.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 07:33:29 -0700 (PDT)
Date:   Tue, 12 Apr 2022 09:33:27 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
        srinivas.kandagatla@linaro.org, dianders@chromium.org,
        swboyd@chromium.org, judyhsiao@chromium.org,
        Venkata Prasad Potturu <quic_potturu@quicinc.com>
Subject: Re: [PATCH v8 1/2] arm64: dts: qcom: sc7280: Add pinmux for I2S
 speaker and Headset
Message-ID: <YlWNt7f5EUk7I4by@builder.lan>
References: <1649769281-12458-1-git-send-email-quic_srivasam@quicinc.com>
 <1649769281-12458-2-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1649769281-12458-2-git-send-email-quic_srivasam@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 12 Apr 08:14 CDT 2022, Srinivasa Rao Mandadapu wrote:

> Add pinmux nodes for primary and secondary I2S for SC7280 based platforms.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-idp.dtsi | 14 +++++++++++
>  arch/arm64/boot/dts/qcom/sc7280.dtsi     | 40 ++++++++++++++++++++++++++++++++
>  2 files changed, 54 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> index ecbf2b8..1fc94b5 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> @@ -359,6 +359,20 @@
>  	bias-disable;
>  };
>  
> +&mi2s1_data0 {
> +	drive-strength = <6>;
> +	bias-disable;
> +};
> +
> +&mi2s1_sclk {
> +	drive-strength = <6>;
> +	bias-disable;
> +};
> +
> +&mi2s1_ws {
> +	drive-strength = <6>;
> +};
> +
>  &pm7325_gpios {
>  	key_vol_up_default: key-vol-up-default {
>  		pins = "gpio6";
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index f0b64be..6e6cfeda 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -3522,6 +3522,46 @@
>  				function = "edp_hot";
>  			};
>  
> +			mi2s0_data0: mi2s0-data0 {

Are these ever going to be selected individually, or could this be:

mi2s0_state: mi2s0-state {
	data0 {
		...;
	};

	data1 {
		...;
	};

	mclk {
		...;
	};

	etc
};

mi2s1-state {
	...;
};

And then a single pinctrl-0 = <&mi2c0_state>;

Regards,
Bjorn

> +				pins = "gpio98";
> +				function = "mi2s0_data0";
> +			};
> +
> +			mi2s0_data1: mi2s0-data1 {
> +				pins = "gpio99";
> +				function = "mi2s0_data1";
> +			};
> +
> +			mi2s0_mclk: mi2s0-mclk {
> +				pins = "gpio96";
> +				function = "pri_mi2s";
> +			};
> +
> +			mi2s0_sclk: mi2s0-sclk {
> +				pins = "gpio97";
> +				function = "mi2s0_sck";
> +			};
> +
> +			mi2s0_ws: mi2s0-ws {
> +				pins = "gpio100";
> +				function = "mi2s0_ws";
> +			};
> +
> +			mi2s1_data0: mi2s1-data0 {
> +				pins = "gpio107";
> +				function = "mi2s1_data0";
> +			};
> +
> +			mi2s1_sclk: mi2s1-sclk {
> +				pins = "gpio106";
> +				function = "mi2s1_sck";
> +			};
> +
> +			mi2s1_ws: mi2s1-ws {
> +				pins = "gpio108";
> +				function = "mi2s1_ws";
> +			};
> +
>  			pcie1_clkreq_n: pcie1-clkreq-n {
>  				pins = "gpio79";
>  				function = "pcie1_clkreqn";
> -- 
> 2.7.4
> 
