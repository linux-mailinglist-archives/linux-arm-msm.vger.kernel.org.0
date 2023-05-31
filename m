Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D26257187FD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 May 2023 19:04:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229998AbjEaRE0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 May 2023 13:04:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230013AbjEaREX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 May 2023 13:04:23 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 949F018C
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 10:03:51 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-96fab30d1e1so261165066b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 10:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685552629; x=1688144629;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YxmvDpJYUdffmb0V6uJ0fpJ/hgXHjpSHqBRoztQ0WkQ=;
        b=JklNbWZazijUV2L6RdTj/7zJadOK4lrHnorxbkMSWOpJ/jWr7DtE/6kPj/npo7mHsc
         3Z4OvWNmO2jtLr0HsLGPfdtEy6faAUdyqlMMwhvf6l/y/s63iJkFAVybKHc7iTm0QB7d
         daMgu1BJIWo6L0m8VLRGXw34RdAMXSvetpgE/6qkd27U4YsxXoVD0q/jN2IUrdbsHgLw
         1mhQLR82gKVpF7LFhboSriCgYfaLTgA+UI/Z6m4olA6XztAREvCJZZIvERzmC78XA3DL
         6Bs6mxm1NA8NYfWB4U6zy1SwDEBYlwerxqpq8e/ZRS5/tjh9SmPPKZBsKfJ+iamBLfNv
         zs6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685552629; x=1688144629;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YxmvDpJYUdffmb0V6uJ0fpJ/hgXHjpSHqBRoztQ0WkQ=;
        b=gbHy9kwCziEuh5Q7R4pTsLH6hsTDfHQOaH7/+y8JpbBddSxMtlJdpkxM6hqPU/L7aS
         0jnip1Rb/lpD/bgKS1aUejTiXlAa1GGh8/Ut/Q9qki/PNrFPQ2qa75SxO1TewsKZADbB
         +gGu/pvF1kqK6t1TFDm2N+AVoKzc0RGNWFNSjX3cXI3A/O+5p6ZCq2H9j/edvATd7b3F
         3LZr7qpS1bdpBRcfJZIB9GkjNn3VaDClC7pOn/oko8NMW0YLR4PHTevw1b/IhbULAB7c
         lihxrWxfou4kgJo0kAGJlqqd0euODEOdejorSVHaed9t4vp3zfzshuWAAYGUzkmM2zhS
         LqVQ==
X-Gm-Message-State: AC+VfDyDWLzHb+HoapSD6n5U/QLAsv/qK7pWu6sXQrXUfBbPp5tgrSrj
        ZgjJZ20u0bsenmP7AwctH7zmeg==
X-Google-Smtp-Source: ACHHUZ49Q5wyYj15P1zTnwIqi/rsMY9O0HM3ANiPSR/k08b0Ml3MfHXIqro31/IYBCXEv3UrYOk7gg==
X-Received: by 2002:a17:907:720c:b0:965:ae3a:52c8 with SMTP id dr12-20020a170907720c00b00965ae3a52c8mr13688894ejc.32.1685552629017;
        Wed, 31 May 2023 10:03:49 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id sa24-20020a170906edb800b0096595cc0810sm9256921ejb.72.2023.05.31.10.03.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 10:03:48 -0700 (PDT)
Message-ID: <693a36cf-e9d5-a6f1-3953-3a7c7567a754@linaro.org>
Date:   Wed, 31 May 2023 19:03:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] soc: qcom: icc-bwmon: Fix MSM8998 count unit
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230531-topic-msm8998-bwmon-v1-1-454f9d550ee5@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230531-topic-msm8998-bwmon-v1-1-454f9d550ee5@linaro.org>
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

On 31/05/2023 18:33, Konrad Dybcio wrote:
> MSM8998's BWMON counts in megabytes. Fix it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/soc/qcom/icc-bwmon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

If this is
https://lore.kernel.org/all/33c61f23-6442-6d9b-492f-dd6e9c64a8c1@quicinc.com/
(and QLT 1872) then add reported-by tag.

Change seems logical, although not really documented (a bit
contradictory information for sdm845), so assuming this was really tested:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

