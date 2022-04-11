Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDFB94FC4A9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Apr 2022 21:06:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349401AbiDKTI1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Apr 2022 15:08:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349740AbiDKTH6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Apr 2022 15:07:58 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2387E340EB
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 12:05:43 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id y6so14690878plg.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 12:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Q9OpvpGFcHyEQDuwBh0mOFthHPQfeFBWvLunUZ0CT6Q=;
        b=bYzLuuoQ2KE/Xc7EHWUIpVEYne36m5pFCnuxbNPtDLnFGVbzgBg7/74myhcN8NNONL
         X9L34ushUIDt//ofGyhcpuQtdar8WUBXaYOWrgRYUSsChZ/Z/OifDbPu0ErX+xz2Tpwt
         hLr5pK/WcmA66lVTc2uOC5QFoslFvY7CRF/18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Q9OpvpGFcHyEQDuwBh0mOFthHPQfeFBWvLunUZ0CT6Q=;
        b=dihAY48fP5b1OmzgWwvyG8V/NokIeQpEVHnAxsD3EaDlUVTM49hsHDBprqcvHfk3P9
         pVhpWP9J9E+oyZWvmenLZ8SecAIGoZ7/iv7nHBpSEkbwUGya48jmva0VHyiT8779Uk/9
         Laa5yDBqAz9UYxu/Q9ZuywhBMkL7TQUmoywhNs3WDxSYeXgedESqib4IUg5RAvNt21pW
         zgi9HDv2fYvn4tnQPysQPuqUwJ6C3rCt3KitQsG3fXFPN+cnP8/vCzkmhFHS6bhj1gbv
         Ek+Fx4/a77MGWqcsqP3poGcvIAo/HIeS2luF6AwfGceV4c1+jXbd5wuM4G0LDMe4fS/J
         Ormg==
X-Gm-Message-State: AOAM531oI3IWshmfWbDzaaGPZyQ0pqxtPTyVfNgrGJf73aY+EHxChjKx
        xe00ymxq5jU9mhUoCQ2NTKTsRw==
X-Google-Smtp-Source: ABdhPJzZVMvALaYDiTQB46/ytt4089vCc8d6zsVZ9GhHkHCgzjNev2FJfrbw1OgcQf8f8Bhkb2J6ng==
X-Received: by 2002:a17:90b:1e0e:b0:1c7:5b03:1d8b with SMTP id pg14-20020a17090b1e0e00b001c75b031d8bmr673950pjb.121.1649703942634;
        Mon, 11 Apr 2022 12:05:42 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:eb96:76ba:e2a1:2442])
        by smtp.gmail.com with UTF8SMTPSA id oa16-20020a17090b1bd000b001c72b632222sm225458pjb.32.2022.04.11.12.05.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Apr 2022 12:05:42 -0700 (PDT)
Date:   Mon, 11 Apr 2022 12:05:38 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
        srinivas.kandagatla@linaro.org, dianders@chromium.org,
        swboyd@chromium.org, judyhsiao@chromium.org,
        Venkata Prasad Potturu <quic_potturu@quicinc.com>
Subject: Re: [PATCH v7 1/2] arm64: dts: qcom: sc7280: Add pinmux for I2S
 speaker and Headset
Message-ID: <YlR8Ai8Yv4j9fGAC@google.com>
References: <1649685184-8448-1-git-send-email-quic_srivasam@quicinc.com>
 <1649685184-8448-2-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1649685184-8448-2-git-send-email-quic_srivasam@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Apr 11, 2022 at 07:23:03PM +0530, Srinivasa Rao Mandadapu wrote:
> Add pinmux nodes for primary and secondary I2S for SC7280 based platforms.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-idp.dtsi | 14 +++++++++++
>  arch/arm64/boot/dts/qcom/sc7280.dtsi     | 41 ++++++++++++++++++++++++++++++++
>  2 files changed, 55 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> index ecbf2b8..4ba2274 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> @@ -462,6 +462,20 @@
>  	drive-strength = <10>;
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

With the new names the nodes should be inserted between 'dp_hot_plug_det' and
'pm7325_gpios'.

>  &tlmm {
>  	bt_en: bt-en {
>  		pins = "gpio85";
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index f0b64be..8099c80 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -3527,6 +3527,31 @@
>  				function = "pcie1_clkreqn";
>  			};
>  
> +			mi2s0_data0: mi2s0-data0 {

Similar as above, the new nodes should be inserted between
'edp_hot_plug_det' and 'pcie1_clkreq_n'.

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
>  			qspi_clk: qspi-clk {
>  				pins = "gpio14";
>  				function = "qspi_clk";
> @@ -4261,6 +4286,22 @@
>  				drive-strength = <2>;
>  				bias-bus-hold;
>  			};
> +
> +			mi2s1_data0: mi2s1-data0 {

see above

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
