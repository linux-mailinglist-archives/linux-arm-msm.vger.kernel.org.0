Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD5DC659A66
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Dec 2022 17:10:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231474AbiL3QKZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Dec 2022 11:10:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229746AbiL3QKX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Dec 2022 11:10:23 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D3F61BEA0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Dec 2022 08:10:22 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id bp15so32249628lfb.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Dec 2022 08:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7VpJq3uaQ6VSJbXoQmKZPgl7VgJ9y1FhwzpD47l7pvg=;
        b=PNDQXlY9X0Hd72HAFMeIHDHE6+sS8CQHIpzf8ZXYIZKGTGCbYCoVPAzOFvUcqza6Z4
         y702O9KuZMyH43HsAUOwEienG9YdpZUrmlHfcKE2FNh0LF1U31wp1qGAyvgM/AaPfHon
         2uPBS96XOxmRILId/f7fzKBJ5/sxOWTlcSWynziJefvXNVF41ZotLGsywCJKDO4Lb6mm
         veXmoJw483pUePpvkCXRfmeT44hsI6ckhXPx85Z0t01MtGDVUjI0jwvTSbOYq6/9DqUG
         bK/4SdJp1x8u7WzgA+/CMwqXw5ej6C+XwzIDKh8XRjgyVrvY86vte8bu9gcvZ1wzBVJy
         AZjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7VpJq3uaQ6VSJbXoQmKZPgl7VgJ9y1FhwzpD47l7pvg=;
        b=oBL/f6FZTumjumKcPY0/tdIbLDzk6cDqzyyMUClfCGOFGlZp4iGMkWzAy2xjfa0Mt/
         Qb4DjhO36vuyP+8dVvHrzgnEzISieEDg/R+0mMOMxjKh75Nk3KQRi2SBHuc3a/0OyRAT
         wjeeKaTaeTtqm98keUYF9GkVZSePTaNYTiCSGVz+a7w4jwwkxoqaHhRcmFXM8v2NjD1D
         Oa0ltlTuC+YNlHv3lUGpSFBflbg/spIq/lduuLCATSXaTmIDILM9n1bmtRatH3aSDBV4
         BGLoYu6HuxPxI2CjR/DgNw29kx+Zmr6ZaDmH48pMm/phoSHAXe4blJgtnwQhErZKx0X4
         7gGw==
X-Gm-Message-State: AFqh2kplyClVFopqhGl52RydU80flcBaf4v9FDgBvZOZZsCUHngl7FrI
        WSfOtfUuzESXONcfuU0EXWri1Q==
X-Google-Smtp-Source: AMrXdXsDKIiMJXFKJxuCcmocpg4ulyZr2lszHJLW+UVp83brU2ok80VlZpbYNRKg95MOqvX87HQWvQ==
X-Received: by 2002:ac2:59c9:0:b0:4c4:6a8e:24 with SMTP id x9-20020ac259c9000000b004c46a8e0024mr9537798lfn.5.1672416620742;
        Fri, 30 Dec 2022 08:10:20 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id u13-20020a2e9f0d000000b0027fe42c38f7sm120950ljk.134.2022.12.30.08.10.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Dec 2022 08:10:20 -0800 (PST)
Message-ID: <99f07cb2-b299-f4ac-f479-177090a2c541@linaro.org>
Date:   Fri, 30 Dec 2022 17:10:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm8250: Sort audio hw nodes
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221230135044.287874-1-konrad.dybcio@linaro.org>
 <20221230135044.287874-3-konrad.dybcio@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221230135044.287874-3-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/12/2022 14:50, Konrad Dybcio wrote:
> Half of the audio hardware nodes were not sorted properly. Fix that.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---


Just a note:

> +		wsamacro: codec@3240000 {
> +			compatible = "qcom,sm8250-lpass-wsa-macro";
> +			reg = <0 0x03240000 0 0x1000>;
> +			clocks = <&audiocc LPASS_CDC_WSA_MCLK>,
> +				 <&audiocc LPASS_CDC_WSA_NPL>,
> +				 <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +				 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +				 <&aoncc LPASS_CDC_VA_MCLK>,
> +				 <&vamacro>;
> +			clock-names = "mclk",
> +				      "npl",
> +				      "macro",
> +				      "dcodec",
> +				      "va",
> +				      "fsgen";
> +
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&wsa_swr_active>;
> +
> +			#clock-cells = <0>;
> +			clock-frequency = <9600000>;

This will conflict:
https://lore.kernel.org/all/20221224154255.43499-3-krzysztof.kozlowski@linaro.org/

https://lore.kernel.org/all/20221225115844.55126-3-krzysztof.kozlowski@linaro.org/

Best regards,
Krzysztof

