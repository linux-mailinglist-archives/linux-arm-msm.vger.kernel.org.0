Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3952257F697
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Jul 2022 20:47:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231217AbiGXSrr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Jul 2022 14:47:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbiGXSrq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Jul 2022 14:47:46 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C2AC6E009
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Jul 2022 11:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1658688464;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xHhcfGRCAjt5E9OSivN130xjZgYbsf/HAXgqsJ2fhnE=;
        b=c+eFMsCNXftjo+73cgj9J7U4Sgb9Dn9BMuO0388Sxh82d9gSuYMcIQw/29t5/iGlYISpgo
        8ypZEvKXsCQHO6T8cb1JzPFF9EmuP/wktwyM/QlckciEKd4xOahyNQmFc9fcOyeMjlqQIW
        tXwOKDgPjBwhkBhu9XWImUM6CYtOZC4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-527-_7QDLBEeOcutAWq_Cra3og-1; Sun, 24 Jul 2022 14:47:43 -0400
X-MC-Unique: _7QDLBEeOcutAWq_Cra3og-1
Received: by mail-wm1-f70.google.com with SMTP id r82-20020a1c4455000000b003a300020352so5044757wma.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Jul 2022 11:47:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=xHhcfGRCAjt5E9OSivN130xjZgYbsf/HAXgqsJ2fhnE=;
        b=Dd4MEOgBmSV6whikMYi4kWmU8wE6RH3nbebThDUCyl85hsRUtxr2Vsxsdj2wb8U7C2
         frOduwqF3pHzsZztN04712OVvT8lC5Wy7DT4rrSOu80aqD74uVAlQPM9XcP4ojFHmuOv
         WDtXq0NnfN6pwI3YD4lQHgRQ4FkhJ3txq1VJa/JE7xcO2XH0lTQDk/hyu0LuysdL5RbX
         7CUZQxIzBhlE9qh5bScdNCUWljy23pi8+tvciXjjBewduuDmTfXGyVeespprALJSL01U
         Zr87SvtJlFLJKlpHISKNX/Q+5HR7uD6lEJXVdodv+86LGcI/LlmVLSE/3UYoBUdFQJa/
         0MPQ==
X-Gm-Message-State: AJIora9asJbmVi5W1R+tTtaXYxZUVU8f673q+ICJ5tceX9FH4FnqoUzy
        O1aM/nfeqEyBjhQL/cDC9FNCDg7rbrmCvhxYlsnRaQYoCGKhs/py4Qev2hN5hUXZOF/YXqeSaIY
        9AGSWLkWejoON3cFLi+OJ25xyeg==
X-Received: by 2002:a05:600c:284a:b0:3a2:ffb7:b56f with SMTP id r10-20020a05600c284a00b003a2ffb7b56fmr18986256wmb.134.1658688461905;
        Sun, 24 Jul 2022 11:47:41 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v//byKmdQgT5WvEWcDFD958f9+TODdjybZDGMctnTVoovPF22h8szxUHlYNCu+EncFlDUATg==
X-Received: by 2002:a05:600c:284a:b0:3a2:ffb7:b56f with SMTP id r10-20020a05600c284a00b003a2ffb7b56fmr18986246wmb.134.1658688461720;
        Sun, 24 Jul 2022 11:47:41 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id o8-20020a05600c378800b003a2e7c13a3asm11441121wmr.42.2022.07.24.11.47.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Jul 2022 11:47:41 -0700 (PDT)
Message-ID: <6b3f98db-83bf-41cd-b23d-79b455a06ebd@redhat.com>
Date:   Sun, 24 Jul 2022 20:47:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] drm/msm: Make .remove and .shutdown HW shutdown
 consistent
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Fabio Estevam <festevam@gmail.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
References: <20220724111327.1195693-1-javierm@redhat.com>
 <CAA8EJppEpPe4nfZ_kvNen6shSvgyUoL3adSQfhhCGCS2VmVZhQ@mail.gmail.com>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAA8EJppEpPe4nfZ_kvNen6shSvgyUoL3adSQfhhCGCS2VmVZhQ@mail.gmail.com>
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

Hello Dmitry,

Thanks for your feedback.

On 7/24/22 20:36, Dmitry Baryshkov wrote:
> On Sun, 24 Jul 2022 at 14:13, Javier Martinez Canillas
> <javierm@redhat.com> wrote:

[...]

>>
>> +/*
>> + * Shutdown the hw if we're far enough along where things might be on.
>> + * If we run this too early, we'll end up panicking in any variety of
>> + * places. Since we don't register the drm device until late in
>> + * msm_drm_init, drm_dev->registered is used as an indicator that the
>> + * shutdown will be successful.
>> + *
>> + * This function must only be called if drm_dev->registered is true.
>> + */
>> +static inline void msm_shutdown_hw(struct drm_device *dev)
>> +{
>> +       drm_atomic_helper_shutdown(dev);
>> +}
> 
> Now there is no point in having this as a separate function. Could you

The only reason why I kept this was to avoid duplicating the same comment
in two places. I thought that an inline function would be better than that.

> please inline it?
>

That's already the case. Sorry but I have to ask, do you read my patches
before commenting? I have the feeling that is the second time that you ask
for something that was already done in the patch.
 
[...]

>>
>> -       if (!priv || !priv->kms)
>> -               return;
>> -
>> -       drm_atomic_helper_shutdown(drm);
> 
> It might be worth repeating the comment here.
>

As mentioned I thought about it. But then decided that an inline function would
be better to have the comment just in one place. I don't have a strong opinion
though so I could change if others agree that duplicating the comment is better.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

