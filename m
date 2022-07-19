Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A3CF5795E2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Jul 2022 11:14:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236335AbiGSJOK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Jul 2022 05:14:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236122AbiGSJOD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Jul 2022 05:14:03 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E44924BCE
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Jul 2022 02:14:02 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id g19-20020a9d1293000000b0061c7bfda5dfso10889052otg.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Jul 2022 02:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=USiHEWO3jenD+4D67wgYkGKlAcIRmi0lfoN5PdFyKzQ=;
        b=dFYdzZzeGTwRc0FPEgBG5fRwMWNVjXZzxLxwtIHOW4IyAUtC1iJhL8ze0h/ntk8Iq4
         lKlrAFaVxT4/pV4802tsmPOfXqrd/5krNwAeme2Ty0hfRzSXMQ2O+C/Kf1izAeM/mOcz
         8LysLHAdaCtPPppxeQNBi2EL1ZGV/VNGij1I4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=USiHEWO3jenD+4D67wgYkGKlAcIRmi0lfoN5PdFyKzQ=;
        b=XuyCxYro4DLRlOMYU4nHJOcH7r4Qa1Po9vM+d4TDnb93go9rh9pjJ4CqDdWSYiy910
         zupN5/EtIyHRi6R8Xddc/lzC1XIaBQckpMECpm9LEwBiO+ARnz+MsZ2qQleR/ifRqyjQ
         juRbACu7GRW/BvkOtzBAf2wTQLz8kWwrEyOhd8K0VypoQVQMB0sXxyHnBfDxTtGvbvH8
         z7VXIlNmqg0Zo7iHrIlFWc6KGu+3Sa+Dy3LWPyuwmaRTULVjbopGdjaiRm/+Vjayhzwz
         6KgqT9okppTV9RRe1kEbQym//l+CSDqWgcJZH9P39ESHYfRzfcGrL+/1OLk+zyI/2/vI
         FH0g==
X-Gm-Message-State: AJIora9KVSOkaRRI+pwJ3/YxUoJBwwyz0RSdPTxOUn4LqvGJ87U4bWQy
        CFYBivGqhzcOqatMwNDFToJE5iEwIIEXRw==
X-Google-Smtp-Source: AGRyM1tkjVwV2eqD6Xw6T7Bhk1xdmw8uZQqT7fnl/fQsnUXPxJs8ruLkyaSBztC20SBXIv7aoF0eqg==
X-Received: by 2002:a05:6830:6183:b0:616:a125:1f84 with SMTP id cb3-20020a056830618300b00616a1251f84mr12343169otb.350.1658222041363;
        Tue, 19 Jul 2022 02:14:01 -0700 (PDT)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com. [209.85.161.51])
        by smtp.gmail.com with ESMTPSA id e4-20020a4ab144000000b004359f3e36e2sm1755011ooo.37.2022.07.19.02.14.00
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Jul 2022 02:14:01 -0700 (PDT)
Received: by mail-oo1-f51.google.com with SMTP id p5-20020a4a4805000000b0043548dba757so2771085ooa.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Jul 2022 02:14:00 -0700 (PDT)
X-Received: by 2002:a81:6ccd:0:b0:31d:c77:73e5 with SMTP id
 h196-20020a816ccd000000b0031d0c7773e5mr33706265ywc.314.1658222030025; Tue, 19
 Jul 2022 02:13:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220715005244.42198-1-dmitry.osipenko@collabora.com>
In-Reply-To: <20220715005244.42198-1-dmitry.osipenko@collabora.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 19 Jul 2022 18:13:39 +0900
X-Gmail-Original-Message-ID: <CAAFQd5C0dx5X=VEqXDyj22fbxs1jhOQLLid3vSNfAc9vataPhg@mail.gmail.com>
Message-ID: <CAAFQd5C0dx5X=VEqXDyj22fbxs1jhOQLLid3vSNfAc9vataPhg@mail.gmail.com>
Subject: Re: [PATCH v1 0/6] Move all drivers to a common dma-buf locking convention
To:     Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc:     David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Gert Wollny <gert.wollny@collabora.com>,
        Gustavo Padovan <gustavo.padovan@collabora.com>,
        Daniel Stone <daniel@fooishbar.org>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rob Clark <robdclark@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas_os@shipmail.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        kernel@collabora.com, virtualization@lists.linux-foundation.org,
        spice-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 15, 2022 at 9:53 AM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> Hello,
>
> This series moves all drivers to a dynamic dma-buf locking specification.
> From now on all dma-buf importers are made responsible for holding
> dma-buf's reservation lock around all operations performed over dma-bufs.
> This common locking convention allows us to utilize reservation lock more
> broadly around kernel without fearing of potential dead locks.
>
> This patchset passes all i915 selftests. It was also tested using VirtIO,
> Panfrost, Lima and Tegra drivers. I tested cases of display+GPU,
> display+V4L and GPU+V4L dma-buf sharing, which covers majority of kernel
> drivers since rest of the drivers share same or similar code paths.
>
> This is a continuation of [1] where Christian K=C3=B6nig asked to factor =
out
> the dma-buf locking changes into separate series.
>
> [1] https://lore.kernel.org/dri-devel/20220526235040.678984-1-dmitry.osip=
enko@collabora.com/
>
> Dmitry Osipenko (6):
>   dma-buf: Add _unlocked postfix to function names
>   drm/gem: Take reservation lock for vmap/vunmap operations
>   dma-buf: Move all dma-bufs to dynamic locking specification
>   dma-buf: Acquire wait-wound context on attachment
>   media: videobuf2: Stop using internal dma-buf lock
>   dma-buf: Remove internal lock
>
>  drivers/dma-buf/dma-buf.c                     | 198 +++++++++++-------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c   |   4 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |   4 +-
>  drivers/gpu/drm/armada/armada_gem.c           |  14 +-
>  drivers/gpu/drm/drm_client.c                  |   4 +-
>  drivers/gpu/drm/drm_gem.c                     |  28 +++
>  drivers/gpu/drm/drm_gem_cma_helper.c          |   6 +-
>  drivers/gpu/drm/drm_gem_framebuffer_helper.c  |   6 +-
>  drivers/gpu/drm/drm_gem_shmem_helper.c        |   6 +-
>  drivers/gpu/drm/drm_prime.c                   |  12 +-
>  drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c   |   6 +-
>  drivers/gpu/drm/exynos/exynos_drm_gem.c       |   2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  20 +-
>  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |   2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_object.h    |   6 +-
>  .../drm/i915/gem/selftests/i915_gem_dmabuf.c  |  20 +-
>  drivers/gpu/drm/i915/i915_gem_evict.c         |   2 +-
>  drivers/gpu/drm/i915/i915_gem_ww.c            |  26 ++-
>  drivers/gpu/drm/i915/i915_gem_ww.h            |  15 +-
>  drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c     |   8 +-
>  drivers/gpu/drm/qxl/qxl_object.c              |  17 +-
>  drivers/gpu/drm/qxl/qxl_prime.c               |   4 +-
>  drivers/gpu/drm/tegra/gem.c                   |  27 +--
>  drivers/infiniband/core/umem_dmabuf.c         |  11 +-
>  .../common/videobuf2/videobuf2-dma-contig.c   |  26 +--
>  .../media/common/videobuf2/videobuf2-dma-sg.c |  23 +-
>  .../common/videobuf2/videobuf2-vmalloc.c      |  17 +-

For the videobuf2 changes:

Acked-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
