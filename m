Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68F991EFA2E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2020 16:14:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727889AbgFEOOt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Jun 2020 10:14:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726553AbgFEOOt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Jun 2020 10:14:49 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8838C08C5C2;
        Fri,  5 Jun 2020 07:14:48 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id c1so5655904vsc.11;
        Fri, 05 Jun 2020 07:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=92tfzhWVlr2aeqK6HzMd7FHEFDVr/SwIXq1vTN+sBsE=;
        b=slC13LUI63Z1B/lBFeHzqxfKXgHGu+NWsOaWx/VY3tEIMAz36JD2glQbgAOqnCdXbr
         vcJoMUqM1fMC4H4ja7kjAkGBV8O28unPretRpywWtW9KDU3RkUc15rSc7Onpivvqzdfw
         SVboV6cjc7XBfCVbQKKB8foHRY2gSgkTSfYs68RQmE69KBrm6rbOBrM+p03DAe3omKG2
         GsAjLEuDzhg8NN7ew4JTjebwu69A/Y8G5Zwd3lpuczD/gi8N+9ovP4AUZoCqoQIwjsc0
         CpGc3tKy8ZoDo3NHDt4K5McRKhuNv1DkmxfHtPQM45sWoMsaF3nBj3QOf6ex3gX2zoAo
         F2dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=92tfzhWVlr2aeqK6HzMd7FHEFDVr/SwIXq1vTN+sBsE=;
        b=ZxH/tY2zuX5fWVfInWuwC0oiwsQM9PcCO6oSalDlHG1tt7xuuICzCyNf4tP9Y9cMYX
         RZZKXC8PPVzuGCZMRE88/5cD6AqB7jw7qztmDBBQJd/e4QhnF67UFtcVkJMRjTeRjxqR
         PcYXGP35PjcWPyEgdPHG9AQSbdUVyLeFkb9z1qBZCz8tiZiVUeMQwOoG+9DR+AuzsIEX
         eDuIpt6gZNyk8PGHDOPGn9cDn/1ntxUvH+VFBWxQBg6623gBut6CS3zZ+QiUHzsCpPLz
         hFByCgzN/EElpdcT6nG370+A6ep69FKY/eYCNOux4B423489sLvxngPzauuKNdGHzh15
         +Y9A==
X-Gm-Message-State: AOAM531c8z0Nl2XM4HJ489OXQkgdWugeZurM71BhQkUiUlzO/QhauNdr
        gSTr04isaE9U1omtX302D+zHw5c5+S5SD7KTisM=
X-Google-Smtp-Source: ABdhPJxwwCSalJFjI5Abuw6mc/isptPZeXUnUU8oFM57642z1EvQWUDOIZOqC/bjcW+INW9fkNsyYq792j8ZcgxWh/k=
X-Received: by 2002:a67:b149:: with SMTP id z9mr6882548vsl.85.1591366487388;
 Fri, 05 Jun 2020 07:14:47 -0700 (PDT)
MIME-Version: 1.0
References: <1591009402-681-1-git-send-email-mkrishn@codeaurora.org>
 <CACvgo50eb5_jp_6B5tkV9cX_X2_y2Xnavu+wvUUhHN5FsV9hiw@mail.gmail.com>
 <cd61dd742e73b89794fc1b812d9fdcd9@codeaurora.org> <CACvgo50b+m2+onak=AZfgihkBXEP9POjMR52087v==-puLdkQQ@mail.gmail.com>
 <8742ac6fbd498fdc22dcd469c3a2d52a@codeaurora.org>
In-Reply-To: <8742ac6fbd498fdc22dcd469c3a2d52a@codeaurora.org>
From:   Emil Velikov <emil.l.velikov@gmail.com>
Date:   Fri, 5 Jun 2020 15:11:24 +0100
Message-ID: <CACvgo52Rz+QzA4k7ttg6Gh124fZBAfaX0nrPpaMTECvr_8D2zw@mail.gmail.com>
Subject: Re: [v2] drm/msm: add shutdown support for display platform_driver
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Krishna Manikandan <mkrishn@codeaurora.org>,
        ML dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno@lists.freedesktop.org,
        devicetree <devicetree@vger.kernel.org>,
        "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
        Sean Paul <seanpaul@chromium.org>, kalyan_t@codeaurora.org,
        "Kristian H . Kristensen" <hoegsberg@chromium.org>,
        mka@chromium.org, devicetree-owner@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 2 Jun 2020 at 17:10, Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> Hi Emil,
>
> On 2020-06-02 21:09, Emil Velikov wrote:
> > On Tue, 2 Jun 2020 at 15:49, Sai Prakash Ranjan
> > <saiprakash.ranjan@codeaurora.org> wrote:
> >>
> >> Hi Emil,
> >>
> >> On 2020-06-02 19:43, Emil Velikov wrote:
> >> > Hi Krishna,
> >> >
> >> > On Tue, 2 Jun 2020 at 08:17, Krishna Manikandan
> >> > <mkrishn@codeaurora.org> wrote:
> >> >>
> >> >> Define shutdown callback for display drm driver,
> >> >> so as to disable all the CRTCS when shutdown
> >> >> notification is received by the driver.
> >> >>
> >> >> This change will turn off the timing engine so
> >> >> that no display transactions are requested
> >> >> while mmu translations are getting disabled
> >> >> during reboot sequence.
> >> >>
> >> >> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
> >> >>
> >> > AFAICT atomics is setup in msm_drm_ops::bind and shutdown in
> >> > msm_drm_ops::unbind.
> >> >
> >> > Are you saying that unbind never triggers? If so, then we should
> >> > really fix that instead, since this patch seems more like a
> >> > workaround.
> >> >
> >>
> >> Which path do you suppose that the unbind should be called from,
> >> remove
> >> callback? Here we are talking about the drivers which are builtin,
> >> where
> >> remove callbacks are not called from the driver core during
> >> reboot/shutdown,
> >> instead shutdown callbacks are called which needs to be defined in
> >> order
> >> to
> >> trigger unbind. So AFAICS there is nothing to be fixed.
> >>
> > Interesting - in drm effectively only drm panels implement .shutdown.
> > So my naive assumption was that .remove was used implicitly by core,
> > as part of the shutdown process. Yet that's not the case, so it seems
> > that many drivers could use some fixes.
> >
> > Then again, that's an existing problem which is irrelevant for msm.
> > -Emil
>
> To give more context, we are actually targeting the clients/consumers
> of SMMU/IOMMU here because we have to make sure that before the supplier
> (SMMU) shuts down, its consumers/clients need to be shutdown properly.
> Now the ordering of this is taken care in the SMMU driver via
> device_link
> which makes sure that consumer shutdown callbacks are called first, but
> we
> need to define shutdown callbacks for all its consumers to make sure we
> actually shutdown the clients or else it would invite the crashes during
> reboot
> which in this case was seen for display.
>
Thank you very much for the extra details. I think other DRM drivers
will be safe as-is.

-Emil
