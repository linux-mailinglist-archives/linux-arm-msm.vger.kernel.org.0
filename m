Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA65922F9A9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jul 2020 21:58:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729130AbgG0T6u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jul 2020 15:58:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728348AbgG0T6t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jul 2020 15:58:49 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86452C061794;
        Mon, 27 Jul 2020 12:58:49 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id qc22so3514267ejb.4;
        Mon, 27 Jul 2020 12:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P+ZtokmBUXMUzMCK2bGHNX1SgF1vgTjbYOyC77ce+jk=;
        b=d/dz9cHAZyIUWkOF4iyEEB54wC9RrtmHHxRtwGzmM1BAlZZ3oFzIXxmFfA0mafFd/T
         5HP7Z8Tx3WlvC8JjvVLdB9XCem6CpF4Yh6qILouU3qfTNoXpr0VPHusKxiofDodqqNk7
         KcexI47FrbFGgsI7EGCT9Qrph1GgYWDCFhAdpDp6J2/EhhKUkd8KvwTpdghR4oDAXS5R
         gy67QDNSKnXskDxTAMVX5R4zDHJ5B1mr8eQGhyafd1NRj41S/DnCvgVo6LbmCwgFwxfS
         nfePOw8uVEiDvupvIB1V6Dm0zdOVswIdqpLglfjECJu+jypGAmMuDHzqImmmBxkZ8wVA
         7INg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P+ZtokmBUXMUzMCK2bGHNX1SgF1vgTjbYOyC77ce+jk=;
        b=T0Olo/28BX/RN6XtQLgHvadHax3GG67Z3MiZNUb0oCo6VUtZjr7M+cVZ61/iukXfIn
         Qkna38jTzEGhEyu5nmHH+ADs2XOzSlGFMuYMW+O8IIChic+R/IujZx01SXmcFLjDzXn+
         JfWMYWnTHbzdcBOXX2Of+WvGnrJ1JHkvudLbGaajQIOT6QZnRo2YGXxTEJe4Sm8rOBXy
         Y4tVrApWFcOgsBY3OVTG+fSDW9jlGCR523SVWt7rVANyXjkDUHC8rcW0EzReriU4nf7P
         0HZe21VF4YZbUo9SL9VVzcCa8OsrPyyqLFipqGgepnKxyvtALzUy04BFn1QpQ+uSO9oV
         l5Hw==
X-Gm-Message-State: AOAM533MTvYxzgjKmx30zf9Ib7KCogM6iHV4xsfAQGmX0twOQgM0nN1U
        7S9TrEGPj5HCDATr601h74bawxr/n99r1973A0I=
X-Google-Smtp-Source: ABdhPJx5Tqhd6JeCOLSOIs2/bFHHFG80V48Q4I9sJHYsrBzE7kDBMjNuOPbuf5tIW9RJHzS57R9ksfFzYzReLr1GKjQ=
X-Received: by 2002:a17:906:f905:: with SMTP id lc5mr6596445ejb.340.1595879928214;
 Mon, 27 Jul 2020 12:58:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200726111215.22361-1-konradybcio@gmail.com> <20200726111215.22361-9-konradybcio@gmail.com>
 <159587887102.1360974.16083886481437183810@swboyd.mtv.corp.google.com>
In-Reply-To: <159587887102.1360974.16083886481437183810@swboyd.mtv.corp.google.com>
From:   Konrad Dybcio <konradybcio@gmail.com>
Date:   Mon, 27 Jul 2020 21:58:12 +0200
Message-ID: <CAMS8qEU9t=QZR34FifzGMsQkhxQCVtOfoNRX-n_0xZJz2rbcyw@mail.gmail.com>
Subject: Re: [PATCH 8/9] clk: qcom: gcc-sdm660: Fix up gcc_mss_mnoc_bimc_axi_clk
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Martin Botka <martin.botka1@gmail.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        zhengbin <zhengbin13@huawei.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        Krzysztof Wilczynski <kw@linux.com>,
        Harigovindan P <harigovi@codeaurora.org>,
        Brian Masney <masneyb@onstation.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Xiaozhe Shi <xiaozhes@codeaurora.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        devic <etree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-usb@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

>Fixes tag?

Can I add it here? I supose I can.

Fixes: f2a76a2955c0 (clk: qcom: Add Global Clock controller (GCC)
driver for SDM660)
