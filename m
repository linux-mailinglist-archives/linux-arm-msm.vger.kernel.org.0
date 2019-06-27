Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9F3858534
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2019 17:07:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726465AbfF0PHm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jun 2019 11:07:42 -0400
Received: from mail-qt1-f176.google.com ([209.85.160.176]:42751 "EHLO
        mail-qt1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726405AbfF0PHl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jun 2019 11:07:41 -0400
Received: by mail-qt1-f176.google.com with SMTP id s15so2766515qtk.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2019 08:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hphFkZDwH5uUYqLxvSUJk2I9eaAINHc3fTg5y5tTdH8=;
        b=a24+UYyehjdsXFhPvEmIb+1yHEfrNAQRta8iXpksnY89c1KoEYFqImOmohsCeYJgIl
         iKg7TQ034fMLZt0gaPwnRoxVzk7ufAs34EGHre0vbgEMHpeRYgI/599/ET2o4hCHDAON
         G4Wlc95+kGgfmR0YuNy7r+8Z99y5sEMPlOBYGp2a8/Lv0Xk3KdPiKaHdEloB8n1JZfAF
         w9kxcU69FRUAEM0fXdBk7T3M68uK9ifGE98fh2217pz8HqPBU81xdbymxVSg2PNIp+xs
         nYo7hw58TvEJZM6XlFcwvsW/9hTx6KTqD+lHWDNh41IF5IWb+08j1t0zcZThrE1Ps+3j
         2SEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hphFkZDwH5uUYqLxvSUJk2I9eaAINHc3fTg5y5tTdH8=;
        b=GVp9lKk8X9OoRnqcXkQ2p905udSRiFiBFnE5ooSnI5uAx3x3lG01NEE49bXLjgLi9e
         KnwtwSR3xzZIgKAHrL/OUpNFmtMpCE+mdFCD1w/j6vnxh+8W+aupoTK+hj9TkUq0S4uB
         Sq2KusN/ickR5pCpy/GbtSinHwyat3AYByvtiRLmFs1cXHYbx51+ZzGUihksSbNAnRXu
         0rifbE/euewcICC4w63eO7UyvWjludP+0C0i1nAH3k4QNIVkl90KKUho0rnAux3B8YTD
         rjLN+6+Qr4Ew6IVfOtym003Ujl4v+uXkvXtd3VFQoE1BLpTmEVx/iJvDOhCosIhZyihP
         flBQ==
X-Gm-Message-State: APjAAAUziL2DHEfVoBsTGmOvG80Q09sfa5si4IaB1Cwo/g3FYjP51LwK
        VZngIt8CnuKIFznZ0mhaqoDnDA==
X-Google-Smtp-Source: APXvYqwDVMeuVAX3ExncsLfS3FxusRjtH/zhUKJhIjls97r0EuSsyMZP5IewOE32BT5WGfIZoO75Bg==
X-Received: by 2002:a0c:8849:: with SMTP id 9mr3546530qvm.21.1561648057020;
        Thu, 27 Jun 2019 08:07:37 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id t197sm979598qke.2.2019.06.27.08.07.36
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 27 Jun 2019 08:07:36 -0700 (PDT)
Date:   Thu, 27 Jun 2019 11:07:35 -0400
From:   Sean Paul <sean@poorly.run>
To:     Dave Airlie <airlied@gmail.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: [Freedreno] [pull] drm/msm: msm-next for 5.3
Message-ID: <20190627150735.GJ25413@art_vandelay>
References: <CAF6AEGsj3N4XzDLSDoa+4RHZ9wXObYmhcep0M3LjnRg48BeLvg@mail.gmail.com>
 <CAPM=9txROe0mxv+w=v3trMbn7pPxj5wbjkh5=RJarsDbGwV7BA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPM=9txROe0mxv+w=v3trMbn7pPxj5wbjkh5=RJarsDbGwV7BA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 27, 2019 at 12:21:39PM +1000, Dave Airlie wrote:
> On Wed, 26 Jun 2019 at 08:34, Rob Clark <robdclark@gmail.com> wrote:
> >
> > Hi Dave,
> >
> 
> Naughty naughty rebase.
> 
> dim: f47bee2ba447 ("drm/msm/a3xx: remove TPL1 regs from snapshot"):
> Subject in fixes line doesn't match referenced commit:
> dim:     7198e6b03155 drm/msm: add a3xx gpu support
> dim: fc19cbb785d7 ("drm/msm/mdp5: Fix mdp5_cfg_init error return"):
> Subject in fixes line doesn't match referenced commit:
> dim:     2e362e1772b8 (drm/msm/mdp5: introduce mdp5_cfg module)

Hi Dave,
Was chatting with Rob about this on IRC and these failures aren't due to a
rebase (we were quite careful to avoid rebasing this cycle). The issue seems to
be that the commit messages use the format,

        Fixes: <hash> <subject>

for Fixes tags and dim does this when comparing the subject:

        if [[ "$fixes_subject" != "(\"$orig_subject\")" ]] ; then

So dim is being quite strict about adding parens and quotations to the subject
in fixes lines and failing as a result.

IMO since the hashes are correct this formatting should be fine.

Ok with you?

Sean


PS- If it's fine to format like this, we might want to change the dim check to
something like:

        if [[ "$orig_subject" != *"$fixes_subject"* ]] ; then

> 
> Please fix or squash those and resend.
> 
> Dave.
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno

-- 
Sean Paul, Software Engineer, Google / Chromium OS
