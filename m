Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA4F26B5C82
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Mar 2023 14:54:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230033AbjCKNyy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Mar 2023 08:54:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230155AbjCKNyw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Mar 2023 08:54:52 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DC9660AB2
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Mar 2023 05:54:49 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id g18so8242932ljl.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Mar 2023 05:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678542887;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b74ndVfU9DxWFOMpu8+kEmW13oESmeqjrw0XEQibqSs=;
        b=mxsdHMyJFU4lKAYB2IXWFoh0qn0l1tdTyHLGMMQ97W5FfXLL8Ph3kwfeQMAbtIrWmV
         4ercVgub8nltJEux8c1cUN9+qeLzKJY2uDghIB/rPndDeVdjtKK6GAv5UWV6MfpS06mb
         o7bm6Y6hhyoIQMSD25gdJ5TnQiB7VQ5qveUERCWvvWmoq5xCHslS3xBCk66VB9qEe/Gt
         efzFMmpKWF7MF/XakGfjauIfkAXh69tNOYjuKtHI87i7iKMf/W1bT2cW6pp68r8QqX85
         1IEZVHSB/temkNgM1sZ7x5qPuvtYyK4SHcNihQNsj7yTmlbXd+pSV8heJnmt41TY2gxb
         VVng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678542887;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b74ndVfU9DxWFOMpu8+kEmW13oESmeqjrw0XEQibqSs=;
        b=a/rC6eDL5iHa3MiMEiNbFOiFM3xoAyTsJkgv+joPx4oxMfmacQMoMtJuxNBh0OWPJU
         4GQEDC+sRY1z2SPD4kLHi4p3m0OmnD7LybiptJzbztQD3O5xigN0YXhmdg7efhKq2j0t
         2glsK5yWPqNXtiGlcyLVni+ZFazOcxAOaWz5tfxqrpdXwuc7eHEEbWEa5N7QSaShUh+s
         4+NZKyjUx2x7izaCPO1UjGc3qDPiFtn8/B0+ICD/au+fNlAPHnphIoQPRIywqBgXVUpx
         wJRUktlr99wcaOIOK7yGsZw1vH8GR5fLxyOX6OWnp1krogSLMQcTtANS65DFY7F5n84u
         eYXA==
X-Gm-Message-State: AO0yUKVCZ5YcU3eUPoGPkO7Prp1I60mkR97gdR1qmbAXaszLWthCINI5
        87Hb5tbz2iuB8jW1wmxF6eyO3A==
X-Google-Smtp-Source: AK7set+vKmwJa5xd+nWrAm+JcbVzMQkVa+4ozTRLniSiTb6/ZKSKjSKxAG9bZrq80QkDUpksWolPig==
X-Received: by 2002:a2e:8558:0:b0:295:965e:8506 with SMTP id u24-20020a2e8558000000b00295965e8506mr8330224ljj.41.1678542887665;
        Sat, 11 Mar 2023 05:54:47 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id t23-20020a2e9557000000b00298798f7e38sm334406ljh.77.2023.03.11.05.54.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Mar 2023 05:54:47 -0800 (PST)
Message-ID: <aec560f9-2a77-9e9a-ac09-8250d28299d4@linaro.org>
Date:   Sat, 11 Mar 2023 15:54:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 3/9] interconnect: qcom: Sort kerneldoc entries
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230228-topic-qos-v7-0-815606092fff@linaro.org>
 <20230228-topic-qos-v7-3-815606092fff@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230228-topic-qos-v7-3-815606092fff@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/03/2023 23:40, Konrad Dybcio wrote:
> Sort the kerneldoc entries the same way the struct members are
> sorted.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/interconnect/qcom/icc-rpm.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

