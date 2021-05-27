Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 429A1393906
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 May 2021 01:14:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236423AbhE0XQG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 May 2021 19:16:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235031AbhE0XQG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 May 2021 19:16:06 -0400
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7B3BC061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 May 2021 16:14:31 -0700 (PDT)
Received: by mail-qv1-xf34.google.com with SMTP id 5so1052271qvk.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 May 2021 16:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XUv/H2tSnyEpa0je+9CNljGuyS/P4gW1vHKFaYDtrQ4=;
        b=ChVZOb7exsfcVgpIA48kpnMbJAqreH3Kr6NAAbL2WgkKUno/5lrDjOfss9Eox06/W7
         LM87HKJfFVcDtuZwpowGUsyjjZhnTpZEDp44jB8tdAJt25wDjckkAG8bZnG0fZs9HpaA
         BSTdfbWDFTdH+8lb8BDAXE8xF1696WkGaCu90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XUv/H2tSnyEpa0je+9CNljGuyS/P4gW1vHKFaYDtrQ4=;
        b=ALK1nDRjzL2nnO234gm0yiKTByyiLj5pe2JYta+XM+5+XbYUe2ERN+z1umLn99fAtD
         j3qCl/W6K16ueUO0BH+BRO2J8yK4sCMxzSh8SEKyXWRlemCH7v5VQMnqfChKttbD9DJE
         GAvi2SMSzWkkCihKX/p+JbkwEN297Cl0l35EDNSFlpG/rl3AMIP5CzDZdJr3eLfgpXvz
         xMO3yQ2Bz6yb4COaIo7Be2miZZUcw9uKFYHfvAeo/vO0jQhiQdXZO3m0FAZm0zn6YcI0
         M4KebWrTkr6X+2tK9qRQVxPgTqnKA1fPRyNgKmrxL6+QZtaC6lzwdiR6pURH5VjWiQzk
         MYIg==
X-Gm-Message-State: AOAM531BYPLyE1i68RwllfxIpuCBYy0o61ZqtOy15W5e3pVLcKVJvvbb
        X59a4bwMoe39LmrpRrYoPPlsdjYe9/Et8g==
X-Google-Smtp-Source: ABdhPJy+o8WMkaBm7iECM26jgspSOLdRzic/XZbmt5/8wDntLpaTlPzxLLDAyrl5Z2CnI0XF9pWXqg==
X-Received: by 2002:a05:6214:b0b:: with SMTP id u11mr1041365qvj.9.1622157270470;
        Thu, 27 May 2021 16:14:30 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id b4sm2304519qti.43.2021.05.27.16.14.29
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 May 2021 16:14:29 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id i4so3022386ybe.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 May 2021 16:14:29 -0700 (PDT)
X-Received: by 2002:a25:b801:: with SMTP id v1mr9231563ybj.32.1622157269138;
 Thu, 27 May 2021 16:14:29 -0700 (PDT)
MIME-Version: 1.0
References: <1622092076-5100-1-git-send-email-mkrishn@codeaurora.org>
In-Reply-To: <1622092076-5100-1-git-send-email-mkrishn@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 27 May 2021 16:14:17 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UQzM=cEsEYbR4QwaovT377dn4vLxqcK7xrLMutZPVDeQ@mail.gmail.com>
Message-ID: <CAD=FV=UQzM=cEsEYbR4QwaovT377dn4vLxqcK7xrLMutZPVDeQ@mail.gmail.com>
Subject: Re: [v1] drm/msm/disp/dpu1: avoid perf update in frame done event
To:     Krishna Manikandan <mkrishn@codeaurora.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, May 26, 2021 at 10:08 PM Krishna Manikandan
<mkrishn@codeaurora.org> wrote:
>
> Crtc perf update from frame event work can result in
> wrong bandwidth and clock update from dpu if the work
> is scheduled after the swap state has happened.
>
> Avoid such issues by moving perf update to complete
> commit once the frame is accepted by the hardware.
>
> Fixes: a29c8c024165 ("drm/msm/disp/dpu1: fix display underruns during modeset")
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

I don't know much about this code or any of the theory behind it, but
I can confirm that this fixes the hang I was seeing with the previous
patch. On sc7180-trogdor-lazor:

Tested-by: Douglas Anderson <dianders@chromium.org>
