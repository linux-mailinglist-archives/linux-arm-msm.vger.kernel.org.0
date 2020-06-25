Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A28A20A82D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2020 00:21:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404546AbgFYWVd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jun 2020 18:21:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404242AbgFYWVa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jun 2020 18:21:30 -0400
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EC40C08C5DB
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2020 15:21:30 -0700 (PDT)
Received: by mail-vs1-xe32.google.com with SMTP id m25so4458184vsp.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2020 15:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HiC4BtBcvypNi0TT+uKmaMyQomfNIooMQQ9SMeSvJuE=;
        b=hQeh5IvCT9+c5THqtc6WWb2AHU0aYgWF5ReZ+qFjCCpfIqgW19aaZnB90R90eRy0XI
         aqqBosgZeXnP5zp2JACRzpjqBvLLkUVWfrSy6pNESy7bXlN8NAGyTcPtiDfqcYQkAXxh
         Dtax+BMxyCZeltX5LaizJxMHd1OeZVgKaCSgM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HiC4BtBcvypNi0TT+uKmaMyQomfNIooMQQ9SMeSvJuE=;
        b=Y9mompEfL/VAHu+67MmncIsMXubNP3EWxA1FaVibI0s6TJP9DbgrQtR2rK1HdQXpcY
         Cc85zy/LsKwkd/lzzXb9pRaN+jtNbY2Xffor77zuOhrlIkYTT8KrOvxXDEvBOW35CGIZ
         I409olFsSpLoRkw6ccVCyhFQhzBA/SlpFbgYgfUKE2eBLSJIdTSlPEAz5aRp0e7jLH7p
         UAZXTXW0tgXEeXRjBn/c5dSWhXcjWpoXc+6EDVouMSnpyOOo+k3fo2XzwuRmFIZkKqKT
         IKflSG+tbTE/gFPqyWACibuJaoPmU5RtjWv43m9bguvXACk5Xs1QFKzphL09yEId7xh6
         6ydw==
X-Gm-Message-State: AOAM531fAstQs3w8338A5wcfyuZyxI9OIDfgRBxjdDdN48bU/X1MrPgh
        IWc/oLHwW6LpVJhim6JRp2NOWRHXb14=
X-Google-Smtp-Source: ABdhPJzLUxBqyvXf9Ku2vloYMYXZH0Q9lEHqOQpOE43OBKhGJH/9Rg4u+P2Q8M+zh2Z+lS3WYYVJDg==
X-Received: by 2002:a67:2605:: with SMTP id m5mr350695vsm.69.1593123689272;
        Thu, 25 Jun 2020 15:21:29 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id z201sm289375vsz.22.2020.06.25.15.21.27
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2020 15:21:27 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id k7so3109065vso.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2020 15:21:27 -0700 (PDT)
X-Received: by 2002:a05:6102:20c8:: with SMTP id i8mr347826vsr.106.1593123686688;
 Thu, 25 Jun 2020 15:21:26 -0700 (PDT)
MIME-Version: 1.0
References: <1593087419-903-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1593087419-903-1-git-send-email-kalyan_t@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 25 Jun 2020 15:21:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VXAQagbM-dn7MWGm08DdBxefc4jHNbkvHzuBjSM_jWnw@mail.gmail.com>
Message-ID: <CAD=FV=VXAQagbM-dn7MWGm08DdBxefc4jHNbkvHzuBjSM_jWnw@mail.gmail.com>
Subject: Re: [v2] drm/msm/dpu: add support for dither block in display
To:     Kalyan Thota <kalyan_t@codeaurora.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        mkrishn@codeaurora.org, travitej@codeaurora.org,
        nganji@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Jun 25, 2020 at 5:17 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
>
> This change enables dither block for primary interface
> in display.
>
> Enabled for 6bpc in the current version.
>
> Changes in v1:
>  - Remove redundant error checks (Rob).
>
> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c     | 39 +++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c | 63 +++++++++++++++++++++----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h | 28 +++++++++++
>  3 files changed, 121 insertions(+), 9 deletions(-)

Tested-by: Douglas Anderson <dianders@chromium.org>
