Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36253EF1DA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2019 01:19:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387440AbfKEATU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Nov 2019 19:19:20 -0500
Received: from mail-ed1-f49.google.com ([209.85.208.49]:46655 "EHLO
        mail-ed1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387435AbfKEATT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Nov 2019 19:19:19 -0500
Received: by mail-ed1-f49.google.com with SMTP id x11so4576734eds.13;
        Mon, 04 Nov 2019 16:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bPI3xRQSihbuAop68QULfROzLi2EqQlmJiEdDSx7yKE=;
        b=gXZl+zKzALBpq+fDhPXT21QE8iwzlELC/ZV+jVycXbP2eTy3Uwu9Cl3W7EKqz9kL72
         YUWbOyXIruonjwN/tA2FbXO4O4iTbnWLeeyj+9/WVfHDaQkkoLOadJFaLuRnHSxQXFaR
         jLG6VbxTh7Uc5dbQA9qs2YcOtqg1h4fPLHgg+5uAHe+t2WNBW6cyaEzvneiH5mqw+pmp
         ditee/TqiVtr16jPDzKVLW+eQEFv9i3j1ukyHUKu/w8hW3R9ygtcLrLM1gm9aps7Nbg/
         Xju7iGRjtuXhln40aqbLE71aZBeZYkQ4+h2IxGaqHYzSUfbpUJieafDv/Tcg7EJcdcRO
         GKKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bPI3xRQSihbuAop68QULfROzLi2EqQlmJiEdDSx7yKE=;
        b=g/4dMemtYDXax5JeAzhk3L1P62uBNML2hhUX2Nx/x9lsg7ecC0Vsvgkzamwe+L9UFD
         gdz7Z0c++wDjx9HJMT5Zz2v2sHFflfJPQlXzcllwm4gCEP0fMf5aOcFmuWkY+xYQ9wKn
         KqFM54mD16mYxH6wqOiHpYwNz1dpoiFRncnJbVraAtlVjDBNhMBSHvW8/KJhX5/PQFsc
         x3nCF+A6Gb4anR8N4JLJ6O0NWEU+pfbeLWmK8o2Efkqy1YkolrhkxQO9R12VyBPty2ZG
         FwBXFHN5ZTm9seyI3PzpRci1z3imE/W1TBRsctiy7HufYv/8UP/4ai6gtk4Tz2vsx6MW
         xv2A==
X-Gm-Message-State: APjAAAULMwoaieUEK4PMakbPpTI/h5Wp2p85prsna18VG2uHnPN97oHr
        CPA2R0pXdFJgYap+9a6AwsUaSuVMohxWoDlekbU=
X-Google-Smtp-Source: APXvYqy0DLKlSOyi6a3ePnMUiv4rqcXhQw7mqHXXcfvNI578kX1CkWDeon4zEoAY8/o1xG3l5IN+7seHEEwOZvA/oFA=
X-Received: by 2002:a17:906:594f:: with SMTP id g15mr11991768ejr.197.1572913157903;
 Mon, 04 Nov 2019 16:19:17 -0800 (PST)
MIME-Version: 1.0
References: <20191105000129.GA6536@onstation.org>
In-Reply-To: <20191105000129.GA6536@onstation.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 4 Nov 2019 16:19:07 -0800
Message-ID: <CAF6AEGv3gs+LFOP3AGthXd4niFb_XYOuwLfEa2G9eb27b1wMMA@mail.gmail.com>
Subject: Re: [Freedreno] drm/msm: 'pp done time out' errors after async commit changes
To:     Brian Masney <masneyb@onstation.org>
Cc:     Rob Clark <robdclark@chromium.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 4, 2019 at 4:01 PM Brian Masney <masneyb@onstation.org> wrote:
>
> Hey Rob,
>
> Since commit 2d99ced787e3 ("drm/msm: async commit support"), the frame
> buffer console on my Nexus 5 began throwing these errors:
>
> msm fd900000.mdss: pp done time out, lm=0
>
> The display still works.
>
> I see that mdp5_flush_commit() was introduced in commit 9f6b65642bd2
> ("drm/msm: add kms->flush_commit()") with a TODO comment and the commit
> description mentions flushing registers. I assume that this is the
> proper fix. If so, can you point me to where these registers are
> defined and I can work on the mdp5 implementation.

See mdp5_ctl_commit(), which writes the CTL_FLUSH registers.. the idea
would be to defer writing CTL_FLUSH[ctl_id] = flush_mask until
kms->flush() (which happens from a timer shortly before vblank).

But I think the async flush case should not come up with fbcon?  It
was really added to cope with hwcursor updates (and userspace that
assumes it can do an unlimited # of cursor updates per frame).. the
intention was that nothing should change in the sequence for mdp5 (but
I guess that was not the case).

BR,
-R
