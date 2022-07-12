Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21D565720A5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jul 2022 18:19:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234298AbiGLQTV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jul 2022 12:19:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234300AbiGLQTT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jul 2022 12:19:19 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 645DCBA393
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 09:19:18 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id o4so11899969wrh.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 09:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=GZfmtwO5xp8XYrI1ZpNa7TvK/ZoGTb9zTcPdC4xJZKg=;
        b=S+7xsgDSShRxdP8JwihIriQtJKhXKxQdsj8gMocDneY+v2SNx0WSxazzcxvgM8LrrH
         E9ZGGk/sZaQDR+ogtXcLke54kE1BtGnbQeZ/D0c0XK/F8MiMaJlQGg73FJ9T3BzrD3jb
         NwZoOIqXV0/MG0XsTwXTykl4DWvaf/VLRNESicOcMr1XUfoPYw4bCxP70Cv8HNflzbvx
         lZ520w2GvzbXt8uY7SkQSZMpI1AdNC5g7fj3hEy5c5gwLp7MkWmFaOM194WieNQeY7UC
         zNejpBCt+301zw1jNbDO172ELzhtuC0sXUGV3LdttxTV/bvTJ8XaADCu4T7ONs1kBPix
         ZfNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GZfmtwO5xp8XYrI1ZpNa7TvK/ZoGTb9zTcPdC4xJZKg=;
        b=0k5aKONaMej6LquDy7Tb2dA+reXmzbWP1C6WI1CJdj9rSvQ5KwfkQpj3fRGiapNNH4
         Y9bAKBxejhJOSftkxaH54UQWZyO2M2Dr23d5rC7TPtEJsQx+x4U3wPQbCC24TUoxpqN6
         UGNliBZHg1OOgmFxhGERyJJRwDs8swSzyO7t7UuT2LCBJnsQEwkEsf0tzNpfbUrWQ07O
         gdHoIpklP9YiICErJJhQteGFea/8j4LPac0XXb4Nmp3Qj6GZ1mgQpRcUnjcAsVjWIw1S
         RTi2nCLIACUTqZ/hCznMfmP3RVXxA+oOq2L7G6mPoJSGRbs2V/UvZFV9gjuCcUT1Rr/c
         5jBA==
X-Gm-Message-State: AJIora/8Mx1ZIbMIJRYfe45Zdcs4E4/wfI/c7NlSeP9PVNlm8VQQSi2V
        D3XPqqRwcEYRfW4cqrnV4xbh7Q==
X-Google-Smtp-Source: AGRyM1spbtpqG/e0M2sYjZXsHKuiLRC7JqJh/x3h1BwkxVt5b+IaK4trUUtqLil+c9aRvJhYSBf39w==
X-Received: by 2002:a5d:4304:0:b0:21b:9b2c:be34 with SMTP id h4-20020a5d4304000000b0021b9b2cbe34mr23544053wrq.577.1657642757017;
        Tue, 12 Jul 2022 09:19:17 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id f19-20020a05600c155300b003a2f2bb72d5sm498565wmg.45.2022.07.12.09.19.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 09:19:16 -0700 (PDT)
Message-ID: <ec9d1ff1-0b74-d2b2-0fcb-5555443c2447@linaro.org>
Date:   Tue, 12 Jul 2022 17:19:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 6/6] clk: qcom: gcc-msm8939: Add missing USB HS system
 clock frequencies
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        bjorn.andersson@linaro.org, agross@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20220712125922.3461675-1-bryan.odonoghue@linaro.org>
 <20220712125922.3461675-7-bryan.odonoghue@linaro.org>
 <72dd6541-a14f-d1d4-97cf-6c05bd4b14c5@somainline.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <72dd6541-a14f-d1d4-97cf-6c05bd4b14c5@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/07/2022 17:18, Konrad Dybcio wrote:
> 
> 
> On 12.07.2022 14:59, Bryan O'Donoghue wrote:
>> The shipped qcom driver defines:
>> static struct clk_freq_tbl ftbl_gcc_usb_hs_system_clk[] = {
>>          F(  57140000,      gpll0_out_main,  14,    0,    0),
>>          F(  80000000,      gpll0_out_main,  10,   0,    0),
>>          F( 100000000,      gpll0_out_main,   8,   0,    0),
>>          F_END
>> };
>> In the upstream code we omit 57.14 MHz and 100 MHz.
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
> Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> 
> Konrad

Thx for the review, appreciated.

---
bod
