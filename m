Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E3FB6194A6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Nov 2022 11:39:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231339AbiKDKjW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Nov 2022 06:39:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229823AbiKDKjS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Nov 2022 06:39:18 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB8242B62A
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Nov 2022 03:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667558291;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=M88yz4GfmbUNq4mWECugnsnJkV6z34uCwDqL3DFZ74U=;
        b=MrQOvOT4UxP3Qtv+fB8Cl9dUzB13vT4MHUxpeRqO0M7dcIyiaU4vcp0tqFUwRxc4Zx0M6i
        k9OUEBmsW29X30aW4lcmdjH20oEtmDRuouU+eN3LVO6xlLHVgWaX6tKgAgwghsiX6W0bxS
        Zi9nCwZOieaNB5Pyewd7sZ5c+c0b+pk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-55-9v6L-ysyMGeQnEy-y4jSsg-1; Fri, 04 Nov 2022 06:38:10 -0400
X-MC-Unique: 9v6L-ysyMGeQnEy-y4jSsg-1
Received: by mail-wr1-f71.google.com with SMTP id c18-20020adfa312000000b002364fabf2ceso1085882wrb.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Nov 2022 03:38:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M88yz4GfmbUNq4mWECugnsnJkV6z34uCwDqL3DFZ74U=;
        b=ZYOe5SPWQ8o5wHJtwtyW5icN9vVw6KRBvhdxz4ICJLK/er49B0SRc4Lm0NLCEPV15T
         GGCyl8pWDWXkmJr50NKjIQLnEPdiA3JNg7QFDRDKTExnUKbtO9sptUlnDgrGPiI6ssts
         vefdm6Xak5tbMa/seJFJRjNqOs2L3T8n+Mr2hNduZUwFsjhFQ8P8heCd+A27v8VmJkss
         oeXmvUK3q/GH9WnMZLO9RSq+kTYcllWe6HpVE1D9wzWfo6e7rDP5kxNhsi6SUnyz4XV+
         tspsQwr3myQiBE6PDDhvdrfsyigcrwvq3HnNabj13ONiJ7AOMA3l8MD2riwSBVGrMM+9
         ALtg==
X-Gm-Message-State: ACrzQf0UD/K3rJtIAFzQRHmRG1fb7uGUKIETwbC5ahK3+EpF65kfdHJW
        nNHqBG7IafS6izKf58tlnlmdoxGkthrBquugWfnX651pKXIhnTJw0HtYiXyEUL7rVJag1a+DoAj
        eIRIKLpjEzCAU/ERUmaill5yeLA==
X-Received: by 2002:adf:bc51:0:b0:236:8fa1:47ea with SMTP id a17-20020adfbc51000000b002368fa147eamr218068wrh.77.1667558289566;
        Fri, 04 Nov 2022 03:38:09 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6s9MOXnwXonR8VOapq6d4n3ZU7IGA+EIjACuJbvHHOLIXD7EQUkeJV/V+5P7qnQBQKVLAVkQ==
X-Received: by 2002:adf:bc51:0:b0:236:8fa1:47ea with SMTP id a17-20020adfbc51000000b002368fa147eamr218064wrh.77.1667558289372;
        Fri, 04 Nov 2022 03:38:09 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id k4-20020a05600c1c8400b003b4cba4ef71sm2534442wms.41.2022.11.04.03.38.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Nov 2022 03:38:09 -0700 (PDT)
Message-ID: <1f5e6de4-3fe2-7933-f8c0-5f13564595cc@redhat.com>
Date:   Fri, 4 Nov 2022 11:38:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v3 23/23] drm/fb-helper: Clarify use of last_close and
 output_poll_changed
Content-Language: en-US
To:     Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
        airlied@gmail.com, sam@ravnborg.org, mripard@kernel.org,
        maarten.lankhorst@linux.intel.com
Cc:     linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-samsung-soc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org, xen-devel@lists.xenproject.org,
        linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
        linux-mediatek@lists.infradead.org,
        spice-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20221103151446.2638-1-tzimmermann@suse.de>
 <20221103151446.2638-24-tzimmermann@suse.de>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221103151446.2638-24-tzimmermann@suse.de>
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

On 11/3/22 16:14, Thomas Zimmermann wrote:
> Clarify documentation in the use of struct drm_driver.last_close and
> struct drm_mode_config_funcs.output_poll_changed. Those callbacks should
> not be said for fbdev implementations on top of struct drm_client_funcs.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

