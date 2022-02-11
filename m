Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6E8E4B2DF9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Feb 2022 20:47:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347510AbiBKTrH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Feb 2022 14:47:07 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:57810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352953AbiBKTrG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Feb 2022 14:47:06 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DA05CF2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Feb 2022 11:47:04 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id f41so11371068lfv.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Feb 2022 11:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wlk9TNYVCMph61ewMNIOja5bBaQXf36U4fYvmtONX+s=;
        b=erzjDC8HdhKkcESrt6GaJK5DCgdNcuVGJ/RhXe53huFkT7eDuRGXpjtPbgkTEsAYZS
         6byctj6XeVjjK17pOOeahYbFMgpjTz74V8ONndInduGW0izI931LiQTDKE/7hy60g/Lj
         6Ch02JY8yPmSQT4K1nX4bgiqr1zvKYg5kZgOqrxjVqu2CSw0dpJV3XtRFSR6KuzEs63E
         T+V0pkYOov744TzjcZKWxA+84i9ofDVd99kKlBsyQBT7qfR1itkx26IWXvNT9d2hL3+n
         WB/J2xQawKrPt4Jz4qD+VlBqdEALvS9d2LJxMZTJ/d51fgSVfB2SXMRfFG9wuG/AfvrJ
         PW9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wlk9TNYVCMph61ewMNIOja5bBaQXf36U4fYvmtONX+s=;
        b=l+WSeL2TRW3RiLV24vgZ7HPkdQ6ZVNLNMRGBs9lrQibBnjILGOWHO3+D2DDMsHgmsU
         dmUo6jEvKm7q9fIqnZ0SpG8Vqw6xU1QkfhZkv/yJdZGAKK0AZjb1KcWn/Af/SdNnL8Fm
         9ye+P58ObVQ/qfrf6EotGToCwFQZm/GVWFVEJA2trJl34DRVhgEkrY5uZQMWCa+qH2fZ
         NUTLBIQCNi0TTn4UQ5MJ/hI2t/+zMuRYSfwk5vKFq01kCue+rwW7Zna49EtI4R/Ur0am
         vDqpZux72QEDGD+agaBVJzqOvqb5sJAiRupdNgBsrqvfHmmYqCPKezTBnH/zLr9KQrMy
         yuzw==
X-Gm-Message-State: AOAM530OyXaMWpsX6Rr0u6/zY62QS71fd019wweYuqYLlMJqfGNI8OOw
        bvDaC8VU6vk3EycVSSMV3VyeIQ==
X-Google-Smtp-Source: ABdhPJzqoBMA+QIOiEPvnR09WPKnrncnY5ngE4lRCI6j++aI6QzP6sjWQIhKmmoS9UKcAgSnvTeuKA==
X-Received: by 2002:a05:6512:3e1c:: with SMTP id i28mr2170671lfv.83.1644608822600;
        Fri, 11 Feb 2022 11:47:02 -0800 (PST)
Received: from [192.168.1.102] (88-113-46-102.elisa-laajakaista.fi. [88.113.46.102])
        by smtp.gmail.com with ESMTPSA id k1sm367352lfo.295.2022.02.11.11.47.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Feb 2022 11:47:02 -0800 (PST)
Subject: Re: [PATCH 0/9] i2c: qcom-cci: fixes and updates
To:     Wolfram Sang <wsa@kernel.org>
References: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org>
 <Ygahuyi+/m8T/5cZ@kunai>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Message-ID: <db11d120-0f9c-177d-66a0-18cab7297445@linaro.org>
Date:   Fri, 11 Feb 2022 21:46:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <Ygahuyi+/m8T/5cZ@kunai>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Wolfram,

On 2/11/22 7:49 PM, Wolfram Sang wrote:
> Hi,
> 
>> The new bus adapter specific bus_regulator from commit 5a7b95fb993e
>> ("i2c: core: support bus regulator controlling in adapter") is reused,
> 
> Reusing is nice, of course, but I hope you noticed that I needed to
> revert this feature:
> 
> a19f75de73c2 ("Revert "i2c: core: support bus regulator controlling in adapter"")

yes, I've seen it, and as far as I understand it's expected to get it
back after the regression fixes.

> The thread to get it re-applied is currently here:
> 
> https://lore.kernel.org/all/20220106122452.18719-1-wsa@kernel.org/
> 

A presented change in the series is I2C controller specific, so it works well
on top of the reverted feature, however it has a potential to be simplified
after the re-application.

Wolfram, can you please share your opinion on device tree binding name and
placement for an SDA/SDC pull-up controlled by a regulator?

See https://lore.kernel.org/all/682b7ffe-e162-bcf7-3c07-36b3a39c25ab@linaro.org

Thank you in advance.

--
Best wishes,
Vladimir
