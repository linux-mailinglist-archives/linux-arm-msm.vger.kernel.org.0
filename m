Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA5676135AC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Oct 2022 13:17:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231311AbiJaMRZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Oct 2022 08:17:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231309AbiJaMRY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Oct 2022 08:17:24 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B60CCEE07
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Oct 2022 05:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667218577;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WlC4H0gmckJZ8E/tDGtmzwjQN3hfnWY+OkvhUHpUiTc=;
        b=SzxIp3KH1MJqCBUG1OdZLDtnmNr9ze9qCNca0D8W7lQRRd7ZxIpp/bc+uAAaPM2RO0+6dP
        gKIwcXSPzSp6YmttVdvmmB32i8J1A4MuFA+0Vaz6QSGVxi4OOhikTdPAddVDg4EK0Msryg
        sHj/vUsp15Qd6j9vD3TLgzuO/uTAz80=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-213-1F99eDDJPdqiNeJ15TfR8Q-1; Mon, 31 Oct 2022 08:16:16 -0400
X-MC-Unique: 1F99eDDJPdqiNeJ15TfR8Q-1
Received: by mail-wr1-f70.google.com with SMTP id o13-20020adfa10d000000b00232c00377a0so3009002wro.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Oct 2022 05:16:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WlC4H0gmckJZ8E/tDGtmzwjQN3hfnWY+OkvhUHpUiTc=;
        b=21OsaI+JjhOjVwBDkfCSFA1eqQWCB6tYfm1OsO0ihOcAar6g4YBszfK+2+8oOCW+9i
         54wAe/9+LuQdtQb+GACgd/OK3++n7xrfiBqCERi+2N5Ww/HK1qsv89GVlI0F+vg3jAwD
         qUpYRDFfekkdF6u/Pn1bOITV3JjmaVjg1iket0zuWO43oUmRuArKBEHNRnLY42S4flYr
         fncOmMRsAjPnNy5SIyr37r6ba63MDzCEe5T14D7vfj7CBW77zmBMTzxt9LqpKeMemsLR
         PgzAabjAs2UrL+1lT9Of5K++gajmI9N0n3scMMr9B6ukPTVJ4/mQjDijp3EPAI5TIo94
         mEJA==
X-Gm-Message-State: ACrzQf01moN33E1lyIDLNKQ5gS+0nXb7kMAYVrJ+Ps9OXfz+ViV9YPv4
        apyA4GG7XgbsKPYv6iAhtEai2VlhTY3AkNlW2pJBTgS8mKymoo55sJkQ7InjM0fY0BUexK2iqjK
        g+NJ7M5WTyen7fzBgmC50HzocHg==
X-Received: by 2002:a05:600c:1c0d:b0:3cf:5fd2:1fd1 with SMTP id j13-20020a05600c1c0d00b003cf5fd21fd1mr10268852wms.8.1667218575322;
        Mon, 31 Oct 2022 05:16:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7vtgF5OcVzyyhJbAVQv0UtjhNq0IgAK2jPkGsnoYeZKQ/ZE7IsMKsB/emo+io4u+dLlmSgSQ==
X-Received: by 2002:a05:600c:1c0d:b0:3cf:5fd2:1fd1 with SMTP id j13-20020a05600c1c0d00b003cf5fd21fd1mr10268814wms.8.1667218575124;
        Mon, 31 Oct 2022 05:16:15 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id d2-20020a05600c34c200b003b3365b38f9sm7118010wmq.10.2022.10.31.05.16.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Oct 2022 05:16:14 -0700 (PDT)
Message-ID: <8423bcd3-84f6-b6c9-914a-c70166e20482@redhat.com>
Date:   Mon, 31 Oct 2022 13:16:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 05/21] drm/imx/dcss: Don't set struct
 drm_driver.output_poll_changed
Content-Language: en-US
To:     Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
        airlied@gmail.com, sam@ravnborg.org, mripard@kernel.org,
        maarten.lankhorst@linux.intel.com
Cc:     dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org,
        etnaviv@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        spice-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        xen-devel@lists.xenproject.org
References: <20221024111953.24307-1-tzimmermann@suse.de>
 <20221024111953.24307-6-tzimmermann@suse.de>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-6-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/24/22 13:19, Thomas Zimmermann wrote:
> Don't set struct drm_driver.output_poll_changed. It's used to restore
> the fbdev console. But as DCSS uses generic fbdev emulation, the
> console is being restored by the DRM client helpers already. See the
> functions drm_kms_helper_hotplug_event() and
> drm_kms_helper_connector_hotplug_event() in drm_probe_helper.c.
> 
> v2:
> 	* fix commit description (Christian)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

