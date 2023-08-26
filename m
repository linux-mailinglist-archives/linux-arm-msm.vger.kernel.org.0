Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3F99789522
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Aug 2023 11:32:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232221AbjHZJb3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Aug 2023 05:31:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232224AbjHZJbR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Aug 2023 05:31:17 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 961571BCC
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Aug 2023 02:31:14 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-99c136ee106so206013066b.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Aug 2023 02:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693042273; x=1693647073;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EChLnWgFwtxG0VHdbqAfcg52xVSiRBXQV7i6dT2tv7c=;
        b=Yb99bZ4wGZxqk+slRTMR8Dxt/Cyko19x6lyUCAl3+zIEnc1KUf1Kiqm2QjayPyVbN4
         vFeEIVj8PvJaeNk8KyluY1OG0UdplxyS2OaUWME8zIUwL6MCEBkjYXdD2lVJ61fu177L
         Ela/AVLWGDs3XRQIAqU2USlD0wHj6X2rAr/mM3G3nlDznbMtmhVeT0NWxtIyEzhaDBHv
         JvGvjZFQPctFSYnehZ629dyaY+ZwfTFOE5BoJY/ByFUuqw3fURUTzBzgQsdsIqgnlBCd
         KrJDuSoyfKnNR92I3+iVV+ZJezdyj2r7aVk3fs2hs2HXKzEM5+VY9pvbJD62foeBZFF+
         YOvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693042273; x=1693647073;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EChLnWgFwtxG0VHdbqAfcg52xVSiRBXQV7i6dT2tv7c=;
        b=R/dmtA8mYoWLV2eu/m6VrbzZIlvJAbySX9zwxZ8gykIxsEkVD8JkqZWQB/ybntHOQq
         5sUDbrs9mAZHud8ayEtPMoM44Zb6oVWlRK8EZghjhLmfSsnUMIGVMRaPbSnc0NZGjD8+
         twU5zgzm0NKCk4J3qn9G9GQ8dnyMyNWsGw75LRatcuPY+cMSUDpwXKNbNF7cYWQXa3BX
         wEhuytRnKu/uOKqB3NWOpPR+Kyo1O6k4F5PRaHOEzT21tJ3p+GjD6izRlRgO1NI3/Q01
         Ac0iYwaN7sVe8qMw7eVNouqQpmn9Po0sATl16sCrLdUo0E+/rwtgwiXeTo57xfLulzj0
         KC2w==
X-Gm-Message-State: AOJu0YzUvIjCu7oLrN3/Ir+dj0EKH4KkoiPaSwkW8VKTsOccnsaItxXV
        e+0dAWciN4eBIE5MoGJf5N8pfQ==
X-Google-Smtp-Source: AGHT+IFLC+zY307Od3pUJ2Xn6CVOHUDNZckaAlPAclBJHxbKZTsMTGLOoa08s9rJeTyIXzDEwnGoqQ==
X-Received: by 2002:a17:907:2bee:b0:9a1:b950:abab with SMTP id gv46-20020a1709072bee00b009a1b950ababmr9687785ejc.32.1693042273124;
        Sat, 26 Aug 2023 02:31:13 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id ha19-20020a170906a89300b0099c157cba46sm1914658ejb.119.2023.08.26.02.31.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Aug 2023 02:31:12 -0700 (PDT)
Message-ID: <181b5ac9-25c3-539e-6bde-773e833ee9b6@linaro.org>
Date:   Sat, 26 Aug 2023 11:31:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 2/2] ASoC: codecs: lpass-tx-macro: Add SM6115 support
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230825-topic-6115tx-v1-0-ebed201ad54b@linaro.org>
 <20230825-topic-6115tx-v1-2-ebed201ad54b@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230825-topic-6115tx-v1-2-ebed201ad54b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/08/2023 19:23, Konrad Dybcio wrote:
> SM6115 has a TX macro, which surprisingly doesn't host a SWR master.
> Conditionally skip the SWR reset sequence on this platform.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  sound/soc/codecs/lpass-macro-common.h |  2 ++
>  sound/soc/codecs/lpass-tx-macro.c     | 22 +++++++++++++++-------
>  2 files changed, 17 insertions(+), 7 deletions(-)
> 
> diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
> index 4eb886565ea3..d3684c7ab930 100644
> --- a/sound/soc/codecs/lpass-macro-common.h
> +++ b/sound/soc/codecs/lpass-macro-common.h
> @@ -8,6 +8,8 @@
>  
>  /* NPL clock is expected */
>  #define LPASS_MACRO_FLAG_HAS_NPL_CLOCK		BIT(0)
> +/* The soundwire block should be internally reset at probe */
> +#define LPASS_MACRO_FLAG_RESET_SWR		BIT(1)
>  
>  struct lpass_macro {
>  	struct device *macro_pd;
> diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
> index 3e33418898e8..82f9873ffada 100644
> --- a/sound/soc/codecs/lpass-tx-macro.c
> +++ b/sound/soc/codecs/lpass-tx-macro.c
> @@ -2045,15 +2045,19 @@ static int tx_macro_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_fsgen;
>  
> +

Stray link line.

Rest looks good:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

