Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB33D14487
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 May 2019 08:42:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725840AbfEFGmt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 May 2019 02:42:49 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:47085 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725851AbfEFGmt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 May 2019 02:42:49 -0400
Received: by mail-lj1-f194.google.com with SMTP id h21so10008690ljk.13
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 May 2019 23:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kczJA0awqdoA0ORNL2OLUesgvZQuju/puNenMWJZnJs=;
        b=hBHK5Dj/+/9RsrxgVMPxDHF5voi9VNs/bZnK1MrhfA5lRcvYi8EcaPEpzJJoRFgcWH
         FQJflnlMcwe2e3kkppMG1fo6drZtZRQbBnksEnmbh8gH5QOEXbW3b7XQQtbYxwgxhnp9
         Rce783IBgTTRdV/F6GubWOA84+TIGZ7/FsRSHGJGDfg+xZwAFPIr/eU11xaaQkKSowP1
         Vu5qbCwMJFJgVAb0efR3AzhWlvTxfwe7CNjYhJdNu0MRABXOI0ogu2gYN1ZHd47DXKFV
         wid9EQsKj70NWtlibFyZO0c3pO813bWgyW++V7EGfh6TrgVPItwvH25k9VonTp6uzApT
         6sVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kczJA0awqdoA0ORNL2OLUesgvZQuju/puNenMWJZnJs=;
        b=en5cbsj6WQqTG3hF6DwQTcbmARDCu6q8iufVuajJkm9NMQnhkzUPvcFmCqNs/Umm3W
         cfF9l1fP39GbRt6nxW5z5VSwHrJhcZIvUOGm8Djgh9tsQyocxltgNa3k2F/zhn2xPf7L
         QTGpCwYlzqDbDl3ACn4O1n7UjEKjT0qaPl7kjy2Eesj6bIIjEBBw2tAObWk/tz/iWyo1
         GUEQTU/Ct2hi72jQ7eiuBBZP8PgEsoDdNvU1zepJZkQ9Y13kW5GH9lTdW7J1g9PongHp
         oPm8wXeJkTF3AjANd/6W9tEAxM8TcVKEUHgIAw4N4ScRHolh4DSSBRJOUVMeAXaCHbx0
         BhvA==
X-Gm-Message-State: APjAAAX3WSVbJShKikIw5dj1bybSFvsFgjV3DNnpoABH6rGndrJKhdig
        Wv5syPFzRcxu3aoL5N3gZlBM5vRkz6JVXRu0KXlPfg==
X-Google-Smtp-Source: APXvYqzECzkqvuxznKULj5aWJNaUw2MEkVcg4fgbtysnQxn5pELNdiFkFl5c+9+UvZ55+uPDQ5wZRCiIcbF2LmUHVLU=
X-Received: by 2002:a2e:988e:: with SMTP id b14mr12222773ljj.126.1557124967799;
 Sun, 05 May 2019 23:42:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190505130413.32253-1-masneyb@onstation.org>
In-Reply-To: <20190505130413.32253-1-masneyb@onstation.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 6 May 2019 08:42:36 +0200
Message-ID: <CACRpkda=JTfKC4z=1Gmt1BE5adwd8XGZ4ERTgapWX_BN9TFESw@mail.gmail.com>
Subject: Re: [PATCH RFC 0/6] ARM: qcom: initial Nexus 5 display support
To:     Brian Masney <masneyb@onstation.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        freedreno@lists.freedesktop.org, Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, May 5, 2019 at 3:04 PM Brian Masney <masneyb@onstation.org> wrote:

> mdp5_get_scanoutpos() and mdp5_get_vblank_counter() both return 0, which
> is causing this stack trace to be dumped into the system log several
> times:
>
>     WARNING: CPU: 0 PID: 5 at drivers/gpu/drm/drm_atomic_helper.c:1430 drm_atomic_helper_wait_for_vblanks.part.1+0x288/0x290
>     [CRTC:49:crtc-0] vblank wait timed out
>     Modules linked in:
>     CPU: 0 PID: 5 Comm: kworker/0:0 Not tainted 5.1.0-rc6-next-20190426-00006-g35c0d32a96e1-dirty #191
>     Hardware name: Generic DT based system
>     Workqueue: events deferred_probe_work_func
>     [<c031229c>] (unwind_backtrace) from [<c030d5ac>] (show_stack+0x10/0x14)
>     [<c030d5ac>] (show_stack) from [<c0ac134c>] (dump_stack+0x78/0x8c)
>     [<c0ac134c>] (dump_stack) from [<c0321660>] (__warn.part.3+0xb8/0xd4)
>     [<c0321660>] (__warn.part.3) from [<c03216e0>] (warn_slowpath_fmt+0x64/0x88)
>     [<c03216e0>] (warn_slowpath_fmt) from [<c0761a0c>] (drm_atomic_helper_wait_for_vblanks.part.1+0x288/0x290)
>     [<c0761a0c>] (drm_atomic_helper_wait_for_vblanks.part.1) from [<c07b0a98>] (mdp5_complete_commit+0x14/0x40)
>     [<c07b0a98>] (mdp5_complete_commit) from [<c07ddb80>] (msm_atomic_commit_tail+0xa8/0x140)
>     [<c07ddb80>] (msm_atomic_commit_tail) from [<c0763304>] (commit_tail+0x40/0x6c)
>     [<c07633f4>] (drm_atomic_helper_commit) from [<c07667f0>] (restore_fbdev_mode_atomic+0x168/0x1d4)

I recently merged this patch:
https://cgit.freedesktop.org/drm/drm-misc/commit/?id=b3198c38f02d54a5e964258a2180d502abe6eaf0

I noticed that DSI is sometimes way slower than a monitor, even  in HS mode.
On the MCDE this happened on the first screen update, which was slower
than 50ms.

Check if your vblanks are simply slow, try bumping this timeout even higher,
I spent weeks finding this issue which boils down to an assumption that
the vblank will be fired from something like a monitor at 50 or 60 HZ
~20 ms so 50ms seemed like a good timeout at the time.

On a DSI display this is dubious, absolutely in LP mode, and even
in HS mode.

Yours,
Linus Walleij
