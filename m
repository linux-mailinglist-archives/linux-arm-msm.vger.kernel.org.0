Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85E85144510
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2020 20:26:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728811AbgAUT0T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jan 2020 14:26:19 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:35555 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727383AbgAUT0S (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jan 2020 14:26:18 -0500
Received: by mail-ed1-f67.google.com with SMTP id f8so4217601edv.2;
        Tue, 21 Jan 2020 11:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e6fuAiNj5LjVAniJFmeMA4RYt70Fcb4nvwAnRr9Y7RE=;
        b=UOeT3DQObK7HZ/S782GxpJyPPk5HEqH5gv4oW07m95qEmbopU0YuJBMxldQNlhDqv7
         posHzyudkkkoRV1B0xcI1AWZWr8LvWnXOi6S3Wna3DySI8qcKaxGEHsyPKXi3QV4VvMD
         iKQCV1kAkwnb9v357RXsVFwR61+dWeSWjDaqQj8rybO7VFkQNeZ+a5+Hn9ZCtp3H8dyF
         jyhBaLAWqpGNeUPlYcEE4G1Nx7zCsFc2S3zyI2uPgtLWbnpQQLwBoTePTybZY/dWoECL
         HduwpPNtfiw+tYGyHAk95a2wXvJWWJt6LHxDpLL0lfzZ8IAq8j+z8EGrv7+fthlIuUh9
         tyhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e6fuAiNj5LjVAniJFmeMA4RYt70Fcb4nvwAnRr9Y7RE=;
        b=YI7MHFVUW+h9qf0TW57Ongb3uG6JLMYhsB+7CB84xnXZNnNBBN5SCfbgrSWe3WKOIl
         yrrTtYrV/7MPIzEEnn/bgpcXfTf8cS8GTW/ra9SPpr0qkJwM3y2W1IiC0J7U7CVsRTR5
         xx3SSXFTcNqle6PwAcWkMPCMtZxSdv3HIkEm+JOyNFyPkZSW3Rp8xA6VFUGnCjsrTJuA
         ZpapzcrCMzaGRAqXbUmE895HPhnDw7dv14d/xNMkb7fB1oa7brYY520vDHWJSPGjjoPY
         68ml0wWl3gx1BnbrwD2c22Kf/hljYpEHWSoJ/iQdNUFGcFT6Oih/YurYl+XKzLBVZJ6K
         /o5g==
X-Gm-Message-State: APjAAAWeITVPzENw0WseXqA1F0b8bdrgnlU7cLj9a1ghIdqusQcP5Ac7
        CGTG4tafjvBHdkWEbECURIWOscaNPI6QkO/+EaPQ54Gg
X-Google-Smtp-Source: APXvYqxYx48yBMYim+zYTuQWYYqPdoFgpoBaKGn78ItcIIk6re9pHLXosJEpBQhwJBJV65R0erxv/RkqZN0C0VV7zfg=
X-Received: by 2002:a17:906:19d8:: with SMTP id h24mr3298246ejd.166.1579634776098;
 Tue, 21 Jan 2020 11:26:16 -0800 (PST)
MIME-Version: 1.0
References: <20200121111813.REPOST.1.I92c66a35fb13f368095b05287bdabdbe88ca6922@changeid>
In-Reply-To: <20200121111813.REPOST.1.I92c66a35fb13f368095b05287bdabdbe88ca6922@changeid>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 21 Jan 2020 11:26:05 -0800
Message-ID: <CAF6AEGtBwcFqe9nfohz8D5mo_V1mfR84bBtEUPmnkO2cjeDrfw@mail.gmail.com>
Subject: Re: [REPOST PATCH] drm/msm: Set dma maximum segment size for mdss
To:     Douglas Anderson <dianders@chromium.org>
Cc:     saiprakash.ranjan@codeaurora.org,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Sean Paul <seanpaul@chromium.org>, Sean Paul <sean@poorly.run>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        David Airlie <airlied@linux.ie>,
        freedreno <freedreno@lists.freedesktop.org>,
        Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jan 21, 2020 at 11:19 AM Douglas Anderson <dianders@chromium.org> wrote:
>
> From: Sean Paul <seanpaul@chromium.org>
>
> Turning on CONFIG_DMA_API_DEBUG_SG results in the following error:
>
> [   12.078665] msm ae00000.mdss: DMA-API: mapping sg segment longer than device claims to support [len=3526656] [max=65536]
> [   12.089870] WARNING: CPU: 6 PID: 334 at /mnt/host/source/src/third_party/kernel/v4.19/kernel/dma/debug.c:1301 debug_dma_map_sg+0x1dc/0x318
> [   12.102655] Modules linked in: joydev
> [   12.106442] CPU: 6 PID: 334 Comm: frecon Not tainted 4.19.0 #2
> [   12.112450] Hardware name: Google Cheza (rev3+) (DT)
> [   12.117566] pstate: 60400009 (nZCv daif +PAN -UAO)
> [   12.122506] pc : debug_dma_map_sg+0x1dc/0x318
> [   12.126995] lr : debug_dma_map_sg+0x1dc/0x318
> [   12.131487] sp : ffffff800cc3ba80
> [   12.134913] x29: ffffff800cc3ba80 x28: 0000000000000000
> [   12.140395] x27: 0000000000000004 x26: 0000000000000004
> [   12.145868] x25: ffffff8008e55b18 x24: 0000000000000000
> [   12.151337] x23: 00000000ffffffff x22: ffffff800921c000
> [   12.156809] x21: ffffffc0fa75b080 x20: ffffffc0f7195090
> [   12.162280] x19: ffffffc0f1c53280 x18: 0000000000000000
> [   12.167749] x17: 0000000000000000 x16: 0000000000000000
> [   12.173218] x15: 0000000000000000 x14: 0720072007200720
> [   12.178689] x13: 0720072007200720 x12: 0720072007200720
> [   12.184161] x11: 0720072007200720 x10: 0720072007200720
> [   12.189641] x9 : ffffffc0f1fc6b60 x8 : 0000000000000000
> [   12.195110] x7 : ffffff8008132ce0 x6 : 0000000000000000
> [   12.200585] x5 : 0000000000000000 x4 : ffffff8008134734
> [   12.206058] x3 : ffffff800cc3b830 x2 : ffffffc0f1fc6240
> [   12.211532] x1 : 25045a74f48a7400 x0 : 25045a74f48a7400
> [   12.217006] Call trace:
> [   12.219535]  debug_dma_map_sg+0x1dc/0x318
> [   12.223671]  get_pages+0x19c/0x20c
> [   12.227177]  msm_gem_fault+0x64/0xfc
> [   12.230874]  __do_fault+0x3c/0x140
> [   12.234383]  __handle_mm_fault+0x70c/0xdb8
> [   12.238603]  handle_mm_fault+0xac/0xc4
> [   12.242473]  do_page_fault+0x1bc/0x3d4
> [   12.246342]  do_translation_fault+0x54/0x88
> [   12.250652]  do_mem_abort+0x60/0xf0
> [   12.254250]  el0_da+0x20/0x24
> [   12.257317] irq event stamp: 67260
> [   12.260828] hardirqs last  enabled at (67259): [<ffffff8008132d0c>] console_unlock+0x214/0x608
> [   12.269693] hardirqs last disabled at (67260): [<ffffff8008080e0c>] do_debug_exception+0x5c/0x178
> [   12.278820] softirqs last  enabled at (67256): [<ffffff8008081664>] __do_softirq+0x4d4/0x520
> [   12.287510] softirqs last disabled at (67249): [<ffffff80080be574>] irq_exit+0xa8/0x100
> [   12.295742] ---[ end trace e63cfc40c313ffab ]---
>
> The root of the problem is that the default segment size for sgt is
> (UINT_MAX & PAGE_MASK), and the default segment size for device dma is
> 64K. As such, if you compare the 2, you would deduce that the sg segment
> will overflow the device's capacity. In reality, the hardware can
> accommodate the larger sg segments, it's just not initializing its max
> segment properly. This patch initializes the max segment size for the
> mdss device, which gets rid of that pesky warning.
>
> Reported-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Tested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> This patch has been floating in the ether for over a year [1].  I know
> next to nothing about it, but I'm told it's still useful so I'm
> helpfully reposting it.  Please enjoy.

This looks like the right thing to do.. sorry I overlooked the patch
first time around

Reviewed-by: Rob Clark <robdclark@gmail.com>

(since I've already sent PR for msm-next, could we pick this up via drm-misc?)

BR,
-R


>
> [1] https://lore.kernel.org/r/20181106213239.52133-1-sean@poorly.run
>
>  drivers/gpu/drm/msm/msm_drv.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index c26219c7a49f..e4b750b0c2d3 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -441,6 +441,14 @@ static int msm_drm_init(struct device *dev, struct drm_driver *drv)
>         if (ret)
>                 goto err_msm_uninit;
>
> +       if (!dev->dma_parms) {
> +               dev->dma_parms = devm_kzalloc(dev, sizeof(*dev->dma_parms),
> +                                             GFP_KERNEL);
> +               if (!dev->dma_parms)
> +                       return -ENOMEM;
> +       }
> +       dma_set_max_seg_size(dev, DMA_BIT_MASK(32));
> +
>         msm_gem_shrinker_init(ddev);
>
>         switch (get_mdp_ver(pdev)) {
> --
> 2.25.0.341.g760bfbb309-goog
>
