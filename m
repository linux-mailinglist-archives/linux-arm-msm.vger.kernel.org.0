Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 049147449FC
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Jul 2023 16:42:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230026AbjGAOmF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 1 Jul 2023 10:42:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229559AbjGAOmE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 1 Jul 2023 10:42:04 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E5EA35AB
        for <linux-arm-msm@vger.kernel.org>; Sat,  1 Jul 2023 07:42:03 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b69ea3b29fso47135761fa.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Jul 2023 07:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688222522; x=1690814522;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BXnw/FEpPPpZ+WG4ZVob38IzcodUEaUVz8j/V8IP3fU=;
        b=EFLeI3PJZGpGQqlzawDupl04jL4AqEfMYNSBPa9G6ZoTmxnVbQFf5bhfUYdwdYSB45
         OZIjbKBhe9focaUCsALj7DjgvvLrBPbsV2IJV6nOaqO6riOEd2TVktjYb/P0arrBmgUb
         KpnsGzupfQaUcgD9TGykQUrwZ/XvcXun/7GMn2IBCbZOHAHgJyvLdCqm4q//eFtlgJMe
         PqRvP//yXPHazOav8hFEUSUdGFMd4IHLjHpAYMX7bHh4YRT6KymSCnoXXHYOqAoc4NQP
         1BgawP0FLeWVjogQje8c/+ueSQF10FXyWSHMkW3ssrcvT3M/s1t+/JuZOX/21KI7dZZb
         gYzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688222522; x=1690814522;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BXnw/FEpPPpZ+WG4ZVob38IzcodUEaUVz8j/V8IP3fU=;
        b=k+PjLARAzc7BX02oB9hgiToZv+/zkzwitxh3hfG/m499PO6ZfJUrFcsYEu5zzC8IXc
         exsJmFhLOyUPpyGjCCMuGCHRb1WKgpA4NFYznL9E90hZJQHLPGJyBNNVjH/0oj/yo8Ni
         kholNtp+d4SQiqS+SRE66gorW5HOMW0CyaQPKEnI60gNX7WM65wS/1NSLjjtLuZcaYtJ
         HbvS6K6Gsmpljy/fOirEJ1mb5f5ZenEzWIApgkWX8kMiCxM7wq1G36vLgC4XoaOHOq44
         6+QnUBjQUbVCN++3u32ESwkAgee7g4joiu0B39Zv30gRzkq9P8J8ss3/n4OqDOYk/BVv
         e9HA==
X-Gm-Message-State: ABy/qLanXQroSG4SG9REb76XhKCDyN4ZnOKmK7swYE8h/uBTIw//LS0V
        NQgFWCgV8drKeXaOvadZ7B4Brw==
X-Google-Smtp-Source: APBJJlFgxcpnuG9pkZhBLIAnPiRu5vZzw3WH4/SWTKfNj2SJgXp0DmGQyw1cH/Pa56vLVz7wyMBM2Q==
X-Received: by 2002:a05:6512:15a8:b0:4fb:7933:dd4f with SMTP id bp40-20020a05651215a800b004fb7933dd4fmr5371505lfb.56.1688222521704;
        Sat, 01 Jul 2023 07:42:01 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
        by smtp.gmail.com with ESMTPSA id 20-20020ac24834000000b004f60f2979e6sm3413409lft.83.2023.07.01.07.42.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Jul 2023 07:42:01 -0700 (PDT)
Message-ID: <cd7b98b9-7a32-72f5-3997-6c332c295067@linaro.org>
Date:   Sat, 1 Jul 2023 16:41:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] clk: qcom: gcc-sm7150: Add CLK_OPS_PARENT_ENABLE to sdcc2
 rcg
Content-Language: en-US
To:     Danila Tikhonov <danila@jiaxyga.com>, agross@kernel.org,
        andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        davidwronek@gmail.com
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230630191944.20282-1-danila@jiaxyga.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230630191944.20282-1-danila@jiaxyga.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30.06.2023 21:19, Danila Tikhonov wrote:
> Set .flags = CLK_OPS_PARENT_ENABLE to fix "gcc_sdcc2_apps_clk_src: rcg
> didn't update its configuration" error.
> 
> Fixes: a808d58ddf29 ("clk: qcom: Add Global Clock Controller (GCC) driver for SM7150")
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/clk/qcom/gcc-sm7150.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/qcom/gcc-sm7150.c b/drivers/clk/qcom/gcc-sm7150.c
> index 6b628178f62c..6da87f0436d0 100644
> --- a/drivers/clk/qcom/gcc-sm7150.c
> +++ b/drivers/clk/qcom/gcc-sm7150.c
> @@ -739,6 +739,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
>  		.parent_data = gcc_parent_data_6,
>  		.num_parents = ARRAY_SIZE(gcc_parent_data_6),
>  		.ops = &clk_rcg2_floor_ops,
> +		.flags = CLK_OPS_PARENT_ENABLE,
>  	},
>  };
>  
