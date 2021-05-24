Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 675BF38E0C2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 May 2021 08:01:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbhEXGCr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 May 2021 02:02:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229633AbhEXGCr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 May 2021 02:02:47 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7B8FC061574
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 May 2021 23:01:18 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id 36-20020a9d0ba70000b02902e0a0a8fe36so24163765oth.8
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 May 2021 23:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=sLMIpW2Ge4GhccaqX0f4ED9sUyQ6GUsKxhCWraflgrQ=;
        b=kVwYjulbTpXvf8F/AH3Cn0+PqDxe6AsTYtT1ijwLpjc9Obx9CbTmoSemY8OjUw5tYq
         rghjvabI9aDAfy2KPMPOW60+THjy42P4Hk8yAjtHoNQ/Gt4be51wkQTQyQj5PlXT9Z8Q
         euKF6L1zMRk4m61B6LOZ8/zAZNWibeDQj15O0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=sLMIpW2Ge4GhccaqX0f4ED9sUyQ6GUsKxhCWraflgrQ=;
        b=ADs/SHTjvp48/UwQF8UUw4n+X0QDXRa6MzGvjyOq8n4HOhKYiyKgtu2XoB1S/vv3OP
         mgPZskQLpRpSWWLUEeq3MtvLxv3ZDngz9JrbYprkLgRUwCE971SgEI3WI7Tq2fZrH2RQ
         qcKlOUdM2ZCSDvL6nz9P9fsRSm+u2ml7oqvxs/GHgsgzKweGjmKVM+6NNVXw/sKuYAgm
         MblUUL+XpFILno2I6nPY/ciPNMXVvmA7Z2zeGN8TV/Fou93VvajGP48Y4Gu01m1x7JDI
         jk9yfZvnDJBg3ARBMFsOq3LLBnazNB9nQgzVjGuxxKu97+2WZoeUhdDWCYmKOARnFSWv
         SgpQ==
X-Gm-Message-State: AOAM530dGoRfIxykDazxmFUuR10N951M33D3JPkTnl79+Rz+j88zg98B
        HdrF/q/7Gc6+2Wpp00bZKz+kcgi9OlcMcHgD5UjLJQ==
X-Google-Smtp-Source: ABdhPJxUXFeT7fRAQnyP76eyIBN6bZDnvKj0MzPI3ELpSWl7G60SJAr6Ae5/UXm1yxBeM2GrXn7ehxeepjeJze0/e+U=
X-Received: by 2002:a05:6830:1556:: with SMTP id l22mr17357557otp.34.1621836078248;
 Sun, 23 May 2021 23:01:18 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 23 May 2021 23:01:17 -0700
MIME-Version: 1.0
In-Reply-To: <CAGETcx_LKwfv3Lx0mpxXaSdvoz284THwjqoHoOmZDwtcTf1zWg@mail.gmail.com>
References: <20210520002519.3538432-1-swboyd@chromium.org> <20210520002519.3538432-4-swboyd@chromium.org>
 <CAGETcx_LKwfv3Lx0mpxXaSdvoz284THwjqoHoOmZDwtcTf1zWg@mail.gmail.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Sun, 23 May 2021 23:01:17 -0700
Message-ID: <CAE-0n518E_Yfy7-Au-pO40SQzZAn6NLr8u1pGyPMWWr0wRgpJA@mail.gmail.com>
Subject: Re: [PATCH 3/7] component: Introduce struct aggregate_device
To:     Saravana Kannan <saravanak@google.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Saravana Kannan (2021-05-20 13:20:45)
> On Wed, May 19, 2021 at 5:25 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > -       master->parent = parent;
> > -       master->ops = ops;
> > -       master->match = match;
> > +       id = ida_alloc(&aggregate_ida, GFP_KERNEL);
> > +       if (id < 0) {
> > +               kfree(adev);
> > +               return id;
> > +       }
> > +
> > +       adev->id = id;
> > +       adev->parent = parent;
> > +       adev->dev.parent = parent;
>
> Don't set adev->dev.parent. You are creating a functional 1-1
> dependency where none exists. The real dependencies are the 1-many
> dependencies between the aggregate and the components. Use device
> links to capture that and enforce proper suspend/resume and runtime PM
> ordering.
>

Ah ok. Yeah it seems like that was the thing causing me runtime PM
problems. I've removed the parent patch from this series now and I'll
look at working in the device links now.
