Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03B8F62BEC9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 13:58:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233410AbiKPM6d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 07:58:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229703AbiKPM6b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 07:58:31 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE5D51C910
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 04:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668603456;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=P3dZVUJWS9YfhEwx2MGdoRYm/+IpeyLBcM/mBcpGfB4=;
        b=X9gYXjWq4OwFmP+fSLQlgUIaz7LqFWrY4W4T5RRhqu1AQ1hn6XqXc0WX3MCgKX5pHUiA/c
        4dbBEWSln87pu6WGEGd6FGglH8kPLFZkq2d+LWG0t/ypyRSumy+jfkR+lCKfOelXY7ZvW8
        s/59pgcVvVH279tlne9TI9/cs1kEJ4o=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-44-HY2AnUlcPemQA0YxFCJAuQ-1; Wed, 16 Nov 2022 07:57:35 -0500
X-MC-Unique: HY2AnUlcPemQA0YxFCJAuQ-1
Received: by mail-oi1-f198.google.com with SMTP id s16-20020a056808009000b0035b227aa390so18308oic.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 04:57:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P3dZVUJWS9YfhEwx2MGdoRYm/+IpeyLBcM/mBcpGfB4=;
        b=LV1cCaPUoUOU6N0S798/GUUfYS3u/xco5W7ilIPyk8lVDOnVMUnDKpWs9eplzK3gE0
         r+7Su34Kp3YyyHz3nDfmZ4zxDz7CRRm4lMg9NinparH7WD7vpKZVLF2v+JA2FioexcO9
         O/t8WFFWwSraGcdkUv3siLqowK/ybFDhAybT/gZky//0pthZiVpVOFXVlm9L4p+WXRAJ
         pqEFEE/bLlwJRDMphufSGG98KC+qH78BaLENmDTogBCCPvWpoFQmJE49zje8TpcObVT0
         TQO3eVJf43VlDes+VmcZUq1Yaa7gqC+b0GdXf7b91Qv7fDP7nhCR5A0iyNtc78Mf3c2+
         cDfQ==
X-Gm-Message-State: ANoB5pkydBznMdMHknKUcBRUiGnz0yzT4ZIkaVOYOrAwPKUBrQz8eSeO
        +HxTUwycItfkGKmWNUEOkoll/MZblpKKgYaWL/ZQwBE1WUTZEvrQ898ylQKlAkaM2Ol6b1UMA1Y
        TOPUkGn7jmp76dSI9k5zLUExibA==
X-Received: by 2002:a05:6870:d8b:b0:13c:f48b:7cc4 with SMTP id mj11-20020a0568700d8b00b0013cf48b7cc4mr1578220oab.196.1668603453538;
        Wed, 16 Nov 2022 04:57:33 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4vPwsXILiXdWzuZ31PUaS5KlMLO/I2br8NXWKvphTq/eBqG58DOWNeUUld0J4wDgO9fsqGeQ==
X-Received: by 2002:a05:6870:d8b:b0:13c:f48b:7cc4 with SMTP id mj11-20020a0568700d8b00b0013cf48b7cc4mr1578215oab.196.1668603453333;
        Wed, 16 Nov 2022 04:57:33 -0800 (PST)
Received: from halaney-x13s ([2600:1700:1ff0:d0e0::41])
        by smtp.gmail.com with ESMTPSA id g8-20020a056870d20800b0012d6f3d370bsm7848854oac.55.2022.11.16.04.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 04:57:32 -0800 (PST)
Date:   Wed, 16 Nov 2022 06:57:30 -0600
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Javier Martinez Canillas <javierm@redhat.com>
Cc:     linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        John Stultz <jstultz@google.com>,
        Peter Robinson <pbrobinson@redhat.com>,
        Enric Balletbo i Serra <eballetbo@redhat.com>,
        Steev Klimaszewski <steev@kali.org>,
        Rob Herring <robh@kernel.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        linux-arm-msm@vger.kernel.org,
        Saravana Kannan <saravanak@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Jakub Kicinski <kuba@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v2 1/4] driver core: Make driver_deferred_probe_timeout a
 static variable
Message-ID: <20221116125730.mvah5kxbxrll6ls4@halaney-x13s>
References: <20221116115348.517599-1-javierm@redhat.com>
 <20221116115348.517599-2-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221116115348.517599-2-javierm@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 16, 2022 at 12:53:45PM +0100, Javier Martinez Canillas wrote:
> It is not used outside of its compilation unit, so there's no need to
> export this variable.
> 
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

> ---
> 
> (no changes since v1)
> 
>  drivers/base/dd.c             | 6 ++----
>  include/linux/device/driver.h | 1 -
>  2 files changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> index 3dda62503102..040b4060f903 100644
> --- a/drivers/base/dd.c
> +++ b/drivers/base/dd.c
> @@ -257,13 +257,11 @@ static int deferred_devs_show(struct seq_file *s, void *data)
>  DEFINE_SHOW_ATTRIBUTE(deferred_devs);
>  
>  #ifdef CONFIG_MODULES
> -int driver_deferred_probe_timeout = 10;
> +static int driver_deferred_probe_timeout = 10;
>  #else
> -int driver_deferred_probe_timeout;
> +static int driver_deferred_probe_timeout;
>  #endif
>  
> -EXPORT_SYMBOL_GPL(driver_deferred_probe_timeout);
> -
>  static int __init deferred_probe_timeout_setup(char *str)
>  {
>  	int timeout;
> diff --git a/include/linux/device/driver.h b/include/linux/device/driver.h
> index 2114d65b862f..50d0a416a5e7 100644
> --- a/include/linux/device/driver.h
> +++ b/include/linux/device/driver.h
> @@ -240,7 +240,6 @@ driver_find_device_by_acpi_dev(struct device_driver *drv, const void *adev)
>  }
>  #endif
>  
> -extern int driver_deferred_probe_timeout;
>  void driver_deferred_probe_add(struct device *dev);
>  int driver_deferred_probe_check_state(struct device *dev);
>  void driver_init(void);
> -- 
> 2.38.1
> 

