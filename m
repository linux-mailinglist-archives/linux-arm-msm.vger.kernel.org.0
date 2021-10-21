Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4949C4360A3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Oct 2021 13:45:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231197AbhJULr6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Oct 2021 07:47:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231129AbhJULrw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Oct 2021 07:47:52 -0400
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B91FEC061753
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Oct 2021 04:45:36 -0700 (PDT)
Received: by mail-oo1-xc2e.google.com with SMTP id j11-20020a4a92cb000000b002902ae8cb10so44834ooh.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Oct 2021 04:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=WOkBwlSoZofkybAk4F+yxr1MJ3MNGeAkoQp5SMBScKI=;
        b=lrkoDgGU3oxSva13UKIskhuNcjuvSuSsT7JEAyq2Cha7HhbJk2jnVLmW1GUm+w9btL
         WG/bzZVmeUr/9uk99LTnK1FHpQvaPbiPtSGCebfJV0A3jEYSzlYVQSeWrSOMFMUXQlgn
         ldViDb7zAj/ZHUA3JcLWdMOYAta84p2vC9i2+yokMESA2mMCpspkDn8ZwTwUwpP7vG+0
         J1w7E4AMgc8zwWFT4NlPhJ+lAUC58gmZ9W1z/lgNfDapR+qkLElTk1BOpakG0pjgYb8u
         a1mgXlPXLDL/550UXd2DPfNGPEZSgbiY+la8zb2ppsBcNuP15cVD6dxShA96O0Z4XkfF
         86mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WOkBwlSoZofkybAk4F+yxr1MJ3MNGeAkoQp5SMBScKI=;
        b=jApDGWs4+ogOQmWiQzxukuBKmOj5pYEKysRGTKDa5Th3dBwCHEEabdvi/5xyeSydGC
         RbIogZJx7MeBBm3/SCLWijkJ1U7WAQv4d52sMst0o8aGj/qD4RNQoqYQgJfW5+hfwVfE
         BeegbJNZ0u54XMXKObYJLf8/tWVVmTkG2uDr0Km1Fwjfd4S0tFAWEMANm2uijYZwAefw
         hB1q7Bgsx0ANJK5twW858LX6g4SiQbCYVyY2h+wJF6JKqiHq5E/wLrUfCjPjnjYn6cKq
         oL/CaObDJU1FygZdKHABPskQnr/H0N+yrhpoxb95a09iXYj2FGMBEwAEyqocifSFkzds
         Kz4w==
X-Gm-Message-State: AOAM533qwfHFhYKgL+PAB5HxuWL7X2VfwLdxnc1ckb2UUU4rC0EIxj68
        ea4frdlzpj0T5mgcMkEsKfER33mcsi3BOUNre2Y=
X-Google-Smtp-Source: ABdhPJxxuBQAfkMeaF90FZTJmaSeTos98bFunKxz22ZrFszUOg9x/rgoAANU+p34amMBcnoous/70+nWhD6V4bvA4OA=
X-Received: by 2002:a4a:e9f0:: with SMTP id w16mr4041723ooc.3.1634816736053;
 Thu, 21 Oct 2021 04:45:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1634200323.git.siyanteng@loongson.cn>
In-Reply-To: <cover.1634200323.git.siyanteng@loongson.cn>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Thu, 21 Oct 2021 19:45:24 +0800
Message-ID: <CAEensMxkPb9KexjJpy4j5x1Bf7npdknH44KfzSEx4JHm9DK7oA@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm/msm: fix build error
To:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Yanteng Si <siyanteng@loongson.cn>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Yanteng Si <siyanteng01@gmail.com> =E4=BA=8E2021=E5=B9=B410=E6=9C=8814=E6=
=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=884:51=E5=86=99=E9=81=93=EF=BC=9A
>
> Include linux/vmalloc.h to fix below errors:
>
> error: implicit declaration of function 'vmap';
> error: implicit declaration of function 'register_vmap_purge_notifier'
> error: implicit declaration of function 'unregister_vmap_purge_notifier'
>
> Yanteng Si (2):
>   drm/msm: Fix missing include files in msm_gem.c
>   drm/msm: Fix missing include files in msm_gem_shrinker.c
ping?

Thanks,

Yanteng
