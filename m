Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D792F485E82
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jan 2022 03:18:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344655AbiAFCR5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Jan 2022 21:17:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231933AbiAFCRy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Jan 2022 21:17:54 -0500
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B609C061245
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jan 2022 18:17:54 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id v6so1683413oib.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jan 2022 18:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=3AqXmqq/fvbOxqwSsHR7wVrpv5IIhXUtH49b4LPOTWI=;
        b=iS7/hV/IXv3fGbOyIo3DxFq5LwX+yNVjDMVRBSweVFwpCyyZTPKA24PenSTX69xA/i
         OuDCHNlFBOa4gVHOPRVu34iAgxyQp+F7IAqYNajp4XaNH8p+ohYFmq9bM3aYpSXZKQDU
         oaJROehE/SR2d9RGiS+dRzOOJ2oOSF4snbOh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=3AqXmqq/fvbOxqwSsHR7wVrpv5IIhXUtH49b4LPOTWI=;
        b=TH+RRjFLoCbP1GalFWM+V9IV4uHp3eY6wvQCYGf0Lh6VkFYq1gr4BXgBOq+GfWBWY4
         iSysyXC0nSGcxg5RWF0+kMW3p0TkwuzIKEVlwCrNhI2+XcmGg48LXdZaGfs+vbIfTQnB
         xUJ1mS5D6wxwJu6IkBiSmYohWd7En/lVy+83e27mCKIZJFbinAmWusXNGzu4XKCP1cts
         nwZ/n5tb45A+nie16QToXrFFd7GoCbYNKM6J3db0lfU6sfcTev16RnKtW87eVM0Xw1si
         3wTGVwA/egYsuwS+qGvPCtRgzEMrVKVhLJ/j9Xp8VycxiDS3XHAIXgPw3/Q7wmu99ozd
         CEDg==
X-Gm-Message-State: AOAM533XFqK7ugZhlj1amC9LT7g+zEJfZkppYdVZUEckhBD08Av7hkQz
        BSG3REvOQlBcAZmS8UJUVi91RF210g2D9AxPFqV65g4J2nE=
X-Google-Smtp-Source: ABdhPJxVckkTPHg9kSdLRZHjaIGQnCN/oUiOy+mbGbuwVgV7+6FQORY/VTnh4Y+bCHsmoHzUw0n87Qpp99riuTZQHtQ=
X-Received: by 2002:aca:4382:: with SMTP id q124mr4659737oia.64.1641435473794;
 Wed, 05 Jan 2022 18:17:53 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 5 Jan 2022 18:17:53 -0800
MIME-Version: 1.0
In-Reply-To: <YcGel9PtOgqWH6l3@kroah.com>
References: <20211202222732.2453851-1-swboyd@chromium.org> <20211202222732.2453851-2-swboyd@chromium.org>
 <YcGel9PtOgqWH6l3@kroah.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 5 Jan 2022 18:17:53 -0800
Message-ID: <CAE-0n53WuAZZQzEsidz-N9Nat=qAJ10Mn4O4syurW11rTuEEMw@mail.gmail.com>
Subject: Re: [PATCH v4 01/34] component: Introduce struct aggregate_device
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Saravana Kannan <saravanak@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Greg Kroah-Hartman (2021-12-21 01:29:59)
> > @@ -471,9 +477,17 @@ int component_master_add_with_match(struct device *parent,
> >       if (!master)
> >               return -ENOMEM;
> >
> > +     id = ida_alloc(&aggregate_ida, GFP_KERNEL);
> > +     if (id < 0) {
> > +             kfree(master);
> > +             return id;
> > +     }
> > +
> > +     master->id = id;
> >       master->parent = parent;
> >       master->ops = ops;
> >       master->match = match;
> > +     dev_set_name(&master->dev, "aggregate%d", id);
>
> You set the name yet the device is not "real"?
>
> I don't understand this patch at all, sorry.

The device is registered in the third patch. I'll squash this patch with
that one and move the rename patch to be the first patch in the series.
Then it should be clear why a struct device is introduced along with the
bus type it's associated with.
