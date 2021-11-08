Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70B95449B3B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Nov 2021 18:58:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233159AbhKHSBY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Nov 2021 13:01:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232511AbhKHSBY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Nov 2021 13:01:24 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4756BC061570;
        Mon,  8 Nov 2021 09:58:39 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id w29so16807824wra.12;
        Mon, 08 Nov 2021 09:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=6csVjf1SebHxBNHa9KF6H/+atJmt35VuzjaR8qLgGP8=;
        b=FXa1OZoE7+PQ+/KKJso5mi+CVg7wHFHXtWv5DwvRWIlPvAd5XMA0diQPUhZK/KyKZy
         gvnCxsMeh6+x/cBWDQe0gazmy6mWHb68RVtgc+Kd2Xw9Dr52ELijQkt3J28MnqOkPpFm
         jaehpZ/73MNmyRbl1ZUjgId6FAuRZgOXEQSUFYVQTH17wKsZ2R5FQF2aGry3Xo5iLW4P
         7tImCRFCJalQtzVO8eFmmXtZUhRtLqaMTu4NXufmNhzGdyhYLhLx+i2/qmD69pvBJKxf
         6uHC/Zu6WqwwGpu4iVfRvb7oK6ip2oEUvFWhcWimXH2VLfz8UYwPrKx6CZZzcJMsa0ZF
         eLkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6csVjf1SebHxBNHa9KF6H/+atJmt35VuzjaR8qLgGP8=;
        b=4skoMAZapSiLnACd9Io/gBz0JfbuyF32T8IAGRn4WcsJ+rm+Omev4Bu0UKgZPhDOjm
         sPAN8dt+O9rexqwUBClparGU06cWUndFZcAfKbcnMDk6yMf1UY6KwKsmfTBTa+Hgq1Hp
         K8n+pP9UwER7EqIL1MfxsJHbPvGbupOW10jcUUtDK+CqBylGWihrVSmv8Fqd4df8knZw
         3U14Bf7MfKWNBUcdXViSxomcfyNtkfPJr5RcBwX37raFq2fy0530tuqaNhQddiP5TjdK
         gwwqjtFYLfpUpkAu4mt+hDUz01uefCaQchil52kG8lMTPjP/YAMimWNU5qZW6g5y/lpv
         +8CQ==
X-Gm-Message-State: AOAM533Gur+flY672IrrU0qjtD0nKfCYTy1I32wPlflikml0G/HZ+O0i
        Gv/UtKV7gTG6YvmLHyZT2K8=
X-Google-Smtp-Source: ABdhPJzg/BiqmatmU9UAYZjQmkk4ZJ/XDIbVMk0k4mUO3zSXnYi1V+NEGrcI/if23eBhPDyR/dlIug==
X-Received: by 2002:a5d:6488:: with SMTP id o8mr1169169wri.348.1636394317848;
        Mon, 08 Nov 2021 09:58:37 -0800 (PST)
Received: from [10.19.0.16] ([91.207.172.187])
        by smtp.gmail.com with ESMTPSA id d7sm17316955wrw.87.2021.11.08.09.58.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 09:58:36 -0800 (PST)
Message-ID: <6e6e478b-eb12-5d7b-e944-4e6c02e46d4c@gmail.com>
Date:   Mon, 8 Nov 2021 18:58:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 2/5] platform: surface: Propagate ACPI Dependency
Content-Language: en-US
To:     Jarrett Schultz <jaschultzms@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>
Cc:     linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Felipe Balbi <balbi@kernel.org>,
        Jarrett Schultz <jaschultz@microsoft.com>
References: <20211108164449.3036210-1-jaschultz@microsoft.com>
 <20211108164449.3036210-3-jaschultz@microsoft.com>
From:   Maximilian Luz <luzmaximilian@gmail.com>
In-Reply-To: <20211108164449.3036210-3-jaschultz@microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/8/21 17:44, Jarrett Schultz wrote:> From: Jarrett Schultz <jaschultzMS@gmail.com>
> 
> Since the Surface XBL Driver does not depend on ACPI, the
> platform/surface directory as a whole no longer depends on ACPI. With
> respect to this, the ACPI dependency is moved into each config that
> depends on ACPI individually.
> 
> Signed-off-by: Jarrett Schultz <jaschultz@microsoft.com>

Some remarks inline:

> ---
> 
> Changes in v2:
>   - Created to propagate ACPI dependency
> 
> ---
> 
>   drivers/platform/surface/Kconfig | 12 +++++++++++-

You also need to account for included Kconfigs, specifically:

     drivers/platform/surface/aggregator/Kconfig.

