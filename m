Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DBD4712DB8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 May 2023 21:39:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230327AbjEZTj6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 May 2023 15:39:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229901AbjEZTju (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 May 2023 15:39:50 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04F52A4
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 12:39:48 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4f4b256a0c9so1195855e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 12:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685129986; x=1687721986;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5WI2LTwzJHU557PoCZSLz2JLeX8daKZdszLEHuH3r0E=;
        b=Eo5uxTlt/6W269kAamuYc/3SjguYbwh5M1sJgy4c320v9hHZRg/kgnJ0TUrK6WLz0i
         ayO9E/XVGysp6jY1fUCGmcOHPuTkNP6zqkfqlV5BWyGOmfudoEZKkf5jFoi3Wn/s8WvT
         MGwQ7ltdtLNW0x83zgy1gNu08LY8mfCmta1x+/7XkK1NLvUjrzdqhsXI7XcZsKAaZ5cu
         NxYER1KlzLbyl0mLs66/QsCNs5NUESj3BJIvY6Y7L9uSipohVGQVohnw26BwXKDrTULO
         p7/A+LfQEAq3mjxrEM+KNJ0yq3Uzgj75I89bmtukj24zx1lWgjERCzO66oB+M1h9Pl/A
         lGQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685129986; x=1687721986;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5WI2LTwzJHU557PoCZSLz2JLeX8daKZdszLEHuH3r0E=;
        b=KVS2V+2uMH8hYZMaLepFEKvAVqy3bDj/4TRkv4WgggUOaFwlIXh0CwDgxYSECUorTf
         EELoOafVHGr7yrUr5WIMCVrnD8PuisoMFZPf1LwwA6rRAtoKPaD91KlD7UfvvYiKCP4r
         TEdQR7CuVIjTeoau1w1nKLv/RbDofJCmdi0eSPMrE3WGKDe0DN9DsaM6sHJ9PiXOI9Sk
         NQdy/iQVjei+50rxEuQdLeS+aHP4U5Ts0+Rl6RfoGSU1FdXu20WMBYSYBWHnBJMOKH8R
         OMJXGf9ksR3r8MvlijdoSYWcyCHwhFjtsivyY3Mzs4bg6iZhyz0vTJb/w1z6wyCvtB2x
         cDYA==
X-Gm-Message-State: AC+VfDwDzxflQwwDen36q6OoWnKzTKYHLGriXzHUu97CUa2m71G/4NlC
        THEUG6aRtjLaRxNpqHrukJZeiA==
X-Google-Smtp-Source: ACHHUZ7UJCwOLtq5QxseZ5COplXCOHeuL++AWt2jw96lbOL6anuJG5/xRTT2MrbBWIY9RgnCjvNeoA==
X-Received: by 2002:ac2:4a9a:0:b0:4f4:b3a6:4135 with SMTP id l26-20020ac24a9a000000b004f4b3a64135mr857536lfp.55.1685129986199;
        Fri, 26 May 2023 12:39:46 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id p1-20020a19f001000000b004f1406b059asm747276lfc.219.2023.05.26.12.39.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 12:39:45 -0700 (PDT)
Message-ID: <cac92fae-310f-79b1-7204-ac9deb2c3319@linaro.org>
Date:   Fri, 26 May 2023 21:39:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] soc: qcom: ocmem: Add OCMEM hardware version print
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Brian Masney <masneyb@onstation.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230509-ocmem-hwver-v2-1-8c8793a07dfc@z3ntu.xyz>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230509-ocmem-hwver-v2-1-8c8793a07dfc@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 23.05.2023 22:32, Luca Weiss wrote:
> It might be useful to know what hardware version of the OCMEM block the
> SoC contains. Add a debug print for that.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
> This patch is depends on [0] but could also be applied in the other
> order, if conflicts are resolved.
> 
> [0] https://lore.kernel.org/linux-arm-msm/20230506-msm8226-ocmem-v1-1-3e24e2724f01@z3ntu.xyz/
> ---
> Changes in v2:
> - Use FIELD_GET macros for getting correct bits from register (take
>   wording from mdp5: major, minor, step which hopefully is sort of
>   accurate)
Qualcomm uses that (or that-ish) nomenclature for many hw blocks, so
it's likely spot on.

> - Link to v1: https://lore.kernel.org/r/20230509-ocmem-hwver-v1-1-b83ece3f2168@z3ntu.xyz
> ---
>  drivers/soc/qcom/ocmem.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/soc/qcom/ocmem.c b/drivers/soc/qcom/ocmem.c
> index c3e78411c637..9f7c3348cbb9 100644
> --- a/drivers/soc/qcom/ocmem.c
> +++ b/drivers/soc/qcom/ocmem.c
> @@ -76,6 +76,10 @@ struct ocmem {
>  #define OCMEM_REG_GFX_MPU_START			0x00001004
>  #define OCMEM_REG_GFX_MPU_END			0x00001008
>  
> +#define OCMEM_HW_VERSION_MAJOR(val)		FIELD_GET(GENMASK(31, 28), val)
> +#define OCMEM_HW_VERSION_MINOR(val)		FIELD_GET(GENMASK(27, 16), val)
> +#define OCMEM_HW_VERSION_STEP(val)		FIELD_GET(GENMASK(15, 0), val)
> +
>  #define OCMEM_HW_PROFILE_NUM_PORTS(val)		FIELD_GET(0x0000000f, (val))
>  #define OCMEM_HW_PROFILE_NUM_MACROS(val)	FIELD_GET(0x00003f00, (val))
>  
> @@ -355,6 +359,11 @@ static int ocmem_dev_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> +	reg = ocmem_read(ocmem, OCMEM_REG_HW_VERSION);
> +	dev_dbg(dev, "OCMEM hardware version: %ld.%ld.%ld\n",
reg is an unsigned long (u32), this should probably be %u

> +		OCMEM_HW_VERSION_MAJOR(reg), OCMEM_HW_VERSION_MINOR(reg),
> +		OCMEM_HW_VERSION_STEP(reg));
Nit: one per line would make this the tiniest bit easier to read

Konrad
> +
>  	reg = ocmem_read(ocmem, OCMEM_REG_HW_PROFILE);
>  	ocmem->num_ports = OCMEM_HW_PROFILE_NUM_PORTS(reg);
>  	ocmem->num_macros = OCMEM_HW_PROFILE_NUM_MACROS(reg);
> 
> ---
> base-commit: 8705151771af822ac794b44504cd72eebc423499
> change-id: 20230509-ocmem-hwver-99bcb33b028b
> 
> Best regards,
