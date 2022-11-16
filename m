Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D422662C52F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 17:44:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238882AbiKPQo4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 11:44:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238758AbiKPQoY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 11:44:24 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED2FAF0E
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 08:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668616777;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=MKOWgS4WzWGeD29Cp2SqGUWIo6TLQiVsvbTZsJFncDE=;
        b=gGyQpVvrdHKnOgrBCVtVn0W5xusHkneeDqIUWPm5PmxjtsrIJUYe/1uhorwh1vdh4BIgKG
        DkNxW3SkjC4cSy6mJujP901A4E+I684l2UABQ8Q9M921ljVVy0e18OXyE7QQA2gG2wVP5v
        JM+/bMhKX0QKzqOVYg0HVOtjsHGtFWU=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-586-o3cIMlXkOjq2a3Xu3AgjXA-1; Wed, 16 Nov 2022 11:39:35 -0500
X-MC-Unique: o3cIMlXkOjq2a3Xu3AgjXA-1
Received: by mail-oi1-f199.google.com with SMTP id be25-20020a056808219900b0035ad466a313so4605443oib.17
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 08:39:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MKOWgS4WzWGeD29Cp2SqGUWIo6TLQiVsvbTZsJFncDE=;
        b=Xekm9qemAjXJoc/vRqGkOKKnOZrK4uK4UAYVEjYk8WSbneOkHS+wDHBQViBBzMKK5A
         k/V6T/oJR8/IIQ40BHW41lKtrRMDAMi3w63yZjR2o9PzjUa8VAZpNcHiudRa1L4VZq+7
         j+73Wk32BCjdkdDHc2tZceRj6wIVvfwlNW41oljNsn2FP0WZK4CFTHG5xuNPFvvsjbX5
         hNNdHI/prURQGcXAA1zgVPuRhtMWdqFqo9VW+XCjNFbpzltalvZcKcy8r2ovRwxame5w
         UBjRVEqv2PvorAsWf5733iLxO+tv1dQUbIv87YAqkJXWlH5hU8Zj9Nnq+h+MrfzXdlo4
         LhXQ==
X-Gm-Message-State: ANoB5plLirCw1uI/SAXs8CzV26ke0Z6Q5j1GL0bFCLNa510h4m9T+Fmq
        C8v/JG5QtoaWb/pSpsb0e4RNafZl1fFPu7WSJC8gZYa3WtU4cOymTNxpH9wlaKERq0ZeJwTcZzL
        XNwNvB3glm5FcF6L4gst+ffrUeg==
X-Received: by 2002:a05:6808:e8f:b0:354:faf3:50da with SMTP id k15-20020a0568080e8f00b00354faf350damr1980352oil.277.1668616774735;
        Wed, 16 Nov 2022 08:39:34 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6vju2UH23y6HBeQfTVdhTw+4CIus9JPj07In0i4uuXVN8AgOK8z5b0UgszlTIBqN39zYn3oA==
X-Received: by 2002:a05:6808:e8f:b0:354:faf3:50da with SMTP id k15-20020a0568080e8f00b00354faf350damr1980334oil.277.1668616774459;
        Wed, 16 Nov 2022 08:39:34 -0800 (PST)
Received: from halaney-x13s ([2600:1700:1ff0:d0e0::41])
        by smtp.gmail.com with ESMTPSA id e18-20020a9d7312000000b0066c3bbe927esm6804869otk.21.2022.11.16.08.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 08:39:34 -0800 (PST)
Date:   Wed, 16 Nov 2022 10:39:31 -0600
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Javier Martinez Canillas <javierm@redhat.com>
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
Subject: Re: [PATCH v2 2/4] driver core: Set deferred probe timeout to 0 if
 modules are disabled
Message-ID: <20221116163931.ob7szcnjx65c7gz7@halaney-x13s>
References: <20221116115348.517599-1-javierm@redhat.com>
 <20221116120043.519614-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221116120043.519614-1-javierm@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 16, 2022 at 01:00:43PM +0100, Javier Martinez Canillas wrote:
> There is no point to schedule the work queue to timeout the deferred probe
> if all the initcalls are done and modules are not enabled. The default for
> this case is already 0 but can be overridden by the deferred_probe_timeout
> parameter. Let's just disable to avoid queuing a work that is not needed.
> 
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
> 
> (no changes since v1)
> 
>  drivers/base/dd.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> index 040b4060f903..1e8f1afeac98 100644
> --- a/drivers/base/dd.c
> +++ b/drivers/base/dd.c
> @@ -350,8 +350,10 @@ static int deferred_probe_initcall(void)
>  	flush_work(&deferred_probe_work);
>  	initcalls_done = true;
>  
> -	if (!IS_ENABLED(CONFIG_MODULES))
> +	if (!IS_ENABLED(CONFIG_MODULES)) {
> +		driver_deferred_probe_timeout = 0;
>  		fw_devlink_drivers_done();
> +	}
>  

Potentially a stupid suggestion, but would it make sense to take out
the ability to actually set that param if !CONFIG_MODULES? Then
driver_deferred_probe_timeout would be the default value already.

>  	/*
>  	 * Trigger deferred probe again, this time we won't defer anything
> -- 
> 2.38.1
> 

