Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3F96228222
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jul 2020 16:29:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728934AbgGUO14 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jul 2020 10:27:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728362AbgGUO1z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jul 2020 10:27:55 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80F2DC061794;
        Tue, 21 Jul 2020 07:27:55 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id n26so21889746ejx.0;
        Tue, 21 Jul 2020 07:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FoM2lLvk+HU1JsguyDzCkDhJcQpe74th81bnFKHZ61k=;
        b=Tb36TVsvZyPVCNfk8o0RlrlP+mnR/eMaGMgp6Ca1CqlBYlXZG8opeFsuRSmWNEGnGT
         3a0tm2PbY756z7t31/5nk17pGk2BzWpoQBFQIyUej3lj4szEfe+nJh91oxub3Fy77Ztt
         tf4BTSjY2cEUt7m4bl9/ZYp4SZnw4Fi3KOq/M6F92/ntlTkSAaLFhE1WGSUUQImHNrKr
         tcRL5XsJwxlx/iEv9vt86Kc3XkyDdsQYaX8qd020OiJ4QhECITtA7w3G5t4t+V4XhVDz
         ZBaw6bBvig4y+KfHz01SUMWZbGu+5lTOxxFaAfSXLQu4XEfbEWDywzSrEfb7texqDZ4G
         aW2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FoM2lLvk+HU1JsguyDzCkDhJcQpe74th81bnFKHZ61k=;
        b=MVy5/l/hzL0yRaRqtSPIc3Sd+GBWA8BkC0pHx9HOyErlf2SfLyFspiOnTuwwBdDHr4
         RKuhuZOiez0jt6KxsziQbjZSJIJo/JpHBblKFLG/V3Eg1KR00iT0hPA8FYMvQqTo2D2g
         a9ZpM2qqNTKsNL7M0sgxR9MIZvx7aICNDiNVUj6QffLza6L2H+1ZdcMzhgE8xmZHLB4W
         HjApVHwXPgBw36nnuuLEoUHVlkDgR23FWOIhviRPPrFM2hTQLZ0Vs6o0CAQShZH4p2kC
         32tev6v0zH07J4mSQCB4wKCIEcp1jr6YskT20IdcBiV8D3AWiXWNLOkBfqbistGiKiAg
         KoDw==
X-Gm-Message-State: AOAM5318k2N24ij6fFY+OqCe2veG5vsIKpt9tHC+/45a9ZzP/zxF6nTc
        05rXr12x6PuDt/pAsUH4u68MXR7T/ex+pEf4c28=
X-Google-Smtp-Source: ABdhPJzSo6Fh1hKllPx1Sf8jn5wjHy9PnUTmzYxaeqSTRJRgYWldpUIItzBxdpOIlcnV/OUxWXwrM0RFinDCHwJeuFY=
X-Received: by 2002:a17:906:ca4c:: with SMTP id jx12mr24039568ejb.231.1595341674113;
 Tue, 21 Jul 2020 07:27:54 -0700 (PDT)
MIME-Version: 1.0
References: <1594644106-22449-1-git-send-email-akhilpo@codeaurora.org>
 <CAF6AEGtAEwZbWxLb4MxaWNswvtrFbLK+N0Fez2XYr7odKZffWA@mail.gmail.com>
 <20200720100131.6ux4zumbwqpa42ye@vireshk-mac-ubuntu> <CAF6AEGurrsd3nrbB=ktZjWfKTNbKwPHYwTFiZdD-NOW1T7gePQ@mail.gmail.com>
 <20200721032442.hv7l4q6633vnmnfe@vireshk-mac-ubuntu>
In-Reply-To: <20200721032442.hv7l4q6633vnmnfe@vireshk-mac-ubuntu>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 21 Jul 2020 07:28:30 -0700
Message-ID: <CAF6AEGuhQcRskGhrFvmCf5T3EcZ9S+3LRdZBiaDYqF34yZjd+A@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] Add support for GPU DDR BW scaling
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Akhil P Oommen <akhilpo@codeaurora.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        dri-devel@freedesktop.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Matthias Kaehlcke <mka@chromium.org>,
        saravanak@google.com, Sibi Sankar <sibis@codeaurora.org>,
        Jonathan <jonathan@marek.ca>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dave Airlie <airlied@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 20, 2020 at 8:24 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 20-07-20, 08:03, Rob Clark wrote:
> > On Mon, Jul 20, 2020 at 3:01 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > >
> > > On 15-07-20, 08:36, Rob Clark wrote:
> > > > I can take the first two into msm-next, the 3rd will need to wait
> > > > until dev_pm_opp_set_bw() lands
> > >
> > > You can base that on a8351c12c6c7 in linux-next, I will make sure not to rebase
> > > it anymore.
>
> This was 5.8-rc1 + 2 patches for OPP. That's all.
>
> > >
> >
> > I can't really base on something newer than drm-next
>
> But you need the OPP dependency, isn't it ?

With your ack, I can add the patch the dev_pm_opp_set_bw patch to my
tree and merge it via msm-next -> drm-next -> linus

Otherwise I can send a second later pull req that adds the final patch
after has rebased to 5.9-rc1 (by which point the opp next tree will
have presumably been merged

BR,
-R

>
> --
> viresh
