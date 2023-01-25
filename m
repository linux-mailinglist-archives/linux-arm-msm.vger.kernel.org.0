Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EA1B67AEA2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jan 2023 10:45:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235322AbjAYJpz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Jan 2023 04:45:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235329AbjAYJpy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Jan 2023 04:45:54 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5B9F559A
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jan 2023 01:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674639865;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tz7iyPImvcUWB9Dn0OtZ/fnzXULpckXnCuNXHm7FVL4=;
        b=dEPRKEfv2I8PrPFwLRUNp5axz9coxqJWRVKjnA8kk7ECHiEO/xIK7BiNeGKfjHuJ4eW88y
        KrtI6Ronm4wmzmNaydPe9JgRPXwLoB8+CiJ75A3Vfzs0zvp9kz+yLuQro148oesbIhl9BA
        R+SX9jbf+KJZCSSm8u1JRv9uUfXudPY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-672-4Q1gZ1KQOwWeUil6q7Aw1w-1; Wed, 25 Jan 2023 04:44:22 -0500
X-MC-Unique: 4Q1gZ1KQOwWeUil6q7Aw1w-1
Received: by mail-wr1-f69.google.com with SMTP id r1-20020adfa141000000b002be28fd4a7bso3062657wrr.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jan 2023 01:44:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tz7iyPImvcUWB9Dn0OtZ/fnzXULpckXnCuNXHm7FVL4=;
        b=QiYnWJckv1Hoh2Vp0bClfNa9O+ZAn80Q5npG3lnK19gpjk6LF+bKAPbEif+agwdHzp
         8xwPKcGpIORfdhxYBV2ZhlJTbDtQqePNu3PGqWhxlnL+1tm2jnc8cKLKYmPqmd9iOeJ/
         QBXd5E0xCJy+czkW27rkIyEv3N2BMC1GbbOfVdrUoJ3/zPRel9oAAs55J+Ym2j97i4x4
         j4vLGpw/YAk7bdim/N8pL4ClM/rLOHcYK6ykmzj7guA2LgtYzCRTzaAoqyLBqcGvr7Pg
         VTx921eyOK+ppY5yrzuuFClpXdWraGWhWT3xIAOF2HkcpMsHBZXavJKLmilk+7rZbzva
         8PEA==
X-Gm-Message-State: AFqh2kq0EmTeB6gbz0MuJJVkpFlr/uv/evx5+gGSxk2Zpemh9hZf79GL
        VpWuyl41nRzFGEZzVZ+OqSzOoYO3gccBDlG+pZoLIUEdz4VUIQMFAQLlrHnGyYtzaRm6tED2GHO
        VzVvUYHEAKFeizVqU+WqxdDr5MQ==
X-Received: by 2002:a1c:4b19:0:b0:3da:fb5c:8754 with SMTP id y25-20020a1c4b19000000b003dafb5c8754mr28002617wma.2.1674639860818;
        Wed, 25 Jan 2023 01:44:20 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs/ZWxYog8h3iR/G4m+bOHxbXPWtvCX/ZVFIUBahKB+Crw5vqS3Y5d/LkCiQwFYvGuCaEiL4A==
X-Received: by 2002:a1c:4b19:0:b0:3da:fb5c:8754 with SMTP id y25-20020a1c4b19000000b003dafb5c8754mr28002601wma.2.1674639860545;
        Wed, 25 Jan 2023 01:44:20 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id h9-20020a05600c314900b003c6f8d30e40sm1345518wmo.31.2023.01.25.01.44.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 01:44:20 -0800 (PST)
Message-ID: <13f04dbd-07f2-f01a-7d67-75a554374ddf@redhat.com>
Date:   Wed, 25 Jan 2023 10:44:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 07/10] drm/fbdev-generic: Minimize hotplug error
 handling
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
 <20230124134010.30263-8-tzimmermann@suse.de>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20230124134010.30263-8-tzimmermann@suse.de>
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
> Call drm_fb_helper_init() in the generic-fbdev hotplug helper

drm_fb_helper_fini()

> to revert the effects of drm_fb_helper_init(). No full cleanup
> is required.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

