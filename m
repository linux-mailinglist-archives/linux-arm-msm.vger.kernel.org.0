Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5C8662BB9D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 12:25:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239252AbiKPLZo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 06:25:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233287AbiKPLZV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 06:25:21 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FAA14508B
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 03:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668597245;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=AqO20RkBmPLk/Zsbvz4xja2ZPkggecsj1kg48NugNtU=;
        b=Z/6XnAYVImU6vSBStf9MIEJs45vO96im9b/75gKcuxkRHddXbnHXxNjnEDt5Spu/YEarEm
        YoZGo/dz5hNmfQ/eeUNWzLQV8eiTwiu/co1ZfCfH6OV0Qd/qI6+y6+TwP6JNAaUDhFe4/Q
        NuNrVa8pX4q/+3T8j3F8Fj2J23rqWqE=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-443-Hnc7JJ0HMX6DKZrZ93LDIA-1; Wed, 16 Nov 2022 06:14:04 -0500
X-MC-Unique: Hnc7JJ0HMX6DKZrZ93LDIA-1
Received: by mail-qt1-f200.google.com with SMTP id fb5-20020a05622a480500b003a525d52abcso12650698qtb.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 03:14:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AqO20RkBmPLk/Zsbvz4xja2ZPkggecsj1kg48NugNtU=;
        b=I2ODzvSvUbXvT8YE2/YDc5jZ/vsJ6zKSq7hZt7WHlR5bE8KAtwuPlg5NfrUkn8G7UL
         eLjzxAv187XfPKNFAeKqjPWksjV8VMwMNu0QrZRWXIpEw5aOP5TkzV4F+kBgLam2oUK4
         MSMnmsCidCgtaNChXEjbiYHlejZuE45GQXSs69Ex8DNp9vjwAthQ/rWe7J5dnGZ2s7Ah
         5LlG/Gn9VXyP4HMB0z7mkBW9urUq3D6kxRp6eRtWTsglMsi+DOdOLxszQIgnwyhB2QCr
         J0zKfZlpDeSUaW9bs819MZObxoQ+bPzJ3+YQRzLAqJK+n1w8o0t12zZjBpAX3mHx6hxH
         Hv6g==
X-Gm-Message-State: ANoB5pmBXj1m8FGFAu74iHuEhSruKiS3W8VY87MNR6XfCX1UrXqKIzsn
        1z6G04O1dPmP9RZh05wf722Y4228DDXtvQb+djR1m7NZPCHIfEWNHegET8Z3dJU/mbtCdk/4UOq
        z/atjxvg2wNWEwDKt6djnwLtw1Q==
X-Received: by 2002:ad4:450d:0:b0:4c6:5a5f:3063 with SMTP id k13-20020ad4450d000000b004c65a5f3063mr6024309qvu.4.1668597243594;
        Wed, 16 Nov 2022 03:14:03 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7zVoHnSML4pkn3Q4Eh7xfnZiowbK8L5hFzRTrOFF/MLKTx3usbbcLq0D+RjcLq4PE4cjVYNw==
X-Received: by 2002:ad4:450d:0:b0:4c6:5a5f:3063 with SMTP id k13-20020ad4450d000000b004c65a5f3063mr6024286qvu.4.1668597243332;
        Wed, 16 Nov 2022 03:14:03 -0800 (PST)
Received: from x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id g6-20020ac870c6000000b003996aa171b9sm8427814qtp.97.2022.11.16.03.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 03:14:03 -0800 (PST)
Date:   Wed, 16 Nov 2022 06:14:01 -0500
From:   Brian Masney <bmasney@redhat.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linus.walleij@linaro.org, brgl@bgdev.pl,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, psodagud@quicinc.com,
        quic_shazhuss@quicinc.com, quic_ppareek@quicinc.com,
        ahalaney@redhat.com, echanude@redhat.com,
        nicolas.dechesne@linaro.org
Subject: Re: [PATCH RFC] gpiolib: ensure that fwnode is properly set
Message-ID: <Y3TF+VbE5yFlz+OZ@x1>
References: <20221114202943.2389489-1-bmasney@redhat.com>
 <Y3S5sZIVi2DPua0p@orome>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3S5sZIVi2DPua0p@orome>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 16, 2022 at 11:21:37AM +0100, Thierry Reding wrote:
> On Mon, Nov 14, 2022 at 03:29:43PM -0500, Brian Masney wrote:
> > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > index 11fb7ec883e9..8bec66008869 100644
> > --- a/drivers/gpio/gpiolib.c
> > +++ b/drivers/gpio/gpiolib.c
> > @@ -678,7 +678,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
> >  	 * Assign fwnode depending on the result of the previous calls,
> >  	 * if none of them succeed, assign it to the parent's one.
> >  	 */
> > -	gdev->dev.fwnode = dev_fwnode(&gdev->dev) ?: fwnode;
> > +	gc->fwnode = gdev->dev.fwnode = dev_fwnode(&gdev->dev) ?: fwnode;
> 
> This doesn't look right to me. Looking at the documentation of
> gc->fwnode and how it is used, the purpose of this is to allow
> explicitly overriding the fwnode that the GPIO chip will use.
> 
> So really this should not be used beyond the initial registration
> in gpiochip_add_data_with_key(). If the above patch fixes anything,
> then I suspect somebody is using gc->fwnode outside of this
> registration.
> 
> Looking at gpiolib, the only remaining place that seems to do this is
> the gpio-reserved-ranges handling code, in which case, the below on top
> of my initial patch might fix that. That might explain why MSM is still
> seeing issues.

That is correct. The Thinkpad x13s laptop uses the driver
drivers/pinctrl/qcom/pinctrl-sc8280xp.c and
arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts defines a
gpio-reserved-ranges property. The SA8540p automotive board has the same
SoC, however the DTS we are using doesn't use the gpio-reserved-ranges
property, and why only your original patch fixed the issue for this
board.

I think my patch should be removed from the GPIO tree if Thierry's two
patches work for everyone.

Brian

