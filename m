Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CFAE62E527
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Nov 2022 20:17:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234929AbiKQTRL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Nov 2022 14:17:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240759AbiKQTRF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Nov 2022 14:17:05 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01BF07ECBE
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Nov 2022 11:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668712566;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qX7k7ySpM2yQbDcfvA3eNm9gzjLpcHZv9S182SN9z64=;
        b=ValI048Xi7rvuc5+Y9cERaU1ApKdN7RBfYpb0KYX3GghFMlZgSLUDFTbbPLQ7E7IbNQ3mT
        DTlnZ/LlmYy8uZDjZCPOG+OpMuIz2A5BtiDRrWgobrOoydV0isb55otztD48Gw14SrArC/
        mxaX7p329NTfHlgXefZnJNbSryJS5es=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-517-Yc0H1RcgObegYq5EjlPolA-1; Thu, 17 Nov 2022 14:16:04 -0500
X-MC-Unique: Yc0H1RcgObegYq5EjlPolA-1
Received: by mail-wm1-f70.google.com with SMTP id c126-20020a1c3584000000b003cfffcf7c1aso952180wma.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Nov 2022 11:16:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qX7k7ySpM2yQbDcfvA3eNm9gzjLpcHZv9S182SN9z64=;
        b=Wen6QpscRtBMcd2JhKWP5eIK1VV/Ihy6AFV3PQwsXoFYP5YGRynQ+7DHLf+mnOVzvS
         jvPiVTHsPSJmsPsO+mE9twu0LEInmjYMuVfm/Rv3kKs43zwdeu431BUVq7sOpBy9dpj1
         VTXR7+FKg7UtUEnXhzUu/QypIUY7pwgp/8PdefO661Cts3vaymCxzh/uzlb4X0S8RaqE
         MLYeJzkbfMFMjrgBECvpterkj3oiRe8oNXP/Q5XeKgGZjCcmolllxiczy140XtuyY+oV
         5KlnUmRQt/2YhspEyNMHCnswPtVfG3Vl99uSs429NE13G1DzFg4cBFMe70HVMbwB1i/Y
         08Cw==
X-Gm-Message-State: ANoB5pnxuCswHQ0jigC8pj79Z7RoTcQqGAKR0qrE0Djh4EpmddMIvSaF
        ZTkU1TPwx/EOu0RszE8C5Kui8A/4BtIt09RzMk8i9TnYNj+IHPoBGGWGY36cqD9txteJSQM8nGG
        s2r2WZclVq99O3zpjmV/8AeaWLA==
X-Received: by 2002:adf:ebce:0:b0:22e:4acd:cc89 with SMTP id v14-20020adfebce000000b0022e4acdcc89mr2588526wrn.76.1668712563369;
        Thu, 17 Nov 2022 11:16:03 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4NXAM86Z3R3qMAvw30Me4+FnD9JxaximIIIqJBUNDPMKcb6b/7lLUKyAL1MdwERtJI3PKgkA==
X-Received: by 2002:adf:ebce:0:b0:22e:4acd:cc89 with SMTP id v14-20020adfebce000000b0022e4acdcc89mr2588506wrn.76.1668712563082;
        Thu, 17 Nov 2022 11:16:03 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id m17-20020adfdc51000000b0023677e1157fsm1681896wrj.56.2022.11.17.11.16.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Nov 2022 11:16:02 -0800 (PST)
Message-ID: <eae28066-9b70-bb7c-91e5-ba9fbf97672e@redhat.com>
Date:   Thu, 17 Nov 2022 20:16:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 3/4] driver core: Add fw_devlink.timeout param to stop
 waiting for devlinks
Content-Language: en-US
To:     John Stultz <jstultz@google.com>
Cc:     linux-kernel@vger.kernel.org,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Saravana Kannan <saravanak@google.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        linux-arm-msm@vger.kernel.org,
        Peter Robinson <pbrobinson@redhat.com>,
        Steev Klimaszewski <steev@kali.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Enric Balletbo i Serra <eballetbo@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>
References: <20221116115348.517599-1-javierm@redhat.com>
 <20221116120159.519908-1-javierm@redhat.com>
 <CANDhNCr7ZwbCDK1ftigLK_S2qASj1yfenUG1WPaiYbjr5M9x3w@mail.gmail.com>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CANDhNCr7ZwbCDK1ftigLK_S2qASj1yfenUG1WPaiYbjr5M9x3w@mail.gmail.com>
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

Hello John,

On 11/17/22 20:07, John Stultz wrote:
> On Wed, Nov 16, 2022 at 4:02 AM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
>>
>> Currently, the probe deferral timeout does two things:
>>
>> 1) Call to fw_devlink_drivers_done() to relax the device dependencies and
>>    allow drivers to be probed if these dependencies are optional.
>>
>> 2) Disable the probe deferral mechanism so that drivers will fail to probe
>>    if the required dependencies are not present, instead of adding them to
>>    the deferred probe pending list.
>>
>> But there is no need to couple these two, for example the probe deferral
>> can be used even when the device links are disable (i.e: fw_devlink=off).
>>
>> So let's add a separate fw_devlink.timeout command line parameter to allow
>> relaxing the device links and prevent drivers to wait for these to probe.
> 
> I'm probably being dim, but it's not immediately clear from this
> description *why* this is useful. Maybe add some words on the tangible
> benefit of splitting this up?
>

Thanks for your feedback. You are right that I need to better explain
the why / goal of this patch. But basically is that it would be good
to allow timeout waiting for the optional links while still allow the
non-optional links to keep make the drivers to keep deferring.

I can make a better job at explaining the why in the next iteration.
 
> I'd also push a little bit back on why we need to split this into a
> separate boot option. Since it's not obvious as to when a user would
> want to use fw_devlink.timeout vs probe_deferral_timeout.
> The extra complexity of remembering which timeout is for what might
> become a burden to users and developers.
> 
>>
>> +       fw_devlink.timeout=
>> +                       [KNL] Debugging option to set a timeout in seconds for
>> +                       drivers to give up waiting on dependencies and to probe
>> +                       these are optional. A timeout of 0 will timeout at the
>> +                       end of initcalls. If the time out hasn't expired, it'll
>> +                       be restarted by each successful driver registration.
>> +
> 
> This sounds pretty close to like the deferred_probe_timeout option.
> I'd suggest some words to make the distinction more clear.
>

Yeah, I can think how to better explain this... but it's similar because
there is some overlapping between the two really, but are not exactly the
same even though we are tying the two and folding the disable of the two
under the same timeout.
 
I'll be OK to drop this parameter btw, and just keep it as an internal var
if it's fine to just always use the default 10 seconds or whatever timeout
it is decided.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

