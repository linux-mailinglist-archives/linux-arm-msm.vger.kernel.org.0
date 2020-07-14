Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7972B21F9A7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2020 20:42:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728312AbgGNSl7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Jul 2020 14:41:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726817AbgGNSl6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Jul 2020 14:41:58 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79C36C061755;
        Tue, 14 Jul 2020 11:41:58 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id w6so23750492ejq.6;
        Tue, 14 Jul 2020 11:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f70f6IrV0YxEjaCs9DxeSPhQuDdLaxIEZSEaWG88uXA=;
        b=VejG7ns58/o56wE4RNCvWeVgjvU+LlSoJSfL5d4/jVqlOeuw9g5CUYQ50YHQsdFubO
         Ha/tpOyW5b8T/y1/g5j25Dy7Stl9LZry22xtj/m8/nOqMpc/fCk+1qjE7uVogVEwusDR
         MdrLTadVg8Tfor2CQMkYUPeF6CotVCOZnYDiYMxzpT5+FiGYsggCeOtJWuy50S8NnYeA
         RfW/LG7XaOHQ6LRT9d3xfBPJ70NeCSRtCGUFyCRQ9exbhAh59Bl0S0Hb7uNNsmQ8hc2i
         nO9UZMEvYBuewr/CkpT34nSSSPnXFAlfdo1tQfc/nxdNZYwWTNErlafBOzZK4GRqr5ub
         BHKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f70f6IrV0YxEjaCs9DxeSPhQuDdLaxIEZSEaWG88uXA=;
        b=NdB5YC4AY95LbZuW9bpDGpMjoxM5pHrIN8NTn90ViQ7r7BvEfm9JN3xhAtKHy7+XDu
         SaPrz4LkTFromgwx6pzHAGYBt//MAbYz5Di/o4U5c981suBpHPLKJHO0EIOkxdsNH4c1
         ynhCKoh8aMyk+ryqmLooxIpmKar4ZBaW7p3GFdBL5KioVcpizGWaSdCqqLjDKzaEo8Pa
         miwx+Pd2mkRAJ3fHoc4vEn+164mkwnouce/kSlSYK+/QP7tTRaPFYsIFWmPxssqOvEwN
         xpWAJdM9d9jscRiruxS1UDg0F/jWUxTUD9GrGWzjnxYBlGNvwlEK+SkbKUgsYGo3vOoo
         XAvg==
X-Gm-Message-State: AOAM5327QPEPL19XZofxEEeU+Ly4qLvdk9ovQ2ltRYyOHUJmpBtJhDma
        TfNi4TpFtn7O4YAKm4quYuqBIr21yPXJOjnrx8E=
X-Google-Smtp-Source: ABdhPJx7APKDvb5pLdspcKbtqQHuogOBvlhkuNQrvEweAhJTwvPQg/Zo30df4jeOKEXwcHuWI25swo7X80ueqGE9D3w=
X-Received: by 2002:a17:906:4d4c:: with SMTP id b12mr5749555ejv.506.1594752117201;
 Tue, 14 Jul 2020 11:41:57 -0700 (PDT)
MIME-Version: 1.0
References: <1594733130-398-1-git-send-email-akhilpo@codeaurora.org> <20200714171036.GS3191083@google.com>
In-Reply-To: <20200714171036.GS3191083@google.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 14 Jul 2020 11:42:28 -0700
Message-ID: <CAF6AEGsvbnWiFXQUFR+k-CLJ2CsCEoiVVE8pGVq0X0=VHE3hHA@mail.gmail.com>
Subject: Re: [PATCH] drm: msm: a6xx: fix gpu failure after system resume
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Akhil P Oommen <akhilpo@codeaurora.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        dri-devel@freedesktop.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Jonathan <jonathan@marek.ca>,
        Rajendra Nayak <rnayak@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 14, 2020 at 10:10 AM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> On Tue, Jul 14, 2020 at 06:55:30PM +0530, Akhil P Oommen wrote:
> > On targets where GMU is available, GMU takes over the ownership of GX GDSC
> > during its initialization. So, take a refcount on the GX PD on behalf of
> > GMU before we initialize it. This makes sure that nobody can collapse the
> > GX GDSC once GMU owns the GX GDSC. This patch fixes some weird failures
> > during GPU wake up during system resume.
> >
> > Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
>
> I went through a few dozen suspend/resume cycles on SC7180 and didn't run
> into the kernel panic that typically occurs after a few iterations without
> this patch.
>
> Reported-by: Matthias Kaehlcke <mka@chromium.org>
> Tested-by: Matthias Kaehlcke <mka@chromium.org>
>
> On which tree is this patch based on? I had to apply it manually because
> 'git am' is unhappy when I try to apply it:
>
>   error: sha1 information is lacking or useless (drivers/gpu/drm/msm/adreno/a6xx_gmu.c).
>   error: could not build fake ancestor
>
> Both upstream and drm-msm are in my remotes and synced, so I suspect it's
> some private tree. Please make sure to base patches on the corresponding
> maintainer tree or upstream, whichs makes life easier for maintainers,
> testers and reviewers.

I've run into the same issue frequently :-(

BR,
-R
