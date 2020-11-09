Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7EC02AC488
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Nov 2020 20:02:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729987AbgKITCb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Nov 2020 14:02:31 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:36106 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729499AbgKITCb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Nov 2020 14:02:31 -0500
Received: by mail-ot1-f67.google.com with SMTP id 32so10023715otm.3;
        Mon, 09 Nov 2020 11:02:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Os7Tqy6UODgwd/wlPU8zzDWJnqShuXVfWyTYThhhTQs=;
        b=aLNKOCb7BKHiWgvV5bGci2OVAIvGf6Pn24eVglj98a9ycz9gRi6gVnWKuGsRG8SO4u
         nKrFvsXep8Uumk2pXJtS+w+z6dAnPB6/WMB7X1biAtUZnY7m7cBSeTj+Ym/65cjk9SP9
         2/vF8rQTUVKFDkjD98jm0xTlAaH1sWF6WiBsoGoMZEVZ0MvYzhcypoTx/qRSUnHJkeji
         puvG9hhFpPTNteomrTkZF8DyG6q697gs+9Jt5rh1y0GxPd8gdedt4/37bBCaBRXviIxY
         8n8a53ZnmSu6udiqbbK6XUkDENw8lPMb3uibRb1Xn7qUG5WymViIRePiT4SCDQwgaRkL
         k0tg==
X-Gm-Message-State: AOAM533TD7a2Rn0qMj1DTQImZcuGgTK19A6q2keP2h3D6CwEtcuc8MvM
        O20WRlVtQc2vqpJ+VOBX6xKjF4CBkw==
X-Google-Smtp-Source: ABdhPJzi8cf177x5y7qmvI5oZJQW3sqESbPviEGH6ObpyFz+8kfyg2yeSvBY/c2ERhInbnrt6d4HJQ==
X-Received: by 2002:a9d:4aa:: with SMTP id 39mr11584971otm.11.1604948550593;
        Mon, 09 Nov 2020 11:02:30 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x22sm2572439oix.48.2020.11.09.11.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 11:02:29 -0800 (PST)
Received: (nullmailer pid 1593859 invoked by uid 1000);
        Mon, 09 Nov 2020 19:02:28 -0000
Date:   Mon, 9 Nov 2020 13:02:28 -0600
From:   Rob Herring <robh@kernel.org>
To:     xuyuqing <xuyuqing@huaqin.corp-partner.google.com>
Cc:     Stephan Gerhold <stephan@gerhold.net>, dgreid@chromium.org,
        linux-kernel@vger.kernel.org, Taniya Das <tdas@codeaurora.org>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        cychiang@chromium.org, Banajit Goswami <bgoswami@codeaurora.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Patrick Lai <plai@codeaurora.org>, dianders@chromium.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        zhouguohui@huaqin.corp-partner.google.com,
        devicetree@vger.kernel.org, tzungbi@chromium.org,
        judyhsiao@chromium.org, Mark Brown <broonie@kernel.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v1 1/2] ASoC: google: dt-bindings: add new compatible for
 sc7180-coachz
Message-ID: <20201109190228.GA1593812@bogus>
References: <20201105013242.298518-1-xuyuqing@huaqin.corp-partner.google.com>
 <20201105013242.298518-2-xuyuqing@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201105013242.298518-2-xuyuqing@huaqin.corp-partner.google.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 05 Nov 2020 09:32:41 +0800, xuyuqing wrote:
> Add devicetree bindings for coachz in documentation file
> 
> Signed-off-by: xuyuqing <xuyuqing@huaqin.corp-partner.google.com>
> ---
>  .../devicetree/bindings/sound/google,sc7180-trogdor.yaml      | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
