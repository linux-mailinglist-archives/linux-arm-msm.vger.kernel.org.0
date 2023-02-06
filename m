Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D02E68BF1E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Feb 2023 15:00:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230059AbjBFOAX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Feb 2023 09:00:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230076AbjBFN7m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Feb 2023 08:59:42 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 876BB11EBC
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Feb 2023 05:59:06 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id m16-20020a05600c3b1000b003dc4050c94aso8857562wms.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Feb 2023 05:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kmZDJq0SVi7o7GpUbRWGne1AHgVWFMKAaDLTM0ZOuQY=;
        b=GKAlZbdZ5o8dd4xNv5sQhEUmXw46o/8ZihIJSG+EbKM3a1yBlxoXMogJ+ZJ+LDamZH
         sI3SfqfMQbpkwHyP82X8s+hvqDFfF0IZ179Egm2OUKo8QPf1duVvP/IHvTNgFHdHYuh8
         oGN4a7V6c8x/vi6kSKuBRuVvYkObxNWVglI8p9cqGe2skS5+SYX/VafotK1NtWxjEL6U
         i4WBs2cdveHO6Rn+9udeBrowwEZeI6g0eGIobja1seZWxEaN0z/lTNbnIN9IBq93yo6r
         CVigonBy0dhds6lfgagMtvPe0Gj9NbxVAMk9hPSGEtgsZIsl3snU/H5TOV/YPfpApKFW
         3QeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kmZDJq0SVi7o7GpUbRWGne1AHgVWFMKAaDLTM0ZOuQY=;
        b=e1MkKSlRkfJV0jI1TEbEUTtAaC9V/GYzok3eF+02EsufaWratUz2PGsic/2R9yd8O1
         DuQlrI1CwzLoTYRNKeOigYw/niM3maRFXv2MiQ0/XABYKU34ojCTO8pEnaj7Lya3dna/
         fQ+ZHw6IGWFfmyZ1l92+YJCqxejckKaEeqZBIBfk9lo8wYhj4dpsd9sZd5cfOT0JMSZc
         O1uPQCIEaVUSUEkXzBlA53hYpuHiYwYJceUKg1M5vTBlzTPPgx7bf4EVBL0Dhsk9fJD2
         HW4qnrWji7iGMwsRh/FO6PrMAyeTfk0+vPBd2+upq3YQgw0+D8PtmNHA5ElcRkkWsg22
         LWhw==
X-Gm-Message-State: AO0yUKX0nBNNjq1ci63NukBzRkx5yQ8sFEAxfGl5ubAgFCU4RughT7Nk
        j5FTNaW4gEau1T2WzFQDsON5og==
X-Google-Smtp-Source: AK7set/Iam36gM+BJU/GVk2rHJ/ucybrKhiA43okIGYj6Q2JzX3C/6LFMAyW+tNoFA0LvDZUsSVYCg==
X-Received: by 2002:a05:600c:310b:b0:3df:e730:42fc with SMTP id g11-20020a05600c310b00b003dfe73042fcmr7977884wmo.13.1675691945108;
        Mon, 06 Feb 2023 05:59:05 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:f03f:3ced:a369:d884? ([2a01:e0a:982:cbb0:f03f:3ced:a369:d884])
        by smtp.gmail.com with ESMTPSA id o14-20020a05600c4fce00b003dc1a525f22sm11603244wmq.25.2023.02.06.05.59.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 05:59:04 -0800 (PST)
Message-ID: <89d74151-08b1-74b2-455a-ddb3db6cc4cf@linaro.org>
Date:   Mon, 6 Feb 2023 14:59:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] remoteproc: qcom_q6v5_pas: enable sm8550 adsp & cdsp
 autoboot
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230206-topic-sm8550-upstream-fix-remoteproc-autoboot-v1-1-11445a0c27c6@linaro.org>
 <48ac2e20-d80c-c842-3766-b5df30053270@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <48ac2e20-d80c-c842-3766-b5df30053270@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/02/2023 14:54, Konrad Dybcio wrote:
> 
> 
> On 6.02.2023 14:53, Neil Armstrong wrote:
>> Set the SM8550 adsp & cdsp auto_boot to true to match the behavior
>> of the previous platforms.
>>
>> Fixes: 7eddedc97563 ("remoteproc: qcom_q6v5_pas: add sm8550 adsp, cdsp & mpss compatible & data")
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> Konrad
>>   drivers/remoteproc/qcom_q6v5_pas.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
>> index 4e1d9b08def4..90c5612a3045 100644
>> --- a/drivers/remoteproc/qcom_q6v5_pas.c
>> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
>> @@ -1108,7 +1108,7 @@ static const struct adsp_data sm8550_adsp_resource = {
>>   	.pas_id = 1,
>>   	.dtb_pas_id = 0x24,
>>   	.minidump_id = 5,
>> -	.auto_boot = false,
>> +	.auto_boot = true,
>>   	.proxy_pd_names = (char*[]){
>>   		"lcx",
>>   		"lmx",
>> @@ -1127,7 +1127,7 @@ static const struct adsp_data sm8550_cdsp_resource = {
>>   	.pas_id = 18,
>>   	.dtb_pas_id = 0x25,
>>   	.minidump_id = 7,
>> -	.auto_boot = false,
>> +	.auto_boot = true,
>>   	.proxy_pd_names = (char*[]){
>>   		"cx",
>>   		"mxc",
>>
>> ---
>> base-commit: ea4dabbb4ad7eb52632a2ca0b8f89f0ea7c55dcf
>> change-id: 20230206-topic-sm8550-upstream-fix-remoteproc-autoboot-5c7effcf197c
> P.S not sure if you wanted to send that to lkml

It's part of what b4 sends, there's nothing secret

Neil

>>
>> Best regards,

