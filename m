Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 320C038C7AC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 May 2021 15:19:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233060AbhEUNUW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 May 2021 09:20:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:42950 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230391AbhEUNUV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 May 2021 09:20:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2E1A8613EB;
        Fri, 21 May 2021 13:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621603138;
        bh=kML0VNwTPmuZzhjwUe6WlLUM6s2hR7O8GQYI8nIVEx4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=bxlk4rI+nT2n2MilrkZEOxmGPpUtz5EM4hIvKviME1p5OqepyQ5kkp+CvAwVT5cAj
         Ku9puQxIF9brbZ5vJTXmOPmc3eAwU0Um6HuXrJQIMfWiSc0ENOiFOrE3eTi/hekg+7
         byFXoB0KFQyw6TBddhpvCkFbpkZKU5CDjw4wQqVDDNMZI0IgQa1p7I/zwm4I1+QOYm
         fq6i3qeZ4iMVGg+ZO1rpctE0+23FuTODinw/xTnV6LYtInrTs+HAGt5/zcrKdOQR/D
         CqrWl9I1AKZ8JmjwzmXemkdMkVGfzT6ZWZUK1eqlmPNS7llAIuoX3WxG3KGaEhANj6
         9UtXFKw7LR4Uw==
Received: by mail-ed1-f52.google.com with SMTP id r11so23232182edt.13;
        Fri, 21 May 2021 06:18:58 -0700 (PDT)
X-Gm-Message-State: AOAM531rN32SHrDDQdtzFyrgC08KvuwOnUMNnuk35Enddj7Jf72bsrKa
        4AFwNIzlsxX+8ivcddzkgfkLYJMkJiWd08P5eA==
X-Google-Smtp-Source: ABdhPJwmzwbCzIeEFfbyH8umGA8C0KXX6vUz4OS2ROZ9YiW5j/tCvUb0NLoSYwTa9fxOPM6+xMux6sI6PbKiUDMEH5I=
X-Received: by 2002:a50:c446:: with SMTP id w6mr11114280edf.62.1621603136815;
 Fri, 21 May 2021 06:18:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210521124946.3617862-1-vkoul@kernel.org> <20210521124946.3617862-3-vkoul@kernel.org>
In-Reply-To: <20210521124946.3617862-3-vkoul@kernel.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 21 May 2021 08:18:44 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJqPwkzxVgAfS9VgEXcY=ZH5LOaaxzoPDBzuDxOZ_OLjw@mail.gmail.com>
Message-ID: <CAL_JsqJqPwkzxVgAfS9VgEXcY=ZH5LOaaxzoPDBzuDxOZ_OLjw@mail.gmail.com>
Subject: Re: [RFC PATCH 02/13] dt-bindings: msm/dsi: Document Display Stream
 Compression (DSC) parameters
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 21, 2021 at 7:50 AM Vinod Koul <vkoul@kernel.org> wrote:
>
> DSC enables streams to be compressed before we send to panel. This
> requires DSC enabled encoder and a panel to be present. So we add this
> information in board DTS and find if DSC can be enabled and the
> parameters required to configure DSC are added to binding document along
> with example
>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  .../devicetree/bindings/display/msm/dsi.txt       | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)

This is getting converted to schema. Hopefully, v17 will be it. Sigh.

Rob
