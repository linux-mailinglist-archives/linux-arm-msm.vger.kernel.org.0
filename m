Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B6B315139E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2020 01:22:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726474AbgBDAWM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Feb 2020 19:22:12 -0500
Received: from mail-ua1-f65.google.com ([209.85.222.65]:46159 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727044AbgBDAWL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Feb 2020 19:22:11 -0500
Received: by mail-ua1-f65.google.com with SMTP id l6so6061396uap.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2020 16:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6JzKdfECxoshT8PyZexTPl31WOYvekoaoJj1TOgyVRs=;
        b=VkXItU6SO3y2jWpMgCyH42sXvEkyaTeh7YrrJfXF10BOcoXkCJ07Xp/sSFGgoieUEN
         +V5ilf5JGQ2XKWjmGM25z+sABorUTNDDAdbRINCgG1mOjZ8gzmi8zvvFPMBq73lJfdmx
         XeN3dmpIlgZJwRgq3xz1Ifi9Gfj4iWJZ4xreI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6JzKdfECxoshT8PyZexTPl31WOYvekoaoJj1TOgyVRs=;
        b=YQs9RR2lFKQGMTz3IqZZ7ZEDOyIDmvhxXk8iK59rtGHEDR8iTeuMuKgL0Nbrtgflww
         yXB5djyTRMb/6MIk3l6SKsSyxrbC706d/2bipGkcMRLtm5mw6Dcd02JA1u9QSdAZ7kV2
         VGnZMdYmtA97KDnzYlwZ2EaVuXIqnDFgc/tpliSkmgnMcBdV1FazpXiouvk3Tpek+Wgs
         OAxy24kR94XlDbEtiylIvlkhNLAR1AtGWe/Po6s9FzrmCHm8HtPm+V3QTWK2qvjhMsib
         SJgnSDffKvJqTmmwzUTOIvVKPQuRWE7iyn+J90zWj8+zxKBqh7uh6XY/lRHXRYXTOEpE
         3Apg==
X-Gm-Message-State: APjAAAUgIla42eiOGn8Z2PWTdeElhIyChIdfeKl59jnRUbOd00+46QBJ
        d/huk3wqGlIQRxND3YjZvTjGjZ7R9rM=
X-Google-Smtp-Source: APXvYqzAMMESgerDIPuuobDgMMq5T82MGdyE0moZfG1Dr85KiFOwlIPHvZYOhvqrx4eYYIPzFyP4Jw==
X-Received: by 2002:ab0:7651:: with SMTP id s17mr11116483uaq.29.1580775730358;
        Mon, 03 Feb 2020 16:22:10 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id p4sm5784819vsg.10.2020.02.03.16.22.09
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2020 16:22:09 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id r18so10236074vso.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2020 16:22:09 -0800 (PST)
X-Received: by 2002:a67:fbcb:: with SMTP id o11mr16294171vsr.109.1580775728583;
 Mon, 03 Feb 2020 16:22:08 -0800 (PST)
MIME-Version: 1.0
References: <20191218223530.253106-1-dianders@chromium.org>
 <20191218143416.v3.6.Iaf8d698f4e5253d658ae283d2fd07268076a7c27@changeid> <20200203233711.GF311651@builder>
In-Reply-To: <20200203233711.GF311651@builder>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 3 Feb 2020 16:21:53 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VTKfv93BiNRYBxWg8o8YKrQy3Z85MzR8XFr=GCS5xhdg@mail.gmail.com>
Message-ID: <CAD=FV=VTKfv93BiNRYBxWg8o8YKrQy3Z85MzR8XFr=GCS5xhdg@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] drm/bridge: ti-sn65dsi86: Use 18-bit DP if we can
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Cc:     Rob Clark <robdclark@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sean Paul <seanpaul@chromium.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        LKML <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        David Airlie <airlied@linux.ie>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Andrzej / Neil,

On Mon, Feb 3, 2020 at 3:37 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Wed 18 Dec 14:35 PST 2019, Douglas Anderson wrote:
>
> > The current bridge driver always forced us to use 24 bits per pixel
> > over the DP link.  This is a waste if you are hooked up to a panel
> > that only supports 6 bits per color or fewer, since in that case you
> > ran run at 18 bits per pixel and thus end up at a lower DP clock rate.
>
> s/ran/can/

I'm going to make the assumption that you can fix this typo when
applying the patch and I'm not planning to send a v4.  If that's not a
good assumption then please yell.

Thanks!

-Doug
