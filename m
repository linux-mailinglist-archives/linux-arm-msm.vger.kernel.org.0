Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7796D5C3C1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2019 21:45:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbfGATpz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Jul 2019 15:45:55 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:45774 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726586AbfGATpz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Jul 2019 15:45:55 -0400
Received: by mail-ed1-f67.google.com with SMTP id a14so24919748edv.12;
        Mon, 01 Jul 2019 12:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wYt+ewXSszrhV0/c2X8NnRDiNI3d5oiddfdOVtTGEv4=;
        b=OTEwuu7vihjB71E/nIGCfIEuAUae12z379sL2OcZplfhBCkJ/5py4ReiPBH3cOGMcC
         wSbZsO2UpnITz4pleUww2L0E48/p3edkgBngqpQNrigk/GfTILqWzT6hblKHq2gFqjpC
         ZURhOgAcj4++trVqK9lWHNPhdwYVWZIVc3ZHDOq7HXgrBANMYzyJrPYQxwScRoQjD+7K
         gWJ6JFpAhoAyNe6DFinGjvg4MhF7N/9roWXA8yCzip8uK83RsuZHDqNqrE8RpA0VypzW
         SuQeAkaoYTjHsKUCBJZi8TL52/sF3AYgrdjQeC9pGl9r8QSYtzyaliB6XgWqblyo0D8y
         V1Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wYt+ewXSszrhV0/c2X8NnRDiNI3d5oiddfdOVtTGEv4=;
        b=HBhrflUx//3WH+5J2nmWrYCSJD3VtP2jZaBIsMmLQ/3sU3E2TvnUpM8aufSOoLYuzT
         hjo3lqzf7n1fAAh1WzsAPa1zfQ+iOS6z3v9HOG82j2Y1IhRpEi7iGl4HHIgz+9GQbwR4
         l4+frBEVL9eYUYhvfAtjo3miyq+hBb8ttFOuSFXipCTcAgOiCUfvQ6FV6rxxEIUxdO93
         JP4Hh4pXgrN4bFAdc7AnNrKtVa0OYWIHR6CgagF9dK48wbnY/zmKjpzNLQ4QbGXoTo3v
         TEzUYv8OR7B8dnLIspQn2n6sDGdG2RN8xDYKEWSeLXfGhwdsHwVUbrC45hOfxRwR7w9q
         dQgw==
X-Gm-Message-State: APjAAAUM5b84wUxyf1qgPMMLsWqX2XGeIfgUdfdxDACKTa7fxrFQrmzl
        bEFlbgCkEApE+Udqe2RQbm7iRU2KGeqbFKIAMIM=
X-Google-Smtp-Source: APXvYqzmQmIl2B93LwDgt2BUXvj32T8pqLfXA1PfXNu7QlmdutC1F2lXsilw4UmzTuobGJsgzukwDitPiyJKtGG6OpY=
X-Received: by 2002:a50:8bfd:: with SMTP id n58mr31055135edn.272.1562010353531;
 Mon, 01 Jul 2019 12:45:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190701173907.15494-1-jeffrey.l.hugo@gmail.com>
In-Reply-To: <20190701173907.15494-1-jeffrey.l.hugo@gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 1 Jul 2019 12:45:38 -0700
Message-ID: <CAF6AEGu=Pv5mCKA7QDVGPjhFShmD2cfKWNZk26PTQSSQzbzKXA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/mdp5: Use drm_device for creating gem address space
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 1, 2019 at 10:39 AM Jeffrey Hugo <jeffrey.l.hugo@gmail.com> wrote:
>
> Creating the msm gem address space requires a reference to the dev where
> the iommu is located.  The driver currently assumes this is the same as
> the platform device, which breaks when the iommu is outside of the
> platform device.  Use the drm_device instead, which happens to always have
> a reference to the proper device.
>
> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> index 4a60f5fca6b0..1347a5223918 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> @@ -702,7 +702,7 @@ struct msm_kms *mdp5_kms_init(struct drm_device *dev)
>         mdelay(16);
>
>         if (config->platform.iommu) {
> -               aspace = msm_gem_address_space_create(&pdev->dev,
> +               aspace = msm_gem_address_space_create(dev->dev,
>                                 config->platform.iommu, "mdp5");

hmm, do you have a tree somewhere with your dt files?  This makes me
think the display iommu is hooked up somewhere differently compared
to, say, msm8916.dtsi

BR,
-R

>                 if (IS_ERR(aspace)) {
>                         ret = PTR_ERR(aspace);
> --
> 2.17.1
>
