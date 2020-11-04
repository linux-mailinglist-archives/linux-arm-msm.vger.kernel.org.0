Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 397802A6F46
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Nov 2020 21:56:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731485AbgKDU43 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Nov 2020 15:56:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727013AbgKDU43 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Nov 2020 15:56:29 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FB1AC0613D3;
        Wed,  4 Nov 2020 12:56:29 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id p22so3704284wmg.3;
        Wed, 04 Nov 2020 12:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QMz5XuaiSl2y5K3brn4ts6zliBq11tCQumna2ZD9gwg=;
        b=SJZCCPmggjEI3WSwrNv12XAc3V0t974Tjot8SwxaA5JGO+QOStpAbOhFhtiOnvu3+b
         yDmvlIEjwUlHMqAk6tS7kx2Qn/mqVpTUdCuw5s3eGDyx7Vb24Qw2cFAfifbhXvThB0ZM
         BkWEexz8mfawPufJKrMmmu/9sSa/MRKxNzi89UxCf4muNRFC4TCnUGWO8tNRMdmsC8pg
         or8u3PCTPuOksBmF7KDKEUr48DlKDlLhC7Lh8g1wgErBO7P+nwB9Du48eX7kwvB8Xfmo
         vuVoztUap4U9Xp6HUDM0NntBsB2YTmI3MTxTeP6eeIIi68YzsWMwgNkaDJQqVN1B9jl2
         cznQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QMz5XuaiSl2y5K3brn4ts6zliBq11tCQumna2ZD9gwg=;
        b=TQrrN0Vxh+v+Q5rF+5rgPq20uFwHHSbEEMSR0v5+fSPY5gxYKi36kYvxsxfewKmnrN
         gEIexoIQlkRNjFwxC9cBXt0tF98EA5F3BXpqiWTyVDkNCA3/me/S8ZvhuPzmrO9d7O4d
         AxnZQvwOHhGhUb54pKasm6A4F59GbRHQe/N5fFzKsCCSZokAXJVBObKk7jwiU2umRbMY
         Jv+l9WToxwtbABCtqHZAAYShgAVTDujEqSTH4xb6KwfV/9RvSlvoTvIR00bRmpf89aoZ
         nUJCGU+ZmreF/4msH6xnQxSDcbNajoanxgDm48rvlw6S42RCsoAI4ziblxr3g9FS9+sw
         Vmng==
X-Gm-Message-State: AOAM533xw+NKklIlMfPvc85uiPepmmNo9wDYWNQRIGefLQBrJ7chyFFh
        wTKgn18Q2BuTM7mN9pUh5zvWXt9XyjI8+gpQM5o=
X-Google-Smtp-Source: ABdhPJwZj9HwapeVTBuX6MbvmCI10ccxfb2V7iPfEujOr2zcUHGnUhcVOI4/pc/YpbPMBdEWvizQ7MVVagmsgcK7PJE=
X-Received: by 2002:a7b:c145:: with SMTP id z5mr2246798wmi.164.1604523387717;
 Wed, 04 Nov 2020 12:56:27 -0800 (PST)
MIME-Version: 1.0
References: <1604054832-3114-1-git-send-email-akhilpo@codeaurora.org>
 <1604054832-3114-3-git-send-email-akhilpo@codeaurora.org> <20201104200300.GA4036650@bogus>
In-Reply-To: <20201104200300.GA4036650@bogus>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 4 Nov 2020 12:58:02 -0800
Message-ID: <CAF6AEGvj34MbnRS+A432AhOwMuL2BtTXJ+AD+zQ9w0_meV_-gw@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v5 3/3] dt-bindings: drm/msm/gpu: Add cooling
 device support
To:     Rob Herring <robh@kernel.org>
Cc:     Akhil P Oommen <akhilpo@codeaurora.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        dri-devel@freedesktop.org,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 4, 2020 at 12:03 PM Rob Herring <robh@kernel.org> wrote:
>
> On Fri, 30 Oct 2020 16:17:12 +0530, Akhil P Oommen wrote:
> > Add cooling device support to gpu. A cooling device is bound to a
> > thermal zone to allow thermal mitigation.
> >
> > Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> > Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> > ---
> >  Documentation/devicetree/bindings/display/msm/gpu.txt | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
>
>
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
>
> If a tag was not added on purpose, please state why and what changed.
>


Thanks Rob

I've copied over your ack from the previous version.. but yes, it
definitely makes my life easier when patch senders do this for me ;-)

BR,
-R
