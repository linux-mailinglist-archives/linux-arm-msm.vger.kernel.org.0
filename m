Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3DFD3EA1EF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Aug 2021 11:22:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236203AbhHLJWz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Aug 2021 05:22:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236157AbhHLJWx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Aug 2021 05:22:53 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 260C3C06179E
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Aug 2021 02:22:13 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id k2so6436528plk.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Aug 2021 02:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IyZ9EaMisnJp0qYPjFlYvR7TgQ9io17E26x/uUU+AX4=;
        b=rPBZRIzmHR1ytF2LUa3xi/+wPdHScbdE9cx8JkucCBR/uwD5VpoJ8yAYuF1685s+62
         KMHGWZGHETjPz0/2PVSeJ5z4Y5YufMZngghbewN+YqJUl9hhzzCfX2hqcrur1UAu+Rcn
         7LqfFKrcmSrODcBp/hx4yPI+F4GBMyfhDVgdlvkXvaT8Sw3JJNOqFpdgxuQUuRmVYihF
         ENwNbsOTiR356PdOicdpbbRpaZyOoEyZdg64ypDy514ZcVifnAdQ2xJk9tUhFo0gg5Zi
         z85ye6LAYjPoosQoh0fPs8pL8xSwZg6kC+k/euYQb1DCvU3O9v9eT3+gbXfGO6KCx3WA
         EfAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IyZ9EaMisnJp0qYPjFlYvR7TgQ9io17E26x/uUU+AX4=;
        b=q5Dk+UsGTT+I674MHDXwjNSqpfcLtaJZ99QNrqgrnS+U8v/jlJg8dYI2wE+pR1iIXL
         ZeJjCaCwhjfFzdU2l0quG8CDNwPV1Pk3dOchtrK71zEpdZlbk0a9W+pkkBLIuXTcIgu4
         AeWOi2PhYwCtfcMbFZsMyLnV/yAlk2CfukHxAAzXpA1uynt97GsRO7ZirEEgnmjT18QO
         H7wFpl29Lj95Dw3KDv/mfl+glnjkUmwIM6LCD4gEfPQRi5AGARFO/4W2u4T+Zwq2NdnI
         cqkF3XJgWW/Sscy8qAD+BONsCu0SsAcBmmI6TnZpbQua0ndGTow0TrSwUdysX0pjewzZ
         ZZ8w==
X-Gm-Message-State: AOAM532ppyRgeiwwa0mIOLKFj15W//6YeZWfyU8kWpuEcvaElCBzPjIu
        SY2wSQyrPAlsDw4sJpsk13StIdzq10igWqoOGhgZbw==
X-Google-Smtp-Source: ABdhPJzKK5Ah+X7xVkCoYYjZmGBjUv9nmz0IOxvf4uoubO28EVbVghxtySMxmKkrH4jDl7g1gUzkLjTOaNg8Ltlm3r8=
X-Received: by 2002:aa7:90c8:0:b029:32c:935f:de5f with SMTP id
 k8-20020aa790c80000b029032c935fde5fmr3193360pfk.79.1628760132673; Thu, 12 Aug
 2021 02:22:12 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20210811074838eucas1p2a0e8625af27c10209d9bcfc732254ae7@eucas1p2.samsung.com>
 <20210810103336.114077-1-robert.foss@linaro.org> <0b694e24-5cc8-4944-d3a2-115306ae7b89@samsung.com>
 <CAG3jFys+ch86Y7338-DH1+8Q4w5eK83revVsNwoVCugwXeqjmQ@mail.gmail.com>
 <CAG3jFytOQQBnnJQU9qDdQedrrcPz=SQPeXHX1HJQ8c5U94feCg@mail.gmail.com> <de1df486-255f-6405-5ea9-4dddd5507006@samsung.com>
In-Reply-To: <de1df486-255f-6405-5ea9-4dddd5507006@samsung.com>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Thu, 12 Aug 2021 11:22:01 +0200
Message-ID: <CAG3jFyt7KB0JxTzimKA3Oi2dLU1Uj5uJ4aPFkQONbST8eFk6gg@mail.gmail.com>
Subject: Re: [PATCH v1] media: camss: vfe: Don't use vfe->base before it's assigned
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Todor Tomov <todor.too@gmail.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media <linux-media@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Kernel Functional Testing <lkft@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

> >>>
> >>> [   18.480608] qcom-venus 1d00000.video-codec: Adding to iommu group 1
> >>> [   18.536167] qcom-camss 1b0ac00.camss: Adding to iommu group 2
> >>> [   18.600373] Internal error: synchronous external abort: 96000010 [#1]
> >>> PREEMPT SMP
> > After testing this patch + linux-next[1] I'm not able to replicate the
> > 'Internal error' above on the db410c. And I don't think it is related
> > to this patch.
> >
> > Are you seeing the same error on [1]? And are you seeing it before the
> > b10b5334528a9 ("media: camss: vfe: Don't read hardware version
> > needlessly") patch?
>
> I've checked once again on your branch. Yes, it is fully reproducible on
> my DragonBoard410c. On your branch I get the above synchronous external
> abort, while without your last patch I get Null ptr dereference.
>
> Are you sure you have deployed the kernel modules for doing the test?
> This issue happens when udev triggers loading kernel modules for the
> detected hardware.
>
> Here is the kernel configuration used for my tests on ARM64 based board:
>
> # make ARCH=arm64 defconfig && ./scripts/config --set-val
> CMA_SIZE_MBYTES 96 -e PROVE_LOCKING -e DEBUG_ATOMIC_SLEEP -e PM_DEBUG -e
> PM_ADVANCED_DEBUG -d ARCH_SUNXI -d ARCH_ALPINE -d DRM_NOUVEAU -d
> ARCH_BCM_IPROC -d ARCH_BERLIN -d ARCH_BRCMSTB -d ARCH_LAYERSCAPE -d
> ARCH_LG1K -d ARCH_HISI -d ARCH_MEDIATEK -d ARCH_MVEBU -d ARCH_ROCKCHIP
> -d ARCH_SEATTLE -d ARCH_SYNQUACER -d ARCH_RENESAS -d ARCH_STRATIX10 -d
> ARCH_TEGRA -d ARCH_SPRD -d ARCH_THUNDER -d ARCH_THUNDER2 -d
> ARCH_UNIPHIER -d ARCH_XGENE -d ARCH_ZX -d ARCH_ZYNQMP -d HIBERNATION -d
> CLK_SUNXI -e BLK_DEV_RAM --set-val BLK_DEV_RAM_COUNT 4 --set-val
> BLK_DEV_RAM_SIZE 65536 -d CONFIG_EFI -d CONFIG_TEE
>
> Comparing to the arm64's defconfig, I've enabled some debugging options
> and disabled some unused boards.
>

I made a mistake when testing on the db410c earlier, but with it fixed
I can replicate the issue. It seems to stem from the hardware not
actually being powered up when the hw_version() call is being made.

Unfortunately there is no simple way to achieve the original intention
of the series that reduced the frequency of the hw_version() being
called, while avoiding the above issue. So let's revert to the
previous behaviour for the time being.

Thank you for your help Marek! I'll submit a v2 shortly.


Rob
