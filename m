Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D3CF6FD2B8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 May 2023 00:34:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229773AbjEIWeO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 May 2023 18:34:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229765AbjEIWeN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 May 2023 18:34:13 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B709B272C
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 May 2023 15:34:10 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4f00d41df22so37615561e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 May 2023 15:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683671649; x=1686263649;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ghW5vltMZXjSfeDxEJLxZOUf0D60VisWjpkd71SdvXo=;
        b=q+yGg4d7M1SlrLzdQB+czRHZ45pNL9WHuloHvI6JSRptGyTwbtPaDgdwFrSYttMuhd
         TMTZQhSTFCOKdcEDwRGtQ0kqVUaKTgenN0XVdVgRsgXTKdOhx6VRSyOi22RBu6ppOY3X
         jclo5kl96FZJLwNsLuLVfkmGONMXUyD1UH456soXYFF9SvlB4DHUv6iK4eDPMW7INUvk
         9PJL428UgCm3aA97T44ZFxGiN8PMjD08kwXUQFB3e4i3tMUmVqrFAXsht9ep/DAlP7Oo
         1fFQUcuBb2SDNusZntWDHgjGjYZoyHRrxTGpkNpqX9hBrwkqqAa4whzmaR4ktaUoTd1M
         w2jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683671649; x=1686263649;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ghW5vltMZXjSfeDxEJLxZOUf0D60VisWjpkd71SdvXo=;
        b=O82pQ83SxcgVe3Wyh6m/PpbQIHR6agVUs8PMsQKAbOv4zsnT1qz0giI1Pp3/yQlAa+
         qZrimcugvyVkvqZcCi/yu4dPc/bRw2LR+boxhs5uve9dGkqeABO7emVYS4ydYDZtrZXf
         iQVbEFciFzAyY4EL8p8xcXbbkShPfN9XpGveuk41Ple4yj4b78mTYwj7uS/49wgYx2jF
         VO5gvFvXO9oEwC15Zd/iRTLv2WDPTzMuzDo0E6QiERMj6T0txIHwdmXehcwnUYWgmSmn
         z4sVlG8cjp1K4lXC4cXwZcplKlLjL5Koi3iiuVeHU2m+0Y79qh+uH7FNZh83OzUUaVMK
         6Q4Q==
X-Gm-Message-State: AC+VfDyA0LwyYm3hGsZszoJlUi01CaThMO8h1xbRhUpgb8NL968bf1cp
        DBLyVlOWsSF0eX4JWxgaC24C4g==
X-Google-Smtp-Source: ACHHUZ6HNaO9P9vecPck86yuri45f4VC94oQ4YXOlnDmvG4RjOYcc9dZHkChO70PivZB3n6nntlDpg==
X-Received: by 2002:a05:6512:b95:b0:4f1:4a14:d97c with SMTP id b21-20020a0565120b9500b004f14a14d97cmr1366194lfv.16.1683671649007;
        Tue, 09 May 2023 15:34:09 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
        by smtp.gmail.com with ESMTPSA id c2-20020a197602000000b004d023090504sm483255lff.84.2023.05.09.15.34.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 15:34:08 -0700 (PDT)
Message-ID: <42b9728c-2eba-89bf-d4ff-b9aec5067f84@linaro.org>
Date:   Wed, 10 May 2023 00:34:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] soc: qcom: ocmem: Add OCMEM hardware version print
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Brian Masney <masneyb@onstation.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230509-ocmem-hwver-v1-1-b83ece3f2168@z3ntu.xyz>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230509-ocmem-hwver-v1-1-b83ece3f2168@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 9.05.2023 23:26, Luca Weiss wrote:
> It might be useful to know what hardware version of the OCMEM block the
> SoC contains. Add a debug print for that.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  drivers/soc/qcom/ocmem.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/soc/qcom/ocmem.c b/drivers/soc/qcom/ocmem.c
> index 199fe9872035..aa9b3c2c1322 100644
> --- a/drivers/soc/qcom/ocmem.c
> +++ b/drivers/soc/qcom/ocmem.c
> @@ -355,6 +355,10 @@ static int ocmem_dev_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> +	reg = ocmem_read(ocmem, OCMEM_REG_HW_VERSION);
> +	dev_dbg(dev, "OCMEM hardware version: %ld.%ld.%ld\n",
> +		(reg >> 28) & 0x0F, (reg >> 16) & 0xFFF, reg & 0xFFFF);
Would you mind wrapping this into

#define REG_HW_VERSION_MAJ(ver) FIELD_GET(GENMASK(31, 28), ver)

etc.?

Konrad
> +
>  	reg = ocmem_read(ocmem, OCMEM_REG_HW_PROFILE);
>  	ocmem->num_ports = OCMEM_HW_PROFILE_NUM_PORTS(reg);
>  	ocmem->num_macros = OCMEM_HW_PROFILE_NUM_MACROS(reg);
> 
> ---
> base-commit: ac9a78681b921877518763ba0e89202254349d1b
> change-id: 20230509-ocmem-hwver-99bcb33b028b
> 
> Best regards,
