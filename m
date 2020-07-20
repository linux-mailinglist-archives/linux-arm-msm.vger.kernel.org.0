Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5D442262BB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jul 2020 17:03:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726046AbgGTPDb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jul 2020 11:03:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725934AbgGTPDa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jul 2020 11:03:30 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3934C061794;
        Mon, 20 Jul 2020 08:03:30 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id k23so17893507iom.10;
        Mon, 20 Jul 2020 08:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pcfxvqUoA5Q84iZVIjEC8f/UAFuiPguvgTdlO6gr+z8=;
        b=LhPnnGZz+comE1cgyo/Ade5S1kE4zEhoPaaFmdVrbq0kxfF79/KbgosYjWd3jhGj6z
         PZ864OAiQJyZ8WPWu6phfbFiY0PR+batdntkmBkfGuUeF74RfofIncSfeHpmTOePF1pk
         Ui72NQbpRw423r3rcUPqaiB/ILqEoJezxU+i2HJrkDVxCMHcaCT2tK0OwO7SS2KWX0dI
         0NaiTW6dGdv3Ns2/bPxEVvBTpatUK2feYLsXNNkX3CxHcyhzEaXKMpxvhWxbF2avLfGW
         rKAvuWuQy6krRYFHtP+y+ytu/TgFRuu8J0nceHE6k6yko8K9n5dtO1b6ghj3Q0EYWq68
         rR2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pcfxvqUoA5Q84iZVIjEC8f/UAFuiPguvgTdlO6gr+z8=;
        b=EUqb2uaQh6VGIkhtoaD1nBum/8JCW0WDJB5pBNmvFWpgl8o65jFLreW6Zbcf3tK3pA
         NHX/HYP7BCpvc6FfNIFp9uzRM9ak2SSswVONLvNTip4I+U5w618jYQJk5V4vHEInaAkz
         MK7n96jXC0KIuXSpNt3KPAHOADWyepS8DNbsKFpOIkd2hn3koskB2W+UNhJRt1pGU26A
         x3xGQclC1njiWgmVyHVg1VjTWnlY+P8bwxu0TGjrNoXvZcJoCQ7F7Kd47KpBr9YkUqfN
         WBci8AlRp0WMFTotD6H/USLza2K0nuLeLL3SOsvU6SQ4vUU28qfX4Sh2hhfMSE3qrzTO
         W1AQ==
X-Gm-Message-State: AOAM5301BzOZ30p0/h5jgcTsaQepuQ9jAm9mwSJplhlDaEOy9BunMz47
        C6026salnyo/Av+yWRBBdAFgYL/YvcSHJJkxYntXnD9k
X-Google-Smtp-Source: ABdhPJzIbmtiIdLPMhyi/GvPa8hA5p1L8XEl7Yhw3/V97KBA7XMRywAMZ5AtZBSscwPbiDM0aPGhETkFHsZErsQ6ju8=
X-Received: by 2002:a5d:8d12:: with SMTP id p18mr23344299ioj.148.1595257409980;
 Mon, 20 Jul 2020 08:03:29 -0700 (PDT)
MIME-Version: 1.0
References: <1594644106-22449-1-git-send-email-akhilpo@codeaurora.org>
 <CAF6AEGtAEwZbWxLb4MxaWNswvtrFbLK+N0Fez2XYr7odKZffWA@mail.gmail.com> <20200720100131.6ux4zumbwqpa42ye@vireshk-mac-ubuntu>
In-Reply-To: <20200720100131.6ux4zumbwqpa42ye@vireshk-mac-ubuntu>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 20 Jul 2020 08:03:32 -0700
Message-ID: <CAF6AEGurrsd3nrbB=ktZjWfKTNbKwPHYwTFiZdD-NOW1T7gePQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] Add support for GPU DDR BW scaling
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Akhil P Oommen <akhilpo@codeaurora.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        dri-devel@freedesktop.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Matthias Kaehlcke <mka@chromium.org>,
        saravanak@google.com, Sibi Sankar <sibis@codeaurora.org>,
        Jonathan <jonathan@marek.ca>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 20, 2020 at 3:01 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 15-07-20, 08:36, Rob Clark wrote:
> > I can take the first two into msm-next, the 3rd will need to wait
> > until dev_pm_opp_set_bw() lands
>
> You can base that on a8351c12c6c7 in linux-next, I will make sure not to rebase
> it anymore.
>

I can't really base on something newer than drm-next

BR,
-R
