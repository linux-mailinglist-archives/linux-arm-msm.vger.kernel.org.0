Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69D0962DFC1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Nov 2022 16:23:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240348AbiKQPXM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Nov 2022 10:23:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234887AbiKQPWd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Nov 2022 10:22:33 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0575A200
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Nov 2022 07:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668698394;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=TobA0krOtaSl7P1GGJ20EZXgKGm0ZbyqFXKercBRCd0=;
        b=DBCTzn4lPOgPyl6vpbHFUmAEHOj4gsS2htrgVYMjehly4SrWtpAnScREeCRZNbMMQ8malO
        OXdckp9tPN58V6D47E3MUfpWGcbmbXUS/N/H3yju4OLG1qWt/Wf24x0PlUIpRc4HVfTsUe
        eCSJFfm5vY0T4ycMB/TiIvuaUIhpFiI=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-601-GpZbsb02Ps-ZE4iFKo5HQw-1; Thu, 17 Nov 2022 10:19:53 -0500
X-MC-Unique: GpZbsb02Ps-ZE4iFKo5HQw-1
Received: by mail-oi1-f200.google.com with SMTP id o12-20020a056808124c00b00353f308fb4bso908682oiv.22
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Nov 2022 07:19:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TobA0krOtaSl7P1GGJ20EZXgKGm0ZbyqFXKercBRCd0=;
        b=gpVyeMSbCwzuysXr76cVlanKv5cOGuok1j4zVBzYiY129I6h2WTW+o5aaIhXT7AsSz
         PcyF/F1LeqdHEAKzsnFMSFGzUYABS5HMZSz/kIzizoybEDKR8dZhv0kRAYrC7TtawtDV
         rAYMnJ4GgDxAXItu3xbMUbBrSVbVtjiri/3ebciF0wVoifuRadm7wwg1b8YZQalRKjZY
         cJFT0OG/+Zceaf5rHc2hheYx59u7+ZlJOEMcmAuU2yhpNdmfBycTsOeLNdH0vFh8enDd
         y7qLJLjh3k+patIavnpxNcikiM8WRpwF13nx9/zAdjgy1EoHAFchewU/qH5mWKFpb018
         D93Q==
X-Gm-Message-State: ANoB5pm9NcXrqksCsRGGT7jP9Kc6Xsvkt9Olo/znDEpUZ0Sr+DAlVA2a
        jsJuuDZWRNczjhsOp9z+2AmjkEaNfJw8VUeReeriAFSjvQmyK1dce329dx5AowBIC4GiRmHfKYo
        sSLKDEMRWqElPbkgQbQwkgVESnw==
X-Received: by 2002:a05:6808:1719:b0:35a:f1e9:6536 with SMTP id bc25-20020a056808171900b0035af1e96536mr1404866oib.100.1668698392310;
        Thu, 17 Nov 2022 07:19:52 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5qkQT8FtSupazP+csDv9DFb452dAxzo2zNrweRI6MELBpkfXftBeXXuY0hsdYkndSa5d/3GQ==
X-Received: by 2002:a05:6808:1719:b0:35a:f1e9:6536 with SMTP id bc25-20020a056808171900b0035af1e96536mr1404850oib.100.1668698392000;
        Thu, 17 Nov 2022 07:19:52 -0800 (PST)
Received: from halaney-x13s ([2600:1700:1ff0:d0e0::41])
        by smtp.gmail.com with ESMTPSA id u1-20020a056808000100b003546fada8f6sm404205oic.12.2022.11.17.07.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 07:19:51 -0800 (PST)
Date:   Thu, 17 Nov 2022 09:19:49 -0600
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
Subject: Re: [PATCH v2 3/4] driver core: Add fw_devlink.timeout param to stop
 waiting for devlinks
Message-ID: <20221117151949.3cbc6cwphnv4scze@halaney-x13s>
References: <20221116115348.517599-1-javierm@redhat.com>
 <20221116120159.519908-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221116120159.519908-1-javierm@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 16, 2022 at 01:01:59PM +0100, Javier Martinez Canillas wrote:
> Currently, the probe deferral timeout does two things:
> 
> 1) Call to fw_devlink_drivers_done() to relax the device dependencies and
>    allow drivers to be probed if these dependencies are optional.
> 
> 2) Disable the probe deferral mechanism so that drivers will fail to probe
>    if the required dependencies are not present, instead of adding them to
>    the deferred probe pending list.
> 
> But there is no need to couple these two, for example the probe deferral
> can be used even when the device links are disable (i.e: fw_devlink=off).
> 
> So let's add a separate fw_devlink.timeout command line parameter to allow
> relaxing the device links and prevent drivers to wait for these to probe.
> 
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
> 
> (no changes since v1)
> 
>  .../admin-guide/kernel-parameters.txt         |  7 ++++
>  drivers/base/dd.c                             | 38 ++++++++++++++++++-
>  2 files changed, 44 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index a465d5242774..38138a44d5ed 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -1581,6 +1581,13 @@
>  			dependencies. This only applies for fw_devlink=on|rpm.
>  			Format: <bool>
>  
> +	fw_devlink.timeout=

Just thought about this, but I think this should be called
fw_devlink_timeout. Generally the $MODULE.$PARAM syntax is reserved for
things that can be specificed with module_param().

The advantage is if you accidentally type say fw_devlink_timeut=10 the
kernel logs will indicate it has no clue what that means. Including the
"." makes the kernel assume that maybe a future module name fw_devlink
will be loaded, and at that time will see if that module has the
parameter mentioned. A little thing but I think work changing in v3.

Thanks,
Andrew

