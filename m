Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 733AD50A5C2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Apr 2022 18:34:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231615AbiDUQdw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Apr 2022 12:33:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1390654AbiDUQdl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Apr 2022 12:33:41 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 736CC48E55
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Apr 2022 09:28:53 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id s14so5353655plk.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Apr 2022 09:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WkdhlTGKvN68SlRLMJdx437G/wIo/jBpfIeJhDG0Jck=;
        b=g39jc98KyMqzeT74PT79TxjVzfhAFziSDBuq3v+ZuzvRsVporGEnbMVsRQ1b6C3o5X
         54Vr2jaUQIApND2TCOlwd7uaPlyoPFPRpa5ytuI8OzdU9IqVVanwrl/aFYoyA6qIC44R
         2rrP+NXlVDCcuyelWumY9NhKgwTvxPswO/qAo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WkdhlTGKvN68SlRLMJdx437G/wIo/jBpfIeJhDG0Jck=;
        b=RmlkA/oWEgxbfHQbEP7n1vbf4iBRtxX5AHLRQrkTagq149fTVYQPW2VQvS7NtvmcZg
         OzsYAAvGOaHFothA/TLDaYq1dRImzXkS48Pk5n02I1S6N70uCrNOXQrUCDj7VRuE8fyb
         UoeUoTsLPgmSZyVYGE+JmOG0/tdxB+cqU5EHor51FIX8ewKrjcKf0O3oz4P30mO4v6fG
         H3tsaxKwX/WDBUeW3wXJynz0svOeTIkA/5o485i3nN2LwWdlTPdayypTDM2efeDaTlhs
         C2s3saPrbYsmuEWtU4D3sPOGbRfEnmXFkvvOROqnyOTNH2V89qNguiAc2uiJIT1y1YiS
         5/Fw==
X-Gm-Message-State: AOAM5334O9+iu1Iym40q1twBV8A04fen9WNOvowkP95t7WaaiiyHWkf9
        0V7sug7Xk7nLtzJV0OwEfUianQ==
X-Google-Smtp-Source: ABdhPJwwEZAKewcyO4Htm0T4aE9t8nchCjvROAy5B3s0/2c0AxEY8XyA/EVhcuqsUwTSeh7+7XgOtw==
X-Received: by 2002:a17:902:8306:b0:158:2d58:a36a with SMTP id bd6-20020a170902830600b001582d58a36amr82271plb.55.1650558533004;
        Thu, 21 Apr 2022 09:28:53 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:d426:5807:a72:7b27])
        by smtp.gmail.com with UTF8SMTPSA id h13-20020a056a00230d00b004f427ffd485sm26982254pfh.143.2022.04.21.09.28.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Apr 2022 09:28:52 -0700 (PDT)
Date:   Thu, 21 Apr 2022 09:28:50 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
        srinivas.kandagatla@linaro.org, dianders@chromium.org,
        swboyd@chromium.org, judyhsiao@chromium.org,
        Venkata Prasad Potturu <quic_potturu@quicinc.com>
Subject: Re: [PATCH v9 03/12] arm64: dts: qcom: sc7280: Enable digital codecs
 and soundwire for CRD 3.0/3.1
Message-ID: <YmGGQiD0L2GipcRt@google.com>
References: <1650552459-21077-1-git-send-email-quic_srivasam@quicinc.com>
 <1650552459-21077-4-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1650552459-21077-4-git-send-email-quic_srivasam@quicinc.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Apr 21, 2022 at 08:17:30PM +0530, Srinivasa Rao Mandadapu wrote:
> Enable rx, tx and va macro codecs and soundwire nodes for
> CRD rev5 (aka CRD 3.0/3.1) boards.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts | 35 +++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts b/arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts
> index fd6eadc..d0794f2 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts
> @@ -69,6 +69,19 @@ ap_ts_pen_1v8: &i2c13 {
>  	};
>  };
>  
> +&lpass_rx_macro {
> +	status = "okay";
> +};
> +
> +&lpass_tx_macro {
> +	status = "okay";
> +};
> +
> +&lpass_va_macro {
> +	status = "okay";
> +	vdd-micb-supply = <&vreg_bob>;
> +};
> +
>  /* For nvme */
>  &pcie1 {
>  	status = "okay";
> @@ -89,6 +102,28 @@ ap_ts_pen_1v8: &i2c13 {
>  	status = "okay";
>  };
>  
> +&swr0 {
> +	status = "okay";
> +
> +	wcd_rx: codec@0,4 {
> +		compatible = "sdw20217010d00";
> +		reg = <0 4>;
> +		#sound-dai-cells = <1>;
> +		qcom,rx-port-mapping = <1 2 3 4 5>;
> +	};
> +};
> +
> +&swr1 {
> +	status = "okay";
> +
> +	wcd_tx: codec@0,3 {
> +		compatible = "sdw20217010d00";
> +		reg = <0 3>;
> +		#sound-dai-cells = <1>;
> +		qcom,tx-port-mapping = <1 2 3 4>;
> +	};
> +};

The wcd9385 is on the qcard, so the wcd_tx/rx nodes should probably
be added to sc7280-qcard.dtsi, and the CRD DT would only set 'status'.
