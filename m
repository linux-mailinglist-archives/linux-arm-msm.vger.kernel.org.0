Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F36F92E2E30
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Dec 2020 13:34:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726017AbgLZMeV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Dec 2020 07:34:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725969AbgLZMeV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Dec 2020 07:34:21 -0500
Received: from mail-vk1-xa34.google.com (mail-vk1-xa34.google.com [IPv6:2607:f8b0:4864:20::a34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDC3AC061757
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Dec 2020 04:33:40 -0800 (PST)
Received: by mail-vk1-xa34.google.com with SMTP id p128so1366238vkf.12
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Dec 2020 04:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0+4GiddmMKX2n+ep0Q70U4LwcCGra+frxqtZBtez1YY=;
        b=XhYbKlz3x73t6AcEy9kNTYJqEA5ksbdKKKed8s2ADkKXRdrp9YbLkQyqzxdkD4NBMP
         RGnIeV2bCRgJxcyCQsTWR4ZudAUZaPvYkboRaNJfMKCJVgn760J4oOs/t9SwiMooxelF
         3lxPYqptortQh7piOvtXODJWFvgNVk9kABEdqv2X97BaxMLcvGmyaJMN/aVuABsu6blP
         nv76viIXjmwg/pILxtW4lKlylF/whzY3iNGT2IA17nigSBC2Luzt2jXhlzltS/V929JS
         ryfKyRYp0tvGG2WHSMqf6aSRjtoM3SApcR4BmIKVb4kGyyfi7937YGYJlG/vI7DXtxi/
         1rtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0+4GiddmMKX2n+ep0Q70U4LwcCGra+frxqtZBtez1YY=;
        b=Z3pLaAMLay8xUtAt+Q8kBdU/2dKjJTZ89SXMkBZTFe6Vd1QltgQVi9MMeHMD2XdAad
         knHortfoNsjFWJ9GDPU0kwqJubKKs6PAD+Pg+nX32ENQ4pMFdDQVw1RZ/2rvpdDmp+xV
         nbPxYnFXMomzZNsNCeYRM2DKT6Emv/DEzFU+fZM+woT+dEFQd0t/jS4nxglFaPL+m/Pr
         PxsWV6A7zDTs5OX8w5Che2AJS6rjqo5UHwXCRshK7cWbendSNldofbxBeLsgWfBNeWtV
         M5HYigoKbpUfZTGM2k3Lvt5KMU2Bs6wN/XMfqFDB9EERmkIrSLZ6qtNa1asgj8str4Uy
         o4RQ==
X-Gm-Message-State: AOAM5317gAc/2lBXz7oEEV4BL0zkkuJ2hB44OfS2+aBlmNdH7pVRt6WB
        UsEexrWrObDbTExtj/hW0OsGKfQeel2MA4qaqTLYblAhGiq4uQ==
X-Google-Smtp-Source: ABdhPJzWejeetSCZHK8RVTdUtU7uY5ynvgPttJOT8ljhyM0OVry0SR3X2iplM9s4ue5f8eOTit+fND5o9OSowky7jtc=
X-Received: by 2002:a1f:5fd5:: with SMTP id t204mr25642057vkb.6.1608986019576;
 Sat, 26 Dec 2020 04:33:39 -0800 (PST)
MIME-Version: 1.0
References: <20201216175056.19554-1-ilina@codeaurora.org> <CAPDyKFrdZTd0mWHYhk13uyNWoxqjkO_iSni_TC5uir-PpgxSpw@mail.gmail.com>
 <X+VBBKZXZ2JW3ZDL@codeaurora.org>
In-Reply-To: <X+VBBKZXZ2JW3ZDL@codeaurora.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Sat, 26 Dec 2020 13:33:03 +0100
Message-ID: <CAPDyKFrAV5Af8WVTy==u1-Ak7zrwC+X7bWSRCc_RrwHoTKfVGw@mail.gmail.com>
Subject: Re: [PATCH] PM / Domains: allow domain idle states to be disabled
To:     Lina Iyer <ilina@codeaurora.org>
Cc:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Linux PM <linux-pm@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 25 Dec 2020 at 02:31, Lina Iyer <ilina@codeaurora.org> wrote:
>
> On Tue, Dec 22 2020 at 03:16 -0700, Ulf Hansson wrote:
> >On Wed, 16 Dec 2020 at 18:51, Lina Iyer <ilina@codeaurora.org> wrote:
> >>
> >> In order to debug critical domain and device power issues, it may be
> >> necessary to disallow certain idle states at runtime. Let the device
> >> disallow a domain idle state before suspending.The domain governor shall
> >> check for the 'disabled' flag while determining the domain idle state.
> >
> >For debug purposes, you might as well just set a dev PM Qos latency
> >request that corresponds to the state you want to disable. This will
> >then prevent the genpd governor from selecting the state.
> >
> True, but it will also disable idle states deeper as well. Would like to
> avoid that.

I see. In any case, I am not so excited about adding an exported genpd
interface for this that drivers can call, for example.

Then I would rather see a proper debugfs interface, where userspace
can both see the available states and choose which one to
disable/enable. Would that work?

[...]

Kind regards
Uffe
