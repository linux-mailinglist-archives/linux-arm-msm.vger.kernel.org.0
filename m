Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AE4257F442
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Jul 2022 11:06:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229925AbiGXJGb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Jul 2022 05:06:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbiGXJGb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Jul 2022 05:06:31 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BE33115FD3
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Jul 2022 02:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1658653588;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0rgI7ZvLoF/2I7hj7OPDobDAAixr8lx8606jK11C1Ug=;
        b=Ty8r9H0wSTRQY/a/CUDDWc09MNC/yrRwlNOd7uDctrBUSm88KAW2alax3lJfNu0902O0RQ
        zPBZt9gQyJChg3VnVUlFliP4n1czuAIo7urpXXiVCdRlaicK2204/iOeIizmRUYcQYy3EA
        GHUcSCXwPupb9vp6DuepADdMvXQPkdA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-45-nbuYYZX7MP-7Fnq56j8R3w-1; Sun, 24 Jul 2022 05:06:27 -0400
X-MC-Unique: nbuYYZX7MP-7Fnq56j8R3w-1
Received: by mail-wm1-f69.google.com with SMTP id h189-20020a1c21c6000000b003a2fdf9bd2aso4650999wmh.8
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Jul 2022 02:06:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0rgI7ZvLoF/2I7hj7OPDobDAAixr8lx8606jK11C1Ug=;
        b=cM97HwfXDHRow3DcgAzf3ewz6hed54U5/OS9e22eaSSfcV6E8eJDJ/v1etuRhcmblt
         0LWc3RZRhk+3fE/we9a89BqbYiAWr+IoXrsx7+xQJoU2EhCMU3n6smPhm6jPAcpPsQvZ
         NskmSFfvfy9TaxJeasbR0z+AZXHfw77J3h10Xv/yScjhk7foSB2JKD/0VbLkXMrwGCiA
         6ZKz5GpiGKgAQ+ZvO2qcjFx8jDj5yECMrpJTWBzKiSm4z7yOkeMhp1f1vbO6jCbrIFCl
         mDPNWwG5akX/IpERJ90p5tsVPjJp2g7Pqwo8sXmK+Dab4YdDkv89rLGk7AMFATXDu4pd
         1mvQ==
X-Gm-Message-State: AJIora8h9GETKdNtmYRlbzhWzQBCkNDAczSAycXniAXtxbvRZ/+bx23U
        5sA85uy+jx8vvcNqZ98HDfML+IOhy41HTOX94EnyOoFGyHtiu8yQESRRsuR4Ijl1SckjvBsi4KE
        AUDr/VlP0Z1arc/6XJ5dCLqPx/A==
X-Received: by 2002:a05:600c:4f89:b0:3a3:31a5:87f9 with SMTP id n9-20020a05600c4f8900b003a331a587f9mr11283150wmq.149.1658653586115;
        Sun, 24 Jul 2022 02:06:26 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1upbEJz+hVLYetsHfwF/nFR/6sqHMBakgcujGYHz0NqH/7bHxc1i+KjazGfs5KOD1FhQMoNKA==
X-Received: by 2002:a05:600c:4f89:b0:3a3:31a5:87f9 with SMTP id n9-20020a05600c4f8900b003a331a587f9mr11283134wmq.149.1658653585774;
        Sun, 24 Jul 2022 02:06:25 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id q184-20020a1c43c1000000b003a302fb9df7sm13972584wma.21.2022.07.24.02.06.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Jul 2022 02:06:25 -0700 (PDT)
Message-ID: <7dc80ce9-83d5-2dc2-f660-fb8f6162c893@redhat.com>
Date:   Sun, 24 Jul 2022 11:06:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/msm: Make .remove and .shutdown HW shutdown
 consistent
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
References: <20220723210825.564922-1-javierm@redhat.com>
 <CAA8EJpqr3GmQ3=p5_02dAnrK8HrUsf1yYxVKZL6g27eZXZ_U8w@mail.gmail.com>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAA8EJpqr3GmQ3=p5_02dAnrK8HrUsf1yYxVKZL6g27eZXZ_U8w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 7/24/22 10:53, Dmitry Baryshkov wrote:
> On Sun, 24 Jul 2022 at 00:09, Javier Martinez Canillas

[...]

>> -
>>         /*
>>          * Shutdown the hw if we're far enough along where things might be on.
>>          * If we run this too early, we'll end up panicking in any variety of
>> @@ -205,10 +199,21 @@ static int msm_drm_uninit(struct device *dev)
>>          * msm_drm_init, drm_dev->registered is used as an indicator that the
>>          * shutdown will be successful.
>>          */
>> -       if (ddev->registered) {
>> +       if (dev->registered)
>> +               drm_atomic_helper_shutdown(dev);
>> +}
>> +
>> +static int msm_drm_uninit(struct device *dev)
>> +{
>> +       struct platform_device *pdev = to_platform_device(dev);
>> +       struct msm_drm_private *priv = platform_get_drvdata(pdev);
>> +       struct drm_device *ddev = priv->dev;
>> +       struct msm_kms *kms = priv->kms;
>> +       int i;
>> +
>> +       if (ddev->registered)
>>                 drm_dev_unregister(ddev);
> 
> No. The drm_dev_unregister() should come before drm_atomic_helper_shutdown().
>

I'm not sure to understand what you meant here, since drm_dev_unregister() is
called before drm_atomic_helper_shutdown() that's called in msm_shutdown_hw().
 
> Also drm_dev_unregister() should not be a part of .shutdown callback.
> See the documentation in the drm_drv.c
>

It is not right now, msm_shutdown_hw() only calls drm_atomic_helper_shutdown()
but drm_dev_unregister() is still called from the msm_drm_uninit() function.
 
Now, your comment made me realize that there's a bug in this patch since after
the drm_dev_unregister(), dev->registered will be set to false and so in the
.remove -> .unbind path drm_atomic_helper_shutdown() will never be executed.

I guess one option is to do the if (dev->registered) check in the callers but
then it won't really be worth it to have a helper and we could just add that
check in msm_drv_shutdown() to conditionally call drm_atomic_helper_shutdown().

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

