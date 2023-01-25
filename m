Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4CCF67AE47
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jan 2023 10:42:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234946AbjAYJmA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Jan 2023 04:42:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234138AbjAYJl7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Jan 2023 04:41:59 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E91C430DF
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jan 2023 01:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674639668;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZiXmPj1TLICEH85h0g9ObpieXhmW8hbY1dyGTe1WVko=;
        b=Km6gExUB7q+SFkVkSURn+CyhaPLT6yTla50HLsl8iKD8VxS7MMwmWmSBiLC/G/JcsUSCk9
        KhK1bt2RopU1vxsA4uVAThRv2tIhysEDWxeCgBQl2ZSZcfMGlMv3Ya0Q4HwOdkuLd0+7Nf
        4wOFNqd+uqHuSWDWTj7GcD8F4aL7lg8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-594-ZIqPqbYONTSUB_3q5iJ5eQ-1; Wed, 25 Jan 2023 04:41:07 -0500
X-MC-Unique: ZIqPqbYONTSUB_3q5iJ5eQ-1
Received: by mail-wr1-f71.google.com with SMTP id k18-20020adfb352000000b002bdd0a7a2b5so3047224wrd.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jan 2023 01:41:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZiXmPj1TLICEH85h0g9ObpieXhmW8hbY1dyGTe1WVko=;
        b=5QBDUjxPg17zMkYxHp4FzbpotAFHNZGQxUXDeSI5z9XH41kBAW6PevKNhTGWXAsa4O
         AeX7jxVRabs0XPUPJ5LuGQYmon0+1EDr4ms7VeQ0+l3+LImA6ARkcCbzaMCLGozGyTrP
         5P2vNpIMHsvjv9Daji3AcSwZkpCmYdIv7JJ062vnRJ1FJoeyVN7j2+gk8+l9ajDMwriF
         k6uM9/52MXr83enHGyhb94nFtclz9wBAdC0FR926tF5lSYRUzx/G+mC5rn63HmZ5OSFg
         GSCKrMidLNmBFrAOMwmh1oya63JMV1vcDOfMqZ07YHTTlq4hnS9tPMgILRJkfcglS/xD
         9LPw==
X-Gm-Message-State: AFqh2koC+Mrhye4wQL9sZNwWW6tVMU7mWeuwicEkInk+ooRcNyrxH7z6
        sXlbhmJCQrVvi+ms7D0YsgS7Lf6deC/CLm9QRPkqsueXFr+sFCzag+Nrs3ZF0TkX9xAgZUWZ++8
        afNglYuhL6V0iSQoXoy5qfBEL0w==
X-Received: by 2002:a5d:5c0b:0:b0:2bd:15ef:fe7 with SMTP id cc11-20020a5d5c0b000000b002bd15ef0fe7mr27416472wrb.3.1674639665559;
        Wed, 25 Jan 2023 01:41:05 -0800 (PST)
X-Google-Smtp-Source: AMrXdXspvSYF5UcTCX9Syl/sB5Wttapk1TJmAOGMxlySA2rIPpJprAbwV2wYhJQSWjxg72A43lgFrQ==
X-Received: by 2002:a5d:5c0b:0:b0:2bd:15ef:fe7 with SMTP id cc11-20020a5d5c0b000000b002bd15ef0fe7mr27416452wrb.3.1674639665344;
        Wed, 25 Jan 2023 01:41:05 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id a18-20020a056000101200b002be25db0b7bsm4010247wrx.10.2023.01.25.01.41.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 01:41:04 -0800 (PST)
Message-ID: <66114220-d226-e0e9-bf09-707388ce98f3@redhat.com>
Date:   Wed, 25 Jan 2023 10:41:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 06/10] drm/fb-helper: Initialize fb-helper's preferred
 BPP in prepare function
Content-Language: en-US
To:     Thomas Zimmermann <tzimmermann@suse.de>, airlied@gmail.com,
        daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20230124134010.30263-1-tzimmermann@suse.de>
 <20230124134010.30263-7-tzimmermann@suse.de>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20230124134010.30263-7-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 1/24/23 14:40, Thomas Zimmermann wrote:
> Initialize the fb-helper's preferred_bpp field early from within
> drm_fb_helper_prepare(); instead of the later client hot-plugging
> callback. This simplifies the generic fbdev setup function.
> 
> No real changes, but all drivers' fbdev code has to be adapted.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

