Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F774649A5F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Dec 2022 09:51:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231645AbiLLIvQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Dec 2022 03:51:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231652AbiLLIvN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Dec 2022 03:51:13 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D375AE018
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 00:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1670835023;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RQ50d8UumI9ueJpEwOflt6TAhpxY1IdtCPs4SpFp+ys=;
        b=avFilSqk0sTuZdlBwUuMNIucuGCOyrqpn0QkTOr7BHFxEeCKy1qdQFkQVDGua6LhtRZJwe
        by1+6H1+tWJHmBEiie3T5EpbPtlwMs7cDrr9xjLvazjoAoO/R1LlDuVgg4RYeLXShQ+S9X
        ZPaAZpbMIK1n9s88Va3xiIw/avQeWaM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-400-8ZISQB3QMMmqTu3B2TC0Fw-1; Mon, 12 Dec 2022 03:50:22 -0500
X-MC-Unique: 8ZISQB3QMMmqTu3B2TC0Fw-1
Received: by mail-wm1-f71.google.com with SMTP id bg25-20020a05600c3c9900b003cf3ed7e27bso3047803wmb.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 00:50:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RQ50d8UumI9ueJpEwOflt6TAhpxY1IdtCPs4SpFp+ys=;
        b=UdK3dNQibE1O7WGOW43+xzkzN+V+Er8rUtI2MtGPJVc1KMp3Jmk6Vid5Flrs+6vgqN
         GMTxRJlAUOiEd1JHqpiY3dw0fF8SFH7+gaiLxX0vjogoc1ObbAywB/zitkOhZP4qXlSn
         sN+yHpqt4fOsois7uYjVpQ4AuCOJtXaPQ7N2KPdHwTbIKuQB271d6SfFSudEilgEYsj6
         cj8N3fTJBA2xuDIsfpZuxQWiGN6zzOAgSEnR5H22kRpmiZWeIL5uSxJUGZijy0v3potB
         nmm+GeLmnxCnybDS0jWXoL6VYJOqKGEnEyRrBplBK+mO3ZrXHKpE3GVTRnWgjm3TAK25
         LjkQ==
X-Gm-Message-State: ANoB5pnPAWQ2T/pihpI46S0ICKHua+7ikf4ewDw0jlkRNPX3nYl0wGGH
        HKgg/c9Vs0LKGgdlclVPHsMBR2WgA3PASqpfsQQFYsu0eqAPi8tQV8XApiL0fHs0p9wYOcK2+m9
        jsQmYkjsr2atx6CiDO2J149WvqA==
X-Received: by 2002:a1c:f614:0:b0:3cf:5502:8a0 with SMTP id w20-20020a1cf614000000b003cf550208a0mr11802786wmc.27.1670835019073;
        Mon, 12 Dec 2022 00:50:19 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5LzC9pS4sHGm+Dp6NvZaYYWCLhmBeZhJRNbTAjUPxhj+YiexNiySqJFPuqRgC7vVOTWvawqA==
X-Received: by 2002:a1c:f614:0:b0:3cf:5502:8a0 with SMTP id w20-20020a1cf614000000b003cf550208a0mr11802769wmc.27.1670835018821;
        Mon, 12 Dec 2022 00:50:18 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id iw3-20020a05600c54c300b003d220ef3232sm5080177wmb.34.2022.12.12.00.50.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Dec 2022 00:50:18 -0800 (PST)
Message-ID: <549800ec-6da2-64ad-62a6-c8e4a35dc212@redhat.com>
Date:   Mon, 12 Dec 2022 09:50:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 1/4] driver core: Make driver_deferred_probe_timeout a
 static variable
Content-Language: en-US
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        John Stultz <jstultz@google.com>
Cc:     linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Peter Robinson <pbrobinson@redhat.com>,
        Enric Balletbo i Serra <eballetbo@redhat.com>,
        Steev Klimaszewski <steev@kali.org>,
        Rob Herring <robh@kernel.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        linux-arm-msm@vger.kernel.org,
        Saravana Kannan <saravanak@google.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Jakub Kicinski <kuba@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
References: <20221116115348.517599-1-javierm@redhat.com>
 <20221116115348.517599-2-javierm@redhat.com>
 <CANDhNCoa+LRu8B4+M+uU4_m2kd=HriO0SyNP=n=XpXwXG2k9LA@mail.gmail.com>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CANDhNCoa+LRu8B4+M+uU4_m2kd=HriO0SyNP=n=XpXwXG2k9LA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Greg,

On 11/17/22 20:14, John Stultz wrote:
> On Wed, Nov 16, 2022 at 3:54 AM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
>>
>> It is not used outside of its compilation unit, so there's no need to
>> export this variable.
>>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>> ---
>>
>> (no changes since v1)
>>
>>  drivers/base/dd.c             | 6 ++----
>>  include/linux/device/driver.h | 1 -
>>  2 files changed, 2 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/base/dd.c b/drivers/base/dd.c
>> index 3dda62503102..040b4060f903 100644
>> --- a/drivers/base/dd.c
>> +++ b/drivers/base/dd.c
>> @@ -257,13 +257,11 @@ static int deferred_devs_show(struct seq_file *s, void *data)
>>  DEFINE_SHOW_ATTRIBUTE(deferred_devs);
>>
>>  #ifdef CONFIG_MODULES
>> -int driver_deferred_probe_timeout = 10;
>> +static int driver_deferred_probe_timeout = 10;
>>  #else
>> -int driver_deferred_probe_timeout;
>> +static int driver_deferred_probe_timeout;
>>  #endif
>>
>> -EXPORT_SYMBOL_GPL(driver_deferred_probe_timeout);
>> -
> 
> Yeah, I added the EXPORT for the regulator code to use it in
> dca0b44957e5 but that got backed out when setting
> driver_deferred_probe_timeout to 30s was reverted, and this bit was
> forgotten.
> 
> Thanks for catching this!
> 
> Acked-by: John Stultz <jstultz@google.com>
>

Could you please pick this patch? Is a fix independent of the other
patches in the series and it has already been acked by John.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

