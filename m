Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDAA13A4182
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jun 2021 13:55:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230129AbhFKL5s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Jun 2021 07:57:48 -0400
Received: from mail-qv1-f47.google.com ([209.85.219.47]:43978 "EHLO
        mail-qv1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229824AbhFKL5s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Jun 2021 07:57:48 -0400
Received: by mail-qv1-f47.google.com with SMTP id e18so16336253qvm.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jun 2021 04:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=eUttRMHttOnDA7jK+Bhgw9VuVSK/sEPVdIVgBgNsUfs=;
        b=zmy+/sV0dMH5LMwC+7d9/al0x8cE++ECq+h/bjqm4xcyzk9G6t/NCaCwdSUBUHasYM
         eO9rQ8aEVtodfxoKOF4KByhJPY9kICmY8HE6JZ4uIO1u0rok7NIO1v3Z9kZhx4a9RJwZ
         vuSddBMUJIOYQomd8/RXY08TXJIT6QAkqTsdckp16Y4T3hWigoO6BMss0goRfoX7aSLF
         8ZNgu1F3hUs92PhyPmaP8P0igPjQo/RqCMM02gybNXsIttUsHorEctPS3kt8D5/rlHZs
         iAHSjhG5L1ciXEARjS5UkjLeusSQIhU2EPt8js2uYU0Cae4lRdHMKy1MB+4f7GB5FSPh
         ON7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eUttRMHttOnDA7jK+Bhgw9VuVSK/sEPVdIVgBgNsUfs=;
        b=CPuSPxaqij+ePqypgR4eLB0rnlW6Ot9/NPzZXIaseFkx6yA6joprtmB+DFaF2Pqn+v
         C3pGSq0NMEf7dlhI1pZUjLwpqJHoSOxmHl/aS4rVG6d/Npfl/06/e3r8VtJlGEzsEV0q
         73mCxFYav+a2sYNc306bUCZWKs1s4sKFxt758mtBbg9MSl5xYnDCrs3tsS17Nm15PGqo
         vqBHqxeUlRSZEYS984owGC7aqdVun/wJJ+Nt/sibYnIm/NV3MuaB9Qv+jf/D/h3yIJlq
         pVROpScBr4YHcMCxSGBvsc2o8m3FVNXQ7DNZ03WAvkxFScP6+TSOVsj2ozy78lApSQGH
         Lycg==
X-Gm-Message-State: AOAM533smxfOfmm6t1BmL88ARoBhU3dquUGwt20ACYbzDRSIuQXTglMb
        VB8tZ0yL8/zVwKx0Q4QwNlZqEw==
X-Google-Smtp-Source: ABdhPJxSJd0To5ubHPmvv8nls7Sz7oTekBM+Y1G8i0qDOWkUIQmLdwfCWQUFmZM7z25U08+qoWJ8Iw==
X-Received: by 2002:ad4:4502:: with SMTP id k2mr4275389qvu.43.1623412480697;
        Fri, 11 Jun 2021 04:54:40 -0700 (PDT)
Received: from [192.168.1.93] (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.gmail.com with ESMTPSA id 137sm4220780qko.29.2021.06.11.04.54.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jun 2021 04:54:40 -0700 (PDT)
Subject: Re: [PATCH] dt-bindings: thermal: tsens: Add sc8180x compatible
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210608201638.2136344-1-bjorn.andersson@linaro.org>
From:   Thara Gopinath <thara.gopinath@linaro.org>
Message-ID: <22fdd7f8-87c1-6a0e-1fc6-8d7536d634a8@linaro.org>
Date:   Fri, 11 Jun 2021 07:54:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210608201638.2136344-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 6/8/21 4:16 PM, Bjorn Andersson wrote:
> The Qualcomm sc8180x platform has the usual tsens blocks, add compatible
> for this.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Acked-by: Thara Gopinath <thara.gopinath@linaro.org>


-- 
Warm Regards
Thara

> ---
>   Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> index 0242fd91b622..fdd7c361104f 100644
> --- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> +++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> @@ -46,6 +46,7 @@ properties:
>                 - qcom,msm8996-tsens
>                 - qcom,msm8998-tsens
>                 - qcom,sc7180-tsens
> +              - qcom,sc8180x-tsens
>                 - qcom,sdm845-tsens
>                 - qcom,sm8150-tsens
>                 - qcom,sm8250-tsens
> 

