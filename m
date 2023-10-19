Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3FFB7CF279
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Oct 2023 10:25:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235244AbjJSIZY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Oct 2023 04:25:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235109AbjJSIZX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Oct 2023 04:25:23 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92FDCC0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Oct 2023 01:25:21 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-53db360294fso13431194a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Oct 2023 01:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar-org.20230601.gappssmtp.com; s=20230601; t=1697703920; x=1698308720; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v8Difn/D+XiTI90dIkn0xG+fv+x0la3KPldZ4kHjxUY=;
        b=bEesxWPAlR1bISkAQbiFTBxFSfpRlI3fooncKBzg49Gz9IbE2gvDgX57PxmV8iFntk
         X5hQlPh6STA4Ypv0wEkjLF7TgDeIwMSX44rVXVLP0NwQjqkyBknLFeNFYdpuAMCbiMP1
         Qv95+frDa3MPRMsTJWRh1flbThlvwGMl8MwO1/fCFBpwCFoMMBA5ZSw4/bacPkGz4xZ0
         lXAj9dKeZGvaC1a8M8e7/v2KVS3YTnwKzdWEc3rfCXLKJCJ1V8ttseXSzPmbcyV8IR9J
         TLgQ7euzZ0n6SIgTmq7GKRwhOiBy56Wgj2ear9Bj2lW4vFauQlqpXLA7X4hhS0lILeVL
         XDQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697703920; x=1698308720;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v8Difn/D+XiTI90dIkn0xG+fv+x0la3KPldZ4kHjxUY=;
        b=Z4BnISWUMWi4W5G/r9/erSb+mDMvovkM38Yib/zWoU6Q18scqnwYWF4LVgeOlKLB8x
         u9tlEFcZEAH5tYejhbBvCDQ2V2NFvCZ3/fsoiwcHmw6GFjub6dT9eOBh65bE4hyPYLa5
         9t397XMu07F8mPpnE2VzBgZlyO6I5lIU6UMDJQtb41zvj4AeTerCRuH+A/cuhY/vuEgr
         ZRiWtOnPJW3dU5ZKPTrlrzGEWUsWf1N2bcYJyv1UNvDTzIowhSwzX1sjH1bdpP3mSj1h
         MtG7JsCZaK+JfSnzKY2Nh16EloB1iRhRxYHo3GQQXC3klt+YG7J4b81oIjUILP6v+VHV
         Whig==
X-Gm-Message-State: AOJu0YwdcajWzbeVAG/Z25EV60GM738gKhWad59Udx0RKVpkeHvQqb2V
        HZ0VPzAaOeX55tZSq/MUalaPfyIsxK8COD19vkw9Fw==
X-Google-Smtp-Source: AGHT+IERXq0bO1AmEurHewxhpzh6tNz4IbqMPHu+sifIOgs6RxCQnRc88SwKIglHJnVB5fDIiwqiPj8rxg9FYRI0joA=
X-Received: by 2002:a17:907:97c2:b0:9c1:4343:60ab with SMTP id
 js2-20020a17090797c200b009c1434360abmr974298ejc.10.1697703919882; Thu, 19 Oct
 2023 01:25:19 -0700 (PDT)
MIME-Version: 1.0
References: <20231019070650.61159-1-vignesh.raman@collabora.com> <20231019070650.61159-10-vignesh.raman@collabora.com>
In-Reply-To: <20231019070650.61159-10-vignesh.raman@collabora.com>
From:   Daniel Stone <daniel@fooishbar.org>
Date:   Thu, 19 Oct 2023 10:25:07 +0200
Message-ID: <CAPj87rP=22Fw0h42U-p9fHd=6OHOu9Lj9kbpVMQVqL9U6BRE1A@mail.gmail.com>
Subject: Re: [PATCH v5 9/9] drm: ci: Update xfails
To:     Vignesh Raman <vignesh.raman@collabora.com>
Cc:     helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
        daniels@collabora.com, emma@anholt.net,
        gustavo.padovan@collabora.com, linux-arm-msm@vger.kernel.org,
        guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        david.heidelberg@collabora.com, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Vignesh,

On Thu, 19 Oct 2023 at 09:07, Vignesh Raman <vignesh.raman@collabora.com> wrote:
> +# Some tests crashes with malloc error and IGT tests floods
> +# the CI log with error messages and we end up with a warning message
> +# Job's log exceeded limit of 4194304 bytes.
> +# Job execution will continue but no more output will be collected.

This is just from GitLab warning that we have a huge log, so not
related to the actual fails here.

> +# Below is the error log:
> +# malloc(): corrupted top size
> +# Received signal SIGABRT.
> +# Stack trace:
> +#  #0 [fatal_sig_handler+0x17b]
> +#  #1 [__sigaction+0x40]
> +#  #2 [pthread_key_delete+0x14c]
> +#  #3 [gsignal+0x12]
> +#  #4 [abort+0xd3]
> +#  #5 [__fsetlocking+0x290]
> +#  #6 [timer_settime+0x37a]
> +#  #7 [__default_morecore+0x1f1b]
> +#  #8 [__libc_calloc+0x161]
> +#  #9 [drmModeGetPlaneResources+0x44]
> +#  #10 [igt_display_require+0x194]
> +#  #11 [__igt_unique____real_main1356+0x93c]
> +#  #12 [main+0x3f]
> +#  #13 [__libc_init_first+0x8a]
> +#  #14 [__libc_start_main+0x85]
> +#  #15 [_start+0x21]
> +# malloc(): corrupted top size

By the time we get this error, it indicates that there was previously
memory corruption, but it is only being noticed at a later point. The
skip lists here are way too big - stuff like drm_read is common
testing not affected by virtio at all - so we really need to isolate
the test which is actually breaking things.

The way to do this would be to use valgrind to detect where the memory
corruption is. VirtIO can be run locally so this is something you can
do on your machine.

Cheers,
Daniel
