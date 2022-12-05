Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 321C3642D6F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Dec 2022 17:46:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232976AbiLEQqM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Dec 2022 11:46:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232371AbiLEQpi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Dec 2022 11:45:38 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB5E0CC7
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Dec 2022 08:44:46 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id bp15so19442485lfb.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Dec 2022 08:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lskTxKH+t6SUryPNvJXQQ0pZb/SpXRtbjFLLir4Ar4M=;
        b=LrR7ogg+ecgNfv1NCRwIL0j22WGHuhcG25cwmQFRPBpxTt7GT1X8BSFy4xxV/STO12
         7lMN1Dtzoec/2ZTkSMvM+r6L/dsboolQ62y4E5R+bYicqEwqeAXJLfaLMh7D66QIiBoI
         YDWOY9V0fdyYFUFwPWkgZOsn+4q1trEEVM5Ee4VFOhF1wpF6w40KriZxX7zMOyOD1680
         7s/9l78J9AJQBOuDcs2T/OKoO8SkLYzW79dX7J4/3uyu1k7Ot8D5MBmgL0Guv4xNkus/
         +HwStbmSSY97hppUcr7wXWbQPdcJVxGKpF+YtRt/o5LIEiaqtxUPUgWhMjQUnmU+wl3h
         kU4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lskTxKH+t6SUryPNvJXQQ0pZb/SpXRtbjFLLir4Ar4M=;
        b=8LCnG8qbtuby6I7+rCfIHZN6mhWlh7XVqA1DkFW9BYyE72IVvno6gZZc+v7pYBqbLO
         bogpZsEwrykw+oqPouEgOEkKMgSO0hpUHE/VNNyXH1fWmi1nnOgbG+WZaMj6fqnaw+fB
         nqlpu/yEi1uvQvUflkbvoG6xKhCKWfLYIjuQi71Qr/9MHJXS60WgPmRIOIbcQE1eyb7H
         q/7oR6E9JuUN/vjujFtNHwt5Q6nQV7gtMP8f8SbipK0O6WDz+B99vsFBjauGe6rAHOcp
         K/MXopI32C4OuY+0AXSoUaiauuJxqWP48LeyuvkGDcMspCa6h6pwjvUxgp/xhj/DAUaZ
         LF4w==
X-Gm-Message-State: ANoB5pnoBwKGcJZixTvAG4dWN+ioh5cj2BX/9qPvieL8kLrpPihxD2MH
        8aM6dVIOC+qjotj9TeocatgRWw==
X-Google-Smtp-Source: AA0mqf7aaa+iyHbN5guJ5DZaq0bWlf+dyX+2CkS4vLp8/0MczFDO+EraDsfZeovoeMOqgX49Tf8E6g==
X-Received: by 2002:a05:6512:2382:b0:4a2:70de:3546 with SMTP id c2-20020a056512238200b004a270de3546mr21326771lfv.420.1670258685066;
        Mon, 05 Dec 2022 08:44:45 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id bu31-20020a056512169f00b00499b27a329esm1328342lfb.300.2022.12.05.08.44.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 08:44:44 -0800 (PST)
Message-ID: <853d49f9-cd97-e8a0-53fd-9f673c2720a1@linaro.org>
Date:   Mon, 5 Dec 2022 18:44:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 10/11] arm64: dts: qcom: sm8350-hdk: Enable display &
 dsi nodes
Content-Language: en-GB
To:     Robert Foss <robert.foss@linaro.org>, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, konrad.dybcio@somainline.org,
        quic_kalyant@quicinc.com, angelogioacchino.delregno@somainline.org,
        loic.poulain@linaro.org, swboyd@chromium.org,
        quic_vpolimer@quicinc.com, vkoul@kernel.org, dianders@chromium.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
        vinod.koul@linaro.org, quic_jesszhan@quicinc.com,
        andersson@kernel.org
References: <20221205163754.221139-1-robert.foss@linaro.org>
 <20221205163754.221139-11-robert.foss@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221205163754.221139-11-robert.foss@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/12/2022 18:37, Robert Foss wrote:
> Enable the display subsystem and the dsi0 output for
> the sm8350-hdk board.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> index e6deb08c6da0..39462c659c58 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> @@ -213,10 +213,32 @@ &cdsp {
>   	firmware-name = "qcom/sm8350/cdsp.mbn";
>   };
>   
> +&dispcc {
> +	status = "okay";
> +};
> +
> +&dsi0 {

Bjorn suggested using mdss_dsi0 / mdss_dsi0_phy labels for DSI host and 
PHY, as it allows us to group them nicely. WDYT?

> +	vdda-supply = <&vreg_l6b_1p2>;
> +	status = "okay";
> +};
> +
> +&dsi0_phy  {
> +	vdds-supply = <&vreg_l5b_0p88>;
> +	status = "okay";
> +};
> +
>   &gpi_dma1 {
>   	status = "okay";
>   };
>   
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_mdp {
> +	status = "okay";
> +};
> +
>   &mpss {
>   	status = "okay";
>   	firmware-name = "qcom/sm8350/modem.mbn";

-- 
With best wishes
Dmitry

