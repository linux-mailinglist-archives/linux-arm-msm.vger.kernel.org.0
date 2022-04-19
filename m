Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1175E506777
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Apr 2022 11:10:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236607AbiDSJNS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Apr 2022 05:13:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235911AbiDSJNP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Apr 2022 05:13:15 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2505C20BD9
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 02:10:32 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id e21so21512489wrc.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 02:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=zF4V/xMqxOt1lzS1W7B1kHA2IPJXPFkf0vVAZ2mtUOI=;
        b=eWXVtgZA+DXI5LtnTRmFH591Bjcrb5vrHiVbW8HPi94dgBRFXPKjOSV9gyPgKRqm52
         rrVlipat7vdond408O5t4VhcN2nPQhhFcZXe2dUFhuvyC5SIV5ByxCO9LoHvOuc/A5QC
         +erFGfnay8ZaZz/QQj4Pqlm5/e0rq543/oAXGambL7Hlvh5Fj4wrl+aQ4+2kuGQhgoYE
         5KGLQALi31ZSh52U7i+orSq01/ZI18TYcR/0o5/Cd65WwNrYPzv74DG/pu07G8hi08/T
         JEu/B/VUKo8ltzPt02H7zx5SBBU7cViBqkWRJuQQrbiu6P9x3aYqHc+OwlgSjKYXvyUT
         axEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=zF4V/xMqxOt1lzS1W7B1kHA2IPJXPFkf0vVAZ2mtUOI=;
        b=Vejk338N5rjTKG3roSVvJe20HnYRhopaM9bN4OfRe5fUAfEK7z0x7HNpKMp7jmuUG0
         QGnBVs1glDZ8eQutHQsz7gNRoca58XaT9D4mG606aWG4RAbhHQJV8Xr8ku4suJj2CAcV
         2bxui6mFi8u6ea3IN1TJk/eTjQqV4fpY7r2GpLhE3D5DSUXgMVayDwXn8FTjV47446aF
         4E62BSqdmQHLthlv4m1GSPQjrcn5d0jmple4tSacyf4DtQjR7WXccJIq/ijKMCeYZ/kx
         aU8U1H//AFoqCFHHb4T8ZhgAdFn4ToIFwuulvVSuPUmohlMJoSYH5itMAhgDpnqOKaZv
         yo1w==
X-Gm-Message-State: AOAM532zfm76nhEcBenVnoN2/0JOD9HndvaUT9JleENfYyooB/7dBeqt
        Ou7RI1utKjZFmPVlGcZMdopprg==
X-Google-Smtp-Source: ABdhPJz2TaXo5HkQRvMqgFpi/YCNwh6ssF0uj1RZEHz7LmaUi64xmuEniT+fhOrhuJs7L2SHUMCbgA==
X-Received: by 2002:a05:6000:15cd:b0:20a:aaf7:33e4 with SMTP id y13-20020a05600015cd00b0020aaaf733e4mr45876wry.406.1650359430725;
        Tue, 19 Apr 2022 02:10:30 -0700 (PDT)
Received: from [192.168.86.34] (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.googlemail.com with ESMTPSA id j18-20020a05600c1c1200b0039297ba9a6dsm4659679wms.26.2022.04.19.02.10.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Apr 2022 02:10:29 -0700 (PDT)
Message-ID: <72ca1cd4-da90-9e4c-b326-46eef2e1cb58@linaro.org>
Date:   Tue, 19 Apr 2022 10:10:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] ASoC: qcom: lpass: Fix apq8016 compat string to match
 yaml
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, robh+dt@kernel.org,
        krzk+dt@kernel.org
Cc:     alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220418230956.3059563-1-bryan.odonoghue@linaro.org>
 <20220418230956.3059563-2-bryan.odonoghue@linaro.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220418230956.3059563-2-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 19/04/2022 00:09, Bryan O'Donoghue wrote:
> The documented yaml compat string for the apq8016 is
> "qcom,apq8016-lpass-cpu" not "qcom,lpass-cpu-apq8016". Looking at the other
> lpass compat strings the general form is "qcom,socnum-lpass-cpu".
> 
> We need to fix both the driver and dts to match.

Fixes tag is missing.

> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


other than that it LGTM.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

--srini

> ---
>   sound/soc/qcom/lpass-apq8016.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/lpass-apq8016.c b/sound/soc/qcom/lpass-apq8016.c
> index 3efa133d1c64..10edc5e9c8ef 100644
> --- a/sound/soc/qcom/lpass-apq8016.c
> +++ b/sound/soc/qcom/lpass-apq8016.c
> @@ -292,7 +292,7 @@ static struct lpass_variant apq8016_data = {
>   };
>   
>   static const struct of_device_id apq8016_lpass_cpu_device_id[] __maybe_unused = {
> -	{ .compatible = "qcom,lpass-cpu-apq8016", .data = &apq8016_data },
> +	{ .compatible = "qcom,apq8016-lpass-cpu", .data = &apq8016_data },
>   	{}
>   };
>   MODULE_DEVICE_TABLE(of, apq8016_lpass_cpu_device_id);