>   1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/surface/Kconfig b/drivers/platform/surface/Kconfig
> index 3105f651614f..0d3970e1d144 100644
> --- a/drivers/platform/surface/Kconfig
> +++ b/drivers/platform/surface/Kconfig
> @@ -5,7 +5,6 @@
>   
>   menuconfig SURFACE_PLATFORMS
>   	bool "Microsoft Surface Platform-Specific Device Drivers"
> -	depends on ACPI
>   	default y
>   	help
>   	  Say Y here to get to see options for platform-specific device drivers
> @@ -18,6 +17,7 @@ if SURFACE_PLATFORMS
>   
>   config SURFACE3_WMI
>   	tristate "Surface 3 WMI Driver"
> +	depends on ACPI

This is redundant, you can drop that. ACPI_WMI already depends on ACPI.

>   	depends on ACPI_WMI
>   	depends on DMI
>   	depends on INPUT
> @@ -30,12 +30,14 @@ config SURFACE3_WMI
>   
>   config SURFACE_3_BUTTON
>   	tristate "Power/home/volume buttons driver for Microsoft Surface 3 tablet"
> +	depends on ACPI
>   	depends on KEYBOARD_GPIO && I2C
>   	help
>   	  This driver handles the power/home/volume buttons on the Microsoft Surface 3 tablet.
>   
>   config SURFACE_3_POWER_OPREGION
>   	tristate "Surface 3 battery platform operation region support"
> +	depends on ACPI
>   	depends on I2C
>   	help
>   	  This driver provides support for ACPI operation
> @@ -43,6 +45,7 @@ config SURFACE_3_POWER_OPREGION
>   
>   config SURFACE_ACPI_NOTIFY
>   	tristate "Surface ACPI Notify Driver"
> +	depends on ACPI

As mentioned above, you're missing aggregator/Kconfig. All you need to
do is add "depends on ACPI" to SURFACE_AGGREGATOR in that file. Then you
can drop the "depends on ACPI" for anything that depends on that.

Same holds for the couple of options depending on SURFACE_AGGREGATOR
below.

>   	depends on SURFACE_AGGREGATOR
>   	help
>   	  Surface ACPI Notify (SAN) driver for Microsoft Surface devices.
> @@ -62,6 +65,7 @@ config SURFACE_ACPI_NOTIFY
>   
>   config SURFACE_AGGREGATOR_CDEV
>   	tristate "Surface System Aggregator Module User-Space Interface"
> +	depends on ACPI
>   	depends on SURFACE_AGGREGATOR
>   	help
>   	  Provides a misc-device interface to the Surface System Aggregator
> @@ -79,6 +83,7 @@ config SURFACE_AGGREGATOR_CDEV
>   
>   config SURFACE_AGGREGATOR_REGISTRY
>   	tristate "Surface System Aggregator Module Device Registry"
> +	depends on ACPI
>   	depends on SURFACE_AGGREGATOR
>   	depends on SURFACE_AGGREGATOR_BUS
>   	help
> @@ -106,6 +111,7 @@ config SURFACE_AGGREGATOR_REGISTRY
>   
>   config SURFACE_DTX
>   	tristate "Surface DTX (Detachment System) Driver"
> +	depends on ACPI
>   	depends on SURFACE_AGGREGATOR
>   	depends on INPUT
>   	help
> @@ -126,6 +132,7 @@ config SURFACE_DTX
>   
>   config SURFACE_GPE
>   	tristate "Surface GPE/Lid Support Driver"
> +	depends on ACPI
>   	depends on DMI
>   	help
>   	  This driver marks the GPEs related to the ACPI lid device found on
> @@ -135,6 +142,7 @@ config SURFACE_GPE
>   
>   config SURFACE_HOTPLUG
>   	tristate "Surface Hot-Plug Driver"
> +	depends on ACPI
>   	depends on GPIOLIB
>   	help
>   	  Driver for out-of-band hot-plug event signaling on Microsoft Surface
> @@ -154,6 +162,7 @@ config SURFACE_HOTPLUG
>   
>   config SURFACE_PLATFORM_PROFILE
>   	tristate "Surface Platform Profile Driver"
> +	depends on ACPI
>   	depends on SURFACE_AGGREGATOR_REGISTRY
>   	select ACPI_PLATFORM_PROFILE
>   	help
> @@ -176,6 +185,7 @@ config SURFACE_PLATFORM_PROFILE
>   
>   config SURFACE_PRO3_BUTTON
>   	tristate "Power/home/volume buttons driver for Microsoft Surface Pro 3/4 tablet"
> +	depends on ACPI
>   	depends on INPUT
>   	help
>   	  This driver handles the power/home/volume buttons on the Microsoft Surface Pro 3/4 tablet.
> 
