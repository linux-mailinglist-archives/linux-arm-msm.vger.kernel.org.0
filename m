Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0CEF67AEF0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jan 2023 10:55:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235216AbjAYJzS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Jan 2023 04:55:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235090AbjAYJzQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Jan 2023 04:55:16 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18C2135B6
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jan 2023 01:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674640468;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TouYpeVIY3sVaURhe3OBQ2as0Nh1mIpj/44gYLj7/xc=;
        b=drh/E+7mDMGR49LUHRQH72giJXmyEJfT7HphMML1jyITbr0g5bocRge7O7EIjQxf8i/g+k
        ZbRoyA/AP6Ol9OrA9a7Pb5eUodiS44NHOrIquEVZYHcBzlQ/oF7fVU0ylfW/sfd0W8IqOU
        AwwSFVp6sDMTIW0zdUmOYtxP2Ed/0G8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-323-cjChdnj_Pza9WDKyFNy9fg-1; Wed, 25 Jan 2023 04:54:26 -0500
X-MC-Unique: cjChdnj_Pza9WDKyFNy9fg-1
Received: by mail-wm1-f69.google.com with SMTP id k20-20020a05600c1c9400b003db2e916b3aso818161wms.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jan 2023 01:54:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TouYpeVIY3sVaURhe3OBQ2as0Nh1mIpj/44gYLj7/xc=;
        b=wE2OxxnEulk3abgEuUadxjeZ66jXLg2rJR07IJdnLhA8VgZZvFRxynimoUlkXwJqQm
         lwsoUCkBGwl8t/ehmufN9J3CgtElmy0F4nfsL59mQ6R+X9AjgQVY1Slg9r1wxw0z6U/U
         7eUW5JMmJDbL2jInSesO6LGynQ7EvwT7jKs4oTkgV+Phr4rVTMSZD/7W2vbu+9gFfRMR
         Qj9BKHpY2UVdLTYFSQ8ixqBtRfIfqPqjEsHsml+f/d9YRv7rDotRVJ3gHsHWTMbzNipL
         GGoCYiFMhXewa7ifOjtr8Lbr5EF8EvWPBASPSJFbpSIblXslb5hY3DYyqLpv7E3sGiAf
         33WQ==
X-Gm-Message-State: AFqh2koAVrbf1pKNAGVCHt34QLvyprtfsXKgD3LwzIRswgjxKVLo6juE
        qFIYVP8k0rJIkwBsMebjJWd9GgUBYbIl5LbYrdBgCl/JgSUpeaex6uxernSWbtHKDcktHhbg0m4
        VK3QDSbeCfUOD1AGWgIIq290u5Q==
X-Received: by 2002:a5d:6944:0:b0:2bf:960b:7282 with SMTP id r4-20020a5d6944000000b002bf960b7282mr15280444wrw.44.1674640465869;
        Wed, 25 Jan 2023 01:54:25 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs0qhPZq4DvvRBWKlYakMR9y6Uj+/MSQrsj/7lcQHcP5rYP7V12fMSxLIHPoxhHoCWiXuL3sg==
X-Received: by 2002:a5d:6944:0:b0:2bf:960b:7282 with SMTP id r4-20020a5d6944000000b002bf960b7282mr15280426wrw.44.1674640465680;
        Wed, 25 Jan 2023 01:54:25 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id t9-20020adff049000000b002bddaea7a0bsm3982230wro.57.2023.01.25.01.54.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 01:54:24 -0800 (PST)
Message-ID: <f1441822-c85d-4a2e-7e0c-98c3a6de31ac@redhat.com>
Date:   Wed, 25 Jan 2023 10:54:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 10/10] drm/fbdev-generic: Rename struct fb_info 'fbi'
 to 'info'
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
 <20230124134010.30263-11-tzimmermann@suse.de>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20230124134010.30263-11-tzimmermann@suse.de>
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
> The generic fbdev emulation names variables of type struct fb_info
> both 'fbi' and 'info'. The latter seems to be more common in fbdev
> code, so name fbi accordingly.
> 
> Also replace the duplicate variable in drm_fbdev_fb_destroy().
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

