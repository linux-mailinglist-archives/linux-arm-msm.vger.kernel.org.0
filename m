Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F56416359A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2020 22:58:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726482AbgBRV6x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Feb 2020 16:58:53 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:41403 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726449AbgBRV6x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Feb 2020 16:58:53 -0500
Received: by mail-lf1-f67.google.com with SMTP id m30so15675244lfp.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Feb 2020 13:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=anholt-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ahpk/GappiCcM5wW00z5eRTm7XSNbwAT9p1AedeyQaE=;
        b=kdpjP80seFPRBqxhxIpalWncJhJycuWAQPQT0uf/BhAioMxpA/HQSrB4FFdQP+vo/L
         KzZMVoRXpw4PUTQavb0o6cZHHaGKHSVcOUgix+7f/NfUfAl9aCz7L0/IbtVECP3Hmx5k
         uQFJiRqinUNrrBdMEj/yIhEp3RBT2Uxd72BlqR4nMUwzHAyMKM7YPchqExAMmNWGqoBi
         Ph19zMTGlFHeCAUda62180ibnNyy2wl7eOxbVuLhU6Jsy9cLpevU3SYjCp9Zrk7UP43A
         VMce/XyzyXhUBuaWX2tdTaeUxZdF5O1Zs8APWnkdHzTNx1e2XTvdK45WjNKQLPXeMS0F
         1T4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ahpk/GappiCcM5wW00z5eRTm7XSNbwAT9p1AedeyQaE=;
        b=uB9eTdMMW4dV66qrAWbrPsGWImLT56SwJf036m1VvhnLMqE5tLzBZDVUHefEk66LJ2
         d1gRAi4QfUroFzxKqWR4DOhpxwtY+cfAM9di6paHiXcGvx3eAo/OeYnft8Xc+fgpuUW0
         thvoB4zvc0H1dg/QCnGThtgjJdrD9Ij/26HgV2tYcn+/G4ii7CyfzYJ6IC9wbcR+JrXd
         VMAuQomxTY32ha8Gl5GMa966IFCz7pd4hgOplCOH+tUDfMQwfNX8urd5G7WsFYZfJ+eD
         1K5Cuk/68shOP5c/VHR3Y3Vl+0w7CI261KUROLNcLgTmQu/3iubOEI3usccfuJ5UuF3G
         dK6Q==
X-Gm-Message-State: APjAAAVp//QWZEcVca6hGxx/wR0+p6AsJ68B6QUWfbQYjFGeX0ZrrzlD
        +iR8HTSJY7s49yhTbeghoS1Gy7kiZx/cOho209pj/Q==
X-Google-Smtp-Source: APXvYqwfJ/KjDHUqMyRYTcya4wxUGjDyhjQGBQJimj1/3xX/vD0XeMTB9CXlS07iJHjcgr5dOlc5NuiOgM8QWSquNew=
X-Received: by 2002:ac2:4214:: with SMTP id y20mr11460778lfh.212.1582063131075;
 Tue, 18 Feb 2020 13:58:51 -0800 (PST)
MIME-Version: 1.0
References: <1581705404-5124-1-git-send-email-jcrouse@codeaurora.org>
In-Reply-To: <1581705404-5124-1-git-send-email-jcrouse@codeaurora.org>
From:   Eric Anholt <eric@anholt.net>
Date:   Tue, 18 Feb 2020 13:58:39 -0800
Message-ID: <CADaigPXdn84cR0Pu-uLnCwOVHNUiOi_t6u7OYYDU6tkSvdWp6A@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a5xx: Always set an OPP supported hardware value
To:     Jordan Crouse <jcrouse@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, David Airlie <airlied@linux.ie>,
        Sean Paul <sean@poorly.run>, Wen Yang <wen.yang99@zte.com.cn>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        linux-kernel@vger.kernel.org,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        freedreno@lists.freedesktop.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Feb 14, 2020 at 10:36 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> If the opp table specifies opp-supported-hw as a property but the driver
> has not set a supported hardware value the OPP subsystem will reject
> all the table entries.
>
> Set a "default" value that will match the default table entries but not
> conflict with any possible real bin values. Also fix a small memory leak
> and free the buffer allocated by nvmem_cell_read().
>
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>

This does fix my warn at boot on db820c.

Reviewed-by: Eric Anholt <eric@anholt.net>
