Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B342D1FD5DF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2020 22:16:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726909AbgFQUQV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Jun 2020 16:16:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726761AbgFQUQU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Jun 2020 16:16:20 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ABAEC061755
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2020 13:16:19 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id 9so4480803ljc.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2020 13:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=anholt-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=llMR4XP929ZlX0ktOlskzBn+oIEoOfRqB8eqQjrjFOM=;
        b=RcjQboxpASiHG7fxPLYiYz5Qsa067b/Y7vl562EyU/eKD/7YLcsaUuCfIdUTFBIHmw
         wHu1OwrDlNQHnWt4Ew9oNmuKIrDMqXCfolYHnFGrjkmeyGXdLquSjo3gFjVUR1nfQq/i
         ZK6t1/zTyaUNnP5hURPNXEeotoLQhdR6NJOnbSNL2A0LapL/0QmmidRZK86i5GdxS0L9
         jP1ZHgwGyeRQrZuUnxjyUCHcPXBBM3N5+LS4Ao9rF9K25pqmqaMxUzIWODCR9fG0TcDO
         bi+9IEPa45OkrbM3kjub8tE3MWQeGbESE0rN8pj6AZO0BV4H+yNG5Einj+yC97ghVEgl
         z+nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=llMR4XP929ZlX0ktOlskzBn+oIEoOfRqB8eqQjrjFOM=;
        b=Hjklwn/iwSQWkZroEqa7fuqWhuu12FzI9h3laH09TjztLzrmKVxSuglxzr7fZnGmhN
         v8wwPHrpx1HjAYKid3Y6HLYGz6NvuopNi8Xg4Z0vqTW1fQxFnb2qnArYJzSHA1P4sBSI
         a8qz+QikjhszZrQb0nkTpR/C6F9mUFIRE9guazO820tPb2vq1VBSAknZEmwMAYQoqPZa
         s28kXRQ6SvWXgg7Smovbb3Owbyv3lWqXI+si5wfVmkNJbVddg44MxtSzyCj/uvgjqH3r
         YKUn2Jhp6LDQdiSfy7uoVY5yzSOV6d48WcGx0KoxQCwK1fg/AjExbWjPDeYDi+jOVRVc
         d5lQ==
X-Gm-Message-State: AOAM531Yw5AJbCenOH8KxO2EZhduz/NQRfl3aWUHpS4/52P/mALn6Hgb
        s5UYYv7Wj2d5ErEerwNUaMHyimiZTW8Av2iJ8XspUw==
X-Google-Smtp-Source: ABdhPJwSuKXzvk5zn5fk4tSXh655bmsbFyqQJkONPwl29Qe0rVGDqzm/i/OqfAbWrrePE2TK2xM+/wTuvOvXd6Q6bW8=
X-Received: by 2002:a2e:9147:: with SMTP id q7mr513712ljg.430.1592424977772;
 Wed, 17 Jun 2020 13:16:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200409233350.6343-1-jcrouse@codeaurora.org> <20200409233350.6343-5-jcrouse@codeaurora.org>
In-Reply-To: <20200409233350.6343-5-jcrouse@codeaurora.org>
From:   Eric Anholt <eric@anholt.net>
Date:   Wed, 17 Jun 2020 13:16:06 -0700
Message-ID: <CADaigPWJDEwPZyUyEO9H3=+zzdEX=h+gSa-w1ppNpM9ryY0LZA@mail.gmail.com>
Subject: Re: [PATCH v6 4/5] drm/msm: Refactor address space initialization
To:     Jordan Crouse <jcrouse@codeaurora.org>
Cc:     iommu@lists.linux-foundation.org, Sam Ravnborg <sam@ravnborg.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Wen Yang <wen.yang99@zte.com.cn>, will@kernel.org,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Brian Masney <masneyb@onstation.org>,
        freedreno@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-arm-msm@vger.kernel.org,
        Sharat Masetty <smasetty@codeaurora.org>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Sean Paul <sean@poorly.run>,
        Allison Randal <allison@lohutok.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        zhengbin <zhengbin13@huawei.com>,
        tongtiangen <tongtiangen@huawei.com>,
        Drew Davenport <ddavenport@chromium.org>,
        Wambui Karuga <wambui.karugax@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Apr 9, 2020 at 4:34 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> Refactor how address space initialization works. Instead of having the
> address space function create the MMU object (and thus require separate but
> equal functions for gpummu and iommu) use a single function and pass the
> MMU struct in. Make the generic code cleaner by using target specific
> functions to create the address space so a2xx can do its own thing in its
> own space.  For all the other targets use a generic helper to initialize
> IOMMU but leave the door open for newer targets to use customization
> if they need it.

I'm seeing regressions in dEQP-VK.memory.allocation.random.* on cheza
after this commit.   The symptom is that large allocations fail with
-ENOSPC from MSM_GEM_INFO(IOVA).

Possibly relevant change from having stuffed some debug info in:

before:
[    3.791436] [drm:msm_gem_address_space_create] *ERROR* msmgem
address space create: 0x1000000 + 0xfeffffff
[    3.801672] platform 506a000.gmu: Adding to iommu group 6
[    3.807359] [drm:msm_gem_address_space_create] *ERROR* msmgem
address space create: 0x0 + 0x7fffffff
[    3.817140] msm ae00000.mdss: bound 5000000.gpu (ops a3xx_ops)
[    3.823212] msm_dpu ae01000.mdp: [drm:msm_ioremap] *ERROR* failed
to get memory resource: vbif_nrt
[    3.832429] msm_dpu ae01000.mdp: [drm:msm_ioremap] *ERROR* failed
to get memory resource: regdma
[    3.841478] [drm:dpu_kms_hw_init:878] dpu hardware revision:0x40000000
[    3.848193] [drm:msm_gem_address_space_create] *ERROR* msmgem
address space create: 0x1000 + 0xffffefff

after:

[    3.798707] [drm:msm_gem_address_space_create] *ERROR* msmgem
address space create: 0x1000000 + 0xfffffff
[    3.808731] platform 506a000.gmu: Adding to iommu group 6
[    3.814440] [drm:msm_gem_address_space_create] *ERROR* msmgem
address space create: 0x0 + 0x7fffffff
[    3.820494] hub 2-1:1.0: USB hub found
[    3.824108] msm ae00000.mdss: bound 5000000.gpu (ops a3xx_ops)
[    3.828554] hub 2-1:1.0: 4 ports detected
[    3.833756] msm_dpu ae01000.mdp: [drm:msm_ioremap] *ERROR* failed
to get memory resource: vbif_nrt
[    3.847038] msm_dpu ae01000.mdp: [drm:msm_ioremap] *ERROR* failed
to get memory resource: regdma
[    3.856095] [drm:dpu_kms_hw_init:878] dpu hardware revision:0x40000000
[    3.862840] [drm:msm_gem_address_space_create] *ERROR* msmgem
address space create: 0x1000 + 0xfffffff

256MB for GMU address space?
