Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 954DA48E68E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jan 2022 09:32:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234436AbiANIcA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Jan 2022 03:32:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53191 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233270AbiANIcA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Jan 2022 03:32:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1642149119;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4e3R0cGDEuzfJCTMeYBZ008JX3SkTwc1ShwrpVRZ6sY=;
        b=apNcJLebiuwa4AumGp5IN3b7JW06jy+zTPoyF8kHFVWsE1klWYCAcskS3CY0asDJYCUdmZ
        XQgI/9OK5hYWUUPvguQgLPboFFat/6hcBqpDi/zvKvIJcgY7PBnhtVyRiNTawNuGhQy4dn
        RQbq7btQATB6KeJDX39GQQ/VFyDCMSU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-474-CKkA6_RcNRa1LL3C8BcwEA-1; Fri, 14 Jan 2022 03:31:58 -0500
X-MC-Unique: CKkA6_RcNRa1LL3C8BcwEA-1
Received: by mail-ed1-f72.google.com with SMTP id g2-20020a056402424200b003f8ee03207eso7753546edb.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jan 2022 00:31:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4e3R0cGDEuzfJCTMeYBZ008JX3SkTwc1ShwrpVRZ6sY=;
        b=PnTEI4wUb3fO2K3StJyBJrTuxAkHd/Qo4L5k2UHmZUHHeFjecU2OiN7hFDzrbfBe4B
         x+tM9SSo/KOFiKeN6sITDyLGh4HDXjQb8KYA2qrHCvZEuWAtopGERS/S3AC6dliCKfF8
         1mYJNDHiDnJvYez41+pj1CuKnCTmCk9zhtA7D5JPOsIA6CxkY4kUPBdotSMaJDqmK7A+
         UG9fd0EHxfpqD0U/cxb6VNTILLBmqxrEsezVBAIOdn98zyvrHO9hcI0BEWdeMbCbuYaq
         R1WuEdZc25L5WD1VqcfnHdoF7+XbJEzAfE+ErjsS/9Sp4zvzkvQpYrX2IkOGR0ti617Q
         vpoQ==
X-Gm-Message-State: AOAM532ZfUDcxqYuwxsM+FF7wRz+wtCqsI+GE+9l44qBX+V2/Dw+S53d
        U8Oqqf72CYsfAfRWD1xRYz3Mx7IooSbELQyRFAqUKUdrx2UW9dC2C1iRLPDL93+tutSMmYeT45h
        pnh0+lJj4MQULh8akrn5/paoS0A==
X-Received: by 2002:a17:907:7b9a:: with SMTP id ne26mr6794391ejc.24.1642149117281;
        Fri, 14 Jan 2022 00:31:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyc7ZUjSZiOi4vR7JBwLNXvaLjQlMFxrVHe1I54Rh0HNGyN31qRHcwp/dgJR+l4YdLADSfyPQ==
X-Received: by 2002:a17:907:7b9a:: with SMTP id ne26mr6794377ejc.24.1642149117132;
        Fri, 14 Jan 2022 00:31:57 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id 17sm1623091ejo.27.2022.01.14.00.31.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jan 2022 00:31:56 -0800 (PST)
Message-ID: <2d6ab8ab-79c8-681b-a898-a88b48fceb55@redhat.com>
Date:   Fri, 14 Jan 2022 09:31:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 2/5] platform: surface: Propagate ACPI Dependency
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Felipe Balbi <balbi@kernel.org>
Cc:     Jarrett Schultz <jaschultzms@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Gross <markgross@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Jarrett Schultz <jaschultz@microsoft.com>
References: <20211202191630.12450-1-jaschultz@microsoft.com>
 <20211202191630.12450-3-jaschultz@microsoft.com>
 <CAMuHMdUPwo7pCSwY8_9xTaDruTHt6d=wHiNHvRmE71k8hWeLBw@mail.gmail.com>
 <87czku4z2i.fsf@kernel.org>
 <CAMuHMdWEh07zXZZesuY0sksXaa6ptDvv3Fv4UC1RDkf7_KUv8w@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAMuHMdWEh07zXZZesuY0sksXaa6ptDvv3Fv4UC1RDkf7_KUv8w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 1/14/22 09:29, Geert Uytterhoeven wrote:
> Hi Felipe,
> 
> On Fri, Jan 14, 2022 at 7:21 AM Felipe Balbi <balbi@kernel.org> wrote:
>> Geert Uytterhoeven <geert@linux-m68k.org> writes:
>>> On Mon, Dec 6, 2021 at 4:03 PM Jarrett Schultz <jaschultzms@gmail.com> wrote:
>>>> Since the Surface XBL Driver does not depend on ACPI, the
>>>> platform/surface directory as a whole no longer depends on ACPI. With
>>>> respect to this, the ACPI dependency is moved into each config that depends
>>>> on ACPI individually.
>>>>
>>>> Signed-off-by: Jarrett Schultz <jaschultz@microsoft.com>
>>>
>>> Thanks for your patch, which is now commit 272479928172edf0 ("platform:
>>> surface: Propagate ACPI Dependency").
>>>
>>>> --- a/drivers/platform/surface/Kconfig
>>>> +++ b/drivers/platform/surface/Kconfig
>>>> @@ -5,7 +5,6 @@
>>>>
>>>>  menuconfig SURFACE_PLATFORMS
>>>>         bool "Microsoft Surface Platform-Specific Device Drivers"
>>>> -       depends on ACPI
>>>>         default y
>>>>         help
>>>>           Say Y here to get to see options for platform-specific device drivers
>>>
>>> Without any dependency, all users configuring a kernel are now asked
>>> about this. Is there any other platform dependency that can be used
>>> instead?
>>
>> there's probably no symbol that would be true for x86 and arm64 while
>> being false for everything else. Any ideas?
> 
> depends on ARM64 || X86 || COMPILE_TEST?

That sounds reasonable to me, I would be happy to take a patch for that.

Regards,

Hans


