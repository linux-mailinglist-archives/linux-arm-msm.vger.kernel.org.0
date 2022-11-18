Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFEA062F60F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Nov 2022 14:30:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241827AbiKRNad (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Nov 2022 08:30:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241899AbiKRNa2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Nov 2022 08:30:28 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 607048C4AA
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Nov 2022 05:30:26 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id bs21so9251643wrb.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Nov 2022 05:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hvGy1RBLPA4RoB0q/hgxQNJ5odPvVqvFEN2bRcxK1LE=;
        b=xpaEjALrqfSp+mTAO0gQ6yHBsq5ccytVh2ERoq30ogytxvEijsa3RHELjySs7+FjoN
         Uv1ot8MMdZ/Z/5aIFiYEmnECZsfTP9rslnxCrU8/TAogsu2CG9VWdIliLTnHXS1ePyeB
         1W3dbqdp2iL7iICKxBK5rZoZT1AwTNfrKKC23/gJh5cR+dLtv8MmIR+Mxn0YpUWtkVaN
         gBhZDunw7fZWqi93mqU/H2do812JP0E6m76Jxs1QfAi3knI8sD4iCdF/isBgouns8I0a
         uNyFzvFD8KzFB0mhMBdIaqQF5/xM4FHyKvQxkJTXqx5+TpY0YFYatJswyGCVFHD7Y0fB
         ASGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hvGy1RBLPA4RoB0q/hgxQNJ5odPvVqvFEN2bRcxK1LE=;
        b=pHEBwNWgZiGkyrF1my2jSyDRFwuXxoDZGwYwtSkmjuzwhoF72EVibnzTtJcHAUtFiU
         YfUmlu/RSUMUAYYebM0+xiSkaaZH3a4TMGwqafBFL5nTnEy8KqBQKN92sD3VKA1AIYkr
         URg5KwQgl9yEZPX8OFU1VMtS5DCsRAyj3Oqf0axq8F86VhgRVoUq5hpSVUfuqSHNbCnA
         hU+vv0XATusuNgiRA5/LIOBbhdsjElJ49c0SkHEuM4AxOLgse/09ed10bdYQiLpRQCoq
         RQ39crM/yrjICisBnVhdwHjdLCfLwWHKyhy6lCWSuFbN6UUxtuMAGfdtYGGrj36KLlSh
         HMSA==
X-Gm-Message-State: ANoB5pnta3jD6IgjBJgDfOB8Kx6/l0D/bzOkZwJDFZo4NAh4zUAzNSt3
        7S8f+kIf9V7kb+zKyLiDVE4p7w==
X-Google-Smtp-Source: AA0mqf7xCdPe4dhV4KoB9LkmxibOxBYqIGkCJl+rXNT9kR29ONKHPpAqZrkYtt7iL48CIXRx+pY+4w==
X-Received: by 2002:a5d:4fcd:0:b0:241:792e:bdf9 with SMTP id h13-20020a5d4fcd000000b00241792ebdf9mr4130545wrw.540.1668778224856;
        Fri, 18 Nov 2022 05:30:24 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:f7cc:460c:56ae:45a? ([2a01:e0a:982:cbb0:f7cc:460c:56ae:45a])
        by smtp.gmail.com with ESMTPSA id c12-20020adffb4c000000b0022a3a887ceasm3612872wrs.49.2022.11.18.05.30.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 05:30:24 -0800 (PST)
Message-ID: <ad9d2e4f-1d60-15e7-dc2d-e7e32b0ec855@linaro.org>
Date:   Fri, 18 Nov 2022 14:30:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
From:   neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 1/2] dt-bindings: reserved-memory: document Qualcomm MPSS
 DSM memory
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20221114-narmstrong-sm8550-upstream-mpss_dsm-v1-0-158dc2bb6e96@linaro.org>
 <20221114-narmstrong-sm8550-upstream-mpss_dsm-v1-1-158dc2bb6e96@linaro.org>
 <38fff21b-3e75-13f9-664e-a115bc527b67@linaro.org>
 <9aa23650-6ae1-3844-7cf3-6812dc023c11@linaro.org>
 <dfec6a0b-86c6-fb61-51f6-d1e400a6f5ef@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <dfec6a0b-86c6-fb61-51f6-d1e400a6f5ef@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/11/2022 11:45, Krzysztof Kozlowski wrote:
> On 17/11/2022 10:47, Neil Armstrong wrote:
>>>
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: qcom,mpss-dsm-mem
>>>
>>> Why do we need dedicated binding and compatible for it instead of using
>>> memory-region phandle in the device?
>>
>> So like rmtfs, this memory zone is shared between APPS and the MPSS subsystem.
>>
>> Like rmtfs it makes no sense to link it to the MPSS PAS, since it's only a launcher,
>> it doesn't represent the MPSS subsystem.
> 
> This also does not represent a device. Memory region is not a device, so
> this is as well not correct representation of hardware.

I never used the term device so far, but a shared memory region with a platform
specific process to share the region between subsystems.

> 
>>
>> In the PAS startup process, the resources are released from APPS once the MPSS subsystem
>> is running, which is not the case with the MPSS DSM where it must be shared during the whole
>> lifetime of the system.
> 
> I don't think that PAS releases the region. I checked the
> qcom_q6v5_pas.c and there is only ioremap. The device stays loaded thus
> the memory stays mapped.
Yes PAS does release the firmware region when the firmware is started,
qcom_scm_pas_metadata_release() does that.

> 
> We have already three of such "memory region devices" and we keep
> growing it. It's not scalable.

If we want to properly describe this, we must then represent the MPSS subsystem
and associate this memory region.

> 
> Best regards,
> Krzysztof

Thanks,
Neil

> 

