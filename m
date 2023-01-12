Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DF9E66784B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jan 2023 15:57:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240234AbjALO5Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Jan 2023 09:57:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239778AbjALO4K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Jan 2023 09:56:10 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0EFF3D5DF
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 06:43:20 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id v25so28692351lfe.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 06:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+SachbnsjogB9d6VznmJ7gd3XdXdQ4weNjS4U9PfSA0=;
        b=lHbyQy+FNSi/meLPTdjOq7NTzEMuxLi4iUUn3c+/PXWcgaHj7llhT0nJmhX86Z+TCo
         GHuvV9WZZbZ1pRpdUsPw37NBE9xIQJwQWYovvGpaR42pZ+13ZKNrUe38ZtvJNylJwG4B
         wJBmA+2m7ENe2ZClbpg98qYjd5mcu4OrW2270zoB3PIvBmrIPekzEwRO8vGqdtKYp6Z4
         kLy8dRkMiNWsj4B0D016+3koH9l4hlJ5vvvxNscIMUIOoj0uN7TbOGNHrYFrZwejFzUg
         Yq1wrSNxKRYxjzKVAHRdDS+wYUvUNpZZaEixbdR7kSyqEP3XldD1p4vek/ifeUbKZf3Q
         1i7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+SachbnsjogB9d6VznmJ7gd3XdXdQ4weNjS4U9PfSA0=;
        b=3FwliKilY7sUN1A8MGx5Ax1bePWbubqSAfuXuYodu3MGX4/PNKsfkuUIbkSso9/CrJ
         oJXLoCl846gls0a3QexThGmJoUZ1pj3ifaos4OTC+/QSp9LL28EnXsjFOM+80w4DjVmE
         MaJtAna2EScC7YzSB9AYL9NwdeSFxpO0AonoJQpf233dX7J/yTI9Op1VvNyzidYamsXF
         9VzdMaxlqaUph/FflQUjJvXur5YbbssoWFJHk5hTM8RGKZNRZ2Bd1Kr0w+xCq9SU1UMT
         TbU7X1JXmJr0YqdQxLCdsabG3NfV/paELLpqqb+0bvqIF3JZj4+5NWDlQ+B3ai/MdGUX
         /hfg==
X-Gm-Message-State: AFqh2koX8Xj+E7+4I5lt2zfuyocR0iPFVutfh+5gflmeRsZDyebyQUko
        W575CnE6wr00jkjCU/+cTR7J6A==
X-Google-Smtp-Source: AMrXdXteBrqUViDjNqvb+oHsCd44njBcMUd77PqwBIZ1I35b614s1q1vnnGbjk9VCt7bz0X5c6TFnQ==
X-Received: by 2002:ac2:5082:0:b0:4c8:eceb:60d2 with SMTP id f2-20020ac25082000000b004c8eceb60d2mr19894251lfm.46.1673534599069;
        Thu, 12 Jan 2023 06:43:19 -0800 (PST)
Received: from [192.168.1.101] (abym53.neoplus.adsl.tpnet.pl. [83.9.32.53])
        by smtp.gmail.com with ESMTPSA id p7-20020ac24ec7000000b004b587e37265sm3299527lfr.58.2023.01.12.06.43.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 06:43:15 -0800 (PST)
Message-ID: <eb1418f6-43be-6b0e-555c-dd9887577b95@linaro.org>
Date:   Thu, 12 Jan 2023 15:43:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp-crd: allow vreg_l3b to be
 disabled
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230112074503.12185-1-johan+linaro@kernel.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230112074503.12185-1-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 12.01.2023 08:45, Johan Hovold wrote:
> The vreg_l3b supply is used by the eDP, UFS and USB1 PHYs which are now
> described by the devicetree so that the regulator no longer needs to be
> marked always-on.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sc8280xp-crd.dts | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
> index db12d8678861..e5e75cc2c670 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
> @@ -150,7 +150,6 @@ vreg_l3b: ldo3 {
>  			regulator-max-microvolt = <1200000>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  			regulator-boot-on;
> -			regulator-always-on;
>  		};
>  
>  		vreg_l4b: ldo4 {
