Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DC8162C57B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 17:54:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239043AbiKPQyc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 11:54:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234128AbiKPQyD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 11:54:03 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D5C359FD5
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 08:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668617491;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dorXIuK06EEptACjyhzinkumIizbWB2L1lsaspCtMpw=;
        b=DNp4oX5dWzt+1471+pJfGoAKhUxYvIVxZbEjuzbYdB4d/i3X6tY/Lj0CI1D0tuoSLRNW3z
        E+gkjs6LChXts4zo8cqEzi0kETYHmsza1pe3i7sw7wppsmpVu3pFNCZp97Cj30Zxl0M58x
        2LoDaGZaguQ6Cv1pF9X4LaIQ1LbG1u8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-213-ZLbqsyOXMaaZCMwxoP-hHQ-1; Wed, 16 Nov 2022 11:51:30 -0500
X-MC-Unique: ZLbqsyOXMaaZCMwxoP-hHQ-1
Received: by mail-wm1-f71.google.com with SMTP id v125-20020a1cac83000000b003cfa148576dso10228047wme.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 08:51:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dorXIuK06EEptACjyhzinkumIizbWB2L1lsaspCtMpw=;
        b=esiZMKI2V2qJKwz/kGDl+2HAlp4jvh+E98QTm1km42EEcthuSFiT/pGMtpHR0n/xgz
         J1uBHc5jX1evyMQMDx4YvnfkDxk3Y5L8LW1+r3ss9Z3WajOoSTQJSPs3USm2AHMKCVv/
         N2GA1DZsZwFeeJPxdhOS8cIeaqAT/CTqJdwpd8ThgEy6LzTTv5rkiwgz86OlUl1FH7V2
         3Ms+ku5h/q4HJt5E12rGb3kRSBVexqf+9bgyxEhIlzbQOb35zo8N1pUTuIagZWyh9LVW
         xYlHWA3RdHk5b81uKteS/HBq84QokcG+TJOWcGIqF1087X/yAfa3gOp/JQD4Oi3PWQpg
         zwTA==
X-Gm-Message-State: ANoB5pmT9Jo0+Jf2/z+5Zx/OARRRgZesqq1/8tAwIpKHteKc8JEJSww9
        ylIxKlNKXZ30T2NoQR4AR8L9Oa4atEjkoWxzkoykaS8CkKQOss4lF2OSZAWswrzGR5Q1uYCe662
        yrtMoCPX224WNDcoN4JMtx7hECg==
X-Received: by 2002:a5d:68d1:0:b0:22e:37ba:41c7 with SMTP id p17-20020a5d68d1000000b0022e37ba41c7mr14345492wrw.173.1668617489063;
        Wed, 16 Nov 2022 08:51:29 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6ow6vezs9GdMa2mqlSkih8fvvXs9BD5y3Uus2qXMAYXsrHsMsV4PRK3TyBSutU8PWWmT+4XQ==
X-Received: by 2002:a5d:68d1:0:b0:22e:37ba:41c7 with SMTP id p17-20020a5d68d1000000b0022e37ba41c7mr14345480wrw.173.1668617488855;
        Wed, 16 Nov 2022 08:51:28 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id i8-20020a1c3b08000000b003cf5ec79bf9sm2551978wma.40.2022.11.16.08.51.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 08:51:28 -0800 (PST)
Message-ID: <79f79051-8118-4735-67f2-74e8b6e1c010@redhat.com>
Date:   Wed, 16 Nov 2022 17:51:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 2/4] driver core: Set deferred probe timeout to 0 if
 modules are disabled
Content-Language: en-US
To:     Andrew Halaney <ahalaney@redhat.com>
Cc:     linux-kernel@vger.kernel.org,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Saravana Kannan <saravanak@google.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, John Stultz <jstultz@google.com>,
        Peter Robinson <pbrobinson@redhat.com>,
        Steev Klimaszewski <steev@kali.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Enric Balletbo i Serra <eballetbo@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>
References: <20221116115348.517599-1-javierm@redhat.com>
 <20221116120043.519614-1-javierm@redhat.com>
 <20221116163931.ob7szcnjx65c7gz7@halaney-x13s>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221116163931.ob7szcnjx65c7gz7@halaney-x13s>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Andrew,

Thanks for your feedback.

On 11/16/22 17:39, Andrew Halaney wrote:
> On Wed, Nov 16, 2022 at 01:00:43PM +0100, Javier Martinez Canillas wrote:
>> There is no point to schedule the work queue to timeout the deferred probe
>> if all the initcalls are done and modules are not enabled. The default for
>> this case is already 0 but can be overridden by the deferred_probe_timeout
>> parameter. Let's just disable to avoid queuing a work that is not needed.
>>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>> ---
>>
>> (no changes since v1)
>>
>>  drivers/base/dd.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/base/dd.c b/drivers/base/dd.c
>> index 040b4060f903..1e8f1afeac98 100644
>> --- a/drivers/base/dd.c
>> +++ b/drivers/base/dd.c
>> @@ -350,8 +350,10 @@ static int deferred_probe_initcall(void)
>>  	flush_work(&deferred_probe_work);
>>  	initcalls_done = true;
>>  
>> -	if (!IS_ENABLED(CONFIG_MODULES))
>> +	if (!IS_ENABLED(CONFIG_MODULES)) {
>> +		driver_deferred_probe_timeout = 0;
>>  		fw_devlink_drivers_done();
>> +	}
>>  
> 
> Potentially a stupid suggestion, but would it make sense to take out
> the ability to actually set that param if !CONFIG_MODULES? Then
> driver_deferred_probe_timeout would be the default value already.
> 

Yes, I think it makes sense. I will do that in the next iteration.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

