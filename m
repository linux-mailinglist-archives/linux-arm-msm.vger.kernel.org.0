Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A1CA26BA36
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Sep 2020 04:30:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726279AbgIPC3u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Sep 2020 22:29:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726402AbgIPC3K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Sep 2020 22:29:10 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2687CC06174A;
        Tue, 15 Sep 2020 19:29:09 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id m5so5250868lfp.7;
        Tue, 15 Sep 2020 19:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=GK9+C1oomDz6uVnNOODHcK5n0hkREpa5d365nxARSlQ=;
        b=ivXcT/BSWD9eHKF5fmu1LVGsfELyKmXRv1tgY3c1gUJxIT4s77oCje6K/STc1JilzO
         g0/HhFcMPovrz3+RIBb1UNIkIC0/QRlpica+HugQMxFwZOqAmrd0xd5ZnbPGSZd6VTBi
         Cwsuvr3v3olxvxA7FwJx8mr39VEuSR/kuOC7Qnk9tXAflMeYa2rBHRriGu7ioVCuzyID
         jlEEwb+zn9IEa3vpb9zasSWufVHjC45YZlP5Ye1EaFw60S8XhjWVMNoU2xTnIiaI7gs4
         kqVO8LmdfKlpOhxYKsHEZO2TUXkbmoYsUge7/02BZVBmOudRO+1wmsN4amtJvTd9MY2o
         NXQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=GK9+C1oomDz6uVnNOODHcK5n0hkREpa5d365nxARSlQ=;
        b=V3aCmOPN9H3qJUkaYDpYWzhGWPiDh/vsQelQGo81OsQnQb05VHHHXSSxWSvbQ0YiO4
         jqvllCemh+lr+uQXmvGvOCWP/V6l22yyVz1F//TPk68eqHr6o3NwC3BobnTN/Rrqy0hr
         4NwHh8h4A2EsEZhdZBg56RyW7SNhAmqnvC9jwOv7Sf/Gdz62f58ZwNakc0W6+yLd8A+f
         gkC/42jtWui1/HeSYmlfJUD6bpFzH4c4Ehq3xFWH5DXaG7g7L9+mwsRktQMqJYoZZreK
         Wzur6RQn410U4DPkfYKSPWwhx0lj8/90wn6YlvY14vQzxM7Le8BxW57n2J7Z2NMr1yBn
         R1EQ==
X-Gm-Message-State: AOAM530LLRgLCYgrctPngeKKvUybTnB8iw5+TBPKxK8PzunCyQR0daBR
        iWjv0Ul+ePcKi4n13CO7YIa5XqBEAqdObpTvCNQ=
X-Google-Smtp-Source: ABdhPJz3mJdWwByW2nnR8gVQDANHxxrdl0PgQIGP9uf/PCLvjp6cJ31H81PHZZUnHib8dRcNGmVl6SVajTnc8v6EZq4=
X-Received: by 2002:a19:e602:: with SMTP id d2mr6618353lfh.536.1600223346217;
 Tue, 15 Sep 2020 19:29:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200912102558.656-1-zhenzhong.duan@gmail.com> <20200914162010.GB15060@jcrouse1-lnx.qualcomm.com>
In-Reply-To: <20200914162010.GB15060@jcrouse1-lnx.qualcomm.com>
From:   Zhenzhong Duan <zhenzhong.duan@gmail.com>
Date:   Wed, 16 Sep 2020 10:28:54 +0800
Message-ID: <CAFH1YnM1O6bE2bYbCjaWHfvo47TkHjh999yeESy81UMxMW_KYg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: fix a potential overflow issue
To:     Zhenzhong Duan <zhenzhong.duan@gmail.com>,
        linux-kernel <linux-kernel@vger.kernel.org>, robdclark@gmail.com,
        sean@poorly.run, airlied@linux.ie, Daniel Vetter <daniel@ffwll.ch>,
        smasetty@codeaurora.org, Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Sep 15, 2020 at 12:20 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> On Sat, Sep 12, 2020 at 06:25:58PM +0800, Zhenzhong Duan wrote:
> > It's allocating an array of a6xx_gpu_state_obj structure rathor than
> > its pointers.
> >
> > This patch fix it.
> >
> > Signed-off-by: Zhenzhong Duan <zhenzhong.duan@gmail.com>
>
> LGTM but should have a Fixes: tag for the stable trees
>
> Fixes: d6852b4b2d01 ("drm/msm/a6xx: Track and manage a6xx state memory")
> Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

I had sent a v2 version with same change as you suggested on Sep 14,
could you help review it? Thanks
https://lkml.org/lkml/2020/9/13/311
