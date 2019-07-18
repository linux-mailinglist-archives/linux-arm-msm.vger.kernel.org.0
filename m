Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9848B6D576
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2019 21:52:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391378AbfGRTv4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Jul 2019 15:51:56 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:34091 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727687AbfGRTv4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Jul 2019 15:51:56 -0400
Received: by mail-pg1-f195.google.com with SMTP id n9so7132109pgc.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jul 2019 12:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:to:cc:from:user-agent:date;
        bh=zfYhBy8rXbE//COaxouGyZdN8XuohHpGRV5GXewnrg0=;
        b=DKzzyJpgwrlpAymFb04FfC77Rz/8v2x2vMt97Uo5AbdJL5GOULus42XL9FeHmoaRKU
         63iDopVnfj/IHyacy+pTTzrtu2JsX/GIkaMVxiVuO9aQob2DW/xay1dZuqkLoDJlE19X
         clXgrN9nBoB9+m3VTyBOgFl4dyyN77fIsnv98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:to:cc:from
         :user-agent:date;
        bh=zfYhBy8rXbE//COaxouGyZdN8XuohHpGRV5GXewnrg0=;
        b=DlneiV3AShXveNFM27f0vEHB38KQ3FQVQJuIobX0BLLBX8djza7P/4yEmDWn/eFHY7
         7YfcyCvqNpXeiT5yyEgA6kYWGEF++bbEj24/ekNKpeJTi5BTLk7L50W/nTgnA2lVV2Hc
         BDYFByXwC2CuFyngaI3XgnUl8BEFbeOXTOAg6L8QL4iTA+yVZFT4tlsHmxmxVwtDXpqM
         JkxOl/aFOMhhCE2F1kF2qVTYec8Q4Gdm526UJjEmZwA9B/qVz7VMcRE2gZwm4g01l6u6
         gluH1mYla1+9Gg8zydNRMwq07Opg1jQPABtGszhuIfLNpRZ8GcZkCezUOZ3L6ZLy03e0
         SicQ==
X-Gm-Message-State: APjAAAUXkUPaIJNL1aLOY4IAHo7bwjpWVAykkLUxOeJ37GEvaaIeLNpi
        Q55J38rylq0fXV40TgsZiVqKNzgC/hk=
X-Google-Smtp-Source: APXvYqzX3YfqRbUFuVRr8VkMWQFTqQ6b7l4FMXcRmJo8G3y5rS4fIdQe2lsE0s0MX+8ly1O9es6xBg==
X-Received: by 2002:a63:205f:: with SMTP id r31mr49503340pgm.159.1563479515402;
        Thu, 18 Jul 2019 12:51:55 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id y23sm30556546pfo.106.2019.07.18.12.51.54
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 18 Jul 2019 12:51:54 -0700 (PDT)
Message-ID: <5d30cdda.1c69fb81.de220.1f10@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190630124735.27786-1-robdclark@gmail.com>
References: <20190630124735.27786-1-robdclark@gmail.com>
Subject: Re: [PATCH] drm/msm: stop abusing dma_map/unmap for cache
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Thu, 18 Jul 2019 12:51:53 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rob Clark (2019-06-30 05:47:22)
> From: Rob Clark <robdclark@chromium.org>
>=20
> Recently splats like this started showing up:
>=20
>    WARNING: CPU: 4 PID: 251 at drivers/iommu/dma-iommu.c:451 __iommu_dma_=
unmap+0xb8/0xc0
>    Modules linked in: ath10k_snoc ath10k_core fuse msm ath mac80211 uvcvi=
deo cfg80211 videobuf2_vmalloc videobuf2_memops vide
>    CPU: 4 PID: 251 Comm: kworker/u16:4 Tainted: G        W         5.2.0-=
rc5-next-20190619+ #2317
>    Hardware name: LENOVO 81JL/LNVNB161216, BIOS 9UCN23WW(V1.06) 10/25/2018
>    Workqueue: msm msm_gem_free_work [msm]
>    pstate: 80c00005 (Nzcv daif +PAN +UAO)
>    pc : __iommu_dma_unmap+0xb8/0xc0
>    lr : __iommu_dma_unmap+0x54/0xc0
>    sp : ffff0000119abce0
>    x29: ffff0000119abce0 x28: 0000000000000000
>    x27: ffff8001f9946648 x26: ffff8001ec271068
>    x25: 0000000000000000 x24: ffff8001ea3580a8
>    x23: ffff8001f95ba010 x22: ffff80018e83ba88
>    x21: ffff8001e548f000 x20: fffffffffffff000
>    x19: 0000000000001000 x18: 00000000c00001fe
>    x17: 0000000000000000 x16: 0000000000000000
>    x15: ffff000015b70068 x14: 0000000000000005
>    x13: 0003142cc1be1768 x12: 0000000000000001
>    x11: ffff8001f6de9100 x10: 0000000000000009
>    x9 : ffff000015b78000 x8 : 0000000000000000
>    x7 : 0000000000000001 x6 : fffffffffffff000
>    x5 : 0000000000000fff x4 : ffff00001065dbc8
>    x3 : 000000000000000d x2 : 0000000000001000
>    x1 : fffffffffffff000 x0 : 0000000000000000
>    Call trace:
>     __iommu_dma_unmap+0xb8/0xc0
>     iommu_dma_unmap_sg+0x98/0xb8
>     put_pages+0x5c/0xf0 [msm]
>     msm_gem_free_work+0x10c/0x150 [msm]
>     process_one_work+0x1e0/0x330
>     worker_thread+0x40/0x438
>     kthread+0x12c/0x130
>     ret_from_fork+0x10/0x18
>    ---[ end trace afc0dc5ab81a06bf ]---

Tested-by: Stephen Boyd <swboyd@chromium.org>

