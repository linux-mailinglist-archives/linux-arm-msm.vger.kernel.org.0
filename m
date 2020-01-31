Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E61814F4E8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2020 23:38:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726225AbgAaWia (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Jan 2020 17:38:30 -0500
Received: from mail-vs1-f66.google.com ([209.85.217.66]:42065 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726246AbgAaWi3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Jan 2020 17:38:29 -0500
Received: by mail-vs1-f66.google.com with SMTP id b79so5389594vsd.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jan 2020 14:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A/QwXMv8QAmipbLMot4MaxUhNNvwb0UK1sNHG1c0AVY=;
        b=n+bPBIjWQxxmXcyNtF2EyFmopFozDQdpVp68Vj3mgGrFckg86ApNTNEWR0uFO0/7DG
         vyaxvdDQ9kAE++SLmKRA5v1t6u/ZjszK4NJAbdXgkmSgqli8p4OjpqQKtuJ6Scaf7brq
         ZmpnT/9SmPlPX8EFH7dJW+bzBbfm/BGo+QXbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A/QwXMv8QAmipbLMot4MaxUhNNvwb0UK1sNHG1c0AVY=;
        b=M9HwJ5qwnNmT6Z7YSpiwQKsXaJH3Kdgq/yx45atHrBowiExKCFdqz5p7rSzvpfwzt7
         Za4Sevok4tlKQ/FuZ6Iu1v8esulI7OupIliY3NYQgAnlxQNIuSWApQunqUz+IiyGbWWm
         OkMJxsQ9LBDHIW/c0B2FMrdSxBGoAwN4ySeb4bfuceckit0tsJc6bc5zyVQgCh749l4E
         8RXux3+qyhLwyzZ1G4hPGTMbPdW5BDSUg8TcCZbz3d79j/FKITIjtg/xZGgX+CHu5rJc
         nhRTdKE2REggBIAK601QcaEoBQadD7UCmxCNcJVCF3L3Q0xkOEBNJWWk3+VwAXu/yljU
         g/hA==
X-Gm-Message-State: APjAAAUjw+xacdILvBscrbq3gR/twiijj3EaAUkUeO7/iQPyi++eQRON
        3aDDavnStoML4pab3WWUh3ZJMveq9iQ=
X-Google-Smtp-Source: APXvYqyUyw1z7Nsyp3IfPh0n0vcF4km3YQay8qXWKEXIA+nRF3m8BdrYRol0unySv3trAizFSo08xA==
X-Received: by 2002:a67:c90d:: with SMTP id w13mr8031476vsk.164.1580510307861;
        Fri, 31 Jan 2020 14:38:27 -0800 (PST)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id o16sm2643657vsa.3.2020.01.31.14.38.25
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2020 14:38:26 -0800 (PST)
Received: by mail-vk1-f174.google.com with SMTP id t129so2541537vkg.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jan 2020 14:38:25 -0800 (PST)
X-Received: by 2002:a1f:a9d0:: with SMTP id s199mr7858217vke.40.1580510305500;
 Fri, 31 Jan 2020 14:38:25 -0800 (PST)
MIME-Version: 1.0
References: <1579774675-20235-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1579774675-20235-1-git-send-email-kalyan_t@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 31 Jan 2020 14:38:14 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XnS893yXNcm6RKV_3Do5b8hR2=nj=Y03Ymw7fbU+Zwng@mail.gmail.com>
Message-ID: <CAD=FV=XnS893yXNcm6RKV_3Do5b8hR2=nj=Y03Ymw7fbU+Zwng@mail.gmail.com>
Subject: Re: [PATCH] msm:disp:dpu1: add UBWC support for display on SC7180
To:     Kalyan Thota <kalyan_t@codeaurora.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Harigovindan P <harigovi@codeaurora.org>,
        travitej@codeaurora.org, nganji@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Jan 23, 2020 at 2:19 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
>
> Add UBWC global configuration for display on
> SC7180 target.
>
> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c | 58 +++++++++++++++++++++++++++++++-
>  1 file changed, 57 insertions(+), 1 deletion(-)

I didn't do any sort of review of this patch, but I can say that
without it the screen on my sc7180-based device is super glitchy and
when I add this patch in the glitchies are gone.  Thus:

Tested-by: Douglas Anderson <dianders@chromium.org>

...one note is that the subject of this patch seems a bit
non-standard.  I would have expected a tag more like "drm/msm/dpu:"
instead of "msm:disp:dpu1:".  Presumably if the maintainer cares when
landing he/she could fix that up, but something to think about for
future patches.

-Doug
