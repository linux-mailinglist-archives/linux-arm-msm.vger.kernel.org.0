Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C9D647616E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 20:16:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239520AbhLOTQr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Dec 2021 14:16:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344146AbhLOTQm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Dec 2021 14:16:42 -0500
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAA32C06173F
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 11:16:41 -0800 (PST)
Received: by mail-qk1-x732.google.com with SMTP id g28so21077621qkk.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 11:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sLU/Sw5wzKqay9gp22pj8Nn9MOB4rOhm6u23bE7uK20=;
        b=B6xyOd8qdqOqaljKzPjKwLWjL2X7w7nH+zr60O+SHn6FDr1PCey+5unXwZc4F96T5Z
         2u4T7+81y7nZQOMj1Ngw+PrtT7i7JLEQ5lf+Jar59vC8TuYgaRNQ9rJiXOWajA8Q5z3i
         YRorOIVXlvW6jJtW6y9esWPKJbmyqx0Ht9qR0/V8FARH3r1FZpZISlvJ8X/Y6GbvgeW7
         hebQurTcOxREScJDR4HekCQwSSsX230j3Lg9sPhbPl+Y1qKDrDTRmei1h6MVc+yJfN59
         CxqxD13wB/oL3qnhVv2FZgrHjQ8o2/v4VBWQQxM+KuwTiGmw1ibXcG7FK5AfUDoX/NIR
         ZyRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sLU/Sw5wzKqay9gp22pj8Nn9MOB4rOhm6u23bE7uK20=;
        b=qxfEPGUXR5kw0hNwXeLN6M/2uaOGqboyBXA0x3l2SHO1ZPBYWcMbxHdVLlZ0T2AXmW
         x8RdFUzR1Rt1NaA/EdzC3LkRlHHS7DQ3nLfb1HcszrAMPJHOSuF4199YqNp3BDU3jEKA
         QF9EGP1Bn1a9pbC23+kj8U1fjmbQ3lmhvdmK7L0uOIa/VKOt7nQaO+kbs2APHYCtQ+3h
         TGVDRp25k4Z6kLkj7RsK/HEvIiZylPCRu79egMVVrbtQ0ebfXWOskzdjs6w5aaqmYvN4
         UhRrZFmCPdHboj6v0z6BMfMzer1jo6PeJShoK5pZJez5BU0WR+6ZjmDat4MydDfN3YYO
         LNqQ==
X-Gm-Message-State: AOAM530MBNPoOFzTTZh7o0TZZFqYm+zPTwMmRwKyxpS/GernKghsgu0m
        VdjVttkoJTGKn7PxoKfrr3LF74CyDzSsysEVf8kK+xIsbtsPmScx
X-Google-Smtp-Source: ABdhPJyCIHhWKoRm9ofMXdUhH/Uig11PjVvPxhKyQ0j8UJ0DfTNlxEDeGx8+GspIjSAjX9xx87wEejv6RUEAYh+jdHg=
X-Received: by 2002:ae9:e641:: with SMTP id x1mr9823005qkl.59.1639595800949;
 Wed, 15 Dec 2021 11:16:40 -0800 (PST)
MIME-Version: 1.0
References: <20211215175910.1744151-1-robdclark@gmail.com> <CAE-0n52CHwYAEwAC0Hthgbamjj2x4K3B2w=kTRw_AFLzVgDF-Q@mail.gmail.com>
In-Reply-To: <CAE-0n52CHwYAEwAC0Hthgbamjj2x4K3B2w=kTRw_AFLzVgDF-Q@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 15 Dec 2021 22:16:29 +0300
Message-ID: <CAA8EJppKGGWDkLXqccG_rPnkaYs5GhEN992Kq0nJ87t-zj4LeQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Don't use autosuspend for display
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Rajeev Nandan <quic_rajeevny@quicinc.com>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 15 Dec 2021 at 22:10, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Rob Clark (2021-12-15 09:59:02)
> > From: Rob Clark <robdclark@chromium.org>
> >
> > No functional change, as we only actually enable autosuspend for the GPU
> > device.  But lets not encourage thinking that autosuspend is a good idea
> > for anything display related.
>
> I'd prefer to see a small blurb about why it's not a good idea to use
> autosuspend for display things. Then this commit can be dug out of the
> history and someone new can quickly understand the reasoning behind it.
> Just saying it's not a good idea doesn't really help.

I'd second this request, Nevertheless
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>



-- 
With best wishes
Dmitry
