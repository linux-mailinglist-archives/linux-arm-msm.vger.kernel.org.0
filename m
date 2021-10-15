Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDAF742FAEA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Oct 2021 20:25:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242444AbhJOS1K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Oct 2021 14:27:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230286AbhJOS1J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Oct 2021 14:27:09 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22A3EC061570
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Oct 2021 11:25:03 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id bi9so9262572qkb.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Oct 2021 11:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VuezPB0Kp+8kHQA7Wm3i0oiOLoiUrP9cyKbJStrIERY=;
        b=IVpo3HDaZMp7KHMTuXPZHd0U/A6GToJW+zUIihY3lndppKm3Hl7+KKHTZ/ld17lOeo
         gZ0xcZoEvpcg3GqqbVhGNRLGpyWwEEXUEXOMTiC+4EUBOjeCpzp8HjqOuylx1300szsf
         2P/s4oK7puQONzcwRo3zUGN+KqiAvx9j5oM7iHoj3HvOE3oqr6E7d4xgq765mCRVptu+
         9rN6gXzNJfW/Gm2M9/OWpFcbRgskkFeVuTATRSHR08B3+bKp3tOWy0cTpil1gkLrI+AA
         EfkGg5RL3k6isZI4soTQT8WyQcpEmbncmjW4KMMXbCDBSsSQojsFjiTfZdJv4ZQ9jzS9
         +ypQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VuezPB0Kp+8kHQA7Wm3i0oiOLoiUrP9cyKbJStrIERY=;
        b=Q7bTRGoGk/dcF1vIrHO/mjbuLwBnV7rYUItRbM4ckvEgQsXzBQ0e3XAJX8CH6eMZ9a
         EeNddmJdxJ2ZcL2H+g8D4a7JJW3xRdbYy3UYvKWev94bumJweN3gJb4sOSmdZssMiMyz
         HdBNDt4FzNbcRC/OOTiqnS3RYCL1+umVvjoFvaAOIYPKlcWCkIYgwPgiS39f08Jk15ll
         zH06i9D52q2Af8zufvmTyS/jJ4PBzuQUbjVS9M3XogHik8Favvb7bnvaIGrwFMCCv9Pl
         ZrETf1GPn6+Ea+nTyUW13a8EQOjeAUvE2HhqUk9eu19DBaDFemD/gCOP68WkPdl/NKgc
         MSxg==
X-Gm-Message-State: AOAM533W0xLJa5egp0labcXe0JrcvrsPbPMmH91MJKs3Kh4ErG6tNNBP
        UcVl0UrTwMgqNl/OOQl+Aqr7d+FQqRG+iWWRbAqLBg==
X-Google-Smtp-Source: ABdhPJy8eNYT/b5aHU32daC4hukb65DAURzwczXTD5i8pfp8xM2Wdva75qdOi9M+duUayeYhsXaxTyQk1ZgKTK2bWgU=
X-Received: by 2002:a37:9a83:: with SMTP id c125mr11044211qke.186.1634322302244;
 Fri, 15 Oct 2021 11:25:02 -0700 (PDT)
MIME-Version: 1.0
References: <20211001123115.GE2283@kili> <144b8ba5-82db-fc90-1d0f-5a8e2ce45c90@codeaurora.org>
In-Reply-To: <144b8ba5-82db-fc90-1d0f-5a8e2ce45c90@codeaurora.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 15 Oct 2021 21:24:51 +0300
Message-ID: <CAA8EJpoDfWRT48J=G5-VQcHC6Zg8D-0VujjnjQyvHD0PQ=SoKQ@mail.gmail.com>
Subject: Re: [bug report] drm/msm: dsi: Handle dual-channel for 6G as well
To:     Jessica Zhang <jesszhan@codeaurora.org>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Sean Paul <seanpaul@chromium.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 15 Oct 2021 at 04:43, Jessica Zhang <jesszhan@codeaurora.org> wrote:
>
> Hey Dan,
>
> On 10/1/2021 5:31 AM, Dan Carpenter wrote:
> > Hello Sean Paul,
> >
> > The patch a6bcddbc2ee1: "drm/msm: dsi: Handle dual-channel for 6G as
> > well" from Jul 25, 2018, leads to the following
> > Smatch static checker warning:
> >
> >       drivers/gpu/drm/msm/dsi/dsi_host.c:729 dsi_calc_clk_rate_6g()
> >       warn: wrong type for 'msm_host->esc_clk_rate' (should be 'ulong')
> >
> > drivers/gpu/drm/msm/dsi/dsi_host.c
> >      721 int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
> >      722 {
> >      723         if (!msm_host->mode) {
> >      724                 pr_err("%s: mode not set\n", __func__);
> >      725                 return -EINVAL;
> >      726         }
> >      727
> >      728         dsi_calc_pclk(msm_host, is_bonded_dsi);
> > --> 729         msm_host->esc_clk_rate = clk_get_rate(msm_host->esc_clk);
> >                  ^^^^^^^^^^^^^^^^^^^^^^
> > I don't know why Smatch is suddenly warning about ancient msm code, but
> > clock rates should be unsigned long.  (I don't remember why).
> >
> >      730         return 0;
> >      731 }
>
> I'm unable to recreate the warning with Smatch. After running
> build_kernel_data.sh, I ran `<path to smatch>/smatch_scripts/kchecker
> drivers/gpu/drm/msm/dsi/dsi_host.c` and got the following output:
>
> CHECK scripts/mod/empty.c
> CALL scripts/checksyscalls.sh
> CALL scripts/atomic/check-atomics.sh
> CHECK arch/arm64/kernel/vdso/vgettimeofday.c
> CC drivers/gpu/drm/msm/dsi/dsi_host.o
> CHECK drivers/gpu/drm/msm/dsi/dsi_host.c
> drivers/gpu/drm/msm/dsi/dsi_host.c:2380 msm_dsi_host_power_on() warn:
> missing error code 'ret'
>
> Is there a specific .config you're using (that's not the default
> mainline defconfig)? If so, can you please share it?

Are you running your checks with ARM32 or ARM64 in mind?
Note, esc_clk_rate is u32, while clk_get_rate()'s returns unsigned long.
It would make sense to change all three clocks rates in msm_dsi_host
struct (and several places where they are used) to unsigned long.

>
> Thanks,
>
> Jessica Zhang
>
> > regards,
> > dan carpenter



-- 
With best wishes
Dmitry
