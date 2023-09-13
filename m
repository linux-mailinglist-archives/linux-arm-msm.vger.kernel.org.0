Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17B9679F210
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Sep 2023 21:31:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231172AbjIMTbd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Sep 2023 15:31:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232199AbjIMTbc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Sep 2023 15:31:32 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5725C1999
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Sep 2023 12:31:28 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-9ada2e6e75fso27071966b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Sep 2023 12:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694633487; x=1695238287; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6t/segHl62cG0tgDfHwNZNVnZ9A89vMExRnBSpVNx4M=;
        b=mb8f6xPQYyBy+KDbOpKDNuR0cj5OuclmA5Xmhe7TDw3kzy40vhxxpdNf7tAzhtk2t0
         vtG4lUxJRPrxDfkOriYQObaVjqDtlpjgxpopxdN3XBK4ujZS9ELDm9fo2KGeBFwBYxz9
         jJ4+afTPeVm+rnuq+oGK/PKZTbaeDRyR6QyRtQFkOx+hNFOifimiau2t5VyRM2poNQUm
         XBetFwfpbOZjOqT0z8OEIB3DZo9rXLvH4atutSw+pRaKpU7fibq4uDxxCDY7ghjVzk/H
         eC7/qM3Reum3/7jmjgANGHVAeuDtLcfgqPE82/x3J/HFkVOQU5VgchC9Hq5BiZ2oMyOM
         ocWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694633487; x=1695238287;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6t/segHl62cG0tgDfHwNZNVnZ9A89vMExRnBSpVNx4M=;
        b=bLAg4kd5VA3th9FiZRyV2wgo/rvdac2smmpylcK/iAJT0S8pHxMfEoG30uZOvDpdLx
         /Ap1eX8hqOpv097kXbw7AP7xu2q+hL868GS8vdV8me9P1A1k/kmoeFpT49XJirmfx5wb
         3X1lBaxF8P9r7aWSrkcsWCHGTKM+J7Sm/RScBaIbsT/GLX7f3T6i47NAJWhuz20t2ldu
         0auJtyFGldmQ3cBSf+UBjytM0Jn0i0fBUMJ9QUx2JhS1dWFihi++tlx8KhM63zb0l6at
         Gxm/B7vc+gHVwPabkmRLy57ZnDC83RAoeQpktrHn3WjS4snEO2fmHn92o+nxNFF4vhJR
         RaiA==
X-Gm-Message-State: AOJu0Yw3xxXJMohDAjrcW2FLzvNbIl7RTVfskXn2nehJ23FF4QUlsNUx
        hqs/pSUapCkBT15Xvs2/H9iyvut0xbdNrRbFExErNw==
X-Google-Smtp-Source: AGHT+IHEROrTYoS6x/KY+dvBnwl/TmbwAYJz+XmpnGflks2i5L/tczqqyom6qBDab3VbsAyc9juI/w==
X-Received: by 2002:a17:906:4c1:b0:9aa:1020:8c36 with SMTP id g1-20020a17090604c100b009aa10208c36mr2982793eja.27.1694633486721;
        Wed, 13 Sep 2023 12:31:26 -0700 (PDT)
Received: from [192.168.37.232] (178235177172.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.172])
        by smtp.gmail.com with ESMTPSA id v14-20020a17090690ce00b0099c53c44083sm8840393ejw.79.2023.09.13.12.31.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 12:31:25 -0700 (PDT)
Message-ID: <750065d1-dc87-4b1b-8540-059526623bdd@linaro.org>
Date:   Wed, 13 Sep 2023 21:31:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: pm8150l: Add wled node
Content-Language: en-US
To:     Danila Tikhonov <danila@jiaxyga.com>, agross@kernel.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230913185514.21840-1-danila@jiaxyga.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20230913185514.21840-1-danila@jiaxyga.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13.09.2023 20:55, Danila Tikhonov wrote:
> WLED is used for controlling the backlight on some boards, add the node
> for it.
> 
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---
>  arch/arm64/boot/dts/qcom/pm8150l.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm8150l.dtsi b/arch/arm64/boot/dts/qcom/pm8150l.dtsi
> index b1686e5777b8..ac08a09c64c2 100644
> --- a/arch/arm64/boot/dts/qcom/pm8150l.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8150l.dtsi
> @@ -132,5 +132,15 @@ pm8150l_lpg: pwm {
>  			status = "disabled";
>  		};
>  
> +		pm8150l_wled: leds@d800 {
> +			compatible = "qcom,pm8150l-wled";
> +			reg = <0xd800>, <0xd900>;
> +			interrupts = <0x5 0xd8 0x1 IRQ_TYPE_EDGE_RISING>,
> +				     <0x5 0xd8 0x2 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "ovp", "short";
Could somebody confirm the second irq? It looks sane when
checking out similar blocks on older gens, but I have no
reference to confirm it's there on this one.

Konrad
