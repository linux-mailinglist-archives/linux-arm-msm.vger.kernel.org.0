Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1AC165E784
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jan 2023 10:17:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231937AbjAEJRf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Jan 2023 04:17:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231879AbjAEJRb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Jan 2023 04:17:31 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51F93544F3
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jan 2023 01:17:29 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id r2so654553wrv.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jan 2023 01:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pq3ejuzBjCDJdHLBnefjQA1cSMGJU3lpvGousig3Qm4=;
        b=n7Mj3heVFeFgnm409WAdct2hWXOXoVgcy4BtrIqudbYirOWeWNImfDZxC/YvGM4nYC
         0fjS9QSgDvmUTBANDuZ9HB/okAgRZghzDoSQIQGsLiBiLsORLCgObB1GBxTQOg4E1A5E
         X96TogwMkwyYa4j6+GkRAJEfm/m1IdE0VBW5KRv7R6sjI0oh3ebJwFKZ3xcG0QPR7Aps
         z33xiRqsive6Lg52cj+XzNqSdMmSio9TRGHSjvHkqymx5dRH3YCo1dwL9SN+ZxDT7Xwy
         Njl7XPKhakIlG6QQXsFRR3+zbOBaEtcdVEafTpHxY5T7k5rpBsAbJUu6/xUMdOgD6FNF
         ptvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pq3ejuzBjCDJdHLBnefjQA1cSMGJU3lpvGousig3Qm4=;
        b=C9iPQsh2DHcgNaI5ydIg/0ymNIZrO2L1DmWPlXZnD01MbS+qQSAXU2Bfpofc7XJ63M
         4Scds7qXQtrtj7PN6SFJLswbG3EGvCW2JNmQ+/nvOTlNsM1MTq+vOVTr1j/r4Jfy61vP
         Yi18fnGhw4oZm8gRCdWbxGR4smB8puFnoYltEJoD/kWJ9eVTruA+3LAHPG6qTZM29QWR
         FJX9PRntElPiTNcGET11Ubr5zMJUUVBQYct5tl4ssvNODnNI1zUDSexBc6mqtZtaY65K
         5zP/aE2zhdxX7Mv6UQ3bUaYHnpayxjScVLcU8oSyghi6ljGWYKQanQWmy1bKdYwLjj+N
         oRQw==
X-Gm-Message-State: AFqh2krnt17eV7zfGIkLq2Ql/KbDm1HsCmVH7x33MCLvFsRfHI0riYPt
        ykgg254DbgzJm0pTpcUwtduqbg==
X-Google-Smtp-Source: AMrXdXstMyW0DgS/z6kXcwU9LPSEpxdk+xtC0acQsk8RCCbVghUBwX0j9ppX/MquETlN1KbOsSGxBw==
X-Received: by 2002:a05:6000:1f14:b0:242:5a34:fb7b with SMTP id bv20-20020a0560001f1400b002425a34fb7bmr31715300wrb.70.1672910247816;
        Thu, 05 Jan 2023 01:17:27 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:1e12:c16d:1898:607c? ([2a01:e0a:982:cbb0:1e12:c16d:1898:607c])
        by smtp.gmail.com with ESMTPSA id m11-20020a5d56cb000000b0028d66c43101sm18463067wrw.29.2023.01.05.01.17.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jan 2023 01:17:27 -0800 (PST)
Message-ID: <2d90fb92-45ac-7311-ef27-ce82c6b891a4@linaro.org>
Date:   Thu, 5 Jan 2023 10:17:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/2] drm/panel: add visionox vtdr6130 DSI panel driver
To:     Rayyan Ansari <rayyan@ansari.sh>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230103-topic-sm8550-upstream-vtdr6130-panel-v1-0-9b746b858378@linaro.org>
 <20230103-topic-sm8550-upstream-vtdr6130-panel-v1-2-9b746b858378@linaro.org>
 <8c8d0276-61a8-71d6-17b0-f6b384ab9d94@ansari.sh>
Content-Language: en-US
Organization: Linaro Developer Services
In-Reply-To: <8c8d0276-61a8-71d6-17b0-f6b384ab9d94@ansari.sh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 04/01/2023 19:25, Rayyan Ansari wrote:
> Hello,
> I am not a maintainer, but I thought I might give a few comments.

Any comment is always welcome !

> 
> On 03/01/2023 14:22, Neil Armstrong wrote:
>> Add support for the 1080x2400 Visionox VTDR6130 AMOLED DSI panel
>> found on the Qualcomm SM8550 MTP board.
>>
>> By default the the panel is configured to work with DSI compressed
>> streams, but can work in uncompressed video mode since 1080x2400 in
>> RGB888 fits in the 4 DSI lanes bandwidth.
>>
>> While display compression is preferred for performance and power
>> reasons, let's start with the uncompressed video mode support and
>> add the DSC support later on.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/gpu/drm/panel/Kconfig                   |   8 +
>>   drivers/gpu/drm/panel/Makefile                  |   1 +
>>   drivers/gpu/drm/panel/panel-visionox-vtdr6130.c | 366 ++++++++++++++++++++++++
>>   3 files changed, 375 insertions(+)
>>

<snip>

>> +
>> +MODULE_AUTHOR("Neil Armstron <neil.armstrong@linaro.org>");
> 
> Missed a "g" here :-)
> 
>> +MODULE_DESCRIPTION("Panel driver for the visionox VTDR6130 AMOLED DSI panel");
> 
> I am not sure how the company capitalises the name, but to keep it consistent with the other mentions, I think it should be "Visionox".

Thanks, I'll fix these.

Neil

> 
>> +MODULE_LICENSE("GPL");
>>
> 

